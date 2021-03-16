Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F74433D17E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 11:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98249.186295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM6hC-00024h-02; Tue, 16 Mar 2021 10:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98249.186295; Tue, 16 Mar 2021 10:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM6hB-00024I-Su; Tue, 16 Mar 2021 10:13:01 +0000
Received: by outflank-mailman (input) for mailman id 98249;
 Tue, 16 Mar 2021 10:13:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lM6hA-00024D-SC
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 10:13:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d15762e-b892-4d39-a3c1-f56dbdaff138;
 Tue, 16 Mar 2021 10:13:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2AA84AE5C;
 Tue, 16 Mar 2021 10:12:59 +0000 (UTC)
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
X-Inumbo-ID: 8d15762e-b892-4d39-a3c1-f56dbdaff138
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615889579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wb4bjy5/2C8ijMBFZMSB47gOHPtLNDU7OWz1ZChrhjg=;
	b=r4TjIAbfZF7de4A3gLd4Mq2M36FIhG2BY4M6NO3LKvnpg5GUaOzd7yV0fOyhXZO2hcNw/w
	wfUos7NrZDaVc6X2f/XxQF7jYpyMkwbZ82O24ebfNuqMNc0P2sffJGrl2fHeqAKdbkjC2m
	IPC6Jr4zUCVKOS/AHb80+8y4CKjy3CM=
Subject: Re: [ANNOUNCE] Xen 4.15 release update - still in feature freeze
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>,
 Dario Faggioli <dfaggioli@suse.com>, committers@xenproject.org,
 xen-devel@lists.xenproject.org
References: <24655.20609.834996.744652@mariner.uk.xensource.com>
 <4531d373-3915-ad90-ef99-4f8cbbdb5054@suse.com>
 <YFB9ux/06pP4hh/Y@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d27dffb-834d-1948-a410-c6d0c462ae63@suse.com>
Date: Tue, 16 Mar 2021 11:12:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFB9ux/06pP4hh/Y@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16.03.2021 10:43, Roger Pau Monné wrote:
> On Mon, Mar 15, 2021 at 02:46:07PM +0100, Jan Beulich wrote:
>> On 15.03.2021 13:18, Ian Jackson wrote:
>>> ISSUES BELIEVED NEWLY RESOLVED
>>> ==============================
>>>
>>> Fallout from MSR handling behavioral change.
>>>
>>> I think there are now no outstanding patches to fix/change MSR
>>> behaviour and there is no longer any blocker here ?
>>
>> In addition to what Andrew has said, while not a blocker in that
>> sense I think the excessive verbosity of the logging is also an
>> issue.
> 
> I think you meant the logging done for each MSR that's not explicitly
> handled?
> 
> While I agree it might be too verbose, I don't see how we can change
> that right now. We could introduce a command line parameter to select
> whether to print those messages or not, but I think that's too
> specific for a command line option.

Yes, I agree.

> We should look into some kind of logging improvements that allow
> selecting which messages to print on a per-domain basis IMO.

Indeed, this was my thinking as well. I was wondering whether we
could at least limit reporting each unhandled MSR only once per
domain. But yes, this would require at least two extra pages to
hold the required bitmaps (one for the MSRs starting at 0x00000000
and the other for the group up from 0xC0000000; a 3rd one for AMD
for the group up from 0xC0010000).

> In any case, those messages will only show up in debug builds, so it's
> mostly annoying to developers but transparent to consumers of the
> production build.

Or when, because of things working differently than before, people
need to be told to increase verbosity for debugging purposes.

Jan

