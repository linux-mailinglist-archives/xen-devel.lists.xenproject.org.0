Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4372413DFD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 01:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191971.342154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSp5e-0003bj-Dk; Tue, 21 Sep 2021 23:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191971.342154; Tue, 21 Sep 2021 23:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSp5e-0003YY-9c; Tue, 21 Sep 2021 23:22:18 +0000
Received: by outflank-mailman (input) for mailman id 191971;
 Tue, 21 Sep 2021 23:22:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uuut=OL=google.com=seanjc@srs-us1.protection.inumbo.net>)
 id 1mSp5c-0003YS-Cl
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 23:22:16 +0000
Received: from mail-pg1-x534.google.com (unknown [2607:f8b0:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c30602c-60ba-4c11-b2c4-78c92b9670de;
 Tue, 21 Sep 2021 23:22:15 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id w8so677547pgf.5
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 16:22:15 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id gp11sm3483849pjb.2.2021.09.21.16.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:22:13 -0700 (PDT)
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
X-Inumbo-ID: 0c30602c-60ba-4c11-b2c4-78c92b9670de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SrgpsGNJ8rqjyV4/EJo88O9IIQbG0UxIB/O/sCFEHCQ=;
        b=Aek6S4Ex4HL+FlRX8wezQ0nSn8PZPLVSwGFM6Tuf5Vb5PRgM0t3QLU9WUHFeTsdzAU
         QtJBZLxCtSTzHjvsrBDZHuAtRs8M/UcTtn16UVPyICkA/9SmSo6/wgDRXNjilfk6+22r
         W51t+bozYpGIBCS76o+pBdu3BTXYTvAYrWg54kKw/zUklVknkRQaSR+HYh+NPP+yi8y9
         Yb/gjfeOPPT4vB//YCwqd+j/uNNgvnBzGOO9gtxuEZPi7zBRKotpsZHqTtUaIjyqVYgT
         sIUYBMdsmRG8oPPacCtBAXZP+CTj2FLeluAQ6fbuqzgy0II1EfOxhsPqM2kyF7AdcmHW
         W4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SrgpsGNJ8rqjyV4/EJo88O9IIQbG0UxIB/O/sCFEHCQ=;
        b=DMPnAjSJpEetbeEbo++0eAVhYTUcTMjIYhCeQWo9cr2pS62qHBC/PVtb4CpfFAzNB1
         8NJB3ulc56uKIf/Rpkc37WHbE/0lZkkGt7WWc3mn2MKvojwEIo5YURtYa8lYGmcI372Q
         di1WSW69duxR7Wrn1p7F8v4IUEtfuuDjRHygkLo5+kqFuCkG3tMPxiYIsk3V65Sw6WlG
         /fay2lB0PknOBAgFa3KRZsKB6Ho4cE3BvFyyBVj5gwJBpQblS4IKEx3/IKQXRokaCv+k
         57t7kOz1k2jGoZWlKUBtr0Rlq7QDeXvzg9xY3785CWJCuFg0c04IvCob4d5U/+59e4r7
         xM8w==
X-Gm-Message-State: AOAM531RtQA3itZFc1x4lU+iuuK7fE9ltkny1GTy1Y387rLtk2XLuGQR
	uOntAybOanzo6MIpM/rCd8kMkg==
X-Google-Smtp-Source: ABdhPJztKWJhnn4ll+uIjZV6ppsKBX5LhsnC09hXPT7pT0HwfgdemziHQj0i0h1tKYzjFbRFxZd+Gw==
X-Received: by 2002:a63:bf07:: with SMTP id v7mr30381034pgf.333.1632266534266;
        Tue, 21 Sep 2021 16:22:14 -0700 (PDT)
Date: Tue, 21 Sep 2021 23:22:09 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: peterz@infradead.org, pbonzini@redhat.com, bp@alien8.de,
	vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
	joro@8bytes.org, kan.liang@linux.intel.com, ak@linux.intel.com,
	wei.w.wang@intel.com, eranian@google.com, liuxiangdong5@huawei.com,
	linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	like.xu.linux@gmail.com, boris.ostrvsky@oracle.com,
	Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
	Nick Hu <nickhu@andestech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH V10 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
Message-ID: <YUppIQxphCUK6ZLS@google.com>
References: <20210806133802.3528-1-lingshan.zhu@intel.com>
 <20210806133802.3528-2-lingshan.zhu@intel.com>
 <YSfykbECnC6J02Yk@google.com>
 <186c330e-be42-4c49-545c-8f73573b5869@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <186c330e-be42-4c49-545c-8f73573b5869@intel.com>

On Wed, Sep 15, 2021, Zhu, Lingshan wrote:
> 
> 
> On 8/27/2021 3:59 AM, Sean Christopherson wrote:
> > TL;DR: Please don't merge this patch, it's broken and is also built on a shoddy
> >         foundation that I would like to fix.
> Hi Sean,Peter, Paolo
> 
> I will send out an V11 which drops this patch since it's buggy, and Sean is
> working on fix this.
> Does this sound good?

Works for me, thanks!

