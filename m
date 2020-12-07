Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BA32D0FA8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:44:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46356.82270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEwf-0000yU-Fa; Mon, 07 Dec 2020 11:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46356.82270; Mon, 07 Dec 2020 11:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEwf-0000y5-CB; Mon, 07 Dec 2020 11:44:45 +0000
Received: by outflank-mailman (input) for mailman id 46356;
 Mon, 07 Dec 2020 11:44:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmEwe-0000y0-Cq
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:44:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c49290a-7c2e-4553-bfcd-80fa9f212a94;
 Mon, 07 Dec 2020 11:44:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33570AD1E;
 Mon,  7 Dec 2020 11:44:42 +0000 (UTC)
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
X-Inumbo-ID: 6c49290a-7c2e-4553-bfcd-80fa9f212a94
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607341482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X7gxFAF+E4uaedP2zYxSsqrZhMulAqRne8iVEz2bgZY=;
	b=CtTV8RCxk3tggl/lac+/3m7f1OH3h8jTcezcHMI7mtxx+olPOerv+IetTCINc9YyZlp7Cp
	s0r5vlkzTVwuxMzTK5sptgzjp4utuuc+mCINlFzvCGvIwJLtmISenjsBS6vyhKplGIDW5R
	9tcEbfJiuTy3wsSzSJxmJx8NTt3RwxU=
Subject: Re: [PATCH v3 1/2] x86/IRQ: make max number of guests for a shared
 IRQ configurable
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, sstabellini@kernel.org, wl@xen.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <1607276587-19231-1-git-send-email-igor.druzhinin@citrix.com>
 <dc023b15-9e28-322c-aa86-165459e65d77@suse.com>
 <7b5c1a4e-fef7-3534-c717-335c025ea6b6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <44a36706-bfc6-062b-49c8-06dfe999b164@suse.com>
Date: Mon, 7 Dec 2020 12:44:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <7b5c1a4e-fef7-3534-c717-335c025ea6b6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.12.2020 12:28, Igor Druzhinin wrote:
> On 07/12/2020 09:43, Jan Beulich wrote:
>> On 06.12.2020 18:43, Igor Druzhinin wrote:
>>> @@ -1633,11 +1640,12 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>>>          goto retry;
>>>      }
>>>  
>>> -    if ( action->nr_guests == IRQ_MAX_GUESTS )
>>> +    if ( action->nr_guests == irq_max_guests )
>>>      {
>>> -        printk(XENLOG_G_INFO "Cannot bind IRQ%d to dom%d. "
>>> -               "Already at max share.\n",
>>> -               pirq->pirq, v->domain->domain_id);
>>> +        printk(XENLOG_G_INFO
>>> +               "Cannot bind IRQ%d to dom%pd: already at max share %u ",
> 
> I noticed it just now but could you also remove stray "dom" left in this line while commiting.

Oh, sure.

>>> +               pirq->pirq, v->domain, irq_max_guests);
>>> +        printk("(increase with irq-max-guests= option)\n");
>>
>> Now two separate printk()s are definitely worse. Then putting the
>> part of the format string inside the parentheses on a separate line
>> would still be better (and perhaps a sensible compromise with the
>> grep-ability desire).
> 
> Now I'm confused because you asked me not to split the format string between the lines which
> wouldn't be possible without splitting printk's. I didn't really want to drop anything
> informative.

"Not splitting" really was meant in the sense of the words: No
splitting at all. Even less so across multiple printk()-s. But
since the line would get really long, I can live with the
outlined compromise.

Jan

