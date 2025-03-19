Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAD3A68E71
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 15:05:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920740.1324818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuu2i-0004Up-0l; Wed, 19 Mar 2025 14:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920740.1324818; Wed, 19 Mar 2025 14:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuu2h-0004Sd-UJ; Wed, 19 Mar 2025 14:05:11 +0000
Received: by outflank-mailman (input) for mailman id 920740;
 Wed, 19 Mar 2025 14:05:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zx04=WG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuu2g-0004SS-Mc
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 14:05:10 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b0f88c3-04cb-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 15:05:09 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso5997895f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 07:05:09 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-399728f493csm2593337f8f.67.2025.03.19.07.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 07:05:07 -0700 (PDT)
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
X-Inumbo-ID: 2b0f88c3-04cb-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742393109; x=1742997909; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HkXnqGDqV73Pr1H5uSmAjD9ZGsAJLmtHyTXmHc+A+WU=;
        b=VoXaAnKRQSZwN10x3oA/m54qhKTTRbM5xisXM6gKhWWaVIjcT9tyrErwO3Apf5ft+j
         NyV1ck1twNDOLnBQ/JAG5VH9t6lK2A4jobZa0xM3iI3vOyFP/0zVnQiqxDK7QbAEce4c
         Ro6ztl0K40D4Xmb50A3Xy17xhyyhL1yZ9HsJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742393109; x=1742997909;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkXnqGDqV73Pr1H5uSmAjD9ZGsAJLmtHyTXmHc+A+WU=;
        b=Ff01/SQg/yBIhpw60L7TZqAxKryHDmRF2x9OQBGhLyFUR5XqJcX0R7h2av8U4CoUjn
         5v1tTqka9hs2OjYxOv40RtrEkafCoK6LNAGK1sAP5Xpkp2+X4AK1BbZsjD4BIhmiwxWZ
         J8F01t9ThvSC11LCFTz64otP23NDLm1IoZTE/2iHP2l8Y6FcDIa57W/iSt+l0DF8beOu
         BwOrqrsW8zvoiyR5JGTYYPeXizC2Wo6xm687ysryEd0XThKvZveN1+buCNFGqXJY/jkx
         iQ+OyubAzus6xEdw6nplTDgAhC8uvv5hTV6fFYlSGHLKmkv2HXR+GL0Sj74LAf5egEKt
         pyfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNGZWW4d55D1Kt3o1P6H/j2p19M5h66of0skeQ6anwITke9OEYjVw8a1H16/f7FSW5goqhRBD2jKs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywig10+i9CJShQdAdw4F00vzmcWJhuYKtoGb6+X6BGp9267WQQY
	vWeUXfPBB+HyjOLx0jNGJsoDgAwqhhLXgpBT/v7desp5vMPVk/9SMJGlvjravOk=
X-Gm-Gg: ASbGncuT4BRlFyP92XqG7EoCwtO3+H2RaTsm+wtveoEisjoq5lRW2KOQrtPxszpf841
	eCDoN5BYmTzCtZEVxRVTaF0zkikEJrwatQYWS2Fx6243EGEbiNhSNIbKDkUAao981cdYpIRWfN7
	cEQ6gGPNWySxj2++8kE1PvBaxj2hL0zqlVbxVCLtjE26WYawOpNGOe1EuukOccKxOEmAW/DGrpY
	IsAmATUAhufmcSflMWIoN1hQYXZCzsd+lxKjGEVDZY2ENyvyP6AwG6C1PyQ741zcLfFUqwIl86C
	o5DvnDupbrDs21rJwmGhnoso/1wJLrCN18q+IsTGckEpwMEs8yPK4m8EjPhFppRfl3ScgHm7F18
	mlGhI39QR
X-Google-Smtp-Source: AGHT+IEB+Dnlc8M3MVzuksCZCg6Vm/yE0SaD237+ySanBA2/yBdWwtvesNA/Y4E3q0vM99xMFLVnPg==
X-Received: by 2002:a5d:6d87:0:b0:391:4231:416 with SMTP id ffacd0b85a97d-39973af9116mr2406902f8f.36.1742393107434;
        Wed, 19 Mar 2025 07:05:07 -0700 (PDT)
Message-ID: <1f3c9275-14da-4baa-a0e1-e092d0d606b5@citrix.com>
Date: Wed, 19 Mar 2025 14:05:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/arm: Fix nr_spis handling v2
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250318090013.100823-1-michal.orzel@amd.com>
 <D8KAQ3MH52YA.1G12M32NDFRJW@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <D8KAQ3MH52YA.1G12M32NDFRJW@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/03/2025 2:01 pm, Alejandro Vallejo wrote:
> On Tue Mar 18, 2025 at 9:00 AM GMT, Michal Orzel wrote:
>> We are missing a way to detect whether a user provided a value for
>> nr_spis equal to 0 or did not provide any value (default is also 0) which
>> can cause issues when calculated nr_spis is > 0 and the value from domain
>> config is 0. Fix it by setting default value for nr_spis to UINT32_MAX
>> (max supported nr of SPIs is 960 anyway).
>>
>> Fixes: 55d62b8d4636 ("tools/arm: Reject configuration with incorrect nr_spis value")
>> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  tools/libs/light/libxl_arm.c     | 7 ++++---
>>  tools/libs/light/libxl_types.idl | 2 +-
>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 2d895408cac3..5bb5bac61def 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -84,7 +84,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>                                        libxl_domain_config *d_config,
>>                                        struct xen_domctl_createdomain *config)
>>  {
>> -    uint32_t nr_spis = 0;
>> +    uint32_t nr_spis = 0, cfg_nr_spis = d_config->b_info.arch_arm.nr_spis;
>>      unsigned int i;
>>      uint32_t vuart_irq, virtio_irq = 0;
>>      bool vuart_enabled = false, virtio_enabled = false;
>> @@ -181,13 +181,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>  
>>      LOG(DEBUG, "Configure the domain");
>>  
>> -    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
>> +    /* We use UINT32_MAX to denote if a user provided a value or not */
>> +    if ((cfg_nr_spis != UINT32_MAX) && (nr_spis > cfg_nr_spis)) {
>>          LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
>>              nr_spis);
>>          return ERROR_FAIL;
>>      }
>>  
>> -    config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);
>> +    config->arch.nr_spis = (cfg_nr_spis != UINT32_MAX) ? cfg_nr_spis : nr_spis;
>>      LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
>>  
>>      switch (d_config->b_info.arch_arm.gic_version) {
>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
>> index bd4b8721ff19..129c00ce929c 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -723,7 +723,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>>                                 ("vuart", libxl_vuart_type),
>>                                 ("sve_vl", libxl_sve_type),
>> -                               ("nr_spis", uint32),
>> +                               ("nr_spis", uint32, {'init_val': 'UINT32_MAX'}),
>>                                ])),
>>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>>                                ])),
> Doesn't this regenerate the golang bindings?

You need a build environment with golang for that to happen.  It's easy
to miss.

In this case, best to ask the committer to regen.

~Andrew

