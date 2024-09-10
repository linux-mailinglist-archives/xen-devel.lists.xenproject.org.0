Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9191197297C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 08:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795008.1204081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snuKM-0006s8-Tw; Tue, 10 Sep 2024 06:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795008.1204081; Tue, 10 Sep 2024 06:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snuKM-0006q7-R0; Tue, 10 Sep 2024 06:26:14 +0000
Received: by outflank-mailman (input) for mailman id 795008;
 Tue, 10 Sep 2024 06:26:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snuKK-0006q1-JN
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 06:26:12 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 901b246b-6f3d-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 08:26:07 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso385935566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 23:26:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cf4a45sm431046866b.180.2024.09.09.23.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 23:26:06 -0700 (PDT)
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
X-Inumbo-ID: 901b246b-6f3d-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725949567; x=1726554367; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I1JtKTtW7Xik9xcjv4VPHrbmFdPbVL/w7iRzHUBjHIA=;
        b=Tdfv52sSwQiUY/TGfuALBQ43HXHf6jaPvfpTPwJSHm1xK79r+Fv8Nd+eE7a5SKEk2b
         5e45S3zCGo6tpsexblfdYb0q88k3KnnR9VDvb8vdq8xTSwrmm0KXmVjTbKE5Q6iCKuYR
         UMIr7o9SoKXjLVUSyesiaYH5ThG/kP4WIiUvKbtycUjlw4Ynk/nRtvLPVzR0Ih8WQzwh
         akwQfUfOYnMHh8Nb7eCmkbAgNI62OpTc+wnwdVXm/EJj0EuGdzI+BrziAAoTEuZOkS58
         SPHgW1kApfj/sfAyRgJbFNVnGKTN+CmBr7tVNlJDJUvdHfAEZo0ug+Zf8/5zJ4drPu66
         wWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725949567; x=1726554367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1JtKTtW7Xik9xcjv4VPHrbmFdPbVL/w7iRzHUBjHIA=;
        b=C4tFolJ/8g9c1Pn/eqhUENMUMK7fwci6U9Dd9Eehcc9IRbfzovf4LTeZ8+R/R94U8U
         ATwDoSK9OMQGUVqrBux9hUqKO6O4/3iXIv9lfabTlzLr6e9qXcRslnHCWoRTaMxHMyjy
         W76ESxy+SNWeEZn3I4BqO8Pu/jL5NPYGp9tBC3Si8HwRFOLkUX+95onKr681M3Xbb52+
         T3Cyo5U8HPgcgzlFx4ZiMdKXh3hGe+Q4UBTIX1AdKpLrCs6btrPnywoRlkXoaHrVjHou
         2fSU52hdYeSp4Jrqkb1Zg3HVVp10mdyH33h16kWI30/+4h7Q6mlU4hmYVjjF2glh7y/C
         03Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUh2kZfsgxp3lCaTfAuEr8cE3kec7CeDz7lAGDAq1L4vkvLlXVwi4g4+F0KlbYHxp0WTC9OTXg0V1Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5YQuISJ0JzPME250I1ooMuQEHDecIzUx3bhr+y6/ItYWQNyEu
	OanEFwhHvQSeMeuvZxdGxcVOjVIgbRexhhWMr79TGAUIRr9jA8ODPVRKOx4zvQ==
X-Google-Smtp-Source: AGHT+IFDqVgb5zeZiZe0X9GCWeXMdzsgD4lQjXEJx/2xpbe6P7DFaeNYCSl5J44vDFQa2hFE1q+A1Q==
X-Received: by 2002:a17:907:3f87:b0:a89:c8db:3810 with SMTP id a640c23a62f3a-a8d1c4d5b40mr1320735266b.30.1725949566690;
        Mon, 09 Sep 2024 23:26:06 -0700 (PDT)
Message-ID: <c10ce0ba-dd51-4d3e-8ab9-62ee1b39cd31@suse.com>
Date: Tue, 10 Sep 2024 08:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: deviate linker symbols
 for Rule 18.2
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, xen-devel@lists.xenproject.org
References: <e3a9c3268685562ae557248d6e76376579d99715.1725714006.git.nicola.vetrini@bugseng.com>
 <b0599929-d6f7-48f8-b93c-4b4882225da9@suse.com>
 <alpine.DEB.2.22.394.2409092141570.3672@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2409092141570.3672@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 06:46, Stefano Stabellini wrote:
> On Mon, 9 Sep 2024, Jan Beulich wrote:
>> On 07.09.2024 15:03, Nicola Vetrini wrote:
>>> +   * - R18.2
>>> +     - Subtraction between pointers encapsulated by macro page_to_mfn
>>> +       are safe.
>>> +     - Tagged as `safe` for ECLAIR.
>>
>> This one is a result of using frame_table[], aiui. Alternative approaches
>> were discussed before. Did that not lead anywhere, requiring a purely
>> textual / configurational deviation?
> 
> During the last MISRA discussion we agree that this was an acceptable
> approach. What else did you have in mind?

One was to have the linker scripts provide the symbol. I think there were
one or two more, yet I - perhaps wrongly - haven't been taking notes ...

> In any case, keep in mind that
> exploring options is a task in itself and we could use our efforts on
> reducing the numbers of violations instead which I think is more useful.

Sure. Otoh quickest is not always best.

Jan

