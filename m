Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3LHaHsicT2o+lAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 15:06:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A85BC73162C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 15:06:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=X2LHMe21;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358142.1612394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whoRq-0005u3-37; Thu, 09 Jul 2026 13:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358142.1612394; Thu, 09 Jul 2026 13:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whoRq-0005re-06; Thu, 09 Jul 2026 13:05:50 +0000
Received: by outflank-mailman (input) for mailman id 1358142;
 Thu, 09 Jul 2026 13:05:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whoRo-0005rY-3k
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:05:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whoRn-00Dhke-9U
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 15:05:47 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f9c9e-5cb7-0a2a0a5109dd-0a2a4503aef0-40
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 15:05:47 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f9cab-f2d2-0a2a45030019-d155802aa8d3-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 15:05:47 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so11395925e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 06:05:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d843csm50590827f8f.14.2026.07.09.06.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 06:05:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1783602346; x=1784207146; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9MPYPtQTocXjTl/nnXwgjLZZH+6pvK38TAH1z5KMgQ=;
        b=X2LHMe21wGjvKjelo5cCFHS/7lzgAyMmLv0utTt1GWupxII+oSsCPWu21gv6Gpjc/r
         ZPAmMv+HaHQuGwiuuvhFQjnjfJPglX3VZ7vzaWhBUdLxvethUVE2S3VSDI6PNe66Wbn3
         p8Hze0yXB8R70jNjtTp6uI95ZUIHrKtKOpt6r91+SDPaW6y0LeceXt+XFTxDXb/IEQFj
         IFmlBTTmPIeGBXd/ofYtUnz/LWndK9U9ibYMxD6Pbhm4m+B7IcH4qQbJlwW4kpwXXt5O
         6AqC2oH3C3gEszLom9bYeTiExkVZLTYO+8Kzjf0qKzbpqC0EROoTKffs6dC2Uee5hpAb
         eN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602346; x=1784207146;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9MPYPtQTocXjTl/nnXwgjLZZH+6pvK38TAH1z5KMgQ=;
        b=fkLCVe6EyJC6UULap23wNtuUiTalB+Bdv7DUk5AVvrlWP0JL0S1SWy9PX9WpGI1nuP
         M8a0fpuwlgQ3P0zb0Ru3efNQnXnygsAOOFwqwgEoZQqlmwwxk6t6RU6Rfb7vQMoZrWmF
         zZ4RQEjrqAnMkw5rr9HuhArXPMCy6CWj/m09EYsUMbmHaaYX4wjGSiXC465K+CHDA0gR
         Etsmgh5qtySVIG3hLoS9O8dMeMVTf/EJfZYVT1W/Pl1q8dAzB9yeuyvFnk1QQqPG0PU1
         RHMxP0dP1L+aRt1A5cBogaoqhTjRrNyeDHNnm8ZD4rPeQCh+0QFZgXufkHSp0COsR8tT
         Je1A==
X-Forwarded-Encrypted: i=1; AHgh+Rpix9DnUnw/O+Vio0p5M9sHRaV529R0h077uay8z8bfyGmhvxGz3h4axQRrORtmnS5cwVQ/QbCJmWs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyL+1/CIQ+tIue22jelVDj2RFrbFGMPWLIB4QpWo6NFfQ8gZTrC
	tflDcQC07MFS5jU8oFd5ML8Tze5VYvcGDTZV3TVy2l0ZdZiSWmZUEMgj1vd3SGeMnA==
X-Gm-Gg: AfdE7cnwi/VYoPjs+cv2zuv1HOtkT0+qeJF10J+2VBtCHdSgWPl+oEDjJsZ8cORFRsX
	4DsAYUgdXCXouQckjzyW1pqHwsqu+U5apLpBGMv0EabVpDdgFd2K0lhJnqFGBsC/4isVWnB/GUx
	+0IUlU0EX03laTg1eB1LawVsblPWpgdxkFnsVIs4gvo71f/OWI5wxqeEuCUVgRcoqEHNjRCYOdd
	8Q0G75RqoonzsO1iyV13kktX+zC6byPZg7NSuTkNlBWyjytE85hAUhz+3U0qT9zJ6qvZOzLAaNs
	bXMbgWGuQYjiGiUC/DkDw+bVJo+b5mmegAZx6v6cSk1yw2elV64eHhptK+qu36ak/qHQO4mc0LI
	q585TOeVgYUpRtS9YwtHRIKkrSyTl11B7zRCGawbqqCj34I23NBfVRZkx+LZg9/j/nSN9ciO3KY
	sYripRXArWz+fxHOlvfLuStI8hTUzl6T33QKI+8lyb2YprNOOOQCauERLHph8ZZazwkwfFydKHy
	vYL6etYP+8z11w=
X-Received: by 2002:a05:600c:2d96:b0:48e:8eb0:4957 with SMTP id 5b1f17b1804b1-493ec55cfc5mr20594905e9.2.1783602346617;
        Thu, 09 Jul 2026 06:05:46 -0700 (PDT)
Message-ID: <2f26c623-e577-44bb-8163-f52b97496d05@suse.com>
Date: Thu, 9 Jul 2026 15:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/26] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <dc486923b5313c64cf383575d25c58c9af9e5eae.1783331040.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <dc486923b5313c64cf383575d25c58c9af9e5eae.1783331040.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1783602347-F3D53CF4-BAC1F4AB/0/0
X-purgate-type: clean
X-purgate-size: 4936
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,xenproject.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A85BC73162C

