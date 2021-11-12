Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C39444E2B6
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 08:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224997.388584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlRPW-0008W1-BB; Fri, 12 Nov 2021 07:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224997.388584; Fri, 12 Nov 2021 07:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlRPW-0008TN-7s; Fri, 12 Nov 2021 07:55:46 +0000
Received: by outflank-mailman (input) for mailman id 224997;
 Fri, 12 Nov 2021 07:55:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fM4F=P7=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1mlRPU-0008TH-Qt
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 07:55:45 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef0280b5-438d-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 08:55:43 +0100 (CET)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-zYEzS5yrN6amKcPDN88mYQ-1; Fri, 12 Nov 2021 02:55:38 -0500
Received: by mail-ed1-f72.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso7523489edj.20
 for <xen-devel@lists.xenproject.org>; Thu, 11 Nov 2021 23:55:38 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id n1sm2700678edf.45.2021.11.11.23.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 23:55:36 -0800 (PST)
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
X-Inumbo-ID: ef0280b5-438d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636703741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lF7lzRoeZrlEIt3gHEFyVsRoWpbej1ntDFwYNAiQdJI=;
	b=S6A/GlnSpDzjNW679UfW03taT2ANpf1+QVkTv90xFzlXyD9qhmp3Bfq1yt6m12HW5vT5so
	XEJZTEkL889uu4T4jUYgKh/o5vHn1J4MhFfJvlgy3haalKiVWWCD20dn4Azf1myGmzHoAw
	4lshvNz3yoegOCHCCtEsHvsVg+IrS3w=
X-MC-Unique: zYEzS5yrN6amKcPDN88mYQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lF7lzRoeZrlEIt3gHEFyVsRoWpbej1ntDFwYNAiQdJI=;
        b=t82TG7O7Uilx77u1M1Hyz7ICk503ZaQ6x7QtNERqQ/r2XC5gfPUGg/28VEmlOxFsoI
         DxpkZhclLUlkbMpuGGrDnurX22OWJ7KarNeY031+kh5FowZ0dM0NRthPARv2C44imzz+
         LM2ONtlpcEBRhyjFw8IbniuwOj1Ts1EHoxcqKOHLeDD141paPT7kH6UCYe6PVRdLlr+l
         DX7BP/Am7tU5ryBXN3JwMti/wHxw4Q5AkLd+Ml4LwwA+M+hogqcEat0jFh0Xssbq+OHN
         6LWbUD30r3nuhTvTZzZHlq6+AlsW47hpapUl1iMjz7opJ5057zF3m34bmVyil4BPZUGt
         q7dg==
X-Gm-Message-State: AOAM533xkK26d05cM5q0sh+9pgk65o1sdMxgBvaDQbBdRJP/zbCi8jzo
	u6jcWqyLxAN3NVc2YOXhV/vnTgefNZ1uHxcASniPDF86qxekcg802vce1hPe1phX+w4mL+8XZEx
	3TCig2mtlgXlF+xOUSGn8fpqViNI=
X-Received: by 2002:a17:907:6e10:: with SMTP id sd16mr17768007ejc.158.1636703737494;
        Thu, 11 Nov 2021 23:55:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVTSyaI9bwf+cK3HRTYkkEGrfXsl4Cvt+Fkmz/7JDyaorMKEA4Mec75P9Nt6V8a8edl3Ld8g==
X-Received: by 2002:a17:907:6e10:: with SMTP id sd16mr17767982ejc.158.1636703737318;
        Thu, 11 Nov 2021 23:55:37 -0800 (PST)
Message-ID: <016d5b91-6910-2aca-0db1-a65079449454@redhat.com>
Date: Fri, 12 Nov 2021 08:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 01/17] perf: Protect perf_guest_cbs with RCU
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sean Christopherson <seanjc@google.com>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
References: <20211111020738.2512932-1-seanjc@google.com>
 <20211111020738.2512932-2-seanjc@google.com>
 <d784dc27-72d0-d64f-e1f4-a2b9a5f86dd4@redhat.com>
 <YYz03fcDRV9NZnyA@hirez.programming.kicks-ass.net>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YYz03fcDRV9NZnyA@hirez.programming.kicks-ass.net>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/21 11:47, Peter Zijlstra wrote:
>> This technically could be RCU_INIT_POINTER but it's not worth a respin.
>> There are dozens of other occurrences, and if somebody wanted they
>> could use Coccinelle to fix all of them.
> I've been pushing the other way, trying to get rid of RCU_INIT_POINTER()
> since rcu_assign_pointer(, NULL) actualy DTRT per __builtin_constant_p()
> etc.

Oh, that's pretty cool to know, thanks!

Paolo

> There's a very few sites where we use RCU_INIT_POINTER() with a !NULL
> argument, and those are 'special'.
> 


