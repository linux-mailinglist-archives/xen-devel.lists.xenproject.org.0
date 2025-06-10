Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4BAD3F25
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 18:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011128.1389465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1ys-0007Al-Ud; Tue, 10 Jun 2025 16:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011128.1389465; Tue, 10 Jun 2025 16:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1ys-00078M-RC; Tue, 10 Jun 2025 16:37:46 +0000
Received: by outflank-mailman (input) for mailman id 1011128;
 Tue, 10 Jun 2025 16:37:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NC6Z=YZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uP1yq-00078E-KQ
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 16:37:44 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3baaa94a-4619-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 18:37:43 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2453328f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 09:37:43 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5323b33c3sm12879109f8f.34.2025.06.10.09.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 09:37:42 -0700 (PDT)
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
X-Inumbo-ID: 3baaa94a-4619-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749573463; x=1750178263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IrxesT9NgLHny01wQYS35m4yKvsiIFp0Y0WdDHKomoA=;
        b=jrzyOKJCoh+CuGQJu1TkDFjtfVfBazUYB44ROmKk2UuxpAgYxk6tXMqcKDUhi3saKY
         mhnVwa/Dsfcn3dirrgkk7e5iFeLZEel5ojlZFug3G0/n6GU9uHMkHGlUk+6kpAMIzQWM
         6Q5XiMMX9/X9pQEc82Bbj1nHS2ayM4fk3uQks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749573463; x=1750178263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrxesT9NgLHny01wQYS35m4yKvsiIFp0Y0WdDHKomoA=;
        b=u1D4rC3qzLMcjv2d+93Q+RfwXY9rJkQMO3WX3POk1tk9lv7zdD7UHSfB8xQ1GtbEPd
         +iu00da3sGahZ01M7NEPbK1G/Wd4pBtk8ETUh10z2igm33+cSE0/NYYnY4v4kTvcO0gU
         Ja4XO7iXJGiNFywWQbBcivR0/+97dgMBadd+8Vxx3wMYP6mwYkPDOU1CZYKIijyoU16V
         Nf18/jcC+WaYgiRClf0ic6P//x35+P6E9U16kmM9EVuoSEC08nJFUBibyd+QJwDOUfiB
         iYKNc9kOWgExJI9EUn8giDXNksfJFyuVa1lrg4yMsnSxT0rHc23l2kKDd5kRjMC6Cdoj
         LjcQ==
X-Gm-Message-State: AOJu0Yyejc7uZyGf7XDQFwzkt6Y0tUwqr35+cmDVE4cev602xq+5xRwp
	VMkXZ4WvjWJU41Ab1ZU8n37Tfcv21TW4PbIas37c0c6h+sHtIUoLkk8gYeaHcTHz7aE=
X-Gm-Gg: ASbGncvCoAHxR9BYlGxIBut2n6UIfiyzuibZL+UePPOufUc20uNi8cJisSIbwjMgB3C
	REPAY9IFbESUct9Ck318enL0OrCHY7y/d4ZhMEJFavk9ELezJhRqojAjKKGdA/S7H781/bwnZfO
	0Fvn/HjUorrFEsXdyMXdnjdaGcmh52bWGh2RrlUBOQKQPa3M8DRkBIsXDz8wvlGChJCvdj4t5/b
	KL7v+1XD0syNzaDVDPs0snIF4W6bA3cTE1nn6D+qIwvYRvj22S0h4xEOuKixAsY5bPXU+vhIhDZ
	jUJhoUzA/WUCulnHJXZD1bdH/n9XuyyJtn00On88SOhSTmnjzaS7hMEF7wjzADtXeEZXFOKUaPM
	lkRs1BlLUsw==
X-Google-Smtp-Source: AGHT+IGqIolVPqMnaaGqAOkecEDbYmBUy49Zvn7BWdVSP+nPUHXddL+pTABIH+O9dRPGZ2oT8QwLBA==
X-Received: by 2002:a05:6000:2582:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3a5522791d0mr2446056f8f.26.1749573463181;
        Tue, 10 Jun 2025 09:37:43 -0700 (PDT)
Message-ID: <57c9c8b6-eb06-4793-871e-9120982097a3@citrix.com>
Date: Tue, 10 Jun 2025 17:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: fix build with HAS_PCI
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250610142300.197599-1-stewart.hildebrand@amd.com>
 <aEhUe30Hojo8CoeP@macbook.local>
 <aceed733-37d5-4a34-9645-33d7bf27642f@amd.com>
 <aEheAyAMMTi87IZS@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aEheAyAMMTi87IZS@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/06/2025 5:32 pm, Roger Pau Monné wrote:
> On Tue, Jun 10, 2025 at 12:16:42PM -0400, Stewart Hildebrand wrote:
>> On 6/10/25 11:51, Roger Pau Monné wrote:
>>> On Tue, Jun 10, 2025 at 10:22:57AM -0400, Stewart Hildebrand wrote:
>>>> In file included from ./include/xen/pci.h:72,
>>>>                  from drivers/pci/pci.c:8:
>>>> ./arch/arm/include/asm/pci.h:131:50: error: ‘struct rangeset’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>>>   131 | static inline int pci_sanitize_bar_memory(struct rangeset *r)
>>>>       |                                                  ^~~~~~~~
>>>> cc1: all warnings being treated as errors
>>>>
>>>> Fixes: 4acab25a9300 ("x86/vpci: fix handling of BAR overlaps with non-hole regions")
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> Sorry, it was my fault.
>> No worries, it's pretty hard to catch when it can't be built without
>> extra patches.
>>
>>> Would it make sense to introduce a Gitlab build that has HAS_PCI
>>> enabled?  Or it won't build either without extra patches?
>> It requires one extra patch ("xen/arm: pci: introduce PCI_PASSTHROUGH
>> Kconfig option"):
>>
>> https://lore.kernel.org/xen-devel/20231113222118.825758-1-stewart.hildebrand@amd.com/T/#t
>>
>> It has an ack, although it needs a rebase and we would probably want to
>> add HAS_VPCI_GUEST_SUPPORT now that upstream has that config too.
> I think it would be helpful to be able to do a Gitlab build with
> HAS_PCI enabled on ARM, otherwise it's inevitable for build issues to
> creep in sadly.

This is what randconfig is for, and randconfig is active for arm64.

If something is preventing this configuration from being picked, that
ought to be fixed.

But, ARM already has a lot (too many) unconditional builds of specific
feature combinations, and I don't think we want more.

~Andrew

