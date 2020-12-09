Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599F82D441B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 15:24:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48305.85398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0OZ-00072p-L9; Wed, 09 Dec 2020 14:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48305.85398; Wed, 09 Dec 2020 14:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0OZ-00072Q-Hr; Wed, 09 Dec 2020 14:24:43 +0000
Received: by outflank-mailman (input) for mailman id 48305;
 Wed, 09 Dec 2020 14:24:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uDNN=FN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kn0OY-00072K-80
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 14:24:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a6fd15d-60c9-4eda-95ee-468e2be972c3;
 Wed, 09 Dec 2020 14:24:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7BF28ACEB;
 Wed,  9 Dec 2020 14:24:40 +0000 (UTC)
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
X-Inumbo-ID: 1a6fd15d-60c9-4eda-95ee-468e2be972c3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607523880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zmlaU1F8gUaCsK+uLZ8ZkMQZERSzre81kPuNpSJ0lB4=;
	b=PRLF+AwqoZ3tYdtdJ6ezgYdDDlONcsQg9m43iyd2mRF+fIZCYGmd66UzJf3Zz0eZDbIzVD
	RyUOKO4UxGzZVJWo3AJUxiW4OfX4mfJ4n9hgYR4xHvKjo0hpMYklWG/H61hDVymYEbzN3D
	ZsOsVufn6WlYR6waGQKV6H5stn9Ic9c=
Subject: Re: [PATCH v3 1/5] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d709a9c3-dbe2-65c6-2c2f-6a12f486335d@suse.com>
 <70170293-a9a7-282a-dde6-7ed73fc2da48@xen.org>
 <c15b1e7e-ed9c-b597-2fc1-b8cf89999c55@suse.com>
 <f14d147b-b218-a2ab-0b9e-06ece58d58e4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <606e6b73-6b4c-1044-0ee5-2887f1423448@suse.com>
Date: Wed, 9 Dec 2020 15:24:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f14d147b-b218-a2ab-0b9e-06ece58d58e4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 10:53, Julien Grall wrote:
> On 03/12/2020 09:46, Jan Beulich wrote:
>> On 02.12.2020 20:03, Julien Grall wrote:
>>> On 23/11/2020 13:28, Jan Beulich wrote:
>>>> The per-vCPU virq_lock, which is being held anyway, together with there
>>>> not being any call to evtchn_port_set_pending() when v->virq_to_evtchn[]
>>>> is zero, provide sufficient guarantees.
>>>
>>> I agree that the per-vCPU virq_lock is going to be sufficient, however
>>> dropping the lock also means the event channel locking is more complex
>>> to understand (the long comment that was added proves it).
>>>
>>> In fact, the locking in the event channel code was already proven to be
>>> quite fragile, therefore I think this patch is not worth the risk.
>>
>> I agree this is a very reasonable position to take. I probably
>> would even have remained silent if in the meantime the
>> spin_lock()s there hadn't changed to read_trylock()s. I really
>> think we want to limit this unusual locking model to where we
>> strictly need it.
> 
> While I appreciate that the current locking is unusual, we should follow 
> the same model everywhere rather than having a dozen of way to lock the 
> same structure.
> 
> The rationale is quite simple, if you have one way to lock a structure, 
> then there are less chance to screw up.

If only this all was consistent prior to this change. It's not, and
hence I don't see how things get so much more unusual than it was
before. In fact one "unusual" (the trylock) gets treated for another
one (the specific lock protecting the sending of VIRQ events).

Jan

