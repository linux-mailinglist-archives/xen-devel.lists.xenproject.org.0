Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DC62A04E1
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 13:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15719.38811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYT4t-0002ny-NU; Fri, 30 Oct 2020 12:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15719.38811; Fri, 30 Oct 2020 12:00:19 +0000
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
	id 1kYT4t-0002nb-KI; Fri, 30 Oct 2020 12:00:19 +0000
Received: by outflank-mailman (input) for mailman id 15719;
 Fri, 30 Oct 2020 12:00:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYT4s-0002nV-5d
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:00:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7946771c-ec0b-41b9-9dd2-ea30ef44ff6f;
 Fri, 30 Oct 2020 12:00:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 922E1B1D8;
 Fri, 30 Oct 2020 12:00:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYT4s-0002nV-5d
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:00:18 +0000
X-Inumbo-ID: 7946771c-ec0b-41b9-9dd2-ea30ef44ff6f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7946771c-ec0b-41b9-9dd2-ea30ef44ff6f;
	Fri, 30 Oct 2020 12:00:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604059216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a6v5bSldP6LxUk4SPvkNoZRxRbEP6y7Xg4TcgakFXtw=;
	b=s4ApBVOkh33pr8QoSOFCHAyWyTnTFQdUtAORI7kJtnxYKR/SWcfDq4gVpFjzhb/SNBb3lo
	NVCX81m+/5VQoQo9A+S1icMdLqoT2ur/TzHJnhyiK0M7Jroxt/e0xGhnjFBXN0Opwj5i5h
	Sza/Z8jy/AlIvXi6hS5H9mwS33hg0Qk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 922E1B1D8;
	Fri, 30 Oct 2020 12:00:16 +0000 (UTC)
Subject: Re: [PATCH v2 6/8] evtchn: convert vIRQ lock to an r/w one
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <53a2fc39-1bf1-38ce-bbdf-b512c5279b4f@suse.com>
 <6dec1d48-b8c8-6122-087c-38f36f30596e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33ff45e9-d869-9262-29e0-fa66e3ffb726@suse.com>
Date: Fri, 30 Oct 2020 13:00:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6dec1d48-b8c8-6122-087c-38f36f30596e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.10.2020 11:57, Julien Grall wrote:
> On 20/10/2020 15:10, Jan Beulich wrote:
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -449,6 +449,13 @@ int evtchn_bind_virq(evtchn_bind_virq_t
>>   
>>       spin_unlock_irqrestore(&chn->lock, flags);
>>   
>> +    /*
>> +     * If by any, the update of virq_to_evtchn[] would need guarding by
>> +     * virq_lock, but since this is the last action here, there's no strict
>> +     * need to acquire the lock. Hnece holding event_lock isn't helpful
> 
> s/Hnece/Hence/
> 
>> +     * anymore at this point, but utilize that its unlocking acts as the
>> +     * otherwise necessary smp_wmb() here.
>> +     */
>>       v->virq_to_evtchn[virq] = bind->port = port;
> 
> I think all access to v->virq_to_evtchn[virq] should use ACCESS_ONCE() 
> or {read, write}_atomic() to avoid any store/load tearing.

IOW you're suggesting this to be the subject of a separate patch?
I don't think such a conversion belongs here (nor even in this
series, seeing the much wider applicability of such a change
throughout the code base). Or are you seeing anything here which
would require such a conversion to be done as a prereq?

Jan

