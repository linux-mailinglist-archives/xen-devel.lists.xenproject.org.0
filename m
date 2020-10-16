Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9D2904CA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 14:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8058.21448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTOcV-0008MI-Un; Fri, 16 Oct 2020 12:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8058.21448; Fri, 16 Oct 2020 12:14:03 +0000
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
	id 1kTOcV-0008Lv-RK; Fri, 16 Oct 2020 12:14:03 +0000
Received: by outflank-mailman (input) for mailman id 8058;
 Fri, 16 Oct 2020 12:14:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTOcU-0008Lq-S0
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 12:14:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf054e8b-e817-40a3-bbbe-7b256a4dd983;
 Fri, 16 Oct 2020 12:14:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D0A4ACC5;
 Fri, 16 Oct 2020 12:14:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTOcU-0008Lq-S0
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 12:14:02 +0000
X-Inumbo-ID: cf054e8b-e817-40a3-bbbe-7b256a4dd983
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cf054e8b-e817-40a3-bbbe-7b256a4dd983;
	Fri, 16 Oct 2020 12:14:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602850441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJIiQ9yrcyyr/TSYLzEY2pC0tit/0unVayTqJXularY=;
	b=nWVBV8JXaIh5UHVbFYkqXaZdzkypEAyNIxQG3JAX4a1plaP+EvsQGD/RyCI1ciP1IuZGi+
	gVI6MdUgPH5Vi2fSpz4bMFtjbO3j8Gqorl+Kr4O4AUgW2hhyjxdhvwWvBszfQw0BYJOHqm
	gmzZojfCo+MJ3sEw2y+ADVSCtfmX5P4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4D0A4ACC5;
	Fri, 16 Oct 2020 12:14:01 +0000 (UTC)
Subject: Re: [PATCH] x86/traps: 'Fix' safety of read_registers() in #DF path
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20201012134908.27497-1-andrew.cooper3@citrix.com>
 <afc5c857-a97b-a268-e6b2-538f31609505@suse.com>
 <307753b0-fef8-658d-f897-8c0eb99ce3e5@citrix.com>
 <948f0753-561b-15e8-bf8c-52ff507133d2@suse.com>
 <dbd19cd0-316a-c62f-de7b-627ada4df350@citrix.com>
 <00ba5885-5ee6-c772-a72e-15431cd3b1f4@suse.com>
 <09049e52-548b-3ffc-5259-b1ffc26413a5@citrix.com>
 <7f3272d5-8ec7-26ec-33ec-2281539920e2@suse.com>
 <5807e645-7242-125a-03cf-c7c23f28dfa3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8f8da1a9-47dd-57d6-a91f-de90de36ea22@suse.com>
Date: Fri, 16 Oct 2020 14:14:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <5807e645-7242-125a-03cf-c7c23f28dfa3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.10.2020 14:07, Andrew Cooper wrote:
> On 16/10/2020 12:55, Jan Beulich wrote:
>> On 16.10.2020 13:24, Andrew Cooper wrote:
>>> On a tangent, what are your views WRT backport beyond 4.14?
>>>
>>> Back then, it was #DB which was adjacent to the guard frame (which was
>>> not present), but it doesn't use show_registers() by default, so I think
>>> the problem is mostly hidden.
>> I wasn't fully decided yet, but as long as it applies reasonably
>> cleanly I think I'm leaning towards also putting it on 4.13.
>> 4.12 closes anyway once 4.12.4 is out, and I don't think I want
>> to pick up not-really-urgent changes for putting there beyond
>> the few ones that I already have (and that I mean to put in
>> alongside the XSA fixes on Tuesday); I could be talked into it,
>> though.
> 
> The question I was asking was really "should I try and make an
> equivalent fix for 4.13 and older".

Oh, I see.

> While the base premise of the fix would be the same, the logic in
> load_system_tables() is different, and the commit message is completely
> wrong.
> 
> I only encountered this problem with added instrumentation in the #DB
> handler, which is why I'm questioning the utility of going to this effort.

Yeah, then probably not worth it.

Jan

