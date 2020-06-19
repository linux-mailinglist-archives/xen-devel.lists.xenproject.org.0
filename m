Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D02008E2
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 14:40:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmGJC-00049e-8j; Fri, 19 Jun 2020 12:39:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jmGJA-00049W-FZ
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 12:39:48 +0000
X-Inumbo-ID: f5c21538-b229-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5c21538-b229-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 12:39:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EAF48ACA3;
 Fri, 19 Jun 2020 12:39:45 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] xen/mm: lift 32 item limit from mfn/gfn arrays
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1060400786.9820894.1592523480084.JavaMail.zimbra@cert.pl>
 <20200619113434.GZ735@Air-de-Roger>
 <1494219989.10184041.1592570120971.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4cbf963d-7cf0-3fdb-b456-db2845244dec@suse.com>
Date: Fri, 19 Jun 2020 14:39:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1494219989.10184041.1592570120971.JavaMail.zimbra@cert.pl>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.06.2020 14:35, Michał Leszczyński wrote:
> ----- 19 cze 2020 o 13:34, Roger Pau Monné roger.pau@citrix.com napisał(a):
> 
>> On Fri, Jun 19, 2020 at 01:38:00AM +0200, Michał Leszczyński wrote:
>>> Replace on-stack array allocation with heap allocation
>>> in order to lift the limit of 32 items in mfn/gfn arrays
>>> when calling acquire_resource.
>>
>> I'm afraid this is not correct, you cannot allow unbounded amounts of
>> items to be processed like this, it's likely that you manage to
>> trigger the watchdog if the list is long enough, specially when doing
>> set_foreign_p2m_entry.
>>
>> You need to process the items in batches (32 was IMO a good start), and
>> then add support for hypercall continuations. Take a look at how
>> XENMEM_populate_physmap just a couple of lines below makes use of
>> hypercall_create_continuation.
>>
>> After processing every batch you need to check if
>> hypercall_preempt_check returns true and if so use
>> hypercall_create_continuation in order to encode a continuation.
> 
> One more question. Are these continuations transparent from the caller side,
> or do I also need to add something on the invoker side to properly handle these
> continuations?

They are (mostly) transparent to the guest, yes. "Mostly" because we
have cases (iirc) where the continuation data is stored in a way that
a guest could observe it. But it still wouldn't need to do anything
in order for the hypercall to get continued until it completes (which
may be "fails", faod).

Jan

