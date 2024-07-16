Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C020932125
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 09:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759369.1169070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcYh-0004L6-77; Tue, 16 Jul 2024 07:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759369.1169070; Tue, 16 Jul 2024 07:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcYh-0004J3-4S; Tue, 16 Jul 2024 07:25:11 +0000
Received: by outflank-mailman (input) for mailman id 759369;
 Tue, 16 Jul 2024 07:25:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTcYe-0004Ih-SO
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 07:25:08 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 873a4674-4344-11ef-bbfb-fd08da9f4363;
 Tue, 16 Jul 2024 09:25:07 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eee1384e85so31583071fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 00:25:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc4e477sm51519645ad.265.2024.07.16.00.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 00:25:06 -0700 (PDT)
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
X-Inumbo-ID: 873a4674-4344-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721114707; x=1721719507; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iyI/YOIt7x+RxZZWiRpLZMOgJr52jEcincsGQK+M8Lc=;
        b=DX7ssWSWIQzGDHnWg+rtB5IhxUAvtKLhltjCBuHzbFx5SXTfch9IxXvRWmOVLTaLXo
         S4aabwknHnj8bRsMiu5gyfqEbm783mKocS11zSTrXKv13NPg2hwI8fHKS10ricneR1vW
         vPeGaeRqmsM6I48NTPgohlzP5DCMVPnsdsx9c3QZ54lu6L5bTOlUv212ZNqUVrIg06vp
         tO9fFUMiM+HbqNdlZHLHX1fp3srB2u5ITQ3ulgnRgovl+PyNHZUhb7xeMHiuAQp8sDpz
         ESijRXuPVn51NB3OTjzj+ag2DwUyABsake2OusnZjtfJ9uABuvfosK6th283PChehmcQ
         PLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721114707; x=1721719507;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyI/YOIt7x+RxZZWiRpLZMOgJr52jEcincsGQK+M8Lc=;
        b=C5nlD+jVJbblpbS9vCEjB3hIx1OJwI4ZHVmgk4e4Jn0l2N6an/1/MV3rQ2URYoMnEz
         qF97uJ8nzJgGaxtcJUXoHoMTKKAh0GAzdF4I4A+1zjHpsUm9z21+DyVB0sImsGU6VGIx
         5DXktbxqIlC6bCGuwQdRrfEfYFVMSh2uvNspSnFuHQyUIUpLP7xknepYqGdqnA0FZo9n
         //k4nrB8ygoTyhqYiN4tE/vf4cCArEldaanMG6AwjgQNoZCS6SHJTB6YbffmDdRkJxV9
         UG0uAO0b1fLCbe1w4XBPjdxsinas0uDNSOxgWoxMiFyX4VUaW8Bz6dObToaHN4EbSEUT
         COqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtUHQ3OVUcMnmCPeZLo7Tkb2Aax9WWHl79yr6ojjuSvKYLhzhuBBo852CY4ykXBsenDJlp9c5GZAfmhUOS/9j8sN0+CUdJa8+PIL+BVS0=
X-Gm-Message-State: AOJu0YykxcutIzXu9IUrD9mgbMvmucxGko/e8wWYpcyHsJMdJtcU3bCL
	3hgi46zvaI5K3/kFM9lRlzeAcdtKBeQryiw/vK3uTbEg6tb4bocZcRT2Ksy4kg==
X-Google-Smtp-Source: AGHT+IFShOmI0NiOZLvbVDy/41uJU5MOVHqZ8JYUNx/LjAdEY9EeGaW6k7Xa6U+4+KAp0H8z4f2bZA==
X-Received: by 2002:a2e:91d3:0:b0:2ec:403e:6314 with SMTP id 38308e7fff4ca-2eef4151d75mr10341801fa.3.1721114707250;
        Tue, 16 Jul 2024 00:25:07 -0700 (PDT)
Message-ID: <94edb2c8-1d40-49c1-b29f-151418eb5c11@suse.com>
Date: Tue, 16 Jul 2024 09:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION
 inconsistency for release candidates
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
 <3b188f84-50f7-4e13-bcde-1d6076e5cc2d@xen.org>
 <423412a9-e969-4126-8e39-7e77e67d2fd8@suse.com>
 <884ea922-946c-4344-ab29-6f2eb4be69f7@xen.org>
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
In-Reply-To: <884ea922-946c-4344-ab29-6f2eb4be69f7@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2024 09:22, Julien Grall wrote:
> On 16/07/2024 07:47, Jan Beulich wrote:
>> On 15.07.2024 18:56, Julien Grall wrote:
>>> On 15/07/2024 16:50, Andrew Cooper wrote:
>>>> An earlier part of the checklist states:
>>>>
>>>>     * change xen-unstable README. The banner (generated using figlet) should say:
>>>>         - "Xen 4.5" in releases and on stable branches
>>>>         - "Xen 4.5-unstable" on unstable
>>>>         - "Xen 4.5-rc" for release candidate
>>>>
>>>> Update the notes about XEN_EXTRAVERSION to match.

When this is the purpose of the patch, ...

>>> We have been tagging the tree with 4.5.0-rcX. So I think it would be
>>> better to update the wording so we use a consistent naming.
>>
>> I find:
>>
>> 4.18-rc
>> 4.17-rc
>> 4.16-rc
>> 4.15-rc
> 
> Hmmm... I don't think we are looking at the same thing. I was 
> specifically looking at the tag and *not* XEN_EXTRAVERSION.

... why would we be looking at tags? The tags (necessarily) have RC numbers,
so are going to be different from XEN_EXTRAVERSION in any event.

Jan

