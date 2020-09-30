Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BC827E65F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530.1737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZA2-00069Q-6X; Wed, 30 Sep 2020 10:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530.1737; Wed, 30 Sep 2020 10:16:34 +0000
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
	id 1kNZA2-000691-3K; Wed, 30 Sep 2020 10:16:34 +0000
Received: by outflank-mailman (input) for mailman id 530;
 Wed, 30 Sep 2020 10:16:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNZA0-00068w-9f
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:16:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e2739b1-2f8f-4754-92d6-db866f867ee5;
 Wed, 30 Sep 2020 10:16:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4EDBEADBE;
 Wed, 30 Sep 2020 10:16:30 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNZA0-00068w-9f
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:16:32 +0000
X-Inumbo-ID: 8e2739b1-2f8f-4754-92d6-db866f867ee5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8e2739b1-2f8f-4754-92d6-db866f867ee5;
	Wed, 30 Sep 2020 10:16:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601460990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKJW/LSA/OeeL/N8xLnVhIkCSA4Yw5jHz9rlPmrtJJQ=;
	b=QLS9drSAfzbrJt/PSJYz7vb6n5T6jwZKZr0i5TOTL9/I7cQx3qrs8Hm8m61wrdVzHiOFU9
	MMFYvfB/vBhhDIjiJisqGC6kVCoUWGo3OEvmla6DTv6NyhjnS0fMKhYMKw2Mvblo9Bw040
	EQlFek8g/lh3aqZkykNtnr6QxUEb0kQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4EDBEADBE;
	Wed, 30 Sep 2020 10:16:30 +0000 (UTC)
Subject: Re: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Stefano Stabellini' <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com>
 <004b01d696ff$76873e50$6395baf0$@xen.org>
 <92d2714b-d762-2f15-086f-58257e3336a8@suse.com>
 <006401d69707$062a5090$127ef1b0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3626d65c-bd5d-f65e-61ca-451110761258@suse.com>
Date: Wed, 30 Sep 2020 12:16:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <006401d69707$062a5090$127ef1b0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 10:52, Paul Durrant wrote:
> Looking again, given that both send_guest_vcpu_virq() and
> send_guest_global_virq() (rightly) hold the evtchn lock before
> calling evtchn_port_set_pending() I think you could do away with
> the virq lock by adding checks in those functions to verify
> evtchn->state == ECS_VIRQ and u.virq == virq after having
> acquired the channel lock but before calling
> evtchn_port_set_pending().

I don't think so: The adjustment of v->virq_to_evtchn[] in
evtchn_close() would then happen with just the domain's event
lock held, which the sending paths don't use at all. The per-
channel lock gets acquired in evtchn_close() a bit later only
(and this lock can't possibly protect per-vCPU state).

In fact I'm now getting puzzled by evtchn_bind_virq() updating
this array with (just) the per-domain lock held. Since it's
the last thing in the function, there's technically no strict
need for acquiring the vIRQ lock, but holding the event lock
definitely doesn't help. All that looks to be needed is the
barrier implied from write_unlock().

Jan

