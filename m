Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45906ABC743
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 20:32:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990109.1374044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH5Hp-0006fB-Kh; Mon, 19 May 2025 18:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990109.1374044; Mon, 19 May 2025 18:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH5Hp-0006d6-HK; Mon, 19 May 2025 18:32:29 +0000
Received: by outflank-mailman (input) for mailman id 990109;
 Mon, 19 May 2025 18:32:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uH5Hn-0006d0-NQ
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 18:32:27 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d026d3a-34df-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 20:32:26 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-60119cd50b6so5508536a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 11:32:26 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06dc99sm627028766b.62.2025.05.19.11.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 11:32:25 -0700 (PDT)
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
X-Inumbo-ID: 9d026d3a-34df-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747679546; x=1748284346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0Ho4HsiCtAq+0A9bdVpMy3spydGkiAulkuYxB2+MOU=;
        b=K1UPeEPq5cLV0KOb5iZhn8kp5QNtszriialp0anVCA1fV2P8356ddk7g7R/qVMeS/L
         gFoNfY+jPF98VHUais3Ph/CIgJkQpyIL6eE97mH3yEXo6r8r/jYe3lptBpwzUxuymqQT
         mvWY1mY8ywro/1ynAQrlPADwB5fIHV9WxiQE0ylLVaQ3JRPcrxXB7bV5mrMTOlSmqvBK
         H0jHbxJW535cnQ9nxLN41iEbpFGu3+oZEDjodHKNd11mktVA1oDAxH9KTg5uWDESPPmD
         b+igKFUFBuovAZ6Goh7stQ/scVZT7w6XBiGVA9dM25G361qHWC21lbULYGjCMDIoV5Cz
         b+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747679546; x=1748284346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0Ho4HsiCtAq+0A9bdVpMy3spydGkiAulkuYxB2+MOU=;
        b=eAvV9qeQ/issV8HDvFcS9HjGWgr9VkPEeCa7NGQa2VQAOrlKPcxefNH5EEok4RCqgC
         EtUmGWqZPL98wxzgD1PvosAiijTppWFeCnBJ48P+wAYGOP9L2MUo/zmDAfdtsSbBAZeB
         OwgBTYyJwGLmKuqSgc6rPwwEPM3WthaF4Omq1crDmh2C5aEATTDXA99AlgsaVXdIy3Gg
         Z9OpsABA26AONPDCOi9y/58u/cHydWqeC+8R2q/li7Hyc5bqO/ukjVdWDJGYfxhUdoeK
         9h+caCNU/Cv1qNlXw2oLLJ+fMCwElHM0WFmF74BNd+6UeL2JE9IoQkzrhQJoR6Fc46FM
         e1uw==
X-Forwarded-Encrypted: i=1; AJvYcCX0o97dMC7hBjOevnDPw8Q3OhRLqMvGI+6r3Pj5egCWXLoBCM9nlzsf/60QIEpI4968PagdPiMUGDE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyfa2hqQlfZVQ+9v/XDlehA4hSThtlrR9enWOzc4UlXWhMqx2LP
	6A5X3SYEkKAWnEJfE89eNhoc+SEgvL0E9doDqrg46LFdc6XPnak7HI9uDAN0hJuDaA==
X-Gm-Gg: ASbGnctgpuFN+lnIIn3qhcqqCsTXmqVpeiyZ3Hvj9aF3WwHJASWIEtOnfUswVf2X5s4
	sAb0URVO4JmGrz9aQ7Kk67ZbjJUmlvkhXdUKfbQMye2w5pDy+RH1B3qUdT4KsKtbfwxImi+T2nS
	iOTAtb907S7w/wTqS1MFsEpy9/0hopGjQh1EetXto+uzCio+l/HjObcF0M3cHMIZJUWqlLTsu9K
	/7nSWWoXq38wo+oExFLKzPWl89cJ4vFZzs0nw3nLZnJu3Enzr/ED0zM3pTutSCeqCsf63/cwWmc
	RMr0O9EH6BCfkNygtBjH6GVzmzTHj2/MxA+9WIbVUtXw+w8XX3nkdy3ha3AuFg==
X-Google-Smtp-Source: AGHT+IEi54FRDA09xpigR8fBmxy++yrKfXoZAKuNTwFe6yFPlHHDvib0enEtS1Q8w+8FTcAWu4BfDg==
X-Received: by 2002:a17:907:6d06:b0:ad5:7732:675b with SMTP id a640c23a62f3a-ad5773276demr362003766b.40.1747679545947;
        Mon, 19 May 2025 11:32:25 -0700 (PDT)
Message-ID: <81c9f5f5-b5bb-4f3b-9993-dfca54f212c5@suse.com>
Date: Mon, 19 May 2025 20:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] xen/riscv: imsic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <f7588e93d0ddacc29ce5d89b2855624f82d6baa9.1746530883.git.oleksii.kurochko@gmail.com>
 <0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com>
 <52c0be11-7c8e-4e12-9005-3a7ca7f12c43@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <52c0be11-7c8e-4e12-9005-3a7ca7f12c43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 17:19, Oleksii Kurochko wrote:
> On 5/15/25 10:42 AM, Jan Beulich wrote:
>> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/imsic.h
>>> @@ -0,0 +1,65 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +
>>> +/*
>>> + * xen/arch/riscv/imsic.h
>>> + *
>>> + * RISC-V Incoming MSI Controller support
>>> + *
>>> + * (c) 2023 Microchip Technology Inc.
>>> + */
>>> +
>>> +#ifndef ASM__RISCV__IMSIC_H
>>> +#define ASM__RISCV__IMSIC_H
>>> +
>>> +#include <xen/types.h>
>>> +
>>> +#define IMSIC_MMIO_PAGE_SHIFT   12
>>> +#define IMSIC_MMIO_PAGE_SZ      (1UL << IMSIC_MMIO_PAGE_SHIFT)
>>> +
>>> +#define IMSIC_MIN_ID            63
>> This isn't the "minimum ID", but the "minimum permissible number of IDs" as per
>> its first use in imsic_parse_node(). Further uses there consider it a mask,
>> which makes me wonder whether the imsic_cfg.nr_ids field name is actually
>> correct: Isn't this the maximum valid ID rather than their count/number?
> 
> imsic_cfg.nr_ids it is a value of interrupt identities supported by IMSIC interrupt file according to
> DT binding:
>    riscv,num-ids:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      minimum: 63
>      maximum: 2047
>      description:
>        Number of interrupt identities supported by IMSIC interrupt file.

Unless this count accounts for 0 being invalid (and hence isn't counted), I'm
still confused: With the maximum value this would mean 2046 is still valid,
but 2047 isn't anymore. When normally such a boundary would be at an exact
power of 2, i.e. between 2047 and 2048 here.

Jan

