Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAC493C5DC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 17:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765053.1175629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWzxF-00012i-Fc; Thu, 25 Jul 2024 15:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765053.1175629; Thu, 25 Jul 2024 15:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWzxF-000106-D1; Thu, 25 Jul 2024 15:00:29 +0000
Received: by outflank-mailman (input) for mailman id 765053;
 Thu, 25 Jul 2024 15:00:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/1nn=OZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWzxD-000100-PF
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 15:00:27 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a03f033c-4a96-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 17:00:26 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7a94aa5080so80036566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 08:00:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb82e7sm80605066b.208.2024.07.25.08.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 08:00:25 -0700 (PDT)
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
X-Inumbo-ID: a03f033c-4a96-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721919626; x=1722524426; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cxh0yHJTpeufZlceGuugsvM4+7leklw3kg0qM/qkq70=;
        b=eckakWNhroVpewnpM98eBFno7Hhyrzab+aXGIt/7oFoxSsE0hT1s54XiFTHgySvvMT
         IVmFrn0xs4MqaT1jEUNsyTzwuItB3/GWN7vnF/R+pA2WuMdaDIQzjDYGzEa8CyeruwLq
         HL82P1rzbjCOUvGkLDGI0s/I35zjim5OARKSBQssSH3UaMLSdQrvCulJmOkUj2zzLGDK
         2G4W4FwK3yqUPuSk7EU4KaGCFSzaI+7ZpkmlRj45NL6672aNXHYbFWvhUolHwbhXKXbN
         76/uIJO65dMS74InPsEbzEq2ezjhAbmCMTSn9eoBU95U1VTJjKMFL5QZqgPx3TPP0A1m
         KSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721919626; x=1722524426;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cxh0yHJTpeufZlceGuugsvM4+7leklw3kg0qM/qkq70=;
        b=TmZ6T+wZg822bukyiI2X+CnrwaLqNtOItSBwMj/trbS0KHu7Sq0if+eEfe+Vd9YSsW
         lkw8sCrrW8VgpJctliVZa/VY5OcNRqUC3sI++tjYNxelLYWcn2/JFIlEtNKax0iA7eW8
         sCw26/BMw9oCWix+jmz1BpjSoVpR/fuhHkA+xkuuSaywz3ohoG2i0SUYyQYuhGak1mNf
         JpVCPtEbqRW8iqerIr7VbNd1xqZnngiifEFyZGVRhV/um7VazYq9PBLRimeSKhSdY+Jg
         2YzBISvfA5fql4L3Gw8l1SmXQySzpKC0JdSWmc+cRk4WjpRUbMQSBi23RS0nqExe6W/4
         krJA==
X-Forwarded-Encrypted: i=1; AJvYcCWVtiqLwh/qVtKX7MUtK/YkvEgiawspzM1R+Ln+A9zIH94txtX9NTj6Qw+b6WvvheZoiQEVm8t4hAJWsRDUFCjc0B1S9HLFeQMgrczeAZ0=
X-Gm-Message-State: AOJu0YzS1WlNNBq5UMcWcwottFEeUeCRPEz6FUPXYhm7rrwork+KtAc+
	s/C0vayyXvc3DnX77MMcmI/h5LmyIjPzrMTaQQtL0txEMhe9qJJ+4KtB8s6WHg==
X-Google-Smtp-Source: AGHT+IFyowGV1+MtMYonO+h21VwgvuF3xVxTfyf+6m9MpIadJsyBW7QWC686YozSThY8lmX6iW4rLg==
X-Received: by 2002:a17:907:6d17:b0:a7a:9144:e251 with SMTP id a640c23a62f3a-a7acb38edc8mr196931666b.11.1721919626172;
        Thu, 25 Jul 2024 08:00:26 -0700 (PDT)
Message-ID: <a638b0e1-07a3-495c-b3b9-e450a50f9429@suse.com>
Date: Thu, 25 Jul 2024 17:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20240725105634.16825-1-roger.pau@citrix.com>
 <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com> <ZqJnPvL1ilDDzM9V@macbook>
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
In-Reply-To: <ZqJnPvL1ilDDzM9V@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.07.2024 16:54, Roger Pau Monné wrote:
> On Thu, Jul 25, 2024 at 03:18:29PM +0200, Jan Beulich wrote:
>> On 25.07.2024 12:56, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/include/asm/alternative.h
>>> +++ b/xen/arch/x86/include/asm/alternative.h
>>> @@ -184,11 +184,11 @@ extern void alternative_branches(void);
>>>   * https://github.com/llvm/llvm-project/issues/82598
>>>   */
>>>  #define ALT_CALL_ARG(arg, n)                                            \
>>> -    register union {                                                    \
>>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
>>> -        unsigned long r;                                                \
>>> +    register struct {                                                   \
>>> +        typeof(arg) e;                                                  \
>>> +        char pad[sizeof(void *) - sizeof(arg)];                         \
>>
>> One thing that occurred to me only after our discussion, and I then forgot
>> to mention this before you would send a patch: What if sizeof(void *) ==
>> sizeof(arg)? Zero-sized arrays are explicitly something we're trying to
>> get rid of.
> 
> I wondered about this, but I though it was only [] that we were trying
> to get rid of, not [0].

Sadly (here) it's actually the other way around, aiui.

Jan

