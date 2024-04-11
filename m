Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3005C8A1250
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 12:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703837.1099729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rus53-0005BD-1F; Thu, 11 Apr 2024 10:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703837.1099729; Thu, 11 Apr 2024 10:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rus52-000594-UR; Thu, 11 Apr 2024 10:54:56 +0000
Received: by outflank-mailman (input) for mailman id 703837;
 Thu, 11 Apr 2024 10:54:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rus51-00058y-QU
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 10:54:55 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec3b20b0-f7f1-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 12:54:53 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-78d683c469dso306172085a.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 03:54:52 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 es17-20020a056214193100b0069687cdaba3sm791886qvb.36.2024.04.11.03.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 03:54:50 -0700 (PDT)
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
X-Inumbo-ID: ec3b20b0-f7f1-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712832891; x=1713437691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bdA/4Yz4v4m5E1lygQi2sSZ+6dHwGuaFCTBQQ99QMe4=;
        b=jATg3MiW6kFPEUo9JaD6rhDl8FXLbvR8cd4uu+9eCCie6LINDu7gwuWZF5GeZ6Cy1F
         I2YxnrHwOCc0CUlQp3yZd+uC8Rpp1LseEXpN5kWPatcGBaBtNl/ekeQzu4H/eivF9fzu
         CTQsFy/dHBRx2Wt7DzLVwEY53qGO45jumpL2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712832891; x=1713437691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdA/4Yz4v4m5E1lygQi2sSZ+6dHwGuaFCTBQQ99QMe4=;
        b=itQIQrOMQuiJ/AnoIo/OvVWSEKKGzpYb4cPmVfaKH8FvskWUhjMrkYyAL49TymW5KD
         oxqwbH94QUJH4PcDewhZblwxG+opYbt1iAmRbijtQnUvpEAIoHvMPfyg08TNmkmvd8WR
         KEzuHvsYE+s+DN+z18xj+Dv4twgU3th1G3qsAV9oYlwDfleOx4ZP/nw2CIBqDIAJLoQ+
         5YJlNa4pegeQ6bSFRvPzzfF9Ec4igm7z5OOhn9NT0sR4LIJhHoFwk7659Crxyax4WWV2
         5FZBWr369S+iqkgnP5WxGteCSxDhi/zupKhlEIt8q/jENItT7ixkfyJD+9JVD4erCi42
         qryA==
X-Forwarded-Encrypted: i=1; AJvYcCXrFVCkDEjl4KiBREnHNrPvaEB3DGbZkK11DCFImc512xz8R37SbRLNpz6PMIP2GwOeEtJn/tfAx+eCHWv3lBvTOse0LebcVITKr34BCsk=
X-Gm-Message-State: AOJu0YziMEIfmbrWYfpCvy/QBhkYXv7xt839MDr4MYRNXhR7ftriezj+
	pAVpWS4VFyGvKfleveYgoa5USE9wzk7pWrEOI9KQgqkwyqUFdQBD3PxVTKthevQ=
X-Google-Smtp-Source: AGHT+IHyg9Xt5NQqiD17U3+63veUaDUAhrk5L1Xp/aQa1pjWSPEP12ZZ62hUpXvvKLbgCWIQxOuKMQ==
X-Received: by 2002:ad4:5ce9:0:b0:69b:1dd6:f31c with SMTP id iv9-20020ad45ce9000000b0069b1dd6f31cmr4327816qvb.56.1712832891300;
        Thu, 11 Apr 2024 03:54:51 -0700 (PDT)
Message-ID: <a67efb31-f0a5-48e0-89c3-b822fb60312a@citrix.com>
Date: Thu, 11 Apr 2024 11:54:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/virtual-region: Rework how bugframe linkage
 works
To: Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
 <20240410184217.1482366-3-andrew.cooper3@citrix.com>
 <ddc89f97-d71b-4175-a222-64c4c42bd8a1@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ddc89f97-d71b-4175-a222-64c4c42bd8a1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2024 7:20 am, Michal Orzel wrote:
> Hi Andrew,
>
> On 10/04/2024 20:42, Andrew Cooper wrote:
>>
>> The start/stop1/etc linkage scheme predates struct virtual_region, and as
>> setup_virtual_regions() shows, it's awkward to express in the new scheme.
>>
>> Change the linker to provide explicit start/stop symbols for each bugframe
>> type, and change virtual_region to have a stop pointer rather than a count.
>>
>> This marginly simplifies both do_bug_frame()s and prepare_payload(), but it
> NIT: s/marginly/marginally

Fixed.

>
>> massively simplifies setup_virtual_regions() by allowing the compiler to
>> initialise the .frame[] array at build time.
>>
>> virtual_region.c is the only user of the linker symbols, and this is unlikely
>> to change given the purpose of struct virtual_region, so move their externs
>> out of bug.h
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> For Arm:
> Acked-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

~Andrew

