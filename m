Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D912D2DB6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 16:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47524.84108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmeVt-0006wa-TR; Tue, 08 Dec 2020 15:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47524.84108; Tue, 08 Dec 2020 15:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmeVt-0006wB-Pg; Tue, 08 Dec 2020 15:02:49 +0000
Received: by outflank-mailman (input) for mailman id 47524;
 Tue, 08 Dec 2020 15:02:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmeVs-0006w6-8p
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 15:02:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a04aa700-5cb0-45c0-a96c-2f0a816cb239;
 Tue, 08 Dec 2020 15:02:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67180AD6B;
 Tue,  8 Dec 2020 15:02:46 +0000 (UTC)
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
X-Inumbo-ID: a04aa700-5cb0-45c0-a96c-2f0a816cb239
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607439766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KEpX4ogB3q4fppRhmZvlVE/aFYpKhSkD5hKvAs2ADDc=;
	b=pD8TriR4+3UBbxeamHgn6qY3eGEC1veQ4VY5SbPnJEP1qe/F/FxCnM/Pd03tySS4diP6J8
	OHhve0nFzoPjp3V0+0hL89Y9h75Doikr/n45Sdtt5bQ7GWhGzdEw2LKLxcbX643dSQr5j/
	Jj++r8g8mfHWNduJEnASbf6QqIc/BEo=
Subject: Re: [PATCH V3 04/23] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Tim Deegan
 <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-5-git-send-email-olekstysh@gmail.com>
 <d1fdebe9-3355-fece-e9dc-e6a7acc180e7@suse.com>
 <4a82d6f3-6b6c-566a-6ad0-36e22df323fa@gmail.com>
 <536b5e63-0605-f4d3-e163-dff67ec0422d@suse.com>
 <8ee60a49-8e64-ae25-510b-42eb243ea3ae@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7343410-5fc8-7549-0bdc-9fd822570742@suse.com>
Date: Tue, 8 Dec 2020 16:02:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <8ee60a49-8e64-ae25-510b-42eb243ea3ae@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.12.2020 14:56, Oleksandr wrote:
> 
> On 08.12.20 11:21, Jan Beulich wrote:
> 
> Hi Jan
> 
>> On 07.12.2020 20:43, Oleksandr wrote:
>>> On 07.12.20 13:41, Jan Beulich wrote:
>>>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>>>> @@ -38,42 +37,6 @@ int arch_ioreq_server_get_type_addr(const struct domain *d,
>>>>>                                        uint64_t *addr);
>>>>>    void arch_ioreq_domain_init(struct domain *d);
>>>> As already mentioned in an earlier reply: What about these? They
>>>> shouldn't get declared once per arch. If anything, ones that
>>>> want to be inline functions can / should remain in the per-arch
>>>> header.
>>> Don't entirely get a suggestion. Is the suggestion to make "simple" ones
>>> inline? Why not, there are a few ones which probably want to be inline,
>>> such as the following for example:
>>> - arch_ioreq_domain_init
>>> - arch_ioreq_server_destroy
>>> - arch_ioreq_server_destroy_all
>>> - arch_ioreq_server_map_mem_type (probably)
> 
> 
> First of all, thank you for the clarification, now your point is clear 
> to me.
> 
> 
>> Before being able to make a suggestion, I need to have my question
>> answered: Why do the arch_*() declarations live in the arch header?
>> They represent a common interface (between common and arch code)
>> and hence should be declared in exactly one place.
> 
> I got it, I had a wrong assumption that arch hooks declarations should 
> live in arch code.
> 
> 
>> It is only at
>> the point where you/we _consider_ making some of them inline that
>> moving those (back) to the arch header may make sense. Albeit even
>> then I'd prefer if only the ones get moved which are expected to
>> be inline for all arch-es. Others would better have the arch header
>> indicate to the common one that no declaration is needed (such that
>> the declaration still remains common for all arch-es using out-of-
>> line functions).
> I got it as well.
> 
> Well, I think, in order to address your comments two options are available:
> 1. All arch hooks are out-of-line: мove all arch hook declarations to 
> the common header here and modify
> "[PATCH V3 14/23] arm/ioreq: Introduce arch specific bits for IOREQ/DM 
> features" to make all Arm variants
> out-of-line (I made them inline since all of them are just stubs).
> 2. Some of arch hooks are inline: consider which want to be inline (for 
> both arch-es) and place them into arch headers, other ones
> should remain in the common header.
> 
> My question is which option is more suitable?

And the presumably very helpful to you answer is "Depends." It's a
case by case judgement call in the end.

Sorry, Jan

