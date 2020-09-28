Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F22C27A6B3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 07:02:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMlIt-0004qP-Rx; Mon, 28 Sep 2020 05:02:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vyro=DF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kMlIs-0004qK-M1
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 05:02:22 +0000
X-Inumbo-ID: ee4ed926-a265-42fa-b6e8-9268fb6da3fe
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee4ed926-a265-42fa-b6e8-9268fb6da3fe;
 Mon, 28 Sep 2020 05:02:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601269340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rxnAUlcW+c8s9Zamrhw0M/6zu/bkDouk22bA14g5DY=;
 b=J1vchcQfxzo7NWAx2bYIFRLbsBRDxS8XoVmiLTJQmmI00QuDugwAPI9VNLDd70kxoJx8d/
 ZVCTxdgTUVwhtIhPbEC66wZ5bshbM58A+7ch2hBGIDZYDsC8FkeSQRyi9wpym1jr45esQ7
 sC8B6s3Gbg1uynjQRyOkoaFatX9+YZM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CEE6AD73;
 Mon, 28 Sep 2020 05:02:20 +0000 (UTC)
Subject: Re: Kernel panic on 'floppy' module load, Xen HVM, since 4.19.143
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Denis Efremov <efremov@linux.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Roman Shaposhnik <roman@zededa.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20200927111405.GJ3962@mail-itl>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <26fe7920-d6a8-fb8a-b97c-59565410eff4@suse.com>
Date: Mon, 28 Sep 2020 07:02:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200927111405.GJ3962@mail-itl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.09.20 13:14, Marek Marczykowski-Górecki wrote:
> Hi all,
> 
> I get kernel panic on 'floppy' module load. If I blacklist the module,
> then everything works.
> The issue happens in Xen HVM, other virtualization modes (PV, PVH) works
> fine. PV dom0 works too. I haven't tried bare metal, but I assume it
> works fine too.

Could you please try bare metal?

Working in PV and PVH mode, but not in HVM, is pointing towards either
an issue in IRQ handling (not Xen specific) or in qemu.

It might be that Xen is advertising a rarely used APIC mode. In case
bare metal is working it might be helpful to have APIC related boot
message differences between HVM guest and bare metal.


Juergen

