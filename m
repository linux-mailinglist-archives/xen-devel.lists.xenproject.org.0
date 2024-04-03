Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F8B8971D4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 16:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700555.1093888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs19h-0001Jx-1y; Wed, 03 Apr 2024 13:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700555.1093888; Wed, 03 Apr 2024 13:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs19g-0001Hv-VA; Wed, 03 Apr 2024 13:59:56 +0000
Received: by outflank-mailman (input) for mailman id 700555;
 Wed, 03 Apr 2024 13:59:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pg83=LI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rs19g-0001Hp-6K
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 13:59:56 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72a8b18d-f1c2-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 15:59:54 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56e0a8733d8so685985a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 06:59:54 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 cx23-20020a05640222b700b0056e064a6d2dsm822357edb.2.2024.04.03.06.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 06:59:53 -0700 (PDT)
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
X-Inumbo-ID: 72a8b18d-f1c2-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712152794; x=1712757594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9lFbRJEsVJdda1miBZgOS5YWSai3mVfErmQ/bnpAQlU=;
        b=mA9+T0wnkdixbxan1v363K59NYpBzTe4Rod4Z0/RRN9V37TokGbVvoKdca/Pl2Pz0V
         FHPexxm45Z584GKtUQ/x0dDpD02FyToNNrG0Lnu55rKSVcvljtxKMKiWkE0UwllWnj3y
         uIHtmIL7/0K6hUr9b6j8QFIXhjD3JZJfbkanc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712152794; x=1712757594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lFbRJEsVJdda1miBZgOS5YWSai3mVfErmQ/bnpAQlU=;
        b=Q+0yiZNIpKLFxkXq44rjSsN2iDVqAI2pkF6SzTgEH/Q6N+xXcWDOy3QLeZFIAoXoBQ
         wFTcmVxekMbb9rX9vQgPedyPHBISehchxhPs08YOLbEatduPgPVbAZqEdoFOfaDzzM2R
         4TX68Iivzf8ZDBebbq/nSFFjrKR4HHg5ESQw9CVP0o+DV2S6Dvj6vQ0GA5mh8+sYDAx5
         sp/29GH3pPGZOzISYJEOftTgNXuU9Snv6qhxnPZfZwG6ZImzkKEOeDqc+wx/BhE9rkba
         YTGR7RoU5lMk8hMkecPeqeTLaS9xaci2JhYvPmTXr3cYZnQUo/mBoERrp0gSqh5SNdOq
         Ftcw==
X-Forwarded-Encrypted: i=1; AJvYcCWKvhhKG4zjhhD0UKGf50NJaGI7DjawPkw2TZuXeIc4CR9v0WecTKJlIISqKkh2A5GlRs3WWzzjuEITu+LlIS0RBY9ltiFZ1G9fn6vqbm4=
X-Gm-Message-State: AOJu0YzxZxlQDmq/4XfVNYSuuEH7U7FLnVsrNtxODfTQTcgN55q7oSBU
	kv4PuyOBRwyFnlaDTDRg+wEHyYD6hpADNIGEWarCPjGAQPZl1b70eZ3eetow/SQ=
X-Google-Smtp-Source: AGHT+IHKS2MzbQFaMNQVgSdill2f5hBV5z4j08gTtFpp/Nr9vPFiNnzTJORS1acaB4yetF8xxza+2A==
X-Received: by 2002:a50:d501:0:b0:56e:bad:36b with SMTP id u1-20020a50d501000000b0056e0bad036bmr879142edi.21.1712152794056;
        Wed, 03 Apr 2024 06:59:54 -0700 (PDT)
Message-ID: <018e20ba-f15b-48e7-9333-19f6e570d55f@citrix.com>
Date: Wed, 3 Apr 2024 14:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/include: move definition of ASM_INT() to
 xen/linkage.h
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240403120323.18433-1-jgross@suse.com>
 <e401ffe1-de4b-4548-8eba-feb7e85c9971@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e401ffe1-de4b-4548-8eba-feb7e85c9971@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2024 1:51 pm, Jan Beulich wrote:
> On 03.04.2024 14:03, Juergen Gross wrote:
>> ASM_INT() is defined in arch/[arm|x86]/include/asm/asm_defns.h in
>> exactly the same way. Instead of replicating this definition for riscv
>> and ppc, move it to include/xen/linkage.h, where other arch agnostic
>> definitions for assembler code are living already.
> And this is why I didn't make a change right away, back when noticing the
> duplication: Arch-agnostic really means ...
>
>> --- a/xen/include/xen/linkage.h
>> +++ b/xen/include/xen/linkage.h
>> @@ -60,6 +60,8 @@
>>  #define DATA_LOCAL(name, align...) \
>>          SYM(name, DATA, LOCAL, LASTARG(DATA_ALIGN, ## align), DATA_FILL)
>>  
>> +#define ASM_INT(label, val)    DATA(label, 4) .long (val); END(label)
> ... to avoid .long [1]. There's no arch-independent aspect guaranteeing
> that what .long emits matches "unsigned int" as used e.g. in the
> declaration of xen_config_data_size.

I'd forgotten that point, but I don't think it's a good reason force
every architecture to implement the same thing.

Borrowing a trick from the alternatives, what about this as a sanity check?

diff --git a/xen/tools/binfile b/xen/tools/binfile
index 0299326ccc3f..21593debc872 100755
--- a/xen/tools/binfile
+++ b/xen/tools/binfile
@@ -35,4 +35,10 @@ DATA($varname, 1 << $align)
 END($varname)
 
         ASM_INT(${varname}_size, .Lend - $varname)
+.Lsize_end:
+
+        .section .discard
+        # Build assert sizeof(ASM_INT) == 4
+        .byte 0xff - ((.Lsize_end - ${varname}_size) == 4)
+
 EOF


Ideally we'd want BYTES_PER_INT here but it turns out that doesn't exist
in Xen.  If we find an architecture where .long isn't the right thing,
we can make ASM_INT optionally arch-specific.

~Andrew

