Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B886B9856C6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 11:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803757.1214556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOnB-0006SV-OE; Wed, 25 Sep 2024 09:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803757.1214556; Wed, 25 Sep 2024 09:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOnB-0006PY-JQ; Wed, 25 Sep 2024 09:58:41 +0000
Received: by outflank-mailman (input) for mailman id 803757;
 Wed, 25 Sep 2024 09:58:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFoA=QX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stOn9-0006PQ-Fb
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 09:58:39 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbe6eda3-7b24-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 11:58:37 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso1071631966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 02:58:37 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f4fa95sm190070366b.54.2024.09.25.02.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 02:58:36 -0700 (PDT)
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
X-Inumbo-ID: bbe6eda3-7b24-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727258317; x=1727863117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O3rVAsGTU/TrOpoh/97qDFUpAQ8EHngy7BMUZkHUOHw=;
        b=WvmqdAGyCYBZJw0mEIcMtAQHAYUGduRQLKENo5/JdOcmR130RcWojYQTqbRTyRNspv
         ZPz/PhGaAI1fUFVfspiw9nGDe67NFTqBzA1xIlxJvSpxFS/39jLDEvQ0tQ+ipz3rX5kf
         Y8d0Iy19ogYmWvzfGeeHLWCIHqOZsDQdscbYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258317; x=1727863117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3rVAsGTU/TrOpoh/97qDFUpAQ8EHngy7BMUZkHUOHw=;
        b=U5NxyM9WaIcwBLd1cMCK2x8mqwSaSCqO8UsL1UtKJhPhAIzJ+xJ6Lu+/ME0izLHa+V
         UBUjSYQ9UJaoRbzpvwXkxKg0vTJWoR+sxbi/3N+YziGD6ADG9uTqiOjnRZgsb2BtLRU7
         W+17zIg60WFRCcB+codp8472iUD/Y3GTL/raZXtVD9NgLnQzgGreorh5qGKmyRa7ZFJr
         dd0dAnBbVKKdq/mZ0IsxW3Tu0mluZbqpGQqKS9LhKB2DSawgbDqsyLVjvWpJnu0qLoD4
         t54ZKk57LAc266lFr1AXLMop9Xex+534tdGHcvDZLnC7Ou6bfZfeTORuK3V5NMJ26CBQ
         ZdBg==
X-Forwarded-Encrypted: i=1; AJvYcCURk5lXc0LvB1LfEsPfUgKoRThFHN5lA1MvGGxF5mT2seU5JbCToJJl4b0t/JkpmDHAWDDE2ELbtuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZEIJbVypjGch1QUtsFJoyRxlwMZLC4UFNwpZh42wPaGukzdLz
	QnjNXHA16bOJGOe8j3iGEC9sacZJDMrN3TfB/t2whpCWK4ke9tbJ/3cVLRIrLQ0=
X-Google-Smtp-Source: AGHT+IHzM19IrWmpL+vzabbWotxQvhUsWRkIZvX3xGD06tCIwAkiYnbeoAS+U+3nVkBIKEEPbZ0qNA==
X-Received: by 2002:a17:907:36c2:b0:a86:aa57:57b8 with SMTP id a640c23a62f3a-a93a067d558mr173379566b.63.1727258316903;
        Wed, 25 Sep 2024 02:58:36 -0700 (PDT)
Message-ID: <53c4054f-2e20-4120-87a0-2d2a9da83025@citrix.com>
Date: Wed, 25 Sep 2024 10:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen: introduce common macros for per-CPU sections
 defintion
To: oleksii.kurochko@gmail.com, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>
References: <cover.1727185495.git.oleksii.kurochko@gmail.com>
 <27aba3aae7f4a5d4694ab141dca325d7231f2f66.1727185495.git.oleksii.kurochko@gmail.com>
 <7857cbd9-c26d-4d31-97c6-8a1f34dd4559@citrix.com>
 <2b6624d147c0e86bdd3839e113953c282e742d17.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2b6624d147c0e86bdd3839e113953c282e742d17.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2024 10:23 am, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-09-24 at 18:01 +0100, Andrew Cooper wrote:
>> On 24/09/2024 5:42 pm, Oleksii Kurochko wrote:
>>> Introduce PERCPU_BSS macro which manages:
>>>  * Alignment of the section start
>>>  * Insertion of per-CPU data sections
>>>  * Alignment and start/end markers for per-CPU data
>>> This change simplifies the linker script maintenance and ensures a
>>> unified
>>> approach for per-CPU sections across different architectures.
>>>
>>> Refactor the linker scripts for Arm, PPC, and x86 architectures by
>>> using
>>> the common macro PERCPU_BSS defined in xen/xen.lds.h to handle per-
>>> CPU
>>> data sections.
>>>
>>> No functional changes.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Changes in V2:
>>>  - rename PERCPU_SECTION to PERCPU_BSS
>>>  - update the commit message
>>>  - add Acked-by: Julien Grall <jgrall@amazon.com>
>>>  - add Acked-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>>
>>>  xen/arch/arm/xen.lds.S    |  9 +--------
>>>  xen/arch/ppc/xen.lds.S    |  9 +--------
>>>  xen/arch/x86/xen.lds.S    |  9 +--------
>>>  xen/include/xen/xen.lds.h | 10 ++++++++++
>>>  4 files changed, 13 insertions(+), 24 deletions(-)
>> Aren't you missing a hunk in riscv/xen.lds.S ?
> I thought it would be better to add a hunk in riscv when
> percpu_init_areas() will be called in RISC-V's start_xen().

If you didn't have the old form already, I'd agree.  But right now this
leaves RISC-V being the odd-architecture-out.

I can fix it on commit, to save another posting, if you're happy?

~Andrew

