Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198A597A085
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 13:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799435.1209419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqAEN-0000Lo-1s; Mon, 16 Sep 2024 11:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799435.1209419; Mon, 16 Sep 2024 11:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqAEM-0000In-VI; Mon, 16 Sep 2024 11:49:22 +0000
Received: by outflank-mailman (input) for mailman id 799435;
 Mon, 16 Sep 2024 11:49:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sqAEL-0000Id-PG
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 11:49:21 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b55aa09d-7421-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 13:49:19 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so598569966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 04:49:19 -0700 (PDT)
Received: from [10.9.6.216] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f43a4sm301520266b.83.2024.09.16.04.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 04:49:14 -0700 (PDT)
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
X-Inumbo-ID: b55aa09d-7421-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726487359; x=1727092159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zN3ea+lFEGKiauwZ/y1HhMa39LOVd2JEM9WjfTi/aqY=;
        b=XfIRffNlvnZEFvsrPvqa1G0nuHlbjFumgy9wAHR5jG2pKMrQWBk8cAbwrg7anmEcN8
         YpfsTawqWH9q/3Bv/nPuLEMsgZxD1SQcSGhD6c7W1sDmN+Y6J0XSMOuHP8pWqgBPC5sK
         uZJlzj4JzX6lckyOz3yfYauLEvrLQFJkzTxvqykc5N5WEx+AP8ePalDV3aLG/lx8qKx/
         zgemPykwN70HV1NdFRI+XMFtv7ERPIKOcw2tEgKY1ppEXP48SsmbcpWy9fnipOz6SwS8
         OHt4ZcLIRlWFgCjxL682T1gu8OcYiQ+pUiYrV8WaXz7lYT9PgCjct1Mh+Q64iqxAan7k
         bZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726487359; x=1727092159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zN3ea+lFEGKiauwZ/y1HhMa39LOVd2JEM9WjfTi/aqY=;
        b=X6YbkDVysFgIgBeSi/yT6f4KU9sXBGPVlO4xXnZYhCoP4RyyideOHR6AcbS/rSOcND
         UbSKTcStqL+/Kwn6GotJrpMv+OaQP7QsK/nDYoDZR5n4UmbTj6XIYBtMHc1kvDGCuVIC
         lc4K7N/hZo9FUSHQJ9XGMaJBDzlVFhxLVJIqTVOwSf40eqUCu2Lw6DZOm8O5st9W1rGR
         A78QbWNF4O1p4uoFyDgeGC+NPKVNY+qyil9ITolfGhgWs7/WgN4AKYVIvtcLYyt5A2wd
         UznV4EwTnVFMKPwch0MfprCWsT01jVYxmRDOfLD13Uyp4Nc69QnuBrwmjXLJZeFuTi2q
         d9CA==
X-Forwarded-Encrypted: i=1; AJvYcCV2RhncMbbxEhX33bdV1qf0AJFvVsjhsZ+VOAssqGNo4GDaZjKKJFrXD5qVfRcbFMYD8zsdutV7+0U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEjbdFFuD1/+RfcWRiRyDkyFgSAPgvEo+XOADT5iwDE+i7hM0S
	AkG9DSxf9kOt4nAz30dF53z+vVF26jPbbICttNwurRV1NzPDTIiWoBFPSNLOXw==
X-Google-Smtp-Source: AGHT+IGIhfZY1EoOdiUCr0fXVjc51fFET3fidWW0OBcN0c242VkQ6d+6N2nmZqV3wL/qHIz1MTWkeQ==
X-Received: by 2002:a17:907:1b05:b0:a8d:1224:f54 with SMTP id a640c23a62f3a-a90293b15d0mr1701146366b.5.1726487354445;
        Mon, 16 Sep 2024 04:49:14 -0700 (PDT)
Message-ID: <ab9a6b28-b38f-4561-9c8e-e68c16537b60@suse.com>
Date: Mon, 16 Sep 2024 13:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: Put trampoline in separate .init.trampoline
 section
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240911095550.31139-1-frediano.ziglio@cloud.com>
 <d8627af4-5149-48ed-b107-f2401e6dddd3@suse.com>
 <CACHz=ZjznRNkbTtDwH7jf=Va0r2+c5Tc7DB+pCdFg3aFERDc-Q@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CACHz=ZjznRNkbTtDwH7jf=Va0r2+c5Tc7DB+pCdFg3aFERDc-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.09.2024 11:11, Frediano Ziglio wrote:
> On Sat, Sep 14, 2024 at 7:16 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 11.09.2024 11:55, Frediano Ziglio wrote:
>>> +  DECL_SECTION(.init.trampoline) {
>>> +       *(.init.trampoline)
>>> +  } PHDR(text)
>>> +
>>>  #ifndef EFI
>>
>> If this is to be a separate section also for ELF, I think that
>> wants mentioning explicitly. "Easily disassemble" is too vague
>> a reason for my taste.
> 
> It's not clear if either you changed your mind on that reason or if
> the commit message is not clear. I'm assuming the latter, I'll improve
> the commit message.
> Not clear why you specify "ELF" in the above sentence, I mean, why
> should it matter if it applies to EFI and/or ELF? And why having it
> different from ELF to EFI?

Why do we fold sections at all? We could keep them all separate, leading
to a big section table with -f{function,data}-sections. If you want to
change something, you need to clarify why the change is being made, for
every part that is affected. We don't have a need for the separate
section in ELF, so it becoming one without at least saying so (and
ideally also why) it might look like an oversight / mistake to someone
later stumbling across that commit.

Jan

