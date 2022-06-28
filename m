Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F90E55BEBC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 08:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356973.585355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o64h5-0000Rr-36; Tue, 28 Jun 2022 06:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356973.585355; Tue, 28 Jun 2022 06:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o64h5-0000Om-03; Tue, 28 Jun 2022 06:27:27 +0000
Received: by outflank-mailman (input) for mailman id 356973;
 Tue, 28 Jun 2022 06:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VwHr=XD=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o64h3-0000Ob-A5
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 06:27:25 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f39d8c4-f6ab-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 08:27:24 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id o4so12149565wrh.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jun 2022 23:27:24 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a5d6350000000b0021b8905e797sm12381193wrw.69.2022.06.27.23.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 23:27:23 -0700 (PDT)
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
X-Inumbo-ID: 5f39d8c4-f6ab-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fkdfoOl2U+ksDRlxAGj37ooDJZJBKaU2UDmKNiHUqAA=;
        b=L+4xl1muWVXTAdaCLKii9FKdBTvoMN6x7C0DQjwRqSinTfPepvBpeDMJE2YU8G63Vg
         t8BoVUp9WRFt5CQGJ/vKNn8fIod/ZE3Fb6QaresmrqEF7t9PFmJ0POEc51WeHMlk8Zbl
         bMNAPvNwAJFQA8j3NvKp0dtVsBCABpvFt6wo/ek9mrT8AU25mNjrUF5++B6/7BRByK3b
         8SZzOmP0M0chB2lG6HE2hsCFwj8Pn2a+cGSXp5zU2HnLgMS6WIzdJlzGwbV9Wz5DO5MD
         CUJ30jD3UQKY4jjvKL59UoKBB0hYbMviVdQ1kh84/nmYw698z1WYZv9dTWk8mjN5LJNr
         mmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fkdfoOl2U+ksDRlxAGj37ooDJZJBKaU2UDmKNiHUqAA=;
        b=4NDG0XvcmwMe28G7EP5pLYNMbtCcy7kKJR6JVtcviDSEDTVJSzUVKPtME+ZUkihPT5
         XSWFfau0ED9u3UPPVboZvonru1hMLqdBg5WWx04+x203WpawQUNzERIFinOp74OdRTjz
         9q7c2fntJZFPSGCz4qN5/3GoafuEtUzPHyIdM/Gsga0x1TRRCejfLNEZKiR0nfssBFR4
         uekbJhYogchoVVmN4LuABVA8HkMCbvA0hjKf9TvrBVRAVpoTdo08EvMWFRCgIY2VB5cw
         mxVOTtxtkhCVTRT27Ex4r1MFIJWZDGMCVCyHNvEavUgUNnVnEzKO1Qrqodx5qNibDcw2
         96Pw==
X-Gm-Message-State: AJIora8+++j6f8QHO/mS4sdtv2xD8jJxUfjHUYaVDvT+f3LX1lS6ABmy
	Fv+0ZCM/R9WU6fqrh6xn/RE=
X-Google-Smtp-Source: AGRyM1sr7Uhz5fberXugJbrfigFE4tpnmrbd7LZMdAQLw+O01vdC+JvGSroilCZgnffEq6RfTUzryw==
X-Received: by 2002:a5d:604a:0:b0:21b:9517:66eb with SMTP id j10-20020a5d604a000000b0021b951766ebmr15750413wrt.494.1656397643446;
        Mon, 27 Jun 2022 23:27:23 -0700 (PDT)
Message-ID: <5495bb68-6e83-a64f-7d55-d2d973733e18@gmail.com>
Date: Tue, 28 Jun 2022 09:27:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/5] xen/common: vm_event: Fix MISRA C 2012 Rule 8.7
 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20220626211131.678995-1-burzalodowa@gmail.com>
 <20220626211131.678995-3-burzalodowa@gmail.com>
 <61094b37-4075-e362-7fc6-ce28f965bb05@suse.com>
 <cb50eba7-bbc5-3100-2be3-98587766c240@gmail.com>
 <a5e958aa-a616-115e-29e2-fe410b708583@suse.com>
From: xenia <burzalodowa@gmail.com>
In-Reply-To: <a5e958aa-a616-115e-29e2-fe410b708583@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 6/27/22 11:43, Jan Beulich wrote:
> On 27.06.2022 09:54, xenia wrote:
>> On 6/27/22 10:11, Jan Beulich wrote:
>>> On 26.06.2022 23:11, Xenia Ragiadakou wrote:
>>>> The function vm_event_wake() is referenced only in vm_event.c.
>>>> Change the linkage of the function from external to internal by adding
>>>> the storage-class specifier static to the function definition.
>>>>
>>>> This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.
>>> Actually also for patch 1 - this is slightly confusing, as the title
>>> talks about 8.7. At first I suspected a typo. May I suggest to add
>>> "also" (which I think could be easily done while committing)?
>>
>> This is actually a violation of MISRA C 2012 Rule 8.7 (Advisory), which
>> states that functions referenced in only one translation unit should not
>> be defined with external linkage.
>> This violation triggers a MISRA C 2012 Rule 8.4 violation warning,
>> because the function is defined with external linkage without a visible
>> declaration at the point of definition.
>> I thought that this does not make it a violation of MISRA C 2012 Rule 8.4.
> I think this is a violation of both rules. It would be a violation of
> only 8.7 if the function had a declaration, but still wasn't used
> outside its defining CU.

So you are suggesting to change the line
"This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation 
warning."
to
"Also, this patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 
violation warning."

I will wait one more day in case there is some input for the last patch, 
and I will send a v2 with the above changed.

Xenia


