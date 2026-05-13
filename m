Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJM9B2rjBGrPQAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 22:47:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB21253AA7C
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 22:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308439.1579873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGTf-00021N-Hj; Wed, 13 May 2026 20:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308439.1579873; Wed, 13 May 2026 20:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGTf-0001yx-FC; Wed, 13 May 2026 20:46:47 +0000
Received: by outflank-mailman (input) for mailman id 1308439;
 Wed, 13 May 2026 20:46:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wNGTe-0001yr-UE
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 20:46:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNGTc-00DGYm-M5
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 22:46:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a04e319-2eae-0a2a0a5409dd-0a2a450281a2-20
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 22:46:46 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a04e334-af86-0a2a45020019-aceafc1f8f28-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 22:46:45 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F132A402B8;
 Wed, 13 May 2026 20:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC912C19425;
 Wed, 13 May 2026 20:46:43 +0000 (UTC)
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
	s=k20201202; t=1778705203;
	bh=wpV9StRR9YZtclK2hc4IXe7av7xmUbXWolQsdD9HKOs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I8UYK5L4gmxgsKlaW4uGsBdS6Z1VJaxw7fJ9HjItqugPWpL5CRTQOP4cvSruEiUvu
	 nIqHl6jwZkR9cWVmoVvhATWmE39aV8Vp/SNbQzGsEFcOQTSlbCMODg1LzIqzmqyTxz
	 54c12JTKxeQdXsbIFTpgR4Fmy3km6JDrai6HwYNx7XTByqOw7fANvNrlrx/20V2gF+
	 L8qT6+hxyptelTbz9vA6IxNFdd3UKXKBTuiHsT6Y4N1YrW9f678SWZk5dhl9aQslx3
	 oysqc9pttapQmNj7sWou4UjQANMmSzi9X8DtCVKYV47N84b220aukp7UtTmnigp32+
	 JVH0be2CfmZng==
Date: Wed, 13 May 2026 13:46:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] kexec: kexec_crash_save_info() vs Misra C:2012 rule
 8.3
In-Reply-To: <0af810a1-3392-472a-93c9-c98fcb81c43a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2605131344520.3930@ubuntu-linux-20-04-desktop>
References: <13ca5f9f-d985-41bf-9c30-afd657dade89@suse.com> <0af810a1-3392-472a-93c9-c98fcb81c43a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-720697/1778705206-A917D161-59822B90/0/0
X-purgate-type: clean
X-purgate-size: 791
X-Rspamd-Queue-Id: AB21253AA7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, 13 May 2026, Jan Beulich wrote:
> ... ("All declarations of an object or function shall use the same names
> and type qualifiers"). The declaration doesn't use the typedef, so the
> definition shouldn't either.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Really, is the typedef of much use? I.e. can't we drop it altogether?
> 
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -333,7 +333,7 @@ void kexec_crash_save_cpu(void)
>  }
>  
>  /* Set up the single Xen-specific-info crash note. */
> -crash_xen_info_t *kexec_crash_save_info(void)
> +struct crash_xen_info *kexec_crash_save_info(void)
>  {
>      int cpu = smp_processor_id();
>      crash_xen_info_t info;
> 
> 

