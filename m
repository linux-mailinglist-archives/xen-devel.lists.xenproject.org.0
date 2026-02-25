Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNetGAgVn2nWYwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 16:28:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D719996C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 16:28:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240841.1542096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvGnD-00017t-7Y; Wed, 25 Feb 2026 15:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240841.1542096; Wed, 25 Feb 2026 15:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvGnD-00016E-4R; Wed, 25 Feb 2026 15:27:15 +0000
Received: by outflank-mailman (input) for mailman id 1240841;
 Wed, 25 Feb 2026 15:27:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvGnB-000168-81
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 15:27:13 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7415d1e0-125e-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 16:27:11 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48378136adcso41116055e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 07:27:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd75dfaasm67333355e9.12.2026.02.25.07.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 07:27:09 -0800 (PST)
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
X-Inumbo-ID: 7415d1e0-125e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772033230; x=1772638030; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4bpjFmnkYs/FrcFDoE+CrigAj8m51DIzQC65q7WJnMc=;
        b=EA+/kWVfO7tYXDLmWF19WVTc2T2tDliUP4PkEB1u6IpX5K+uKwCX5NwEy24Pz2FZcv
         FM0r//Frs3Xetho+U+uSz/oVJI+AVYCUrONM7UBiNie8tDYWEKBP40EZf5qu6StwLCpb
         SMpVRR++ZHrE4fYZVsYhyGsrNmlZW9d8C5gKKZxe3i+EZqBtvU5A50atMW9s/0qOtPZR
         VdmZznBOIRwLQ1mCZ00q6b9J3usiR7aJSJwmoO5ZF9uQqetR62bgdc33qxLvSTNE6PNK
         lBs5WPb6AENi8DO9FLu7CLOk948DNvA5ibdCXTirPCP6TuvwShn9aZng57lpyR5XqnWh
         xZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772033230; x=1772638030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bpjFmnkYs/FrcFDoE+CrigAj8m51DIzQC65q7WJnMc=;
        b=Ila7k1JPiPgK8cSeTSPaTvmNRPKqQp6PAm0Rh4cvGgEk1Buipp6uLUDLugmk7/QDjh
         D05usr0RF4PvuaNO41RCzVbVYDcOCvW06FNPqBluCbj28tLtR0G259GTPeiurSuL/Vf7
         x1R3pRY/heBql+utHUgzUVA4VdM3Vbp0wLP+u9ZhoJGye4daliVTFH7YG7AzcYxMBV5+
         qJ/lrQc/gMzsTvctnoggaYfmk++SoukNyQXKKxy1OabMWcylYVZ+/fyfGS/LqVR88GJ3
         s3lv4Gg0/HkOguzcDhGa3iEhu60lJ9ab2TvL44dG/sb5fyJTdT7xllVr+A1F/DWZr8mc
         Iv5w==
X-Forwarded-Encrypted: i=1; AJvYcCXRnx87oMZbqsbnXBnihuR6vHv561p691dxpZXDQj3UX+PFomNF98UCuAXDlsw7szmUbAR72g+g7D0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTC34Azmb78NwCQTX/PPPTAeGBvB9zYAJifG6IXLxMK9ygCGdO
	b87RdnNRKZddrwHX/xvuPW45HQDL46lo8pAShgiO/eSXIufgET9FcCGycMaibTHkLQ==
X-Gm-Gg: ATEYQzzfJgKuAGBRGWfMWDJCSQFmTUMipO4xa8vER5QXc9RAUMI58b4DWicvgnP9JU3
	mWZR8Ub6NZ3sOJ2LxtSVpnYX8hHWQoEnQpNepCthxuvb76f5uURv9QG5slLFuowAg/RhZofGkGj
	oYc49+KCTNK1iSiJRIW2I798DeqQLg+4vjPvujSFaQE2dRp1eIuLZyRu0G1xCXE6P0i6RFyNP5+
	DRZED182Kt2RqwSvhAzofC2QNU1T4qk9ophGnEZ6m06jLC3KxB490HMXBl1BCuF5Ybfvu05bTbO
	emtAn2JiJBTKYukFMxS0K0Wk4NKqLdoSO+24I73l9vqN6UxCn/aLljjlT0mEIxX+yuJPMNGqFCR
	8wpkPPJ2pbGEgmaA5oJg6piYzyFMuMYTt+w1iFcZqvBeTuCOZocQx4QrBzDs6Sxk3fAnAfhlINs
	obKOX4n1aBsqVkOcc5wz8+6MqpE3Hv2M1zhrdPRgGL9BNEw8dPerrnL1pwGxf+3BooFQeL3Fe7X
	ls2oplwzKdLtrY=
X-Received: by 2002:a05:600c:6815:b0:483:7783:537b with SMTP id 5b1f17b1804b1-483c21a54d7mr14850905e9.24.1772033230216;
        Wed, 25 Feb 2026 07:27:10 -0800 (PST)
Message-ID: <df1fd921-e845-48e3-ad0e-0c2571f8634b@suse.com>
Date: Wed, 25 Feb 2026 16:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: Advertise and support extended destination
 IDs for MSI/IO-APIC
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260223084644.471531-1-julian.vetter@vates.tech>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260223084644.471531-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[lists.xenproject.org:server fail,suse.com:server fail];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B65D719996C
X-Rspamd-Action: no action

