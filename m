Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA74165281C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 21:57:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467389.726464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jfq-0006gx-2b; Tue, 20 Dec 2022 20:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467389.726464; Tue, 20 Dec 2022 20:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jfp-0006dt-Vo; Tue, 20 Dec 2022 20:57:17 +0000
Received: by outflank-mailman (input) for mailman id 467389;
 Tue, 20 Dec 2022 20:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LdMQ=4S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p7jfp-0006ZF-2I
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 20:57:17 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e215c3cd-80a8-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 21:57:15 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id d14so19233910edj.11
 for <xen-devel@lists.xenproject.org>; Tue, 20 Dec 2022 12:57:15 -0800 (PST)
Received: from [192.168.1.93] (adsl-211.109.242.226.tellas.gr.
 [109.242.226.211]) by smtp.gmail.com with ESMTPSA id
 ee8-20020a056402290800b0046fb9492961sm6129041edb.25.2022.12.20.12.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 12:57:14 -0800 (PST)
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
X-Inumbo-ID: e215c3cd-80a8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6lGkkEISwb8toDrrgrNqqLoyu4+uGtYr4EMbvmMfms=;
        b=FwVk7Z8EF8FL1sywjWrbO+RIvuvY9qGD7DeabLZvtIil0xLpapXH3swWvn3FV0EotY
         3Jaxqfo2EK5Na1Hf5O/Po+3Bon8fPeCP8dOHe/UZr/9/xcKBJL4Y0SNDB6Mw/NW/U9nM
         xCL3Cl+VPDbJazAsx2Ny36MzaVTcOlcv7wANioQfmaRrugP7ANSiI0EQXJUMmLu0p3Ru
         Ep8Bjn3doHaZl5X2/XTPf6Y8Jrct8kqTq26jiHZlpyN9cXsQOLIXU//IbWL7mu0NMiS8
         gToHQW7XhZBxf0XkrbEIjyDioo9FhBscpQoTKt1zqCq90RTkgKsNKrTEeJ9APRf9jNY+
         /gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6lGkkEISwb8toDrrgrNqqLoyu4+uGtYr4EMbvmMfms=;
        b=ou2huBTuqBjelBYBzyIUV0sJ46H8hfYl+adR0lTa+rmrv+6O0cQ/lGMufuQWyaLJ3K
         2IcMZChCoFWerT1hjlapTtf6XUjB0HCyJOk6nzANyeAlDPidpC6dOQl8Kfg1kRv1kHeL
         b7YbWCxVaJIqGLKpwcjmo9IU1Nu7i4eIgLFa9WcDm5gWH+NRgXiH3xf3XOor7je+xK8D
         0aIcp2gMow/cXL2KCAJlmC9HMsI4C546loVVkwPMOBJ3ln0/GzuuEEIbi9LXTWW0A2mk
         YH3x40mEZ3fWqhOkLjRMIlF88NWMrdHb5ZUdyxzq6Xnq2PGY1wKGlVQs3VEoaMk8ejo2
         lykA==
X-Gm-Message-State: AFqh2kp2fzut0iK9Zy5lHHI/NpaBHVqFht2xQvUaqr2GWkCe1iyP0SOO
	Zh8n9R1EGzT7zDZgviJ7dsf5aWcCl94=
X-Google-Smtp-Source: AMrXdXsA9P/FEmGorhfqoFSGvYrnxqel/eTEq6W7FBlHCspov5xpxpR1+wx+2ARZB4fDXm6DN2uZgw==
X-Received: by 2002:a50:d71d:0:b0:473:bd4:84ba with SMTP id t29-20020a50d71d000000b004730bd484bamr20837777edi.23.1671569835091;
        Tue, 20 Dec 2022 12:57:15 -0800 (PST)
Message-ID: <5d2e2534-5582-6064-d18a-5900a8cb3d59@gmail.com>
Date: Tue, 20 Dec 2022 22:57:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 1/7] x86/iommu: make AMD-Vi and Intel VT-d support
 configurable
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-2-burzalodowa@gmail.com>
 <09997785-ddb0-c464-331c-618349f418f2@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <09997785-ddb0-c464-331c-618349f418f2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/20/22 19:01, Jan Beulich wrote:
> On 19.12.2022 07:34, Xenia Ragiadakou wrote:
>> Currently, for x86 platforms, Xen does not provide to the users any
>> configuration control over the IOMMU support and can only be built with
>> both AMD and Intel IOMMU drivers enabled.
>> However, there are use cases, e.g in safety-critical systems, that require
>> Xen to be able to be configured to exclude unused code. A smaller tailored
>> configuration would help Xen to meet faster certification requirements for
>> individual platforms.
>>
>> Introduce two new Kconfig options, AMD_IOMMU and INTEL_VTD, to allow code
>> specific to each IOMMU technology to be separated and, when not required,
>> stripped. AMD_IOMMU enables IOMMU support for platforms that implement the
>> AMD I/O Virtualization Technology. INTEL_VTD enables IOMMU support for
>> platforms that implement the Intel Virtualization Technology for Directed I/O.
>>
>> Since no functional change is intended regarding the default configuration
>> of an x86 system, both options depend on x86 and default to 'y'.
> 
> But do things also build successfully when one or both options are disabled?
> I have to say that I would be quite surprised if that worked without further
> adjustments. In which case initially these options want to be prompt-less,
> with the prompts only added once 'n' also works.

Without applying the whole series, disabling any of them or both won't 
work. Ok.

> 
> Jan

-- 
Xenia

