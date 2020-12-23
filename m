Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056F62E1C88
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 14:19:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58347.102495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks434-0004OD-A2; Wed, 23 Dec 2020 13:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58347.102495; Wed, 23 Dec 2020 13:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks434-0004No-6r; Wed, 23 Dec 2020 13:19:26 +0000
Received: by outflank-mailman (input) for mailman id 58347;
 Wed, 23 Dec 2020 13:19:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ks432-0004Nj-MI
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 13:19:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks431-000730-Pl; Wed, 23 Dec 2020 13:19:23 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks431-0003h1-Gn; Wed, 23 Dec 2020 13:19:23 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=NbuIBhzl6Jps3KIZ/CV2Pa4RdvA7DGpXZ61NF6uZcXU=; b=w2fgR9nfYJ10HT4wULOxHJKpdk
	Z1sW3LTDC32SWeD+fLMkxPbgFBmRjVxdq4hPfq+EFm9bxIF0Bno+k1Z1uagylE+2gWuTCzHlDrqfz
	nd+jzylawlD5ZgSP0V0YGv0r6K+QuS75WskU2NZV395wvAdKwIOSuGT5wYhM50jWOqfY=;
Subject: Re: [PATCH v3 4/5] evtchn: convert domain event lock to an r/w one
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <a333387e-f9e5-7051-569a-1a9a37da53ca@suse.com>
 <074be931-54b0-1b0f-72d8-5bd577884814@xen.org>
 <6e34fd25-14a2-f655-b019-aca94ce086c8@suse.com>
 <55dc24b4-88c6-1b22-411e-267231632377@xen.org>
 <cf3faa68-ba4a-b864-66e0-f379a24a48ce@suse.com>
 <1f3571eb-5aec-e76e-0b61-2602356fb436@xen.org>
 <099b99bc-c544-0aa8-c3b4-4871ef618e4a@suse.com>
 <aa169dc2-77f2-b3e9-80f4-d5f4d6ea54f1@xen.org>
 <d0b3079b-ae83-a14e-1fc6-ea76bdc7db79@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <25585b2a-7dcd-1b46-b360-9a9e9d54b191@xen.org>
Date: Wed, 23 Dec 2020 13:19:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d0b3079b-ae83-a14e-1fc6-ea76bdc7db79@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 23/12/2020 12:57, Jan Beulich wrote:
> On 23.12.2020 12:22, Julien Grall wrote:
>>> 1) Neither evtchn_status() nor domain_dump_evtchn_info() appear to
>>> have a real need to acquire the per-domain lock. They could as well
>>> acquire the per-channel ones. (In the latter case this will then
>>> also allow inserting the so far missing process_pending_softirqs()
>>> call; it shouldn't be made with a lock held.)
>> I agree that evtchn_status() doesn't need to acquire the per-domain
>> lock. I am not entirely sure about domain_dump_evtchn_info() because
>> AFAICT the PIRQ tree (used by domain_pirq_to_irq()) is protected with
>> d->event_lock.
> 
> It is, but calling it without the lock just to display the IRQ
> is not a problem afaict.

How so? Is the radix tree lookup safe against concurrent radix tree 
insertion/deletion?

Cheers,

-- 
Julien Grall

