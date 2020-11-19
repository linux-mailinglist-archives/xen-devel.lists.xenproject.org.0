Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7B42B8E46
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 09:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30472.60497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kffk6-0006Ud-7n; Thu, 19 Nov 2020 08:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30472.60497; Thu, 19 Nov 2020 08:56:38 +0000
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
	id 1kffk6-0006UE-42; Thu, 19 Nov 2020 08:56:38 +0000
Received: by outflank-mailman (input) for mailman id 30472;
 Thu, 19 Nov 2020 08:56:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kffk3-0006U6-Vk
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 08:56:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca522530-b50e-4a14-bfc8-aa1572bfdbec;
 Thu, 19 Nov 2020 08:56:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82E77AD2B;
 Thu, 19 Nov 2020 08:56:34 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kffk3-0006U6-Vk
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 08:56:36 +0000
X-Inumbo-ID: ca522530-b50e-4a14-bfc8-aa1572bfdbec
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ca522530-b50e-4a14-bfc8-aa1572bfdbec;
	Thu, 19 Nov 2020 08:56:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605776194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6qvxojLQTTwxD4oZzQweUGM/Nhj49DOzWVTHUZReTyQ=;
	b=DCmLNEQyfn+RELETGw0W2hYGcRaNaZRML99OC077SqnfUgzUDHgeuVgQnq+voOX5AI3jYc
	fhaEp+zOnT7va6o2Tiar8fW67gqnrvly+d2os9FoZNuHegtcOJYpFm9AfM+26FyKdftOFG
	T4jqsijCCIjLRJ6BIy0t+bUJkLL1Hk0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 82E77AD2B;
	Thu, 19 Nov 2020 08:56:34 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <bd5fa7bb-7c44-1ec0-fc57-3ecf01c7d651@suse.com>
 <CBBE4253-F244-418D-9EA6-BC39D1BC8DF8@arm.com>
 <1530c2fb-8def-37eb-8a22-d7f9fc4e38b4@suse.com>
 <0946edb2-c2c1-0d3d-c8ff-f24055f78ebf@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2fa74dd2-1ee3-3c59-c711-2dbfd5119c00@suse.com>
Date: Thu, 19 Nov 2020 09:56:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <0946edb2-c2c1-0d3d-c8ff-f24055f78ebf@xen.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.2020 16:35, Julien Grall wrote:
> So even we are going to enable PCI on Arm and fix compilation issue, 
> there are no way the NS16550 PCI would be usuable without effort for a 
> few reasons:
> 
>    1) com1/com2 is x86 specific
>    2) ns16550_init() is not used by Arm and the only way to use a PCI UART

This is a good observation, and I wasn't aware of this. I'm sending
a patch which ...

>    3) UART is discovered through the device-tree/ACPI tables on Arm
> 
> So I think CONFIG_HAS_NS16550_PCI is most suitable solution and we 
> should probably guard more code (e.g. ns16550_init(), com1, com2...).

... hopefully fulfills this (to be considered a prereq to Rahul's
series then).

Jan