On 06.07.2026 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -14,6 +14,7 @@
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> +#include <xen/sched.h>
>  #include <xen/sections.h>
>  
>  #include <asm/cpufeature.h>
> @@ -34,6 +35,19 @@ struct riscv_isa_ext_data {
>      .name = #ext_name,                          \
>  }
>  
> +struct riscv_isa_ext_entry {
> +    unsigned int id;
> +    const char *name;
> +    bool guest_supported;
> +};
> +
> +#define RISCV_ISA_EXT_ENTRY(ext_name, guest_supp)       \
> +{                                                       \
> +    .id              = RISCV_ISA_EXT_ ## ext_name,      \
> +    .name            = #ext_name,                       \
> +    .guest_supported = guest_supp,                      \
> +}
> +
>  /* Host ISA bitmap */
>  static __ro_after_init DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
>  
> @@ -120,29 +134,30 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
>   * and strncmp() is used in match_isa_ext() to compare extension names instead
>   * of strncasecmp().
>   */
> -const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {

I realize it has been this way before, but ...

> -    RISCV_ISA_EXT_DATA(i),
> -    RISCV_ISA_EXT_DATA(m),
> -    RISCV_ISA_EXT_DATA(a),
> -    RISCV_ISA_EXT_DATA(f),
> -    RISCV_ISA_EXT_DATA(d),
> -    RISCV_ISA_EXT_DATA(q),
> -    RISCV_ISA_EXT_DATA(c),
> -    RISCV_ISA_EXT_DATA(h),
> -    RISCV_ISA_EXT_DATA(zicntr),
> -    RISCV_ISA_EXT_DATA(zicsr),
> -    RISCV_ISA_EXT_DATA(zifencei),
> -    RISCV_ISA_EXT_DATA(zihintpause),
> -    RISCV_ISA_EXT_DATA(zihpm),
> -    RISCV_ISA_EXT_DATA(zba),
> -    RISCV_ISA_EXT_DATA(zbb),
> -    RISCV_ISA_EXT_DATA(zbs),
> -    RISCV_ISA_EXT_DATA(smaia),
> -    RISCV_ISA_EXT_DATA(smstateen),
> -    RISCV_ISA_EXT_DATA(ssaia),
> -    RISCV_ISA_EXT_DATA(sstc),
> -    RISCV_ISA_EXT_DATA(svade),
> -    RISCV_ISA_EXT_DATA(svpbmt),
> +const struct riscv_isa_ext_entry riscv_isa_ext[] = {

... is there a reason for this to be non-static? Its type (struct
riscv_isa_ext_entry) is local to this file, and I also can't spot any
declaration elsewhere.

> @@ -480,6 +495,74 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
>      return test_bit(id, isa_bitmap);
>  }
>  
> +int build_guest_isa_str(char *buf, size_t size,
> +                        const unsigned long *isa_bitmap)
> +{
> +    char *p = buf;
> +    size_t left = size;
> +    int total;
> +
> +#if defined(CONFIG_RISCV_32)
> +    total = snprintf(p, left, "rv32");
> +#elif defined(CONFIG_RISCV_64)
> +    total = snprintf(p, left, "rv64");
> +#else
> +# error "Unsupported RISC-V bitness"
> +#endif

For the longer-term future of this, passing in const struct domain * may
help.

> +    if ( total < 0 )
> +        return total;
> +
> +    if ( buf )
> +    {
> +        if ( (size_t)total >= left )
> +            return -ENOSPC;
> +
> +        p += total;
> +        left -= total;
> +    }
> +
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
> +    {
> +        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
> +        int ret;
> +
> +        if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
> +            continue;
> +
> +        ret = snprintf(p, left, "%s%s",
> +                       ext->id >= RISCV_ISA_EXT_BASE ? "_" : "",
> +                       ext->name);
> +        if ( ret < 0 )
> +            return ret;
> +
> +        total += ret;
> +
> +        if ( buf )
> +        {
> +            if ( (size_t)ret >= left )
> +                return -ENOSPC;
> +
> +            p += ret;
> +            left -= ret;
> +        }
> +    }
> +
> +    return total;
> +}
> +
> +void init_guest_isa(struct domain *d)
> +{
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
> +    {
> +        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
> +
> +        if ( ext->guest_supported &&
> +             riscv_isa_extension_available(NULL, ext->id) )
> +            __set_bit(ext->id, d->arch.isa);
> +    }
> +}

Right now what this function does is dependent on only global variables.
IOW each guest gets the same bitmap. Is this going to change soon? Else
why not calculate that bitmap once, taking the same shortcut as you take
elsewhere for the time being? Then allowing riscv_isa_ext[] to remain
__initconst (should really have been __initconstrel).

> @@ -527,4 +610,5 @@ void __init riscv_fill_hwcap(void)
>      if ( !all_extns_available )
>          panic("Look why the extensions above are needed in "
>                "https://xenbits.xenproject.org/docs/unstable/misc/riscv/booting.txt\n");
> +
>  }

Stray change once again?

Jan

