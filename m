Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D39719421E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:55:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTs7-0003aI-5a; Thu, 26 Mar 2020 14:52:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHTs6-0003aD-Gb
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:52:38 +0000
X-Inumbo-ID: 6f2e591e-6f71-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f2e591e-6f71-11ea-bec1-bc764e2007e4;
 Thu, 26 Mar 2020 14:52:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 09B07B1DC;
 Thu, 26 Mar 2020 14:52:37 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <46457bd6e877abe12a8c005c23f0f1aab13afd24.1584981438.git.tamas.lengyel@intel.com>
 <3f0fd837-bee6-3a68-8db3-1a99b97aac9e@suse.com>
 <CABfawhkRpvV0asinjdBx2qMq-RQOBbx13bENREszzkBhrgS71Q@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9c7d7147-cb83-5e91-38b7-906a81582ac4@suse.com>
Date: Thu, 26 Mar 2020 15:52:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CABfawhkRpvV0asinjdBx2qMq-RQOBbx13bENREszzkBhrgS71Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v12 2/3] x86/mem_sharing: reset a fork
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.2020 15:48, Tamas K Lengyel wrote:
> On Thu, Mar 26, 2020 at 4:17 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 23.03.2020 18:04, Tamas K Lengyel wrote:
>>> +static int mem_sharing_fork_reset(struct domain *d, struct domain *pd)
>>> +{
>>> +    int rc;
>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +    struct page_info *page, *tmp;
>>> +
>>> +    spin_lock(&d->page_alloc_lock);
>>> +    domain_pause(d);
>>
>> Why do you take the lock first?
> 
> No particular reason - does the order matter?

I think you'd better avoid holding a lock for extended periods
of time. And what's perhaps worse, what if a vCPU of the domain
sits in Xen trying to acquire this lock - you'd deadlock trying
to pause the domain then.

Jan

