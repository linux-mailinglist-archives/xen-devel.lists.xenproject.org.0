Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566D2968B33
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788185.1197646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl9CQ-0000vp-E0; Mon, 02 Sep 2024 15:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788185.1197646; Mon, 02 Sep 2024 15:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl9CQ-0000tn-B9; Mon, 02 Sep 2024 15:42:38 +0000
Received: by outflank-mailman (input) for mailman id 788185;
 Mon, 02 Sep 2024 15:42:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl9CO-0000tf-DF
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:42:36 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9805c20-6941-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 17:42:35 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5333b2fbedaso7567259e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:42:35 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196968sm571591066b.139.2024.09.02.08.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 08:42:33 -0700 (PDT)
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
X-Inumbo-ID: f9805c20-6941-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725291755; x=1725896555; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ter6HA/ExTEG5lw4h64MR8IKlFYxPSt44L/cT+2k/VU=;
        b=rabvrd+XvRgzu9PQoXqL/y6WH+BmeDJuJm469kuAYktwa9JG6VBMsj6SsFx8maV1JW
         P550SsRzIZeFixNYm+/RYhsjAa1zUCkzhxVmhxsH777eWWleZMi9iitDn8ceRiw/S4TT
         1vET+q2//CzWF/2wvWM6/REztOZha0mDWnCKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725291755; x=1725896555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ter6HA/ExTEG5lw4h64MR8IKlFYxPSt44L/cT+2k/VU=;
        b=kPVkuAEDumJM7ZLcdup9xHF+1eSxs2Leazwswc+ON0nhlTGcEt1JZ2U0Q2u6a+YZCz
         awfgbVOkUg1IteUMni3RGQkmRS8U+L8MpGJ8J/MTslJwB0jmfeJTBWnNeqtRclNz/pYL
         q+av+NjekePi42EtoI1qf+E2BMjjRUIAGZHcwuzR2WDcLE+s5CHIDQ2kdQdWmhb+2qDg
         g3n54nSoS7IvUyijqDoQeCKJt9PJ2J3wT7p+VITBoez6TmPzYa9DgLDRCI1SDfAlkP1i
         XU5cNKn7ktUeD3Ugy/Ifyim+CihnS1SKzKjlqsDCqrdxmKSLlzV/Mzq/bfUKeR29GRth
         1r4A==
X-Forwarded-Encrypted: i=1; AJvYcCW6W4utiiwvJWhcoBCv7Z4Y7+gTI+0KLN8A/o0H+cGRb9Lr9DtSZrzrchG3DgRGxo5f09MLkcgpgew=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwowYvsMNwsUmOekOWPSLJK1QqhJPiWjwHo7e8cAIk9XiPsUzNx
	w7R4y22fK5HPRtb9P8CdYbP7g409F6EeQ8uYOLEgVwBLQy7GG9gQ04PkeGG5PYs=
X-Google-Smtp-Source: AGHT+IHLSH6YaFSDwn1fTtWILTqdbfQnrlkwtfbmB0Pb6FXIksHvsTfjR/stHKiX1lee5RUcrhlDSA==
X-Received: by 2002:a05:6512:224f:b0:52e:bf53:1c13 with SMTP id 2adb3069b0e04-53546afaae5mr7210719e87.7.1725291753918;
        Mon, 02 Sep 2024 08:42:33 -0700 (PDT)
Message-ID: <538d6f83-2126-49a2-bad4-df10d517a702@citrix.com>
Date: Mon, 2 Sep 2024 16:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/boot: Use fastcall for 32bit code
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
 <20240902133232.3302839-5-andrew.cooper3@citrix.com>
 <da874b44-08a5-4e49-a9e2-5495711926b7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <da874b44-08a5-4e49-a9e2-5495711926b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2024 4:39 pm, Jan Beulich wrote:
> On 02.09.2024 15:32, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
>>
>> RFC.  This doesn't boot, but I haven't quite figured out where yet.
> Because you got the register use wrong maybe? I think it's %eax, %edx,
> and then %ecx.

Bah, yes it is.  Also,

@@ -848,9 +851,9 @@ trampoline_setup:
         testl   $MBI_CMDLINE,MB_flags(%ebx)
         jz      1f
 
-        lea     sym_esi(early_boot_opts),%eax
-        push    %eax
-        pushl   MB_cmdline(%ebx)
+        lea     sym_esi(early_boot_opts), %ecx
+        lea     MB_cmdline(%ebx), %eax
+        /*      cmdline_parse_early(cmdline, opts) using fastcall(a, c). */
         call    cmdline_parse_early
 
 1:

is a wrong transformation I think.  The second leal should be mov.

I'll have another play when I've got some time, but for now I'll commit
the prior 3 patch to get rid of defs.h.

~Andrew

