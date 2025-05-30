Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45319AC915A
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 16:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001306.1381499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0Ye-0005Xg-Js; Fri, 30 May 2025 14:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001306.1381499; Fri, 30 May 2025 14:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0Ye-0005VJ-H8; Fri, 30 May 2025 14:18:04 +0000
Received: by outflank-mailman (input) for mailman id 1001306;
 Fri, 30 May 2025 14:18:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OMCM=YO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uL0Yd-0005VB-6L
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 14:18:03 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5460a4b-3d60-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 16:18:02 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-442fda876a6so17649285e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 07:18:02 -0700 (PDT)
Received: from [10.81.43.171] ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00a13fasm4944454f8f.98.2025.05.30.07.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 07:18:01 -0700 (PDT)
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
X-Inumbo-ID: e5460a4b-3d60-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748614682; x=1749219482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=boSpWoghs7SIdMQQNzZ87YDtcYUbCEVl0bHQdthmwck=;
        b=lrI8mvRVzQIZF3pY6zQT0BxMp3hond0IaOo+8dn8Ls/ixAJK0qhPYRrxxVnUM23lTP
         wzpWxKz3XFmIP+QlO9DIAo/n12aRHhEdS8TBMyO/wS3vlQkWksjWXwMnP5hA90mPqcqu
         7s0eKu9NIY+YsXfVDNCUFmC9IlyLTTak/pMlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748614682; x=1749219482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boSpWoghs7SIdMQQNzZ87YDtcYUbCEVl0bHQdthmwck=;
        b=TiHX2wMI5/cbjLzRn25wZwl5DCjRPSPo6eUf2agd43eFbfLvcKr9gwW4Lm8fT4lPtK
         OsofDJFC26Rmz3a41GNweEPDwOCAzKUhKnsW/ziX0zD1QGxJ4xfDHMSJyEhneMkYitB1
         040GS5q6Wwtw5nXXj2P3KmgbTUef/V1PFTLXjN1Lb+S7FPPJc6U9undKh5xRzREP30gA
         pYzjaEDomp+FlzQECG/gYRxpdPJ3ql6oqSk8op/A7uDTeIksFVTzRoCf7NwhWkJ1x7oI
         YsIwxkaYL8paGWNLWbRLEIm7quhc8dlxoiwC0IRp/6/AL0bP8QVa0iWnrCcBf7+oYTJs
         s0VA==
X-Forwarded-Encrypted: i=1; AJvYcCVa4nSJR+/3TnKpgmYH1GQYg633dGb9YPjMYVTQLrUwjSZTA6FnbJ5g2eidEa+PN6f84maow4fFX9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0TyCxbkGK/lnePqKRXYZyyqxvmmMjmcbovWSGH3Odgsj1jqMA
	CJ7HHlmXubILfnmD/vsaOdqarpQHCigecRRIhAgx6paxRk1wbE86FZ815wnf5mSmVyE=
X-Gm-Gg: ASbGnctaSs+zsxNzzeTEYjUW7Y/i8Zak3X9H95zi5sYOutw5TIrvY5A/w8CC2dACNB8
	l8dvYxqM29jUp1X+A6tVZaWpqap+1/R+mSexkSemq1qS8AsG1jNAhG05Xzri4P57RAcA9QXJ2/U
	uLJyjbAGpqQQVkXlF97VfHbkgI9M/aKpEopNDuqOTRZjVKylfR30+FFWZpjrTPc+8QzCHOOh3Gl
	bg/DFkLb1fPx8aaVwIz8HMIW8YTqjG8dGI/91fypKO9FUk/Xsr6Gb+zxFqOipXbqKr+yi3stpV8
	I5Li56u2jsZdtC3xYfhn/HBLsTPd80Z5QfJrQyMVUc7j99FQ9wwmt3FEwtw7qg==
X-Google-Smtp-Source: AGHT+IHoDU4ef8LJNXOnC2LlSlPol9YfSgER98Baxq4tUSqzupxGj9MuqW2iobidjRxf/N9tQW2K/w==
X-Received: by 2002:a05:600c:1e06:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-450d655ffb7mr23737555e9.28.1748614681586;
        Fri, 30 May 2025 07:18:01 -0700 (PDT)
Message-ID: <c7ba265f-b771-44ef-818b-44082b4f1c0c@citrix.com>
Date: Fri, 30 May 2025 15:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Add install/uninstall targets to
 tests/x86_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, Michal Orzel
 <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
 <724b77b5-3b78-436e-bd20-726c34bef03b@citrix.com>
 <847c263c-1fe1-4a68-9962-8d998a3c272d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <847c263c-1fe1-4a68-9962-8d998a3c272d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/05/2025 8:06 am, Jan Beulich wrote:
> On 20.05.2025 23:02, Andrew Cooper wrote:
>> On 16/05/2024 12:07 pm, Alejandro Vallejo wrote:
>>> Bring test_x86_emulator in line with other tests by adding
>>> install/uninstall rules.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>> ---
>>>  tools/tests/x86_emulator/Makefile | 11 +++++++++--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
>>> index 834b2112e7fe..30edf7e0185d 100644
>>> --- a/tools/tests/x86_emulator/Makefile
>>> +++ b/tools/tests/x86_emulator/Makefile
>>> @@ -269,8 +269,15 @@ clean:
>>>  .PHONY: distclean
>>>  distclean: clean
>>>  
>>> -.PHONY: install uninstall
>>> -install uninstall:
>>> +.PHONY: install
>>> +install: all
>>> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
>>> +	$(if $(TARGET-y),$(INSTALL_PROG) $(TARGET-y) $(DESTDIR)$(LIBEXEC_BIN))
>>> +
>>> +.PHONY: uninstall
>>> +uninstall:
>>> +	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET-y))
>>> +
>>>  
>>>  .PHONY: run32 clean32
>>>  ifeq ($(XEN_COMPILE_ARCH),x86_64)
>> [starting a clean thread]
>>
>> x86_emulator is not special enough to behave differently to the rest of
>> tools/.
>>
>> Theoretical concerns over cross compiling test_x86_emulator for non-x86
>> can be fixed by whomever first wants to do this.
>>
>> The very real problem is that this doesn't run in x86 CI, because and
>> only because it doesn't have an install target.
> Well, I won't insist on any of the adjustments to be made that previously
> were discussed, yet I wonder: Elsewhere you complain (at times loudly)
> about (building up) technical debt.

Yes I do complain about technical debt a lot.

Technical debt is having a test and not running it.

>
> Further, without the compiler overridden to be the absolutely newest one
> available, coverage of such testing would be limited (especially if some
> of my work there would finally, in part after years, be unblocked). Yes,
> that's better than nothing, but still ...

Still what?  We literally have nothing, and this gets us something,
without interfering with anyone's pre-existing workflow.

Alpine Linux (the base of our GitlabCI testing) is prompt at keeping
it's GCC up to date.  (We're less prompt at staying on up-to-date
versions of Alpine, but that's on the todo list.)

~Andrew

