Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF7F9C6CE3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:31:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835301.1251161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAeU-0001Yu-PV; Wed, 13 Nov 2024 10:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835301.1251161; Wed, 13 Nov 2024 10:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAeU-0001WD-MU; Wed, 13 Nov 2024 10:31:10 +0000
Received: by outflank-mailman (input) for mailman id 835301;
 Wed, 13 Nov 2024 10:31:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBAeT-0001Vq-RX
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:31:09 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6192939d-a1aa-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 11:31:02 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53d9ff8ef3aso741097e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 02:31:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d54f82cdsm19972585e9.14.2024.11.13.02.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 02:31:01 -0800 (PST)
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
X-Inumbo-ID: 6192939d-a1aa-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzYiLCJoZWxvIjoibWFpbC1sZjEteDEzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYxOTI5MzlkLWExYWEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDkzODYyLjY1MDI0MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731493862; x=1732098662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WWdzEkvn5bsPzgRswN/a2CQn0oCqya+wlbrzBUrPSX0=;
        b=cp0vqrHXdFN6fR+TmQSh6u4SpR1BlRf+eEAaDWarRdNXxh6Yvr7ie+VT5a1/4SntOM
         I8oGnkTYOA33+VptFlQkT3SFk6ZRCKoEWhjHTg8fmS1PTIjdvOT72RT9bC4OPO9PuaIj
         f7Q1JxZo7Z4cNzHT0zgt546eqCoPBDsQngLcJnzUaQeNeWxwTJdgO4zt0sTXm3G9ueKe
         WxaG7kCDxWizhhT1rX7Rr3wdnCwws9a4LAHHIVHLeH7C2oMM0pT5q65rc9uajBLYIGX7
         Cyy1M5ygKyCkmbvrnxZu57QweC3uO76WX77yxN9wDjoBV67Qvp/7Ab1h3mubGsFYf5aB
         NkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731493862; x=1732098662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWdzEkvn5bsPzgRswN/a2CQn0oCqya+wlbrzBUrPSX0=;
        b=L6xJQ0e5i0ZEEoDF0lIq8YXwidPCBFPl7HGcPDaSyQvegD+smKGR430pU9AOdBtPjL
         24SRv0gt6k6kJBcTzgKgHVyjsVFNRj7Fkdid4a6gnC0HnnuY59NooZwWs8llXYiCp5fd
         Z95HhsD506z01VFvzdFFAxzSh5H/NITFgcjkd8S/Vutgs0AifYWA1ysdW+e4ok2n/rEA
         +lM4Fewbm+ThSoHpfA2HP5YOtQl3nS8Y1QoR/QT/3/uNcNACEmeeOkl+EgIrixghHFtH
         Omvqv7dudFV1uZ62pe++g79wOLSYEE9dTKdI0SyfxLcM4ojHI/dy5P/LiT90nb2959lf
         Q5PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPrHIZ93chelbkVieX7/fhRo53SQwgNC23u0Jywdi77TtFrwJYah2y9pj3cQCpHKwQa5/iowa/7d8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPL/a4kExLBCG2fWmSCeLvtvTNcbXGsYfJrrK6im3UEInD3xPP
	tMFe7R+362fz5k3kjpCM9K1NY020RH/mIEdfN90mUuGvIGRKFKxrI9kqJ2+Avg==
X-Google-Smtp-Source: AGHT+IFXeJ2ayOIYqqoU45kBzrUbkje/gMh1HSfplqsPPQBEgwPVbnBHXtMbsznIBPPfaaVqAK7zpA==
X-Received: by 2002:ac2:4986:0:b0:53d:9ff8:edcb with SMTP id 2adb3069b0e04-53d9ff8f081mr992501e87.43.1731493862037;
        Wed, 13 Nov 2024 02:31:02 -0800 (PST)
Message-ID: <39168f90-7c80-451d-9c20-50da0de4af78@suse.com>
Date: Wed, 13 Nov 2024 11:31:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen:add deviations for MISRA C 2012 Rule R5.2
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
References: <41a1127e6d77d2be350e7679bd1034e0c2918e94.1731487210.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <41a1127e6d77d2be350e7679bd1034e0c2918e94.1731487210.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2024 09:41, Alessandro Zucchelli wrote:
> This addresses violations of MISRA C:2012 Rule 5.2 which states as
> following: Identifiers declared in the same scope and name space shall
> be distinct.
> 
> This deviation addresses violations of Rule 5.2 arising from
> identifiers generated through token pasting macros CHECK_NAME_ and
> DEFINE_COMPAT_HANDLE.

For each of the two, can you provide an example of where collisions
result? At least for the latter I can't even see how that would
work without the compiler complaining (i.e. the build breaking).

Jan


