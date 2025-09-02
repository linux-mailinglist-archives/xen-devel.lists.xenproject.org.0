Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E27B402DE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 15:25:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106473.1457150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utR0V-00072i-Im; Tue, 02 Sep 2025 13:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106473.1457150; Tue, 02 Sep 2025 13:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utR0V-0006zq-En; Tue, 02 Sep 2025 13:25:07 +0000
Received: by outflank-mailman (input) for mailman id 1106473;
 Tue, 02 Sep 2025 13:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j4rs=3N=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1utR0T-0006vk-OU
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 13:25:05 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ca030e7-8800-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 15:25:04 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3d19699240dso2213481f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 06:25:04 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf270fbd01sm20127940f8f.13.2025.09.02.06.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 06:25:03 -0700 (PDT)
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
X-Inumbo-ID: 3ca030e7-8800-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756819504; x=1757424304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rz/p6M0rklQHwfyQ6YvhjhFju5Y1e2Dz66wkkh69jUI=;
        b=m9d1JxIOb5EQzHvsteqdTQwT+fTMczljx8ym1B4Gyx1uFdSxaJIAiKfxiP1eyUhqMz
         JBqhse1dIb4ZkAYjgB5GJWUs3wYcHSjJeQXhu9Qw2yfNJ8J0uwMs0s0GttLbIlgnnWr2
         mEYkiSVeZhOCYjExPyJsA47Yv06ANuGETHR2cF+7XMBI/WLiiTcfc9xQ/g6/eG9xPrM6
         L1mdsbikFdiKrqs133xo+l5sm1ELZ7WfL6wxRegpYSXoknOkHNSeWgI+jcvm0mVYPm0x
         x/J0IvPSUyYELdHbvySCAAY3VPL1J5icB5WlZWeNgmvdI9X4HRX4YDxhBJdpG6Ox4oeU
         urow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819504; x=1757424304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rz/p6M0rklQHwfyQ6YvhjhFju5Y1e2Dz66wkkh69jUI=;
        b=v9n5GRHilZ4OIim6UOtbN1WCp1np8pKaldQyTuVrkqrpI9aArchfsvi+BaYfyTQQjx
         HxTsF5kvUaLIFaQNUSvl8b7UqhTSZuRh22snnn26zSz6nABshpfrVNr4+ZqhFJsktmcv
         4mJCXoVt2JD6XvdKHR2gmsQ0Cu/e6cESIhmeBaGfnf+ho2474LbodeHXS1hE1HHHoHE6
         pCaHcb1yoUrZ6XGZOWRPmT7FbmP07snghYcSCUU5zrCRTwzomUV87eb75FMbLV5AeI3N
         dMcdABZ12BnrUT4ougeIMOWSyXgG3ECkU6d+qHMtOrJ1smP+HIhEUPal4qmMd/P84Mz/
         0jXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY+UfLT8e9zH+MpUaMzFddi6a+YWSI0B7LtxzYZ9c0Z9EZvgzkBnnVSqrnNomV8UQHNRUXvJWmUNE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQgU3RuCy4gClYa7HqpBN45R4JvAgenyvC8u+sp8xsgt5uIvZt
	jrY3vROjadS3cPEH2vNI6jrsWPTnaV1R7FNK0TA9ZHlC9pwE9jCs2WqPZ+klirBoQtc=
X-Gm-Gg: ASbGnctq6XH4XwyuJBAdNm8Xw0EnLhFljvx0wiI+8wmo8AmA0GErEEXMmJYptx7/d36
	2K+PSCx9BTRgbENldWJIFV7LMXCqYU/krsJFhS22b1ON4PVA7/8nk05kdeYL5prN/HrY+3pOJAn
	lzU2j4H9mcxft4vER9gI0OZF74WRLtDEidhg6VrrKu3z7O9NCvNXB5YgpZteugadC6SP7pSCNvw
	iwWEnQzDlR8kZ3bfEFQESr5ypK9LNT48HcnK0KStOW7zGsdp2BdsMQrxYz5zHFpRlAUILWrj9QK
	H6tzZiXCuLS7jXIaorqmT+309KWn6vABUsVFQZ64RrfCyiwk+4MPazQj0Vyo+JZfkUURMh/3OCW
	7XCQhtoPp+7t+efaigeEfnPwg/I8/oBXXRo+b1T9mHiv+X7QJGNUD5kWsqhkd3vpFMeyYOWAkfE
	LV
