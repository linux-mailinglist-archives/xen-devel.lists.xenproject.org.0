Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE7F8D1B66
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 14:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731124.1136460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBw3o-0000G5-1M; Tue, 28 May 2024 12:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731124.1136460; Tue, 28 May 2024 12:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBw3n-0000EF-V1; Tue, 28 May 2024 12:36:11 +0000
Received: by outflank-mailman (input) for mailman id 731124;
 Tue, 28 May 2024 12:36:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/BF=M7=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sBw3m-0000E9-VA
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 12:36:11 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbd1ccb1-1cee-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 14:36:08 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a635c83bb7eso3372766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 05:36:08 -0700 (PDT)
Received: from [10.80.5.21] ([160.101.139.1]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579ce607407sm3488800a12.74.2024.05.28.05.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 05:36:07 -0700 (PDT)
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
X-Inumbo-ID: dbd1ccb1-1cee-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716899768; x=1717504568; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bq2xCfVw6p5MkufH5QCKHLXDWhQgnTKEifRaEzGjd+U=;
        b=WEJuIEfPIQyGAfCG/SKPEzV2wBe1TWw3iYyiLPFaMxgDve86Hb4KCFv5WvtzTri2RC
         CkYBDSkaQrqnraR1xw1UhJLjKtzJpMqpngn3F4fn1Nlvimeb8sAzGIwaVdUr2oEv7x4U
         S6CsX+CivXhtij9jnWkYZ+yBvnvDJc+ME1wLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716899768; x=1717504568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bq2xCfVw6p5MkufH5QCKHLXDWhQgnTKEifRaEzGjd+U=;
        b=aqqTrZSIxQmO7YoodWXLA3CTY0XjLhf05l1cLWSdWttMR9qAxa3SrJ2C0MyPLAQN1N
         /OgvaMrVMB3JCcCA30nDab+wfqFV2aGWKVevnqVnwr5cTdlfKU+o6Tdjt5+ZYrrF6kOB
         JAh4+OrV0oWCOT3Qk/oHZ0apyZ08+5SRLpYKv6VN9dHlsCciuLyxznF60/5wAB4RIlQR
         t6k0ErXvnekrmTXe7MZMd+ZNuu08FJuf/QEidlH68lqNNoytT/rVb0ME/Kzk+NDrl8O2
         Fc5IJxalh74uxRB0b+y8D/HymXeIM0CBSYvQRtvYm3WxzzU3sjjFKcEm6yiHTZxOGtS3
         wFSg==
X-Gm-Message-State: AOJu0YyvC3a6Evug3eb22dCELgvdAAyN74kQM1uJkBDXV+bt7l1q7OdE
	IBDNa+ukE0oq6eKAZdMnFqAOHSxdAFIzDmeHaGW0ZpHBCX5nj5MXiB9jGrEuOck=
X-Google-Smtp-Source: AGHT+IFrq3xdKGuEDVBdSdV7rVEmUbzAGB9Pipyt0H/i1u8+jBVEC0GA1YGhQ+wI9RUrZOlmS3CVBA==
X-Received: by 2002:a50:c052:0:b0:578:649c:f7f0 with SMTP id 4fb4d7f45d1cf-578649cf802mr9090049a12.0.1716899768273;
        Tue, 28 May 2024 05:36:08 -0700 (PDT)
Message-ID: <97f7caeb-85e8-488b-b763-9860720f02cb@cloud.com>
Date: Tue, 28 May 2024 13:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <b2d4109cd30c82e0af153d36f8dce77c59f03695.1715102098.git.alejandro.vallejo@cloud.com>
 <ZlA_6Abtw-u4a84J@macbook> <8cac1707-855b-478a-b88d-7fd619f19352@cloud.com>
 <ZlRJtN7h32uOHEOi@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <ZlRJtN7h32uOHEOi@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2024 09:52, Roger Pau Monné wrote:
>> My intent here was to prevent the compiler omitting the write (though in
>> practice it didn't). I think the barrier is still required to prevent
>> reordering according to the spec.
> 
> Yes, my understating is that you added the ACCESS_ONCE() to possibly
> prevent the compiler from re-ordering the CPU_TO_X2APICID[ap_cpuid]) =
> read_apic_id() after the 'hlt' loop?

Yes, but not only that. Also preventing the compiler from eliding the
write altogether on the basis that it's not read after within the
function. I have suffered that particular behaviour on older versions of
GCC and it stung very much.

> 
> AFAICT the expressions in the `for` statement are considered sequence
> points, and the calling `read_apic_id()` could have side-effects, so
> the compiler won't be able to elide or move the setting of
> CPU_TO_X2APICID[] due to all side-effects of previous evaluations must
> be complete at sequence points.
> > I'm fine with leaving the wmb() + ACCESS_ONCE().
> 
> Thanks, Roger.

Cheers,
Alejandro

