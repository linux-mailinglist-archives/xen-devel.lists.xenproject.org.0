Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717DE8C748B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723069.1127610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YDo-00014z-31; Thu, 16 May 2024 10:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723069.1127610; Thu, 16 May 2024 10:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YDn-000131-VZ; Thu, 16 May 2024 10:20:23 +0000
Received: by outflank-mailman (input) for mailman id 723069;
 Thu, 16 May 2024 10:20:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7YDn-00012v-6f
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:20:23 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e65f4a4b-136d-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 12:20:21 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59c448b44aso305073966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 03:20:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b0177asm972536566b.173.2024.05.16.03.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 03:20:20 -0700 (PDT)
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
X-Inumbo-ID: e65f4a4b-136d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715854820; x=1716459620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydp7O/RXU9B2RxfhCENK2SvhA9RmVIcwvX7guS8hQzc=;
        b=YS8Td27hXd+sSp2R9Sj+iRuHi98WwEy8zEbBZOeV2XY9psWplNd/F49BrP4w7hEYa9
         gd4v13aMoOvfrQ4J3ZlQShgo+f7Spc9TQDrAdRm1QVaHq9Lwy2cTJunmwHVl4msff8NY
         nfuRQPAmm+MaQ7d3nm32pVxFmmOQl1g0bd3+AKXUzHnIk8bK2seMl2eTmp7btM3XeNYp
         aTGBJxjX2ITERxnkA8QrjPONDCbpxEvkP0sByXzsOcRQLfjpzWWMXLim32gwmESjmQvg
         Zmil0tztCuS3vU95IOb0StLlVLMTlape2NKT5ooeoox6iBQOYTIZVwC+JNV+5p+xd1sy
         L8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715854820; x=1716459620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydp7O/RXU9B2RxfhCENK2SvhA9RmVIcwvX7guS8hQzc=;
        b=HXMV2X1lM1MjSL5SE+xGtqQN/FnsR7JPNkaYDhZD6FIsBbPHezRT4YID9oJ3ytu0km
         lrwVjS8DPSwTZJUqc9aD3AC2BaXjsrPyjwJE+4/MzmjcILL+Y5EYQia1Uq/rj7TiT18l
         uphdGVdk+75g4b/ep+ADtuMX09gVf2JQpVroZvbNdvmIt40vJAjGK+j9KQPMX9mhubXw
         y5+aZ+aYY7D4W+3tQUccjaie4yfR8ydX3YeBhEeOu2tIIsyy1U4PGYJatj7Esto5ScjT
         gnaML0DBE13DtB2ybdghkBMPk3r7p/37uSB4OZ4vHEqZ2s3g3xbn6IAtD4ka84LXY59F
         +4Og==
X-Forwarded-Encrypted: i=1; AJvYcCVs0SLo/Fdk4QutJrDDNhylRrimSe15wq922aTrupLGyvKgApruamj6SiC0VTYSQGn8aZm0ve3d6qnUYU/qC3NadsP57ffA7zHT/BnnI0g=
X-Gm-Message-State: AOJu0YwBVbHG+jju72Tw84/8YTHT4GKZvmxfaEAbkYYYF5zSGtbAwXuB
	+4LZSR7Y+Xrp1lzgBURiiDl8jCGjx82DfOcTamLXefa3y7fsfoGttfw2R/j4hA==
X-Google-Smtp-Source: AGHT+IEiQw4B2ESmjtaRVj2ir/c//ql9hmJseoZPSICA9hCOkKzLCCDOhfroJpcwOoX5Qd3cNS9hOQ==
X-Received: by 2002:a17:906:fc05:b0:a59:ae9b:c661 with SMTP id a640c23a62f3a-a5a2d5d49b3mr1112159666b.40.1715854820437;
        Thu, 16 May 2024 03:20:20 -0700 (PDT)
Message-ID: <1e0dfa77-680c-4ab3-9634-e787517c3d85@suse.com>
Date: Thu, 16 May 2024 12:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 02/15] x86/monitor: guard altp2m usage
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <01767c3f98a88999d4b8ed3ae742ad66a0921ba3.1715761386.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <01767c3f98a88999d4b8ed3ae742ad66a0921ba3.1715761386.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 11:01, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/hvm/monitor.c
> +++ b/xen/arch/x86/hvm/monitor.c
> @@ -262,6 +262,8 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
>      struct vcpu *curr = current;
>      vm_event_request_t req = {};
>      paddr_t gpa = (gfn_to_gaddr(gfn) | (gla & ~PAGE_MASK));
> +    unsigned int altp2m_idx = altp2m_active(curr->domain) ?
> +                              altp2m_vcpu_idx(curr) : 0;
>      int rc;
>  
>      ASSERT(curr->arch.vm_event->send_event);
> @@ -270,7 +272,7 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
>       * p2m_get_mem_access() can fail from a invalid MFN and return -ESRCH
>       * in which case access must be restricted.
>       */
> -    rc = p2m_get_mem_access(curr->domain, gfn, &access, altp2m_vcpu_idx(curr));
> +    rc = p2m_get_mem_access(curr->domain, gfn, &access, altp2m_idx);

I think something like this wants taking care of by the function itself.
asm/altp2m.h already has certain stubs (the conditional of which I expect
a later change will switch to CONFIG_ALTP2M); you'd need to just add one
more. Then the other (and any future) users of the function would be
covered as well.

Jan

