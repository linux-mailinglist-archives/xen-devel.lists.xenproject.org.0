Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5D442EE6A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210121.366854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK6w-0003Fh-6X; Fri, 15 Oct 2021 10:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210121.366854; Fri, 15 Oct 2021 10:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK6w-0003Cw-2v; Fri, 15 Oct 2021 10:06:46 +0000
Received: by outflank-mailman (input) for mailman id 210121;
 Fri, 15 Oct 2021 10:06:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbK6u-0003Cl-OO
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:06:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbK6u-0001Bc-Mr
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:06:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbK6u-0002pC-Ll
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:06:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mbK6p-0005II-P7; Fri, 15 Oct 2021 11:06:39 +0100
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
	bh=Kl5bV6qIhI9Bc76pmX+92Fxx+x8FhCpO8AuWretIQpw=; b=zpNc1vYdBUZoYpfCfzHi3kmHkc
	XiNf7JqHnPn0o9E36D82g1khDpjXqQD4WLenXeesJMyFk69PrEbMoHnyZLCOJ3qXLp6L2ojtQWa5L
	UMHF+opKXh9CTkMl1GUF6QKKXhuNblPpT3BR38Wb+qfTOtlXgjR4d1QYEiz1LBXP2ws0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24937.21167.484708.191165@mariner.uk.xensource.com>
Date: Fri, 15 Oct 2021 11:06:39 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>,
    xen-devel@lists.xenproject.org,
    Andrew Cooper  <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>,
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v3 0/3] disable building of pv-grub and qemu-trad per
 default
In-Reply-To: <2037c30a-5ac4-caf6-b47b-f2574422151f@suse.com>
References: <20210910055518.562-1-jgross@suse.com>
	<24891.31480.165445.521062@mariner.uk.xensource.com>
	<d894799e-27c6-bbbd-8d65-3e32c1aff843@suse.com>
	<24913.55427.402592.660538@mariner.uk.xensource.com>
	<2037c30a-5ac4-caf6-b47b-f2574422151f@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v3 0/3] disable building of pv-grub and qemu-trad per default"):
> I believe patch 1 of my series could go in at any time, as it is just
> fixing a bug.

Oh yes, indeed.  Done.

Ian.

