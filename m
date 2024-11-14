Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED689C88A2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 12:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836298.1252182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBXrJ-0007wi-OX; Thu, 14 Nov 2024 11:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836298.1252182; Thu, 14 Nov 2024 11:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBXrJ-0007uP-LC; Thu, 14 Nov 2024 11:17:57 +0000
Received: by outflank-mailman (input) for mailman id 836298;
 Thu, 14 Nov 2024 11:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TDs=SJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBXrH-0007uJ-Fd
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 11:17:55 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 156bef87-a27a-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 12:17:50 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa1f73966a5so92137566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 03:17:50 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20dfffc9fsm51538966b.130.2024.11.14.03.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 03:17:49 -0800 (PST)
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
X-Inumbo-ID: 156bef87-a27a-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE1NmJlZjg3LWEyN2EtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTgzMDcwLjI0ODI1OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731583070; x=1732187870; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PO+SNGYEl5hRA4Mi9c3K6NGG3KnKdCxA3qXbCfjCsZU=;
        b=hvAIIwZn+PbIR6nDkv++Tqqdw1mg1GKwL+1SczVzQhAde7mTOrKc8qmNLVJNMV+Umq
         nhFjFy4re5wwue0AM0qgzeyX/71f1KZiajIhHFXBPlGgCwK/l+/3ooouZJsI01/bjCo8
         XihDd466XXTE+ya/eK48RNE1YZfvoqTAVYHEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731583070; x=1732187870;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PO+SNGYEl5hRA4Mi9c3K6NGG3KnKdCxA3qXbCfjCsZU=;
        b=o8TolUM1kNQjVT+kP/y3aSFVwrUaK+pfrgxciIp4YKtluLs/3j2H7SWqu6h7vjavuh
         aWuV+QMIYWh55cnuZf9W/v86Beq5fqQOxxo42uR9OX/PcpIk4kQ5ZQl2gRA4A15PNHYR
         IAOVrjA0ZHJ9GY/cZxnkbOILlnRZFOF2/vGRjQqUJzKaAZBjsMgVmAwyy4UUJ4sJXq5Y
         YzYJ/RKdY4c7RMF2tmw7PgRIEiVwP4qhUGJuTeOnp4otDFevqzHTlsgCQrBCirjekVq6
         BdKqXhpJYHhshJ+lj3vJKw32vf/NEc7mu8IGXGQGLasOR73pCPfhdM3mdA+vuSkFNDHq
         kPKw==
X-Forwarded-Encrypted: i=1; AJvYcCVHjsK2NvyuSBR9e7zk+BDBwSjLtmtfYLQUUpa/+Q2DrcL7lq07DeAphDERVQkuole59/IIUvHkiU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjOLm21utIP6tEOiBSSYMZlHOCy28BlLzQXzawfSsB57p21nbG
	jSairC9fvRSJoT9bxJyig1TZbWDdKOv//EuuX7sQ/axhZ6digsuexjGTXZ/803FVvXtW/5mlh9V
	1
X-Google-Smtp-Source: AGHT+IHKtSo4G7a/17Y1iUaUZteyC+324dhPhqpUY0dNS+YujGJyuyWqIOMNUpdmEUKVZ03Z5bf/Qw==
X-Received: by 2002:a17:907:26c4:b0:a9a:3da9:6a02 with SMTP id a640c23a62f3a-aa20cdfb74cmr167791266b.60.1731583069557;
        Thu, 14 Nov 2024 03:17:49 -0800 (PST)
Message-ID: <a2a65e08-84d8-4181-9a98-f4811eac6767@citrix.com>
Date: Thu, 14 Nov 2024 11:17:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] x86/trampoline: Document how the trampoline is
 laid out
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
 <20241114090810.1961175-4-andrew.cooper3@citrix.com>
 <D5LUCQ9MH2C2.1L6CFH028NYPS@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <D5LUCQ9MH2C2.1L6CFH028NYPS@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2024 10:48 am, Alejandro Vallejo wrote:
