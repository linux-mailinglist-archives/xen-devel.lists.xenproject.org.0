Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0424113FA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 14:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190834.340631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSI3L-0008F1-ES; Mon, 20 Sep 2021 12:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190834.340631; Mon, 20 Sep 2021 12:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSI3L-0008C2-BK; Mon, 20 Sep 2021 12:05:43 +0000
Received: by outflank-mailman (input) for mailman id 190834;
 Mon, 20 Sep 2021 12:05:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rsqB=OK=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1mSI3K-0008Bs-9y
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 12:05:42 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0756f935-369a-40e6-9824-92dd59c4f9e1;
 Mon, 20 Sep 2021 12:05:41 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-Q2Q90twzMEeA8yWJ2-I_-Q-1; Mon, 20 Sep 2021 08:05:40 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so5864535wru.15
 for <xen-devel@lists.xenproject.org>; Mon, 20 Sep 2021 05:05:39 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l15sm19128605wme.42.2021.09.20.05.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 05:05:37 -0700 (PDT)
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
X-Inumbo-ID: 0756f935-369a-40e6-9824-92dd59c4f9e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632139541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8wAH/IsmVnI2ydhQ1BFoaOBGT1C6T31sGkkhWrMszg=;
	b=E5O5IYb3E/Ra/xlxED0QOc8QrPeCDxCsIi9ztHhZjYBOh6ejFUGPudbBXxiS/wHIdenNep
	qIFlUvG5zJwA+fqK3RXonYrssqDunAdP9q4HaYuW0GkV6Qxp86eISEvTcccX4DFIPFEpFG
	Kuo6tHq2RiDnvU1gHyMflYXobeoveWY=
X-MC-Unique: Q2Q90twzMEeA8yWJ2-I_-Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q8wAH/IsmVnI2ydhQ1BFoaOBGT1C6T31sGkkhWrMszg=;
        b=mGpYWvipljWjJ9Ypsi19pyCoxY/K/wfHktHHIXNRH8ixVA6NN5BIjWLV72JOz+Tyni
         r9OcMWxYYfP0cnKthjOSCrSHE8qq1zk+WMm+ZTAyEYc5zqTCccEDT+RJEOs9PvIaHvoG
         jqLQ3V/9b70WNyxa8Su6DVXgl1Rp75rBSCuPo9ap21njrJiz42hGtnZd4iLFWiTNRP31
         jXDftar4AGcFe2HqMadPUxPShpWbC44feYqFw+Lo6IoJlYenl+mU3+lp0eYZxlGVQXis
         gBJOGxLpC5mvEGhsyyBPj/cD38Wg/XCTeUNUVVcnpLenJ4+Af1fYlIZnj/RtcBCL5r/r
         D+8w==
X-Gm-Message-State: AOAM530KTrPuY5VX4/G1Z4JCXg08i2f7ANsRI36gXHFvJkNuVsgnuxVj
	GMYy1M6NA+j+DnU+9dLowZC4s+arhBdxOAaN4mm/+po5vduNhG7hTaCYJafbapp1MWVlgMcIXq3
	7r2Y7ZfjdGuDItaNeXWehKuFP8Wc=
X-Received: by 2002:a5d:4608:: with SMTP id t8mr28038945wrq.136.1632139538950;
        Mon, 20 Sep 2021 05:05:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz64XIPtY2fM12srCDcTMCwDqENNrjhBUdJzYmop3FKDPBAPZx+uh9ah7Isb2beeBqNbwRMJw==
X-Received: by 2002:a5d:4608:: with SMTP id t8mr28038880wrq.136.1632139538580;
        Mon, 20 Sep 2021 05:05:38 -0700 (PDT)
To: Peter Zijlstra <peterz@infradead.org>,
 Sean Christopherson <seanjc@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
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
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828201336.GD4353@worktop.programming.kicks-ass.net>
 <YUO5J/jTMa2KGbsq@google.com>
 <YURDqVZ1UXKCiKPV@hirez.programming.kicks-ass.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 00/13] perf: KVM: Fix, optimize, and clean up callbacks
Message-ID: <662e93f9-e858-689d-d203-742731ecad2c@redhat.com>
Date: Mon, 20 Sep 2021 14:05:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YURDqVZ1UXKCiKPV@hirez.programming.kicks-ass.net>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17/09/21 09:28, Peter Zijlstra wrote:
>> In theory, I like the idea of burying intel_pt inside x86 (and even in
>> Intel+VMX code for the most part), but the actual implementation is a
>> bit gross.  Because of the whole "KVM can be a module" thing,
> 
> ARGH!! we should really fix that. I've heard other archs have made much
> better choices here.

I think that's only ARM, and even then it is only because of limitations 
of the hardware which mostly apply only if VHE is not in use.

If anything, it's ARM that should support module build in VHE mode 
(Linux would still need to know whether it will be running at EL1 or 
EL2, but KVM's functionality is as self-contained as on x86 in the VHE 
case).

Paolo


