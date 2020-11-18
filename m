Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB922B7A28
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29625.59187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJZe-0004mm-2D; Wed, 18 Nov 2020 09:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29625.59187; Wed, 18 Nov 2020 09:16:22 +0000
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
	id 1kfJZd-0004mN-VR; Wed, 18 Nov 2020 09:16:21 +0000
Received: by outflank-mailman (input) for mailman id 29625;
 Wed, 18 Nov 2020 09:16:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfJZc-0004mI-GV
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:16:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 463154f0-1008-43ff-ba91-ff879c0ba7ec;
 Wed, 18 Nov 2020 09:16:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D45FABDE;
 Wed, 18 Nov 2020 09:16:17 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfJZc-0004mI-GV
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:16:20 +0000
X-Inumbo-ID: 463154f0-1008-43ff-ba91-ff879c0ba7ec
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 463154f0-1008-43ff-ba91-ff879c0ba7ec;
	Wed, 18 Nov 2020 09:16:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605690977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lG//nGhZJIqPebNGS4ELK9sxFv2Pa11V9G3faF2QRSY=;
	b=V60byJxcSYWvObFMqaSjb2N1HM1GuAwvPzlRDBPJ7T+ww+nkXuyF2kTvpAZpj8ATpAb12+
	44iZgB4tkz5XFrdj5NV8Wq7BJj35PD4eub7V7THP0RFQB3cgY9+OjDZAo9xglEQrQvDSIv
	nCQ4pFovYEzkVzAmXR3d07z/IQW3lMw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8D45FABDE;
	Wed, 18 Nov 2020 09:16:17 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20201117150949.GA3791@antioche.eu.org>
 <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
 <20201117164033.GB3093@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8039a29c-4058-ab6e-56ef-d1383deb7e38@suse.com>
Date: Wed, 18 Nov 2020 10:16:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201117164033.GB3093@antioche.eu.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.11.2020 17:40, Manuel Bouyer wrote:
> On Tue, Nov 17, 2020 at 04:58:07PM +0100, Roger Pau Monné wrote:
>> [...]
>>
>> I have attached a patch below that will dump the vIO-APIC info as part
>> of the 'i' debug key output, can you paste the whole output of the 'i'
>> debug key when the system stalls?
> 
> see attached file. Note that the kernel did unstall while 'i' output was
> being printed, so it is mixed with some NetBSD kernel output.

Could you try to run Xen's serial port without use of any IRQ
(i.e. in "polling" mode), in an attempt to avoid this unstalling
(which is likely to render the resulting output at least in part
meaningless)?

Jan

