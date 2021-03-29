Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3298F34D4CF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 18:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103154.196869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuf1-0000Au-AF; Mon, 29 Mar 2021 16:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103154.196869; Mon, 29 Mar 2021 16:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuf1-0000AU-6r; Mon, 29 Mar 2021 16:22:39 +0000
Received: by outflank-mailman (input) for mailman id 103154;
 Mon, 29 Mar 2021 16:22:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lQuf0-0000AP-4T
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 16:22:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9302bad1-5ce2-45ca-8a75-ffae236020f7;
 Mon, 29 Mar 2021 16:22:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65BE5AEB3;
 Mon, 29 Mar 2021 16:22:36 +0000 (UTC)
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
X-Inumbo-ID: 9302bad1-5ce2-45ca-8a75-ffae236020f7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617034956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uLZl020j4NGo26Jwem8GG1prv3kdpHdnDhxzLq170bY=;
	b=dSc8n4GDHLEE4OwHRJPrlD9U/ClP83dJsfA5AQCs9ELK7Frmyk4DUF7OXcOEgBtKwuOicc
	g36n/yeEoXbECLuZFQkhZ7A+hpAYBR+F2fMir3TsZNI+qR6kXodqD/3hTwACTFVOask7AK
	yDzZnTdxmCnjMufUjNBOaGCPccZJl6s=
Subject: Re: [PATCH v2] x86/vpt: Do not take pt_migrate rwlock in some cases
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: andrew.cooper3@citrix.com, wl@xen.org, stephen.s.brennan@oracle.com,
 iwj@xenproject.org, xen-devel@lists.xenproject.org, roger.pau@citrix.com
References: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
 <82868938-bf57-25c2-38f6-1ec8e9c92362@suse.com>
 <bd430cc4-4c57-e479-14e0-0b62754147c1@oracle.com>
 <e5776eb6-5093-019b-43a0-167fa7924158@suse.com>
 <318ca597-c7fe-ceeb-df12-2802b2cc74fb@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <52db82ef-5e9d-ed0c-df87-2aef3bbf1657@suse.com>
Date: Mon, 29 Mar 2021 18:22:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <318ca597-c7fe-ceeb-df12-2802b2cc74fb@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.03.2021 17:31, Boris Ostrovsky wrote:
> 
> On 3/29/21 11:21 AM, Jan Beulich wrote:
>> On 29.03.2021 17:04, Boris Ostrovsky wrote:
>>> On 3/29/21 5:56 AM, Jan Beulich wrote:
>>>> On 27.03.2021 02:51, Boris Ostrovsky wrote:
>>>>> @@ -580,13 +593,22 @@ static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
>>>>>          return;
>>>>>  
>>>>>      write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>>>>> +
>>>>> +    pt_vcpu_lock(pt->vcpu);
>>>>> +    if ( pt->on_list )
>>>>> +        list_del(&pt->list);
>>>>> +    pt_vcpu_unlock(pt->vcpu);
>>>> While these two obviously can't use v, ...
>>>>
>>>>>      pt->vcpu = v;
>>>>> +
>>>>> +    pt_vcpu_lock(pt->vcpu);
>>>>>      if ( pt->on_list )
>>>>>      {
>>>>> -        list_del(&pt->list);
>>>>>          list_add(&pt->list, &v->arch.hvm.tm_list);
>>>>>          migrate_timer(&pt->timer, v->processor);
>>>>>      }
>>>>> +    pt_vcpu_unlock(pt->vcpu);
>>>> ... these two again could (and imo should), and ...
>>>>
>>>>>      write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>>>> ... really this and its counterpart better would do so, too (albeit
>>>> perhaps in a separate patch).
>>>
>>> Are you suggesting to replace pt->vcpu with v here?
>> Yes.
>>
>>> They are different at lock and unlock points (although they obviously point to the same domain).
>> Indeed, but all we care about is - as you say - the domain.
> 
> 
> Hmm.. I think then it's better to stash domain (or, better, pl_time) into a local variable. Otherwise starting with different pointers in lock and unlock paths (even though they eventually lead to the same lock) makes me a bit uncomfortable.
> 
> 
> Secondly, do you want this and the check for pt->vcpu == v in pt_adjust_vcpu() be done in two separate patches or can they go into a single one?

This one should be right in your base patch. What I think may better
be in a separate one is the adjustment to write_lock() / write_unlock().

Jan

