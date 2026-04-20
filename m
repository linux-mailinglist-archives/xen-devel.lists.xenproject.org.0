Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCibLFPc5WnNogEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 09:57:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23590427ED2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 09:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285453.1566482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEjV4-0001W6-4L; Mon, 20 Apr 2026 07:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285453.1566482; Mon, 20 Apr 2026 07:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEjV4-0001Ue-15; Mon, 20 Apr 2026 07:56:58 +0000
Received: by outflank-mailman (input) for mailman id 1285453;
 Mon, 20 Apr 2026 07:56:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEjV2-0001UY-6g
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 07:56:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEjV1-00GVMR-J5
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 09:56:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e5dc2f-e002-0a2a0a5209dd-0a2a450b9c36-46
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:56:55 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e5dc47-212f-0a2a450b0019-d155802ad96b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:56:55 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso23034965e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 00:56:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc14a61asm249323485e9.15.2026.04.20.00.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 00:56:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776671815; x=1777276615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t+goIEjmfAfsZC41olSoOfXjLRzesyfBIZZI2N84MUc=;
        b=GvoJqwoP8ZW7OO78tEGN7eI+S/2F8Ai9XtmLWSWmiKR9qoBn+Nd0a/xKrVfHjazKGn
         pDeXuAIPwrGiz8LmsSVxTruXg8iqNbpwFiiHBEm/UhyhU63uU34/XDbiedE4TFPVYnuB
         n5lqgE+4WfecoTq3V4hvfCTCzDTzRTtxiJsM6FWqDscJ6xGm2HoNHdVOi3tVdBfTPmAM
         eh8jDTYPjGk5F4T4L4yAkjuPrf2fheXhNIWKZ14CXQymWqmP+xAQz94PMP7CvIzC2wvv
         y6Ha6ow4sEUtQtZQy4z1ZO4fRhjZ7EtQk9EA84jMLe7D/wdSPxH+zUFLOB4+g6jK60G0
         f2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776671815; x=1777276615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+goIEjmfAfsZC41olSoOfXjLRzesyfBIZZI2N84MUc=;
        b=QSEr+1gW1DJ7YB9AthKXVMUMfoC8XMxkGepZC6JyJ5+dckVMBGWBR4OmKehPSiBDXG
         0AsCrcwFhMxiTn+yVbaHBtYAKtnJ5hXT1MxgEgE4rsdMINArK/5/3uBhD7kmQ79jKkA9
         hfGDAEfwtGwk5GnshKoI6f+5mJR2MkqoVNTo/grKirO65waKhJQ/36i6Z4XAaSBW84Wk
         uuipl+CI1kVaxR3AA49L2kM9INFOQhp1Naz69JQwORQEfF2DAVWbJdmttRzCuJ5hecsL
         t5cCrW4tyXsn+wY+9B7/kprBIrV28J1GahBlXA8es9Zv54dkCOSpMdSbHT2qKEMO7+tm
         N9HA==
X-Forwarded-Encrypted: i=1; AFNElJ/dTg64utHjFcv9V3lbN0JziChG6kN/xXCH5TppuLAl+G5fVUzqG+LM9mhNtTg4jg4EVuEDhCXuSGQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTpalmD6fH9SuzAttyBv8xiK2C68H6DFa9FcZoFOK0GmcgtP4F
	++3cVx37pC8ye8Ib+hi1rOgKAUM5PAMhVVxtnlxpg0U+Rp4f3FeohNKkm8NPcK74qQ==
X-Gm-Gg: AeBDietLSIxbuisvXHVH6fAWJ61Pfwi+et0MdfEwTljtD6aQf6kxk8IChqiGMMoWKfA
	7MHPyl0TWcHmqm6li4h+dU7vrJ2I1V1eaQvAurHNlnBKzYT37WHCDah/XrJpsm+NR4PmoeTJGtn
	uICtdoq3QC8mbBHeYQf73o6r0/4oPqisaSAmXv07GC+FAZWZZjYvnyDXgJjNwe7suJFT7bktJkA
	hQ1xMVXz/ozuqjskhMAYdF4RBAMcp3OYAuF1urXodxx3+hwpDsCX7um/MHTpdZswzEEx1/PxlYm
	vxTgI2fiDX5e8FjheovLdeowmgbTXw1kc4cGF1R6fh7pbDz/o6uY/x2dxr8Q7dIIVpyxMPjFM9i
	vD9qpOmnSPKYAKWVCrj+F9ZyiVVLweA0r3YvX4kWzLuDmI/EyrXou2cOig0vDPTiHltPoAxxRY7
	vry93fyDm0c5gsSN9CXKhdoMxVBQmz9dbqk3rRsu2ohNOUTNtVu3jlLCo2WZa6lOV8qWRd5Yq3P
	zdpkrz/CCXEIz1TMoanpEWmlw==
X-Received: by 2002:a05:600c:4707:b0:488:bfc3:efc with SMTP id 5b1f17b1804b1-488fb6e8eb5mr174782245e9.0.1776671814787;
        Mon, 20 Apr 2026 00:56:54 -0700 (PDT)
Message-ID: <405b5653-4df9-4ee0-b6e2-ba7c4a5efbba@suse.com>
Date: Mon, 20 Apr 2026 09:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <5285075f24cd2a2c5566b2a7724198d34aab51c5.1776354739.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5285075f24cd2a2c5566b2a7724198d34aab51c5.1776354739.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1776671815-252B9F3B-5157A77A/0/0
X-purgate-type: clean
X-purgate-size: 2022
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 23590427ED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17.04.2026 09:24, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/csr.h
> +++ b/xen/arch/riscv/include/asm/csr.h
> @@ -32,6 +32,20 @@
>                             : "memory" );                        \
>  })
>  
> +#ifdef CONFIG_RISCV_32
> +# define __csr_write32h(csr, val) csr_write(csr ## H, (val) >> 32)
> +#else
> +# define __csr_write32h(csr, val) ((void)(csr), (void)(val))

In order to be able to spot issues in 64-bit builds, how about

# define __csr_write32h(csr, val) ((void)csr ## H, (void)(val))

?

Apart from this, no matter that it was Andrew to suggest this, I'd like to
(once again) point out that identifiers starting with two underscores are
reserved. I don't see why a single underscore wouldn't do here. Or
alternatively csr__write32h().

> @@ -279,8 +299,6 @@ static int cf_check sbi_set_timer_v01(uint64_t stime_value)
>      return sbi_err_map_xen_errno(ret.error);
>  }
>  
> -int (* __ro_after_init sbi_set_timer)(uint64_t stime_value) = sbi_set_timer_v01;
> -
>  int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
>                            size_t size)
>  {
> @@ -360,10 +378,9 @@ int __init sbi_init(void)
>          }
>  
>          if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
> -        {
> -            sbi_set_timer = sbi_set_timer_v02;
> -            dprintk(XENLOG_INFO, "SBI v0.2 TIME extension detected\n");
> -        }
> +            set_xen_timer = sbi_set_timer_v02;
> +        else
> +            set_xen_timer = sbi_set_timer_v01;
>      }

Sadly this isn't quite equivalent to sbi_set_timer having had an initializer.
I would have wanted to suggest to use a constructor function, but we call
init_constructors() even later than do_initcalls() on both Arm and x86 (we
don't call the latter at all on RISC-V so far). Might it be necessary to
introduce sbi_early_init(), called very early during boot? Else how do you
guarantee no accidental use of the variable before it is first set?

Jan

