Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F7E34D39C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 17:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103103.196733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQthR-0000l2-F4; Mon, 29 Mar 2021 15:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103103.196733; Mon, 29 Mar 2021 15:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQthR-0000kh-BQ; Mon, 29 Mar 2021 15:21:05 +0000
Received: by outflank-mailman (input) for mailman id 103103;
 Mon, 29 Mar 2021 15:21:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lQthP-0000kc-Ly
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 15:21:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97acd249-0fb7-46b8-9aa2-f3523e0a8ec1;
 Mon, 29 Mar 2021 15:21:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A678AFFA;
 Mon, 29 Mar 2021 15:21:02 +0000 (UTC)
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
X-Inumbo-ID: 97acd249-0fb7-46b8-9aa2-f3523e0a8ec1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617031262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eP0p5MJOJG96G3XTTMmo1I6MJVX4Kifn8MnIPa1xTlw=;
	b=kbH1xqsQqS12s4CxCnK9QQEGm02xAoLXfmAL/ZXe1Ovqry8cDyMgQQ11BqZbZgLB+Zil7I
	yWzhZZOwiaxc1WqxUBXx2S400p8DvvBc0s81oYrkcWOGEeJqK1f5qojx1Tv/LZvZU5dhwF
	fhAyeK1TvusJWG2TRDGFO2iEvpZgFw4=
Subject: Re: [PATCH v2] x86/vpt: Do not take pt_migrate rwlock in some cases
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: andrew.cooper3@citrix.com, wl@xen.org, stephen.s.brennan@oracle.com,
 iwj@xenproject.org, xen-devel@lists.xenproject.org, roger.pau@citrix.com
References: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
 <82868938-bf57-25c2-38f6-1ec8e9c92362@suse.com>
 <bd430cc4-4c57-e479-14e0-0b62754147c1@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e5776eb6-5093-019b-43a0-167fa7924158@suse.com>
Date: Mon, 29 Mar 2021 17:21:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bd430cc4-4c57-e479-14e0-0b62754147c1@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.03.2021 17:04, Boris Ostrovsky wrote:
> On 3/29/21 5:56 AM, Jan Beulich wrote:
>> On 27.03.2021 02:51, Boris Ostrovsky wrote:
>>> @@ -580,13 +593,22 @@ static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
>>>          return;
>>>  
>>>      write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>>> +
>>> +    pt_vcpu_lock(pt->vcpu);
>>> +    if ( pt->on_list )
>>> +        list_del(&pt->list);
>>> +    pt_vcpu_unlock(pt->vcpu);
>> While these two obviously can't use v, ...
>>
>>>      pt->vcpu = v;
>>> +
>>> +    pt_vcpu_lock(pt->vcpu);
>>>      if ( pt->on_list )
>>>      {
>>> -        list_del(&pt->list);
>>>          list_add(&pt->list, &v->arch.hvm.tm_list);
>>>          migrate_timer(&pt->timer, v->processor);
>>>      }
>>> +    pt_vcpu_unlock(pt->vcpu);
>> ... these two again could (and imo should), and ...
>>
>>>      write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>> ... really this and its counterpart better would do so, too (albeit
>> perhaps in a separate patch).
> 
> 
> Are you suggesting to replace pt->vcpu with v here?

Yes.

> They are different at lock and unlock points (although they obviously point to the same domain).

Indeed, but all we care about is - as you say - the domain.

Jan

