Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4249B42C260
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 16:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208536.364691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maewd-0004M8-FQ; Wed, 13 Oct 2021 14:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208536.364691; Wed, 13 Oct 2021 14:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maewd-0004Ik-Bj; Wed, 13 Oct 2021 14:09:23 +0000
Received: by outflank-mailman (input) for mailman id 208536;
 Wed, 13 Oct 2021 14:09:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maewc-0004Ic-Na
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:09:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maewc-0006O3-Mg
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:09:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maewc-0005HE-LY
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:09:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maewW-0007tT-7m; Wed, 13 Oct 2021 15:09:16 +0100
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
	bh=HAYUOhxuXurrAdWRAMOoG0IbWwuug4xwZ+N0E1eVPW8=; b=HIlV9XcTn+81vkv8vgEqxUy6tI
	HAkGoj8lvIVkvzOFQpdz20K8iWuLV115qdUW8OkO4A5Ob07qoG9y9mtCWwwQwfdmvEOBS/vqDjPge
	PJN5KIaBuZfm3jjEkYiRHrFHCHUeZN+5jZuZJJCoiTGTyOGePmREnrnI2MzICi9efTWc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24934.59531.966204.631618@mariner.uk.xensource.com>
Date: Wed, 13 Oct 2021 15:09:15 +0100
To: Julien Grall <julien@xen.org>
Cc: Ian Jackson <iwj@xenproject.org>,
    Michal Orzel <michal.orzel@arm.com>,
    xen-devel@lists.xenproject.org,
    Andrew Cooper  <andrew.cooper3@citrix.com>,
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
Subject: Re: [PATCH v7] xen: Expose the PMU to the guests
In-Reply-To: <bcdf096c-aeaa-5d5f-fffc-95719c7b4038@xen.org>
References: <20211013123352.6625-1-michal.orzel@arm.com>
	<24934.54743.853232.853726@mariner.uk.xensource.com>
	<bcdf096c-aeaa-5d5f-fffc-95719c7b4038@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH v7] xen: Expose the PMU to the guests"):
> I am in the signed-off-by list. Even if the patch has changed compare 
> the original, I feel it is odd to ack my own patch.
> 
>  From my understanding, my signed-off-by is sufficient serve as an 
> approval for the maintainer part. We also have a review form a person of 
> a suitable stature in the community (Bertrand). So I think in term of 
> approval we are good.
> 
> Additionally, from a discussion yesterday on IRC, Stefano was happy with 
> this patch (I was the one requesting the resend for SUPPORT.MD). So I 
> think we can commit it now.
> 
> Let me know if you prefer to wait for a formal Ack from Stefano.

Ah.  I see, no that's fine.  I am committing it now.

Thanks,
Ian.

