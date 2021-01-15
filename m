Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E044A2F768D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 11:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67904.121398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0MFM-0006Zm-Np; Fri, 15 Jan 2021 10:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67904.121398; Fri, 15 Jan 2021 10:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0MFM-0006ZQ-Ko; Fri, 15 Jan 2021 10:22:24 +0000
Received: by outflank-mailman (input) for mailman id 67904;
 Fri, 15 Jan 2021 10:22:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0MFL-0006ZL-CK
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 10:22:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 509d5933-4766-4e2b-80fa-2b55fef8609e;
 Fri, 15 Jan 2021 10:22:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 710BCAE12;
 Fri, 15 Jan 2021 10:22:21 +0000 (UTC)
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
X-Inumbo-ID: 509d5933-4766-4e2b-80fa-2b55fef8609e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610706141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3qg954drVymg2O753rkGTwGZY/yQjqhFFSaqFuCujc=;
	b=ti5uLAUb2UzkgWU8nBFneTc6r1p0V3SAsk4QQ6iDSmrg8dwg1GrUBeRW25ZFx2cF+Hkd09
	pIodKrOjuaY+h9eD+FdFN/Ml81ckKq1DakqnYfjun6pqoN+ggx03Kys9Qmg/HH7SJGlKUd
	rpWdUpB8i+i64qfnppkwXHxZRdaXVxI=
Subject: Re: [PATCH] common: don't require use of DOMID_SELF
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <72c9f0ec-81e3-63f9-2513-46e463642219@suse.com>
 <6b80d9bd-58a1-0854-2ff9-7153ddecae26@xen.org>
 <a53b09f9-a1cd-2f98-35e4-d8a6b16e1cc0@suse.com>
 <30a85796-300f-3d50-b017-7b7f5cf6af35@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e86ae594-885b-1ea8-d396-f71f19472fef@suse.com>
Date: Fri, 15 Jan 2021 11:22:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <30a85796-300f-3d50-b017-7b7f5cf6af35@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.01.2021 10:59, Julien Grall wrote:
> On 14/01/2021 15:30, Jan Beulich wrote:
>> On 14.01.2021 15:43, Julien Grall wrote:
>>> On 14/01/2021 14:02, Jan Beulich wrote:
>>>> It's not overly difficult for a domain to figure out its ID, so
>>>> requiring the use of DOMID_SELF in a very limited set of places isn't
>>>> really helpful towards keeping the ID opaque to the guest.
>>>
>>> So I agree that a domid can be figured out really easily today and in
>>> principle it would be fine to relax it.
>>>
>>> However, most of the guest OSes will care about running on older Xen
>>> versions. Therefore they are not going to be able to use this relaxation.
>>>
>>> So I am not entirely convinced the relaxation is actually worth it for
>>> existing hypercalls.
>>
>> I'm aware of the concern (Andrew has voiced it both here and in
>> earlier contexts), but personally I think undue restrictions should
>> not be retained just because they used to be enforced.
> 
> I don't disagree about the undue restrictions. My main concern is it 
> makes more difficult for a developper to write portable code. The more 
> when there is no easy way to find out the differences between Xen 
> versions (see more below).
> 
>> We've gone
>> this same route in a few other occasions not overly long ago, and
>> iirc there are two patches going in a similar direction (different
>> area of course) that I have still pending and which neither got
>> ack-ed nor firmly rejected. >> Anyway, if we decide to relax it, then I think we should update the
>>> public headers because an OS using this relaxation will not work on
>>> older Xen. A developper will not be able to know that without looking at
>>> the implementation.
>>
>> Well, DOMID_SELF exists because that's the preferred form to use.
>> I can certainly add commentary, but it would feel a little odd to
>> do so.
> 
> Lets imagine your are the developer of a new OS but don't know Xen 
> internal. How would you find out the difference between Xen interfaces?
> 
> With no documentation you have two choices:
>     1) Dig into Xen code to understand the parameters
>     2) Rely on the testing to find interface
> 
> Neither of the two solutions are great for the developper.

But why would such a developer research how to figure out the domain
ID when they can use DOMID_SELF? As said, it's not difficult, but
one still needs to know a few details and write some extra code.

>> To be honest I'm also not sure how helpful this is going to
>> be, considering that consumers often have their own clones of our
>> headers.
> Right, but IMHO, anyone writing code that interface with the hypervisor 
> should read the latest documentation/interface.
> 
> At the moment, most of our documentations are in the public headers. So 
> it makes a suitable place.
> 
> We may need to duplicate the comment, but it is small enough to be fine.

Okay, I've added this hunk for the grant table side:

--- unstable.orig/xen/include/public/grant_table.h
+++ unstable/xen/include/public/grant_table.h
@@ -447,6 +447,12 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_
  * source_offset specifies an offset in the source frame, dest_offset
  * the offset in the target frame and  len specifies the number of
  * bytes to be copied.
+ *
+ * Note that operations not specifying GNTCOPY_*_gref will be restricted
+ * to the local domain for the respective operands (source and/or
+ * destination.  Note further that prior to Xen 4.15 only DOMID_SELF
+ * would be accepted to specify this, i.e. the actual ID of the local
+ * domain can only be used successfully on 4.15 and newer.
  */
 
 #define _GNTCOPY_source_gref      (0)

The duplication will be more noticable for the get_pg_owner() aspect,
as that is used by multiple hypercall handlers, which I first need to
all hunt down, locate a suitable place for putting the comment in the
headers, and then perhaps - since I have to do this hunting down now
anyway - also see whether Andrew's concern needs further code changes
to address. So far for a simple code change, where I don't really buy
in to the benefit of doing this extra exercise ...

Jan

