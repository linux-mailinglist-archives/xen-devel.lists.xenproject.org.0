Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1871E765C26
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 21:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571254.894654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP6gW-00006v-TX; Thu, 27 Jul 2023 19:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571254.894654; Thu, 27 Jul 2023 19:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP6gW-0008VX-Qb; Thu, 27 Jul 2023 19:30:04 +0000
Received: by outflank-mailman (input) for mailman id 571254;
 Thu, 27 Jul 2023 19:30:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfsC=DN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qP6gV-0008CE-8M
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 19:30:03 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8a22209-2cb3-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 21:30:00 +0200 (CEST)
Received: from [10.10.1.94] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1690486190691601.0074543301466;
 Thu, 27 Jul 2023 12:29:50 -0700 (PDT)
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
X-Inumbo-ID: f8a22209-2cb3-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1690486192; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XuMJWACBh6UsdrdnWswEVQvOux13hm1gzccMHHvIEXN8wQ/b7jzcWn0xQFYE/a+71Mw9tQrYtbcI/IRKOeJXvkQPJMK3ICPUkD7rM1NcttG24EZnctor6UbTGDvTCr/WbvSXZjS0FL5Fk8NH1yx1Cap5d6AErC6c391rckU/y5I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690486192; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=qsQMZEljq9tNUHzPHrnn+78USOsSeLeBFjHt1wNT62g=; 
	b=JhhBkQca5fQnUy+exCXjP0EUR8FSscZ/T9TI1RoON9U4FVyDgz+daa5HJegC+HWysWi9hGwhCYwOvnA0EqsVALaohs+77QLggdtqOZXG4woAcDcc3ylxJ95/bNqRfi6HJLwXt4zbWPn6Q8p5lI/+wu28mF6VXVAeaIRvsS4y+w8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690486192;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qsQMZEljq9tNUHzPHrnn+78USOsSeLeBFjHt1wNT62g=;
	b=dKeXjW8WsdSozF11+8UwenHjPEvmxPQDGtvk3e5HRM3OP9uRskqT/sfzFDmn7Wkr
	l1toslTJwZ5An+Cs1lDd3ejWpMNGugIzTgzICBFze1jLqJveIxySO8i9IK0qIV0WR7W
	GbRJfmeOnTlBL+zo3DGxj/eCNUyhUl0lwQdoPDd8=
Message-ID: <6133f750-b9a2-635e-31ef-73346d3999f0@apertussolutions.com>
Date: Thu, 27 Jul 2023 15:29:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Christopher Clark <christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-4-christopher.w.clark@gmail.com>
 <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop>
 <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
 <CACMJ4Gb_ZwKSjP7qzfQj98YQjSpBdFuWzeGQJUNNqst0GdXCOw@mail.gmail.com>
 <4e0a0fc9-0c1b-4725-5692-de67ee68a980@suse.com>
 <2994c9b8-c803-1fd9-20df-0d25d2b66c49@apertussolutions.com>
 <ca85fd2e-45a5-32c3-cb4b-1042be6c6915@suse.com>
 <32a22c57-1333-47b0-c61d-abff8d7df112@apertussolutions.com>
 <7ab3c4ae-3903-29de-ba32-d328b426d104@suse.com>
 <19bb355f-576c-b8d7-b6da-fa2dd8ff2228@apertussolutions.com>
 <63979074-42c3-83dd-cf0a-8f0cd0294a5d@suse.com>
 <CA+zSX=ZFjWWnzx8vt3afywaiJiju1N5hNJqKzVkg956T-t-kwg@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <CA+zSX=ZFjWWnzx8vt3afywaiJiju1N5hNJqKzVkg956T-t-kwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 7/27/23 11:15, George Dunlap wrote:
> 
> 
> On Thu, Jul 27, 2023 at 3:42 PM Jan Beulich <jbeulich@suse.com 
> <mailto:jbeulich@suse.com>> wrote:
> 
>     On 27.07.2023 15:26, Daniel P. Smith wrote:
>      > Let's bring this back to the actual implementation instead of the
>      > theoretical. Your position is that Xen's paddr_t is desired
>     because it
>      > can store larger values than that of size_t. Now if you look in Xen
>      > proper (main 64bit code on x86), paddr_t is a typedef for a 64bit
>      > unsigned integer. And if you look at size_t, it is also a typedef
>     to a
>      > 64bit unsigned integer, they are literally a couple of lines
>     apart in
>      > types.h. Thus they are the same size and can only represent the same
>      > maximum size.
> 
>     What about 32-bit Arm, or any other 32-bit architecture that we might
>     see Xen ported to, with wider than 32-bit physical address space?
> 
> 
> To be more concrete here:
> 
> Suppose that you had a machine with 32-bit virtual address spaces (i.e., 
> going up to 4GiB), and 36-bit physical address spaces (i.e., going up to 
> 64GiB).  And suppose you had a system with 16GiB of physical ram.  And 
> you wanted to use Hyperlaunch to create VMs using some sort of memory 
> image that was 5GiB (presumably of some kind of static data, not, say, a 
> kernel or initramfs).  You wouldn't be able to do it if the "size" 
> parameter of the boot modules was limited to 4GiB (without some kind of 
> hack where you string multiple boot modules together).

The reality to your scenario here is that it would never work on x86. 
Regardless of which entry point you come in through, 32bit BIOS entry, 
UEFI, or PVH, all of these expect the boot material to be passed in 
using the MB1 or MB2 protocol. Under those protocols, a module 
definition has a start and end addresses which are u32. While the start 
address could be okay, the end address will be well beyond 4GiB which at 
best would overflow the address, but more likely be rejected by the 
bootloader.

> I guess part of the question is whether we think that's an important use 
> case; on the whole if you're populating 5GiB of RAM, it seems like it 
> would be better to have the VM load it itself from disk.

The point of hyperlaunch is to enable advanced use-cases and domain 
resume on boot is one I think someone might find useful.

> I do see the logic behind wanting to avoid "paddr_t" for a size; I'm 
> sure Jan that you would nack any patch that used "size_t" as a memory 
> address (instead of, say, uintptr_t).  In that case, "psize_t" is the 
> obvious solution.

I would be amenable with declaring a psize_t that lived in all the same 
places paddr_t are defined to signal them as a pair, of sorts. I would 
have to see if adding paddr_t and this new psize_t addresses to the 
32bit defs.h would result in making the structures 64bit clean in the 
x86 32bit code. If so, then it would remove the need for a separate 
declaration of the structures there.

v/r,
dps




