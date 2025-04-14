Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EAEA877F9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 08:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949069.1345714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4DQM-0000CF-LD; Mon, 14 Apr 2025 06:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949069.1345714; Mon, 14 Apr 2025 06:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4DQM-0000AX-IG; Mon, 14 Apr 2025 06:36:06 +0000
Received: by outflank-mailman (input) for mailman id 949069;
 Mon, 14 Apr 2025 06:36:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4DQL-0000AO-7D
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 06:36:05 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd013469-18fa-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 08:36:04 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso2241731f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 13 Apr 2025 23:36:04 -0700 (PDT)
Received: from ?IPV6:2003:ca:b71f:2f7e:1407:af3a:2658:6d8d?
 (p200300cab71f2f7e1407af3a26586d8d.dip0.t-ipconnect.de.
 [2003:ca:b71f:2f7e:1407:af3a:2658:6d8d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96bdf9sm9818458f8f.22.2025.04.13.23.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Apr 2025 23:36:03 -0700 (PDT)
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
X-Inumbo-ID: bd013469-18fa-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744612563; x=1745217363; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KM4P8X+rAKNBhnTRyLj1LSU2EHHuavhMOTJBzHqB6mM=;
        b=cbyNUqMAG483kvdkoVqSNaLQPdVTyrAKvTB9dkkcVb12TKMu+7F0Peip0blFeuhTyZ
         ClxuGr6SbeZIr//hkhWMnyzKZLvho0nR4AjcCG2as/ViwP0wuWEUgIZLf7RXnbFI51eC
         RtzPM+g2/wY6yVv6jnadwLfajBzRKfCilhBpW/ahvKV60Of09UWLZ8gC6qRRyT3GsCyp
         39S6QVpTVopGFYgTm21hAB1Xx22rhXLdhKGiodoQnnDkuYW+cK6NboF5LBO2tC/OaZlZ
         Ni7811MIBqmQqcH2iPEWYrlJOpqMaGQ42IBiiQpomnf8c6HzUw2algoyB7jweLVKDc67
         EVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744612563; x=1745217363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KM4P8X+rAKNBhnTRyLj1LSU2EHHuavhMOTJBzHqB6mM=;
        b=ruTr5+B02SK1VgcON0pnSufKyVsVbiq2rTuiQHsjeVZzV1U+GmhPVkfWq3DdlTpol3
         LkHXdWXLfkXSkvUOFPLPEmCSUFbANlI0UPGguBWzJt1lKs/WpQxrwp9UgM7vFQhUgEt0
         ZOMG2VwPYCw/PA6lltyOFenfNMmWV/M1SQ/RT3vle9tMcMjGvFnRIpz5aBtxLVo08br2
         AvW58uAkuUAJV0/Ju/4x2R0otubLGa5k0jl9NUGjoLD99Ius3AYaCUG2KKZ0M2luuBHW
         qumHumK8OtXbp8qAzW1LJFhezL9JmALbT6VPLXFFYrojWgXkkNqm8Yh7grI9qJH4o4U/
         PTnA==
X-Forwarded-Encrypted: i=1; AJvYcCUG1eaYX+kAgOuu6e7N9B3O882oyzbca4e4CMNiVjP1Jl/WOnxjP7sqFgbdhtBbbfAOLdn8j9SvIkU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCmfNgdRu0aj3c/Gwm12zpe3hYCqR7DhvMcCzifucSQR5NuqW9
	SbheP7M+FtXlZ6ZU24Nb/BDOuV1TRggJQDkqX8yf7QWNs9yk6C0gAQk46QED0g==
X-Gm-Gg: ASbGncsUW8wNDq3z/wxvoOCIRyS1gzr0hUsF1kpfuqdeDG5t1qCGLeamQdspH1LkrJG
	1isb79O/oGy7KtlRwLdt6SkIc3k2sjkUNDxjHqJ8Jp0acIdqZ0MG6M7SAPk+8VYSE/LSmqsMprX
	c3i9r7PqIATeoLfrLMH/Y8OPh7bFBenVzG5HC73LI3hGEE+qqWwtdiiUulpdfDzcJ5BGeXbRiUW
	Lz55hTbY8tKWRfnOSgLZzn9Isf11o2U+VuKyUOf0cELqwRdAZHJU4RQPwK++LMneYSEtZJOU0fj
	8wI8YWd3cRmeJjyiXexRub0XycuFk+emXZRGXnLq/OH2JvJwWevGkpVuRuHqtlMX/j9+/FN6q7N
	lJKcmRhBQEVAT/Hr9kTGBfXSMvlV0cfBekVPa8Ki89tD0ouW5tRiI3B/ukeU4XVuBE1wQFz3EE3
	M=
X-Google-Smtp-Source: AGHT+IGFfo9n8pnKeCG2Wqge1J27Wwmq1YdmEoRdak6iPH1yNZyeobMNomriPS/VTAYgCHdlrJ2i+w==
X-Received: by 2002:a5d:584f:0:b0:39c:1257:c7a2 with SMTP id ffacd0b85a97d-39eaaecae92mr8234068f8f.58.1744612563573;
        Sun, 13 Apr 2025 23:36:03 -0700 (PDT)
Message-ID: <fbccd862-040c-47d5-a858-2502eb08df28@suse.com>
Date: Mon, 14 Apr 2025 08:36:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/hvm: only register the r/o subpage ops when
 needed
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-5-roger.pau@citrix.com>
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
In-Reply-To: <20250411105411.22334-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.04.2025 12:54, Roger Pau Monne wrote:
> MMIO operation handlers can be expensive to process, hence attempt to
> register only those that will be needed by the domain.
> 
> Subpage r/o MMIO regions are added exclusively at boot, further limit their
> addition to strictly before the initial domain gets created, so by the time
> initial domain creation happens Xen knows whether subpage is required or
> not.  This allows only registering the MMIO handler when there are
> subpage regions to handle.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



