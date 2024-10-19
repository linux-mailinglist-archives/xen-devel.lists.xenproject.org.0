Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D63479A5050
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 20:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822650.1236605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2E8Z-0005o8-Kt; Sat, 19 Oct 2024 18:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822650.1236605; Sat, 19 Oct 2024 18:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2E8Z-0005m9-I3; Sat, 19 Oct 2024 18:25:15 +0000
Received: by outflank-mailman (input) for mailman id 822650;
 Sat, 19 Oct 2024 18:25:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wyF=RP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2E8Y-0005m3-Et
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 18:25:14 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ab3617a-8e47-11ef-99a3-01e77a169b0f;
 Sat, 19 Oct 2024 20:25:12 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4315baec681so29703605e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 19 Oct 2024 11:25:12 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5c3127sm1141985e9.38.2024.10.19.11.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Oct 2024 11:25:11 -0700 (PDT)
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
X-Inumbo-ID: 7ab3617a-8e47-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729362312; x=1729967112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xKUZzJ2uALh4rWMkrM2kQSZXhZk0gUxTCwmYdo77P1I=;
        b=FJz7RsCYCmjCfyukY0UAhaaSNQfc3ayaML6W7RGBaNKmZ5R45RSlG4u+c+vpBzS8lx
         +a9QIf5D+evwcQrD3hBieCCMpejjh7u5sJuYB9ZaJZY/EWPJcelx+vv+p/2RamndMuie
         LR5qTNfZ8PAUA9bjr9EBLi8MxOLds14FT/w74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729362312; x=1729967112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKUZzJ2uALh4rWMkrM2kQSZXhZk0gUxTCwmYdo77P1I=;
        b=xIuFdOWUvJ6nz7cg0Xn1oeCjoYTbdHGrTDLJoh02g+VGgqlkV82Kttpeo0qolItind
         LMCDJoBzlXJXKGNaRjomGtZpCOBc/YxenJxagL+IBEwyp66cp8X2IIsxMjsACia0UpNS
         Z6yapbXdRdHg3AKeOi19Pt4lxRlNr06P2PlJ58Oo39ribOMVunUoFPM1IL9g8PEZY+Bz
         xNu5WW0NEZRpqBsdEcLu29w9ZVWYDzNX1qWfuC8x+K1Rrc8SZauSvHXtDFlbFtagnBFx
         mJCIKpmNICYoEaxMP9JzuXsn/afxf2Iv5PNv6ISPVsGD06bIrKaR3Cc2YADHyvxTvBgw
         BdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXn1iq8FpStCbVGdER6TR/bFb36vE1Ch2LJsp4M3VjPG34UmsGTfp/jpmnSjlvcdZfsX/EDbxzo8U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyh6LI2TGG7OBSaU9omQaXh3uWGAXGP0kgt2kiEXQMzMzj+Nuwo
	v+PIcZMc45IVPsY0odzc2X9y5TtUm+O6KD14yNw1/0FFThxqyruIXIw6FlTwkIE=
X-Google-Smtp-Source: AGHT+IEp++LahRvUD1lKKFhIpoeGZnAfN/7Ne5CZSdCJOQfwgnaGYNYotm1QTxRz3wy0g85+eM0+Kw==
X-Received: by 2002:a05:600c:1c8d:b0:431:12a8:7f1a with SMTP id 5b1f17b1804b1-4316165d3acmr57045915e9.16.1729362311964;
        Sat, 19 Oct 2024 11:25:11 -0700 (PDT)
Message-ID: <705c02d2-c0a4-4b02-a5c2-88538eeab644@citrix.com>
Date: Sat, 19 Oct 2024 19:25:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix PVH boot following the start of the MBI->BI
 conversion
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241019182054.3842879-1-andrew.cooper3@citrix.com>
 <bf9041cd-04bb-41c4-a221-67403d1ad6bb@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bf9041cd-04bb-41c4-a221-67403d1ad6bb@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/10/2024 7:23 pm, Daniel P. Smith wrote:
> On 10/19/24 14:20, Andrew Cooper wrote:
>> pvh_init() sets up the mbi pointer, but leaves mbi_p at 0.  This isn't
>> compatbile with multiboot_fill_boot_info() starting from the physical
>> address,
>> in order to remove the use of the mbi pointer.
>>
>> Fixes: 038826b61e85 ("x86/boot: move x86 boot module counting into a
>> new boot_info struct")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>>
>> This is a testiment to how tangled the boot code really is.
>> ---
>>   xen/arch/x86/setup.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 6746ed8cced6..bfede5064e8c 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1048,6 +1048,7 @@ void asmlinkage __init noreturn
>> __start_xen(unsigned long mbi_p)
>>       {
>>           ASSERT(mbi_p == 0);
>>           pvh_init(&mbi, &mod);
>> +        mbi_p = __pa(mbi);
>>       }
>>       else
>>       {
>>
>> base-commit: e9f227685e7204cb2293576ee5b745b828cb3cd7
>
> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Thanks.  I'll get this committed right away so OSSTest can start working
on untangling itself.

~Andrew

