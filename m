Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D906527DB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 21:28:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467352.726409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jDS-00012k-Nw; Tue, 20 Dec 2022 20:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467352.726409; Tue, 20 Dec 2022 20:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jDS-00010h-Kl; Tue, 20 Dec 2022 20:27:58 +0000
Received: by outflank-mailman (input) for mailman id 467352;
 Tue, 20 Dec 2022 20:27:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LdMQ=4S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p7jDR-0000yx-3L
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 20:27:57 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c97e0094-80a4-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 21:27:56 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id u19so31985406ejm.8
 for <xen-devel@lists.xenproject.org>; Tue, 20 Dec 2022 12:27:56 -0800 (PST)
Received: from [192.168.1.93] (adsl-211.109.242.226.tellas.gr.
 [109.242.226.211]) by smtp.gmail.com with ESMTPSA id
 g17-20020a17090604d100b007c0f5d6f754sm6117593eja.79.2022.12.20.12.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 12:27:55 -0800 (PST)
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
X-Inumbo-ID: c97e0094-80a4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BRGzXTbyDFiqOpSxpiONb8b1lMKJfDQswXioRfIVaes=;
        b=IZFQtl3SI50pNij8f7CAIHOeeD0stSgPkdUfjSxa2Kxmcv4L7QkSTHSAbkMKwUXPc4
         X8t28jEI/tHsrdjhKv6IcuW4RTx4p8gb49/NpflFzhh/XJtn5jMa6WFHrnmu/MubaIqM
         LDIhxHkCNm3LYGFMFqm7pqK4E3+azGhOIj/z6jvz6oNlnz8seA4zu8YzrUU5Nr/kVnVu
         2E6nObA0YXh90K/hxu/f1io8PWxvELHHx8QFWwjF3ij/bnrlEtE/DL+N0WfTD2QcskkL
         v4u3u5Lf6yRyl8PQyeZawtbv2J7wq7UoId5EC0Kv7UTNt7/f5AY+1DWeejXA4vsDA6wX
         UsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRGzXTbyDFiqOpSxpiONb8b1lMKJfDQswXioRfIVaes=;
        b=6vh7cPbD+gCp9KGAsuJVljiaQxQZMZLgpYhxdUFtqkk1Vuh5GzkBfCRi5JXuC+/hSA
         3Ln2PkoXyoqTiyWgx3rY4Gpmkq0Tc5jV95XJPEQyYNELhY+KcrqtW3/4ytqq5nlyWczh
         21Jhs5I0J/1tt2zkaLAqqIm+9ucuc2vpdoi1sI4vC79CpNhwgiY43xPgo2CvuPYnJCSV
         zdW8KmFcLiTrBEqnOIQvIN9r5VFfJZdWKq8bnyw/HuMgQD5fGzhRldPT5MXAaSoEcaPQ
         Nk7pQI2XFk5TMIqoYMauLiOR9jRD+cEnJ7Ve1RhuamFihkLVeXrM8XvTtr6/fv3ZEYSd
         ce3g==
X-Gm-Message-State: AFqh2kp5BUAiNt1tJ/tauPNN6Yewn/OdMiVi47mGSpx/+ahgLDcUlxsq
	NdS01j/ncOMnvvXZh1OeQUJxQO7vssA=
X-Google-Smtp-Source: AMrXdXtE3avQc6Ybm+6IKG8+Vmw5XpLRU01qI8goj0/ejQRUFCkAK4O7OTzWUSIP4Q+WE5azy56dbQ==
X-Received: by 2002:a17:906:3bc2:b0:7fd:ecee:c8ba with SMTP id v2-20020a1709063bc200b007fdeceec8bamr14975009ejf.42.1671568075485;
        Tue, 20 Dec 2022 12:27:55 -0800 (PST)
Message-ID: <15c3c5bd-6229-d070-ebe0-ce4c6d827f1b@gmail.com>
Date: Tue, 20 Dec 2022 22:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 0/7] Proposal to make x86 IOMMU driver support configurable
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <4b45cde3-52e1-15ae-7b6a-84c0d5141cc9@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <4b45cde3-52e1-15ae-7b6a-84c0d5141cc9@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 12/19/22 20:28, Andrew Cooper wrote:
> On 19/12/2022 6:34 am, Xenia Ragiadakou wrote:
>> This series aims to provide a means to render the iommu driver support for x86
>> configurable. Currently, irrespectively of the target platform, both AMD and
>> Intel iommu drivers are built. This is the case because the existent Kconfig
>> infrastructure does not provide any facilities for finer-grained configuration.
>>
>> The series adds two new Kconfig options, AMD_IOMMU and INTEL_VTD, that can be
>> used to generate a tailored iommu configuration for a given platform.
>>
>> This series will be part of a broader effort to separate platform specific
>> code and it is sent as an RFC to gather feedback regarding the way the
>> separation should be performed.
> 
> Hello,
> 
> Thanks for the series.
> 
>  From discussions in the past, we do want CONFIG_INTEL/AMD/etc and we do
> want these to be selectable and available for randconfig to test.
> 
> Some sub-features are more complicated, because e.g. Centaur have CPUs
> with a VT-x implementation.  This will need expressing in whatever
> Kconfig scheme we end up with.
> 

What about having configuration per cpu vendor, per virtualization 
technology and per IOMMU technology? I mean sth like [CPU_AMD, 
CPU_HYGON, CPU_INTEL, CPU_SHANGHAI, CPU_CENTAUR], [AMD_SVM, INTEL_VMX] 
and [AMD_IOMMU, INTEL_IOMMU], respectively?

> IOMMUs are more tricky still.  They are (for most intents and purposes)
> mandatory on systems with >254 CPUs.  We could in principle start
> supporting asymmetric IRQ routing on large systems, but Xen doesn't
> currently and it would be a lot work that's definitely not high on the
> priority list.  At a minimum, this will need expressing in the Kconfig
> help text.
>

Ok.

> We need to decide whether it is sensible to allow users to turn off
> IOMMU support.  It probably is, because you could trivially do this by
> selecting CONFIG_INTEL only, and booting the result on an AMD system.
> 

I cannot understand. I guess that if the code for the target system is 
disabled, Xen won't boot ... hopefully :).

If users are not allowed to turn off the IOMMU support, it can be always 
enabled unconditionally via Kconfig select based on the virtualization 
technology or other.

> 
> For the names, I don't think AMD_IOMMU vs INTEL_VTD is a sensible.
> Probably wants to be INTEL_IOMMU to match.
> 

Ok.

> ~Andrew

-- 
Xenia

