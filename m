Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AED01E4512
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 16:02:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdwbl-0008CA-6I; Wed, 27 May 2020 14:00:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdwbj-0008C5-Qo
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 14:00:35 +0000
X-Inumbo-ID: 6ed322ce-a022-11ea-a752-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ed322ce-a022-11ea-a752-12813bfff9fa;
 Wed, 27 May 2020 14:00:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE1A9AFC0;
 Wed, 27 May 2020 14:00:35 +0000 (UTC)
Subject: Re: -mno-tls-direct-seg-refs support in glibc for i386 PV Xen
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <87mu5til8a.fsf@oldenburg2.str.redhat.com>
 <551ceac2-9cf6-00fd-95a6-a5b9fea6a383@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <69bdaedf-c403-a77d-8ab1-12feffa15494@suse.com>
Date: Wed, 27 May 2020 16:00:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <551ceac2-9cf6-00fd-95a6-a5b9fea6a383@citrix.com>
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
Cc: Florian Weimer <fweimer@redhat.com>, xen-devel@lists.xenproject.org,
 libc-alpha@sourceware.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.05.2020 15:39, Andrew Cooper wrote:
> On 27/05/2020 14:03, Florian Weimer wrote:
>> I'm about to remove nosegneg support from upstream glibc, special builds
>> that use -mno-tls-direct-seg-refs, and the ability load different
>> libraries built in this mode automatically, when the Linux kernel tells
>> us to do that.  I think the intended effect is that these special builds
>> do not use operands of the form %gs:(%eax) when %eax has the MSB set
>> because that had a performance hit with paravirtualization on 32-bit
>> x86.  Instead, the thread pointer is first loaded from %gs:0, and the
>> actual access does not use a segment prefix.
>>
>> Before doing that, I'd like to ask if anybody is still using this
>> feature?
>>
>> I know that we've been carrying nosegneg libraries for many years, in
>> some cases even after we stopped shipping 32-bit kernels. 8-/ The
>> feature has always been rather poorly documented, and the way the
>> dynamic loader selects those nosegneg library variants is still very
>> bizarre.
> 
> I wasn't even aware of this feature, or that there was a problem wanting
> fixing.
> 
> That said, I have found:
> 
> # 32-bit x86 does not perform well with -ve segment accesses on Xen.
> CFLAGS-$(CONFIG_X86_32) += $(call cc-option,$(CC),-mno-tls-direct-seg-refs)
> 
> in one of our makefiles.
> 
> Why does the MSB make any difference?  %gs still needs to remain intact
> so the thread pointer can be pulled out, so there is nothing that Xen or
> Linux can do in the way of lazy loading.
> 
> Beyond that, its straight up segment base semantics in x86.  There will
> be a 1-cycle AGU delay from a non-zero base, but that nothing to do with
> Xen and applies to all segment based TLS accesses on x86, and you'll win
> that back easily through reduced register pressure.
> 
> Are there any further details on the perf problem claim?  I find it
> suspicious.

To guard the hypervisor area, 32-bit Xen reduced the limits of guest
usable segment descriptors. While this works fine for flat ones (you
just chop off some space at the top), there's no way to represent a
full segment with a non-zero base. You can have the descriptor map
only the [base,XenBase] part or the [0,base) one. Hence Xen, from its
#GP handler, flipped the descriptor between the two options depending
on whether the current access was to the positive of negative part of
the TLS seg. (An in-practice use of expand down segments, as you'll
surely notice.)

Jan

