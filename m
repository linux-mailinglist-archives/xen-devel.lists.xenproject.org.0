Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A79296012
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 15:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10435.27731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVajR-0003LF-98; Thu, 22 Oct 2020 13:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10435.27731; Thu, 22 Oct 2020 13:34:17 +0000
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
	id 1kVajR-0003Kq-5j; Thu, 22 Oct 2020 13:34:17 +0000
Received: by outflank-mailman (input) for mailman id 10435;
 Thu, 22 Oct 2020 13:34:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVajP-0003Kl-Us
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:34:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c42782b7-6341-4e94-a04b-5afd271f396b;
 Thu, 22 Oct 2020 13:34:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B4D7AC2F;
 Thu, 22 Oct 2020 13:34:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVajP-0003Kl-Us
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:34:15 +0000
X-Inumbo-ID: c42782b7-6341-4e94-a04b-5afd271f396b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c42782b7-6341-4e94-a04b-5afd271f396b;
	Thu, 22 Oct 2020 13:34:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603373654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0QZIsBzvdYvQS6Vp6oOgnBeT+8YzewYeHdSYJwOlnQo=;
	b=PdrPb2nhcVeXpnsDu1mKva6XijwalG7ehExyqPcpgVQFVuAMrssdgM4P+h3BVCeXZBW0fD
	tPH/YP6k401iW2TVc9xZMOSqLM8iqxyIYZe22bW5tc9CUDK/EZguq0VDSwGPTCRtIWdSmf
	leUphOKxhy3rRCP58dT5d4u58i2sqRI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4B4D7AC2F;
	Thu, 22 Oct 2020 13:34:14 +0000 (UTC)
Subject: Re: [PATCH v2 4/8] evtchn: let evtchn_set_priority() acquire the
 per-channel lock
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <266c9178-700b-5663-4b5f-69f160a165ab@suse.com>
 <20201022111712.g7kvaducfgwa6whn@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36e0adac-21e7-235b-c569-54d9c97f3e77@suse.com>
Date: Thu, 22 Oct 2020 15:34:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201022111712.g7kvaducfgwa6whn@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.10.2020 13:17, Roger Pau Monné wrote:
> On Tue, Oct 20, 2020 at 04:09:41PM +0200, Jan Beulich wrote:
>> Some lock wants to be held to make sure the port doesn't change state,
>> but there's no point holding the per-domain event lock here. Switch to
>> using the finer grained per-channel lock instead.
> 
> While true that's a fine grained lock, it also disables interrupts,
> which the global event_lock didn't.

True, yet we're aiming at dropping this aspect again. Hence I've
added "(albeit as a downside for the time being this requires
disabling interrupts for a short period of time)".

>> FAOD this doesn't guarantee anything towards in particular
>> evtchn_fifo_set_pending(), as for interdomain channels that function
>> would be called with the remote side's per-channel lock held.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

