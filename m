Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC1444879
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 19:42:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221127.382674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miLDa-0008SN-VP; Wed, 03 Nov 2021 18:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221127.382674; Wed, 03 Nov 2021 18:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miLDa-0008Pr-RW; Wed, 03 Nov 2021 18:42:38 +0000
Received: by outflank-mailman (input) for mailman id 221127;
 Wed, 03 Nov 2021 18:42:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miLDZ-0008Pl-9b
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 18:42:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miLDZ-0007D2-7i
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 18:42:37 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miLDZ-00007J-6F
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 18:42:37 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1miLDV-0000QP-7c; Wed, 03 Nov 2021 18:42:33 +0000
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
	bh=KGl+pmkYP8R0jSZm+bqGERf5sIvPm5hZcdZp549tzZ0=; b=Ibf3oDC1jQlAqYSE/E8Wk9jeA5
	QL+7A0pztZZJLtmJvMDt2/Gs1ZAJ6w7TfniKTVPs1Qa8UXHbpaHNnrdX9CkFVCxXP9Rx9mQX2+M8t
	nCLB5lb5boivr0pehtRkxgwUAhofRzLn6gm/g+gghYdibpob2oDqWMpvkOuA2oUe3Iug=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24962.55319.231102.233448@mariner.uk.xensource.com>
Date: Wed, 3 Nov 2021 18:42:31 +0000
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH-4.16 v2] x86/xstate: reset cached register values on resume
In-Reply-To: <20211103184020.1276465-1-marmarek@invisiblethingslab.com>
References: <20211103184020.1276465-1-marmarek@invisiblethingslab.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Marek Marczykowski-Górecki writes ("[PATCH-4.16 v2] x86/xstate: reset cached register values on resume"):
> set_xcr0() and set_msr_xss() use cached value to avoid setting the
> register to the same value over and over. But suspend/resume implicitly
> reset the registers and since percpu areas are not deallocated on
> suspend anymore, the cache gets stale.
> Reset the cache on resume, to ensure the next write will really hit the
> hardware. Choose value 0, as it will never be a legitimate write to
> those registers - and so, will force write (and cache update).
> 
> Note the cache is used io get_xcr0() and get_msr_xss() too, but:
> - set_xcr0() is called few lines below in xstate_init(), so it will
>   update the cache with appropriate value
> - get_msr_xss() is not used anywhere - and thus not before any
>   set_msr_xss() that will fill the cache
> 
> Fixes: aca2a985a55a "xen: don't free percpu areas during suspend"
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in v2:
>  - adjust xss init value per Jan request
> 
> For 4.16: this unbreaks S3 resume, it was posted initially back in
> August and is shipped in Qubes since September (although backported to
> 4.14, not unstable) with no reported regressions.

Thank you.  I went back and read the thread.  Thanks to everyone who
contributed there.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

