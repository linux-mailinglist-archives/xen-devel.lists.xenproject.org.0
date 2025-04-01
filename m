Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB141A77DB3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 16:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934482.1336172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcc9-0003wR-Na; Tue, 01 Apr 2025 14:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934482.1336172; Tue, 01 Apr 2025 14:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcc9-0003ub-Kt; Tue, 01 Apr 2025 14:29:17 +0000
Received: by outflank-mailman (input) for mailman id 934482;
 Tue, 01 Apr 2025 14:29:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzcc9-0003uV-1m
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 14:29:17 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0057f51-0f05-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 16:29:15 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso38264935e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 07:29:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82dede98sm200242165e9.6.2025.04.01.07.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 07:29:14 -0700 (PDT)
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
X-Inumbo-ID: b0057f51-0f05-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743517755; x=1744122555; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ad4SficZADWClmDSEwIBfwJ5WOoljiHtU472VMlnQCQ=;
        b=PrJRAlOpzM0t175cP+JMUiuXFng1jcsCHwPoaJ8Z5Fy0SbBdu0V3XzS8JOvmVQYBID
         mo8vlwhOmKiSOPGYzSdmMv/uZWzfDDT+SzcI2z6F+tsRYi9N44MytrbrcEVtA2biaPfH
         O1C7sU+PNesg4jY0Bm13HC9pRWqptthxtVUQ5bcuw+VsahmTHo7MNIB+TYbWP54yWHyT
         WPGVdyHnVA3boR27h2c4bwJDFGeczorjGY05uDBFi+1/xKmn/0KFRgP9p5lvvVdOSXRW
         sLCEWIWEWV/40JfZXxJ9Shu/zEzS9VUldkquFG9XEL9IFfCvaD+PRyTrQ7Pp/DIS17KZ
         2Nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517755; x=1744122555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ad4SficZADWClmDSEwIBfwJ5WOoljiHtU472VMlnQCQ=;
        b=XKyMi14jtswci/bWK5HIw/oJ5Nf1aOBtaDZSVRJHyK+ZYzyTIt6ul7d1rEe7j9JcMl
         KQmoMgamWBS1XI/1gL5Jm5yRYd33nCppaKeSujH2PpFcvPQMrF/HcEvKGt1dKgzxIfO+
         fijWBVuhBwTyCoZqKEJPrmqnrpDQG8hhQeId+D95w5brQyqmv/AUdAcchCQm+CO3u0Iu
         p+Fl5zsjKwRYChCMThubQbRiNVQqI9eSNarWYIEGivvCX3jug/8CsdGTTGnKJTTgYUKC
         732s1TuTrbUcFL/LptcXOZDOagDLIVi9/KRn4Qr7ZR0WNuuVMxjIL2IBT67LxMQ9OC+J
         uYLg==
X-Gm-Message-State: AOJu0Yxu1G7RlrhRA51n6MjWjEtzcuf+LHvVpOFrSBMEZ5Yf+SQ5ZJhd
	RNeuqimCD6xbSmbYRvZJ9qR45E1YpOOrwC8mMGKDKSKEIeJyiv5AaCgx167Ziw==
X-Gm-Gg: ASbGncv+fCuVOPXO8FmqrfnAz4XRL+M+r/8jy/YPHuuzlhPfIWaCL7sdLLbikN1V4S1
	cfvGOZvcIN0jhqb7T8tVPTIQVBqosFCXkHzb/wgc0sssueQBWCX5rV2v4gMqLTOLiFj6KAXVdMr
	8jDbtiq87t2w9MffnDOKmAJ8//HABtNqvfNT4yxdC3ha3OL+COd5QpCXsed0/EYX3x/YBb8mqub
	y9NJP8MWy+iMKZuyFM6aJXnHNUVjwwLC7sNhynvrxfAfECtjKc0zxTkT1KKa5OuHHcdDrVyinEE
	IC0Ik5qpWLskFwbyviVjjNp+Hr58w8VE9AW/wiA+vOl4egCH26hailA6sBACgBSvF3cGu3mrsWs
	ww2qO31N3q8TSqvS1+JcQ6QRmKtRsrA==
X-Google-Smtp-Source: AGHT+IER3Xw2Q6VoloKAcCUldjcVpP8kK1ilUcoYRmcD96vD3FgrIkuoxsZ+QGKWRUziyZU09PzaDA==
X-Received: by 2002:a05:600c:3547:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43eb06bd359mr1456515e9.30.1743517754661;
        Tue, 01 Apr 2025 07:29:14 -0700 (PDT)
Message-ID: <3b858ed2-7d89-4208-a4c1-e71600897c1d@suse.com>
Date: Tue, 1 Apr 2025 16:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/19] xen/sysctl: wrap around XEN_SYSCTL_physinfo
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-16-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2503281713230.563920@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2503281713230.563920@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.03.2025 01:13, Stefano Stabellini wrote:
> On Wed, 26 Mar 2025, Penny Zheng wrote:
>> The following functions are only used to deal with XEN_SYSCTL_physinfo,
>> then they shall be wrapped:
>> - arch_do_physinfo
>> - get_outstanding_claims
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

With earlier, series-wide nit taken care of here:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

