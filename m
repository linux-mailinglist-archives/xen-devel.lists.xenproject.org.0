Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64B27E3E9
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 10:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.488.1557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXc5-0004SL-NF; Wed, 30 Sep 2020 08:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488.1557; Wed, 30 Sep 2020 08:37:25 +0000
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
	id 1kNXc5-0004Ru-Jn; Wed, 30 Sep 2020 08:37:25 +0000
Received: by outflank-mailman (input) for mailman id 488;
 Wed, 30 Sep 2020 08:37:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNXc3-0004Rm-Vm
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:37:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a53d5f2c-8dd9-4ee2-8b7c-1d06dcbf2c0c;
 Wed, 30 Sep 2020 08:37:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 926D5AE07;
 Wed, 30 Sep 2020 08:37:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNXc3-0004Rm-Vm
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:37:24 +0000
X-Inumbo-ID: a53d5f2c-8dd9-4ee2-8b7c-1d06dcbf2c0c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a53d5f2c-8dd9-4ee2-8b7c-1d06dcbf2c0c;
	Wed, 30 Sep 2020 08:37:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601455042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=StU4HTI6rG1Zrs0SGazdIDxyHhV9+xE+Yceb5fq5rCc=;
	b=BXptfEnVTiwo5NkTMVvJV6H5/k+LbWBEnk+jVXAVAeJWWam/8iuOL0/XbPHHzpNg263nzW
	dMdvbQmyElfsRviSOlKX7g6/JzLznojT5Burkyejh78U5/aDo5FhFo4iAQhoHxS4ueDfA1
	gFztSzxUVm+hHcnChqf6vqz7siK0f1s=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 926D5AE07;
	Wed, 30 Sep 2020 08:37:22 +0000 (UTC)
Subject: Re: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Stefano Stabellini' <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com>
 <004b01d696ff$76873e50$6395baf0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <92d2714b-d762-2f15-086f-58257e3336a8@suse.com>
Date: Wed, 30 Sep 2020 10:37:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <004b01d696ff$76873e50$6395baf0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 09:58, Paul Durrant wrote:
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
>> Sent: 28 September 2020 12:02
>>
>> @@ -334,6 +334,12 @@ void _spin_unlock_recursive(spinlock_t *
>>      }
>>  }
>>
>> +void _rw_barrier(rwlock_t *lock)
>> +{
>> +    check_barrier(&lock->lock.debug);
>> +    do { smp_mb(); } while ( _rw_is_locked(lock) );
>> +}
> 
> Should you not have a cpu_relax() somewhere in here?
> 
> TBH though, the fact this lock is never taken as a writer makes me
> wonder whether there needs to be a lock at all.

For both of these - see the discussion Julien and I also had. The
construct will now move to the subsequent patch anyway, and change
as per Julien's request.

Jan

