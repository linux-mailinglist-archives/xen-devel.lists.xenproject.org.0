Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE02AD805
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 14:51:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23423.50182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcU3H-0005lV-55; Tue, 10 Nov 2020 13:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23423.50182; Tue, 10 Nov 2020 13:51:15 +0000
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
	id 1kcU3H-0005l6-1s; Tue, 10 Nov 2020 13:51:15 +0000
Received: by outflank-mailman (input) for mailman id 23423;
 Tue, 10 Nov 2020 13:51:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcU3G-0005l1-83
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 13:51:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4187f26b-cc3c-4f0e-943c-1917eea4e1ff;
 Tue, 10 Nov 2020 13:51:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13AD0ABCC;
 Tue, 10 Nov 2020 13:51:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcU3G-0005l1-83
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 13:51:14 +0000
X-Inumbo-ID: 4187f26b-cc3c-4f0e-943c-1917eea4e1ff
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4187f26b-cc3c-4f0e-943c-1917eea4e1ff;
	Tue, 10 Nov 2020 13:51:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605016272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=69BB1CsLHAFZWYWWFWN0GZb+tOjRcN4OnsOFVzu2VUA=;
	b=jEJEpGnZ8ao3sXW8By32WyYe1SJQJPSGQrYM626MJbZOXUeKLL715UsR4kFXvSxbaIpVa8
	qTdY7okSfB7iTMZpjj7RHkqfvGsOSvQmON8fT+ovdPRLpOrHe9w1xb3I8so8kqaycnyE1H
	Q0nh2j4s8hstwMnzd4kTO+M5OhNObaE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 13AD0ABCC;
	Tue, 10 Nov 2020 13:51:12 +0000 (UTC)
Subject: Re: [PATCH 2/5] x86/p2m: collapse the two ->write_p2m_entry() hooks
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <b26981d1-7a1a-2387-0640-574bdf11ceff@suse.com>
 <20201110110611.p3twf6rmy7qdlxa7@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4932c75-c9c4-1da0-2218-fe3cb959e2e2@suse.com>
Date: Tue, 10 Nov 2020 14:51:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201110110611.p3twf6rmy7qdlxa7@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.11.2020 12:06, Roger Pau Monné wrote:
> On Wed, Oct 28, 2020 at 10:22:58AM +0100, Jan Beulich wrote:
>> @@ -1132,7 +1132,13 @@ void p2m_pt_init(struct p2m_domain *p2m)
>>      p2m->recalc = do_recalc;
>>      p2m->change_entry_type_global = p2m_pt_change_entry_type_global;
>>      p2m->change_entry_type_range = p2m_pt_change_entry_type_range;
>> -    p2m->write_p2m_entry = write_p2m_entry;
>> +
>> +    /* Still too early to use paging_mode_hap(). */
>> +    if ( hap_enabled(p2m->domain) )
>> +        hap_p2m_init(p2m);
>> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>> +        shadow_p2m_init(p2m);
> 
> There's already some logic in p2m_initialise that checks for
> hap_enabled for EPT specific initialization. Do you think you could
> move this there so that it's more contained?
> 
> I think having the initialization condition sprinkled all over the
> different functions makes the logic more complicated to follow.
> 
> Also, should hap_p2m_init be limited to HAP and PT, as opposed to HAP
> and EPT which doesn't use the helper AFAICT?

It is limited to HAP and PT - we're in p2m_pt_init() here. This is
also why I don't want to move it to e.g. p2m_initialise(), as that
would be the wrong layer.

> Maybe it would be clearer to unify shadow_write_p2m_entry with
> hap_write_p2m_entry and call it p2m_pt_write_p2m_entry to match the
> rest of the p2m PT helpers?

This looks to go along the lines of what I'd put up as a post-
commit-message remark in "x86/p2m: collapse the two
->write_p2m_entry() hooks". The nested handler is perhaps the
bigger problem with such merging, plus it would feel a little like
a layering violation (which is why I did put up the question
instead of doing it right away).

Jan