X-Google-Smtp-Source: AGHT+IEYmruxNHSN7LVlQ+61cQOiuO9GUpOJdI4vg0itRWRn52yE5aUCbQ+D5IlmMUWkcOPQ5loTdw==
X-Received: by 2002:a5d:5712:0:b0:3dc:db:89f3 with SMTP id ffacd0b85a97d-3dc00db8a77mr46469f8f.16.1756819504134;
        Tue, 02 Sep 2025 06:25:04 -0700 (PDT)
Message-ID: <baa2f292-c29c-4045-8470-a9c7387cf98a@linaro.org>
Date: Tue, 2 Sep 2025 15:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] accel: Add per-accelerator vCPUs queue
To: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cameron Esfahani <dirty@apple.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Alexander Graf <agraf@csgraf.de>, Paul Durrant <paul@xen.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Riku Voipio <riku.voipio@iki.fi>, Anthony PERARD <anthony@xenproject.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, Zhao Liu
 <zhao1.liu@intel.com>, Phil Dennis-Jordan <phil@philjordan.eu>,
 David Woodhouse <dwmw2@infradead.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Salil Mehta <salil.mehta@huawei.com>
References: <20250106200258.37008-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250106200258.37008-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Cc'ing Pierrick & Salil.

On 6/1/25 21:02, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> Currently we register all vCPUs to the global 'cpus_queue' queue,
> however we can not discriminate per accelerator or per target
> architecture (which might happen in a soon future).
> 
> This series tries to add an accelerator discriminator, so
> accelerator specific code can iterate on its own vCPUs. This
> is required to run a pair of HW + SW accelerators like the
> (HVF, TCG) or (KVM, TCG) combinations. Otherwise, i.e. the
> HVF core code could iterate on TCG vCPUs...
> To keep it simple and not refactor heavily the code base,
> we introduce the CPU_FOREACH_TCG/HVF/KVM() macros, only
> defined for each accelerator.
> 
> This is just a RFC to get some thoughts whether this is
> heading in the correct direction or not ;)
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (7):
>    cpus: Restrict CPU_FOREACH_SAFE() to user emulation
>    cpus: Introduce AccelOpsClass::get_cpus_queue()
>    accel/tcg: Implement tcg_get_cpus_queue()
>    accel/tcg: Use CPU_FOREACH_TCG()
>    accel/hw: Implement hw_accel_get_cpus_queue()
>    accel/hvf: Use CPU_FOREACH_HVF()
>    accel/kvm: Use CPU_FOREACH_KVM()
> 
>   accel/tcg/tcg-accel-ops.h         | 10 ++++++++++
>   include/hw/core/cpu.h             | 11 +++++++++++
>   include/system/accel-ops.h        |  6 ++++++
>   include/system/hvf_int.h          |  4 ++++
>   include/system/hw_accel.h         |  9 +++++++++
>   include/system/kvm_int.h          |  3 +++
>   accel/accel-system.c              |  8 ++++++++
>   accel/hvf/hvf-accel-ops.c         |  9 +++++----
>   accel/kvm/kvm-accel-ops.c         |  1 +
>   accel/kvm/kvm-all.c               | 14 +++++++-------
>   accel/tcg/cputlb.c                |  7 ++++---
>   accel/tcg/monitor.c               |  3 ++-
>   accel/tcg/tb-maint.c              |  7 ++++---
>   accel/tcg/tcg-accel-ops-rr.c      | 10 +++++-----
>   accel/tcg/tcg-accel-ops.c         | 16 ++++++++++++----
>   accel/tcg/user-exec-stub.c        |  5 +++++
>   accel/xen/xen-all.c               |  1 +
>   cpu-common.c                      | 10 ++++++++++
>   hw/i386/kvm/clock.c               |  3 ++-
>   hw/intc/spapr_xive_kvm.c          |  5 +++--
>   hw/intc/xics_kvm.c                |  5 +++--
>   system/cpus.c                     |  5 +++++
>   target/arm/hvf/hvf.c              |  4 ++--
>   target/i386/kvm/kvm.c             |  4 ++--
>   target/i386/kvm/xen-emu.c         |  2 +-
>   target/i386/nvmm/nvmm-accel-ops.c |  1 +
>   target/i386/whpx/whpx-accel-ops.c |  1 +
>   target/s390x/kvm/kvm.c            |  2 +-
>   target/s390x/kvm/stsi-topology.c  |  3 ++-
>   29 files changed, 130 insertions(+), 39 deletions(-)
> 


