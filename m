Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5D52A0306
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 11:39:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15623.38641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYRo7-0002Cq-Vf; Fri, 30 Oct 2020 10:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15623.38641; Fri, 30 Oct 2020 10:38:55 +0000
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
	id 1kYRo7-0002CR-S7; Fri, 30 Oct 2020 10:38:55 +0000
Received: by outflank-mailman (input) for mailman id 15623;
 Fri, 30 Oct 2020 10:38:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYRo5-0002CM-M8
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:38:54 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 043ca3fa-10f5-4f2f-8056-0a673f111ccb;
 Fri, 30 Oct 2020 10:38:52 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYRo1-0005mX-Bs; Fri, 30 Oct 2020 10:38:49 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYRo1-0006si-3o; Fri, 30 Oct 2020 10:38:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYRo5-0002CM-M8
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:38:54 +0000
X-Inumbo-ID: 043ca3fa-10f5-4f2f-8056-0a673f111ccb
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 043ca3fa-10f5-4f2f-8056-0a673f111ccb;
	Fri, 30 Oct 2020 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=QPM77mtT2Mx+UDN84JkKmfxgmqVv4FugrhbPhn5XY4Q=; b=rieRRL/kJmuDfMsDLlFAypoNJ3
	MjVho9TLjwwhmHqvi26BEYr5hOpbIEjFk/JdHxhch9Yfq6f8+Ck7T9+ASYkR8If7cjNoC3yDPR+4J
	mYk+qWQY9AViPctASittakzpz12MRR8WN+CyJg7qIDApWLWs4ipbT5rYrNBZQo1t22xo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYRo1-0005mX-Bs; Fri, 30 Oct 2020 10:38:49 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYRo1-0006si-3o; Fri, 30 Oct 2020 10:38:49 +0000
Subject: Re: [PATCH v2 5/8] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <53eb30ca-9b3f-0ef4-bc90-e1c196b716b3@suse.com>
 <20201022160055.nlucvj2bsxolxd5o@Air-de-Roger>
 <dc7de861-a94c-3ef9-8dbd-ee7a5ba293c4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dbb776ad-5b0c-c0a7-8f01-66e60fd7fad9@xen.org>
Date: Fri, 30 Oct 2020 10:38:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <dc7de861-a94c-3ef9-8dbd-ee7a5ba293c4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 22/10/2020 17:17, Jan Beulich wrote:
> On 22.10.2020 18:00, Roger Pau Monné wrote:
>> On Tue, Oct 20, 2020 at 04:10:09PM +0200, Jan Beulich wrote:
>>> The per-vCPU virq_lock, which is being held anyway, together with there
>>> not being any call to evtchn_port_set_pending() when v->virq_to_evtchn[]
>>> is zero, provide sufficient guarantees.
>>
>> This is also fine because closing the event channel will be done with
>> the VIRQ hold held also AFAICT.
> 
> Right, I'm not going into these details (or else binding would also
> need mentioning) here, as the code comment update should sufficiently
> cover it. Hence just saying "sufficient guarantees".
> 
>>> --- a/xen/include/xen/event.h
>>> +++ b/xen/include/xen/event.h
>>> @@ -177,9 +177,16 @@ int evtchn_reset(struct domain *d, bool
>>>    * Low-level event channel port ops.
>>>    *
>>>    * All hooks have to be called with a lock held which prevents the channel
>>> - * from changing state. This may be the domain event lock, the per-channel
>>> - * lock, or in the case of sending interdomain events also the other side's
>>> - * per-channel lock. Exceptions apply in certain cases for the PV shim.
>>> + * from changing state. This may be
>>> + * - the domain event lock,
>>> + * - the per-channel lock,
>>> + * - in the case of sending interdomain events the other side's per-channel
>>> + *   lock,
>>> + * - in the case of sending non-global vIRQ-s the per-vCPU virq_lock (in
>>> + *   combination with the ordering enforced through how the vCPU's
>>> + *   virq_to_evtchn[] gets updated),
>>> + * - in the case of sending global vIRQ-s vCPU 0's virq_lock.
>>> + * Exceptions apply in certain cases for the PV shim.
>>
>> Having such a wide locking discipline looks dangerous to me, it's easy
>> to get things wrong without notice IMO.
> 
> It is effectively only describing how things are (or were before
> XSA-343, getting restored here).

I agree with Roger here, the new/old locking discipline is dangerous and 
it is only a matter of time before it will bite us again.

I think we should consider Juergen's series because the locking for the 
event channel is easier to understand.

With his series in place, this patch will become unecessary.

Cheers,

-- 
Julien Grall

