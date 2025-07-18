Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA190B0A08F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 12:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048398.1418629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uciFq-0007og-84; Fri, 18 Jul 2025 10:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048398.1418629; Fri, 18 Jul 2025 10:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uciFq-0007mh-4w; Fri, 18 Jul 2025 10:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1048398;
 Fri, 18 Jul 2025 10:23:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uciFp-0007mZ-As
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 10:23:49 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aedaa5d-63c1-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 12:23:48 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so1114391f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 03:23:48 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca4d73esm1396799f8f.66.2025.07.18.03.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 03:23:47 -0700 (PDT)
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
X-Inumbo-ID: 4aedaa5d-63c1-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752834228; x=1753439028; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nS/fiBBt5By2HZy6W7TKmo3K/wu43T+DdUtSy2RhxQ0=;
        b=Z61jo+pkRIzdQf5j6fdrdpcD2950xS+4RS3ISHzM8tPL1aNwa31aguOgQHnz1IeHaM
         TyesmOGJ/GuN/HkJ0pYs0oZomQ0x+QWWZHzMrj0Hcd2WjZ5ceeZBa0Wa5xll6KhjGP/s
         0RyxnGGnHNSEImgIz6VqwLEtgd6kajxliEpDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752834228; x=1753439028;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nS/fiBBt5By2HZy6W7TKmo3K/wu43T+DdUtSy2RhxQ0=;
        b=YFNfaRKm/Mvasi+v3EvPy/Ox3CvU+xrG/932+iZzGNHosA91mDZwfFB1M6Y9r2DIpE
         uclMCGSg3BN0EYLLdcQpb6cDGIH35GfVztP+avNAAHZhtb1p6WmF2kJIxdvlBpSGH5SF
         B1MjN72/LYSjZiwtX+EeJeH3d9AqLPgb48IJ8gXQExX01GhZwW6qvc1PTONih6EYyjnk
         adDqJFcHWvSUEgLgftgkvT7Qtbt7o3k8N6xRSnpOiqeeR5csFuWff3tu5dbJ05pW+2aN
         mV+ikb0ltPNgH6JMoQ9Yr89gjwyqE3K3EeayBCSgoMuKIwPQyzPExiL/zZLBV6OlpNmJ
         Xi5w==
X-Forwarded-Encrypted: i=1; AJvYcCXenPOniypCQHcPP0B6xweSRCQ8Ve+S6bWtz4P+D2Cy+bWt+ICvt+jKsz4w7eyq26vHfAXxehUzQs8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiXZr1nJD9gv+M+Ofdvdz4UvahTj1HQxmwkdUoW3z4WhRibthf
	OJ8/InJD4Il/nWeqfk6FeJ1QNgq7i7e5ssxNRe995fMH09JWkMFApLe/sSEFiq9m4NPXqgGutIB
	DldQ3YHzn/g==
X-Gm-Gg: ASbGnctJJJXkW0hcwhkd72r0rHM97FdNRbyzWu6VvMmIjjk+O+BEReDnU926g3ZKT6D
	t1XkBYz1LRVplTu7UR1hFNo3MyvhkNw/3I7A4qekBQQsezW0/zlYf/K1RqyM01U6bluBz1782AP
	jS8RhudGtNjYDVjKDrcFy9AzYdsYYAO9d3b4wtKzuQ8ELuglE7YTBI73C423Mq7bL8FHvXmJQWN
	3ZMHeCUiV0Lzz1/3bcyrfgjnHLWdcRi/X7Ndj7ZL/bCrobQvIzH08KD6Ccn/DhQd3fQA4UL75UM
	kTYtRPPlpix2tYL1hH9McueIM3U/DcH1V8mhe7rrno45tGJFXQwT0Up5r83HAeNPR1bWshLJgr4
	K05YI3LMUBp3o3AF2qfY03zBzgOXSM/xhBcD9qxkFJguvkAYW9TwR0sPrrJlKIoq5eGHn2GmiQr
	zOdNY=
X-Google-Smtp-Source: AGHT+IGVpvmb/kPVDE7qOysqSpu8PNKZytKdIa/8gnllR8rAelQd077c+H1l+dOYXw2J7e0F8k1OlA==
X-Received: by 2002:a5d:64e6:0:b0:3a6:d95c:5e8 with SMTP id ffacd0b85a97d-3b61b217e5dmr1755509f8f.35.1752834227948;
        Fri, 18 Jul 2025 03:23:47 -0700 (PDT)
Message-ID: <9c820057-3e36-45dc-b71a-95c9d2dc4398@citrix.com>
Date: Fri, 18 Jul 2025 11:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 6/6] x86/apic: Convert the TSC deadline errata table
 to X86_MATCH_*()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-7-andrew.cooper3@citrix.com>
 <20250718100739.2369750-1-andrew.cooper3@citrix.com>
 <4de09b8d-d71d-439e-be1c-78044a3cad31@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4de09b8d-d71d-439e-be1c-78044a3cad31@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/07/2025 11:19 am, Jan Beulich wrote:
> On 18.07.2025 12:07, Andrew Cooper wrote:
>> With the ability to match on steppings, introduce a new X86_MATCH_VFMS()
>> helper to match a specific stepping, and use it to rework deadline_match[].
>>
>> Notably this removes the overloading of driver_data possibly being a function
>> pointer, and removes the latent bug where the target functions are missing
>> ENDBR instructions owing to the lack of the cf_check attribute.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> -static const struct x86_cpu_id __initconstrel deadline_match[] = {
> Seeing this transformation ...
>
>>  static void __init check_deadline_errata(void)
>>  {
>> +    static const struct x86_cpu_id __initconst deadline_match[] = {
> ... of the section placement, we may want to investigate whether with the
> toolchain baseline bump we can actually do away with __initconstrel, using
> __initconst uniformly everywhere.

To be honest, I'm not even sure why we needed the split in the first
place.  We merge both sections together, so it isn't about section
attributes.

But, if you think it's safe to remove, it will definitely be a good
amplification.

~Andrew

