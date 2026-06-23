Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X1yiFHueOmphBwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 16:55:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A367C6B8155
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 16:55:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=aJIJPp3v;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344363.1603452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc2X6-0007YM-MT; Tue, 23 Jun 2026 14:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344363.1603452; Tue, 23 Jun 2026 14:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc2X6-0007VZ-Ja; Tue, 23 Jun 2026 14:55:24 +0000
Received: by outflank-mailman (input) for mailman id 1344363;
 Tue, 23 Jun 2026 14:55:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wc2X5-0007VT-5O
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 14:55:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc2X4-00Fsz6-ET
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 16:55:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a9e51-2eae-0a2a0a5409dd-0a2a4509edc0-20
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 16:55:22 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a9e5a-4999-0a2a45090019-d155dd2ac89c-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 16:55:22 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-45f3cf907ceso2620944f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 07:55:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4666722141csm34819574f8f.34.2026.06.23.07.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 07:55:21 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782226522; x=1782831322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v9XSJFdwK2Nbr6SepLM1A0MeRotoQ618aLu7Nv7SC6s=;
        b=aJIJPp3v9nPjbx/bnEgustNK93PwXMt2yECri3n/SK3EmN5lJg4pUzxsd0aHE9axJb
         LSo1pk5/wt1DE1jVOuP1csJmSItvjXNBca97Y+66LFsaAhkAPOVreSXO/E9qGliARuZ1
         jVEtR6K3ZsNFG8nlGwSo1c3qE4yy+MdTXCVWgga2cSNlF47x6DVb0z382yZKQhRyy6pf
         BVw9eg692iMjosw0CmgZH+gKVum/PyYISNnrm3sJH2nWjTdNDb1n5wlDSnIgXFvBKQ7E
         TxQVpvDOxVQRaB0Y+j8q3irOYFAMLQqg59n8LGaCVivYFOfHIIhveXq2UjJO8OFErZDO
         aQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226522; x=1782831322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9XSJFdwK2Nbr6SepLM1A0MeRotoQ618aLu7Nv7SC6s=;
        b=f66X6B0imI+ofXbxEap5N+KVrNERN7fZI481evN1PiH2jrNP/Xxpd/T5jftDzW+6AS
         WbCGGcMf0iIZehsUrzaxQVagAviB1ReDKdXvCLPDyErRnYsYuvYNUEuYLvukosvVukzY
         QcsadPyRNkT8JxNkzzyzfFVJj+HcIFXPoCu3Gy5OuhQyiPtowG66aPxL10/Ro4Jz6seq
         wZxN1PGrhgnJYZG8fPpRoxICFD/FyLFSwvvvaOoWFRCjpYZuLmsrv6Y/F1kjXOpQroQF
         kzFpUfShruCIX8sg45SgpIYRWd+JZUsFBl3arxSG/5eWZYTRQA3deAqz/GZwYsUZ09in
         nWhQ==
X-Forwarded-Encrypted: i=1; AHgh+Row9i5Ttcei/tBttKZiOL7OFLs9ZeFEbBSdOGtqNcgeomhZZhtch4M3i/dB9RxdLtawmgpZHJ6/1ew=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwI8NSUwx+4ChTIatMF4pZC/kUWvrfTnPqx14o6T+V8DeLrBYaC
	82GOa/8HwmhTmT0iMFX2pooMko31pah9t1BW/YsKdlRkDHCGVKvd/NeI76mfHQ8AgA==
X-Gm-Gg: AfdE7cmtYmHBkucs0vNY4cT2LPw2X0I5UseRYNgIpCpxc5oXv94HRqcIbOKYXojwRsc
	YINppqjokpxRCqq8hF/u6QeowR3YQyGBgbKdCZHnksSVAzm9dAbsflCMS/F6phUwn3EnmeMFbIu
	mJR+HZVkZPI2ob2nwp4oy87MQs4JL9eW6dOjtC+n4VPK6x5PmQg2E/xmqi3Q+eX1ym8WJ0/xvTi
	uDQekzi8LzKA81lwqZAseOnfg9gec1H4uGhefakoP70vrgt2UVoYFRRPPyMLEhFIUCLJSND61jl
	RJ3ut2OuM1bPDY54OgUhujWY77OT1h4m1frNxf95eohDjYcaAZXgdbFvceAiP61+rpZWVgiFj8V
	JCDxxQfJps5+0/Vv8ZOuHJNkWByNzHzYo5bn7PWa6hdXZE12Fqw/lwGenniVnxeRbj6jDJAK6vW
	iY4lHwZHvdjuhBCoeC1TGYG3SwIC/qLIvYz7mmSfoKMJVUcma/uoVkgtKoC+47qfJ6nGPBWE0NF
	OMI
X-Received: by 2002:a5d:5e93:0:b0:461:a1fd:6be with SMTP id ffacd0b85a97d-46adafbd2ebmr5192366f8f.7.1782226521658;
        Tue, 23 Jun 2026 07:55:21 -0700 (PDT)
