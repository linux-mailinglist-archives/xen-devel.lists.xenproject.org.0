Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F518C765F
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 14:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723272.1127966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aEo-0000g5-IM; Thu, 16 May 2024 12:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723272.1127966; Thu, 16 May 2024 12:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aEo-0000dm-F5; Thu, 16 May 2024 12:29:34 +0000
Received: by outflank-mailman (input) for mailman id 723272;
 Thu, 16 May 2024 12:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3ow=MT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s7aEn-0000de-17
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 12:29:33 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0779cfc-137f-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 14:29:28 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a5a5c930cf6so293598366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 05:29:28 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17894eb1sm978064266b.77.2024.05.16.05.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 05:29:27 -0700 (PDT)
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
X-Inumbo-ID: f0779cfc-137f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715862568; x=1716467368; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fXVS35DRWL5MxvMZYr1vkxLTGtIPJS670c3yyt/vKK0=;
        b=bI1KsyOyfLUpHDeUi3tj6kF0BrcqF0O3FFaQ2KgyzwLApoRXBAju6whGkcLeBCzJlA
         o2vSJt7eT1X/hvcYvH9yNMJA3BfRWKvfSnuka5/8OWuxAGmHRFWRw0fgkEmaD1MSJVV+
         9welR4DY8tvXoWGSmf5nbgL07LrYLIeYzyjB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715862568; x=1716467368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXVS35DRWL5MxvMZYr1vkxLTGtIPJS670c3yyt/vKK0=;
        b=AKxLn9N3QO/2AXnLUkUlr9B7o9Cx6sojkVYeLHxuDKx8Oj5FjFC3u3l/YJa8AhlJGg
         VVqnKBNSpALCLOYDkn/S9TtK1QMCvHHxaF+wg6ZNd6Gr8KOMeU9acqIO5U6qOiII76yM
         mYkMAIQKRLeRanzSZHnf+ijivrB70xg2QZkzunuPjbtSDPKbFsTM7COq0blwAB6Burgz
         7aveaI4d7kRFKcgfYKP7X/9pgUPL4JTRgo1XwlpslyB7x+M8DzFmz6w6Ebi0DdCQJpcw
         9tqQN+OtSkDsrx0KNZxhnQvnRRj94oxjnbKucbpJxVRkZX/YUPLaA5GhNCMb1NS0eBP5
         IKrQ==
X-Gm-Message-State: AOJu0Yy1BaTchC48oZskFKeehkIo0bHqn0hdVnr84zYFd4bb7nsMHkqW
	/hYc0D59xs1rj9+VR8akdaRFCu/R+WDwy+G+7MpnjSEfwEAGwtLC1yHMm9IdEfo=
X-Google-Smtp-Source: AGHT+IEEk79PY6c/JBYBCzUGCzWhh0AMdXMCJqxePBrDc+Qb498ep3AZaoNlKRFcszH+TMj18PXVCQ==
X-Received: by 2002:a17:906:1358:b0:a59:9eab:1622 with SMTP id a640c23a62f3a-a5a2d665e06mr1183512266b.56.1715862568328;
        Thu, 16 May 2024 05:29:28 -0700 (PDT)
Message-ID: <7965ba74-9177-44b7-9253-7ab5a77fd88f@cloud.com>
Date: Thu, 16 May 2024 13:29:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Add install/uninstall targets to
 tests/x86_emulator
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
 <ZkXvdWf2mVkPW458@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <ZkXvdWf2mVkPW458@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/05/2024 12:35, Roger Pau Monné wrote:
> On Thu, May 16, 2024 at 12:07:10PM +0100, Alejandro Vallejo wrote:
>> Bring test_x86_emulator in line with other tests by adding
>> install/uninstall rules.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>>  tools/tests/x86_emulator/Makefile | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
>> index 834b2112e7fe..30edf7e0185d 100644
>> --- a/tools/tests/x86_emulator/Makefile
>> +++ b/tools/tests/x86_emulator/Makefile
>> @@ -269,8 +269,15 @@ clean:
>>  .PHONY: distclean
>>  distclean: clean
>>  
>> -.PHONY: install uninstall
>> -install uninstall:
>> +.PHONY: install
>> +install: all
>> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
>> +	$(if $(TARGET-y),$(INSTALL_PROG) $(TARGET-y) $(DESTDIR)$(LIBEXEC_BIN))
>> +
>> +.PHONY: uninstall
>> +uninstall:
>> +	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET-y))
>> +
> 
> FWIW, should you check that HOSTCC == CC before installing?  Otherwise
> I'm unsure of the result in cross-compiled builds, as the x86_emulator
> is built with HOSTCC, not CC.
> 
> Thanks, Roger.

Right...

More generally, should we do s/CC/HOSTCC/ on all compiler checks? I see
no particular reason to do them on $(CC) rather than the actual compiler
used during build.

Cheers,
Alejandro

