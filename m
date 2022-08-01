Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA6F586831
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 13:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378698.612041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oITi4-0004ZL-B9; Mon, 01 Aug 2022 11:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378698.612041; Mon, 01 Aug 2022 11:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oITi4-0004Xd-8T; Mon, 01 Aug 2022 11:35:44 +0000
Received: by outflank-mailman (input) for mailman id 378698;
 Mon, 01 Aug 2022 11:35:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g61G=YF=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oITi2-0004WE-73
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 11:35:42 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1263c828-118e-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 13:35:41 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id z2so2941427edc.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Aug 2022 04:35:41 -0700 (PDT)
Received: from ?IPV6:2a02:587:ac0b:7a00:1b9e:a344:414e:dad7?
 ([2a02:587:ac0b:7a00:1b9e:a344:414e:dad7])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a056402054d00b0043ca6fb7e7dsm6612759edx.68.2022.08.01.04.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 04:35:40 -0700 (PDT)
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
X-Inumbo-ID: 1263c828-118e-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3OxEmP4pif/UDPsw5ZgOZ1hygd43885xdsCWShnzaRM=;
        b=Tz0ZVD+9VUtDuERfrwiBex36II2XjAUFCpduePEv27GTGwyYXhnko2Nvs5jdn71jOY
         o5GrjIGq9ggUyvOPrjSPXq8Cb/lZjyALKEQvM0Olvabd4Y5JvHaR2mpY/VwNgsAKUFEl
         o8sJh2WYq13biOz2HC7e+OzoHdXmvsMTHCbWmKlUNMKYuHKEDeGCxGbyVsgQC8RHUkCl
         Qr84tL454I/iJgDExbwugmZYURzlat8YlEWgqgKT7ZGgGpULpGenunMsNeBeGZeVoIJ9
         BZiPPQxyYklNTfL/gYIqLGAtoPlSrXvg8XbV4Q7CUnWLGF3o0OEeBQekyuoLEsS3F6bh
         2z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3OxEmP4pif/UDPsw5ZgOZ1hygd43885xdsCWShnzaRM=;
        b=FQZWEHgBeySaocPPrvm+JVOLyP8GtjgaSBFE1aB0Gw+CunZm0gKwVG8pv2pUqwqXLU
         IxUDCL1wnZidLAQR+iuIvLe2d1ukBohgZYae4ec1h61WCFqGSdFsm8gyMrDupC6aI9go
         IydeYEgtaNyf5DEvoDrXBp4wUWs4QiCc14CCDt39TWo3MTG3gtUWBBHuoXxsseF9SE4S
         RO6S1lfO0xjzmVxXRGqQnmPHlImItT8wykmAv1N6bHwlbGwRVmXysGHc77m2hjfS2phx
         1bv5oDYiB9AsV+WwWnJ262AjmYBiw0zQCK68HbOZZWl1a680tjo3mFsEpvvoYUM5muqT
         Rj7Q==
X-Gm-Message-State: AJIora+sF/GtXXwOuxLO+g6ujPcDLp3immcGeYnvgXboHdv8tG9kam1S
	IszMDcz2YWaOjWa4TxZXM/I=
X-Google-Smtp-Source: AGRyM1tTdZcY5g3kvexWwQWbSO+VlGccZCMyqU1JMNmmlEXjNqFP6fM9KfxHFo2Mve2U4jOmwRyqDQ==
X-Received: by 2002:a05:6402:d0a:b0:437:66ca:c211 with SMTP id eb10-20020a0564020d0a00b0043766cac211mr15723076edb.29.1659353740722;
        Mon, 01 Aug 2022 04:35:40 -0700 (PDT)
Message-ID: <4ed521d2-c3f7-c478-f9dd-e00aa3a425a4@gmail.com>
Date: Mon, 1 Aug 2022 14:35:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm64: efibind: fix MISRA C 2012 Directive 4.10
 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220801104311.1634742-1-burzalodowa@gmail.com>
 <4e717a7c-f5b8-74e3-e830-a75c9b5b211b@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <4e717a7c-f5b8-74e3-e830-a75c9b5b211b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/1/22 14:02, Jan Beulich wrote:
> On 01.08.2022 12:43, Xenia Ragiadakou wrote:
>> Prevent header file from being included more than once by adding ifndef guard.
> 
> If such a change is to be made, please also adjust the x86-64 instance of
> the header.
> 
> However, these headers are inherited from the gnu-efi package, and hence
> should see as little customization as possible (you may have noticed
> that we didn't even correct the bogus "Module Name:" value in the x86-64
> header). While for this particular change I'm not outright opposed, such
> an exception to the usual handling would want recording in the
> description. Actually - at least the x86-64 header has meanwhile gained
> a guard in gnu-efi, so that one likely will want importing instead of
> adding a custom one. (I'm looking only at 3.0.14, which I have readily
> available - there may be a guard even for aarch64 in an up-to-date
> version, so please double check.)
> 

Ok, this makes sense.
The gnu-efi header for x86_64 is guarded with X86_64_EFI_BIND. For 
arm64, efibind header does not have ifndef guard (3.0.14 is the latest tag).
So, I will put X86_64_EFI_BIND and AARCH64_EFI_BIND, in the same way as 
it is done in gnu-efi (that is without following empty line and without 
comment following endif).

-- 
Xenia

