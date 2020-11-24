Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F92C2345
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 11:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35747.67378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khVtN-0000hd-Kc; Tue, 24 Nov 2020 10:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35747.67378; Tue, 24 Nov 2020 10:49:49 +0000
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
	id 1khVtN-0000hH-HP; Tue, 24 Nov 2020 10:49:49 +0000
Received: by outflank-mailman (input) for mailman id 35747;
 Tue, 24 Nov 2020 10:49:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khVtM-0000hC-6q
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 10:49:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83866c44-6cfc-4b1d-9389-28decc564439;
 Tue, 24 Nov 2020 10:49:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90026AC2E;
 Tue, 24 Nov 2020 10:49:46 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khVtM-0000hC-6q
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 10:49:48 +0000
X-Inumbo-ID: 83866c44-6cfc-4b1d-9389-28decc564439
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 83866c44-6cfc-4b1d-9389-28decc564439;
	Tue, 24 Nov 2020 10:49:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606214986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SZKSVVPjh9io3hX3hgPDkgrOGmXkV4LjTmpETkWhWZY=;
	b=QXVNwaZYwWYWmYk6q3ANbpcjuYogcFZ21uFBWS3oOFEXX7/ucgbJWHjqpslPb1oe9lwofR
	x/dlRw9DNqNc+mcsylgyZE7zI4y6xnse8e9eAeRr6Jl0kFnIyHighunt0A3FNz99zcc3U8
	dM285/xthwk1uucWjfsO3Gtstz/GacY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 90026AC2E;
	Tue, 24 Nov 2020 10:49:46 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Julien Grall <julien@xen.org>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <3740e147-719a-4e97-bb0e-fe9bd2ec2aa5@xen.org>
 <aa256a44-8f8f-d4f1-f5f4-12529f45d8c8@suse.com>
 <9007e08f-6d90-88ed-ba64-2f0b3c21cb50@xen.org>
 <8531a99d-3c54-36c7-0cd4-2e4838f96eb0@suse.com>
 <ba26fdfb-34f8-c4d3-e082-f1f49c768981@xen.org>
 <89F35B3F-FAAD-4C58-B3FD-F93CA3290A49@arm.com>
 <alpine.DEB.2.21.2011191534060.7979@sstabellini-ThinkPad-T480s>
 <CAJ=z9a0aS1G0F1jAtKNEe4r3tyBoxy1xJ9AV7pYgifsL62iqww@mail.gmail.com>
 <alpine.DEB.2.21.2011191551510.7979@sstabellini-ThinkPad-T480s>
 <6d2dae58-bfe5-596e-7850-a20ed54e1a81@xen.org>
 <7964507a-afc8-a548-5ea1-0182b6001cb1@suse.com>
 <a634e6c9-7ada-3739-8d8f-00c53bcd2815@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32524f30-acb1-04d7-b69d-6e881f45f5ae@suse.com>
Date: Tue, 24 Nov 2020 11:49:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a634e6c9-7ada-3739-8d8f-00c53bcd2815@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.11.2020 11:22, Julien Grall wrote:
> On 24/11/2020 09:47, Jan Beulich wrote:
>> On 23.11.2020 18:13, Julien Grall wrote:
>>> My view on 2) can change if Jan provides enough information into why one
>>> would want NS1650 PCI enabled by default on Arm but disable MSI.
>>
>> Because, like it was on x86, initially there may be no support for
>> MSI?
> 
> "no support for MSI" implies that there will be at least support for 
> NS16550 PCI.
> 
>>  I have no idea what the plans are ...
> 
> There are no such plan on Arm for the forseeable future (read as we 
> haven't seen any interested from the Arm community).

Okay, so you're question wasn't so much about the "but" in there,
but the "PCI" in the first place.

> The NS16550 PCI code will stay unusable until someone effectively send a 
> patch to plumb it correctly.
> 
> While I agree that disabling MSI may be nice to have to do in the 
> future, this doesn't address the need for Arm. I don't want to get in 
> our way the NS16550 PCI code in our way when implementing PCI (with or 
> without MSI) on Arm.
> 
> Even if there were an interest, I would still expect some users (e.g. 
> embedded folks) to want to compile-out unused feature (you may have a 
> platform with a embedded NS16550).
> 
> So the path forward will stay either 1) or 3) for me.

Well, as said elsewhere - 3) it is then afaic, for making more
obvious that this is really a hack.

Jan

