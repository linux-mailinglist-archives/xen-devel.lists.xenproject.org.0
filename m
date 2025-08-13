Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A10B245B0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 11:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079625.1440378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um7yk-00011O-MO; Wed, 13 Aug 2025 09:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079625.1440378; Wed, 13 Aug 2025 09:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um7yk-0000zb-JS; Wed, 13 Aug 2025 09:41:06 +0000
Received: by outflank-mailman (input) for mailman id 1079625;
 Wed, 13 Aug 2025 09:41:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1um7yj-0000zV-Ap
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 09:41:05 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fcb3476-7829-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 11:41:02 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b79bdc9a7dso3883584f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 02:41:02 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a16dcbcb1sm23487255e9.3.2025.08.13.02.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 02:41:00 -0700 (PDT)
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
X-Inumbo-ID: 9fcb3476-7829-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755078061; x=1755682861; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LyMttfbIfSkmJZ4bdctvO14YzF/b6vAYyqPpIlYP50Q=;
        b=LJzsmw7N77xQPrn8Jw0CXHKsY6SrD/oUfLQYRY8uadkFnSL+TziJR6oId8fbQQ3kN5
         bitAo3eBsoX3hYBBtilYvAaTzShodUdAtxwaN/HjMClf7+0AsLkiua0tNjgQERTu8YUb
         uXN362rakCzSwQa64cxcKfnyppjrKJew5q+pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755078061; x=1755682861;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyMttfbIfSkmJZ4bdctvO14YzF/b6vAYyqPpIlYP50Q=;
        b=uBwUSd+/UB5lS1imSHz10a+8Ek0o4GXPPHDS+BXUDUONwe+WOVAEljJfI02+okl3Bt
         Ghc0W7PD2msQovBQITPvMoN/kadYQ9sTrU71bymSjDuNPwlquuioTmqpnKzKAZ+EX9hD
         5myNCpG30cwqdkI/TiWyQP8IQXyR0ijLpPCTHqhFwHhRJWIwGp3/MSpOeNpsGOmjC2BB
         ls1f0sLb5CFhPNSQGD/4yUWuaNavH6fQwSxpaZi5K2dPevDyAui1THADolgBcBJmgB7u
         MeXrDpUQL1PiFcvsXDTu7oRZ4rvGKmkiGVLmEecf0t/HXM0ViWXKS9p/3BbBsq4CZV6H
         hUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTAPjDylk0q547cy46E2sqZOjPmffqj/QoXF/wWDKOY/mVDgukJnK9rslmcqZ8J+POBJ78MLteWO0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yww5Vb+gXRUCPPRWuR/3yn/BacP+nL1xMN4VAuaDB1LbNax7BC7
	vZuPm3VXPBlcTH/7yd5eh3zLSAkzN2rl4oInPOVJRJUVt2dCSsBE/zB0ZJC8CLJlLxs=
X-Gm-Gg: ASbGncuV7gWYoj6sj/+XJmK61y0QO2ymmUhT6Jnpe4JmYPZ0iDaUWITB8aESHX1IHtp
	9ir6VgLsd+it1ESoAhwn8+tfTmIxGD/qYw5lPoWuowCtHoVl6xL9R+W96JMw1hCPbWgv+WvBP8q
	0E5ZE1owQtJI9jWQPOzDvnJ3wqITlq5WSPXdrwWc9yJNTnn3jm8NlRX68ML0PgrUrHtRBgd73Ke
	TiCc6SL/whggNGQKTOcYy0HdkEmUBwSPwBLIcMMpX7fcm4hhmCCKj2Q80oIEyUpUSh/x/xxr9ns
	WeLRcYz7RZXyJI6GbhEwzSwYwbl2wEUdoepVHn9ynhSsWdfSUC7+8xEZQ1xYVxwOYTtjUNPUup3
	79sg5bKkv99MdVflTNCL19V/32Saf/r7x/jK1/Mxqe4xlGnSCXKU8lVrH0s1ABlDUP3eBoO37uP
	EhROE=
X-Google-Smtp-Source: AGHT+IGQP8AyLuVmtkw2Ng955SDd6hwkDpfbhr+W45kUnOgc2gMQJmsUpTrU4Di0ymH3yFqe6iNBCg==
X-Received: by 2002:a5d:5848:0:b0:3b8:d1d9:70ba with SMTP id ffacd0b85a97d-3b917ef76famr1704748f8f.32.1755078061235;
        Wed, 13 Aug 2025 02:41:01 -0700 (PDT)
Message-ID: <5aadadb9-65e2-4f30-bac5-a2b3a2f4a29e@citrix.com>
Date: Wed, 13 Aug 2025 10:40:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] x86/traps: Drop incorrect BUILD_BUG_ON() and
 comment in load_system_tables()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-4-andrew.cooper3@citrix.com>
 <f8cfb9c0-f505-452d-b18e-801beea69d1d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f8cfb9c0-f505-452d-b18e-801beea69d1d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2025 9:11 am, Jan Beulich wrote:
> On 08.08.2025 22:22, Andrew Cooper wrote:
>> This was added erroneously by me.
>>
>> Hardware task switching does demand a TSS of at least 0x67 bytes, but that's
>> not relevant in 64bit, and not relevant for Xen since commit
>> 5d1181a5ea5e ("xen: Remove x86_32 build target.") in 2012.
>>
>> We already load a 0-length TSS in early_traps_init() demonstrating that it's
>> possible.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/cpu/common.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>> index f6ec5c9df522..cdc41248d4e9 100644
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -936,8 +936,6 @@ void load_system_tables(void)
>>  		wrmsrl(MSR_ISST, (unsigned long)ist_ssp);
>>  	}
>>  
>> -	BUILD_BUG_ON(sizeof(*tss) <= 0x67); /* Mandated by the architecture. */
>> -
>>  	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
>>  			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
>>  	if ( IS_ENABLED(CONFIG_PV32) )
> Well, the comment is wrong. Whether the BUILD_BUG_ON() itself is also wrong
> depends on our intentions with the structure. Don't we need it to be that
> size for everything (incl I/O bitmap) to work correctly elsewhere?

We don't use the IO bitmap.  We've talked about it a few times, but
never got it sorted.

Xen's TSS could be as short as 0x37 (covering IST3) and still work
correctly and safely (as there's no task switching).

A failure to read tss->iopb is the same as a failure to read the bitmap
itself.  In fact, it's probably marginally faster for users of
IOBMP_INVALID_OFFSET as it fails one step earlier.

~Andrew

