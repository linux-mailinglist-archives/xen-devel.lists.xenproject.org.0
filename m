Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824FB1D7D42
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 17:48:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jahzd-0005pd-02; Mon, 18 May 2020 15:47:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jahzb-0005ol-FH
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 15:47:51 +0000
X-Inumbo-ID: edbf9e88-991e-11ea-a877-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edbf9e88-991e-11ea-a877-12813bfff9fa;
 Mon, 18 May 2020 15:47:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5ACCCAEDD;
 Mon, 18 May 2020 15:47:52 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] x86/idle: prevent entering C6 with in service
 interrupts on Intel
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200515135802.63853-1-roger.pau@citrix.com>
 <20200515135802.63853-3-roger.pau@citrix.com>
 <e9e337ae-295e-5577-3c6d-a42721190b07@suse.com>
 <20200518154527.GW54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6ce247e4-ef85-6793-68a6-0d1cde7f886d@suse.com>
Date: Mon, 18 May 2020 17:47:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518154527.GW54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.05.2020 17:45, Roger Pau Monné wrote:
> On Mon, May 18, 2020 at 05:05:12PM +0200, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>> On 15.05.2020 15:58, Roger Pau Monne wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -652,6 +652,15 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
>>>  additionally a trace buffer of the specified size is allocated per cpu.
>>>  The debug trace feature is only enabled in debugging builds of Xen.
>>>  
>>> +### disable-c6-errata
>>
>> Hmm, yes please - a disable for errata! ;-)
>>
>> How about "avoid-c6-errata", and then perhaps as a sub-option to
>> "cpuidle="? (If we really want a control for this in the first
>> place.)
> 
> Right, I see I'm very bad at naming. Not sure it's even worth it
> maybe?
> 
> I can remove it completely from the patch if that is OK.

I'd be fine without. Andrew?

Jan

