Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCC82B1DB6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26589.55064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdaPy-0004QG-6p; Fri, 13 Nov 2020 14:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26589.55064; Fri, 13 Nov 2020 14:51:14 +0000
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
	id 1kdaPy-0004Pt-3O; Fri, 13 Nov 2020 14:51:14 +0000
Received: by outflank-mailman (input) for mailman id 26589;
 Fri, 13 Nov 2020 14:51:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdaPx-0004PN-0B
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:51:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dbc3d37-bdda-4882-9965-7dd599e94b12;
 Fri, 13 Nov 2020 14:51:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94D84ABD9;
 Fri, 13 Nov 2020 14:51:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdaPx-0004PN-0B
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:51:13 +0000
X-Inumbo-ID: 9dbc3d37-bdda-4882-9965-7dd599e94b12
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9dbc3d37-bdda-4882-9965-7dd599e94b12;
	Fri, 13 Nov 2020 14:51:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605279070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDb9in0YbXVzlZP+6Vozv8QOtD+q7q4rKAhEl1KpMRs=;
	b=qUrm5ipxjA/JOIdLZy5XRhcwAenPQs7IZUCuwm5kJY5AyONc557/3TcI7eHRw4zI/GNE4M
	Ouc41yC66ypha43AntP5qfHd57mtvffxtIJSw4BqZI3VGGa5ROQv8pHL6V+swSwK5H5dzB
	gShDOzd501YuoazVOH5UAppIVZCAfrg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 94D84ABD9;
	Fri, 13 Nov 2020 14:51:10 +0000 (UTC)
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
 <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
 <1fe15b9a-6f5d-1209-8ff5-af7c4fc0d637@epam.com>
 <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
 <3d6e5aab-ff89-7859-09c6-5ecb0c052511@epam.com>
 <1c88fef1-8558-fde1-02c7-8a68f6ecf312@suse.com>
 <67fd5df7-2ad2-08e5-294e-b769429164f0@epam.com>
 <03e23a66-619f-e846-cf61-a33ca5d9f0b4@suse.com>
 <b151e6d2-5480-d201-432a-bece208a1fd9@epam.com>
 <c58c1393-381a-d995-6e41-fa3251f67bd7@suse.com>
 <8fc22774-7380-2de1-9c30-6649a79fdfe1@epam.com>
 <46c75ee1-758c-8a42-d8d3-8d42cce3240a@suse.com>
 <66cb04c5-5e98-6a4d-da88-230b2dbc3d98@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <04059ce3-7009-9e1e-8ba2-398cc993d81b@suse.com>
Date: Fri, 13 Nov 2020 15:51:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <66cb04c5-5e98-6a4d-da88-230b2dbc3d98@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.11.2020 15:44, Oleksandr Andrushchenko wrote:
> 
> On 11/13/20 4:38 PM, Jan Beulich wrote:
>> On 13.11.2020 15:32, Oleksandr Andrushchenko wrote:
>>> On 11/13/20 4:23 PM, Jan Beulich wrote:
>>>>    Earlier on I didn't say you should get this to work, only
>>>> that I think the general logic around what you add shouldn't make
>>>> things more arch specific than they really should be. That said,
>>>> something similar to the above should still be doable on x86,
>>>> utilizing struct pci_seg's bus2bridge[]. There ought to be
>>>> DEV_TYPE_PCI_HOST_BRIDGE entries there, albeit a number of them
>>>> (provided by the CPUs themselves rather than the chipset) aren't
>>>> really host bridges for the purposes you're after.
>>> You mean I can still use DEV_TYPE_PCI_HOST_BRIDGE as a marker
>>>
>>> while trying to detect what I need?
>> I'm afraid I don't understand what marker you're thinking about
>> here.
> 
> I mean that when I go over bus2bridge entries, should I only work with
> 
> those who have DEV_TYPE_PCI_HOST_BRIDGE?

Well, if you're after host bridges - yes.

Jan

