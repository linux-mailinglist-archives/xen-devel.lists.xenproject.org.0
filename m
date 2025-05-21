Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8DAABF790
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 16:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991918.1375709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkEu-0003RL-RF; Wed, 21 May 2025 14:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991918.1375709; Wed, 21 May 2025 14:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkEu-0003Pq-Ok; Wed, 21 May 2025 14:16:12 +0000
Received: by outflank-mailman (input) for mailman id 991918;
 Wed, 21 May 2025 14:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHkEt-0003Oy-8V
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 14:16:11 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23cb5e0e-364e-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 16:16:08 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-601ed5e97e9so6178974a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 07:16:08 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ae48253sm8977664a12.81.2025.05.21.07.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 07:16:07 -0700 (PDT)
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
X-Inumbo-ID: 23cb5e0e-364e-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747836968; x=1748441768; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=edDdcId7Anufnt/IaeMu1mkUCIPLUjT71SdevQXuUzM=;
        b=L0FUD3Pquq0KotG3QHTN4vKC7TG2obcXlELZgvu0cTm7gfsrob531i296QQdDhGDR4
         lXrMMdggbExyzt0F8bkejagdUP+fwoD0T1/POtTBsi2HJot6Q6D5JyaLtIATCyKaBmYE
         V6IfDC0fTw9ZTu1ovKEZtcz8Wbd7ZsOXOFd1SXSPRuJ3tuvwoRudG9I8+qoYVEF2e7+Y
         NblG6H6AKqBHiKPhmPlMKraSJyU+Dqx+QG4Vp4DwhJ8pOg2XUOAhfmWSsq+SQSmbEL5e
         brqFWH3VB1yBzfWjWXkWkn8kHoIyXowCESdtggPNX/JKh7UYp20f7FH5S/xFvd2cCGV0
         dCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836968; x=1748441768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=edDdcId7Anufnt/IaeMu1mkUCIPLUjT71SdevQXuUzM=;
        b=Rn6LC37QgL369r9nQ4lvZtWDTsYgoJGH4S2dVLKVLGSp/PpTWaCfouw56mFUGdnA7a
         o9bIeUMXy07ELNCI/7D/FVPTqvfNzr6PgUg4oB2ui0K9k0/XL5FundzGNZO45p/Rz9FZ
         vIbppKARxTk1jlReQeAIQ6T60rJIHlYwRw2A/kDN+z3pTmtFQg17Lr50J6doJ3AtKD+J
         gyu5SnaNpnJ06gySwC/jlm4Wwriw2/qeuEHzBquxsY/I5Ox1x6yKFCCSKMoOga1eaQhS
         UtcjBf0Rz8agDsA43M+TLqjIZpqjDptDkVG1lAe9iWlRp2grKsp0l+ORRlpFvFnwv/+9
         w26Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJyWoNzD1gfRXvGJOtE4srLQsIBcMUBARS9V5DcSVH2+fsauHC5+Y3j8S25v0jdH1B9Ma9yf/O7fc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyY9MgH1viA9oHf5TxNtU6PpHnKuRDcnIdwFR6/gqVpO99PNnPG
	YzpOX4xRBc8tGg5J9ivUmBfFrCi61SJ5s0X7gWbOyW5GYbzqA3tN8aozLZJ6we3WPw==
X-Gm-Gg: ASbGncuGpuGffq3ba3ofDNz6q2T+vu0sfXJWm3fSFoq/Fj7OyHULy6WAuLRUA8a4Zco
	iAVqFYJpCAysrKkJVIPGSwIyg0vGrnPowR/VDLSBxZuvL+G8MDtbF1+zGxzOJjD5KJCxstea/Rx
	rGhdee2txNGtETOYUTLDfpJEIlec3OeA3LLx8w5cKoQkaswC/+KzJORv/cFrxRyalOg8veef9pa
	lL+EXN/5COvY5EjNIR8qSFrW6rpOcGdJFvI8Anwr/dxUK8iiHWUbcsVsuutF81TaLT43cgcgtCp
	xyYYdHrVuqf5tnOY3uxJR0m+XTjNy4hbURwObdFaPd967nYbSXLS4DDibh2jzA==
X-Google-Smtp-Source: AGHT+IFzgGEaPQ4scpoSSWBBF55xtPN7l0xGZnmf9dIw1iW1duWRYCLturr64iXOcIHI14mLJO/Hpw==
X-Received: by 2002:a05:6402:13d6:b0:601:f3f1:f10e with SMTP id 4fb4d7f45d1cf-601f3f1f375mr9629486a12.5.1747836967822;
        Wed, 21 May 2025 07:16:07 -0700 (PDT)
Message-ID: <537a0452-8299-4164-afce-38a5f7e2ff67@suse.com>
Date: Wed, 21 May 2025 16:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: add initialization support for virtual SBI
 UART (vSBI UART)
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1f380b7061496f999d4d60a60b58f494dae886e1.1747064551.git.oleksii.kurochko@gmail.com>
 <d923a7dc-f850-4256-8639-310243a26736@suse.com>
 <bb5b3f79-317e-4977-b941-21c655fa23ee@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bb5b3f79-317e-4977-b941-21c655fa23ee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 13:40, Oleksii Kurochko wrote:
> On 5/15/25 12:08 PM, Jan Beulich wrote:
>> On 12.05.2025 17:55, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/Makefile
>>> +++ b/xen/arch/riscv/Makefile
>>> @@ -1,5 +1,6 @@
>>>   obj-y += aplic.o
>>>   obj-y += cpufeature.o
>>> +obj-y += dom0less-build.o
>> Arm uses
>>
>> obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
>>
>> Why the two differences?
> 
> Missed that. I have to understand why Arm uses *.init.o, but likely I should do the same for RISC-V.

There's likely nothing Arm-specific in this. When all functions in a file
are __init and all data is __initdata / __initconst, we prefer to move
the remaining data (string literals being the most prominent example) to
.init.* as well. That's (basically) what the *.o -> *.init.o build step
does.

Jan

