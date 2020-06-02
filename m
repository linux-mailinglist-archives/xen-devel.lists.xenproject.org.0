Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FCE1EB992
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 12:27:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg47Z-00039O-Ja; Tue, 02 Jun 2020 10:26:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVk0=7P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jg47Y-00039J-1U
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 10:26:12 +0000
X-Inumbo-ID: 7a4dc378-a4bb-11ea-9dbe-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a4dc378-a4bb-11ea-9dbe-bc764e2007e4;
 Tue, 02 Jun 2020 10:26:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q25so2569227wmj.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 03:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=nUCCIq84c7rWxewj8ROr+keME7J3I7bnw6MaVKLaJoo=;
 b=rd+EpPKKvRM3eWBKWUvX0Z1EBgru6zrmVGQ24H2ixbvLD2/bb4EjfrcrxfwOMe9BFq
 WSZNf91iUlv0rVocO9NY0gUsIDd4wThfr7e5245BpC2Fv/sphCZdMdsj2u7b/ObuC+5B
 XF4HHEK3MxyURLxk3Sj3a0KnoUEU4slGzMyJP5WFpEmjhQ65RgBqh8alm7kOOa5bm6EC
 SPc3RbIKfcvIei+4VaGP9wOhhnxBsPq/fXaXp/W5SzRlBRyEZ+E1i2jfakg37GgQv73u
 HAFRTWbOSTxTxlsqWbpwquLdyC9eNVQvhMAvhoAm5zdfudr1FD5uwFzfH568n0YXl5T/
 89XQ==
X-Gm-Message-State: AOAM533qSmAfGN5QWa1/zxdR1gqVGsLbFuQ5cD4DMIXwOMIjAY+N3FYd
 yvD+hKX/sdU5Xt+gMBAUQv8=
X-Google-Smtp-Source: ABdhPJzv7gjHN2hz4bTy5846mYUDKjgmN0IWTuB9aIRonWW6xC/DNf1vkdFkDKHRQRmZ0Y5MCXhGTw==
X-Received: by 2002:a1c:ba86:: with SMTP id k128mr3393397wmf.19.1591093570174; 
 Tue, 02 Jun 2020 03:26:10 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h18sm3097579wru.7.2020.06.02.03.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 03:26:09 -0700 (PDT)
Date: Tue, 2 Jun 2020 10:26:07 +0000
From: Wei Liu <wl@xen.org>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v19 for-4.14 01/13] x86/mem_sharing: block interrupt
 injection for forks
Message-ID: <20200602102607.hwdfpkbg3fthurug@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <a7ecf7703357130dbd9f23481d39adafea569872.1591017086.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7ecf7703357130dbd9f23481d39adafea569872.1591017086.git.tamas.lengyel@intel.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 01, 2020 at 06:21:35AM -0700, Tamas K Lengyel wrote:
> When running VM forks without device models (QEMU), it may
> be undesirable for Xen to inject interrupts. When creating such forks from
> Windows VMs we have observed the kernel trying to process interrupts
> immediately after the fork is executed. However without QEMU running such
> interrupt handling may not be possible because it may attempt to interact with
> devices that are not emulated by a backend. In the best case scenario such
> interrupt handling would only present a detour in the VM forks' execution
> flow, but in the worst case as we actually observed can completely stall it.
> By disabling interrupt injection a fuzzer can exercise the target code without
> interference. For other use-cases this option probably doesn't make sense,
> that's why this is not enabled by default.
> 
> Forks & memory sharing are only available on Intel CPUs so this only applies
> to vmx. Note that this is part of the experimental VM forking feature that's
> completely disabled by default and can only be enabled by using
> XEN_CONFIG_EXPERT during compile time.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Wei Liu <wl@xen.org>

