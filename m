Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194652D5987
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 12:44:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49127.86882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knKN6-0001VZ-IR; Thu, 10 Dec 2020 11:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49127.86882; Thu, 10 Dec 2020 11:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knKN6-0001V9-FJ; Thu, 10 Dec 2020 11:44:32 +0000
Received: by outflank-mailman (input) for mailman id 49127;
 Thu, 10 Dec 2020 11:44:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wUnW=FO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1knKN5-0001Uu-01
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 11:44:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1151a45e-295f-45b5-a6c1-8421fcc2c5ae;
 Thu, 10 Dec 2020 11:44:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA173AD5C;
 Thu, 10 Dec 2020 11:44:27 +0000 (UTC)
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
X-Inumbo-ID: 1151a45e-295f-45b5-a6c1-8421fcc2c5ae
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607600669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kGZ1v2zV5ELcG+fBrSPDafSIORbvLPX59cOeyhmcLHo=;
	b=F/SWGT1zGXxFxZwqDhu2D0nzaR+3ozKgQgmsgi5iW2vZ32xE53WK5fvEPDklugr8Vjz9d5
	wenkjsDSbG9OwzxdfUFsuJozVeREbsTKjwd3NYa2BFTqupsbPz2Yc53feKf8vp8DhVfDR9
	4ruP9BzmCpMB2vB4daK+c3G8RwLk/EU=
Subject: Re: [PATCH v3 1/8] xen: fix build when $(obj-y) consists of just
 blanks
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <511be84d-9a13-17ae-f3d9-d6daf9c02711@suse.com>
 <X9EL90SMyqrs9GaL@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50fc5143-5b5e-46ae-56a3-6eba2707f293@suse.com>
Date: Thu, 10 Dec 2020 11:21:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <X9EL90SMyqrs9GaL@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 18:40, Anthony PERARD wrote:
> On Mon, Nov 23, 2020 at 04:20:52PM +0100, Jan Beulich wrote:
>> This case can occur when combining empty lists
>>
>> obj-y :=
>> ...
>> obj-y += $(empty)
>>
>> or
>>
>> obj-y := $(empty) $(empty)
>>
>> where (only) blanks would accumulate. This was only a latent issue until
>> now, but would become an active issue for Arm once lib/ gets populated
>> with all respective objects going into the to be introduced lib.a.
>>
>> Also address a related issue at this occasion: When an empty built_in.o
>> gets created, .built_in.o.d will have its dependencies recorded. If, on
>> a subsequent incremental build, an actual constituent of built_in.o
>> appeared, the $(filter-out ) would leave these recorded dependencies in
>> place. But of course the linker won't know what to do with C header
>> files. (The apparent alternative of avoiding to pass $(c_flags) or
>> $(a_flags) would not be reliable afaict, as among these flags there may
>> be some affecting information conveyed via the object file to the
>> linker. The linker, finding inconsistent flags across object files, may
> 
> How about using $(XEN_CFLAGS) instead of $(c_flags)? That should prevent
> CC from generating the .*.o.d files while keeping the relevant flags.

What does "relevant" cover? For an empty .o it may not be important
right now, but I could see

c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_CFLAGS) '-D__OBJECT_FILE__="$@"'
a_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_AFLAGS)

include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk

c_flags += $(CFLAGS-y)
a_flags += $(CFLAGS-y) $(AFLAGS-y)

leading to CFLAGS-y / AFLAGS-y which need to be consistent across
_all_ object files (e.g. some recording of ABI used).

> I
> was planing to do that to avoid the issue, see:
> https://lore.kernel.org/xen-devel/20200421161208.2429539-10-anthony.perard@citrix.com
> 
>> then error out.) Using just $(obj-y) won't work either: It breaks when
>> the same object file is listed more than once.
> 
> Do we need to worry about having a object file been listed twice?
> Wouldn't that be a mistake?

No. The list approach (obj-$(CONFIG_xyz) += ...) easily allows for
this to happen. See xen/arch/x86/mm/Makefile for an existing example.

Jan

