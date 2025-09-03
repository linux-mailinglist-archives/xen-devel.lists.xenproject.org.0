Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B213B4245F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 17:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108596.1458667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utp2p-0002Tk-Mh; Wed, 03 Sep 2025 15:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108596.1458667; Wed, 03 Sep 2025 15:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utp2p-0002RD-Je; Wed, 03 Sep 2025 15:05:07 +0000
Received: by outflank-mailman (input) for mailman id 1108596;
 Wed, 03 Sep 2025 15:05:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utp2n-0002R7-RW
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 15:05:05 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e836e0e-88d7-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 17:05:03 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61c26f3cf0dso10264724a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 08:05:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4e4d77sm12213284a12.37.2025.09.03.08.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 08:05:02 -0700 (PDT)
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
X-Inumbo-ID: 5e836e0e-88d7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756911903; x=1757516703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r2BF/xXcKol29erf7Ae6jp/+Miz9iZhWqtqkfFCme/U=;
        b=DEK55NdrdlmTAgb7XlYInBu8d+vO67kHh4b66A8Hrfp72y/CK7BHkUdHsBGHY/byK/
         7WjC8HmE7O75tBGW0soBm2XXmPN8LEcfyyYoiraoVsVx7CMw/VU3M6v1Gmz0XRQkQqo8
         z0mH77vnTc3m7aSZ0imx1Qr7PZF1+ENdBg1mdRo4y4MziIsD/IgfSNeawCcSuTbfOfSZ
         oidimjBkbcVEWmRQzMm/KAU+oOSQsruAEhmHRTc3JzlpJG1BoLKoCTsxVxgfU45t55zG
         WfQLkXFQP2UCQlgsUeIJ12YDOhF1emz3Hm6qvD3ExqPHYQkVhOy+8pkooioy78auPEor
         ZYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756911903; x=1757516703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2BF/xXcKol29erf7Ae6jp/+Miz9iZhWqtqkfFCme/U=;
        b=gMwpxH8YKe/fnwyR1nLk8RpSZgfIGAAfLcCbtPmiZW0VwLM0rP9nLq2rRf+rc8bLLJ
         cJfNzpYhrO7dbv8jH0rSrQOssV1xg+sCdLiZdD7W8xRJv/xlEj7YexDTj3z1XkAzyNk0
         3R1/5Fsyza9H7/MdyB69zTGwzoR5TMGcAJbLmlY9w/hIFurmw1664sC09oyoChjoEj9f
         CpaVQ1zzrvl6srf8I5byRl9aTc56KCZ8Mvei5pzccS9FPwApI4Ng5qF/m5g0ntmuPDZE
         IsD1hY+RmYWm4wbunv8Uwauknw4cl7hwJ628Mm0GcEjWuvAw5lJBKq/LGAR8HKYorxZr
         ZroQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG6B+dXkpWwUavxjqupOUi0C5mH3/ksN3SLasGkiu39N2OjsjGoS7f0Gsfy+IqKZq/NBri+3/mhPk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrcPNEC4oFd6ABWkRaMPHuHui4M9vj5EaYng9HX3meCorP9ZdB
	8/+cIR9oKwF9SAuHZ1DH8LhXD+hcGSmFh9GupzEnolikW4uvseJcNsEGreX8PgX/fA==
X-Gm-Gg: ASbGncvq/db1yqBy2ZIsztOYJHZaebPSD7lMY3UGD68DhyICYDmQOQPoGxFz5glUQB4
	60tgR1KRURSQXzNlzfvknPg8BZjy2HlZGcwcZT0qXG7UUgLUFZJzOxy5Fh1ATZCYKecIU9YunnD
	8xhj4dpJCln+U4XFqCTObjU+WxbVVvRmvEPl++XgfectNNNPE6VA5w9r2nZv/9hX2rSQX+rqgdD
	6fylTLUBQNbC8qJ724j5Bh4C+84czqUkByqV42MX7u5QnC+tM3N0L1Or2wsI/5HTXe+fPIchqty
	6EBrWtIp6WFkdtkphtx0U4IIkgouDVKx+83g24TJX4P8VzScXGxiCBZNtpgnYVk2AvXz28Ok8kn
	NEeFcoXB8iMne8dFep2vjUuvO2sJh3uoxrWGgktr9I2qP5keCksVS3xxu+sQDbe+DutLzRkgKyW
	Uy3KxLfvN3x+qRARzADA==
X-Google-Smtp-Source: AGHT+IFT0vNMM7xVCDB94bcjRtJRR0h/b2zHPsluKJ3+gcFdv4w4+nRJu2qc36AdKqcWoCkVrcxeIQ==
X-Received: by 2002:a05:6402:2115:b0:61e:ca25:3502 with SMTP id 4fb4d7f45d1cf-61eca25373emr4266730a12.17.1756911902849;
        Wed, 03 Sep 2025 08:05:02 -0700 (PDT)
Message-ID: <b7096361-f47d-4241-baf0-180a01a3d057@suse.com>
Date: Wed, 3 Sep 2025 17:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 2/3] hvmloader: Update to SMBIOS 2.6
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1756460430.git.teddy.astie@vates.tech>
 <57c674cc364d3b8f4c6d03533b9e2b45728d2c19.1756460430.git.teddy.astie@vates.tech>
 <d422e3d6-48c5-478a-bf76-6aa39492d767@suse.com>
 <fdb2b2d2-a9d8-42ad-b9fc-e99905f5dbba@vates.tech>
 <0190dbe1-4583-49c1-86c1-9bcb57844315@suse.com>
 <f2180c69-49f8-429d-9ec2-ca3233287ef3@vates.tech>
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
In-Reply-To: <f2180c69-49f8-429d-9ec2-ca3233287ef3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2025 16:02, Teddy Astie wrote:
> Le 02/09/2025 à 16:10, Jan Beulich a écrit :
>> On 02.09.2025 15:24, Teddy Astie wrote:
>>> Regarding sgn, maybe we can use `segment` instead ?
>>
>> Why not segment_group or seg_group (seeing how devfn also is an abbreviation)?
>> And if we omit _number there and on devfn, it's hard to see why it shouldn't
>> be just "bus" then as well.
> 
> So overall
> 
>   uint16_t segment_group;
>   uint8_t bus;
>   uint8_t devfn;
> 
> ?
> 
> segment_group looks a bit off compared with the rest.
> We could use `seg` like we do in Xen PCI code, as it is about PCI 
> segment here.

I wouldn't mind that, yet I wonder why the spec says "group". If there's a
(good) reason, carrying this through into our naming may be advisable.

Jan

