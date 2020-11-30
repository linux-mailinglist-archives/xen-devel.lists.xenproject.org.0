Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE22C83E0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 13:09:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41063.74166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjhzW-0004uM-Mw; Mon, 30 Nov 2020 12:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41063.74166; Mon, 30 Nov 2020 12:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjhzW-0004tx-JH; Mon, 30 Nov 2020 12:09:14 +0000
Received: by outflank-mailman (input) for mailman id 41063;
 Mon, 30 Nov 2020 12:09:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj5U=FE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kjhzV-0004ts-4d
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 12:09:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7bbcd17d-f33e-46e6-9fe3-fcc10a745539;
 Mon, 30 Nov 2020 12:09:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D366AC91;
 Mon, 30 Nov 2020 12:09:11 +0000 (UTC)
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
X-Inumbo-ID: 7bbcd17d-f33e-46e6-9fe3-fcc10a745539
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606738151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+Ui8SwHQZa3iP+Gts8zCQ4ObScAO+xHJ1EnaXEaAcg=;
	b=O/MR1I7qEg+DF+XDfCCqR64i0zYZIRXF8TuAMZ4vcgMN+AsYai3hSPy7qzH+xDgkT9q48h
	ZMN63bCJTVVH0WdmgBmeeYo6PdxE8l21goTXTSOxNqIefvrfyBsEtsxPGvnUQ9Go2IXAID
	tThQjnEU8MgzKZEUSVLcKr8k2mT90zQ=
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201127133121.GN1717@antioche.eu.org>
 <96aa5a9b-3f4a-ce9d-0f41-4a24d409ed55@suse.com>
 <20201127135929.GR1717@antioche.eu.org>
 <20201127202211.eqrxloii5x54zode@Air-de-Roger>
 <20201127214420.GA637@antioche.eu.org>
 <20201128145311.3gmzq5lnkz6ajdtr@Air-de-Roger>
 <20201128171430.GB631@antioche.eu.org>
 <819e859e-0fd2-cdbf-6126-46c924364d12@suse.com>
 <20201130113527.GE1084@antioche.eu.org>
 <7e284ec6-a3a3-6c04-ce48-10a8290304d5@suse.com>
 <20201130115013.GF1084@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9fc635f0-3a80-892f-cc7a-8c30e35a6f2d@suse.com>
Date: Mon, 30 Nov 2020 13:09:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201130115013.GF1084@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.11.2020 12:50, Manuel Bouyer wrote:
> On Mon, Nov 30, 2020 at 12:44:23PM +0100, Jan Beulich wrote:
>> On 30.11.2020 12:35, Manuel Bouyer wrote:
>>> On Mon, Nov 30, 2020 at 11:00:23AM +0100, Jan Beulich wrote:
>>>> On 28.11.2020 18:14, Manuel Bouyer wrote:
>>>>> On Sat, Nov 28, 2020 at 03:53:11PM +0100, Roger Pau Monné wrote:
>>>>>>> the trace is at
>>>>>>> http://www-soc.lip6.fr/~bouyer/xen-log13.txt
>>>>>>
>>>>>> Thanks! I think I've found the issue and I'm attaching a possible fix
>>>>>> (fix.patch) to this email. In any case I've also attached a further
>>>>>> debug patch, in case the fix turns out to be wrong. Please test the
>>>>>> fix first, as the debug patch will end up triggering a panic when the
>>>>>> buffer is full.
>>>>>
>>>>> Yes, fix.patch does make the system boot as expected !
>>>>
>>>> May I translate this to a Tested-by?
>>>>
>>>> Patch also
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> Thanks much to both of you for all the effort here!
>>>
>>> Also, please don't forget the attached patch !
>>> Without it, the hypervisor panics.
>>
>> Well - this one still needs a proper description and S-o-b.
>> The other one came in immediately consumable shape right away.
> 
> The patch was sent by Roger on 12 Nov 2020, in reply to my mail
> about the panic.

I'm aware, but that wasn't a patch I can take and commit. I'm not
even entirely certain the code change is the final one, not the
least because of not having seen a description of the change, yet.

Jan

