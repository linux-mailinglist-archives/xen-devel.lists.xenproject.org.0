Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5543960FCA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 17:02:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784163.1193568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixhn-00085r-IV; Tue, 27 Aug 2024 15:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784163.1193568; Tue, 27 Aug 2024 15:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixhn-00083q-Fo; Tue, 27 Aug 2024 15:01:59 +0000
Received: by outflank-mailman (input) for mailman id 784163;
 Tue, 27 Aug 2024 15:01:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sixhl-000826-E9
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 15:01:57 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cea1fc9-6485-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 17:01:55 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so102510566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 08:01:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e5487a88sm120256166b.38.2024.08.27.08.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 08:01:54 -0700 (PDT)
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
X-Inumbo-ID: 4cea1fc9-6485-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724770915; x=1725375715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yaZPpSO8+n4j8whG+wrXXjP8Dq75GL9fzKcBrXBURUw=;
        b=DKGdlbTkqAMAYDNRjKHdmpD+wqDfamzFk0tu4v0970VrNBUrxndV8vc5S270ajfHHx
         owgkX3MbC/eUOpEEvHHJkl7LShqVVTQTLvfQckJ9fmKN7ILwayo5TAGdRGFy6Di8CO4M
         znNlKd82868f3eubkyuGyTj7W9MNMbEY4etXhXBCKyaGYgNcLL40tn1cU0UNGJt2Z/mO
         rD5qYerdcJtgvcbSLNk9QEi2Quwq7EGtFfhgv85F2Z38t3YbFlBf3L5rc++lqa9jIajq
         N+RV82DqLzWOvZ2ZfZuhUfQ2R/kARnH6NfuE8aPYKGEOS4zpZUNt6eCRaKXtvYxrYga+
         wqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724770915; x=1725375715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaZPpSO8+n4j8whG+wrXXjP8Dq75GL9fzKcBrXBURUw=;
        b=M+lQ4T9yX0/sR5g4KJ6o3We3meAb9T60tvgLXSpbkedulEWH2EIvbqRACNzjGNG0gn
         St2keQaEad6/Y+95LWC8Vbt9B3IvriG0dHPRkNJjgJxgHhQFsZut4scdJFRBIxLzTQ2e
         DcE62QWnj3MG86tZuZm/3FdiKiWg2FWPrpQPgdK4V/CSrRVgl/ZIc1zNTX91Pnfs83s+
         sMQ5hz4GQ2NM2tP4AHOi4/6OjoJp2CwgEtiUxtPllNemC030V1tJUkktC9Dd5U/f2HSI
         /CjW1ELuyeFWslYSTsgSqMDsHOxeIix4pOcuL+f4/nMt7GUuBPMFsD56nwYd2KmDQyr8
         zCKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXYk4hOaVqxDNNFitIb3bMdb0tKpL9YYE1iR6Is73PQeKgWvK8j4H0s7SMcw72g/0d+cYq817metE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/LKVzkwSictY+GVfMzQF0lnHEgkIvJzWZgpcqVHklz/fyZLhn
	kGs92oP1NWfA/okxRPyBrRV0r5W8mCBoZ9HSiQ/hguRwy0o3/SOZyEtyS5BMpg==
X-Google-Smtp-Source: AGHT+IHwPZE2COM0keTUFK2JeugXSUuvpO3I/4B/Rxmx/HiALiFhUCMpaiwrEjZYUqfBRrgj0wJlBQ==
X-Received: by 2002:a17:907:7251:b0:a80:f358:5d55 with SMTP id a640c23a62f3a-a86a52c11e5mr838392666b.33.1724770914801;
        Tue, 27 Aug 2024 08:01:54 -0700 (PDT)
Message-ID: <7dfb83d4-3022-40c6-98aa-d5a236c2de66@suse.com>
Date: Tue, 27 Aug 2024 17:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] xen/bitops: Implement hweight64() in terms of
 hweightl()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-8-andrew.cooper3@citrix.com>
 <11da1350-095f-49c8-bdf0-f5c83e9f0d39@suse.com>
 <70047ef7-ca22-4eeb-9510-09ccdf0871c0@citrix.com>
 <73309650-3912-418b-b2e6-a60676519911@suse.com>
 <c54f7015-abe1-4834-83e3-29a2cc854d85@citrix.com>
 <d63df810-3f95-4c99-90fd-e509c26fc4fe@citrix.com>
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
In-Reply-To: <d63df810-3f95-4c99-90fd-e509c26fc4fe@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2024 16:32, Andrew Cooper wrote:
> On 27/08/2024 2:25 pm, Andrew Cooper wrote:
>> On 27/08/2024 2:00 pm, Jan Beulich wrote:
>>> On 27.08.2024 13:50, Andrew Cooper wrote:
>>>> On 26/08/2024 12:55 pm, Jan Beulich wrote:
>>>>> On 23.08.2024 01:06, Andrew Cooper wrote:
>>>> Again, this is modelled after f[fl]s64() which have the same
>>>> expectations about the BITS_PER_LONG != 64 case.
>>> Both of them are fine afaict. fls64() has an explicit intermediate
>>> variable of type uint32_t, and ffs64() has a (uint32_t)x as part
>>> of the conditional expression achieving the intended effect.
>>>
>>> Anyway, why not use hweight32() instead of hweightl() here? That'll
>>> make things very explicit.
>> hweight32() doesn't exist until the next patch in the series.
>>
>> Although looking at the end result, I can't figure out why I thought it
>> was necessary to transform hweight64 first.
>>
>> I'll swap this patch and the next one, and then use hweight32().
> 
> I've found out why.
> 
> The hweight32() patch is the one that deletes generic_hweight32(), but
> generic_hweight64() uses it.
> 
> I can work around this, but it means keeping generic_hweight32() around
> and deleting it in the hweight64() patch.

Or simply fold both patches?

Jan

