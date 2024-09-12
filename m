Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D1B9770E6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 20:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797769.1207840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soor8-00049o-6T; Thu, 12 Sep 2024 18:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797769.1207840; Thu, 12 Sep 2024 18:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soor8-00047v-2Y; Thu, 12 Sep 2024 18:47:50 +0000
Received: by outflank-mailman (input) for mailman id 797769;
 Thu, 12 Sep 2024 18:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDyH=QK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1soor6-00047p-HL
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 18:47:48 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8057f04f-7137-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 20:47:46 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5becfd14353so136973a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 11:47:46 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76fc4sm6908512a12.78.2024.09.12.11.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 11:47:44 -0700 (PDT)
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
X-Inumbo-ID: 8057f04f-7137-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726166866; x=1726771666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QDur4FSDKn0NPQM7Oe59RgAnDBAxQ+2WeyJ7aeEdYjE=;
        b=Wd06h3XGkY4W6GHwDQp6vu8z/pl73fTs+qQCilt4Y2/D5zgOdm1rt4OCYSflADobmM
         b3oQ2/d+sdap0gw31/DZcI33HirOlRC3aw/jODCvUg+dk0iQn5QKaNtda7bAJppm82aY
         i02WlM35uRONF8IpAyt/l7ilr6/AH40Q6NCJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726166866; x=1726771666;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDur4FSDKn0NPQM7Oe59RgAnDBAxQ+2WeyJ7aeEdYjE=;
        b=fGEq9d4nUFPbMaX3CNOZ2Xou7G4Dd8vRfRc333Fc5eKyvYvZC+cG5e3lFI3BNNhFu2
         b2qrblGM5um9c+kQiqqOeA2ySd8RRHPtJYcTPaah2uhxrSwY7gbqGq2gtJE3N1AjBRjd
         fXtelj22n/wV4XLAfTLPu4lxG62f+33gr7e/WnQZjzrUQy2fRkjH+uqIYNGjN4CbAwTM
         WPhs62kIU4+kasi8qXYES6Be1IxY0gjjUayJtacZBVFDMG464kq/7z/+lZO7mAv1SbXa
         8PgSqYNM5n4WTyRJmSViPjx0irWd8OsnU5rXektszrjZG+9XE7EWS17hj4DTcFVfnFYR
         9oUA==
X-Forwarded-Encrypted: i=1; AJvYcCULfCqqf1zsjacHFo0INXryfoRJEWRuX/1+14pOx63T7iZ2cDQMltybPySHzJBaddhPeDxcQrMukWc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydpCD1rPLkM/DziPmSpPdu5kjDdVuQwnmevO9DbeJ4GD8LnVm9
	x9AxcpDs4DTpWAc7reTv5+rxEgwRdhLpj83MDlSdYwqlNbY3wL8LRQPGa2yV38Q=
X-Google-Smtp-Source: AGHT+IEss8ABu56HMC7334gwEiLkd1HuqWU8oKBew2Jbfc8uC0U/8CiiKTp0FmJHU4ZbSYPUgQuAtA==
X-Received: by 2002:a05:6402:27ca:b0:5c2:6d58:acc4 with SMTP id 4fb4d7f45d1cf-5c41e18e5bdmr174111a12.11.1726166864966;
        Thu, 12 Sep 2024 11:47:44 -0700 (PDT)
Message-ID: <00164385-c79b-4275-83fc-a86ab6510481@citrix.com>
Date: Thu, 12 Sep 2024 19:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix two problems in the microcode parsers
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <06edbbb7831620bc04c6453b95aad80eaebb20a1.1726162000.git.demi@invisiblethingslab.com>
 <49c43c98-a8b2-4943-af89-dfbf2030e478@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <49c43c98-a8b2-4943-af89-dfbf2030e478@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2024 7:44 pm, Andrew Cooper wrote:
> On 12/09/2024 6:39 pm, Demi Marie Obenour wrote:
>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>> ---
>>  xen/arch/x86/cpu/microcode/amd.c   | 1 +
>>  xen/arch/x86/cpu/microcode/intel.c | 5 +++--
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
>> index d2a26967c6dbc4695602dd46d5836a6d88e15072..31ee5717c5f1c7d0b7e29d990cf4d1024d775900 100644
>> --- a/xen/arch/x86/cpu/microcode/amd.c
>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>> @@ -338,6 +338,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
>>          if ( size < sizeof(*et) ||
>>               (et = buf)->type != UCODE_EQUIV_CPU_TABLE_TYPE ||
>>               size - sizeof(*et) < et->len ||
>> +             et->len < sizeof(et->eq[0]) ||
>>               et->len % sizeof(et->eq[0]) ||
>>               et->eq[(et->len / sizeof(et->eq[0])) - 1].installed_cpu )
>>          {
> This is complicated by AMD having no spec in the slightest on their
> container format, but this change makes Xen reject a case that I
> reasoned was well formed (if unwise).
>
> IMO, the following binary is well formed:
>
>     0x00414d44 /* MAGIC */
>     0x00000000 /* type=equiv */
>     0x00000000 /* len=0, == no entries */
>                /* no equiv entries */
>                /* no ucode entries */
>     0x00414d44 /* MAGIC */
>     ...
>
> and I believe that Xen would parse it correctly.  Unless you think
> there's another case I've failed to consider?
>
> AFACT the check you put in rejects the len < "1 entry" case.
>
> There is no shortage of ambiguity here; the equiv table has both an
> explicit length, and commonly has a NULL entry at the end.  But, we can
> parse with a length of 0.

Bah, and just after sending, I've spotted the problem.  When len is 0,
the installed_cpu check (which is looking for the NULL entry) moves off
the front of the buffer.

I'm very tempted to first wire this into OSS_FUZZ, seeing as we've just
got that working for the emulator.

~Andrew

