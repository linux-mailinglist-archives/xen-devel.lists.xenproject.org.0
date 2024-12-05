Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1FB9E55D7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 13:53:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849057.1263762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJBLT-0008KN-Cm; Thu, 05 Dec 2024 12:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849057.1263762; Thu, 05 Dec 2024 12:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJBLT-0008HY-9o; Thu, 05 Dec 2024 12:52:39 +0000
Received: by outflank-mailman (input) for mailman id 849057;
 Thu, 05 Dec 2024 12:52:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNEb=S6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tJBLS-0008H9-8G
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 12:52:38 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd247fc1-b307-11ef-99a3-01e77a169b0f;
 Thu, 05 Dec 2024 13:52:36 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4349f160d62so6269185e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2024 04:52:36 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da0dba72sm22986425e9.26.2024.12.05.04.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 04:52:35 -0800 (PST)
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
X-Inumbo-ID: cd247fc1-b307-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733403155; x=1734007955; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Q1KHN55W4zex0BzA/hEEwzfw8yNZL1/Gry8jV5gORE=;
        b=UGiSLLg8/7A5HKMiTYtCKsHHjV0jP/tJukBbnOruLoto7mLUfPKg3aiUZFI/DJcnOj
         8GSJkuKtJz4NxeZlehyxpb7flcnf88dn3Afp+lTeVJZAdiBDzeJij8toVFIr0tpdZQX4
         Q4eWumrprx8gyeifgPJA8XrYSQ1M3+eCjP1IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733403155; x=1734007955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Q1KHN55W4zex0BzA/hEEwzfw8yNZL1/Gry8jV5gORE=;
        b=HhF4NnIH7j3SdHRtLX4s9GMKDk/aa9wVBYO15k3xG2+Wzg2HKru/lSKgnOtrPIQhRQ
         47oQV5B+hbUIfZdJpDpfZHDCh0e0M3thoAYwt+vv1a2cRY6X734Hjj2r3pYUm/GXmA3p
         bHiyVMg4Z8DJ21ZCTxudl175e9u449A6U2E3rNmKeXu4WpoZ3xNaG9BpOMBZiHEDGENo
         N/FhD1cHcSm7pAPAAsJGTYJHvJfd8vWO994B/aS1fu3otmRn3NZfKihF58I9VfdyE6JG
         vL6T59lDWj4lnwPlLrymoYBWTp5ed0jnEwG34+pQ8vipCVUksXr8h5T7DOZrPbXenV/b
         rdOQ==
X-Gm-Message-State: AOJu0YxntJCNKDKy0iBDbmxlNUweiRzdpxYkvzsWSw6ibuzm7Nux8XUz
	QbO5tpwCaeG5d/BjNol4x0+dk/QH74Y27ej6GeayZc9YC9raw5g+Wxz+7nyefpM=
X-Gm-Gg: ASbGncur48gZfpoRkvwV9zL2ShOVgFnbOLerP8t2lCL/s3fpbFkfpC74ExltVCl4HI1
	TfCaW87tLeaud1AQqwDsYdClBDEC4kijfwRD4R1wdfzyLSZmbyz0bIv0PGOFogRHuL8OFc53WS/
	foyD/bVwcM+Xz8SHAkzGVTWRFBZlNKdFGjbXxpB5BHu6mV6eOMWLoXRsAPzyYoCyfURRiisa+X8
	KTi4eIs6PowZnrmtNOfA+P0/DNOzh5b6jTyRtwWbDq+catDeaqPuCL5FTdiHhde1o2jvBNN4heW
	LKo8WFm+vOa3AQ==
X-Google-Smtp-Source: AGHT+IGa9dKbUiXdIj3sMXTjO0GpRFLqxxzjpi/m6iHwgg7vqlkLswu39YBDArba7vLAskTMwJNVAA==
X-Received: by 2002:a05:600c:1c0e:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-434d09b1590mr92873955e9.4.1733403155570;
        Thu, 05 Dec 2024 04:52:35 -0800 (PST)
Message-ID: <7de284f9-8266-4c74-9390-902e29703291@citrix.com>
Date: Thu, 5 Dec 2024 12:52:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen: common: add ability to enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
 <20241130010954.36057-3-volodymyr_babchuk@epam.com>
 <4f2f949b-a53e-4a79-8084-d374cabc109e@citrix.com> <87o71q4xb7.fsf@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <87o71q4xb7.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/12/2024 3:34 am, Volodymyr Babchuk wrote:
>>> diff --git a/xen/common/stack-protector.c b/xen/common/stack-protector.c
>>> new file mode 100644
>>> index 0000000000..b258590d3a
>>> --- /dev/null
>>> +++ b/xen/common/stack-protector.c
>>> @@ -0,0 +1,10 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +#include <xen/lib.h>
>>> +#include <xen/random.h>
>>> +
>>> +unsigned long __ro_after_init __stack_chk_guard;
>>> +
>>> +void __stack_chk_fail(void)
>> asmlinkage.  This MISRA check is now blocking in Eclair.
> I can see what we might want to mark it as "noreturn", but I don't
> understand why you want to use asmlinkage. It is not called from
> assembly.

It's not really about "called from assembly", as "called from something
Eclair can't see".

There's no declaration of __stack_chk_fail() (Rule 8.4 violation), and
no visible callsites (Rule 2.1 violation).

asmlinkage is an annotation that Eclair knows about, for the purpose of
identifying C construct such as this.

~Andrew