> On Thu Nov 14, 2024 at 9:08 AM GMT, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
>> index 8c1e0b48c2c9..559111d2ccfc 100644
>> --- a/xen/arch/x86/include/asm/trampoline.h
>> +++ b/xen/arch/x86/include/asm/trampoline.h
>> @@ -37,12 +37,65 @@
>>   * manually as part of placement.
>>   */
>>  
>> +/*
>> + * Layout of the trampoline.  Logical areas, in ascending order:
>> + *
>> + * 1) AP boot:
>> + *
>> + *    The INIT-SIPI-SIPI entrypoint.  This logic is stack-less so the identity
>> + *    mapping (which must be executable) can at least be Read Only.
>> + *
>> + * 2) S3 resume:
>> + *
>> + *    The S3 wakeup logic may need to interact with the BIOS, so needs a
>> + *    stack.  The stack pointer is set to trampoline_phys + 4k and clobbers an
>> + *    arbitrary part of the the boot trampoline.  The stack is only used with
>> + *    paging disabled.
>> + *
>> + * 3) Boot trampoline:
>> + *
>> + *    The boot trampoline collects data from the BIOS (E820/EDD/EDID/etc), so
>> + *    needs a stack.  The stack pointer is set to trampoline_phys + 64k, is 4k
>> + *    in size, and only used with paging disabled.
>> + *
>> + * 4) Heap space:
>> + *
>> + *    The first 1k of heap space is statically allocated scratch space for
>> + *    VESA information.
>> + *
>> + *    The remainder of the heap is used by reloc(), logic which is otherwise
>> + *    outside of the trampoline, to collect the bootloader metadata (cmdline,
> Wh> + *    module list, etc).  It does so with a bump allocator starting from the
>> + *    end of the heap and allocating backwards.

Was this a typo replying to the email?


>> + *
>> + * 5) Boot stack:
>> + *
>> + *    The boot stack is 4k in size at the end of the trampoline, taking the
>> + *    total trampoline size to 64k.
>> + *
>> + * Therefore, when placed, it looks somewhat like this:
>> + *
>> + *    +--- trampoline_phys
>> + *    v
>> + *    |<-------------------------------64K------------------------------->|
>> + *    |<-----4K----->|                                         |<---4K--->|
>> + *    +-------+------+-+---------------------------------------+----------+
>> + *    | AP+S3 |  Boot  | Heap                                  |    Stack |
>> + *    +-------+------+-+---------------------------------------+----------+
>> + *    ^       ^   <~~^ ^                                    <~~^       <~~^
>> + *    |       |      | +- trampoline_end[]                     |          |
>> + *    |       |      +--- wakeup_stack      reloc() allocator -+          |
>> + *    |       +---------- trampoline_perm_end      Boot Stack ------------+
>> + *    +------------------ trampoline_start[]
>> + */
> Neat. Nothing like a pretty picture to properly explain things.
>
>> +
>>  #include <xen/compiler.h>
>>  #include <xen/types.h>
>>  
>>  /*
>> - * Start and end of the trampoline section, as linked into Xen.  It is within
>> - * the .init section and reclaimed after boot.
>> + * Start and end of the trampoline section, as linked into Xen.  This covers
>> + * the AP, S3 and Boot regions, but not the heap or stack.  It is within the
>> + * .init section and reclaimed after boot.
> How can it be reclaimed after boot if it's used for S3 wakeups? I assume you
> meant that the heap and stack are reclaimed after boot, but from that wording
> it sounds like the other way around.

This is the one bit that is slightly problematic to represent.

trampoline_{start,end}[] describe the AP/S3/Boot text/data *in the Xen
image*, which is in the .init section.

trampoline_phys is where trampoline_start[] ends up when placed.

Maybe I should have "Note: trampoline_start[] and trampoline_end[]
represent the shown boundaries as linked in Xen" at the bottom of the
diagram?

~Andrew

