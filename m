Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD782B9006
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 11:24:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30573.60689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfh6b-0008NE-R4; Thu, 19 Nov 2020 10:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30573.60689; Thu, 19 Nov 2020 10:23:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfh6b-0008Mp-Nj; Thu, 19 Nov 2020 10:23:57 +0000
Received: by outflank-mailman (input) for mailman id 30573;
 Thu, 19 Nov 2020 10:23:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfh6a-0008M6-Bu
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:23:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dde4293f-2209-413b-839a-79592bf37ed9;
 Thu, 19 Nov 2020 10:23:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF87FAC24;
 Thu, 19 Nov 2020 10:23:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfh6a-0008M6-Bu
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:23:56 +0000
X-Inumbo-ID: dde4293f-2209-413b-839a-79592bf37ed9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id dde4293f-2209-413b-839a-79592bf37ed9;
	Thu, 19 Nov 2020 10:23:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605781435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XxzLM2t2efGhpZWBFlj6CCBvJpZP0Obk0XqAqTGxTek=;
	b=urm+9VgSdcp8uuGoltb2fQcU+Qwm7QxlyIu7U0jxwioABxLmsDyRCTK8hynWaRgPf2Vrwi
	m+FFZM+iaOG/fEjpQnUD7DSaHdK/ZuAvKeW4M7AS29RfZLQdDmKr7y/NTbNiMOWLvXF5tc
	jW8x8JTU6seoGtD8WvvjcgIlwhMol1k=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EF87FAC24;
	Thu, 19 Nov 2020 10:23:54 +0000 (UTC)
Subject: Re: [PATCH v2 6/8] lib: move rbtree code
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <e16975d3-c34b-1b3f-743f-1abe13aa06f7@suse.com>
 <eae3d402-b1d4-6fcb-06b8-ea337a26ab50@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df17ef4d-39c9-4a26-4aab-e17331e2be55@suse.com>
Date: Thu, 19 Nov 2020 11:23:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <eae3d402-b1d4-6fcb-06b8-ea337a26ab50@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.2020 18:46, Julien Grall wrote:
> On 23/10/2020 11:18, Jan Beulich wrote:
>> Build this code into an archive, which results in not linking it into
>> x86 final binaries. This saves about 1.5k of dead code.
>>
>> While moving the source file, take the opportunity and drop the
>> pointless EXPORT_SYMBOL().
> 
> Given this code is borrowed from Linux, I don't think we want to remove 
> them. This is to make easier to re-sync.

That's one view on it. My view is that we should get rid of
EXPORT_SYMBOL altogether (and it is a good opportunity to do so
here). Not the least because otherwise for future cloning of Linux
code we may then need to introduce further variants of this
construct for no real purpose.

>> --- a/xen/common/rbtree.c
>> +++ b/xen/lib/rbtree.c
>> @@ -25,7 +25,7 @@
>>   #include <xen/rbtree.h>
>>   
>>   /*
>> - * red-black trees properties:  http://en.wikipedia.org/wiki/Rbtree
>> + * red-black trees properties:  http://en.wikipedia.org/wiki/Rbtree
> 
> This looks like a spurious change.

Not really, no - while not visible here anymore, it's correcting an
instance of trailing whitespace. Following your request on an
earlier patch, I've also added half a sentence to the description
here to mention this entirely benign change.

Jan

