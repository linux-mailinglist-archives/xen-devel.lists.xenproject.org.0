Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2496882ADF9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 12:53:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666212.1036686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNtcx-0001t1-15; Thu, 11 Jan 2024 11:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666212.1036686; Thu, 11 Jan 2024 11:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNtcw-0001qt-UN; Thu, 11 Jan 2024 11:53:38 +0000
Received: by outflank-mailman (input) for mailman id 666212;
 Thu, 11 Jan 2024 11:53:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNtcv-0001qn-PN
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 11:53:37 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c92a428-b078-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 12:53:35 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3367a304091so4585095f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 03:53:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g1-20020adfa581000000b0033680f7be5fsm1047428wrc.87.2024.01.11.03.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 03:53:34 -0800 (PST)
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
X-Inumbo-ID: 0c92a428-b078-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704974015; x=1705578815; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2Qwshb/jdI8nndp0vxvVsLQ84pK/8z5YopHc17NBpA=;
        b=RIJnGDo4piJ6lGZ27Tb6/xMEXCnzpfI4f43cpn/4F7gFCxmGbsuSS5OiLrVj+NYgJD
         nQIV3PnM8cXk+l3PWt1rjfpxrgFRHgQ+UVwq9dwtP75PLNFzemYP4+A1h2hIzVetJCo1
         fwAwNzt92oh0dz1nWYGCq/oO3hmt9PF6v72BvGA6gxCYzYtsl7IiPtEmXpX8nhWcZeUQ
         npAPHFfhOGz6QkwD0AXso3lIAHgVlMuiuUm4P3/6Y39qnKvrtgBnK1IRJNi1t7KX+p9d
         lMAye97zJWUwI79quQnWv6L/+8Va3pIYuhxIQebhrVl+QOZD2mw33fZ+svybi8qwgY7s
         9Suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704974015; x=1705578815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2Qwshb/jdI8nndp0vxvVsLQ84pK/8z5YopHc17NBpA=;
        b=BB1MjXJEGkF6AT5NiJoCRca7iibD55ch9pBo8S0aJJYqCNyNOj5g3LfStSlasqwLzU
         fHcyprX2uVo+gdFMm/qnNS3ogaLaP8EhZR8OrzYfeYUW/hAVwtija3+Gc0UbXOLQRk4q
         r2Et/yXR8ll7A5ypkdGcjPtSM+o7ER09H7mPwvAL8QIF+02rL6etOmfIz2d164EYY2z1
         jPgreq808ewicyg4eZVHJJ05lR2XCH8GoxQ+5jPT1n2cXlZUq6WqlUz3c4+i1bBYEt4v
         8E/OcSZd2r3uAFMWDId24zFB8VWMJP2hBalPgiuHdMjvRiWsEiTLGT6Ohfg7K3c2VsD4
         0LcQ==
X-Gm-Message-State: AOJu0YzgPDDHb9P5JQJElc5Jj55ltDJ+UkY37aSmkf9l30j9+wRX79XB
	uL2g8JiZMHViHNHDrBjqrVr9+8NAsgeb
X-Google-Smtp-Source: AGHT+IGXmlv4l4AhMzkS7nHpfSbapLln2bZaWSEwBwbnP2ifpW2tERbNtOZ1WetZ8jL1Cro6IkenoQ==
X-Received: by 2002:adf:cc89:0:b0:336:6fa9:518 with SMTP id p9-20020adfcc89000000b003366fa90518mr347941wrj.17.1704974014972;
        Thu, 11 Jan 2024 03:53:34 -0800 (PST)
Message-ID: <c736e4d9-5262-4adf-9e74-9b1be5ab13db@suse.com>
Date: Thu, 11 Jan 2024 12:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/22] x86: add a boot option to enable and disable the
 direct map
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-12-julien@xen.org>
 <fc70f967-34bb-9569-f514-7a3208e746c6@suse.com>
 <bc989828-69b9-4919-9ff3-fdd53fb2def1@amazon.com>
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
In-Reply-To: <bc989828-69b9-4919-9ff3-fdd53fb2def1@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.01.2024 11:47, Elias El Yandouzi wrote:
> On 22/12/2022 13:24, Jan Beulich wrote:
>> That said, I think this change comes too early in the series, or there is
>> something missing. 
> 
> At first, I had the same feeling but looking at the rest of the series, 
> I can see that the option is needed in follow-up patches.
> 
>> As said in reply to patch 10, while there the mapcache
>> is being initialized for the idle domain, I don't think it can be used
>> just yet. Read through mapcache_current_vcpu() to understand why I think
>> that way, paying particular attention to the ASSERT() near the end.
> 
> Would be able to elaborate a bit more why you think that? I haven't been 
> able to get your point.

Why exactly I referred to the ASSERT() there I can't reconstruct. The
function as a whole looks problematic though when suddenly the idle
domain also gains a mapcache. I'm sorry, too much context was lost
from over a year ago; all of this will need looking at from scratch
again whenever a new version was posted.

>> In preparation of this patch here I think the mfn_to_virt() uses have to all
>> disappear from map_domain_page(). Perhaps yet more strongly all
>> ..._to_virt() (except fix_to_virt() and friends) and __va() have to
>> disappear up front from x86 and any code path which can be taken on x86
>> (which may simply mean purging all respective x86 #define-s, without
>> breaking the build in any way).
> 
> I agree with you on that one. I think it is what we're aiming for in the 
> long term. However, as mentioned by Julien in the cover letter, the 
> series's name is a misnomer and I am afraid we won't be able to remove 
> all of them with this series. These helpers would still be used for 
> xenheap pages or when the direct map is enabled.

Leaving a hazard of certain uses not having been converted, or even
overlooked in patches going in at around the same time as this series?
I view this as pretty "adventurous".

Jan