Message-ID: <7ae492bd-1a43-4de9-b24f-c0c8407ac916@suse.com>
Date: Tue, 23 Jun 2026 16:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] x86/kexec: Implement new EFI load type
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 ross.lagerwall@citrix.com, xen-devel@lists.xenproject.org
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
 <20260622151833.3397692-6-kevin.lampis@citrix.com>
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
In-Reply-To: <20260622151833.3397692-6-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782226522-F51F3744-CA209520/0/0
X-purgate-type: clean
X-purgate-size: 3922
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A367C6B8155

On 22.06.2026 17:18, Kevin Lampis wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_TBOOT) += tboot.o
>  obj-y += hpet.o
>  obj-$(CONFIG_VM_EVENT) += vm_event.o
>  obj-y += xstate.o
> +obj-$(CONFIG_KEXEC) += kexec.o

While there are some anomalies down here, most of this block is suitably
sorted (alphabetically). Please insert accordingly.

> --- /dev/null
> +++ b/xen/arch/x86/kexec.c
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/kexec.h>
> +#include <xen/kimage.h>
> +#include <xen/guest_access.h>
> +#include <asm/bzimage.h>
> +
> +/*
> + * Find the entry point to the new kernel, we need to map the crash region into
> + * memory in order to read the kernel header.
> + */
> +#define KERNEL_SEGMENT_IDX 0
> +int64_t kimage_find_kernel_entry_maddr(struct kexec_image *image)
> +{
> +    uint64_t dest_maddr;
> +    uint32_t alignment, magic;
> +    uint16_t version;
> +    void *dest_va;
> +    const struct bzimage_header *hdr;
> +    int setup_sects;
> +    size_t kern16_size;
> +
> +    dest_maddr = image->segments[KERNEL_SEGMENT_IDX].dest_maddr +
> +                 image->segments[KERNEL_SEGMENT_IDX].dest_offset;
> +
> +    dest_va = map_domain_page(maddr_to_mfn(dest_maddr));
> +
> +    hdr = (const struct bzimage_header *)dest_va;
> +    magic = hdr->header;
> +    version = hdr->version;
> +    alignment = hdr->kernel_alignment;
> +    setup_sects = hdr->setup_sects == 0 ? 4 : hdr->setup_sects;
> +    kern16_size = (setup_sects + 1 )  * 512;
> +
> +    unmap_domain_page(dest_va);
> +
> +    if ( magic != 0x53726448 || version < 0x0202 )
> +        return -EINVAL;
> +
> +    /*
> +     * Ensure the kernel alignment is a valid LOAD_PHYSICAL_ADDR,
> +     * which ranges from 0x200000 (2MiB) to 0x1000000 (16MiB) on 64-bit systems
> +     * as defined in the kernel x86 Kconfig
> +     */
> +    if ( alignment % 0x200000 != 0 ||
> +         alignment < 0x200000 ||
> +         alignment > 0x1000000 )

Use MB() to cover some of what the comment currently says? (The second of the
checks would also be easier as !alignment, seeing that the first check already
excluded all other values below MB(2).)

> --- a/xen/include/public/kexec.h
> +++ b/xen/include/public/kexec.h
> @@ -54,13 +54,16 @@
>   * - kexec into a regular kernel, very similar to a standard reboot
>   *   - KEXEC_TYPE_DEFAULT is used to specify this type
>   * - kexec into a special "crash kernel", aka kexec-on-panic
> - *   - KEXEC_TYPE_CRASH is used to specify this type
> + *   - KEXEC_TYPE_CRASH or KEXEC_TYPE_CRASH_EFI are used to specify this type
> + *   - in case of KEXEC_TYPE_CRASH_EFI the first segment will point to the
> + *     full kernel to load and entry point will point to boot params
>   *   - parts of our system may be broken at kexec-on-panic time
>   *     - the code should be kept as simple and self-contained as possible
>   */
>  
>  #define KEXEC_TYPE_DEFAULT 0
>  #define KEXEC_TYPE_CRASH   1
> +#define KEXEC_TYPE_CRASH_EFI 3
>  
>  /*
>   * Perform kexec having previously loaded a kexec or kdump kernel
> @@ -167,7 +170,11 @@ typedef struct xen_kexec_load {
>          XEN_GUEST_HANDLE(xen_kexec_segment_t) h;
>          uint64_t _pad;
>      } segments;
> -    uint64_t entry_maddr; /* image entry point machine address. */
> +    /* image entry point machine address or parameters in case of EFI. */

Nit: As you touch comments, please also correct style issues.

> +    union {
> +        uint64_t entry_maddr;
> +        uint64_t parameters;
> +    };

We don't want to use language extensions in public headers. I'm actually
surprised this still passes the -ansi header check that we do from
include/Makefile. Maybe with recent compilers this doesn't do anymore
what we expect it to do?

Jan

