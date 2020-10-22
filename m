Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C70B8296284
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 18:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10552.28070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdHE-0004Li-0w; Thu, 22 Oct 2020 16:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10552.28070; Thu, 22 Oct 2020 16:17:19 +0000
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
	id 1kVdHD-0004LJ-Tt; Thu, 22 Oct 2020 16:17:19 +0000
Received: by outflank-mailman (input) for mailman id 10552;
 Thu, 22 Oct 2020 16:17:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVdHB-0004LE-M1
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:17:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04716776-590d-45eb-8db0-1f53653a127a;
 Thu, 22 Oct 2020 16:17:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5835AC23;
 Thu, 22 Oct 2020 16:17:15 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVdHB-0004LE-M1
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:17:17 +0000
X-Inumbo-ID: 04716776-590d-45eb-8db0-1f53653a127a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 04716776-590d-45eb-8db0-1f53653a127a;
	Thu, 22 Oct 2020 16:17:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603383436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E58KvwYuARR/Vx0qqHrGJc9ZoqrlGrPMgauEM1VCzb8=;
	b=I3YlhQZdqZmpAE6dPPtOiFm1sc7BPfOuYDXN84AE2YMjKRgI7QqWcdqaPfh0yNNmpq4NDd
	oGLClKeCj5nqWsivmh29UWQ/xs2aFsLRdpGIv73ME9e8C7hvvWbfUDFxPf0Mtvfz1tOAZr
	xCZPHpABCqA+no1Tagm150+A86HhOE4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E5835AC23;
	Thu, 22 Oct 2020 16:17:15 +0000 (UTC)
Subject: Re: [PATCH v2 5/8] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <53eb30ca-9b3f-0ef4-bc90-e1c196b716b3@suse.com>
 <20201022160055.nlucvj2bsxolxd5o@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dc7de861-a94c-3ef9-8dbd-ee7a5ba293c4@suse.com>
Date: Thu, 22 Oct 2020 18:17:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201022160055.nlucvj2bsxolxd5o@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.10.2020 18:00, Roger Pau Monné wrote:
> On Tue, Oct 20, 2020 at 04:10:09PM +0200, Jan Beulich wrote:
>> The per-vCPU virq_lock, which is being held anyway, together with there
>> not being any call to evtchn_port_set_pending() when v->virq_to_evtchn[]
>> is zero, provide sufficient guarantees.
> 
> This is also fine because closing the event channel will be done with
> the VIRQ hold held also AFAICT.

Right, I'm not going into these details (or else binding would also
need mentioning) here, as the code comment update should sufficiently
cover it. Hence just saying "sufficient guarantees".

>> --- a/xen/include/xen/event.h
>> +++ b/xen/include/xen/event.h
>> @@ -177,9 +177,16 @@ int evtchn_reset(struct domain *d, bool
>>   * Low-level event channel port ops.
>>   *
>>   * All hooks have to be called with a lock held which prevents the channel
>> - * from changing state. This may be the domain event lock, the per-channel
>> - * lock, or in the case of sending interdomain events also the other side's
>> - * per-channel lock. Exceptions apply in certain cases for the PV shim.
>> + * from changing state. This may be
>> + * - the domain event lock,
>> + * - the per-channel lock,
>> + * - in the case of sending interdomain events the other side's per-channel
>> + *   lock,
>> + * - in the case of sending non-global vIRQ-s the per-vCPU virq_lock (in
>> + *   combination with the ordering enforced through how the vCPU's
>> + *   virq_to_evtchn[] gets updated),
>> + * - in the case of sending global vIRQ-s vCPU 0's virq_lock.
>> + * Exceptions apply in certain cases for the PV shim.
> 
> Having such a wide locking discipline looks dangerous to me, it's easy
> to get things wrong without notice IMO.

It is effectively only describing how things are (or were before
XSA-343, getting restored here).

> Maybe we could add an assert to that effect in
> evtchn_port_set_pending in order to make sure callers follow the
> discipline?

Would be nice, but (a) see the last sentence of the comment still
in context above and (b) it shouldn't be just set_pending(). The
comment starts with "All hooks ..." after all.

Jan

