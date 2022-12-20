Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AB765286A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 22:29:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467422.726497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7k9y-0003B7-SS; Tue, 20 Dec 2022 21:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467422.726497; Tue, 20 Dec 2022 21:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7k9y-00038N-Ox; Tue, 20 Dec 2022 21:28:26 +0000
Received: by outflank-mailman (input) for mailman id 467422;
 Tue, 20 Dec 2022 21:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LdMQ=4S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p7k9x-00038H-IQ
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 21:28:25 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b473ec6-80ad-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 22:28:23 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id d14so19342078edj.11
 for <xen-devel@lists.xenproject.org>; Tue, 20 Dec 2022 13:28:23 -0800 (PST)
Received: from [192.168.1.93] (adsl-139.109.242.138.tellas.gr.
 [109.242.138.139]) by smtp.gmail.com with ESMTPSA id
 w24-20020aa7dcd8000000b004723db864a8sm6125673edu.60.2022.12.20.13.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 13:28:22 -0800 (PST)
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
X-Inumbo-ID: 3b473ec6-80ad-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXU/oAahfAcs5ocvzJUCWKOq45urGM5fl0FVh2v0FVM=;
        b=L+kBay6DlqBt8nUr7zX146jv+tEkB7SgGnfHRB/wbo19vWK1CqnAGafDhK5hfOeQjX
         SFZAAGP80F9F6Avk93mbMYdYdMBoh5pchWgYSNEu4zN3FyWkaBUZl8zHGQ8fi8PG6oRw
         730K2SGRvcIMLp738i+hyiKrK1+1ur5RsN/r08ha6U9TtiP9KO/etQd1jQ8DuORgFvDj
         2qanTsLycaCpK2KjAaFo0ipvGNnPvYNsHizf2MqUpz0449mVPLHsCSM74LjqfE7Ad/V1
         KNA3NuoG0dvgTJqJFPfg04Wgy9wXW7QsQkwvaYwcQoACFwleqqP9QTNN1dXyhlKpvXXJ
         P0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXU/oAahfAcs5ocvzJUCWKOq45urGM5fl0FVh2v0FVM=;
        b=QZ0zx5JOJTxoewTrZZm23UDzn6bBWPxwuy93lDIlVFAd37r1c4wzRAZtbvmBB5UFf9
         fgkp37u5h5mKJ3yuUaV9rvA4C8GAyi1x7pWJNbbgsgNfFkjn1WqYYfugBCIY+YJ0u6j9
         KPQG3rDaGHq0YyoO/ebhcUFCuVgDVHQymiSu3QHmn5bludg+bhNCVjgvML6ZNBzoB5i7
         8W4nPFeJis/ZX69BYziiBfHYUChH9aEGnFETd8u6CyW34LUiAmlnR5STUjFt6yU6RKcB
         nIt/u+3IsCPmZ2wHCE8e5/qT5unJ81DhDlevOckcItro0FMXCUWwSrl2OSJycXdcq+P3
         Yawg==
X-Gm-Message-State: AFqh2kqTnfWAvMGNzkaqQOVi3JrfgVEzLFpItyn55c77YxtVAC+6S72q
	t/CYKweTbSQRmdwsXCcULw9Vgm9ci/A=
X-Google-Smtp-Source: AMrXdXt20EE36sb4DPqthcI5Rf9+6Z2b06pM1HGPDK2yWUrrazz4v/iz+euylIO0cca/U0aRnnf3EQ==
X-Received: by 2002:a05:6402:916:b0:47a:9aef:8841 with SMTP id g22-20020a056402091600b0047a9aef8841mr3678379edz.36.1671571702829;
        Tue, 20 Dec 2022 13:28:22 -0800 (PST)
Message-ID: <dc04a258-865f-7e78-52bd-a3468bb3ea48@gmail.com>
Date: Tue, 20 Dec 2022 23:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 1/7] x86/iommu: make AMD-Vi and Intel VT-d support
 configurable
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-2-burzalodowa@gmail.com>
 <09997785-ddb0-c464-331c-618349f418f2@suse.com>
 <5d2e2534-5582-6064-d18a-5900a8cb3d59@gmail.com>
 <e9dbbe9e-78ad-dd3e-039b-3f9aeca3ed36@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <e9dbbe9e-78ad-dd3e-039b-3f9aeca3ed36@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/20/22 23:00, Andrew Cooper wrote:
> On 20/12/2022 8:57 pm, Xenia Ragiadakou wrote:
>>
>> On 12/20/22 19:01, Jan Beulich wrote:
>>> On 19.12.2022 07:34, Xenia Ragiadakou wrote:
>>>> Currently, for x86 platforms, Xen does not provide to the users any
>>>> configuration control over the IOMMU support and can only be built with
>>>> both AMD and Intel IOMMU drivers enabled.
>>>> However, there are use cases, e.g in safety-critical systems, that
>>>> require
>>>> Xen to be able to be configured to exclude unused code. A smaller
>>>> tailored
>>>> configuration would help Xen to meet faster certification
>>>> requirements for
>>>> individual platforms.
>>>>
>>>> Introduce two new Kconfig options, AMD_IOMMU and INTEL_VTD, to allow
>>>> code
>>>> specific to each IOMMU technology to be separated and, when not
>>>> required,
>>>> stripped. AMD_IOMMU enables IOMMU support for platforms that
>>>> implement the
>>>> AMD I/O Virtualization Technology. INTEL_VTD enables IOMMU support for
>>>> platforms that implement the Intel Virtualization Technology for
>>>> Directed I/O.
>>>>
>>>> Since no functional change is intended regarding the default
>>>> configuration
>>>> of an x86 system, both options depend on x86 and default to 'y'.
>>>
>>> But do things also build successfully when one or both options are
>>> disabled?
>>> I have to say that I would be quite surprised if that worked without
>>> further
>>> adjustments. In which case initially these options want to be
>>> prompt-less,
>>> with the prompts only added once 'n' also works.
>>
>> Without applying the whole series, disabling any of them or both won't
>> work. Ok.
> 
> To do a multi-step implementation, you start with
> 
> config FOO
>      bool y

Here, I think you mean def_bool y

> 
> then rearrange them main code to use CONFIG_FOO as appropriate, then
> have a final patch that adds a Kconfig name, help text, etc which is
> what makes the config option user selectable and able to be turned off.

Thank you both, for pointing that out. I will fix it.

> 
> ~Andrew

-- 
Xenia

