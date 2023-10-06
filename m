Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3697BB8EC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 15:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613625.954278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokkp-00069v-9f; Fri, 06 Oct 2023 13:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613625.954278; Fri, 06 Oct 2023 13:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokkp-000678-6D; Fri, 06 Oct 2023 13:20:31 +0000
Received: by outflank-mailman (input) for mailman id 613625;
 Fri, 06 Oct 2023 13:20:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vVKM=FU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qokkn-00065D-0x
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 13:20:29 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dccf630-644b-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 15:20:28 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4065f29e933so20243915e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Oct 2023 06:20:28 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 4-20020a05600c228400b003fee53feab5sm3731943wmf.10.2023.10.06.06.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 06:20:27 -0700 (PDT)
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
X-Inumbo-ID: 1dccf630-644b-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696598427; x=1697203227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BZCC6XDJDYvYNkF3Bh5qPLeCRD4/n/HrWcFTswrWBmw=;
        b=hs7SkQ7Hinx1rfhdF3Wc4x7zBuxINwqCQ8sGMtj2kLpnOR59BkYU+Jqmk4kU0S5jjr
         FRC/IMKpkjZ21SzWlI0Rgx4XR1AmF3R3a/Q576QA8FT/XqshvPltfNTrN/uAgH5bca2z
         MpAtPNgweAFloUz5Tu3GWOVTdGZLYzXnsXFnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696598427; x=1697203227;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZCC6XDJDYvYNkF3Bh5qPLeCRD4/n/HrWcFTswrWBmw=;
        b=lWCITrDIRSIbZ5ofNzU50W/YpDJ1cjzYoI6AC6zK9AoezmYBk7u9XMEjVSpenPedNy
         p6ApdkDs4hmErAn6P5NEHmTaPW0tS/XCV8fc4EB21uN/ergeJjlfsf06Vt2Fa4dE7FAv
         7m6whntu36eTr0MCkzB2bo6dymWNqpJagTLDWGi1I+bh+EVDsd/Dt9m0DnmGqEpe2R/6
         HjaGYeryxm6iRlSFpQGUbCgqoB1jG7wvc0HrUEaGzcJVLvODbjFluUiXoFfbhyyUknuW
         TWL3xGmYGW0/SBJktEjC1BlLTDytmVV0n2TcO+W3YXiTBOY9l6PkhzUO4Vb0/F2IyLIQ
         wFgg==
X-Gm-Message-State: AOJu0YyOkEs8tfIgE/3jH4Ht0ApmyYKKNVeZHXI0xhMbD4htcJT2tik8
	Mw/JLNR0cVDsSIiWw4yDutiCzQ==
X-Google-Smtp-Source: AGHT+IHsiFOZ9O9XEwD7P8VuCjzI8NnVD2XCg5cqbCS3lHQ9aFu2FijcxdUgLlEoB1We39ZB7/Ve8g==
X-Received: by 2002:a05:600c:b4b:b0:405:3f06:c084 with SMTP id k11-20020a05600c0b4b00b004053f06c084mr7267517wmr.13.1696598427672;
        Fri, 06 Oct 2023 06:20:27 -0700 (PDT)
Message-ID: <fbfbf68f-68ac-4ab3-996c-ad176c376e31@citrix.com>
Date: Fri, 6 Oct 2023 14:20:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 4/4] pdx: Add CONFIG_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
 <20230808130220.27891-5-alejandro.vallejo@cloud.com>
 <d462f419-4cd2-53c4-7694-b43b7fa68d88@citrix.com>
 <1e451293-68df-e71e-0f2b-343dcf9a246f@raptorengineering.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1e451293-68df-e71e-0f2b-343dcf9a246f@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2023 6:37 pm, Shawn Anastasio wrote:
> On 9/22/23 3:03 PM, Andrew Cooper wrote:
>> Several things.
>>
>> First, Shawn: PPC has gained a HAS_PDX, the deletion of which needs
>> merging into this patch.
>>
>> It was added as part of 4a2f68f909304 which was "minimal to build". 
>> This series address the issue you presumably encountered where pdx.c
>> appears to be optional but wasn't.
>>
> That's correct, build was broken without HAS_PDX.
>
>> Do PPC platforms have (or potentially have) sparse RAM banks?
>>
> Yes, they do. Especially on POWER9, it is very common for there to be
> large gaps in the physical address space between RAM banks.
>
>> If like x86 the answer is definitely no, then you want to have
>> PDX_COMPRESSION=n
>>
>> If the answer is definitely yes always, then you want PDX_COMPRESSION=y
>>
>> If the answer is system specific, then you want to offer users a choice.
> It looks like PDX_COMPRESSION=y would probably make the most sense for
> ppc, but I'm not against making it a choice.

Thanks.  I'll make suitable adjustments.

~Andrew

