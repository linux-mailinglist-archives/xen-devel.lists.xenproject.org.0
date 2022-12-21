Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E15652F77
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 11:29:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467778.726826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7wLH-0006Yb-25; Wed, 21 Dec 2022 10:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467778.726826; Wed, 21 Dec 2022 10:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7wLG-0006WS-Vh; Wed, 21 Dec 2022 10:28:54 +0000
Received: by outflank-mailman (input) for mailman id 467778;
 Wed, 21 Dec 2022 10:28:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eskD=4T=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p7wLF-0006WM-VM
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 10:28:54 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 441494fc-811a-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 11:28:53 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id x22so35677677ejs.11
 for <xen-devel@lists.xenproject.org>; Wed, 21 Dec 2022 02:28:53 -0800 (PST)
Received: from [192.168.1.93] (adsl-43.109.242.137.tellas.gr. [109.242.137.43])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a170906410200b007ae693cd265sm6882890ejk.150.2022.12.21.02.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 02:28:52 -0800 (PST)
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
X-Inumbo-ID: 441494fc-811a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=warbBCcxKJrML3Lz4B4jYoBcKHZoebVfHUWZ7OpLkeU=;
        b=IlOjqJhwBhLJ/zYyu+aMeF/Clfj6LGmu4Tqw2CGesgHHVYJSm125ofOKzI3EHMhd9O
         MPcKGVojhH7KkbN9OEw8QzKOknPr/Vi2Slou1/zyAX/oPaDQhiQen4Gp97KwAlCXbZrt
         FlxfA8EaD3Y85JR8b8syWnzOgsnjP6LLi0s3FEIOlkkFxo8srJHTnd6s1laeyOhDMvT8
         JnDEJEJUl5wXh5JZd4JbMG+SoYYJeyqGB3cqWfmx2HWpBIU9Hx4eypUK67AxColoRut6
         3VpNLxvcOIowICt5uRjOTqdOXvfX9B2TLnjdiAG/tU+Dfc5ehu0+jEnDcz/aO8jSzoQS
         K41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=warbBCcxKJrML3Lz4B4jYoBcKHZoebVfHUWZ7OpLkeU=;
        b=49sn7kC2PTLJcfo26NEuqTCo1EvqmyqIseFHQ3PWnBbswOxrhWWhuuKPa2yd7iQDf7
         MCGEAPjeFpzR2ERZ1POS9j5WOLqWYJipY4/vmDjwOpchjGNnjWmNBTC+3I06IzMy2+/S
         V3SkyQkqXlTnSrbxz9Xb/B1RjXeL4Uo0hvKTzXd149lFin05Vs/mCeB3s+Bw4nzq3AF1
         pFfg1uLe4eHWbN4WRBvnlNPa3QhXigjoa68iXKh8k/EQKYOGr0rkRN9oFB/SPsNd14Yg
         gYmbWh9wwEyw0+1JV9/Dx3ui2XQO2TKNF2mVsCAnmeh08VyitryYela29jcmS3pVPuo+
         XP/A==
X-Gm-Message-State: AFqh2koPMQMTmjci/IkbsiRVgg6AfvuTFGsMe4/PM29nyUnHarKs35P2
	CZ6TxlHAtmY5ujMYUBf7YqY=
X-Google-Smtp-Source: AMrXdXvWAEduLALsgj3EftYVoK4bMaqtfbNlOiBBVjTfzvOrCP8KMbPIq2/m4dHi8KAfNJRrlRKyZA==
X-Received: by 2002:a17:906:4894:b0:7c0:beee:2f06 with SMTP id v20-20020a170906489400b007c0beee2f06mr934165ejq.52.1671618532581;
        Wed, 21 Dec 2022 02:28:52 -0800 (PST)
Message-ID: <192b2825-4133-96d1-e091-4b99cab0eeba@gmail.com>
Date: Wed, 21 Dec 2022 12:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 1/7] x86/iommu: make AMD-Vi and Intel VT-d support
 configurable
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-2-burzalodowa@gmail.com>
 <79748e9b-c2c4-a8bf-f7b5-3405debb3c00@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <79748e9b-c2c4-a8bf-f7b5-3405debb3c00@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/21/22 09:51, Jan Beulich wrote:
> On 19.12.2022 07:34, Xenia Ragiadakou wrote:
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -37,6 +37,22 @@ config IPMMU_VMSA
>>   
>>   endif
>>   
>> +config AMD_IOMMU
>> +	bool "AMD IOMMU"
>> +	depends on X86
>> +	default y
>> +	---help---
>> +	  Enables I/O virtualization on platforms that implement the
>> +	  AMD I/O Virtualization Technology (IOMMU).
>> +
>> +config INTEL_VTD
>> +	bool "Intel VT-d"
>> +	depends on X86
>> +	default y
>> +	---help---
>> +	  Enables I/O virtualization on platforms that implement the
>> +	  Intel Virtualization Technology for Directed I/O (Intel VT-d).
> 
> One more thing Andrew and I have been talking about: As he has mentioned
> elsewhere, IOMMU support is needed to boot systems with more than 254
> CPUs (depending on APIC ID layout the boundary may actually be lower).
> Hence it needs to at least be considered to make the prompts here (to
> be precise: in the much later patch adding the prompts) dependent on
> EXPERT, to prevent people from unknowingly building a non-functioning
> (on some systems) hypervisor.

I will mention it in help as Andrew suggested and I will make it visible 
only if EXPERT.

> 
> Jan

-- 
Xenia

