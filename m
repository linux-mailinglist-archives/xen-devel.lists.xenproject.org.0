Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E74142BF52
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 13:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208285.364351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macts-0007u1-Aw; Wed, 13 Oct 2021 11:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208285.364351; Wed, 13 Oct 2021 11:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macts-0007rS-7o; Wed, 13 Oct 2021 11:58:24 +0000
Received: by outflank-mailman (input) for mailman id 208285;
 Wed, 13 Oct 2021 11:58:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mactq-0007rM-Fe
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 11:58:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mactq-0003qq-EC
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 11:58:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mactq-0001RU-DB
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 11:58:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mactk-0007UY-V6; Wed, 13 Oct 2021 12:58:17 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=/GdvLPWcAUtEB4bzfuuBdEs9TFr49hN2q029JtHzLmo=; b=4bza8iByaLHiUV3Qb0rFoDxLmH
	cdTA2Z+CvJT/rz1Z88BJ+yeoEJhJIoy2mhgQmT/4L9RBl+Y4OjWGWRjVuuLUcTxweot4awYeIT8Ee
	QSlsY2txLko8mPahIVIvly1/eHKPMl25O0ZL7z1ajlVLsQxlJ3Nd4d64dRmlwUaOPQMw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24934.51672.609742.454355@mariner.uk.xensource.com>
Date: Wed, 13 Oct 2021 12:58:16 +0100
To: Michal Orzel <michal.orzel@arm.com>
Cc: Julien Grall <julien@xen.org>,
    xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini  <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Christian Lindig <christian.lindig@citrix.com>,
    David Scott  <dave@recoil.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    bertrand.marquis@arm.com
Subject: Re: [PATCH v6] xen: Expose the PMU to the guests
In-Reply-To: <a0618ea7-3c66-bfca-20fb-62855c8791e4@arm.com>
References: <20211013074528.1396-1-michal.orzel@arm.com>
	<75e19429-49d2-c075-acb8-797c01364771@xen.org>
	<a0618ea7-3c66-bfca-20fb-62855c8791e4@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Michal Orzel writes ("Re: [PATCH v6] xen: Expose the PMU to the guests"):
> Ok so it is the matter of adding "HVM" word into status for x86.
> Is this something that can be done while committing?

Making changes while committing is risky because they don't get
properly reviewed.  When I am the committer, I prefer not to do it at
all.

Also committers are going to be very busy now.  Please don't ask them
to do extra work.

Thanks,
Ian.

