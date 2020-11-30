Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3041E2C818F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:00:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40765.73685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjfyt-00054a-O9; Mon, 30 Nov 2020 10:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40765.73685; Mon, 30 Nov 2020 10:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjfyt-00054B-L2; Mon, 30 Nov 2020 10:00:27 +0000
Received: by outflank-mailman (input) for mailman id 40765;
 Mon, 30 Nov 2020 10:00:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj5U=FE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kjfys-000546-D8
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:00:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c1a65e4-b029-4ca9-acc6-5e72e9e4b163;
 Mon, 30 Nov 2020 10:00:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE01BACBA;
 Mon, 30 Nov 2020 10:00:24 +0000 (UTC)
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
X-Inumbo-ID: 6c1a65e4-b029-4ca9-acc6-5e72e9e4b163
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606730424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95uC2XHwBM4RWytiVJt2lQqM6w1sQucsXLg4nBaFplc=;
	b=TRQe+uT8V49+lW1EtQsorkD2aXfwKk5rsbnpjbCZZUpYdJeOwlQkcnqYpk9gECoOzbwirJ
	OEqbwS79KicDolM4sYnhFL1SWegCOD4wl0LrO5bZ9D7N8W8cw2pGsEFZnWb9qFN4Q8Mi2h
	ZlokNz2AJyq3xoZ4ZCmN9gXbsnuRPng=
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Manuel Bouyer <bouyer@antioche.eu.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
 <e9610278-84e5-dc32-b568-8867011de4e4@suse.com>
 <20201127131324.GJ1717@antioche.eu.org>
 <714e9393-d7f4-ed47-d1ed-aff79f3552a0@suse.com>
 <20201127133121.GN1717@antioche.eu.org>
 <96aa5a9b-3f4a-ce9d-0f41-4a24d409ed55@suse.com>
 <20201127135929.GR1717@antioche.eu.org>
 <20201127202211.eqrxloii5x54zode@Air-de-Roger>
 <20201127214420.GA637@antioche.eu.org>
 <20201128145311.3gmzq5lnkz6ajdtr@Air-de-Roger>
 <20201128171430.GB631@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <819e859e-0fd2-cdbf-6126-46c924364d12@suse.com>
Date: Mon, 30 Nov 2020 11:00:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128171430.GB631@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.11.2020 18:14, Manuel Bouyer wrote:
> On Sat, Nov 28, 2020 at 03:53:11PM +0100, Roger Pau Monné wrote:
>>> the trace is at
>>> http://www-soc.lip6.fr/~bouyer/xen-log13.txt
>>
>> Thanks! I think I've found the issue and I'm attaching a possible fix
>> (fix.patch) to this email. In any case I've also attached a further
>> debug patch, in case the fix turns out to be wrong. Please test the
>> fix first, as the debug patch will end up triggering a panic when the
>> buffer is full.
> 
> Yes, fix.patch does make the system boot as expected !

May I translate this to a Tested-by?

Patch also
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks much to both of you for all the effort here!

Jan

