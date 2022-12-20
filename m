Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E663652801
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 21:40:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467367.726431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jPd-0003tx-2H; Tue, 20 Dec 2022 20:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467367.726431; Tue, 20 Dec 2022 20:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jPc-0003sC-VW; Tue, 20 Dec 2022 20:40:32 +0000
Received: by outflank-mailman (input) for mailman id 467367;
 Tue, 20 Dec 2022 20:40:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LdMQ=4S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p7jPb-0003p3-Dq
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 20:40:31 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b28cb18-80a6-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 21:40:30 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id m18so32068305eji.5
 for <xen-devel@lists.xenproject.org>; Tue, 20 Dec 2022 12:40:30 -0800 (PST)
Received: from [192.168.1.93] (adsl-139.109.242.138.tellas.gr.
 [109.242.138.139]) by smtp.gmail.com with ESMTPSA id
 p5-20020a170906838500b007415f8ffcbbsm6182829ejx.98.2022.12.20.12.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 12:40:29 -0800 (PST)
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
X-Inumbo-ID: 8b28cb18-80a6-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vinmkR2W3x2w0/ZaG84gfv4wHPoCj9Ana65Ygp3iGMA=;
        b=CI0+2WcHO9T2R3P8NZxwLjxMs3JPdp2x+WwVYYLM+nxK0LkfWT3xJp4s/0yZpqgqcg
         +LYpZ5ExHnLKwFYGawzxcaPeIcNLzSglTkd9gbxYMqpoE9QLberZfvYUJuu/iaK2ZBMR
         FkYlLLDS6vSOE+cqElfJvocPhOFQjJitUPmDTxu/hTlX+h8rCvefSEtEKAmSLE62e3pZ
         oje/r/MiqXUuszk1YnCDlVRq+z4kVK6dtKbaRdG7PbEs4wKTgh28nauVheF+AT5h2Yzp
         1dIY+nskmKWDg0noSIg9v2QfnyA0CKK7ytWBhjQU1ahktkDgaO6N15ezPnc5MJv6Sent
         M8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vinmkR2W3x2w0/ZaG84gfv4wHPoCj9Ana65Ygp3iGMA=;
        b=kmOGoItT1eMuWCey4yUZukpETTDsdX6SGxAu5+FyD2voypWiZ6/WWo2+JgxHmSHOqp
         oJxMwR8onDxSkPzvLhTzNgcFQ/SFvanf20Aw+76ASyXw41HQ/lR9u1A9/hyYA4EyJGgh
         AbcrMOOKlsCNn4nu+3ivUDsvxKt+lguCisBsJpK4Dnc7YuZXJ9Tvf2d0i+rsI6EQW/QR
         GeAp3kdUiTMgrsi91HrlThCdxxLMxVev8AMa4Ben27UKQP52othb2ZVD+sUj8BlelZTk
         FxAqRP5vWYktiy8fk0/3ZGLbUoYdnE2hUhBcPAsBCvt8Z6HLdb+LFWp2xucboVSu6vdw
         h0/Q==
X-Gm-Message-State: AFqh2kqavo7CuHbt3XrsVoreNrx5RDjYFzkI5+aGthUf6uBU4S1xV6gP
	VE/vxEKg9E52LO+/5yB5kGw=
X-Google-Smtp-Source: AMrXdXtZTj/VNrOARu1ict3IZCJ9Ehb+E+rbwHOi+n8Ub7c1kNF4AyvhMkCohCL9Hwo+N5yp0hYcJw==
X-Received: by 2002:a17:907:d48e:b0:82a:5b57:3fe4 with SMTP id vj14-20020a170907d48e00b0082a5b573fe4mr7408697ejc.68.1671568830370;
        Tue, 20 Dec 2022 12:40:30 -0800 (PST)
Message-ID: <96c49528-bed1-8de8-2bfe-dde5593d48cd@gmail.com>
Date: Tue, 20 Dec 2022 22:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 1/7] x86/iommu: make AMD-Vi and Intel VT-d support
 configurable
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-2-burzalodowa@gmail.com>
 <ed527c56-13e9-b02b-0608-3c943d76d159@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <ed527c56-13e9-b02b-0608-3c943d76d159@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/20/22 12:26, Andrew Cooper wrote:
> On 19/12/2022 6:34 am, Xenia Ragiadakou wrote:
>> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
>> index 479d7de57a..82465aa627 100644
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
> 
> We're trying to phase out ---help---, so please just use help.

Ok.

> 
> ~Andrew

-- 
Xenia

