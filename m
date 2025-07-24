Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF146B101C3
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 09:30:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055315.1423725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqOH-0005WV-5a; Thu, 24 Jul 2025 07:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055315.1423725; Thu, 24 Jul 2025 07:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqOH-0005TQ-2i; Thu, 24 Jul 2025 07:29:21 +0000
Received: by outflank-mailman (input) for mailman id 1055315;
 Thu, 24 Jul 2025 07:29:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueqOF-0005TK-DQ
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 07:29:19 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e75f10fa-685f-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 09:29:16 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so565025f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 00:29:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fc604bcsm1266832f8f.17.2025.07.24.00.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 00:29:15 -0700 (PDT)
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
X-Inumbo-ID: e75f10fa-685f-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753342155; x=1753946955; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FTUx+HgdsXEHddqbLJFja4Wg2rJbm/VzE1AZq4t/+1Q=;
        b=SkJk3ZCdyHFkIogbAUucxI5u2xbFlM/I1unmLHhDcWRHrXjrNlGrb3+3gqxM7aUDNX
         KxuJO6fNhQrvB5BLi1pVbKjyV5Wc0Bqc8UZSc/BKivpNUYQqNnh8k304fVO+JDL0/8ub
         nv6JZIY3h0jB5MyvjpAP83MHnib3sqdMfVydhlGMs+bWlcyjzjhfg+I+VRUh6NCgc4iL
         gf5a7YBxd5oTMIyd4xwBgOt+uBlRmYRyqKVWk7pVD9iy9MQRqwr91NA5aqlQJKfmm34b
         a40bwbjJoxk3h6s3khcWg6iT/qPr18scayRcyCfhXo1ZMN0xrbzzPYxjEPAllBvLCZPj
         zIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753342155; x=1753946955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTUx+HgdsXEHddqbLJFja4Wg2rJbm/VzE1AZq4t/+1Q=;
        b=F8T/FMwtKE/ZENksfneAa2+yBs4CgFbIxLp1ov3XrObaJeLUgG+OhHbgKw8Lb9Kf5J
         9QXrxG16t7Kmv/+W8sD3ZDhKR2Ut5wJ3Mtk0MFxVTubqAt48oRXbFc4ejIf/lFv8bgGX
         xuvs2A/f+zB3+LGbNn7Wc50A19pu74sJOZV7Cz9SDa71Dm3Ir3PsC5Mh/QYPJE+ZZzp+
         iHk5pf75BxGBVa18j9g0d8eDgF8LcJoebzJDrIXXtWZUhCPiHa4eXR36ohSc0BCeo6aG
         mPJLRCywzdeLy+4XpjxxGuTkZezc2bDA7MZUQ9mhYvkerVErjlKSXkoHltsSlSaTmMjU
         vHkQ==
X-Forwarded-Encrypted: i=1; AJvYcCULC/C/ypgsWzDdS+Svrs19le/02+O2HY4lkbj/VfrAOFb6cV4+U8MmGYdA1SDOf94UWhCEsBMggvk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAPnA+/wKYH/hXALFINrRd21S/CSAc17uia0So2R4G/q9yZdDM
	bxm4+Rh9cjpcwQn60j4G63yi+Nkr9ypXPOsEHSxVWQriuCMfdGQPUuOXPetZ63bXWQ==
X-Gm-Gg: ASbGncuNYT5q+wzzZek6NFdp61IIEbN0EIgERMiHpKTPG/k7lxPK0VHTo1r9aJUo9xV
	43QCBKpstCHLLQlaVAhgkzV5QYzJH3C0OSHqVC4ZYWyiChVXe7DcmRBVzgWGdNrQSWV3vHYftyw
	6Gl0tWHkOYWmLrSW0CSVf+/jqxoz1PfXXcgstXTdc1cvb1Vg4ihEFRch0dF1f9Wzi5oMzP/VwKb
	g7xlo7MN57i/fazgNNrcYJS4pzKiY3np3HR05rTgd0nDB9RGs5sXzu31J+hVku4x1tdBE1mw/Gu
	45mK9k+bt33tCxgG6gHWxdOuKE6vAeBaF39qQLvhyCqT2g2zkaU+MRVlT4ENtPN1Hvew2d4m3Ep
	6TXtviLMaStY79+/N/my6yif1SAsRfLT45cS6BicadQvjI9u5/HkhZYSc+QRVXF2kUlxi0qQEvO
	w6yRYNCtU=
X-Google-Smtp-Source: AGHT+IH1dCg/Vopa+r8ETWLC9NkVHXoxO4CLn1fO9o8AVkCKuf1qH/S/uF6LR0EbPhmFMKiZK8AYeA==
X-Received: by 2002:a05:6000:2283:b0:3a5:2e84:cc7b with SMTP id ffacd0b85a97d-3b768ee046emr5047321f8f.11.1753342155290;
        Thu, 24 Jul 2025 00:29:15 -0700 (PDT)
Message-ID: <6fdd359e-4950-46de-98a7-7ff402a56239@suse.com>
Date: Thu, 24 Jul 2025 09:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] xen/console: introduce domain_console struct
To: dmkhn@proton.me
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250723001116.186009-1-dmukhin@ford.com>
 <b819d729-8533-46a5-b2a2-480a70cda556@suse.com> <aIEowjUsuWfwqSzX@kraken>
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
In-Reply-To: <aIEowjUsuWfwqSzX@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 20:24, dmkhn@proton.me wrote:
> On Wed, Jul 23, 2025 at 05:10:04PM +0200, Jan Beulich wrote:
>> On 23.07.2025 02:11, dmkhn@proton.me wrote:
>>> @@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
>>>  static int cf_check hvm_print_line(
>>>      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>>>  {
>>> -    struct domain *cd = current->domain;
>>> +    struct domain *d = current->domain;
>>
>> Why the renaming? (Iff any renaming was needed here, then please to currd.)
> 
> It was requested earlier:
>   https://lore.kernel.org/all/1ac74dd3-e0c5-43e5-9eed-c1a2cc17d068@suse.com/

But there the decl was moved, which isn't the case anymore. And yes, I should
have asked for it becoming "currd" there, not "d".

Jan

