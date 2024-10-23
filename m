Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAEF9AD23E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 19:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824900.1239092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3eu0-0008V4-OO; Wed, 23 Oct 2024 17:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824900.1239092; Wed, 23 Oct 2024 17:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3eu0-0008Sl-LJ; Wed, 23 Oct 2024 17:12:08 +0000
Received: by outflank-mailman (input) for mailman id 824900;
 Wed, 23 Oct 2024 17:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJ8W=RT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3ety-0008Sf-Kz
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 17:12:06 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed68a286-9161-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 19:12:05 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a99f1fd20c4so953330666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 10:12:05 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee04asm502567966b.61.2024.10.23.10.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 10:12:04 -0700 (PDT)
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
X-Inumbo-ID: ed68a286-9161-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729703525; x=1730308325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NgLTIrlPF6VkOhkwfvfFxo7/JLhou5DUNGHxOwV/6zA=;
        b=eLyZ2jiKiHMjtQvCZ1khiDmLXjB+FP/UCIz/XDjOmNTnWNapbgJ7QOlDdORMq582Fw
         W/fT5rzWwy+bSTCcdIpex5Mi3aZ2qceg8nYoXfEXxpJUV/w1W2tJsLYevUFfxecil6P3
         GwI3WrkClPcbMbz00BfbnmYpiN5xuylZkjplo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729703525; x=1730308325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgLTIrlPF6VkOhkwfvfFxo7/JLhou5DUNGHxOwV/6zA=;
        b=WnplWkeVJ48/oz1FwLnfUjcpTmlyFlP1lCucaStlhEVU/dTos9siLQJuGrgjLnk3Pm
         CpQu7NReVQdi0tFrjtJfGDeiZQIE/PCi+Z117GYjtpogNNQ1gRvqPtnfseykTkiNXiEA
         XgugRIyw/4oA1NMkLCW7OGILmanf2ph6YL/vFKXjhveu5/kHRNZEhZmQLCLivwWAPQ1f
         HJw39jr78tHhn1e3RSmxMoWcHfN/D4/d/1o3RCl/NFSUCbMTD3HCFt4+iVqpXWrIxDhK
         Nsho5w4NNyiNS4xeY1zezarqS4x8jVPCMW0pZUgNlu0Nj97XB/gtntnUzLzc8Ft3ad/8
         DZ3w==
X-Gm-Message-State: AOJu0YwkVf+WnJWgvHP4pjI69LeBjOk5tPcF81CdViiGUKiN8xwbRCKU
	1gMcydWRagje1YFGXNrCCtIUEXJvp0OPA8G/vuwocAVxDylQHmGJlbGOv1QAO7c=
X-Google-Smtp-Source: AGHT+IGcqc56ZHIMPaxD9lBo7Jewe7zsVA3dvgb0fUXRAYU2SKeamj+sH1t11GCDa09t9XdGjRzdYw==
X-Received: by 2002:a17:907:3e27:b0:a99:e82a:87ee with SMTP id a640c23a62f3a-a9abf9660a9mr251307166b.57.1729703524680;
        Wed, 23 Oct 2024 10:12:04 -0700 (PDT)
Message-ID: <55b7ebb4-9d10-45ca-b357-fd91ef169ff0@citrix.com>
Date: Wed, 23 Oct 2024 18:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/boot: Fix microcode module handling during PVH
 boot
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <JBeulich@suse.com>
References: <20241023105756.641695-1-andrew.cooper3@citrix.com>
 <20241023105756.641695-3-andrew.cooper3@citrix.com>
 <Zxkr9il-X0hK2GFv@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zxkr9il-X0hK2GFv@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/10/2024 6:01 pm, Roger Pau Monné wrote:
> On Wed, Oct 23, 2024 at 11:57:55AM +0100, Andrew Cooper wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>
>> As detailed in commit 0fe607b2a144 ("x86/boot: Fix PVH boot during boot_info
>> transition period"), the use of __va(mbi->mods_addr) constitutes a
>> use-after-free on the PVH boot path.
>>
>> This pattern has been in use since before PVH support was added.  Inside a PVH
>> VM, it will go unnoticed as long as the microcode container parser doesn't
>> choke on the random data it finds.
>>
>> The use within early_microcode_init() happens to be safe because it's prior to
>> move_xen().  microcode_init_cache() is after move_xen(), and therefore unsafe.
>>
>> Plumb the boot_info pointer down, replacing module_map and mbi.  Importantly,
>> bi->mods[].mod is a safe way to access the module list during PVH boot.
>>
>> Note: microcode_scan_module() is still bogusly stashing a bootstrap_map()'d
>>       pointer in ucode_blob.data, which constitutes a different
>>       use-after-free, and only works in general because of a second bug.  This
>>       is unrelated to PVH, and needs untangling differently.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>>
>> Refectored/extracted from the hyperlaunch series.
>>
>> There's no good Fixes tag for this, because it can't reasonably be "introduce
>> PVH", nor can the fix as-is reasonably be backported.  If we want to fix the
>> bug in older trees, we need to plumb the mod pointer down alongside mbi.
>> ---
>>  xen/arch/x86/cpu/microcode/core.c    | 40 +++++++++++-----------------
>>  xen/arch/x86/include/asm/microcode.h |  8 +++---
>>  xen/arch/x86/setup.c                 |  4 +--
>>  3 files changed, 22 insertions(+), 30 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
>> index 8564e4d2c94c..1d58cb0f3bc1 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -35,6 +35,7 @@
>>  #include <xen/watchdog.h>
>>  
>>  #include <asm/apic.h>
>> +#include <asm/bootinfo.h>
>>  #include <asm/cpu-policy.h>
>>  #include <asm/nmi.h>
>>  #include <asm/processor.h>
>> @@ -152,11 +153,8 @@ static int __init cf_check parse_ucode(const char *s)
>>  }
>>  custom_param("ucode", parse_ucode);
>>  
>> -static void __init microcode_scan_module(
>> -    unsigned long *module_map,
>> -    const multiboot_info_t *mbi)
>> +static void __init microcode_scan_module(struct boot_info *bi)
> Sorry to be pedantic, can't you keep bi as const?

Not really, no.

Yes technically in this patch, but no by the end of the hyperlaunch series.

I'm uninterested in taking extra churn just to have a pointer be const
for a few more patches.

[For the list, I conferred with Roger IRL and he was happy.]

~Andrew

