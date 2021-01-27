Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6685D306112
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 17:32:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76254.137523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4njs-0001ON-TA; Wed, 27 Jan 2021 16:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76254.137523; Wed, 27 Jan 2021 16:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4njs-0001Ny-Q6; Wed, 27 Jan 2021 16:32:16 +0000
Received: by outflank-mailman (input) for mailman id 76254;
 Wed, 27 Jan 2021 16:32:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4njr-0001Nt-Sq
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:32:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95060ce7-b140-4f0f-80c9-79d58d7c9258;
 Wed, 27 Jan 2021 16:32:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B07EAAC6;
 Wed, 27 Jan 2021 16:32:14 +0000 (UTC)
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
X-Inumbo-ID: 95060ce7-b140-4f0f-80c9-79d58d7c9258
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611765134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FY9ePlQV8e/YP1Dy1wzCoWUwN1T+6SE4eCVJbGKOYD8=;
	b=owyzeJzDGqha034yRBpTI9z3MvvxxDAeXxt+F3mRW+PMULrBWdCFuTB/bxvKi149Djw3Ma
	TtoRIPouFDBAS4AOCVpBrAYd/1fbnUK+5BYEuDJVROnb3yNj/S9sle1Vz9arhjeL6F5bET
	vTWeLwPP70xUxlCFMIGbniSvzkRh7vg=
Subject: Re: [PATCH] Fix error: array subscript has type 'char' [and 1 more
 messages]
To: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Manuel Bouyer <bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
 <20210114122912.GA2522@antioche.eu.org>
 <1af2b532-4dce-29cf-94ae-ad0c399ecbce@suse.com>
 <20210114141615.GA9157@mail.soc.lip6.fr>
 <20210126174415.GA21858@mail.soc.lip6.fr>
 <24592.22685.67161.585056@mariner.uk.xensource.com>
 <2452d5cb-90ba-a4c4-a5e4-3070c5a676d2@suse.com>
 <27ec4834-ebf2-2121-47f7-470083d03a3f@suse.com>
 <24593.28738.216430.891500@mariner.uk.xensource.com>
 <d3796603-20a7-2c81-a446-0d0a75cd52d5@suse.com>
 <24593.37649.81543.442376@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2bdd894f-e966-7943-c5ec-fe45ef7227e7@suse.com>
Date: Wed, 27 Jan 2021 17:32:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24593.37649.81543.442376@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.01.2021 17:21, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH] Fix error: array subscript has type 'char' [and 1 more messages]"):
>> I don't think I've ever come across that part of a platform
>> API/ABI spec. Instead my understanding so far was that good
>> platform headers would be ignorant of the user's choice of
>> char's signed-ness (wherever compilers offer such a choice,
>> but I think all that I've ever worked with did). At the very
>> least gcc's doc doesn't warn about any possible
>> incompatibilities resulting from use of -fsigned-char or
>> -funsigned-char (or their bitfield equivalents, for that
>> matter).
> 
> Well, I've considered this and I still don't think changing to
> -funsigned-char is good idea.
> 
> Are you OK with me checking in the current patch or should I ask the
> other committers for a second opinion ?

For the changes to tools/ it's really up to you. For the change
to xen/tools/symbols.c I could live with it (for being user
space code), but I still think adding casts in such a place is
not necessarily setting a good precedent. So for this one I'd
indeed appreciate getting another opinion.

Jan

