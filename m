Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8DF2E09DC
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 12:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57786.101268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krgDU-0001iG-Nz; Tue, 22 Dec 2020 11:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57786.101268; Tue, 22 Dec 2020 11:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krgDU-0001hr-Ke; Tue, 22 Dec 2020 11:52:36 +0000
Received: by outflank-mailman (input) for mailman id 57786;
 Tue, 22 Dec 2020 11:52:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krgDT-0001hm-Dg
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 11:52:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 983a53a0-38af-4aa6-910a-18bb8a05b237;
 Tue, 22 Dec 2020 11:52:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1CC2FADB3;
 Tue, 22 Dec 2020 11:52:31 +0000 (UTC)
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
X-Inumbo-ID: 983a53a0-38af-4aa6-910a-18bb8a05b237
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608637951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqsGKp3H6bLKfmPWos/HnudJ76u8DRU9rk/i88PzAYk=;
	b=cxGoyC6cvkemSj/YQkOeT1z0fhVE4leNx+111A0XPh7a8D/YXPEVjjWL8URNQqvuxVMBXV
	/g1LyEQc12+RzPcAW6ArbypeKTGn+uoWEwpWFH16ZDik8cnj2WpXP1GynsQzCWQ2qrMtJ6
	POV65W2bEN67R9eCLTAvJFZHRgpl1HQ=
Subject: Re: [PATCH 3/3] xen/evtchn: Clean up teardown handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-4-andrew.cooper3@citrix.com>
 <3d72bcb6-dabf-2b26-cecd-5f2d36505bd5@suse.com>
 <683f7808-aad7-1c42-e9e9-3e251e1a4561@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d66a8c9-e3d6-e329-7daf-6b1d0e220e13@suse.com>
Date: Tue, 22 Dec 2020 12:52:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <683f7808-aad7-1c42-e9e9-3e251e1a4561@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.12.2020 12:28, Andrew Cooper wrote:
> On 22/12/2020 10:48, Jan Beulich wrote:
>> On 21.12.2020 19:14, Andrew Cooper wrote:
>>> First of all, rename the evtchn APIs:
>>>  * evtchn_destroy       => evtchn_teardown
>>>  * evtchn_destroy_final => evtchn_destroy
>> I wonder in how far this is going to cause confusion with backports
>> down the road. May I suggest to do only the first of the two renames,
>> at least until in a couple of year's time? Or make the second rename
>> to e.g. evtchn_cleanup() or evtchn_deinit()?
> 
> I considered backports, but I don't think it will be an issue.  The
> contents of the two functions are very different, and we're not likely
> to be moving the callers in backports.

Does the same also apply to the old and new call sites of the functions?

> I'm not fussed about the exact naming, so long as we can make and
> agreement and adhere to it strictly.  The current APIs are a total mess.
> 
> I used teardown/destroy because that seems to be one common theme in the
> APIs, but it will require some to change their name.

So for domains "teardown" and "destroy" pair up with "create". I don't
think evtchn_create() is a sensible name (the function doesn't really
"create" anything); evtchn_init() seems quite a bit better to me, and
hence evtchn_deinit() could be its counterpart. In particular I don't
think all smaller entity functions involved in doing "xyz" for a
larger entity need to have "xyz" in their names.

Jan

