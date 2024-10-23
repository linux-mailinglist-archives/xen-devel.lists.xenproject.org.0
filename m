Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254EA9AC652
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 11:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824485.1238602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3XcD-0003ed-Cv; Wed, 23 Oct 2024 09:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824485.1238602; Wed, 23 Oct 2024 09:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3XcD-0003dC-A7; Wed, 23 Oct 2024 09:25:17 +0000
Received: by outflank-mailman (input) for mailman id 824485;
 Wed, 23 Oct 2024 09:25:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJ8W=RT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3XcB-0003d6-Hw
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 09:25:15 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b495c92b-9120-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 11:25:12 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a0cee600aso816731166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 02:25:12 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912d636csm446904966b.36.2024.10.23.02.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 02:25:11 -0700 (PDT)
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
X-Inumbo-ID: b495c92b-9120-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729675512; x=1730280312; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sq7WzUK3PqY+nCo3Gc/XmJGD+0wZN+s8XxCFdfzBEiA=;
        b=jLMaKjuXzcKv2iC1f6iSsD0fVH9qDdSuHv9CWees9okCLk4sXiwhEe78M26gYPPFEF
         EOMLPWTDPrjRpzusuznLT0OBJAZQU8pqcHVASbMBAXV7PL3TdLmQ/nCLpjf07szUfcHJ
         DcEJIU6QjvHhSn/iPwyvyz3s64KG5LZdDw01U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675512; x=1730280312;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sq7WzUK3PqY+nCo3Gc/XmJGD+0wZN+s8XxCFdfzBEiA=;
        b=VXLS1BMhN+bUESCIM7BYt+43rRil+v8Er1LplRgZYguP7IogaK5yjG5CvPRjC9Sdv1
         kPK5Lk7LvqXHgUE4DytbW25+TOn2seK4z5JwKjmmeh9n9VHx81sKsAf2OT87OpDnwjVb
         qQUxK/V6YTZ93fQ3u9Cj4nZ66yCO6nyl18Cg9I6gYHR7kz3Nj3SqyS1Fsw8NwuLU593M
         JswqcUx4SIQbm93a2/HkUQFmZ5PwAslYNCOoqpYuTP8E3t01y9S9BXUGRQ/vpSiCUAhu
         7VrG/EOKBwSDnDnxNv/eLGFp2ejJBRVSULSurhIPAuRsFc5CUzD7XCt5OUK181J2EmbA
         CwLg==
X-Forwarded-Encrypted: i=1; AJvYcCXPycHCl/GjuRccMHHVF3f6Wc0mUHaxgoLotYmtrDrBL9mG7vE5rK+z8YA5WWleW4/UP7brSl/rkXk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIVPzh70hp95K/YxFaHzr5ot459Jz7b4rXtD3PR1E1eJFHjEyg
	fqNHKKdVVBVuZRspOjvTo/q4qKOOQgfUVgUMFsnlqhybC28k0ckCxBKljV4huGw=
X-Google-Smtp-Source: AGHT+IGR32LRauRF3sHqoMy5fZkH5ChxXRQhi8Dv51Kqo3Bw/iHkMCLRr3MqPogiYoUgOo4ToXh32w==
X-Received: by 2002:a17:906:4fce:b0:a99:ffb5:1db6 with SMTP id a640c23a62f3a-a9abf894224mr155145566b.24.1729675511995;
        Wed, 23 Oct 2024 02:25:11 -0700 (PDT)
Message-ID: <a733d521-8c08-4570-8947-99a2569dc374@citrix.com>
Date: Wed, 23 Oct 2024 10:25:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix PVH boot during boot_info transition period
To: Alan.Robinson@fujitsu.com, Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <cd8f29e7662f44999552be6e75ac6d6c@BEZP281MB2581.DEUP281.PROD.OUTLOOK.COM>
 <20241023071022.GA30985@ts.fujitsu.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241023071022.GA30985@ts.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/10/2024 8:10 am, Alan Robinson wrote:
> Hi Andrew,
>
> A small suggestion for the commit log..
>
> On Tue, Oct 22, 2024 at 12:41:14PM +0000, Andrew Cooper wrote:
>> multiboot_fill_boot_info() taking the physical address of the multiboot_info
>> structure leads to a subtle use-after-free on the PVH path, with rather less
>> subtle fallout.
>>
>> The pointers used by __start_xen(), mbi and mod, are either:
>>
>>  - MB:  Directmap pointers into the trampoline, or
>>  - PVH: Xen pointers into .initdata, or
>>  - EFI: Directmap pointers into Xen.
>>
>> Critically, these either remain valid across move_xen() (MB, PVH), or rely on
>> move_xen() being inhibited (EFI).
>>
>> The conversion to multiboot_fill_boot_info(), taking only mbi_p, makes the PVH
>> path use directmap pointers into Xen, as well as move_xen() which invalidates
>> said pointers.
>>
>> Switch multiboot_fill_boot_info() to consume the same virtual addresses that
>> __start_xen() currently uses.  This keeps all the pointers valid for the
>> duration of __start_xen(), for all boot protocols.
>>
>> It can be safely untangled once multiboot_fill_boot_info() takes a full copy
>> the multiboot info data, and __start_xen() has been moved over to using the
>  of the multiboot info data, and __start_xen() has been moved over to using the

Thanks for noticing.  Unfortunately this change was already taken to
unblock other pending work.

~Andrew

