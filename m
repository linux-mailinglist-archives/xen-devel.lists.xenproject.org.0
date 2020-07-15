Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073662204F2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 08:28:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvasi-0001e5-BF; Wed, 15 Jul 2020 06:27:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvasg-0001e0-9y
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 06:27:02 +0000
X-Inumbo-ID: 30eec5f4-c664-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30eec5f4-c664-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 06:27:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86E72B007;
 Wed, 15 Jul 2020 06:27:03 +0000 (UTC)
Subject: Re: [PATCH v2 3/7] x86/mce: bring hypercall subop compat checking in
 sync again
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <5d53a2e3-716c-2213-96e5-9d37371c482c@suse.com>
 <20200714111900.GI7191@Air-de-Roger>
 <f82edef5-ee75-b24c-0a24-03ed38486882@suse.com>
 <20200714143157.GM7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e27d46f-b0b2-8681-7f9e-9c12bb99da4a@suse.com>
Date: Wed, 15 Jul 2020 08:27:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714143157.GM7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.07.2020 16:31, Roger Pau Monné wrote:
> On Tue, Jul 14, 2020 at 01:47:11PM +0200, Jan Beulich wrote:
>> On 14.07.2020 13:19, Roger Pau Monné wrote:
>>> On Wed, Jul 01, 2020 at 12:26:54PM +0200, Jan Beulich wrote:
>>>> Use a typedef in struct xen_mc also for the two subops "manually"
>>>> translated in the handler, just for consistency. No functional
>>>> change.
>>>
>>> I'm slightly puzzled by the fact that mc_fetch is marked as needs
>>> checking while mc_physcpuinfo is marked as needs translation,
>>> shouldn't both be marked as needing translation? (since both need to
>>> handle a guest pointer using XEN_GUEST_HANDLE)
>>
>> I guess I'm confused - I see an exclamation mark on both respective
> 
> No, I was the one confused, you are right that both are marked as need
> translation.

And just to mention it explicitly - I think the lines could be
dropped, as they look to be there just for documentation (if at
all). The resulting XLAT_* macros don't get used anywhere.

Jan

