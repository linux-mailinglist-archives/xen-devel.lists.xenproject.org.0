Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PguGr8e9WlqIgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 23:44:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E7A4AFD94
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 23:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298936.1573873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIvem-0001Ck-I1; Fri, 01 May 2026 21:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298936.1573873; Fri, 01 May 2026 21:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIvem-0001A6-En; Fri, 01 May 2026 21:44:20 +0000
Received: by outflank-mailman (input) for mailman id 1298936;
 Fri, 01 May 2026 21:44:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wIvek-00019z-Mt
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 21:44:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIvej-00GKNo-GX
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 23:44:17 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69f51ea0-bab6-0a2a0a5309dd-0a2a45068022-6
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 23:44:16 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69f51eb0-7371-0a2a45060019-ac6904fea5dc-3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 23:44:16 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 57B2C6011F;
 Fri,  1 May 2026 21:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1944C2BCB4;
 Fri,  1 May 2026 21:44:14 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777671855;
	bh=A+LTyI3f9+3qLvGzTxEcV/j8RwMj7X0W1mRk/y3DSSc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fBAC/kDmJh5cjHCnsCdoCU7jq1jyYKJk94Ya6jhstFoSN7iM9KcovMMXggX3czxM6
	 CznZbEPh/vCEJprzEVtQBziK/xNEX2ltxGNCW3XRxkAFa5q0eZu0+h44eL4GVF1s92
	 aBTI11hfdWfe+AT8vw6dV4GFvN5b0hsducdeQ1hp8khD4XJRgWiPLVYFNIBwvzLyTk
	 X5RYf7KPtm4+qoG0zCVD0mPgxAl7Q3D5eoqYl2Q/yj2XUlhH7nKSy4jfGSVdWZDyvD
	 zuafWS0YTLO+8/H9K0e/uD/f+3Pw5R/0GfhKUvCUrtmBgHpJYdCWAXC8+7miugC5AH
	 Wqjb2IV+hVSfA==
Date: Fri, 1 May 2026 14:44:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/svm: Always sync guest CR2 on VMExit
In-Reply-To: <20260501213826.1291860-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2605011443580.512397@ubuntu-linux-20-04-desktop>
References: <20260501213826.1291860-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-528818502-1777671855=:512397"
X-purgate-ID: tlsNG-16d1c6/1777671856-52974D75-F130C741/0/0
X-purgate-type: clean
X-purgate-size: 2268
X-Rspamd-Queue-Id: 12E7A4AFD94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-528818502-1777671855=:512397
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 1 May 2026, Andrew Cooper wrote:
> Under SVM, there are two copies of guest CR2.  One is v->arch.hvm.guest_cr[2]
> and one is in the VMCB.
> 
> Xen doesn't intercept CR2 accesses, so this mostly goes unnoticed; hardware
> loads and saves the guest CR2 across VMRUN/VMExit.
> 
> For HAP guests (where #PF is not intercepted, and therefore we don't typically
> inject #PF either), this causes the guest CR2 value to be lost on migrate.  As
> migration is cooperative and not done from the #PF handler, this also goes
> unoticed by guests.
> 
> It also means that an emulated MOV-from-CR2 reads a stale value.
> 
> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> 
> It also also works around the QEMU bug that triggered the investigion, where
> the CR2 intercepts trigger despite Xen requesting CR2 not to be intercepted.
> ---
>  xen/arch/x86/hvm/svm/svm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index ced616684732..f49d2ebbfdd5 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2505,6 +2505,7 @@ void asmlinkage svm_vmexit_handler(void)
>      hvm_sanitize_regs_fields(
>          regs, !(vmcb_get_efer(vmcb) & EFER_LMA) || !(vmcb->cs.l));
>  
> +    v->arch.hvm.guest_cr[2] = vmcb_get_cr2(vmcb);
>      if ( paging_mode_hap(v->domain) )
>          v->arch.hvm.guest_cr[3] = v->arch.hvm.hw_cr[3] = vmcb_get_cr3(vmcb);
>  
> 
> base-commit: 61f957d48c78df6c5254b6f54d6170d3bd3d717e
> -- 
> 2.39.5
> 
--8323329-528818502-1777671855=:512397--