On 23.02.2026 09:46, Julian Vetter wrote:
> x2APIC guests with more than 128 vCPUs have APIC IDs above 255, but MSI
> addresses and IO-APIC RTEs only provide an 8-bit destination field.
> Without extended destination ID support, Linux limits the maximum usable
> APIC ID to 255, refusing to bring up vCPUs beyond that limit. So,
> advertise XEN_HVM_CPUID_EXT_DEST_ID in the HVM hypervisor CPUID leaf,
> signalling that guests may use MSI address bits 11:5 and IO-APIC RTE
> bits 55:49 as additional high destination ID bits. This expands the
> destination ID from 8 to 15 bits.

Should MSI and IO-APIC really be covered by just a single bit?

> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -374,7 +374,16 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, u8 isa_irq)
>  int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
>  {
>      uint32_t tmp = (uint32_t) addr;
> -    uint8_t  dest = (tmp & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID_SHIFT;
> +    /*
> +     * Standard MSI destination address bits 19:12 (8 bits).
> +     * Extended MSI destination address bits 11:5 (7 more bits).
> +     *
> +     * As XEN_HVM_CPUID_EXT_DEST_ID is advertised, the guest may use bits 11:5
> +     * for high destination ID bits, expanding to 15 bits total. Guests unaware
> +     * of this feature set these bits to 0, so this is backwards-compatible.

Is it? Any of the bits being non-zero would presently be ignored, afaics.
I think this needs to be two-way negotiation: Xen advertises the capability,
and the guest has to actively opt in. (Didn't Roger say something along these
lines already?) Also don't you need to restrict use of the wider IDs to
vCPU-s actually running in x2APIC mode? (And what is going to happen if a
vCPU switches back to legacy mode?)

> +     */
> +    uint32_t dest = (MASK_EXTR(tmp, MSI_ADDR_EXT_DEST_ID_MASK) << 8) |

The literal 8 here and again ...

> @@ -411,7 +413,8 @@ static void ioapic_inj_irq(
>  
>  static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
>  {
> -    uint16_t dest = vioapic->redirtbl[pin].fields.dest_id;
> +    uint32_t dest = ((uint32_t)vioapic->redirtbl[pin].fields.ext_dest_id << 8) |

... here also would want dealing with, I guess. Use of literal numbers really
should be an exception.

> @@ -594,6 +597,49 @@ int vioapic_get_trigger_mode(const struct domain *d, unsigned int gsi)
>      return vioapic->redirtbl[pin].fields.trig_mode;
>  }
>  
> +static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h)
> +{
> +    const HVM_SAVE_TYPE(IOAPIC) *s = hvm_get_entry(IOAPIC, h);
> +    unsigned int i;
> +
> +    if ( !s )
> +        return -ENODATA;
> +
> +    for ( i = 0; i < ARRAY_SIZE(s->redirtbl); i++ )
> +    {
> +        struct cpuid_leaf res;
> +
> +        /* ext_dest_id bits not set in RTE so continue */
> +        if ( !s->redirtbl[i].fields.ext_dest_id )
> +            continue;
> +
> +        /*
> +         * An RTE in the saved state has ext_dest_id bits set, verify the
> +         * destination XEN advertises XEN_HVM_CPUID_EXT_DEST_ID to the guest.
> +         * If not interrupt routing to APIC IDs > 255 would be broken after
> +         * restore -> -EINVAL!
> +         */
> +        guest_cpuid(d->vcpu[0], 0x40000004, 0, &res);
> +        if ( !(res.a & XEN_HVM_CPUID_EXT_DEST_ID) )
> +        {
> +            printk(XENLOG_G_ERR "HVM restore: dom%d IO-APIC RTE %u has "
> +                                "extended destination ID bits set but "
> +                                "XEN_HVM_CPUID_EXT_DEST_ID is not advertised\n",
> +                                d->domain_id, i);
> +            return -EINVAL;
> +        }
> +
> +        /*
> +         * Found an RTE with ext_dest bits set, but the destination XEN also
> +         * correctly announces XEN_HVM_CPUID_EXT_DEST_ID
> +         * -> All good, no need to check remaining RTEs.
> +         */
> +        break;
> +    }
> +
> +    return 0;
> +}

As indicated before, I think there wants to be a prereq patch introducing
ioapic_check() (preferably covering whatever other bits as well), with the
patch here then merely making adjustments to the function.

I also don't think you want to call guest_cpuid() here. You set the bit
unconditionally there, so no need to check here. (If it was conditionally
set there, the same condition would want using here. I think you will be
able to find examples of this for some of the other bits.)

Also in new code please no dom%d anymore. We have had %pd for quite some
time.

> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -54,6 +54,8 @@
>  #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
>  #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)
>  
> +#define MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0

As this isn't part of any architectural spec, it wants a comment as to
its origin.

> --- a/xen/include/public/arch-x86/hvm/save.h
> +++ b/xen/include/public/arch-x86/hvm/save.h
> @@ -359,7 +359,9 @@ union vioapic_redir_entry
>          uint8_t trig_mode:1;
>          uint8_t mask:1;
>          uint8_t reserve:7;
> -        uint8_t reserved[4];
> +        uint8_t reserved[3];
> +        uint8_t ext_dest_rsvd:1;

Why ext_dest_ as a prefix? Does this field need naming at all?

Jan

