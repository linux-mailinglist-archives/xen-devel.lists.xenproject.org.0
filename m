Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8357AAC69A
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 15:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977262.1364296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIWR-0001sj-AH; Tue, 06 May 2025 13:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977262.1364296; Tue, 06 May 2025 13:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIWR-0001qO-6t; Tue, 06 May 2025 13:39:47 +0000
Received: by outflank-mailman (input) for mailman id 977262;
 Tue, 06 May 2025 13:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cniF=XW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uCIWQ-0001qI-0E
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 13:39:46 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f9a09b4-2a7f-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 15:39:40 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so3751523f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 06:39:40 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0b3331cb0sm437303f8f.65.2025.05.06.06.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 06:39:39 -0700 (PDT)
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
X-Inumbo-ID: 8f9a09b4-2a7f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746538780; x=1747143580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XLvFoTcwz9K5wgfhFJVpd3ZPGknE7d6jx4QLrMIgBkE=;
        b=rMbiI+VeEwbYb+u3keWobY7uHk5JQp5LKBFdoocJhoeqsR8/RG7tOloLWQ8A3rPnRp
         1Gt3FGWczcpVwU+hUbYIU585Y0zd/n42QoxGNQ1r5eN2Ax5YCl1hXU7765FW6JYSkgs3
         /y4wPG6wm+FFfZw/HccfDuxBZHrHpw6q29xOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538780; x=1747143580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLvFoTcwz9K5wgfhFJVpd3ZPGknE7d6jx4QLrMIgBkE=;
        b=jeHolSlQJlirAoe6sAGxzV40DRdh0kGzQuqHqTRWm6xT5TV9WqwWyTCmxHgljSPzoP
         est1iaZ3tuQtpM4exGypn/7BOjp6YKHCjWHyoJMZ/nzWVa4Nmk0kNvSafyWc2mF5wqJt
         i8GZQXnV7axfjssrpB+sRbD+maNlfu2fY52i4o7yATeEUeCORzcPVUemyTIz+ifuX8DX
         88Sl+dbujA443zxQ+IpMlXgdk5+wMh0f6uA/zJHDXr3W1o+8ApvxTUlTRWNzaUMKRYpW
         2hvZCE/igKMYBWJeiYbOlneYVfdRZiNSiDN31WV1X+4tp26tu0vpIWCyvMxbLCZIngK8
         nLvw==
X-Forwarded-Encrypted: i=1; AJvYcCX5v5xpaUKPBvZvtEP8BZbMvGxSfPqswUB2SeNw3UytKOuqmRMejHn4HA6kq0nPIffdExmTY6KnKNA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwF3sgx1k0TJ3JSmGrYx0jsvn66u+8PuHEiy/It6BOafmSH+9lm
	LFchDp+cOGF2nOAtNrssY2W0Q9ohrsGIlYy0tx1SD7UEac0lsbVmsZm2/aJXbRw=
X-Gm-Gg: ASbGncvZ7kCOdC6rT9heXTaADLmNBTcgaQByBArcTnX/kp5iMmYVJ23HKVm8qh3Oyfz
	R0Eb1Gfzd7PSJ7f6TVK90zdU0h5z1/hTZxWnQhAlpi0WlHWW6KV2ivQv/xQx1N8D/ypePD16Tqf
	NbXuFpqrQU0lDZ4xDnCOCBoLUlchotMh/DsQvpgSO6lxSFON4QQtVngYgCaJWyLHvOo+BBfxIGB
	lVAXFM4PmiXxrZhvBXnzuvOv4gX/XEs9MGgmepXOxBms0MVX2+KNeMcDnoUAkr5GmMzTffulGk3
	88rIJFDK4vMrB7CuoeIv9yw9dt6oAS8e2A9xIJPkTH6OfffUewEPa889iD4GCsnlLzrFhRKC9Nq
	SSbXd5dNBLxRUrjeK
X-Google-Smtp-Source: AGHT+IHQyqAXQ1OnTyy06XTY3gbCqTwHmc1ysVvli+H0tWNHPAsqRbz747vw3dWL3+EvHsS0XfUf8A==
X-Received: by 2002:a05:6000:2a3:b0:3a0:85ad:5ed9 with SMTP id ffacd0b85a97d-3a09fd7a183mr7844198f8f.4.1746538780230;
        Tue, 06 May 2025 06:39:40 -0700 (PDT)
Message-ID: <dff57098-98de-4988-92ca-c96466051940@citrix.com>
Date: Tue, 6 May 2025 14:39:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] sbat: Add SBAT section to the Xen EFI binary
To: Jan Beulich <jbeulich@suse.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20250501122322.230599-1-gerald.elder-vass@cloud.com>
 <7fa7780d-4dfb-4e87-b65c-c9ce86ad7e67@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7fa7780d-4dfb-4e87-b65c-c9ce86ad7e67@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/05/2025 8:01 am, Jan Beulich wrote:
> On 01.05.2025 14:23, Gerald Elder-Vass wrote:
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -58,6 +58,7 @@ obj-y += percpu.o
>>  obj-y += physdev.o
>>  obj-$(CONFIG_COMPAT) += x86_64/physdev.o
>>  obj-y += psr.o
>> +obj-y += sbat.o
>>  obj-y += setup.o
>>  obj-y += shutdown.o
>>  obj-y += smp.o
> This being x86-specific here without there really being anything x86-specific
> about it - what about Arm?
>
> It being EFI-specific, why put it here rather than in x86/efi/ (and/or, as
> per above, in common/efi/, at least for the source file)?

Having just spent a morning debugging, I've told Gerald to keep it in
x86.   common/efi is an intractable mess and needs turning into a
regular part of the build before this suggestion can be actioned.

~Andrew



