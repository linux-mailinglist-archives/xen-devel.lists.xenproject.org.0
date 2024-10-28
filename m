Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15E89B3666
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 17:25:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826838.1241262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5SYP-000436-5G; Mon, 28 Oct 2024 16:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826838.1241262; Mon, 28 Oct 2024 16:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5SYP-000405-1v; Mon, 28 Oct 2024 16:25:17 +0000
Received: by outflank-mailman (input) for mailman id 826838;
 Mon, 28 Oct 2024 16:25:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5SYN-0003zz-SU
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 16:25:15 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35a98ec5-9549-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 17:25:13 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4315baec69eso45935005e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 09:25:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b55f484sm144869175e9.13.2024.10.28.09.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 09:25:13 -0700 (PDT)
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
X-Inumbo-ID: 35a98ec5-9549-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730132713; x=1730737513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MLdkZqTlpm90UKGAVLiZ6vEM8562tFnMZjVYM6GMSYI=;
        b=Krmv/iR10tIYFRrqZQesGnpIalRoS8UOrwew1I0ZbiNnUI0t+ED9bjNWZFLPVdkwgO
         ivazlpeYe+d0/s2pO22uKweCbmVHVrmFZlvQPIs9/EQwkX+d12AUYW0umJiXeq0OUPLq
         Wmz5dsRPz/pYHt1GgxZFND3sXaLNxjl//ZioVLcx4eR6/48ZMWGwMV92i7WAD2GbwVfk
         iyadXop44r2rb7Y5XE6barePdTgpVg56PUx5/zOqUtr0B95bxlCsJqNpqPk8Wa+MFxS+
         GRkUmjrj6Pr+ou6Wy95dnCBx1AtRHXN0v0ct3/W/aiCeLcuL3eIoFZXUQhUdjvBaJRNX
         r8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730132713; x=1730737513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLdkZqTlpm90UKGAVLiZ6vEM8562tFnMZjVYM6GMSYI=;
        b=pPhDtj/9U73ZCQrC5GxV6iE0xX5liVAQbtoRLik6OfGrJq8vsIEGD3zn8M/TS4bPrY
         mTOcLbIRQTvq3+cBf6oxICOZvrfhS424KOMcWkPd0kQQr/tws28xOu2NXDdrPrevM9Gn
         s78h5pxboPgj3MNJn2JwNHmZk7WSEsmuAKH2kqeMChbK2m5lciPq3qzCe7Gbg+qs6Czm
         AfcTC3A9hDuP7SWWZTC8HwIBNBfLR6ycavZRupRDDt9kXdM8/1ZbCl+6JWLAECar92S+
         I2iapDdbU285EjJ67Mx964ZvpvcInueO2JwBaAu7kPaP0XXxaH81ppYfHAh+axg/Gml1
         lcWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV61JN+XkCpB9eu/F5E4ovzQNekAryqrOh+JWc2Q2Mc3gnPOISD3J6RlXJknxuZiTXaeGc3P/CtBLQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDbMs6zGqlt7chaPbfFMtv1Ct3s9CdGsCmQqz6l4h6R+/hnaby
	1uSrNmDUCxV4bdP4frjsLw4vZsUj0QRHUeiQDWi2S+/Ak7vDinGIkJ8f0prUqw==
X-Google-Smtp-Source: AGHT+IElf6gPPCBYaUoiZKbSCDGJDsQK5QYxizwSnWTHOHKg90Y1KJd5jcagK7Y7Sy8/496mhj8d3g==
X-Received: by 2002:a05:600c:4ecb:b0:42d:a024:d6bb with SMTP id 5b1f17b1804b1-4319acb8145mr60687845e9.20.1730132713267;
        Mon, 28 Oct 2024 09:25:13 -0700 (PDT)
Message-ID: <aab91022-5115-4af0-8f9d-569c63a296bb@suse.com>
Date: Mon, 28 Oct 2024 17:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] earlycpio: constify find_cpio_data()'s "data" parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b2fdb048-cfc5-4f61-8507-bf8020e02132@suse.com>
 <764c0116-88ed-48af-8e53-f2a0f6e850a3@citrix.com>
 <c618e09f-b88c-45c8-8cbd-8aae82891c6e@suse.com>
 <ecd11958-2ce8-41fc-87f8-7b6b090c74b5@citrix.com>
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
In-Reply-To: <ecd11958-2ce8-41fc-87f8-7b6b090c74b5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 17:18, Andrew Cooper wrote:
> On 28/10/2024 4:12 pm, Jan Beulich wrote:
>> On 28.10.2024 17:07, Andrew Cooper wrote:
>>> On 28/10/2024 4:03 pm, Jan Beulich wrote:
>>>> As with 9cbf61445cda ("xen/earlycpio: Drop nextoff parameter"): While
>>>> this is imported from Linux, the parameter not being pointer-to-const is
>>>> dubious in the first place and we're not plausibly going to gain a write
>>>> through it.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> You haven't tried compiling this, have you?
>> Of course I have. Is there any subtlety with compiler versions? Or what
>> else am I missing?
> 
> struct cpio_data's copy of this field is non-const (which you keep on
> noting that new compilers will object to),

New compilers? I'm afraid I'm missing context. With gcc14 the patch builds
fine. I didn't try _older_ ones (but I see no reason why they might object;
see below).

> and you can't change that
> without breaking the build in microcode.

I don't need to change that, "thanks" to

			cd.data = (void *)dptr;

casting away const-ness. That is - compilers ought to be fine with the
change; Misra won't like it.

> Nothing of this form can be taken until the constness is consistent in
> microcode, after which yes it can mostly become const.

We can move there in steps, can't we?

Jan

