Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F1F294D0F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 14:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10063.26504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVDc5-0003hZ-OQ; Wed, 21 Oct 2020 12:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10063.26504; Wed, 21 Oct 2020 12:53:09 +0000
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
	id 1kVDc5-0003hA-LN; Wed, 21 Oct 2020 12:53:09 +0000
Received: by outflank-mailman (input) for mailman id 10063;
 Wed, 21 Oct 2020 12:53:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVDc4-0003h5-AC
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 12:53:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5604dd80-3872-47fb-a6d5-ec577dc41bce;
 Wed, 21 Oct 2020 12:53:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A251B007;
 Wed, 21 Oct 2020 12:53:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVDc4-0003h5-AC
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 12:53:08 +0000
X-Inumbo-ID: 5604dd80-3872-47fb-a6d5-ec577dc41bce
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5604dd80-3872-47fb-a6d5-ec577dc41bce;
	Wed, 21 Oct 2020 12:53:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603284784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YW4GeGaaq+R5j4BAU33aDFRNJQJgkt5cTgR3nwU6Kfk=;
	b=OEqS13xgP1xXGjTUMzbe2fkZ/2Iio2FsHeiJFz4rLyhRrrh5qUESVn1RyzT9eHvgC/xWCA
	XcXw5frSoysAC2VTooKZTpEcXbPXp+3NdlYSc4vF5Iygr5KSgpZykL7dtaeiDFYRw5riEU
	U+Z+RJboJaB1kQHNKEX98jVaJgE6H2o=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1A251B007;
	Wed, 21 Oct 2020 12:53:04 +0000 (UTC)
Subject: Re: i915 dma faults on Xen
To: Jason Andryuk <jandryuk@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, intel-gfx@lists.freedesktop.org,
 xen-devel <xen-devel@lists.xenproject.org>
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com>
 <20201015113109.GA68032@Air-de-Roger>
 <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
 <CAKf6xps1q9zMBeFg7C7ZhD-JcwQ6EG6+bYvvA9QT8PzzxKqMNg@mail.gmail.com>
 <20201021095809.o53b6hpvjl2lbqsi@Air-de-Roger>
 <CAKf6xpuTE4gBNe4YXPYh_hAMLaJduDuKL5_6aC4H=y6DRxaxvw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a4dd7778-9bd4-00c1-3056-96d435b70d70@suse.com>
Date: Wed, 21 Oct 2020 14:52:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAKf6xpuTE4gBNe4YXPYh_hAMLaJduDuKL5_6aC4H=y6DRxaxvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.10.2020 14:45, Jason Andryuk wrote:
> On Wed, Oct 21, 2020 at 5:58 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>> Hm, it's hard to tell what's going on. My limited experience with
>> IOMMU faults on broken systems there's a small range that initially
>> triggers those, and then the device goes wonky and starts accessing a
>> whole load of invalid addresses.
>>
>> You could try adding those manually using the rmrr Xen command line
>> option [0], maybe you can figure out which range(s) are missing?
> 
> They seem to change, so it's hard to know.  Would there be harm in
> adding one to cover the end of RAM ( 0x04,7c80,0000 ) to (
> 0xff,ffff,ffff )?  Maybe that would just quiet the pointless faults
> while leaving the IOMMU enabled?

While they may quieten the faults, I don't think those faults are
pointless. They indicate some problem with the software (less
likely the hardware, possibly the firmware) that you're using.
Also there's the question of what the overall behavior is going
to be when devices are permitted to access unpopulated address
ranges. I assume you did check already that no devices have their
BARs placed in that range?

Jan

