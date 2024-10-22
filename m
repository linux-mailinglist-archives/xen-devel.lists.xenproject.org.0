Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459EC9AA31F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 15:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824186.1238271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Ewe-0001ou-AF; Tue, 22 Oct 2024 13:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824186.1238271; Tue, 22 Oct 2024 13:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Ewe-0001mc-7Q; Tue, 22 Oct 2024 13:29:08 +0000
Received: by outflank-mailman (input) for mailman id 824186;
 Tue, 22 Oct 2024 13:29:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjUh=RS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3Ewc-0001mW-Je
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 13:29:06 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c1d1799-9079-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 15:29:05 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2fb5014e2daso57732761fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 06:29:05 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c7255esm3281528a12.80.2024.10.22.06.29.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 06:29:04 -0700 (PDT)
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
X-Inumbo-ID: 9c1d1799-9079-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729603745; x=1730208545; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3qEjVOX60+qJdBYtTWZetjJLLNq1d52To7SjHZciXwM=;
        b=pk7Vs6Gt72duLdlaPIJ+Imvb/7Lujhp64pc1cNXJtSfYVnDA8rJjDd2f/o0iTjZpBL
         xOvIisRa9t42CoXIP3YGvfpSTjyptmoELqnxGTMz5I3AaB4qUWgj0+Uy9DIF+8Jsa42l
         F47BK1tabYJ8ETT7WHhLqLYSE4+asbpvMGa90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729603745; x=1730208545;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qEjVOX60+qJdBYtTWZetjJLLNq1d52To7SjHZciXwM=;
        b=bCW95XctiKYKLQRsy8C0X0QlhdfO4GWRZtkWZu/NT+0nYce1uYy2NNiukWxR0vxM3Y
         GEbT9MX8R1P+p0oVRh6zChs1NmUkmNHW5iwEyKSCmKPWTPnmHTRFbWS9R1M5utDQHZ+H
         +O9Sn6Q/8/wx5QeSywn0H31FEGI9Remyk1Go5WahOZ0KJ9RPsAuLXXP0uLDohTA9VEC2
         VOvE3SKGnoWa2ot3p26JOXDQvYqySLLOFAZqPRpyJg2vNjrlRtq5tSszTjbz8avQmatn
         sQ/e/qlGMU4q40efOamNn3CA7u4mabGXqq/Ms4vg7H6Lv59unSNScWJn7WMNuMeDIgrt
         eXMA==
X-Forwarded-Encrypted: i=1; AJvYcCUY0dN84Ou5ztHX5+wrtfYcaltV2DndOhZaPkSmbUTGd3ewzYt2rpKtItUim6aCPr/+XtT9upXBZPc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeEMooaFZSDaIFE33SqUWom+IHMNDppXNB6ptM+SePfzI5G3cV
	eKK6I/Yt9RIXYBUDTcXvEupOdcLCX11FvBflCR5QcllAZUaSAorSyQc9epXQN1o=
X-Google-Smtp-Source: AGHT+IFLxb3qDi7JW2nj71xqVNk7OWKa3y+z6BtdcDAeFVYFOMKMkrC5Gbqd8LmLuMqxOTOSgq7/6Q==
X-Received: by 2002:a05:651c:551:b0:2fa:d4ef:f222 with SMTP id 38308e7fff4ca-2fb8320b662mr62505251fa.38.1729603745090;
        Tue, 22 Oct 2024 06:29:05 -0700 (PDT)
Message-ID: <a06b93a8-0660-4396-a248-d194c844fd30@citrix.com>
Date: Tue, 22 Oct 2024 14:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/38] x86/boot: convert consider_modules to struct
 boot_module
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
 <20241021004613.18793-3-dpsmith@apertussolutions.com>
 <c57b3cb6-0a3d-4930-8acd-e8bc03dc2a53@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c57b3cb6-0a3d-4930-8acd-e8bc03dc2a53@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 10:53 am, Andrew Cooper wrote:
> On 21/10/2024 1:45 am, Daniel P. Smith wrote:
>> To start transitioning consider_modules() over to struct boot_module, begin
>> with taking the array of struct boot_modules but use the temporary struct
>> element mod.
>>
>> No functional change intended.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> I've taken patch 1 (currently in testing to push).
>
> However, this change breaks PV Shim (same test case that I debugged the
> OSSTest failure with on Saturday).
>
> (XEN) PVH start info: (pa 0000ffc0)
> (XEN)   version:    1
> (XEN)   flags:      0
> (XEN)   nr_modules: 2
> (XEN)   modlist_pa: 000000000000ff60
> (XEN)   cmdline_pa: 000000000000ffa0
> (XEN)   cmdline:    'pv-shim console=xen,pv'
> (XEN)   rsdp_pa:    00000000fc008000
> (XEN)     mod[0].pa:         0000000001042000
> (XEN)     mod[0].size:       0000000006907440
> (XEN)     mod[0].cmdline_pa: 0000000000000000
> (XEN)     mod[1].pa:         00000000016d9000
> (XEN)     mod[1].size:       0000000019870751
> (XEN)     mod[1].cmdline_pa: 0000000000000000
> (XEN) Bootloader: PVH Directboot
> (XEN) Command line: pv-shim console=xen,pv
> (XEN) Xen image load base address: 0
> ...
> (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d040a51d38>]
> arch/x86/pv/dom0_build.c#dom0_construct+0x2020/0x24eb
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040a51d38>] R
> arch/x86/pv/dom0_build.c#dom0_construct+0x2020/0x24eb
> (XEN)    [<ffff82d040a52222>] F dom0_construct_pv+0x1f/0xcd
> (XEN)    [<ffff82d040a7bb27>] F construct_dom0+0xad/0xc0
> (XEN)    [<ffff82d040a6eb3f>] F __start_xen+0x50f2/0x53aa
> (XEN)    [<ffff82d040206184>] F __high_start+0x94/0xa0
> ...
> (XEN) Pagetable walk from ffff8287fffffff8:
> (XEN)  L4[0x105] = 000000001fa17063 ffffffffffffffff
> (XEN)  L3[0x01f] = 0000000000000000 ffffffffffffffff
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=0000]
> (XEN) Faulting linear address: ffff8287fffffff8
> (XEN) ****************************************
>
> We've got a wild access, but it's not clear exactly what's going on here.
>
> addr2line says it's line 904 which is in the middle of the
> page_list_for_each() loop setting up the physmap.
>
> My gut feeling is that the pointer -> array conversion in
> consider_modules() isn't correct, because that's literally the only
> non-trivial change, but I can't spot anything concretely wrong...

To follow up, this isn't really the fault of this patch.

It's a hindenbug left by prior patches.  Fix at
https://lore.kernel.org/xen-devel/20241022124114.84498-1-andrew.cooper3@citrix.com/T/#u

~Andrew

