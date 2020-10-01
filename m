Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC4280088
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 15:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290.4345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNz1E-0002ji-48; Thu, 01 Oct 2020 13:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290.4345; Thu, 01 Oct 2020 13:53:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNz1E-0002jJ-0g; Thu, 01 Oct 2020 13:53:12 +0000
Received: by outflank-mailman (input) for mailman id 1290;
 Thu, 01 Oct 2020 13:53:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VHLv=DI=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kNz1C-0002jE-FF
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 13:53:10 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fe44ec7-aa2d-4ae7-af51-5a6dd8c21b65;
 Thu, 01 Oct 2020 13:53:08 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VHLv=DI=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
	id 1kNz1C-0002jE-FF
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 13:53:10 +0000
X-Inumbo-ID: 8fe44ec7-aa2d-4ae7-af51-5a6dd8c21b65
Received: from galois.linutronix.de (unknown [193.142.43.55])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8fe44ec7-aa2d-4ae7-af51-5a6dd8c21b65;
	Thu, 01 Oct 2020 13:53:08 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1601560387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8QlmQU4U707WUFGOJ0XG+Q1YjhMDkPVgYfkVUA/WoFc=;
	b=jDpfVmtaeTkDdW/IvYOq5JTlvoEDvMPuXHKdBkqxDhj9NtP6sTCT7g/kMy5ECqhZUGy2+4
	++hAJ4Lf+UXj9X848nWTQXsWOUQwa0nSp8X6CBBBUzXU5W59I9y+JhIX+EAI1RusI4giOx
	WoE//JGbOJ/9aovK5UwQd1DPj/14mcwlcfKH5BL9ZmpEPYc59kRKDsf6dp6TQ7Zewxpo4q
	yL8kwmNhWt7cTao5A/py29YkkltUhHrvrLanp3xl0L310qxEaveU9Sh4MqjbrIFJvjOInj
	eMAYvmm8xoIqfs4bQEuXBHHNbgDKRhrRhhHHt1xe5fMSTnynEXYGFUqVvcIPNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1601560387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8QlmQU4U707WUFGOJ0XG+Q1YjhMDkPVgYfkVUA/WoFc=;
	b=VUPBvkhvJ43I0rw6XwXLBzv6cBppoaj+or1uLt5D2g6BaWB0D6BqJUpq/u8iIurpo4fr5G
	aeKaeW8Pag4Xo9Bg==
To: Zi Yan <ziy@nvidia.com>
Cc: Wei Liu <wei.liu@kernel.org>, Joerg Roedel <jroedel@suse.de>, x86@kernel.org, iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: Boot crash due to "x86/msi: Consolidate MSI allocation"
In-Reply-To: <2F4EC354-C0BB-44BD-86A5-07F321590C31@nvidia.com>
References: <A838FF2B-11FC-42B9-87D7-A76CF46E0575@nvidia.com> <874knegxtg.fsf@nanos.tec.linutronix.de> <2F4EC354-C0BB-44BD-86A5-07F321590C31@nvidia.com>
Date: Thu, 01 Oct 2020 15:53:07 +0200
Message-ID: <87h7ref3y4.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

Yan,

On Thu, Oct 01 2020 at 09:39, Zi Yan wrote:
> On 1 Oct 2020, at 4:22, Thomas Gleixner wrote:
>> Can you please test:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/irq
>>
>> which contains fixes and if it still crashes provide the dmesg of it.
>
> My system boots without any problem using this tree. Thanks.

linux-next of today contains these fixes, so that should work now as
well.

Thanks,

        tglx

