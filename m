Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A42B3939D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 08:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097494.1451780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urVlg-0006n6-Tt; Thu, 28 Aug 2025 06:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097494.1451780; Thu, 28 Aug 2025 06:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urVlg-0006kZ-Qx; Thu, 28 Aug 2025 06:05:52 +0000
Received: by outflank-mailman (input) for mailman id 1097494;
 Thu, 28 Aug 2025 06:05:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urVlf-0006kT-PA
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 06:05:51 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c276459-83d5-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 08:05:50 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-61c325a4d18so909690a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 23:05:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cea8ff3dbsm10990a12.13.2025.08.27.23.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 23:05:49 -0700 (PDT)
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
X-Inumbo-ID: 0c276459-83d5-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756361150; x=1756965950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4AaCWcjcp6rpMsw1zo35NoV//+IQAapL68T04uuZTgc=;
        b=JQXq26jFZJxXIB4sDmm03Nhr1MPTu3f++cMGjTq6O2q2G3YEuda1g0Xb0gLkUP7TSj
         Fa4Dru2+ewSi9ZHI3YmbL67Q5Ef8Ms82taEcqz+/gpJRB7Pd7s/fqoQKrN/e+75TPSYs
         fgDCjKDa9xUdjq8rFNLclpudWfkmsYIb91ZQrmaEoH+EMTnFQHbuYFBtcA4WJZBvfidL
         C4nru2puroc8uC8wwADadBATw1thXb0Hgmjx1IuNY5atxIQKL8j2h51hqfVLSrZdgY9u
         AVmKHeXCh+4EjmBqgGIkVycLrYkEkuaYp3iWskSq9Mj9vU4Ik+X00muXay2MzXi8tYwt
         GV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756361150; x=1756965950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AaCWcjcp6rpMsw1zo35NoV//+IQAapL68T04uuZTgc=;
        b=DozZ4dZ43xx7evJIVXBqbY2oU3F4DUxYtu2tSjxcRixiu4cVbO0S8bq268CIMvG/Bu
         QV9gUwArKotfjR6c7qE6xkZxiFTyaWVvx6T6dspY/v7Fbp/RjlY8HtNY4/xW/MNm/3L5
         jjSlTBx4OFTsUMvVKb2OFRZjMd25cEm+AxAtMN9hHHZmugqCKpJviP+VoRqYOMVjql0P
         Q76S1GYfAivApJfjIxaiuhWbqKXusLsTIU5hoS51Zgja2wvsgot11tnOkRusXSmjjOjE
         VmetIdSOYZpupIMIpB5X6c5PVH1gCP8iMd1uFgMm+jleQ3vihKQABdYQ5KqFmpN+IWlb
         0xPw==
X-Forwarded-Encrypted: i=1; AJvYcCUkfsp33r6iAJnvDTcu3V7j8NqRk0gEaMABAQ0Nlkfth8bvNrrfTKSAs+rOMamOmJilcHEQlzurE80=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+b/IQzJVBvEW/E+FdCLqbevb1zq+4HdDtz68i1IKGg/WAUurw
	rgZUG/1V/IM9eZ6vH7GWEbhmde11Z8rG3Jq2+fa0ht72T1xer55uDwt3Oq+r6Ygyhg==
X-Gm-Gg: ASbGncsWpy34HJJMEO4Fdbwy1pzKgRrL91UMfyTtlf1wkBUgPiXuquwsTCFjZejHGwG
	5Z5KGsAPmeDzgsBUJyOp5l/THuP4l+kniSoX/AofiwqzoQQQyayRZOYDOclMzWBAhMguMgnl7YT
	tT8U9jseexHLTEsBASsFAkMDrLAP9R5r0F9VxIQtgT2Em9lUuqY8Yb1EhcH4MbuzIB9fIDLvNQV
	Ea17Z7I61nDit9ldvRLSrTW852N/0NvBhY57/U7vswl5DyTNAQOUTwM5O4xlF4qkbPFLVP9WWg9
	brO3aF1wGycWIyOXonTaMAJ+ldVLHdMyJNBfR4CalpItYgWCmVDFgMxR7Qd+sAAQvB893rl3ahS
	DC9tLjsa04Cfe+5AyxQdk0uiHQewr4/V5OycF/NyKUWFooFYRyiz6xOSwDSpbNmJfMN9zoHS9df
	tSwXbjwFIP7xoeyZQHA9SHEgFF7Itc
X-Google-Smtp-Source: AGHT+IGuRz3RSQP3OlNGRCImrv/fhgzbXRllyn+LT3Tv1mgr/VWxzZlW0jIBWb+yd4lSJupZoOBPlA==
X-Received: by 2002:a05:6402:84a:b0:61c:1a89:5d71 with SMTP id 4fb4d7f45d1cf-61c1b7056d2mr16386856a12.36.1756361149728;
        Wed, 27 Aug 2025 23:05:49 -0700 (PDT)
Message-ID: <ab9efe09-9e53-4ab0-8259-3e1eff4efa1b@suse.com>
Date: Thu, 28 Aug 2025 08:05:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: except Dom0 from setting PoD target
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c98069b7-ee38-4f06-bebd-25396f2a210a@suse.com>
 <c170f613-c42a-47f7-aae2-3e5bf1238a1c@amd.com>
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
In-Reply-To: <c170f613-c42a-47f7-aae2-3e5bf1238a1c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 03:08, Jason Andryuk wrote:
> On 2025-08-27 01:53, Jan Beulich wrote:
>> Dom0 is never started in PoD mode, and hence it can at "best" do harm if
>> we try to set a PoD target for it.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

> Did you observe an issue, or just notice this when inspecting the code? 

It simply caught my eye while investigating the ballooning issue I sent
a mail about.

> If an issue, please add to the commit message.

I would have, sure.

Jan

