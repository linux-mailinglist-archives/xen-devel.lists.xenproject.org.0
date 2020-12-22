Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2032E09AA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 12:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57773.101241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfqD-0007Rl-Cj; Tue, 22 Dec 2020 11:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57773.101241; Tue, 22 Dec 2020 11:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfqD-0007RG-8n; Tue, 22 Dec 2020 11:28:33 +0000
Received: by outflank-mailman (input) for mailman id 57773;
 Tue, 22 Dec 2020 11:28:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if9N=F2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krfqB-0007R2-UD
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 11:28:31 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fce0ce66-1d58-408f-86e3-36e61bd5c93c;
 Tue, 22 Dec 2020 11:28:30 +0000 (UTC)
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
X-Inumbo-ID: fce0ce66-1d58-408f-86e3-36e61bd5c93c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608636510;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=7mnwUyFM7qldS2/h5A7qFmSUCsEV/cNi71B8NCJqCis=;
  b=RvIr17eMpFSWy8aBnfigOh4776gtUZ3lJjjH3ihw5FproT62kElMLXO8
   FfhqmEFN02gZDRfCi5uH9N06LKGbBBgppx6teunlE3x8G6hNzvYjFD/mh
   DYDToHXHhvxpb6nMwdGriBTk3p+aXetTP50j2aeXIFVRjj3uOXTMK7TpH
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: e/WZRKWVXbIqJlO3yymhpgPXIBtfob3+t/AGoVWYDzzSgnw6E7WRxLTIiyR2JfylRytcPtyetf
 qTip63W7RKKFk8P+E98uiKg3IqeTLplSszQ0f3tc48sdRvIdlFYIXhu0ubSxzV109wnJRln3NK
 LPvgjSpGffbuiy1+pvyo9EoRt8jUlurcopXnG9VHS+Q3fUz+/IuacV0tZ+ko56GF/9vvXJkXFK
 HYkpb1iZdJo/u9SV4jX5CBLOMAaLW6cQM1+By2g2/B3ARa5XVRK8QA2jt69tNfdkRUl6af7ydz
 xV8=
X-SBRS: 5.2
X-MesageID: 33755079
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,438,1599537600"; 
   d="scan'208";a="33755079"
Subject: Re: [PATCH 3/3] xen/evtchn: Clean up teardown handling
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-4-andrew.cooper3@citrix.com>
 <3d72bcb6-dabf-2b26-cecd-5f2d36505bd5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <683f7808-aad7-1c42-e9e9-3e251e1a4561@citrix.com>
Date: Tue, 22 Dec 2020 11:28:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3d72bcb6-dabf-2b26-cecd-5f2d36505bd5@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 22/12/2020 10:48, Jan Beulich wrote:
> On 21.12.2020 19:14, Andrew Cooper wrote:
>> First of all, rename the evtchn APIs:
>>  * evtchn_destroy       => evtchn_teardown
>>  * evtchn_destroy_final => evtchn_destroy
> I wonder in how far this is going to cause confusion with backports
> down the road. May I suggest to do only the first of the two renames,
> at least until in a couple of year's time? Or make the second rename
> to e.g. evtchn_cleanup() or evtchn_deinit()?

I considered backports, but I don't think it will be an issue.  The
contents of the two functions are very different, and we're not likely
to be moving the callers in backports.

I'm not fussed about the exact naming, so long as we can make and
agreement and adhere to it strictly.  The current APIs are a total mess.

I used teardown/destroy because that seems to be one common theme in the
APIs, but it will require some to change their name.

>> RFC.  While testing this, I observed this, after faking up an -ENOMEM in
>> dom0's construction:
>>
>>   (XEN) [2020-12-21 16:31:20] NX (Execute Disable) protection active
>>   (XEN) [2020-12-21 16:33:04]
>>   (XEN) [2020-12-21 16:33:04] ****************************************
>>   (XEN) [2020-12-21 16:33:04] Panic on CPU 0:
>>   (XEN) [2020-12-21 16:33:04] Error creating domain 0
>>   (XEN) [2020-12-21 16:33:04] ****************************************
>>
>> XSA-344 appears to have added nearly 2 minutes of wallclock time into the
>> domain_create() error path, which isn't ok.
>>
>> Considering that event channels haven't even been initialised in this
>> particular scenario, it ought to take ~0 time.  Even if event channels have
>> been initalised, none can be active as the domain isn't visible to the system.
> evtchn_init() sets d->valid_evtchns to EVTCHNS_PER_BUCKET. Are you
> suggesting cleaning up one bucket's worth of unused event channels
> takes two minutes? If this is really the case, and considering there
> could at most be unbound Xen channels, perhaps we could avoid
> calling evtchn_teardown() from domain_create()'s error path? We'd
> need to take care of the then missing accounting (->active_evtchns
> and ->xen_evtchns), but this should be doable.

Actually, its a bug in this patch.  evtchn_init() hasn't been called, so
d->valid_evtchns is 0, so the loop is 2^32 iterations long.  Luckily,
this is easy to fix.

As for avoiding calling, specifically not.  Part of the problem we're
trying to fix is that we've got two different destruction paths, and
making domain_teardown() be fully idempotent is key to fixing that.

~Andrew

