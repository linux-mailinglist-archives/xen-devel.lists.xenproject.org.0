Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5A92C07F4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 13:51:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34203.65064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBIn-0003ZM-Pg; Mon, 23 Nov 2020 12:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34203.65064; Mon, 23 Nov 2020 12:50:41 +0000
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
	id 1khBIn-0003Yz-Mm; Mon, 23 Nov 2020 12:50:41 +0000
Received: by outflank-mailman (input) for mailman id 34203;
 Mon, 23 Nov 2020 12:50:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBIm-0003Yu-Sw
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:50:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9af8a926-941b-4b3b-b27d-c480e5efbaec;
 Mon, 23 Nov 2020 12:50:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22C56AC2E;
 Mon, 23 Nov 2020 12:50:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBIm-0003Yu-Sw
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:50:40 +0000
X-Inumbo-ID: 9af8a926-941b-4b3b-b27d-c480e5efbaec
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9af8a926-941b-4b3b-b27d-c480e5efbaec;
	Mon, 23 Nov 2020 12:50:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606135839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B92wNGMBZyqdB83JFdpLlQToKw+/MZ3Rz0BnXyrEf24=;
	b=OrE3mqM894tK8rhjsI+bVI4cPO9D/XuqWsgAWvq340T6wHZKlZ5le5dcBvwNZN5mXvYHPM
	83IpaxXC53sZc2ptyzFLNRP0oxVc+g51ThytqZogsJYCYZVo7hy2JRnhpB+CE8RcaONEhI
	udu76q2vNI9YzbJOh6xZVDSmkAOiBv4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 22C56AC2E;
	Mon, 23 Nov 2020 12:50:39 +0000 (UTC)
Subject: Re: Ping: [PATCH v2] x86/PV: make post-migration page state
 consistent
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <07ebce3c-4dcf-bc9e-6d82-7f3def486ab8@suse.com>
 <b733914b-1bfd-d95d-470e-af3ca7a4f69f@suse.com>
 <e2ac69e3-64ef-5362-427b-7e52735ea834@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8df7e434-6cea-54ca-4f24-09cbd692ad3b@suse.com>
Date: Mon, 23 Nov 2020 13:50:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e2ac69e3-64ef-5362-427b-7e52735ea834@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.11.2020 13:26, Andrew Cooper wrote:
> On 20/11/2020 12:48, Jan Beulich wrote:
>> On 04.11.2020 08:56, Jan Beulich wrote:
>>> When a page table page gets de-validated, its type reference count drops
>>> to zero (and PGT_validated gets cleared), but its type remains intact.
>>> XEN_DOMCTL_getpageframeinfo3, therefore, so far reported prior usage for
>>> such pages. An intermediate write to such a page via e.g.
>>> MMU_NORMAL_PT_UPDATE, however, would transition the page's type to
>>> PGT_writable_page, thus altering what XEN_DOMCTL_getpageframeinfo3 would
>>> return. In libxc the decision which pages to normalize / localize
>>> depends solely on the type returned from the domctl. As a result without
>>> further precautions the guest won't be able to tell whether such a page
>>> has had its (apparent) PTE entries transitioned to the new MFNs.
>>>
>>> Add a check of PGT_validated, thus consistently avoiding normalization /
>>> localization in the tool stack.
>>>
>>> Also use XEN_DOMCTL_PFINFO_NOTAB in the variable's initializer instead
>>> open coding it.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> v2: Don't change type's type.
>> Ping?
> 
> Ping what?  There is still nothing addressing my concerns from v1.

I did reply to your concerns on Sep 11th, and then replied to this
reply of mine another time on Sep 28th. Neither of these got any
response from you, hence I had to conclude - after two further
pings on v1 - that they were satisfactory to you. Now you say they
weren't, but without saying in which way, so I still wouldn't know
what to change in the description.

On the code change itself you did say "... so this is probably a
good change", so I was further understanding that your concern is
merely with the description. Maybe I misunderstood this aspect,
too?

> To re-iterate - this is a very subtle change, in a very complicated
> piece of migration.  As the problems described do not manifest in
> practice, it is vital to understand why.

Until now it has been my understanding that they just don't happen
to manifest, because guests know to behave themselves (read: pin,
first and foremost, all their page tables, which means we wouldn't
in practice run into ones with an in-flight state change).

Jan

