Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6DBA67450
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 13:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919052.1323597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuWPg-0000EN-5v; Tue, 18 Mar 2025 12:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919052.1323597; Tue, 18 Mar 2025 12:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuWPg-0000Cv-31; Tue, 18 Mar 2025 12:51:20 +0000
Received: by outflank-mailman (input) for mailman id 919052;
 Tue, 18 Mar 2025 12:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuWPe-0007mp-S8
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 12:51:18 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af51b806-03f7-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 13:51:18 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso5133179f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 05:51:18 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df34eesm18309321f8f.18.2025.03.18.05.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 05:51:17 -0700 (PDT)
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
X-Inumbo-ID: af51b806-03f7-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742302278; x=1742907078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=45335+bau0P1jQuO1YgY3jzW2XCzRmSU3orhuFozqiA=;
        b=LTViwAOLgY0t/FsX8RXRcW7JvGDfXIa1CZ7e0SN4p3DTsRxdrEuvdTf7jVIrIIutWa
         5JFzrkHN6VoOAE6NYbRVFiqkVUjkgqsHPlONKhicNjyMDuOObp/f4QMQoWAMna8zWmoC
         QNb3UexfhHNHLRmVrQtfBUdSjdKQIbRGNyMjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742302278; x=1742907078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45335+bau0P1jQuO1YgY3jzW2XCzRmSU3orhuFozqiA=;
        b=esJMzt3YH7CsK5FIto7OdaF2GzgaSriQENHk7Pvd87nJsb2pBi4EFh43R7vGFDWAIu
         gSBD0DF/JgzYCPWOOYmT7HSPQqIarYaPfUebangjATSX94jYxFAlsxxN5mUgAHQZLju2
         bynlTpBMLQXXThE5DHXpMbcxTwJiYGaKYpxmVq+U0MTUxNfYOghmkbC/L5EX/R/zP0op
         1f2PdG5PKZT8tby7DmDAj3XCJTwzgF00Kb9TetHMYtaQfDrE4BbXpMUE1toYOvpGiEjM
         e6E1nKRA8ZUZInFEoEJ8NcoeSHq7OaYwwN7cAx3afXNGMZmrY1aSNY95WJkZWVmwg8WY
         eqwg==
X-Forwarded-Encrypted: i=1; AJvYcCX/3CGNKvyR1GthwtvS/QprGYQS9Cgiu0z7fRah2swN9kPOcBxBvWyOIa6VScwl0TQxnddHxNkU8p4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1GG0V9wG2JI+E8G6MzOreFa672RBQkoJ8Gd9qP8H3r298D2op
	S5swpTRHg4vcp6Xyj6X5ElWVE7veiyvoF7JK6BLBqfAGSAFfFqrd024v8VxkvLGn+SK5JhDi8Pc
	S
X-Gm-Gg: ASbGnctMF9DIlkUA72t09/veNjcL61cG3YmNVXweEyvcvO0V3c7dd5f+kzZzJyhpPhN
	vRB3DHuXdlyNv1bzX/JlrK9UhDRpUdk6ft/2ZQOPEEbgPWxSOc9ag/3JW2GGzqqOz7/rka6e6Fo
	nkHKVlrV/s2+cPfRSHijl71e34xvtAsvV0jlFUZXXygDgprRM3BM7tjbo0H9tOXMKfhPkT0G5du
	DVeSPAk/5pRQx/Gzvnk2m7wxM6y+HEHv2lauKVEqXqM9naeBS1CxlD4S/O2MWq530uavv7THO3z
	CF4fRE9l32kG1yytSKd4NWnoGkj2PXwCSXqpNPhgJGHxVeLTZynAFNaPJlVwXTNTX8c+glVUbRy
	66mwitfAV
X-Google-Smtp-Source: AGHT+IFgboO0rOf6DXR0tyRVZPK4XYn8rgZ9FEcThhYR2JIqwJaT1MDhlXY9hwtRkVTkt2RscqRenA==
X-Received: by 2002:a05:6000:178c:b0:399:6d26:7752 with SMTP id ffacd0b85a97d-3996d26781dmr2395599f8f.38.1742302277525;
        Tue, 18 Mar 2025 05:51:17 -0700 (PDT)
Message-ID: <d3925807-72a8-4844-b3ca-380ff2a381b1@citrix.com>
Date: Tue, 18 Mar 2025 12:51:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] x86/xlat: fix UB pointer arithmetic in
 COMPAT_ARG_XLAT_VIRT_BASE
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-4-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250318091904.52903-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 9:19 am, Roger Pau Monne wrote:
> UBSAN complains with:
>
> UBSAN: Undefined behaviour in common/compat/memory.c:90:9
> pointer operation overflowed ffff820080000000 to 0000020080000000
> [...]
> Xen call trace:
>    [<ffff82d040303882>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xc0
>    [<ffff82d040304cc3>] F lib/xxhash64.c#__ubsan_handle_pointer_overflow+0xcb/0x100
>    [<ffff82d0402a6359>] F lib/xxhash64.c#compat_memory_op+0xf1/0x4d20
>    [<ffff82d04041545d>] F lib/xxhash64.c#hvm_memory_op+0x55/0xe0
>    [<ffff82d040416280>] F lib/xxhash64.c#hvm_hypercall+0xae8/0x21b0
>    [<ffff82d0403b25ca>] F lib/xxhash64.c#svm_vmexit_handler+0x1252/0x2450
>    [<ffff82d0402049c0>] F lib/xxhash64.c#svm_stgi_label+0x5/0x15
>
> Adjust the calculations in COMPAT_ARG_XLAT_VIRT_BASE to subtract from the
> per-domain area to obtain the mirrored linear address in the 4th slot,
> instead of overflowing the per-domain linear address.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

