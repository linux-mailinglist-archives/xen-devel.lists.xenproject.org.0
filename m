Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF75C88FBC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 10:36:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172439.1497508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOBx8-0003Iu-O7; Wed, 26 Nov 2025 09:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172439.1497508; Wed, 26 Nov 2025 09:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOBx8-0003HT-LO; Wed, 26 Nov 2025 09:36:46 +0000
Received: by outflank-mailman (input) for mailman id 1172439;
 Wed, 26 Nov 2025 09:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOBx6-0003HN-PL
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 09:36:44 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a9dffeb-caab-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 10:36:42 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42b3c965ca9so3612304f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 01:36:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f34ff3sm40322670f8f.16.2025.11.26.01.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 01:36:41 -0800 (PST)
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
X-Inumbo-ID: 6a9dffeb-caab-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764149802; x=1764754602; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lSvNV59xQ/tUIl797hLPajV84NYL1X9lcVEsAN5AThQ=;
        b=ODEFp4Rd8/3tWeiCWHinLvpTUWY5REQzYIvRNZfJZuUqfHenTLyuV6r+LRezr/h6Tz
         EbMDDJ/0rCixcnzo2E+3EUQ5tA3lepVNRlau4GIsHRWKPu6uIA77px/hGiDHdGNwzVod
         Xq2dGpFy+5DW1m0NsKgGBZjWQUYxST/depcwYJOCfLS/RTTDIk2t2fhltBD4pFlYn9uJ
         GBYlEomOyyR3xXuCtorLdX9sRZIATw7vxzdwTLYAdqw6UW/yO6y6H/Ohb46dL/R3exe1
         ViAFb7IivgVXe2O3vloCXDwFZ36Qkl2KDYtcdxMuEM1GMlWEHcIF0a2shUgNBlNWjKdf
         TqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764149802; x=1764754602;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSvNV59xQ/tUIl797hLPajV84NYL1X9lcVEsAN5AThQ=;
        b=JRGTaHbu9yHOL0OtK7pbgGEaMErKXi2nteUy8XbUxToIicU8gIIbbyBAunOaVGo5RS
         wCMDpvPgTQBLKTLpfw+/8Zkdnqxta/CS/5+xYEWcKv1BiFjB83xx9Vx+7+nAvTpO9ma8
         8VFO+mxF0kmiqIFJx2Nr6WWJa1JHxu2iJMuAFSvddJDK2q9/qlKAgEy76iM4w6lUzEzC
         NYU1L7spZCEhKPEI0sz+fTbCXYXu42ScJE15numPlswlRtG613mebN7JF6XXL3URIlRF
         AaDjmU9a8kJXhQwB2DvjaBNgivsALt4G8u4uy9brOGTcp5BetIgCFlhjlBhdPtr4HC32
         tCDw==
X-Forwarded-Encrypted: i=1; AJvYcCUXHDurmw4wFXLXio/tGeKxLv4Ed/7dHLOo54fd+ptPfCkkHIt2VcKgBXI6Ib8xJNqQruKH7dP+nKU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvCTvyTATxhkVWeUB6UEMP3HyIFyqJLrqBMl5BoMmSFnqSA8bX
	/UX334JaqjPvhX0fA6nXsGWgQCsuLEIxK32gHulnIK1TfTxGquo+T+ioh7ND3VuIQw==
X-Gm-Gg: ASbGncuu0N3uHFlDx1eN3IBAoSe3k/GdMhbeaqzkISCDnuyjCbJqXuSFeRM7kAnCFx5
	1reIRrs149Kg0BHZ6rB+tw2dt5gk6BHB+uspmkSNtefKSRXPENB733KyeMO5iZFQu/fRkYreR7+
	1RhqsMsUP4vhISFmdeRpGLt9X1mLlfIASpl7stihLFwVyMl2ZmptJs/H7MW8nVIc7J9mR/oiIEi
	Eaq6gZRrq3oSUIDp+aN24heCeAIUZ58vMNPfqy4vPtsOBQZUL6fqjm0UGgXdRmzTx2Xq652//xe
	ViiZYFrgw+4Ewv4GbgldcjJhxeRYyT4rwebqKuY+7SzsgBsHI3qNgnnP0x34vbuO7jSXakeu8IB
	2YSGHTWOSur8LvrMpaajNUrq61ByVO9hPkAREQfOaVv2m7KNZtnmN0hmLpXUee9Mdz6eDCEebXa
	IIAmjeisaA4e8NAHYKai4Qh51nlIcgE0xRorXKNJrh8UxKqWS2y5pfIwclhi0TDr8WMLh8NqPA0
	no=
X-Google-Smtp-Source: AGHT+IH7joh8d8pVnfmR7+YnUQRKLSAaZIpF56M9eTx4jtakNESPFijwBIED95a2MmVDjlC1c6Jcmw==
X-Received: by 2002:a5d:5850:0:b0:42b:3746:3b86 with SMTP id ffacd0b85a97d-42cc1d61bd1mr21007187f8f.54.1764149802117;
        Wed, 26 Nov 2025 01:36:42 -0800 (PST)
Message-ID: <f74aeee7-7ec2-4e00-9729-273584946563@suse.com>
Date: Wed, 26 Nov 2025 10:36:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/24] xen/domctl: domctl_lock synchronization only
 when MGMT_HYPERCALLS=y
From: Jan Beulich <jbeulich@suse.com>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-23-Penny.Zheng@amd.com>
 <6f9d00c7-8304-4d80-92c8-f134cceb01c1@suse.com>
Content-Language: en-US
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
In-Reply-To: <6f9d00c7-8304-4d80-92c8-f134cceb01c1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 10:20, Jan Beulich wrote:
> On 21.11.2025 11:57, Penny Zheng wrote:
>> Helper domctl_lock_{acquire,release} is domctl_lock, which HVM_PARAM_IDENT_PT
>> uses to ensure synchronization on potential domctl-op altering guest state.
>> So it is only needed when MGMT_HYPERCALLS=y.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I'd like to note though that ...
> 
>> ---
>> v3 -> v4:
>> - new commit
>> ---
>>  xen/arch/x86/hvm/hvm.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> ... with this diffstat the subject prefix is pretty misleading once again. I may
> take the liberty and convert it to x86/hvm: (and then also add parentheses to
> domctl_lock()).

Actually, the series looks to be in need of a full re-submission anyway. I.e. I
can't sensibly cherry-pick parts to put in early.

Jan

