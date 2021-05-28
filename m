Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C348C3940D6
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 12:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133885.249380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmZeE-0001fa-Fi; Fri, 28 May 2021 10:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133885.249380; Fri, 28 May 2021 10:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmZeE-0001cm-CT; Fri, 28 May 2021 10:23:22 +0000
Received: by outflank-mailman (input) for mailman id 133885;
 Fri, 28 May 2021 10:23:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wdiM=KX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmZeD-0001cg-HZ
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 10:23:21 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a46a3ef-3fd3-426f-b862-e8254683bd2f;
 Fri, 28 May 2021 10:23:20 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B1BAF218B0;
 Fri, 28 May 2021 10:23:19 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 8169311A98;
 Fri, 28 May 2021 10:23:19 +0000 (UTC)
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
X-Inumbo-ID: 7a46a3ef-3fd3-426f-b862-e8254683bd2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622197399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jje4WFECR2yDCHwR5cyInBEfgUwMw9ZzVmyalZLt7js=;
	b=tTNaRCno8M6wrKT5UJBBJi8x4DZWBWWPN4iT5hV+iLb26kzawVTB/hstOaOVsH42Yx0MgK
	GzDD/b3WNFMR21gtwFaVlFaasPxjvPC1/FkmCv6ihDPbejn5BDNs96aIvj2gWDVMCX5ub3
	ABbYlB6FRTcERJ51RCktGq2QrLnghQI=
Subject: Re: [PATCH v6 1/3] evtchn: slightly defer lock acquire where possible
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
 <5939858e-1c7c-5658-bc2d-0c9024c74040@suse.com>
 <938eb888-ec15-feb1-19f7-b90dfee822ae@xen.org>
 <YLCqQz9xS4HEpabG@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <27d54d81-bec8-5bc7-39cd-60e9761e726b@suse.com>
Date: Fri, 28 May 2021 12:23:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLCqQz9xS4HEpabG@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.05.2021 10:30, Roger Pau Monné wrote:
> On Thu, May 27, 2021 at 07:48:41PM +0100, Julien Grall wrote:
>> On 27/05/2021 12:28, Jan Beulich wrote:
>>> port_is_valid() and evtchn_from_port() are fine to use without holding
>>> any locks. Accordingly acquire the per-domain lock slightly later in
>>> evtchn_close() and evtchn_bind_vcpu().
>>
>> So I agree that port_is_valid() and evtchn_from_port() are fine to use
>> without holding any locks in evtchn_bind_vcpu(). However, this is misleading
>> to say there is no problem with evtchn_close().
>>
>> evtchn_close() can be called with current != d and therefore, there is a
> 
> The only instances evtchn_close is called with current != d and the
> domain could be unpaused is in free_xen_event_channel AFAICT.

As long as the domain is not paused, ->valid_evtchns can't ever
decrease: The only point where this gets done is in evtchn_destroy().
Hence ...

>> risk that port_is_valid() may be valid and then invalid because
>> d->valid_evtchns is decremented in evtchn_destroy().
> 
> Hm, I guess you could indeed have parallel calls to
> free_xen_event_channel and evtchn_destroy in a way that
> free_xen_event_channel could race with valid_evtchns getting
> decreased?

... I don't see this as relevant.

>> Thankfully the memory is still there. So the current code is okayish and I
>> could reluctantly accept this behavior to be spread. However, I don't think
>> this should be left uncommented in both the code (maybe on top of
>> port_is_valid()?) and the commit message.
> 
> Indeed, I think we need some expansion of the comment in port_is_valid
> to clarify all this. I'm not sure I understand it properly myself when
> it's fine to use port_is_valid without holding the per domain event
> lock.

Because of the above property plus the fact that even if
->valid_evtchns decreases, the underlying struct evtchn instance
will remain valid (i.e. won't get de-allocated, which happens only
in evtchn_destroy_final()), it is always fine to use it without
lock. With this I'm having trouble seeing what would need adding
to port_is_valid()'s commentary.

The only thing which shouldn't happen anywhere is following a
port_is_valid() check which has returned false by code assuming
the port is going to remain invalid. But I think that's obvious
when you don't hold any suitable lock.

I do intend to follow Julien's request to explain things more for
evtchn_close().

Jan

