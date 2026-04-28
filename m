Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCCnIcGi8GlAWgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:06:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B251248487A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295923.1572488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHhCZ-0007CW-CN; Tue, 28 Apr 2026 12:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295923.1572488; Tue, 28 Apr 2026 12:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHhCZ-00079U-9e; Tue, 28 Apr 2026 12:06:07 +0000
Received: by outflank-mailman (input) for mailman id 1295923;
 Tue, 28 Apr 2026 12:06:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd3fb6660000f373@swg.vates.tech>)
 id 1wHhCX-00079A-Eo
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 12:06:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHhCW-00C5LB-Pc
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:06:04 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd3fb6660000f373@swg.vates.tech>)
 id 69f0a2a9-bab6-0a2a0a5309dd-0a2a450790c6-10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 14:06:04 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd3fb6660000f373@swg.vates.tech>)
 id 69f0a2ac-229c-0a2a45070019-b9ff1c22800b-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 14:06:04 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dd3fb6660000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Apr 2026 12:06:01 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id DFE68861CF;
 Tue, 28 Apr 2026 14:06:00 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=YeqpqrGbiQeV318NZ/x97aB67b1RlTm1r4d5OxUH12A=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=VtQWe0UkIRR3/IhnOFPohbgPw/Q1/nmWRc8FlLSV/xBMh+S2E2ngV8cpGH9w4ezP7qSR5+j1y
 m2VXVEeBQioab+Nmkb+XK9Owpc2H3RI8DCP1f5NldIfUPU6h/BwTz2UyO2oQ4dPJQlr2K+GHu3h
 XXqZB8N/1b6Ztjsxpav4QVwE1pbzfWrLnUAmsL4nO6BeElbSjeLdHktzI+Fd0dbYysiHvKII9bB
 +X+dEaRWkFcLcyfuJhwyLi+jd4XoSioTJyz7MF5yMy5bJGK8ilWYorxXNQF1iZnZcguXzpNF+9+
 hFlt8iq8smg9S/9p8pAeUrkCydolyXxPmnMlsXcIGzYA==
X-Zone-Loop: e25d48730624bb1c42dc1816181bc6cda55610905932
x-campaign-type: default
x-transaction-id: fb4994e6-a5e4-4197-bfc7-6e40279c01f5
x-swg-uid: 01-504940e1-7647-4dea-8492-c220cc86101b
X-Mailer: Sweego
Message-ID:
 <1777377961.8631fc262581453bbf619ec5b2062170.19dd3fb6660000f373@vates.tech>
x-swg-bid: 1777377961.8631fc262581453bbf619ec5b2062170.19dd3fb6660000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 28 Apr 2026 14:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] x86/vioapic: Add ioapic_check() to validate
 IO-APIC state before restore
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387cf6000f373@vates.tech>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387cf6000f373@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.66.5bdc74eb85b86f8c.19dd3fb649f.c8792f77bab4f20c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777377961124
X-purgate-ID: tlsNG-ef75cf/1777377964-ACF66C48-DB87BBC4/0/0
X-purgate-type: clean
X-purgate-size: 3491
X-Rspamd-Queue-Id: B251248487A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.66.5bdc74eb85b86f8c.19dd3fb649f.c8792f77bab4f20c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27/04/2026 =C3=A0 15:57, Julian Vetter a =C3=A9crit=C2=A0:
> Register a check callback for the IOAPIC HVM save/restore entry,
> following the pattern established by vpic_check() for the virtual PIC=2E
> The function first verifies the target domain actually has a virtual
> IO-APIC, returning -ENODEV otherwise=2E It then validates individual
> fields of the saved state: the base_address must be non-zero (as 0 is
> never valid for the IO-APIC MMIO window), the APIC ID must fit within
> its 4-bit hardware field, and ioregsel must address a defined register=
=2E
>=20
> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> ---
> Changes in v4:
> - Replaced the reserved-bit loop from v3 (iterating all redirection
>    table entries and rejecting any with non-zero reserved fields) with
>    targeted named-field validation (base_address !=3D 0, APIC ID < 0xF, =
and
>    ioregsel addresses a defined register)
> - The extended-destination migration safety check (refusing to restore
>    IO-APIC state with ext_dest_id bits set on a domain that does not
>    advertise XEN_HVM_CPUID_EXT_DEST_ID) is added in patch 8, once the
>    flag exists
> ---
>   xen/arch/x86/hvm/vioapic=2Ec | 28 +++++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/hvm/vioapic=2Ec b/xen/arch/x86/hvm/vioapic=2Ec
> index 7c725f9e47=2E=2E43fb165f84 100644
> --- a/xen/arch/x86/hvm/vioapic=2Ec
> +++ b/xen/arch/x86/hvm/vioapic=2Ec
> @@ -594,6 +594,32 @@ int vioapic_get_trigger_mode(const struct domain *d=
, unsigned int gsi)
>       return vioapic->redirtbl[pin]=2Efields=2Etrig_mode;
>   }
>  =20
> +static int cf_check ioapic_check(const struct domain *d, hvm_domain_con=
text_t *h)
> +{
> +    const HVM_SAVE_TYPE(IOAPIC) *s;
> +
> +    if ( !has_vioapic(d) )
> +        return -ENODEV;
> +
> +    s =3D hvm_get_entry(IOAPIC, h);
> +    if ( !s )
> +        return -ENODATA;
> +
> +    /* base_address of 0 is never valid for the IO-APIC MMIO window=2E =
*/
> +    if ( !s->base_address )
> +        return -EINVAL;
> +
> +    /* IO-APIC APIC ID is a 4-bit field=2E */
> +    if ( s->id > 0xf )
> +        return -EINVAL;
> +
> +    /* ioregsel must address a defined register=2E */
> +    if ( s->ioregsel > VIOAPIC_REG_RTE0 + (ARRAY_SIZE(s->redirtbl) - 1)=
 * 2 + 1 )

you can rewrite it as

s->ioregsel >=3D VIOAPIC_REG_RTE0 + ARRAY_SIZE(s->redirtbl) * 2

> +        return -EINVAL;
> +
> +    return 0;
> +}
> +
>   static int cf_check ioapic_save(struct vcpu *v, hvm_domain_context_t *=
h)
>   {
>       const struct domain *d =3D v->domain;
> @@ -630,7 +656,7 @@ static int cf_check ioapic_load(struct domain *d, hv=
m_domain_context_t *h)
>       return 0;
>   }
>  =20
> -HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, NULL, ioapic_load, 1,
> +HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_check, ioapic_loa=
d, 1,
>                             HVMSR_PER_DOM);

You think you can relax some of the checks in ioapic_load as you moved=20
some of them in ioapic_check=2E

>  =20
>   void vioapic_reset(struct domain *d)

Teddy


-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.66.5bdc74eb85b86f8c.19dd3fb649f.c8792f77bab4f20c=---

