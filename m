Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB6A330AE3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 11:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94770.178464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCrg-00087j-IW; Mon, 08 Mar 2021 10:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94770.178464; Mon, 08 Mar 2021 10:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCrg-00087N-FY; Mon, 08 Mar 2021 10:11:52 +0000
Received: by outflank-mailman (input) for mailman id 94770;
 Mon, 08 Mar 2021 10:11:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJCre-00087I-UX
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 10:11:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88c33625-aa54-43b9-bb97-0d3e7c6a059c;
 Mon, 08 Mar 2021 10:11:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9D0DCAD2B;
 Mon,  8 Mar 2021 10:11:49 +0000 (UTC)
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
X-Inumbo-ID: 88c33625-aa54-43b9-bb97-0d3e7c6a059c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615198309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OzLj4QXNSpZrTHaRZIstJsSe0VXvno7tdOhinkMqzc=;
	b=VMSGTbwE7tTvyMf/HzMXqpRBdZPXnjF6nn8SI58V4a3v9m+4uA+ObYEym3dkbVkO1ikD16
	XUUKyOjLchsYcL+yANns4OYHpZPMuSkYwxJbNfMsZXMlmuqJkyFRuqByFU4QijEuv7IAIn
	v9iXtVzeP4b6Ml14udrY58efxHsYaSo=
Subject: Re: [PATCH 1/2][4.15?] tools/x86: don't rebuild cpuid-autogen.h every
 time
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d08ec3ba-dff1-cb1c-9103-949e15774fd5@suse.com>
 <336aaf51-f163-8ee7-d8ee-297f6f3052fd@suse.com>
 <24645.62832.737310.550811@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2857440d-058f-5c85-32d3-87e2fe65bb9a@suse.com>
Date: Mon, 8 Mar 2021 11:11:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24645.62832.737310.550811@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 10:59, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH 1/2][4.15?] tools/x86: don't rebuild cpuid-autogen.h every time"):
>> The first thing the "xen-dir" rule does is delete the entire xen/
>> subtree. Obviously this includes deleting xen/lib/x86/*autogen.h. As a
>> result there's no original version for $(move-if-changed ...) to compare
>> against, and hence the file and all its consumers would get rebuilt
>> every time. Introduce a "prep-y" rule to move xen/lib/x86/ on the side,
>> to then recover any *autogen.h from there prior to invoking the
>> respective recursive $(MAKE) invocation.
> 
> Urgh.  Thanks for working on this swamp.
> 
> However,
> 
>> +# Arrange for preserving of auto-generated headers (to avoid them getting
>> +# rebuilt every time): Move the entire xen/lib/x86/ to a temporary place.
>> +prep-$(CONFIG_X86):
>> +	rm -rf .xen-lib-x86
>> +	test ! -d xen/lib/x86 || mv xen/lib/x86 .xen-lib-x86
>> +
>>  all-$(CONFIG_X86): xen-dir
>> +	$(if $(wildcard .xen-lib-x86/*autogen.h),mv .xen-lib-x86/*autogen.h xen/lib/x86/)
>> +	rm -rf .xen-lib-x86
>>  	$(MAKE) -C xen/lib/x86 all XEN_ROOT=$(XEN_ROOT) PYTHON=$(PYTHON)
> 
> Isn't there some better way of doing this ?  I am very wary of adding
> additional on-disk Makefile-managed state to a Makefile which is
> already going wrong.  I haven't thought about this in enough detail to
> identify a specific bug but I think convincing myself that it is
> definitely correct is nontrivial.
> 
> Perhaps we could do the removal with a find rune instead, so we can
> just skip the files we wanted to keep ?

Maybe, and I did consider the option, but it would have felt more
fragile to me than this dedicated keep-just-the-few-files approach.
The problems we've had with this symlinking don't make me confident
in leaving around parts of this subtree; populating from scratch
seems like the most robust model (short of the suggested but never
carried out removal of the symlinking) to me.

Jan

