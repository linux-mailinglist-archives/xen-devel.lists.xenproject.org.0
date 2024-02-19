Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114AD85A840
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 17:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683019.1062332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc6Bv-0000CW-IV; Mon, 19 Feb 2024 16:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683019.1062332; Mon, 19 Feb 2024 16:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc6Bv-0000AH-Ff; Mon, 19 Feb 2024 16:08:27 +0000
Received: by outflank-mailman (input) for mailman id 683019;
 Mon, 19 Feb 2024 16:08:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc6Bu-0000AB-8m
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 16:08:26 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c4f5b7b-cf41-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 17:08:25 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33d375993f4so900309f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 08:08:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bt21-20020a056000081500b0033d1f25b798sm10491777wrb.82.2024.02.19.08.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 08:08:24 -0800 (PST)
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
X-Inumbo-ID: 1c4f5b7b-cf41-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708358904; x=1708963704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eGyhoNCsN0VjJKCpVFi0p3s4cXPK1xeHiJyUBzBdSZ8=;
        b=eI3rfWnveYKHX51rnQ2aNNvOZC+XIJzW9XZEvVoPomzS5r4I63Nx8OIPXOu2D7gZxf
         sELVsj2Wk+6MM9GH506aaoNplNjKIbR8kKQHSjVyym4/9ls5g6avZlFAkWZGUbwCOTW2
         tPMk4Ia68jUfnNNVZX8aa8xidgN1Wkh8RjfEnnF4yeD+NZxWjQK+cil3zmtovYnnc0Xa
         K/FYNjFdeA5ONbKw2FxM2eWBBPockcjB+PYMkjeSDiu/5YLxPPdr33NjU6jYbxpWJ3tU
         p0yq/gpJ1+snBeat3YzLo/b7KawedmDSfeLAAHIajzfT0sAkqxh2ncPGRbmtgZIQHu0+
         h8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708358904; x=1708963704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGyhoNCsN0VjJKCpVFi0p3s4cXPK1xeHiJyUBzBdSZ8=;
        b=v17IvzQj7sPGzkz4Rk+tRwTt4y2muKbqwDo40qvhM5RwSB66Y+RfM7l4MLyBsN3p/0
         1f5HO76Dm+9/MX0y4kEoPK6Z3mO5nwZp0oK7HauAiBlxLuEJ4zlgYjO1CKCheh1O+ZtV
         8DruWJXRMzXSlsaTOyfhuAloI6xMwTpHpn3Unde7dHJxIedx/bIC7TDZncgHFjG2Mg3o
         NE/3hTHM8piTAKNRanQLOZ8l2hsGboh6ufkvSuBUzGUvkCblM9gICnabMdhmScBHl06y
         qrzsJbHOydnLmOkcqenya/gkZvp/nlkGdqx0eCUIROsbQg1CVpjhgoHa3plhJItcptnr
         V1zg==
X-Forwarded-Encrypted: i=1; AJvYcCXVxcK1igEHYh7RtaAhZDg1/KXWN4NjFImSXpACLYHsK7745qfUSUa7oKLZ9xyp9Qyfln4fdnMypM35oYH57bfhvLCCBeZaVsvUULUhnVs=
X-Gm-Message-State: AOJu0YxGZO4vYElowLzpk+obwCLkxM7GKzBUI6qkQc2lwypkpEL77s5a
	i0pqiDqJlYSo9tkHp/1/i04l2M4J6qyloH2Yor4OdQleblyY3+F7K6VCKzCWLw==
X-Google-Smtp-Source: AGHT+IFbKdqg15TUi8M6wCUX9+ImM6WyX0HUV+RhP43wcofJ7nild58zo9bHMVUw0VLN+ZkAfGGcUg==
X-Received: by 2002:a05:6000:1e86:b0:33d:34a9:902f with SMTP id dd6-20020a0560001e8600b0033d34a9902fmr3955786wrb.36.1708358904618;
        Mon, 19 Feb 2024 08:08:24 -0800 (PST)
Message-ID: <046575d2-bc39-4b0e-a656-c501ee1ae4e6@suse.com>
Date: Mon, 19 Feb 2024 17:08:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen/hvm: Move other hvm_function_table booleans into
 the caps bitfield
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-4-george.dunlap@cloud.com>
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
In-Reply-To: <20240206012051.3564035-4-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2024 02:20, George Dunlap wrote:
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -86,20 +86,19 @@ struct hvm_vcpu_nonreg_state {
>  struct hvm_function_table {
>      const char *name;
>  
> -    /* Support Hardware-Assisted Paging? */
> -    bool hap_supported;
> -
> -    /* Necessary hardware support for alternate p2m's? */
> -    bool altp2m_supported;
> -    bool singlestep_supported;
> -
> -    /* Hardware virtual interrupt delivery enable? */
> -    bool virtual_intr_delivery_enabled;
> -
>      struct {
>          /* Indicate HAP capabilities. */
> -        bool hap_superpage_1gb:1,
> -            hap_superpage_2mb:1;
> +        bool hap:1,
> +             hap_superpage_1gb:1,
> +             hap_superpage_2mb:1,
> +
> +            /* Altp2m capabilities */
> +            altp2m:1,
> +            singlestep:1,
> +            
> +            /* Hardware virtual interrupt delivery enable? */
> +            virtual_intr_delivery;
> +
>      } caps;

Nit (spotted only while looking at patch 6): You're adding a stray blank
line at the end of the structure. Further I expect virtual_intr_delivery
would also want to be just a single bit?

Jan

