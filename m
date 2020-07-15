Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A678220CC2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 14:14:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvgIC-0002tB-Sy; Wed, 15 Jul 2020 12:13:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvgIB-0002t6-LU
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:13:43 +0000
X-Inumbo-ID: 9fce9f1e-c694-11ea-93cf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fce9f1e-c694-11ea-93cf-12813bfff9fa;
 Wed, 15 Jul 2020 12:13:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A593B1E7;
 Wed, 15 Jul 2020 12:13:45 +0000 (UTC)
Subject: Re: [PATCH v6 01/11] memory: batch processing in acquire_resource()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <02415890e4e8211513b495228c790e1d16de767f.1594150543.git.michal.leszczynski@cert.pl>
 <20200715093606.GU7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61828142-8135-deee-43c6-1a2124f55756@suse.com>
Date: Wed, 15 Jul 2020 14:13:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715093606.GU7191@Air-de-Roger>
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
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 tamas.lengyel@intel.com, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.2020 11:36, Roger Pau Monné wrote:
> On Tue, Jul 07, 2020 at 09:39:40PM +0200, Michał Leszczyński wrote:
>> @@ -1599,8 +1629,17 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>  #endif
>>  
>>      case XENMEM_acquire_resource:
>> -        rc = acquire_resource(
>> -            guest_handle_cast(arg, xen_mem_acquire_resource_t));
>> +        do {
>> +            rc = acquire_resource(
>> +                guest_handle_cast(arg, xen_mem_acquire_resource_t),
>> +                &start_extent);
> 
> I think it would be interesting from a performance PoV to move the
> xmar copy_from_guest here, so that each call to acquire_resource
> in the loop doesn't need to perform a copy from guest. That's
> more relevant for translated callers, where a copy_from_guest involves
> a guest page table and a p2m walk.

This isn't just a nice-to-have for performance reasons, but a
correctness/consistency thing: A rogue (or buggy) guest may alter
the structure between two such reads. It _may_ be the case that
we're dealing fine with this right now, but it would feel like a
trap to fall into later on.

>> +
>> +            if ( hypercall_preempt_check() )
> 
> You are missing a rc == -ERESTART check here, you don't want to encode
> a continuation if rc is different than -ERESTART AFAICT.

At which point the subsequent containing do/while() likely wants
adjusting to, e.g. to "for( ; ; )".

Jan

