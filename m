Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799472A41E1
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:30:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18201.43103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtZu-0002XN-FG; Tue, 03 Nov 2020 10:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18201.43103; Tue, 03 Nov 2020 10:30:14 +0000
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
	id 1kZtZu-0002Wy-BK; Tue, 03 Nov 2020 10:30:14 +0000
Received: by outflank-mailman (input) for mailman id 18201;
 Tue, 03 Nov 2020 10:30:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZtZs-0002Wn-C2
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:30:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3a8be889-3d9d-4cb6-8d6e-7400351fef8e;
 Tue, 03 Nov 2020 10:30:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E264DAC1F;
 Tue,  3 Nov 2020 10:30:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZtZs-0002Wn-C2
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:30:12 +0000
X-Inumbo-ID: 3a8be889-3d9d-4cb6-8d6e-7400351fef8e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 3a8be889-3d9d-4cb6-8d6e-7400351fef8e;
	Tue, 03 Nov 2020 10:30:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604399411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4mv0BeQ5SnZL8dczHZZVGsgXftnVKtTXzRs2eUJ1Vg=;
	b=hTaaV4G/HWT/ViHh9aFm/U27wGBspuZ3QTFVnlkOrk/iUXlThpFPWsMPi0lBTvDeB5zNWv
	nIRCe1zCdgiO2AmYogTXWMXRgyBUFn/hhsVzVXEje8BmK9j7ZzOEOABR9l/AcyNQ5xpNmI
	Mbaam4DSwlgHxIl6BPkGadjE9JS/fRA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E264DAC1F;
	Tue,  3 Nov 2020 10:30:10 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] xen/rwlock: add check_lock() handling to rwlocks
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201102131239.14134-1-jgross@suse.com>
 <20201102131239.14134-3-jgross@suse.com>
 <fb3a1a5a-15ea-218f-a6d8-8e9d8d1bc2a7@suse.com>
 <890b6547-ca4f-b195-6b9d-9078ba35c357@suse.com>
 <fe41300c-3013-73ae-7ffa-7cd36705d0c2@suse.com>
 <4e0d3709-1a0a-4dbd-436d-b22a4736ac0d@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8f837077-5c3a-0ec1-75e6-d467bf77ab10@suse.com>
Date: Tue, 3 Nov 2020 11:30:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4e0d3709-1a0a-4dbd-436d-b22a4736ac0d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.11.2020 11:17, Jürgen Groß wrote:
> On 03.11.20 11:04, Jan Beulich wrote:
>> This said - wouldn't what you suggest be wrong if we had
>> actual preemption in the hypervisor? Preemption hitting
>> between e.g. these two lines
>>
>>      cnts = atomic_read(&lock->cnts);
>>      if ( likely(_can_read_lock(cnts)) )
>>
>> would not yield the intended result, would it? (It wouldn't
>> affect correctness afaics, because the caller has to be
>> prepared anyway that the attempt fails, but the amount of
>> effectively false negatives would grow, as would the number
>> of cases where the slower path is taken for no reason.)
> 
> And this in turn would hit _spin_trylock() the same way.

True.

> IMO we should harmonize all the trylock variants in this regard:
> either they have an as small as possible preemption disabled
> section or they have the initial test for success being possible
> at all in this section.
> 
>> Question therefore is how much we care about keeping code
>> ready for "real" preemption, when we have ample other places
>> that would need changing first, before such could be enabled.
> 
> Yes. And depending on the answer the route to go (wide or narrow
> no-preemption section) wither the rwlock or the spinlock trylock
> variants should be adapted.

Well, personally I'd slightly prefer the adjustment as you did
suggest, but Julien's subsequent reply points towards the other
direction.

Jan

