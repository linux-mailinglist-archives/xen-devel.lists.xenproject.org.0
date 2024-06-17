Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4EB90B81A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 19:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742528.1149342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGBy-0002E5-Ti; Mon, 17 Jun 2024 17:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742528.1149342; Mon, 17 Jun 2024 17:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGBy-0002BX-PG; Mon, 17 Jun 2024 17:30:54 +0000
Received: by outflank-mailman (input) for mailman id 742528;
 Mon, 17 Jun 2024 17:30:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gp4O=NT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJGBx-0002BP-5p
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 17:30:53 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 568b5465-2ccf-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 19:30:51 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a6cb130027aso310217666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 10:30:49 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cbc852bf5sm5901534a12.58.2024.06.17.10.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 10:30:48 -0700 (PDT)
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
X-Inumbo-ID: 568b5465-2ccf-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718645449; x=1719250249; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7/xARnIxZ3vDTJqd5Pdnj0Kwhy1Z2i2+RNe91WeCq8E=;
        b=aWjgYv/HEtQZA+u1M4MAl6841naHexWK19re2hPUVV8EyFZ3wp+/WSVSxML2c5fc0d
         h71Ativj9IoFBCfk3tysSZe1Qt88bxyBO73ZdlteeMQIATnSdUqYToE6dnEq3zzcu7+m
         XFiFZUPlkEYpjc4R8otPjCxtPllyEV8Qw/ccg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645449; x=1719250249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/xARnIxZ3vDTJqd5Pdnj0Kwhy1Z2i2+RNe91WeCq8E=;
        b=UGEJ456YVIpxjYaVGuOAi/UBVP4vQSo4mdl46bwbfwowkue0hmoRgXs6/IAxP0Otfi
         EwYMXKPWOilHM/Ej61lSqMW3T94ZdUQJ4A0wfBVuKcg3/Y/gUTGzr9ApvrIYFiYNwozQ
         ZtmB6XGMGTWMSch6y80A57Wg0DIglo9uAuPuGMiPXaMLNzqeznfH9T9FYchtWaMIT0MC
         Hwx/ygxeYYv1H1+ziBUvVflwirBxOiOqMaBiHavwSP30WoJ98n3ub30AkzcPDc0HPFvf
         ImfVbxzSyAFe8pggyFF4nEQ8cGEUVQiVBbuhUBLDlu+Hrp5A+liHZJ/f6m5DizvWUtGl
         xpag==
X-Forwarded-Encrypted: i=1; AJvYcCU7WVUF5XgyuF/3dsshgVHTSREWPRDwpGj7Pw92uADt8Ei2sESfsp9CDO/LahAEhXmVbE3qQe7jtFmWtkxo7hoc8/Z7/eEt3nXNrPWOXI0=
X-Gm-Message-State: AOJu0Yx+pDPs/k9SR8ty3wpOxGNGZD0HIXtX4Zkn8PhibVoOc+48sdLR
	O5FYO0nyEycTeB1N5uOnEQTk6Em7vSLcyltjBnRrelP+Fr28PfbiKXoklknnxIU=
X-Google-Smtp-Source: AGHT+IFLx2aAgn/ANZseNFV/XUwfiU9hY7C3sp5f7YhaRPYMxrhjPZE/yHw/qz/F3OgAMjraiouDLA==
X-Received: by 2002:a50:c056:0:b0:57c:6338:328a with SMTP id 4fb4d7f45d1cf-57cbd6c7589mr9672923a12.30.1718645448831;
        Mon, 17 Jun 2024 10:30:48 -0700 (PDT)
Message-ID: <af1419dd-c9bf-4f15-b2dd-c3883030d4f4@citrix.com>
Date: Mon, 17 Jun 2024 18:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] x86/boot: Collect the Raw CPU Policy earlier on boot
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-4-andrew.cooper3@citrix.com>
 <8245f0ce-2964-4ecb-a31d-3e182a6d3e0b@suse.com>
 <6b4ed926-8934-4660-98c7-1856d0c90878@citrix.com>
 <cc1b52d8-163f-443c-8418-aba1c7d77ecb@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cc1b52d8-163f-443c-8418-aba1c7d77ecb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/06/2024 11:25 am, Jan Beulich wrote:
> On 14.06.2024 20:26, Andrew Cooper wrote:
>> On 23/05/2024 4:44 pm, Jan Beulich wrote:
>>> On 23.05.2024 13:16, Andrew Cooper wrote:
>>>> This is a tangle, but it's a small step in the right direction.
>>>>
>>>> xstate_init() is shortly going to want data from the Raw policy.
>>>> calculate_raw_cpu_policy() is sufficiently separate from the other policies to
>>>> be safe to do.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Would you mind taking a look at
>>> https://lists.xen.org/archives/html/xen-devel/2021-04/msg01335.html
>>> to make clear (to me at least) in how far we can perhaps find common grounds
>>> on what wants doing when? (Of course the local version I have has been
>>> constantly re-based, so some of the function names would have changed from
>>> what's visible there.)
>> That's been covered several times, at least in part.
>>
>> I want to eventually move the host policy too, but I'm not willing to
>> compound the mess we've currently got just to do it earlier.  It's just
>> creating even more obstacles to doing it nicely.
>>
>> Nothing in this series needs (or indeed should) use the host policy.
> Hmm, I'm irritated: You talk about host policy here, ...
>
>> The same is true of your AMX series.  You're (correctly) breaking the
>> uniform allocation size and (when policy selection is ordered WRT vCPU
>> creation, as discussed) it becomes solely depend on the guest policy.
> ... then guest policy, and ...
>
>> xsave.c really has no legitimate use for the host policy once the
>> uniform allocation size aspect has gone away.
> ... then host policy again.

Yes.  Notice how host policy is always referred to in the negative.

The raw policy should be used for everything pertaining to the
instruction ABI itself, and the guest policy for sizing information.

> Whereas my patch switches to using the raw
> policy, simply to eliminate redundant data.

Except it doesn't.  The latest posted version of your series contains:

-static u32 __read_mostly xsave_cntxt_size;
+#define xsave_cntxt_size (host_cpuid_policy.xstate.max_size | 0)

and you've even stated that I should have acked this patch simply on its
age.

I acked the patches that were good, and you did committed them at the
time.  Then I put together this series to fix the bugs the latent bugs
which you were making less latent; this series really is the same one
discussed back then, and really does have some 2020/2021 author dates in it.


It is, AFAICT, not safe to move the calculation of the host policy as
early as you did, without arranging for setup_{force,clear}_cap() to
edit the host policy synchronously.  Recalculating a second time later
isn't good enough, because you've created an asymmetry for most of boot
between two pieces of state which are supposed to be in sync, and that
you're intentionally starting to use.  So yes - while I do intend to
eventually make the host policy usable that early too, I'm really not
happy doing so in a manner that has "ticking timebomb" written all over it.

As to xsave_cntxt_size, it can (and should) be eliminated entirely when
xstate_alloc_save_area() can use the guest policy to size the allocation.

~Andrew

