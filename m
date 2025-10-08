Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2387BC55ED
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 16:05:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139762.1475012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Unb-000816-26; Wed, 08 Oct 2025 14:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139762.1475012; Wed, 08 Oct 2025 14:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Una-0007yk-Uy; Wed, 08 Oct 2025 14:05:46 +0000
Received: by outflank-mailman (input) for mailman id 1139762;
 Wed, 08 Oct 2025 14:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6Una-0007Ym-AH
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 14:05:46 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfd919da-a44f-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 16:05:41 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6394b4ff908so12402833a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 07:05:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-639f30ad48csm82376a12.4.2025.10.08.07.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 07:05:40 -0700 (PDT)
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
X-Inumbo-ID: dfd919da-a44f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759932341; x=1760537141; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5QaEVUNAD9UR6biYxNxxTVOTuaCnccgxtmxKkYgrgac=;
        b=WJPeBwTh0S47UOiTmBM4v5nBAk1PlAqBsqAiJTvrD/BPBcXHItOZgJkE15MzxGAHvB
         D0g4SQlhQDoDX366/jpmThyON9kfuye/8ytA6Ii4sl2sUDG3s9zmjy1NH3hHPL5WccUP
         EnUevm0xm39r+HxyjBGFDB9ttBb7OWyiLmYIQT5AxG56vTFEXeLIRP96p62b2Br90Rlb
         LZkb8TiBqf/q74mlgtIWVPKw8Zcgtr/PNIuaZ1uNwP/2aTLTLS2QRAhLRrqPqdUbnRa3
         0JQ2BDvlJh8a8bxU4LJhF18jWxLsbTSjxDqdtQiSYY44eXM2UJhPFhcIugXOuy/QlGDI
         jLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759932341; x=1760537141;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QaEVUNAD9UR6biYxNxxTVOTuaCnccgxtmxKkYgrgac=;
        b=HTovZgEqS0jChaf14lk0x429+jtQbAHVs6Jk3LgTYnmGY6/8vz/qTmqAV5DZQfXPy4
         Du4HQ4zw9LpWP6pXzzn4JYLBgUw+bofN9Agn9zXK7AFlMoZlONvCX5xOH0az1aE6DHdc
         bg2xKV7Ex3DF9NTmjVZlZZjwq76btlYp4VhPfKmcDw8LspeXNzf1vJBwALCIYsqzonOb
         g8SdlfOLIjweqN0F82n8V+aHyVB4yZqc5a0sv/4JfbZZD36AveDki1QpDmIMWwZGf4tB
         z5WAxZasBWTmTYaMWsw382au/2cNIzra6pPoCOZe60F/3DyHaeoO5z9FMQMJBYAwN1ge
         5Ydg==
X-Forwarded-Encrypted: i=1; AJvYcCXDS43kw/O38v3vvAvvIz1FRc+CvZsUBNWPjcl94exa1JhS4YIKRENuGLS5SWH60owStx3TXSz1pJ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6T12r3lCPoiOKO9ohoujHEvlzhRKOvH4iAVK1v+B/lcVHWDfo
	mOwjfabcPxcFmjNnycOnMbia/h9YXQ6bshPybEnVGX/2PF1Kdnu89aQ2G2FlYE97Ig==
X-Gm-Gg: ASbGncuK8WKkRILodSiM42hW5/cYq6aRoBYBG1npXRKxZFe3Ykew0KK5a/ny0vjx+x5
	zttVJOgBhnuGOh/WMxZshH2qhlKjOgVXSOFT6D4N05+tWYL2gblYfJqMHBG/wp87nZmUzduSmGq
	xmWMT6LHt1mwGpQzBu+jm3Mr7J++l+dU0G2J7uos5AGD8D8PotW2JmVI1VSor5napjA5Gkv0nvG
	5M7+th14A/7izHYf/e8YhbjxxX5b52f+pkFE4llYT04SD6VLJzgIl2HqZEZhN2Y6R/YTYt+l6dW
	Mn/NvVIz5H4c2ZQfWEb5WCVFa0sdkh7lcVy8qy3oaLY34fBkcj6Cm8UVHjCbw5NG7amBvYK/wb+
	XCE1Zy6XKzMmXZ78nyiDw32tzncpvsM1rzXzL+yEaMOlLyvsy0OtpvGxk5Nnu/PX6IM0wncftYY
	NzJpu2O3CGLLp4ug8B/03ebR0KtmNHnn8=
X-Google-Smtp-Source: AGHT+IH0HSpq9tg294+quSfHy5oIslkkxYOeixY6D0E+GkG5c8hA0lnyqfdIVySjkdYZsqurrsq7wA==
X-Received: by 2002:a05:6402:1e96:b0:62f:a3ae:ff0d with SMTP id 4fb4d7f45d1cf-639d5b8f206mr3207025a12.14.1759932340877;
        Wed, 08 Oct 2025 07:05:40 -0700 (PDT)
Message-ID: <f92139ba-b944-495f-8057-07271f3f7b17@suse.com>
Date: Wed, 8 Oct 2025 16:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 1/3] x86/vLAPIC: add indirection to LVT
 handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com>
 <e8fa4e2e-d788-4dcc-b1b5-9a3e0a70ef49@citrix.com>
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
In-Reply-To: <e8fa4e2e-d788-4dcc-b1b5-9a3e0a70ef49@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2025 15:04, Andrew Cooper wrote:
> On 08/10/2025 1:08 pm, Jan Beulich wrote:
>> In preparation to add support for the CMCI LVT, which is discontiguous to
>> the other LVTs, add a level of indirection.
> 
> It's not the only extra LVT.
> 
> AMD have Extended LVTs, which are necessary if we want to get virt-PMU
> working.
> 
> https://sandpile.org/x86/apic.htm is a recent addition which covers all
> of this.

Hmm, yes, but these will need taking care of separately anyway.

>>  Rename the prior
>> vlapic_lvt_mask[] while doing so (as subsequently a 2nd array will want
>> adding, for use by guest_wrmsr_x2apic()).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm afraid this introduces a vulnerability.
> 
> APIC_LVR is a toolstack-provided value.  Nothing bounds checks the
> MAX_LVT value in it AFAICT, and previously this did not matter (from a
> security point of view at least) because the loop bounds were constant.

Oh, right, I should have thought of that. As you don't suggest anything,
I'm going to simply add a check that the incoming value matches the one
that's there already. There will still be a quirk due to MCG_CAP and
APIC registers being loaded separately, with no defined ordering between
them. Within our current infrastructure I don't really see how to deal
with this kind of inter-dependency.

Jan

