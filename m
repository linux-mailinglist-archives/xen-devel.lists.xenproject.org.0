Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF2B411565
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 15:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190910.340735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSJBu-0003ph-Rr; Mon, 20 Sep 2021 13:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190910.340735; Mon, 20 Sep 2021 13:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSJBu-0003mV-O6; Mon, 20 Sep 2021 13:18:38 +0000
Received: by outflank-mailman (input) for mailman id 190910;
 Mon, 20 Sep 2021 13:18:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rsqB=OK=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1mSJBu-0003mP-7b
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 13:18:38 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9e7fe3a9-a9f3-4781-971f-765864a276c0;
 Mon, 20 Sep 2021 13:18:36 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-fk4cY7LrPpmLWm9Lm7_lEQ-1; Mon, 20 Sep 2021 09:18:34 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so6031937wru.15
 for <xen-devel@lists.xenproject.org>; Mon, 20 Sep 2021 06:18:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm13359543wms.15.2021.09.20.06.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 06:18:32 -0700 (PDT)
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
X-Inumbo-ID: 9e7fe3a9-a9f3-4781-971f-765864a276c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632143916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XZbiHti4vCOqgWKM54l6a3juvV92A2baM8UIqCN0ZRQ=;
	b=gBUs1cCExa5AwU18pM/5jF6Axf25NmtDAir8l1/5EPd+yjKEzXkPTZJy7jfhrLmKfv3DuP
	LNPOA/KIsr4f1c97q+3Wz2SVFHfZSNPs50Ktup5c1sXY4Vcqk/HCMAoLHu6Ag8Uj6T1Gdb
	ttj9umuCWYVoOVuZQmVrWyHGxBCZToE=
X-MC-Unique: fk4cY7LrPpmLWm9Lm7_lEQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XZbiHti4vCOqgWKM54l6a3juvV92A2baM8UIqCN0ZRQ=;
        b=4bPcBJSADUFtrmDYGMgH3o1Ztd9MO1IWXDrbklGbJKaoZZjLZviynpnNAOggUF2kz/
         CwzaTyNfNmGxDhUHgsqbN46HJ00of1Q4EZ+DgY5cHadKBourCQLtqQZL4nlLTtkYajvW
         jTHVduRrudYwPQqHGbWTPsGl7VJfTN3MTI9M5q4v8FUMcV8h4JKFNLdibbxZejCagbwN
         RUzYhKEz885MI/Zb7sA9VNslmZY/F6h1yqYy8XCzRUb9g61HIS5tbzOj/HXuiA+Li/Kq
         rRN3GY1mL6nzXxb44fnAWead5QWOyhLNFxLDSN1pnygQdNP/73xV5KG+GUxv1RG49ToQ
         4E3A==
X-Gm-Message-State: AOAM533/l4TIB3JMornOSXuKo3oVq9aJjbTxO8nQUaFM0lqKVXtMrU74
	+n3iaQgKKhfAUQjj9s+tVHcTQ8oPraJo6JHXluBk86muzp4L2N5ut4R9GAS8gWN1mNI/Tp/WlDG
	igWRx1CxxNAspFxOIVCW6X74NxIE=
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr13376912wrz.439.1632143913678;
        Mon, 20 Sep 2021 06:18:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7N3hxz36qRlOw1/rL/DwL4aDROJ8XxG8xzFR2ylC3WRZ+AXi5MycER2AoBKQtMUNziJuirw==
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr13376850wrz.439.1632143913429;
        Mon, 20 Sep 2021 06:18:33 -0700 (PDT)
Subject: Re: [PATCH v2 00/13] perf: KVM: Fix, optimize, and clean up callbacks
To: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Sean Christopherson <seanjc@google.com>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
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
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828201336.GD4353@worktop.programming.kicks-ass.net>
 <YUO5J/jTMa2KGbsq@google.com>
 <YURDqVZ1UXKCiKPV@hirez.programming.kicks-ass.net>
 <662e93f9-e858-689d-d203-742731ecad2c@redhat.com>
 <87tuifv3mb.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7a5825d1-d6e9-8ac8-5df2-cce693525da7@redhat.com>
Date: Mon, 20 Sep 2021 15:18:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87tuifv3mb.wl-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20/09/21 14:22, Marc Zyngier wrote:
>> I think that's only ARM, and even then it is only because of
>> limitations of the hardware which mostly apply only if VHE is not in
>> use.
>>
>> If anything, it's ARM that should support module build in VHE mode
>> (Linux would still need to know whether it will be running at EL1 or
>> EL2, but KVM's functionality is as self-contained as on x86 in the VHE
>> case).
> I don't see this happening anytime soon. At least not before we
> declare the arm64 single kernel image policy to be obsolete.

--verbose please. :)  I am sure you're right, but I don't understand the 
link between the two.

Paolo


