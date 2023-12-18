Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30D08176A2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 17:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656205.1024272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFG4X-0007qt-9q; Mon, 18 Dec 2023 16:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656205.1024272; Mon, 18 Dec 2023 16:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFG4X-0007p0-6z; Mon, 18 Dec 2023 16:02:25 +0000
Received: by outflank-mailman (input) for mailman id 656205;
 Mon, 18 Dec 2023 16:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFG4W-0007ou-Gr
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 16:02:24 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4cf915e-9dbe-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 17:02:23 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c2308faedso39468445e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 08:02:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i9-20020a05600c354900b003fee6e170f9sm42184380wmq.45.2023.12.18.08.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 08:02:21 -0800 (PST)
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
X-Inumbo-ID: d4cf915e-9dbe-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702915343; x=1703520143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2TZlu5h+Nh07tQDng1rzsJ0XRDBzB8VLNymSGIfzHIY=;
        b=JNMLqwcQ7pIpHYp+Nd96o3uWK2/Ok+x9/+++dzV9JZtbnsqDA94+whq6oY7Ms91UVr
         TChfvK3EqodZdQ1ZoQ/JrQSYQAxGm6tKccS5fqCo9Ri+zTCvuwwTBJH2dypZK1CdyQc6
         bMXZFtyhS5zzSQVxFlRy/REQNo6d3HhSTxMCoQWAMD9c264nCUop1fZNAS0jx0pu7VC4
         uIeByXIALKJ4e4fbw73TiuEZTkd61Z5Ku9eaUQHV/WrbPaUCOCc+zk/QFGNRQZe2yC6u
         78CB2xbwQX7HLVUjzPWn3utnlJ3xWjeTH4QHn03irMmWLkYU9B0WKKaKkN/C/yyT3zNK
         pFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915343; x=1703520143;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TZlu5h+Nh07tQDng1rzsJ0XRDBzB8VLNymSGIfzHIY=;
        b=nSEHOMfGwpIfXSqoBLXiPl3gqHR0VczJ2rd9OzkNpJciFl3AooZwNi/n+xF6QGrMaL
         X+pCbKA9z1mxk+UtKgVbYZ5U4JIcs262iuSimwAeWvs1b4EIoJOwhhmvTYvkWP7HaH/l
         cylqEKyQYxRILlwGPGIgYhYSLP41W38y7RZAVz/Hrei4f2rOY5Wrz0DuMNgY4zL0ihl6
         yrkFBOALgZ+Z4J74reu8JE9d8wkTp0AUlgHcAn4bWS+lWxu5dmjrv6UFKTXIkqzesfUj
         dYnglAgaNKCP4CVZGZJSffJoaHMwMU/AHcuRWjApdaG1Q7bf0+L7eQMnbOfJwxkE00kB
         toeg==
X-Gm-Message-State: AOJu0YyEg/8steagHRCVo/mZ90rRXVWYyLAoqSgxraHEZhseUkaxm0zi
	3Ll34rqG+8snNovwHAEkchltrJP3WUMxVcbsFo3h
X-Google-Smtp-Source: AGHT+IEHH4otcAiOqsUdflH/WdtaI4Gzbfn+PmF/MUTCADO+Gciqywi9Bl9Iy5/hb1/0wrBRI8SASA==
X-Received: by 2002:a05:600c:319b:b0:40b:5e59:c57f with SMTP id s27-20020a05600c319b00b0040b5e59c57fmr8435574wmp.169.1702915341807;
        Mon, 18 Dec 2023 08:02:21 -0800 (PST)
Message-ID: <740f7915-b705-4fe5-990b-ca5de38004a4@suse.com>
Date: Mon, 18 Dec 2023 17:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <31da79de-bd6b-af95-793a-c16516992bc7@suse.com> <ZYA3Db53Z3fvBlwn@macbook>
 <1c00c3ba-4d10-4cdc-ae2e-ca2fb2157be6@suse.com>
 <2f6367bd-d63d-435f-8d6e-553d5e129eb5@suse.com> <ZYBojHyqUeB9FWmh@macbook>
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
In-Reply-To: <ZYBojHyqUeB9FWmh@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 16:43, Roger Pau Monné wrote:
> On Mon, Dec 18, 2023 at 02:50:27PM +0100, Jan Beulich wrote:
>> On 18.12.2023 14:46, Jan Beulich wrote:
>>> On 18.12.2023 13:11, Roger Pau Monné wrote:
>>>> Hello,
>>>>
>>>> I'm not as expert as Andrew in all the speculation stuff, but I will
>>>> try to provide some feedback.
>>>>
>>>> On Tue, Feb 14, 2023 at 05:10:42PM +0100, Jan Beulich wrote:
>>>>> In order to be able to defer the context switch IBPB to the last
>>>>> possible point, add logic to the exit-to-guest paths to issue the
>>>>> barrier there, including the "IBPB doesn't flush the RSB/RAS"
>>>>> workaround. Since alternatives, for now at least, can't nest, emit JMP
>>>>> to skip past both constructs where both are needed. This may be more
>>>>> efficient anyway, as the sequence of NOPs is pretty long.
>>>>
>>>> Could you elaborate on the reason why deferring the IBPB to the exit
>>>> to guest path is helpful?  So far it just seem to make the logic more
>>>> complex without nay justification (at least in the changelog).
>>>
>>> I've added "(to leave behind as little as possible)" ahead of the 1st
>>> comma - is that sufficient, do you think?
>>
>> Actually, the next patch supplies better context, i.e. is more / also
>> about avoiding to clobber Xen's own predictions.
> 
> Right, that I got from next patch, but given context switch is already
> a quite heavy operation, does avoiding the cleaning of the branch
> predictor make that much of a difference?
> 
> IMO it needs good justification given it's a change that makes the
> logic harder to follow, so if it turns out there's no difference I
> would rather leave the IBPB at context switch.

As per another reply, I guess we want to discuss this with Andrew, so
maybe a good thing to try to remember to put up on the next x86 meeting
we're going to have.

Jan

