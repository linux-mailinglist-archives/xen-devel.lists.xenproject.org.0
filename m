Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA9E28CFF4
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:13:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6247.16646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSL3R-0000dh-8B; Tue, 13 Oct 2020 14:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6247.16646; Tue, 13 Oct 2020 14:13:29 +0000
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
	id 1kSL3R-0000dA-4J; Tue, 13 Oct 2020 14:13:29 +0000
Received: by outflank-mailman (input) for mailman id 6247;
 Tue, 13 Oct 2020 14:13:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dmgz=DU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kSL3P-0000ch-Fk
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:13:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a3830f8-3d91-41ec-93b7-454e54637145;
 Tue, 13 Oct 2020 14:13:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3503AB91;
 Tue, 13 Oct 2020 14:13:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Dmgz=DU=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kSL3P-0000ch-Fk
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:13:27 +0000
X-Inumbo-ID: 1a3830f8-3d91-41ec-93b7-454e54637145
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1a3830f8-3d91-41ec-93b7-454e54637145;
	Tue, 13 Oct 2020 14:13:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602598406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mEgVzHXMYRaJZjS7Ul7xP+hcSYdshpyzSRY18kHJAQQ=;
	b=PsTE0iwKU0qkFL7dfyJ2thcubtoiGkghD3lsZjzbCudgOi8bYDPoEDTGNXq96JWZdKiMGG
	YXikZ1f2OEuK2OFJKSugRIupmvSDYApPBeD91ppER9WSwyWYD/T0Ak9oAmlczPJkL8X3K6
	5MHl2uB5UfacQLoitxHcRzR+PuiV95g=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D3503AB91;
	Tue, 13 Oct 2020 14:13:25 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] xen/evtchn: rework per event channel lock
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-3-jgross@suse.com>
 <3a15ba70-c6b1-dd07-12fe-f8d7a1e6c4d9@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <68aea3f2-21ef-8fbf-e1ad-c404e69a8b8e@suse.com>
Date: Tue, 13 Oct 2020 16:13:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3a15ba70-c6b1-dd07-12fe-f8d7a1e6c4d9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.10.20 16:02, Jan Beulich wrote:
> On 12.10.2020 11:27, Juergen Gross wrote:
>> Currently the lock for a single event channel needs to be taken with
>> interrupts off, which causes deadlocks in some cases.
>>
>> Rework the per event channel lock to be non-blocking for the case of
>> sending an event and removing the need for disabling interrupts for
>> taking the lock.
>>
>> The lock is needed for avoiding races between sending an event or
>> querying the channel's state against removal of the event channel.
>>
>> Use a locking scheme similar to a rwlock, but with some modifications:
>>
>> - sending an event or querying the event channel's state uses an
>>    operation similar to read_trylock(), in case of not obtaining the
>>    lock the sending is omitted or a default state is returned
> 
> And how come omitting the send or returning default state is valid?

This is explained in the part of the commit message you didn't cite:

With this locking scheme it is mandatory that a writer will always
either start with an unbound or free event channel or will end with
an unbound or free event channel, as otherwise the reaction of a reader
not getting the lock would be wrong.


Juergen

