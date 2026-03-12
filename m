Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDkcD4N4sml/MwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 09:25:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE3D26EE23
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 09:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251804.1548664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0bM6-0000Zy-LU; Thu, 12 Mar 2026 08:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251804.1548664; Thu, 12 Mar 2026 08:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0bM6-0000Xv-Ip; Thu, 12 Mar 2026 08:25:18 +0000
Received: by outflank-mailman (input) for mailman id 1251804;
 Thu, 12 Mar 2026 08:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0bM4-0000XB-DE
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 08:25:16 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe4d4dfa-1dec-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 09:25:14 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48538c5956bso7318305e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 01:25:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b66e3f8sm111689065e9.14.2026.03.12.01.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 01:25:13 -0700 (PDT)
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
X-Inumbo-ID: fe4d4dfa-1dec-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773303914; x=1773908714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eDTW8bDAjEjJXFvZLiffSqGsw7st6MYe1edCkQn7ftw=;
        b=NVpr2PZ8veHxydc1sGylGnvU6oKccRqdiJwnAbX7vnBIJeDZyhak1ONfhzSreswjDI
         xoc229UBEL/AdpubnVCmlNrn7ZlyMDRWIo8dp10v53dBJWdERyo1bSAMdHegM8ojcOkf
         OFFhHKH9ugB226A/35CWpYG+A6WUH2xS5GCcs8T0NhqJry6vCUaPTleSfOsO/St9KA0w
         KmNzHpNNYKqwVjuBwh8tLSmklyASTiVwE6C9qZ56qiO0Tx8ZcE/HUcgXKShktOmf3kXe
         kyQ/z691sUY7myExwjiLGFZbFOGeyZl/oO2rFlLqVPXcubyzrrsHejL/FXANIYJ7YuIn
         V5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773303914; x=1773908714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDTW8bDAjEjJXFvZLiffSqGsw7st6MYe1edCkQn7ftw=;
        b=teGR+Ss9vrqqot2rW1E94mmtKzFMS4gzFo0Hhkzaklm6WDPIjUzXPcnR5N8GY1a6Lp
         FKPiDzLgyhp4/rDC9QUDoDAs9Up8gy/WYKe0awK8gvC6+gkk3q0D/xcxmNXEciObINZt
         k7dErI9T0VX1PF92ZEJj6SFnu/ZgVBjuxCUK4EIv6vSTWiGkPJCCCKbj4BYtDKIVl2B8
         TJTt2oVMM53nTFc/URCKp8/nf+qVOQzg84fz0UaF2eVJ0aA0zTB2+wFgo+Eceff82hdz
         5lnWxBm1zKVwt3rockrxDVe+ojVFVQrmgLmY3XJuKOmO3QwxQoRtTeSXxfD5tvZ5SMe1
         UYkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW21q1e09LLkDULGLb8iNRW3Nzm9EWHbFDBcMkK0mz3QBFBQYr2ZutlofIsGw9bcVYyGVK/wgoNJbo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwW5QmZDoHBeq9TDBXFZah+XOHF690FqRN2LmjRKzbOJQT+LyXm
	5ToIVm4DWnQgxeem8ruP+0RXZRG9COMkz973zVpUXrDxsvSvQ2Bruz8Q5QvGKq8Vqg==
X-Gm-Gg: ATEYQzxwbThDCqTCWcF1R15RdqqHZChjQnmmaqB3iXu7EgZMCaD3wxEVtLOZsHCbnz6
	PsdWWLgjEAun2ZOwjfvqzlgUwh0IWbusH4nHDIGsWfY2GRqbzCZ9nqXfrQQJzktQFx7jC3NWkyX
	hVq+lQzvv34Q6sOSDNXHOqx2r3lYMD/4dG57MZuaGuwoxv1Ku4et3XzOmv/x5p4MoR6CVQoVkL9
	WDxzCDtI0acElMmawBAQy68By79Gv80O/VdaNEjpnu8/2EG2U2WVIAmzqH+EqoEW1PMcFEhrE0Z
	GcppNYzuqb2n/jSr0EL34r9IjasSuI5LHjwnuG1gv0LqzwoJQpBxCqtKIoal8oTqwEHAvnkuZIF
	bWLZP75Zs/9BM1l1PWo7aijFUZobG03a1RHP9DCGzXzVA2IuAGpnYBCkevWdCu9Db0THE8/iVVA
	eyMXcb69gMLtOeaXJXfFS2YVZJoIRyrkAYNXXBFdCWrB1htJnu2iD3fWBABEKJVtZzMV1nUriA/
	zwWrnhCVobU82yI771sbYURYw==
X-Received: by 2002:a05:600d:644d:20b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-4854f56a0dcmr29646735e9.2.1773303913658;
        Thu, 12 Mar 2026 01:25:13 -0700 (PDT)
Message-ID: <bb3e166a-9842-48d9-8170-ab5e4e53c57d@suse.com>
Date: Thu, 12 Mar 2026 09:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/pdx: fix overflow from conversion from page index
 to address on 32bit
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260312080206.52648-1-roger.pau@citrix.com>
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
In-Reply-To: <20260312080206.52648-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:edwin.torok@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9DE3D26EE23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.03.2026 09:02, Roger Pau Monne wrote:
> When building the PDX test harness as a 32bit executable the page shifts
> done on unsigned long types can overflow.  Instead use pfn_to_paddr(),
> which casts the values to paddr_t previous to doing the shift.
> 
> Fixes: cb50e4033717 ("test/pdx: add PDX compression unit tests")
> Reported-by: Edwin Török <edwin.torok@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/tools/tests/pdx/test-pdx.c
> +++ b/tools/tests/pdx/test-pdx.c
> @@ -208,8 +208,8 @@ int main(int argc, char **argv)
>              if ( !tests[i].ranges[j].start && !tests[i].ranges[j].end )
>                  break;
>  
> -            pfn_pdx_add_region(tests[i].ranges[j].start << PAGE_SHIFT,
> -                               size << PAGE_SHIFT);
> +            pfn_pdx_add_region(pfn_to_paddr(tests[i].ranges[j].start),
> +                               pfn_to_paddr(size));
>          }
>  
>          if ( pfn_pdx_compression_setup(0) != tests[i].compress )
> @@ -233,8 +233,8 @@ int main(int argc, char **argv)
>              if ( !start && !end )
>                  break;
>  
> -            if ( !pdx_is_region_compressible(start << PAGE_SHIFT, 1) ||
> -                 !pdx_is_region_compressible((end - 1) << PAGE_SHIFT, 1) )
> +            if ( !pdx_is_region_compressible(pfn_to_paddr(start), 1) ||
> +                 !pdx_is_region_compressible(pfn_to_paddr(end - 1), 1) )
>              {
>                  printf(
>      "PFN compression invalid, pages %#lx and %#lx should be compressible\n",

Largely unrelated remark, from going through all of the PAGE_SHIFT uses: Isn't
the __LP64__ conditional excluding quite a few too many array elements in
main()'s tests[]?

Jan

