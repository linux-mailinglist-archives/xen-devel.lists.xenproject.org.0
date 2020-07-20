Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E0022580E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 09:00:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxPmf-0007WU-Bq; Mon, 20 Jul 2020 07:00:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxPmd-0007Vy-7s
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 07:00:19 +0000
X-Inumbo-ID: ab20566c-ca56-11ea-b7bb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab20566c-ca56-11ea-b7bb-bc764e2007e4;
 Mon, 20 Jul 2020 07:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595228417;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iocUiLLkBYzmKPC2eRpkZG7AYNH60rAT4JdmVZHSVYI=;
 b=P54pA7JTa5AVxoGo31xLDSpAaP1U6i6Mlikf0HrY97+fulHjdbVnWBST
 Ki80AzOadTllL0nbcRrpxHXeWq58oF8y/LCsky1SOKl4MJ6seKgUlrm2u
 qZ1N+78M3hMF0tOhBIC/mK0/WlKFV8uE/VJg6dEUysiyUDExTZdfTznqQ o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /gN7WqqKMJp6DphdnbH3646GayPWugXN2z7lX3DaOu/rqxip3pi0Rt6q+l8nYseSfImDaP042B
 GLnm/tXMDfhycdNLyKczfOd0N3dyLZVUzJKLqTlnKZWd+Uisbjzv4THhAFvmQWc6eYraS60VLv
 5c8YpjAgOkzktrR47dWhYgWPn/DVTTx0McYd3/np8rm0jK73Ox+dlq/Jao8VxoN8CSl6Q/T2kC
 Yy8IS/tIxEVbKlepzr8TukNUHa7ZWmKOEPs9dAmVM6FDSLnueJxgfsuYnLEB85lZuHmJvjbjGy
 vKo=
X-SBRS: 2.7
X-MesageID: 23056731
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="23056731"
Date: Mon, 20 Jul 2020 09:00:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SmFyb23DrXIgRG9sZcSNZWs=?= <jaromir.dolecek@gmail.com>
Subject: Re: Advice for implementing MSI-X support on NetBSD Xen 4.11?
Message-ID: <20200720070010.GC7191@Air-de-Roger>
References: <CAMnsW5542gmBLpKBsW5pnm=2VXmaDVHzg=OXXvBdu1BsYLdDvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMnsW5542gmBLpKBsW5pnm=2VXmaDVHzg=OXXvBdu1BsYLdDvQ@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Jul 19, 2020 at 05:54:28PM +0200, Jaromír Doleček wrote:
> Hello,
> 
> I've implemented support for using MSI under NetBSD Dom0 with 4.11.
> This works well.
> 
> I have some trouble now with getting MSI-X work under Xen.
> PHYSDEVOP_map_pirq hypercall succeeds just as well as for MSI, but
> interrupts don't seem to get delivered.

How are you filling physdev_map_pirq for MSI-X?

You need to set entry_nr and table_base.

> MSI-X interrupts work with NetBSD for the same devices when booted
> natively, without Xen.
> 
> Can you give me some advice on where to start looking to get this
> working? Is there perhaps something special to be done within the PCI
> subsystem to allow Xen to take over?

Are you enabling the capability and unmasking the interrupt in the
MSI-X table?

IIRC the OS also needs to unmask the entry in the MSI-X table in MMIO
space, as done natively.

There are also the Xen debug keys which can be helpful, take a look at
'i' and 'M'.

Roger.

