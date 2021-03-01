Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874783281F8
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 16:15:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91728.173061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGkFj-0002Im-7W; Mon, 01 Mar 2021 15:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91728.173061; Mon, 01 Mar 2021 15:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGkFj-0002IN-4R; Mon, 01 Mar 2021 15:14:31 +0000
Received: by outflank-mailman (input) for mailman id 91728;
 Mon, 01 Mar 2021 15:14:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGkFh-0002II-5y
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 15:14:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18885b9b-e16c-4da0-bfbc-d3cbd611aa4c;
 Mon, 01 Mar 2021 15:14:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FDBEAF59;
 Mon,  1 Mar 2021 15:14:27 +0000 (UTC)
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
X-Inumbo-ID: 18885b9b-e16c-4da0-bfbc-d3cbd611aa4c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614611667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PoO1/fDL0ExPzQjEi0DBvTkmnPW4j7s6jpqYlEpbTkA=;
	b=H8qm4FKnuLjH3uvoa1zCaPTq+x1SaPZbRtTDfYs5OT81E+49px3+NG4iqs4Be5l3TMpjlE
	KR7+iVHpie2HdAvr7grdoATSSR7S4v+Vf9zWAWDnRRvX5wAp0ZfghYgYWCKg8EjAdyS+GO
	7XhbzZPSU9mXxVZYNcQpvMjbuM/JT30=
Subject: Re: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
 <1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
 <YDzzt1CXau8vKCn1@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0664115-2b36-7a56-2814-bb234fb379cf@suse.com>
Date: Mon, 1 Mar 2021 16:14:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDzzt1CXau8vKCn1@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.03.2021 15:01, Roger Pau Monné wrote:
> On Mon, Mar 01, 2021 at 09:31:07AM +0100, Jan Beulich wrote:
>> In this case the compiler is recognizing that no valid array indexes
>> remain (in x2apic_cluster()'s access to per_cpu(cpu_2_logical_apicid,
>> ...)), but oddly enough isn't really consistent about the checking it
>> does (see the code comment).
> 
> I assume this is because of the underlying per_cpu access to
> __per_cpu_offset using cpu as the index, in which case wouldn't it be
> better to place the BUG_ON there?

Not sure, to be honest. It seemed more logical to me to place it
next to where the issue is.

> Also I wonder why the accesses the same function does to the per_cpu
> area before the modified chunk using this_cpu as index don't also
> trigger such warnings.

The compiler appears to be issuing the warning when it can prove
that no legitimate index can make it to a respective use. in this
case it means that is is

        if ( this_cpu == cpu )
            continue;

which makes it possible for the compiler to know that what gets
past this would be an out of bounds access, since for NR_CPUS=1
both this_cpu and cpu can only validly both be zero. (This also
plays into my choice of placement, because it is not
x2apic_cluster() on its own which has this issue.)

Jan

