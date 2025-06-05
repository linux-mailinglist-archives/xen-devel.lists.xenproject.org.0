Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E73EACF559
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 19:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007279.1386599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNENb-00005Y-9H; Thu, 05 Jun 2025 17:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007279.1386599; Thu, 05 Jun 2025 17:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNENb-0008Uh-5P; Thu, 05 Jun 2025 17:27:51 +0000
Received: by outflank-mailman (input) for mailman id 1007279;
 Thu, 05 Jun 2025 17:27:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fE9Y=YU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uNENZ-0008Ub-Hn
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 17:27:49 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65fbb34e-4232-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 19:27:47 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso910053f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 10:27:47 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f009745esm25319920f8f.71.2025.06.05.10.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 10:27:46 -0700 (PDT)
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
X-Inumbo-ID: 65fbb34e-4232-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749144467; x=1749749267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wG53aF3P/FVLr8FUd22VowQZ62LTgckKUyZxkDap7hI=;
        b=WFNQqTCWo8SbEDWxUcxGqWRD9RPJ0/usGSa4M3Wc3VVv67/Ms9m5QPi2AZcJnnV6sz
         aXjOJw7KwlIrLKB6iKY8SQPpdLYlEMx19Hd8os1WJvDHDms+voTsKxcgsplugRjjlVbs
         0KN83veL3JJ/I5y5UPSA9nXQyrJID1vJ4k4Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749144467; x=1749749267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wG53aF3P/FVLr8FUd22VowQZ62LTgckKUyZxkDap7hI=;
        b=uq0CMW/3rvPMzHdHuwdB1P0KS2+NrPBjas4eGvavQV1aRWzLt396KSU2HAVe+HHF0q
         K+xoAThUcs2hI/np24c7KxMCKaGRCAcW5+jmM5EFyUwVLMta2dFWIC1rZk+gIUccPak+
         QnLjrGbvtimQKecu34yLDgV0rXXAwWGYYG6/E4Ljcwim1fsbWWGrHhFlfhQbxdC5BBcU
         lqwnt2B3kG2qUkKGpg1MOtC8xTRdh2zL/Q2n3mM1GhqyYdy9Z6ImVwoDAFfvoZXgLO2x
         FASJ1ocHeM+Sv1XWWrPqwvK6ZVJrKMMKcmciyvUJmJNu4H6mqri44aijRqlAJpY//etT
         MuUg==
X-Forwarded-Encrypted: i=1; AJvYcCWnOS29ZsSgmycOHBQ13bkitc2TQoTuFVuIIm5E64qC+M1nKJ5DyBsIxjGQcIrL7vln2IuxYGBNkFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQFaQLTP4Q5qA30CW2cDosBCtuMu2dFXEoriw1ZROPtelNAFR2
	NJ2JiKjg3QWqATx6WsU4dctD+BI1AFKAu8EnttgD98unZ8V1g3Px6Lnd9RMntYzLphA=
X-Gm-Gg: ASbGnctqUm5s0kQYv9xlseL5JcvYmSJ4Ir+A4A1PWuWJL9wwSjsuPvV0vmMB+zvgknk
	xIbQtbE/XCQ9o5Gn8wwXSOxmFfH1Gdkj52CU5HzpMehOCM8XXm5ifO0bKzbcdeLZCSxjeP6A0MQ
	PceuY9uWCbD0qD4vi0JaWm+/823zzs0yXYTj41/I4FGWIb1qWjgJLwmwmk9mqZXWE0GaxOYlLNs
	aNN+oq6YLvnw1jTfTfvER4zNSxBnpr3msuL8kBERJP55TBuMdya8qGP9ONL7viJ/sFPslrIiW5A
	JyuEQTdiXaJFwThv5LZ/qok9+iYZqmpt8NNOts4zXUUO8WwvoLaNNrEpJYaZAVJIr1Lessc9nvc
	bItj7ybFtdodAncji
X-Google-Smtp-Source: AGHT+IF//QMHvHUk6ZzTvJKR/CMoCbHcdoxm3Sgr/huzSN5eLZho3fvDuf9HIzoI2ekojma+H65Bcg==
X-Received: by 2002:a05:6000:18a9:b0:3a5:2cb5:6402 with SMTP id ffacd0b85a97d-3a52cb56953mr2511721f8f.12.1749144467062;
        Thu, 05 Jun 2025 10:27:47 -0700 (PDT)
Message-ID: <cef03d51-1d5c-46fc-9195-4efe8d0488dc@citrix.com>
Date: Thu, 5 Jun 2025 18:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] x86: re-work memcpy()
To: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
 <017e689a-41a2-4722-a5e7-19ffef27500f@suse.com>
 <81da4e8e-9dcf-4630-a535-39ce0b07260c@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <81da4e8e-9dcf-4630-a535-39ce0b07260c@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/06/2025 6:06 pm, Teddy Astie wrote:
> Le 05/06/2025 à 12:27, Jan Beulich a écrit :
>> Move the function to its own assembly file. Having it in C just for the
>> entire body to be an asm() isn't really helpful. Then have two flavors:
>> A "basic" version using qword steps for the bulk of the operation, and an
>> ERMS version for modern hardware, to be substituted in via alternatives
>> patching.
>>
>> Alternatives patching, however, requires an extra precaution: It uses
>> memcpy() itself, and hence the function may patch itself. Luckily the
>> patched-in code only replaces the prolog of the original function. Make
>> sure this remains this way.
>>
> We can probably workaround that by using a separate memcpy for 
> alternatives patching. So it wouldn't end up patching itself.

Not memcpy() you can't.

The compiler is permitted to invent calls to memset()/memcpy() out of
thin air, e.g. struct big_foo = {}; as a local on the stack.

This is the same reason why it's impossible to do speculation safety in
C; you cannot guarantee to get protections ahead of the first RET.

~Andrew

