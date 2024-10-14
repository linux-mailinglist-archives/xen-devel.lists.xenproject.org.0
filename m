Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E236B99D3F0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 17:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818762.1232050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0NMt-0005ln-O1; Mon, 14 Oct 2024 15:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818762.1232050; Mon, 14 Oct 2024 15:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0NMt-0005jb-LQ; Mon, 14 Oct 2024 15:52:23 +0000
Received: by outflank-mailman (input) for mailman id 818762;
 Mon, 14 Oct 2024 15:52:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QJ8R=RK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t0NMs-0005jV-8U
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 15:52:22 +0000
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [2a00:1450:4864:20::642])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c1ce520-8a44-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 17:52:21 +0200 (CEST)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-a99f1fd20c4so331068366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 08:52:21 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a1cf76b1asm66362366b.132.2024.10.14.08.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 08:52:20 -0700 (PDT)
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
X-Inumbo-ID: 4c1ce520-8a44-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728921141; x=1729525941; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hoUHiVbYxgVUR25eEcRHopYWBdb7cDZO57dBiAeiJL8=;
        b=YsB3lZcCPprZJS6nrZX3Olz/m18+I9/P/wEFhphFLJRev1PxQOGO1lBwCw0AREL58U
         wK/N1UoNZxopLNt71DnGYFkztDGahYi95VHRXEIadgUuEP9+s/SJ/5SXIpq6i2Fz6bRU
         aibRELfutCU03H15vCYd4MV/KBzF89mhMkTPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728921141; x=1729525941;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoUHiVbYxgVUR25eEcRHopYWBdb7cDZO57dBiAeiJL8=;
        b=FOiQ6gPCA8Pg1/O5xtQ7tg590SajZboOevpLiQgv8C9HHKbBNu4AE4RC4x6eLLCBcq
         shv8pemCy3jy+VHOcqs+l/y4pAG6zEINVl6uEi5wjgsqTMPjF3W6t20LE8S/mxBS9WsG
         D4c8Z4MXUzDxwcSQLWVQNcP+U53692SharTVTeaZh+Y6pwKW7RCWJHs66F0G4W2id7M3
         csHuUe62DRxZC2p5Npo4APc2SSDytJd3WCsUz6OIxJ6LDGTj+UAK6/ZFjkSgrwt7GVQc
         Q6E0L9FkiVTMgV2AiDQwd6poApdxoPdYoyu+WaYwJj45FDm9CSxDcy4fx0c4ycHIj/tV
         NALw==
X-Gm-Message-State: AOJu0YyJ+qCdN08F3dhZA2PEuSsEJJKWbZKiivwKmLKwr0b5J+k7kVlG
	AkqQzS0e7HynU1f9uu3oE+IW7gc4KVYxzarqgetVXYZxKCeY/4j9cDLZmWwMMP4=
X-Google-Smtp-Source: AGHT+IGeSOCCGPsnUFJlRdBV+LwhFnnn30ikYlBbbq7+kgZjrKkWDAJGx7PJuzKas29VB21eHALIgA==
X-Received: by 2002:a17:906:df46:b0:a9a:1092:b10c with SMTP id a640c23a62f3a-a9a1092b143mr175074166b.12.1728921140510;
        Mon, 14 Oct 2024 08:52:20 -0700 (PDT)
Message-ID: <903195fd-680a-4701-9977-d2dbe1142f36@citrix.com>
Date: Mon, 14 Oct 2024 16:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: Anthony PERARD <anthony.perard@vates.tech>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
 <20241014085332.3254546-3-frediano.ziglio@cloud.com> <Zw05Tb8UvCQAIo+n@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zw05Tb8UvCQAIo+n@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2024 4:31 pm, Anthony PERARD wrote:
> On Mon, Oct 14, 2024 at 09:53:28AM +0100, Frediano Ziglio wrote:
>> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
>> index 1199291d2b..23ad274c89 100644
>> --- a/xen/arch/x86/boot/Makefile
>> +++ b/xen/arch/x86/boot/Makefile
>> @@ -1,4 +1,5 @@
>>  obj-bin-y += head.o
>> +obj-bin-y += built_in_32.o
> I don't quite like that this new object name is "built_in_32.o",
> It's really closed to "built_in.*" which is used by Rules.mk to collect
> all objects in a subdirectory. I don't really have a better suggestion at
> the moment.

Similarity was the point of suggesting it.

It is the end result of "the 32bit objects we've done magic with to
shoehorn into 64bit", and a improvement on "cbundle" from earlier
iterations.

~Andrew

