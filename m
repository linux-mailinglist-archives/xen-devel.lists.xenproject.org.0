Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F65A7673C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 15:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932562.1334670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFfa-0008IF-Mt; Mon, 31 Mar 2025 13:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932562.1334670; Mon, 31 Mar 2025 13:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFfa-0008Fp-Ja; Mon, 31 Mar 2025 13:59:18 +0000
Received: by outflank-mailman (input) for mailman id 932562;
 Mon, 31 Mar 2025 13:59:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCWu=WS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzFfZ-0007jc-GP
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 13:59:17 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55cf5d51-0e38-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 15:59:17 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso3605929f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 06:59:17 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b662736sm11170116f8f.22.2025.03.31.06.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 06:59:16 -0700 (PDT)
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
X-Inumbo-ID: 55cf5d51-0e38-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743429556; x=1744034356; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NK5bCIaUu2f9SDl3/ce1spIPDF1ROPef6U9u+7a2F5c=;
        b=d7DzwfFqYSyZS7ZY/qJctYfRXPVdU80TRVM9LjJM96FYBKVq6PlUnVhcbyla0WERbt
         XIbDZQTZYXqu68uf9NQdVVXlj6jJArNHIFCDhN5IlbX9DZzGu0J1p8pZjOG8OytwNF8c
         ekWp4wkXmi04CmWE7QpzqEFPipFIEljnAVK0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743429556; x=1744034356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK5bCIaUu2f9SDl3/ce1spIPDF1ROPef6U9u+7a2F5c=;
        b=miuLOPpVpC9GH4+i48sWRhk/XNAYVUtKETh7Ski1y8EHxFmbah7iS1BXo6GFUdBbk3
         YE5FHQRFdLLVSDMjt2P4DAlEwTVmbBdLRLh2BqfDw1MPES+21IDu05bhvdfYTeLcvFHD
         LK4friPBZyqKosVqr9LA0/QVDrdngkA/GwSkp4wJukslGOIvdEPP3WpmdCwN3pziNT/2
         siHO+9JcL7HYnOGakGdnfE+H0rEb+nw29N070HmW5ZkWjCygIp1fLSiXUgQUGDoWWwOM
         Td8Ck5PmZzQoyVDIEYtFTTLTQJCbOaBzLS6Z2c+IHGTP9uvYtW+D7QMazIbKVoz9XpbJ
         9bHw==
X-Forwarded-Encrypted: i=1; AJvYcCUK7WsDZD64kULFJ2fkAJTRD8Hd/XjOMqL+TQJ4kKtyy13E/LivV2fafZxohLoddUcr9RCubZdkHEQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywg4Yl9vBCtPr5IS9kYAZTMeBLADCAdAj1DazEL7u8M+g99QQ3L
	xnoS4GQgBlNKiUmHBxemvJ3FNyc7s261GsSey+BFOdV7ZIu+PjnuNUbCzbObZ2g=
X-Gm-Gg: ASbGncsapob7TqQU9wtIxy2D9cx9KfXD4gGskBV41hQbVgXc/PKPp+g5bXKIlfPK/DX
	/b+7xqmh3g1+bkdDAYhZdcAX1Lrrm6feVccwyrv2rEMpPeW9MBnWzLrR36i0q4d/KBi3bFXVA9c
	xK2bS1eGBnN71+aywvgJjqIAHCYPQbvV6EteLySogqSvw0ADJ3nGya+nEGT+Z0ozLd9RyUSRMge
	V/KuUAiiQN1NHIbsx7kUb3CPyUXwkP48kX/2UWNiNbDgZL7CoW/6zpvfbOeMEibtiAfjLhZCYXd
	KKMaG2M+ajYkS86O+oAd/7CPf7hZp8EpKqpYQIdb+VlxMm8NWQbMk9+7gsOD+dQqJOR0h//ePWo
	RzttJsdfpwQ==
X-Google-Smtp-Source: AGHT+IEbPZxPnl1PYR6pFAsTEISsCi///ljoq0wIj6FvFOUqKuVfiKoXhKHyF0LrsyCQLcavTv1HJg==
X-Received: by 2002:a05:6000:4014:b0:39c:d05:37d3 with SMTP id ffacd0b85a97d-39c12117d33mr6469405f8f.34.1743429556437;
        Mon, 31 Mar 2025 06:59:16 -0700 (PDT)
Message-ID: <0fafaf3f-ded6-4444-a635-bf32a47b209b@citrix.com>
Date: Mon, 31 Mar 2025 14:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/16] xen: Implement common byte{order,swap}.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Lin Liu <lin.liu@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
 <20250328134427.874848-4-andrew.cooper3@citrix.com>
 <c79d76e2-3e6d-4c2a-a240-ee36daa559e0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c79d76e2-3e6d-4c2a-a240-ee36daa559e0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/03/2025 9:32 am, Jan Beulich wrote:
> On 28.03.2025 14:44, Andrew Cooper wrote:
>> From: Lin Liu <lin.liu@citrix.com>
>>
>> The current swab??() infrastructure is unecesserily complicated, and can be
>> repated entirely with compiler builtins.
>>
>> All supported compilers provide __BYTE_ORDER__ and __builtin_bswap??().
>>
>> Nothing in Xen cares about the values of __{BIG,LITTLE}_ENDIAN; just that one
>> of them is defined.  Therefore, centralise their definitions in xen/config.h
> And even if we cared somewhere, __ORDER_{BIG,LITTLE}_ENDIAN__ supply them
> just fine.
>
>> Signed-off-by: Lin Liu <lin.liu@citrix.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with two nits taken care of:
>
>> --- /dev/null
>> +++ b/xen/include/xen/byteorder.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#ifndef XEN_BYTEORDER_H
>> +#define XEN_BYTEORDER_H
>> +
>> +#include <xen/byteswap.h>
>> +#include <xen/types.h>
> It's stdint.h that's needed here, not types.h?

Perhaps.

>
>> +#if defined(__LITTLE_ENDIAN)
>> +
>> +# define cpu_to_le64(x) (uint64_t)(x)
>> +# define le64_to_cpu(x) (uint64_t)(x)
>> +# define cpu_to_le32(x) (uint32_t)(x)
>> +# define le32_to_cpu(x) (uint32_t)(x)
>> +# define cpu_to_le16(x) (uint16_t)(x)
>> +# define le16_to_cpu(x) (uint16_t)(x)
> (Not just) for Misra these all need another pair of parentheses around the
> entire expressions.

Why?  For both points?  Eclair is happy, with this at least.

What does fail is a bit a of a curveball.

https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/andyhhp/xen/ECLAIR_normal/xen-bswap/ARM64/9556392204/PROJECT.ecd;/by_service/MC3A2.R20.6.html

cpu_to_le64() turns from a real function to a macro under ARM, meaning
that the #ifdef __BIG_ENDIAN in the middle of a bunch of constants
becomes UB.

I'll need to fix that separately.

~Andrew

