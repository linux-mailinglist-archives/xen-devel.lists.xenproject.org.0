Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPScCNZfcmnbjAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:35:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3816B6C9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211672.1523168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viya5-0005cw-Nm; Thu, 22 Jan 2026 17:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211672.1523168; Thu, 22 Jan 2026 17:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viya5-0005an-L8; Thu, 22 Jan 2026 17:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1211672;
 Thu, 22 Jan 2026 17:34:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kT/T=73=bounce.vates.tech=bounce-md_30504962.69725fb7.v1-c12c0e3f7df14035bdb50030d6959289@srs-se1.protection.inumbo.net>)
 id 1viya3-0005ah-JL
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:34:51 +0000
Received: from mail137-14.atl71.mandrillapp.com
 (mail137-14.atl71.mandrillapp.com [198.2.137.14])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a639d2e1-f7b8-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 18:34:49 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-14.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4dxp932T4dz705dXs
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 17:34:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c12c0e3f7df14035bdb50030d6959289; Thu, 22 Jan 2026 17:34:47 +0000
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
X-Inumbo-ID: a639d2e1-f7b8-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769103287; x=1769373287;
	bh=XDB3paIX0lxRE31VKOtSX6mrjON5bOkhtgKr0rNI1vw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AZxWepmkRwIFli7hbAQ77XxhRUjvlgiglyez8j0OtXjBOFh/xiz3YF58JxNJyVRBT
	 syLVXr0z0aZEdIgFfbvvO/sDs2oQbU1IbQcJUl+V5KwyAE+f4rSCnTEjudZAaELM+t
	 pKmiq4hc0gIuuI+iwonEFTNz8MkWkEJoJApqj+0KRXCTO8K+m5SQkfq8crppiYQwP7
	 RzG68WHnC6XdCqsaUR3UvM8TnrZ4Nslh2bmHWYAXZayCY95omuRp2ANK23cZEWQxhJ
	 9PnCE9svQsOLOCaLSN8KWQzcdQgPDy/CZbSZthwqURWV7J26qYLhUi6S6VuXfsRo4X
	 zFI4CdGyQf1bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769103287; x=1769363787; i=teddy.astie@vates.tech;
	bh=XDB3paIX0lxRE31VKOtSX6mrjON5bOkhtgKr0rNI1vw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=S7m8MhOsrdsTmNivJ0e7Do574QIEhq5r1UjNxmfQVgqq3Na6MdjvAjUOHWmOErv9h
	 Ke2fkANd50H9abAeC3U5IEKkZcIBiZaGRy2WbZ3SE38F5AGIEEoOABm4oYVj30rkYJ
	 GWmGjWv3j/+v51MWos/TcPTU4dDfGe+SNRnHEvep1BjE+TO1uUr7feJrx4YR5GZVWI
	 mbS5XsKNnZMz49pLjE/t/MOJvxVpzUJ4vu3XtEIHBvr0+C31rgOoEMH7hW3xf9F5Fc
	 bbMNbnocHesRu4p2M3Bho2ffGMvF1OgL6Dm+X/ybOECTnhJIkw30tA+E5Gs6+hcPh5
	 gK2Syhj2Ril1Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=203/4]=20x86/hvm:=20Remove=20cross-vendor=20checks=20from=20MSR=20handlers.?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769103285334
Message-Id: <436fddc7-ca06-4028-9cfd-b57bb236112d@vates.tech>
To: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com> <20260122164943.20691-4-alejandro.garciavallejo@amd.com>
In-Reply-To: <20260122164943.20691-4-alejandro.garciavallejo@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c12c0e3f7df14035bdb50030d6959289?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260122:md
Date: Thu, 22 Jan 2026 17:34:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,amd.com:email,vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.882];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AB3816B6C9
X-Rspamd-Action: no action

Le 22/01/2026 =C3=A0 17:51, Alejandro Vallejo a =C3=A9crit=C2=A0:
> Not a functional change now that cross-vendor guests are not launchable.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>   xen/arch/x86/msr.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index ad75a2e108..c9cc4f0692 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -169,9 +169,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_=
t *val)
>           break;
>   
>       case MSR_IA32_PLATFORM_ID:
> -        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
> -             !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
> +        if ( cp->x86_vendor !=3D X86_VENDOR_INTEL )
>               goto gp_fault;
> +
>           rdmsrl(MSR_IA32_PLATFORM_ID, *val);
>           break;
>   
> @@ -190,8 +190,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_=
t *val)
>            * the guest.
>            */
>           if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
> -             !(boot_cpu_data.x86_vendor &
> -               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
>                rdmsr_safe(MSR_AMD_PATCHLEVEL, val) )
>               goto gp_fault;
>           break;

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



