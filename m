Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5971340FE30
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 18:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189625.339427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRH7h-0006LG-8w; Fri, 17 Sep 2021 16:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189625.339427; Fri, 17 Sep 2021 16:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRH7h-0006IQ-5h; Fri, 17 Sep 2021 16:54:01 +0000
Received: by outflank-mailman (input) for mailman id 189625;
 Fri, 17 Sep 2021 16:53:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LSos=OH=google.com=seanjc@srs-us1.protection.inumbo.net>)
 id 1mRH7e-0006IA-Pw
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 16:53:58 +0000
Received: from mail-pg1-x52e.google.com (unknown [2607:f8b0:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 465bc9bf-2a29-4fac-a646-cdc1bac30418;
 Fri, 17 Sep 2021 16:53:58 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id q68so10146157pga.9
 for <xen-devel@lists.xenproject.org>; Fri, 17 Sep 2021 09:53:58 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id h21sm6580708pfc.118.2021.09.17.09.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:53:56 -0700 (PDT)
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
X-Inumbo-ID: 465bc9bf-2a29-4fac-a646-cdc1bac30418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fRMxd8azh7E1BFxsMIqGYJmHYephRNLnlBlA+X7n5iE=;
        b=OCd2JnsFm+PC0WRg9Dy8nwrv0xb6S01W9Op4r/ZIu2wiEWDdIoF9l2WbVBKByhSPPF
         pgrkna7a3wLYVWEKuAik8asYNbpDEgJtdjZ+5dk4g6kfSL2XrdSoKcoPwqesfcoOwhOu
         WWbUTglAWniqlHYXmzaYzrF0F49uRRMs/V59Ek2JYLZBnMp92N934h45zumxZj/0PpGD
         /zvBIntmv3EDlaS6KVxhx1MfK4sOMy/cLwcByoT+tkw90D/Cj3jlQCjxNda2rrqk2GSV
         L6ETbBTdUnfohyRSi9IUyYAHcI9Z9pYHZQ5tjcYdmN/t6vpNHZYY3PO0hm+uRnpvMlkD
         xKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fRMxd8azh7E1BFxsMIqGYJmHYephRNLnlBlA+X7n5iE=;
        b=ePKZMYN+A4Jr1Xt1WTD+sTanhLsq6GNFVOIsyvuZQ6ZVEDupL5NgrGMFVPaBR7LT3b
         Ugd0tAtzFzNjWwu+rXYUDny9U5NKNuJ3IdZyaUPgK/WSHc8FDtA04+ebfVasGymTkmCo
         XnTGQTFo8XbUJBGpjHmR5nqtUVa4LgybnvykN7jForO9xALhdegJXmsQpm+GFIELgEJr
         6NfFDx67mEbrpBaD3CURqHSDJtMH36uj3SsaFULu8uyyNVxqPUqk46KIXzqgtNUmqtrO
         g2S0ebnm5D8GVg7SdBBuA/vaOb1diDQSTnTjS1rjvuPoKwRgK2Q6tnbgmX+KBfvKU2iv
         jL9g==
X-Gm-Message-State: AOAM532E+ppTudcm8xWAE3Q8SGofva6gxUsOuHQx9QSOvx4QrOJYrtqy
	Q6g36fVyXXZ+prNAYhvL8EqWNg==
X-Google-Smtp-Source: ABdhPJyVPh/MP+xok4eNnL6IICz9yFWugy2q7G+GDgXi8Z/wRNwWTua9Dj2q+LfRii59WPG0Vad6Iw==
X-Received: by 2002:a05:6a00:174a:b0:433:9589:bdb5 with SMTP id j10-20020a056a00174a00b004339589bdb5mr11713777pfc.5.1631897636965;
        Fri, 17 Sep 2021 09:53:56 -0700 (PDT)
Date: Fri, 17 Sep 2021 16:53:52 +0000
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	Artem Kashkanov <artem.kashkanov@intel.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v2 00/13] perf: KVM: Fix, optimize, and clean up callbacks
Message-ID: <YUTIIG4ZCKMbqrFi@google.com>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828201336.GD4353@worktop.programming.kicks-ass.net>
 <YUO5J/jTMa2KGbsq@google.com>
 <YURDqVZ1UXKCiKPV@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YURDqVZ1UXKCiKPV@hirez.programming.kicks-ass.net>

On Fri, Sep 17, 2021, Peter Zijlstra wrote:
> On Thu, Sep 16, 2021 at 09:37:43PM +0000, Sean Christopherson wrote:
> So I don't mind exporting __static_call_return0, but exporting a raw
> static_call is much like exporting a function pointer :/

Ya, that part is quite gross.

> > The unregister path would also need its own synchronize_rcu().  In general, I
> > don't love duplicating the logic, but it's not the end of the world.
> > 
> > Either way works for me.  Paolo or Peter, do either of you have a preference?
> 
> Can we de-feature kvm as a module and only have this PT functionality
> when built-in? :-)

I agree that many of the for-KVM exports are ugly, especially several of the
perf exports, but I will fight tooth and nail to keep KVM-as-a-module.  It is
invaluable for development and testing, and in the not-too-distant future there
is KVM-maintenance related functionality that we'd like to implement that relies
on KVM being a module.

I would be more than happy to help explore approaches that reduce the for-KVM
exports, but I am strongly opposed to defeaturing KVM-as-a-module.  I have a few
nascent ideas for eliminating a handful of a random exports, but no clever ideas
for eliminating perf's for-KVM exports.

