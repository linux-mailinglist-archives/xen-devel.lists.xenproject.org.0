Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E0A44BFDB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 12:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224252.387446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mklSZ-0004L8-DQ; Wed, 10 Nov 2021 11:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224252.387446; Wed, 10 Nov 2021 11:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mklSZ-0004J0-AQ; Wed, 10 Nov 2021 11:08:07 +0000
Received: by outflank-mailman (input) for mailman id 224252;
 Wed, 10 Nov 2021 11:08:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEWT=P5=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1mklSX-0004Iu-SE
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 11:08:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78b129ce-4216-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 12:08:03 +0100 (CET)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-ujHN4zoWOB2b2RFeJpnktw-1; Wed, 10 Nov 2021 06:08:00 -0500
Received: by mail-ed1-f69.google.com with SMTP id
 h13-20020a05640250cd00b003e35ea5357fso2036377edb.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 03:08:00 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id g21sm9257171edb.89.2021.11.10.03.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:07:58 -0800 (PST)
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
X-Inumbo-ID: 78b129ce-4216-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636542482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=48dRn8RRnq7Fx6Bqaf9CAoNN40en8LqbHxW41Xnziw0=;
	b=TDdaeqalYtPwttrx89aQI5kMRsvoMUpYW+6wi2z7ZGcrjd35wNpUCNoqsMoAO/eiAFekO/
	ED7LGzlxH/4hzQax1IILJuXqj/a42Z0NZUOl8G7sgTjb5VG5zsKPI5oqZKkwSsN8YrfIH/
	D/Hfd/P1kD12zZACGQexclInMiTSf3g=
X-MC-Unique: ujHN4zoWOB2b2RFeJpnktw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=48dRn8RRnq7Fx6Bqaf9CAoNN40en8LqbHxW41Xnziw0=;
        b=MGKjaVQEs6oi2pUbsQqMZj33tFHmCuTRwop1NZZIUcNnTNF9uyDVqoV4vlBvhQop/h
         A9TEWMaYFYls6HohGOoDcmfKHHjO3qvTJ4pFRZwVjrHyQ2Qt/z87KcK2b9T2/JGdNQ1Z
         li04oTV/KKFsohLhdm0PSucfSuKK5IvCeAM1emqTUPGNnZrkSMKGNdXqQJoPCOL+x3Cf
         vF8ffz7mPlMupKvZpw+SkkpoHu1gltTKhlyFj1wF5D+6C0NVRg7bSgLqLAcMIjp2xWt2
         qmqfNQG2UNsp5JKuALug8U5tgpacEv193pBvt3wlmLP97ZhyT1ugK7BABoTBIJn5xybQ
         k+qQ==
X-Gm-Message-State: AOAM533kWEqcksSLiDUNaFHERCN0E6h0aVMxRrgzo0vW4XAYeWr7kx6G
	7vwi1BbFu5RdIRNwmBTO7syS7kOiftcTKZOz3pRcRlLuSoPvkmvBHYdhkqJsGBaguXkjs4BrQsq
	JcigsVUIFmK/AkvPsy/mNVaqsU6k=
X-Received: by 2002:a17:907:86a6:: with SMTP id qa38mr18779905ejc.286.1636542479496;
        Wed, 10 Nov 2021 03:07:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIY9E3GGXDTMKNhG94s7x2qpu4nLPlWqmcyoHulhCMNs+PGo9+5ZlP1mG10EA68G9ox4DyaA==
X-Received: by 2002:a17:907:86a6:: with SMTP id qa38mr18779839ejc.286.1636542479231;
        Wed, 10 Nov 2021 03:07:59 -0800 (PST)
Message-ID: <f86fe9cb-bf4b-1c10-e0da-276fbb3f62ee@redhat.com>
Date: Wed, 10 Nov 2021 12:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 01/16] perf: Ensure perf_guest_cbs aren't reloaded
 between !NULL check and deref
To: Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Juergen Gross <jgross@suse.com>,
 Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <green.hu@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Marc Zyngier <maz@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Guo Ren <guoren@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-2-seanjc@google.com>
 <77e3a76a-016b-8945-a1d5-aae4075e2147@gmail.com>
 <YYPrst2CUBXLYc9h@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YYPrst2CUBXLYc9h@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/21 15:18, Sean Christopherson wrote:
> If I'm interpeting Paolo's suggestion
> correctly, he's pointing out that oustanding stores to the function pointers in
> @cbs need to complete before assigning a non-NULL pointer to perf_guest_cbs,
> otherwise a perf event handler may see a valid pointer with half-baked callbacks.
> 
> I think smp_store_release() with a comment would be appropriate, assuming my
> above interpretation is correct.
> 

Yes, exactly.  It should even be rcu_assign_pointer(), matching the 
synchronize_rcu() in patch 1 (and the change can be done in patch 1, too).

Paolo


