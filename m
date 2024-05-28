Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC0A8D218B
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 18:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731235.1136637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBzax-0004mg-F7; Tue, 28 May 2024 16:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731235.1136637; Tue, 28 May 2024 16:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBzax-0004l7-Br; Tue, 28 May 2024 16:22:39 +0000
Received: by outflank-mailman (input) for mailman id 731235;
 Tue, 28 May 2024 16:22:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bNtp=M7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sBzaw-0004l1-3Z
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 16:22:38 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e792d75-1d0e-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 18:22:36 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-794ab0ae817so68874885a.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 09:22:36 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abcdb0eesm393735385a.62.2024.05.28.09.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 09:22:35 -0700 (PDT)
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
X-Inumbo-ID: 7e792d75-1d0e-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716913355; x=1717518155; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sUnYhND7PQlHomPbEnz4JdcDacy+I5ez0ubP1Mezda8=;
        b=CBA+G77+6TGc/ief98T7Fp2GEE154KcZVu4hD92Dy43pq2yanH3RtOitgXzSyFIS/9
         vk4v+RRQT5udwULAbzg8G1zEW6kgTqcEr1D8l9VVbDZ8JBgGkZ8a60Jfpr9ffsvrKK6I
         opA7SgqOfymoUW2RsklEaMC6SBZOyvfPBbInQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716913355; x=1717518155;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUnYhND7PQlHomPbEnz4JdcDacy+I5ez0ubP1Mezda8=;
        b=uEW1C3cmwZ/n+0FtJIzJMme0BxrErUadIH8nyFP3BYtp7Dl2BqZp75JKrcDoCGXI67
         QRAhNw4Scn4n6v3G6f+aQn1OO3i0eD8PZmvW14M6T7QPzU5072iMeOv+RbC7P3hXPuAz
         /Rbrko29PwHUupZRCxfqboN6XK4Aqy6ZXf03cFNfT8rYGitIXu17OH5/uXafXssauk3I
         pf9Ni/eIRXY5Cry8kmVIomjKCfrk5TsVPfPejAfaA56dYE5QFLSNoqHA2+ueCEEs6/MP
         Y/5PZBtYA/e/OPM21T9ZqhG/V61DpOZudyYAN4W7MglRz9tTF2NcgI39PFWXTzh+0KzY
         7Mlg==
X-Forwarded-Encrypted: i=1; AJvYcCV0ycxF2Q/3sq4twao0/YYn8FyD1q+DaunwG/1m5K4kK5kzcy9ts6JmD19qe3pSgThGSNIQ53ErC3fjdmCFtMmu38vxkf+xPyfsap8Wf04=
X-Gm-Message-State: AOJu0YyyUuTFI6Z2nCKPpCayGYrxQiGwe7zyr98u+4uZRQIJ2oXgRz8i
	pvhtWAKLCMsdzNI3ey7KEMhgIbkAgyB7rzPARY+XVOjvOIHhxGwTU2UcqKutMkg=
X-Google-Smtp-Source: AGHT+IFxJH8fEv+nRbiTF535AWb9/2KsS5YtYvlvmPKXOuz/Cc01WE4bH71x12PLQN7E6azaI/IN4Q==
X-Received: by 2002:a05:620a:904:b0:792:989e:7c4e with SMTP id af79cd13be357-794ab13e8d4mr1273718185a.72.1716913355523;
        Tue, 28 May 2024 09:22:35 -0700 (PDT)
Message-ID: <7ae01b1a-2c22-4cca-aea1-b5c5fe76fa73@citrix.com>
Date: Tue, 28 May 2024 17:22:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/x86: Drop useless non-Kconfig CONFIG_* variables
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240521171546.3650664-1-andrew.cooper3@citrix.com>
 <20240521171546.3650664-3-andrew.cooper3@citrix.com>
 <bd0fe385-73a4-4f8f-b7b0-28acc9078f40@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bd0fe385-73a4-4f8f-b7b0-28acc9078f40@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2024 7:03 am, Jan Beulich wrote:
> On 21.05.2024 19:15, Andrew Cooper wrote:
>> These are all either completely unused, or do nothing useful.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Not an objection, i.e. you're fine to commit as is with Stefano's R-b, yet
> still a question:
>
>> @@ -30,11 +29,8 @@
>>  /* Intel P4 currently has largest cache line (L2 line size is 128 bytes). */
>>  #define CONFIG_X86_L1_CACHE_SHIFT 7
>>  
>> -#define CONFIG_ACPI_SRAT 1
>>  #define CONFIG_ACPI_CSTATE 1
>>  
>> -#define CONFIG_WATCHDOG 1
> I wonder if this wouldn't make sense to become a proper Kconfig setting,
> thus ...
>
>> --- a/xen/include/xen/watchdog.h
>> +++ b/xen/include/xen/watchdog.h
>> @@ -9,8 +9,6 @@
>>  
>>  #include <xen/types.h>
>>  
>> -#ifdef CONFIG_WATCHDOG
>> -
>>  /* Try to set up a watchdog. */
>>  int watchdog_setup(void);
>>  
>> @@ -23,13 +21,4 @@ void watchdog_disable(void);
>>  /* Is the watchdog currently enabled. */
>>  bool watchdog_enabled(void);
>>  
>> -#else
>> -
>> -#define watchdog_setup() ((void)0)
>> -#define watchdog_enable() ((void)0)
>> -#define watchdog_disable() ((void)0)
>> -#define watchdog_enabled() ((void)0)
>> -
>> -#endif
> ... assigning purpose to these stubs.

Actually I need to keep CONFIG_WATCHDOG to not break the build on other
architectures.

watchdog_{en,dis}able() are called from common/{debugtrace,keyhandler}.c.

I'll leave it in place for now, and we can Kconfig it up later.

~Andrew

