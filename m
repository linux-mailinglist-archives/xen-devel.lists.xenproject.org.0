Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6115B5D03
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 17:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405864.648302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXlC8-0007Ce-IB; Mon, 12 Sep 2022 15:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405864.648302; Mon, 12 Sep 2022 15:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXlC8-00079e-Fb; Mon, 12 Sep 2022 15:17:56 +0000
Received: by outflank-mailman (input) for mailman id 405864;
 Mon, 12 Sep 2022 15:17:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbJ1=ZP=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1oXlC6-00079Y-PP
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 15:17:54 +0000
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1265ab5b-32ae-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 17:17:53 +0200 (CEST)
Received: by mail-wr1-f41.google.com with SMTP id bq9so15928108wrb.4
 for <xen-devel@lists.xenproject.org>; Mon, 12 Sep 2022 08:17:53 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 l128-20020a1c2586000000b003b340f00f10sm10620972wml.31.2022.09.12.08.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 08:17:52 -0700 (PDT)
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
X-Inumbo-ID: 1265ab5b-32ae-11ed-a31c-8f8a9ae3403f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rSdFp//FgK95mf2it0s18pZ/BW4X/WUoHMbm0UPV7z8=;
        b=sb63FUmwV1H2cBDbgzqrt0gBoxWgj66Y/dnkE+gTC411HPgcIZGMwJAOQesbP/5zW7
         lofR7TFzwUDStWehxqrhwWJAQTgDL4UB24vkNG2+v4pwAQTUOhaVk1MZ7V9BA+EoZxyK
         rYkWU8isd5U2U4XungO9tpdGFi1VaegMcSG51MMNyHZ1cMhTUx4yWag0BpOnWL24Wkgt
         Ko7drrGQeaIftMOxq09fLkeJBmramEsi2FsKjq7iShFSkQ0/kzd7RKgZK2FHoKi8dcEk
         aDeHTpK55enO5+vGy1/KM4hCCtmNrtcRv62IPLTkXHLIkf9sDJk4H4iZpsfk5y92eC2p
         NJkw==
X-Gm-Message-State: ACgBeo0/cx6zBh2kaOOinBt5TphcPTDrVdSKZS9w6pCsaBVlBnkTDsup
	RTmTTN51pef665tqEyI8evI=
X-Google-Smtp-Source: AA6agR6UjoXyeanimEUu/0ShDd2DrSKVf2T+SZlfbgz83s1vDiNVKoZx1p80XujRdnPIWDmjvx62XQ==
X-Received: by 2002:adf:e609:0:b0:22a:a6fd:cfe1 with SMTP id p9-20020adfe609000000b0022aa6fdcfe1mr2001572wrm.0.1662995873048;
        Mon, 12 Sep 2022 08:17:53 -0700 (PDT)
Date: Mon, 12 Sep 2022 15:17:46 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Ajay Kaher <akaher@vmware.com>
Cc: helgaas@kernel.org, bhelgaas@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	srivatsab@vmware.com, srivatsa@csail.mit.edu, amakhalov@vmware.com,
	vsirnapalli@vmware.com, er.ajay.kaher@gmail.com,
	willy@infradead.org, namit@vmware.com, linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org, jailhouse-dev@googlegroups.com,
	xen-devel@lists.xenproject.org, acrn-dev@lists.projectacrn.org,
	Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on VMware hypervisor
Message-ID: <Yx9NmjzeiyYsxUPT@liuwe-devbox-debian-v2>
References: <1662448117-10807-1-git-send-email-akaher@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1662448117-10807-1-git-send-email-akaher@vmware.com>

On Tue, Sep 06, 2022 at 12:38:37PM +0530, Ajay Kaher wrote:
> During boot-time there are many PCI config reads, these could be performed
> either using Port IO instructions (PIO) or memory mapped I/O (MMIO).
> 
> PIO are less efficient than MMIO, they require twice as many PCI accesses
> and PIO instructions are serializing. As a result, MMIO should be preferred
> when possible over PIO.
> 
> Virtual Machine test result using VMware hypervisor
> 1 hundred thousand reads using raw_pci_read() took:
> PIO: 12.809 seconds
> MMIO: 8.517 seconds (~33.5% faster then PIO)
> 
> Currently, when these reads are performed by a virtual machine, they all
> cause a VM-exit, and therefore each one of them induces a considerable
> overhead.
> 
> This overhead can be further improved, by mapping MMIO region of virtual
> machine to memory area that holds the values that the “emulated hardware”
> is supposed to return. The memory region is mapped as "read-only” in the
> NPT/EPT, so reads from these regions would be treated as regular memory
> reads. Writes would still be trapped and emulated by the hypervisor.
> 
> Virtual Machine test result with above changes in VMware hypervisor
> 1 hundred thousand read using raw_pci_read() took:
> PIO: 12.809 seconds
> MMIO: 0.010 seconds
> 
> This helps to reduce virtual machine PCI scan and initialization time by
> ~65%. In our case it reduced to ~18 mSec from ~55 mSec.
> 
> MMIO is also faster than PIO on bare-metal systems, but due to some bugs
> with legacy hardware and the smaller gains on bare-metal, it seems prudent
> not to change bare-metal behavior.
> 
> Signed-off-by: Ajay Kaher <akaher@vmware.com>

The subject line should be fixed -- you're changing the behaviour for
all hypervisors, not just VMWare. I almost skipped this because of the
subject line.

Thanks,
Wei.

