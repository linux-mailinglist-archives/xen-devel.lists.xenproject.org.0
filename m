Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CBC98A8FE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807512.1219026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIcM-0008MN-0P; Mon, 30 Sep 2024 15:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807512.1219026; Mon, 30 Sep 2024 15:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIcL-0008JL-TX; Mon, 30 Sep 2024 15:47:21 +0000
Received: by outflank-mailman (input) for mailman id 807512;
 Mon, 30 Sep 2024 15:47:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Bw3=Q4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svIcK-0008JF-G2
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:47:20 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46786674-7f43-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 17:47:19 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so654577066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:47:19 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2775ceasm547941166b.21.2024.09.30.08.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 08:47:18 -0700 (PDT)
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
X-Inumbo-ID: 46786674-7f43-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727711239; x=1728316039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I8dPNaId8MNwyenAoG/ufqj5g2nGItYdtyE5XYj/kcE=;
        b=PsiBUMQlok9DeNFrvBzwzvw3HSVksgOIaiLhVbs9SG5y5V/IixVvl9w4WLKYdqL2pR
         WW+nER4BsYCUlgRq53W1Ip9qC2YqQLNPn9BHTDx/+AE5zfml35IagsKlxW9uUy7+pIGw
         BMZFyhybEOVif628J5IyNGtw4hTdLxD002+4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727711239; x=1728316039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8dPNaId8MNwyenAoG/ufqj5g2nGItYdtyE5XYj/kcE=;
        b=HQT/nijP7aOImNvEDVHZYAyrLp629BWH5ZCZfcnrL3VABu4pewvIii9rL+lKVO7xjC
         8TeQOOXEQWVSuVv3skALS5C9xVdtAPBgTFZNTv1VmsYgIwB3gQmE6x5yoEeUW6XYqiaU
         UkOEPJYMWRH3ku4K5PtfD4ICBogQFFZtj3bjoq5RjJzcPTcs20Wckx6RSYynmFTBawkw
         EEXLSNyiAJsP+eGg9z3txj0zVMuyZBipzkD0e0nLme2sTGsNj8gNZ4GK8xVO+/RdypiP
         R5IuyT6pZoHOTCXPQC552QrsFiYYItDAMgY+Loutflj84yNQR6QGhY+iRyhXK62nsrji
         cNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg+bnGprxQb8HW90U/kTUdifon6Vzg3Slz2wCWL/heS/kOxim3kAnfXTVqA4BcU4SoceQr8A8GhSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNl3ZQyhBsrIzRntVHaZWt0oxhmTJf17TtGCOurolRU45zBpmf
	KJIEgnKYbVlFxp8FdSLUayeclxOBU6wEOTEV3Mb8nblAWzBJVg3EdH2KCaoMvJXnyAI2GGszo4I
	3aBU=
X-Google-Smtp-Source: AGHT+IGiNIuhcQHUH7JWQYNupfXH/AjVot1CrwDKH06aHv8YJuYtvjFLRworpYi2s7I02KrgxXeBaw==
X-Received: by 2002:a17:907:8692:b0:a8d:44a5:1c2f with SMTP id a640c23a62f3a-a93c48f089bmr1228059166b.6.1727711238855;
        Mon, 30 Sep 2024 08:47:18 -0700 (PDT)
Message-ID: <f103b9bf-9cf0-414b-8b89-d15ec00fcc1f@citrix.com>
Date: Mon, 30 Sep 2024 16:47:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: use alternative_input() in cache_flush()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <60fb1103-aef3-40dd-afd0-44f594753165@suse.com>
 <ec956d90-0ee6-43a6-9c6d-0f8b97a7c570@citrix.com>
 <768e57f0-5856-4213-992c-414f3fdc5430@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <768e57f0-5856-4213-992c-414f3fdc5430@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/09/2024 4:39 pm, Jan Beulich wrote:
> On 30.09.2024 17:27, Andrew Cooper wrote:
>> On 30/09/2024 4:09 pm, Jan Beulich wrote:
>>> There's no point using alternative_io() when there are no outputs.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/flushtlb.c
>>> +++ b/xen/arch/x86/flushtlb.c
>>> @@ -286,11 +286,10 @@ void cache_flush(const void *addr, unsig
>>>           * + prefix than a clflush + nop, and hence the prefix is added instead
>>>           * of letting the alternative framework fill the gap by appending nops.
>>>           */
>>> -        alternative_io("ds; clflush %[p]",
>>> -                       "data16 clflush %[p]", /* clflushopt */
>>> -                       X86_FEATURE_CLFLUSHOPT,
>>> -                       /* no outputs */,
>>> -                       [p] "m" (*(const char *)(addr)));
>>> +        alternative_input("ds; clflush %[p]",
>> Drop the ; as you're altering the line anyway?
> Oh, sure.
>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Thanks.
>
>> However, switching to ds ds will avoid a trailing nop, so will be
>> marginally better.
> I don't think I understand, which may or may not be due to me not being
> sure whether "ds ds" is a typo. What trailing NOP are you seeing? The
> "ds" that's there already covers for the sole trailing NOP that would
> otherwise result due to the "data16" prefix.

Oh of course.  I can't count.  Sorry for the noise.

~Andrew

