Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02354949470
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 17:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772927.1183369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbM32-0002ow-GO; Tue, 06 Aug 2024 15:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772927.1183369; Tue, 06 Aug 2024 15:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbM32-0002nF-Dr; Tue, 06 Aug 2024 15:24:28 +0000
Received: by outflank-mailman (input) for mailman id 772927;
 Tue, 06 Aug 2024 15:24:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ByCl=PF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sbM30-0002n4-Lx
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 15:24:26 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f62a882d-5407-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 17:24:24 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so98061066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 08:24:24 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e80dedsm553942266b.163.2024.08.06.08.24.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 08:24:23 -0700 (PDT)
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
X-Inumbo-ID: f62a882d-5407-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722957864; x=1723562664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8fVgVKNyjP6ucB/6jAVB83Nmvj5lW4cVibaIAlraYw4=;
        b=NSIFjABlXQtJVxhUrNFLcChpTYIpbYWt7Mw5A27izUwkacaMaNho7Vr0ogc83k0k1Z
         VIe4VCQ3Wex7GedjPnH/41wRDbHWnpOrtjAI2R83l8uTYp4tz3YWeecnxhfXaKOF3KU+
         Xny+NGW0/YDlsNJYuN0JUISTBwDQEEX+I/aggbOYJyaJUCMSkKuwRsQcGtoxRvZ68Nyt
         CyDn1x4Tvi3UrNzfXUtS3Yp1mo7zNgmIiD833pwkZwRXK3xeAlXGHw4114e6SPMl4d0T
         3gRF0w5u/27ZkrnBqVEGZjAlUhH4/CvLXYqIJ9nNjzLGgpyo+AIZee5L7P0MDGPgF0EP
         xjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722957864; x=1723562664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8fVgVKNyjP6ucB/6jAVB83Nmvj5lW4cVibaIAlraYw4=;
        b=sqGa3Ofjc2qmQI+xqIW5gHQ/0DxCneiDb2mlHLllyn4qJbTsxu60G6v/sgLl5ysUmq
         LKEc6DsqH7eXrHCkT3jPRtAFTF6l507Yu6qzMvSCOEgNFyZC4EU2Y1e2YBNa0tOmr6b3
         cBGivkE3JHF5oxqDyGl5blWLXFXHoErX9YyIMNPSSrj+9yxNvT96azmDgqtVapmDr2+T
         gH+l2i/G9+RM14gCuqHzeve35W+v5Qiy25Eay/6eAgFc6qWVqOBLA6PyZLp5jXIEMDt7
         HWBLaMpktfD9gB3kRvX0o9AZiXCXqA66aQQ2exjQ1MWJzi1FleCNK2Q7JD15io0GLuWv
         gO6w==
X-Forwarded-Encrypted: i=1; AJvYcCVbz4LP6TrGYubbInMcboCs6dUNAoUD+fVcSF6wZWMnd3l7DXrhvpT4/xCqmGMHYgBV0/HkejPpDtWXkE4yHXW+GB5Gq1jCJas8fRDPuLU=
X-Gm-Message-State: AOJu0Yy7iOrHypN/nMo29TEmrg4Fclbcq1qs9/XWuajfoJshuiXoKQpx
	jxJsNl8a+2cgRsaj6WYTm2FYWPhDXAh3IIaVrUUwfMR7eNneqFI5ipb6s8SSe8k=
X-Google-Smtp-Source: AGHT+IG6CkAQJrVVcOBqPo1YEFchqnFPHpxjVe+Ghf1HBvcIoezK0khlJM5185SUM09nf1JaKLT86A==
X-Received: by 2002:a17:907:3e84:b0:a6f:5150:b807 with SMTP id a640c23a62f3a-a7dc4fcc3a6mr1144017466b.35.1722957863768;
        Tue, 06 Aug 2024 08:24:23 -0700 (PDT)
Message-ID: <1dc37ba4-c0ef-4be7-9699-31cf839c6deb@suse.com>
Date: Tue, 6 Aug 2024 17:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a5a8a016-2107-46fb-896b-2baaf66566d4@suse.com>
 <ZnBCFgHltVqj2FDh@mail-itl> <6a7508dd-9f81-4fce-9c83-8b4fae924d48@suse.com>
 <ZrI_YSBSiC7w5iP6@mail-itl>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <ZrI_YSBSiC7w5iP6@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06.08.24 17:21, Marek Marczykowski-Górecki wrote:
> On Tue, Aug 06, 2024 at 04:12:32PM +0200, Jürgen Groß wrote:
>> Marek,
>>
>> On 17.06.24 16:03, Marek Marczykowski-Górecki wrote:
>>> On Mon, Jun 17, 2024 at 01:22:37PM +0200, Jan Beulich wrote:
>>>> Hello,
>>>>
>>>> while it feels like we had a similar situation before, I can't seem to be
>>>> able to find traces thereof, or associated (Linux) commits.
>>>
>>> Is it some AMD Threadripper system by a chance? Previous thread on this
>>> issue:
>>> https://lore.kernel.org/xen-devel/CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com/
>>>
>>>> With
>>>>
>>>> (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4000000
>>>> ...
>>>> (XEN)  Dom0 alloc.:   0000000440000000->0000000448000000 (619175 pages to be allocated)
>>>> ...
>>>> (XEN)  Loaded kernel: ffffffff81000000->ffffffff84000000
>>>>
>>>> the kernel occupies the space from 16Mb to 64Mb in the initial allocation.
>>>> Page tables come (almost) directly above:
>>>>
>>>> (XEN)  Page tables:   ffffffff84001000->ffffffff84026000
>>>>
>>>> I.e. they're just above the 64Mb boundary. Yet sadly in the host E820 map
>>>> there is
>>>>
>>>> (XEN)  [0000000004000000, 0000000004009fff] (ACPI NVS)
>>>>
>>>> i.e. a non-RAM range starting at 64Mb. The kernel (currently) won't tolerate
>>>> such an overlap (also if it was overlapping the kernel image, e.g. if on the
>>>> machine in question s sufficiently much larger kernel was used). Yet with its
>>>> fundamental goal of making its E820 match the host one I'm also in trouble
>>>> thinking of possible solutions / workarounds. I certainly do not see Xen
>>>> trying to cover for this, as the E820 map re-arrangement is purely a kernel
>>>> side decision (forward ported kernels got away without, and what e.g. the
>>>> BSDs do is entirely unknown to me).
>>>
>>> In Qubes we have worked around the issue by moving the kernel lower
>>> (CONFIG_PHYSICAL_START=0x200000):
>>> https://github.com/QubesOS/qubes-linux-kernel/commit/3e8be4ac1682370977d4d0dc1d782c428d860282
>>>
>>> Far from ideal, but gets it bootable...
>>>
>>
>> could you test the attached kernel patches? They should fix the issue without
>> having to modify CONFIG_PHYSICAL_START.
>>
>> I have tested them to boot up without problem on my test system, but I don't
>> have access to a system showing the E820 map conflict you are seeing.
>>
>> The patches have been developed against kernel 6.11-rc2, but I think they
>> should apply to a 6.10 and maybe even an older kernel.
> 
> Sure, but tomorrow-ish.

Thanks.

> 
>> If possible it would be nice to verify suspend to disk still working, as
>> the kernel will need to access the ACPI NVS area in this case.
> 
> That might be harder, as Qubes OS doesn't support suspend to disk, but
> I'll see if something can be done.

Thinking about it - can this ever work with Xen?


Juergen


