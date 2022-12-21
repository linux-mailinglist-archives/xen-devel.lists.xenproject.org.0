Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B102653010
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 12:13:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467809.726859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7x27-0004QZ-Up; Wed, 21 Dec 2022 11:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467809.726859; Wed, 21 Dec 2022 11:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7x27-0004OI-Rl; Wed, 21 Dec 2022 11:13:11 +0000
Received: by outflank-mailman (input) for mailman id 467809;
 Wed, 21 Dec 2022 11:13:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eskD=4T=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p7x26-0004OA-5Y
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 11:13:10 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 733069a6-8120-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 12:13:09 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id d20so21591155edn.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Dec 2022 03:13:09 -0800 (PST)
Received: from [192.168.1.93] (adsl-43.109.242.137.tellas.gr. [109.242.137.43])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a05640217c200b004615e1bbaf4sm6906225edy.87.2022.12.21.03.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 03:13:08 -0800 (PST)
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
X-Inumbo-ID: 733069a6-8120-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZTottXbuBRQRn2JFle5OtEqEzV8iy+IZc9nH5vfma8=;
        b=Tugr9ncYHIKcrTpRpoVHskub/r4x0R9hoiHEQRJylkqgxYlavKQLvFhngALT0Z8mlR
         ZctuiC8SS7PLauBUSamW/AsbG4rCwHo1EMWmBngXAkajCDNuBZIZiYLMaYCKga4dRSZB
         S7j73k+RujMVdRT6Urx9pTksCRpB/iwGpZcrSM6FntNfF1pzqVaknhL+EEkR9fjGFKKv
         gIKUrOkCTvSCpcRKNKEPehmX/fedkj9OU+fPgtLLnaA/RvgOaZqqGGK5Np32imIiaM4B
         cCFZWiTrLioCCxeNbbFtlEGHDYeumZupt9LNqjBYwZp4BW4nSZUtzBxd7SgcoyZtbG1D
         NWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZTottXbuBRQRn2JFle5OtEqEzV8iy+IZc9nH5vfma8=;
        b=0jJx9kSDH57tZIcY8uexF6eTAqhWlMlYgfd2EK5I391N/3UChl9ucbgcYCcQGIPcys
         L2E5aNbmSe1lVfaqFOhRnBhqZSWpmPO/5qJRSiKODig1qN1fMgHhM4Iwq0XXwcDy02lY
         U3addkpiaPvI5M7+chfE2x9w63+7je6IsRF5krNxcVYI/0SAzeeIei26PpfKRFrFz9+0
         lu1ap90saYM4IFNUx4Ujc0HCoGiNX+XkxEEzAJL8tqfzGKeHAzhjLj+l23vdbc9172zp
         kqzvIfbm1ZkYgr024HzvI+YyHEBrGE5N0jhGo4cP8fBTt0WpjMhJiR614KgM9LGQHZkm
         kTsw==
X-Gm-Message-State: AFqh2koa521uf1AEW2nX5dp7R6MVVfOZMoUDGIz79IvWSjZQ+xSZ/if7
	I363i1K5g+ecC/erkNv4ysE=
X-Google-Smtp-Source: AMrXdXvjnhTBRDCR7ecHdV2yX5GwhXFIFzDIaqbmnCFHEm1OL+2/EOGYevzbCzb70QjmJYXyKn1u5Q==
X-Received: by 2002:a05:6402:38d:b0:46f:b2df:4e0b with SMTP id o13-20020a056402038d00b0046fb2df4e0bmr1111687edv.14.1671621188665;
        Wed, 21 Dec 2022 03:13:08 -0800 (PST)
Message-ID: <e3d3a49a-0ca6-6b99-985f-15511070f251@gmail.com>
Date: Wed, 21 Dec 2022 13:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 7/7] x86/dpci: move hvm_dpci_isairq_eoi() to generic HVM
 code
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-8-burzalodowa@gmail.com>
 <f9d36ae1-2363-1276-2747-737823d2f51b@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <f9d36ae1-2363-1276-2747-737823d2f51b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/21/22 12:19, Jan Beulich wrote:
> On 19.12.2022 07:34, Xenia Ragiadakou wrote:
>> The function hvm_dpci_isairq_eoi() has no dependencies on VT-d driver code
>> and can be moved from xen/drivers/passthrough/vtd/x86/hvm.c to
>> xen/drivers/passthrough/x86/hvm.c.
>>
>> Remove the now empty xen/drivers/passthrough/vtd/x86/hvm.c.
>>
>> Since the funcion is hvm specific, move its declaration from xen/iommu.h
>> to asm/hvm/io.h.
> 
> While everything else looks good here, I question this part: The function
> is both HVM- and IOMMU-specific. However, by moving the definition ...
> 
>> No functional change intended.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>>
>> I was not sure how to handle the copyright. I assume that I have to
>> retain the copyright of Weidong Han <weidong.han@intel.com>, right?
>>
>>   xen/arch/x86/include/asm/hvm/io.h        |  1 +
>>   xen/drivers/passthrough/vtd/x86/Makefile |  1 -
>>   xen/drivers/passthrough/vtd/x86/hvm.c    | 64 ------------------------
>>   xen/drivers/passthrough/x86/hvm.c        | 42 ++++++++++++++++
> 
> ... here, you don't need a declaration anymore anyway - the function can
> simply become static then, as its only caller lives in this very file.

I will change it to static.

Regarding the copyright, shall I add the copyright of Weidong Han 
<weidong.han@intel.com>, that was in the deleted file?

> 
> Jan

-- 
Xenia

