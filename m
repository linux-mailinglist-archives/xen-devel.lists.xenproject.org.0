Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C1D800685
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 10:04:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645379.1007529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zRt-0003qh-1A; Fri, 01 Dec 2023 09:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645379.1007529; Fri, 01 Dec 2023 09:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zRs-0003oD-Tv; Fri, 01 Dec 2023 09:04:36 +0000
Received: by outflank-mailman (input) for mailman id 645379;
 Fri, 01 Dec 2023 09:04:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bjU=HM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8zRr-0003o5-JB
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 09:04:35 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4a0b38d-9028-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 10:04:33 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50aab20e828so2568533e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 01:04:33 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 u6-20020a5d4686000000b0033315876d3esm3637044wrq.12.2023.12.01.01.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 01:04:32 -0800 (PST)
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
X-Inumbo-ID: a4a0b38d-9028-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701421472; x=1702026272; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+jI635PjjS5r3f+xAIw03/F/yjXGhAVN7xa0vyb8I84=;
        b=nV1nFLBjX3YY0t3Zx4Be23wpEBuZ+SwszmBTaN6pfIU65XaPGQNrxyvXX7PHStNBxk
         38EjLapRLKXrg9Vc7a1X+3WpN6fyVCeeP5RqUKKA3fCqkKJpWnBUNFeb+x+HjgzBvzge
         5inxr5ZRWEFJZ4ej2VbcoiC4tt6M67DWJJDB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701421472; x=1702026272;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jI635PjjS5r3f+xAIw03/F/yjXGhAVN7xa0vyb8I84=;
        b=QxzNeACPGi02Ug4UI0/JC+vJZaNXohiUBr0J/QT4/wUuTgnB6kEB9FWxs/6iU3qXMc
         LTg18t8cUQ6lo6l9ItinUsADasX8X9PK7UyG3bFK1yiJsv2n6ZzULRhLPYM46dKsc9MH
         pqt2HYTcOL6ovjbffaFchJ6YqVKgAA+RMW1duTXO69GSCOrHtlrmpifkIfL5PdKDBto/
         DoO/Cl/jRtogo7M2/Jdqb62gL+azKv5q1rm2V3nRniBXlmXiuj0WOKVOqoO5iY2mlPOW
         JU/OHDcB5mpcqZO44JyHTAMYNGmVfj6VyEJ8oatfmgg83cWFNTVp2IOOAP7lT0WYcleg
         KRsA==
X-Gm-Message-State: AOJu0YzaxiCr9SbJmpRQc5Wo37TDYrE7yoFZsfDz9S6AEVlyCTtxJdF0
	k6ThWUScvsUjs5BJlxZH+L3CN7BrC9wLb3YOG9w=
X-Google-Smtp-Source: AGHT+IEKRuw4o6E54fvtmHZFCtRcta0Y8RMMBfqFPvb0veFpapHDDEmD9c273ib73E24VGxn6F2xvA==
X-Received: by 2002:a05:6512:1390:b0:50b:b921:cfb2 with SMTP id fc16-20020a056512139000b0050bb921cfb2mr713911lfb.56.1701421472340;
        Fri, 01 Dec 2023 01:04:32 -0800 (PST)
Date: Fri, 1 Dec 2023 10:04:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v10 12/17] vpci/header: emulate PCI_COMMAND register for
 guests
Message-ID: <ZWmhny_PNC7lxP1i@macbook>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-13-volodymyr_babchuk@epam.com>
 <ZVy73iJ3E8nJHvgf@macbook.local>
 <87zfyusmmg.fsf@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zfyusmmg.fsf@epam.com>

On Fri, Dec 01, 2023 at 02:05:54AM +0000, Volodymyr Babchuk wrote:
> 
> Hi Roger, Stewart,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Thu, Oct 12, 2023 at 10:09:18PM +0000, Volodymyr Babchuk wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> 
> >> Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
> >> to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
> >> guest's view of this will want to be zero initially, the host having set
> >> it to 1 may not easily be overwritten with 0, or else we'd effectively
> >> imply giving the guest control of the bit. Thus, PCI_COMMAND register needs
> >> proper emulation in order to honor host's settings.
> >> 
> >> According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
> >> Device Control" the reset state of the command register is typically 0,
> >> so when assigning a PCI device use 0 as the initial state for the guest's view
> >> of the command register.
> >> 
> >> Here is the full list of command register bits with notes about
> >> emulation, along with QEMU behavior in the same situation:
> >> 
> >> PCI_COMMAND_IO - QEMU does not allow a guest to change value of this bit
> >> in real device. Instead it is always set to 1. A guest can write to this
> >> register, but writes are ignored.
> >> 
> >> PCI_COMMAND_MEMORY - QEMU behaves exactly as with PCI_COMMAND_IO. In
> >> Xen case, we handle writes to this bit by mapping/unmapping BAR
> >> regions. For devices assigned to DomUs, memory decoding will be
> >> disabled and the initialization.
> >> 
> >> PCI_COMMAND_MASTER - Allow guest to control it. QEMU passes through
> >> writes to this bit.
> >> 
> >> PCI_COMMAND_SPECIAL - Guest can generate special cycles only if it has
> >> access to host bridge that supports software generation of special
> >> cycles. In our case guest has no access to host bridges at all. Value
> >> after reset is 0. QEMU passes through writes of this bit, we will do
> >> the same.
> >> 
> >> PCI_COMMAND_INVALIDATE - Allows "Memory Write and Invalidate" commands
> >> to be generated. It requires additional configuration via Cacheline
> >> Size register. We are not emulating this register right now and we
> >> can't expect guest to properly configure it. QEMU "emulates" access to
> >> Cachline Size register by ignoring all writes to it. QEMU passes through
> >> writes of PCI_COMMAND_INVALIDATE bit, we will do the same.
> >> 
> >> PCI_COMMAND_VGA_PALETTE - Enable VGA palette snooping. QEMU passes
> >> through writes of this bit, we will do the same.
> >> 
> >> PCI_COMMAND_PARITY - Controls how device response to parity
> >> errors. QEMU ignores writes to this bit, we will do the same.
> >> 
> >> PCI_COMMAND_WAIT - Reserved. Should be 0, but QEMU passes
> >> through writes of this bit, so we will do the same.
> >> 
> >> PCI_COMMAND_SERR - Controls if device can assert SERR. QEMU ignores
> >> writes to this bit, we will do the same.
> >> 
> >> PCI_COMMAND_FAST_BACK - Optional bit that allows fast back-to-back
> >> transactions. It is configured by firmware, so we don't want guest to
> >> control it. QEMU ignores writes to this bit, we will do the same.
> >> 
> >> PCI_COMMAND_INTX_DISABLE - Disables INTx signals. If MSI(X) is
> >> enabled, device is prohibited from asserting INTx as per
> >> specification. Value after reset is 0. In QEMU case, it checks of INTx
> >> was mapped for a device. If it is not, then guest can't control
> >> PCI_COMMAND_INTX_DISABLE bit. In our case, we prohibit a guest to
> >> change value of this bit if MSI(X) is enabled.
> >
> > FWIW, bits 11-15 are RsvdP, so we will need to add support for them
> > after the series from Stewart that adds support for register masks is
> > accepted.
> 
> Stewart's series implement much better register handling than this
> patch. What about dropping this change at all in favor of Stewart's
> implementation? I'll be 100% okay with this.

That's fine.  I expect Stewart's series will go in quite soon, and
then we can likely rework this commit on top of them?

Thanks, Roger.

