Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6272A2C2202
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 10:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35628.67263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khUv4-0002wB-Mv; Tue, 24 Nov 2020 09:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35628.67263; Tue, 24 Nov 2020 09:47:30 +0000
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
	id 1khUv4-0002vm-Jh; Tue, 24 Nov 2020 09:47:30 +0000
Received: by outflank-mailman (input) for mailman id 35628;
 Tue, 24 Nov 2020 09:47:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khUv3-0002vh-2y
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 09:47:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44f65819-0046-4281-8cc3-522bbbf70572;
 Tue, 24 Nov 2020 09:47:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56831AC82;
 Tue, 24 Nov 2020 09:47:27 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khUv3-0002vh-2y
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 09:47:29 +0000
X-Inumbo-ID: 44f65819-0046-4281-8cc3-522bbbf70572
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 44f65819-0046-4281-8cc3-522bbbf70572;
	Tue, 24 Nov 2020 09:47:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606211247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LiSYqbycaoO6blIlW/yxLnvgHN1iPAknpNf1F9ygPtg=;
	b=BW4wk/Nyl+Hn7F8xk9n3XgDyRafCTrN0F6yluJ/8hmeXfS4I2pWdDSmaJoYftC9dlh0l8F
	j31U+l8Wjvx426X1dy/PeZWFGQKzmG+E/SPBGMINR8Xpi6rA5Lco5j0RMKSSVoxf5BqRHO
	Ruje8W2NgfVIV/3Pokl0BQxMV8RvqMk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 56831AC82;
	Tue, 24 Nov 2020 09:47:27 +0000 (UTC)
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7964507a-afc8-a548-5ea1-0182b6001cb1@suse.com>
Date: Tue, 24 Nov 2020 10:47:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <6d2dae58-bfe5-596e-7850-a20ed54e1a81@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.11.2020 18:13, Julien Grall wrote:
> My view on 2) can change if Jan provides enough information into why one 
> would want NS1650 PCI enabled by default on Arm but disable MSI.

Because, like it was on x86, initially there may be no support for
MSI? I have no idea what the plans are ...

Jan

