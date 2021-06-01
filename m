Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A533972E1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 13:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134812.250768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo2yq-0002va-MZ; Tue, 01 Jun 2021 11:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134812.250768; Tue, 01 Jun 2021 11:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo2yq-0002tj-IK; Tue, 01 Jun 2021 11:54:44 +0000
Received: by outflank-mailman (input) for mailman id 134812;
 Tue, 01 Jun 2021 11:54:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lo2yo-0002tc-Ip
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 11:54:42 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d55c1ba9-0e74-4586-afef-48d0351a6c85;
 Tue, 01 Jun 2021 11:54:40 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 043AC2191F;
 Tue,  1 Jun 2021 11:54:40 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C1FBB118DD;
 Tue,  1 Jun 2021 11:54:39 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id qlwZLv8ftmCxRAAALh3uQQ
 (envelope-from <jbeulich@suse.com>); Tue, 01 Jun 2021 11:54:39 +0000
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
X-Inumbo-ID: d55c1ba9-0e74-4586-afef-48d0351a6c85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622548480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nB/B+v2Z9jxJ+dqPH9aL68ZYBi20yAHgPl9ohZJGzY0=;
	b=Pu+k8SPK+3Ji93GRnjIUTOPBAoOzzJI5Oe6fheR4CNak+VknEs3ZAs36vqfaq/fQY6yQ8y
	4co+cU+BzLJIC2pfHbYjJF8EdaZ//sNJ44IO/ong6Br9wgf1zrrztgE/a4/uzco/vB1TLm
	4vQoA1RVscyD7yixGbpTNKpTBulp0pQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622548479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nB/B+v2Z9jxJ+dqPH9aL68ZYBi20yAHgPl9ohZJGzY0=;
	b=jCiwIqgJIm08q1d/DaKxisG8UbpzfiAS7POqz8jA4Wi+gMk/RE5NVxb/aWW34ghahUVn/1
	WvXyvBJvHo+w3NCZ0gjgCckEd/1D54/QH8vPzWXx4fBXS82/zr1VZFXwsywHWbqXM463xp
	Gr5gMjGdEji2HPEGXUgB9C8dDh4wvao=
Subject: Re: [PATCH v6 1/3] evtchn: slightly defer lock acquire where possible
To: Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
 <5939858e-1c7c-5658-bc2d-0c9024c74040@suse.com>
 <938eb888-ec15-feb1-19f7-b90dfee822ae@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e5e6ab32-815c-49d8-94f3-a75d975465b3@suse.com>
Date: Tue, 1 Jun 2021 13:54:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <938eb888-ec15-feb1-19f7-b90dfee822ae@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.05.2021 20:48, Julien Grall wrote:
> On 27/05/2021 12:28, Jan Beulich wrote:
>> port_is_valid() and evtchn_from_port() are fine to use without holding
>> any locks. Accordingly acquire the per-domain lock slightly later in
>> evtchn_close() and evtchn_bind_vcpu().
> 
> So I agree that port_is_valid() and evtchn_from_port() are fine to use 
> without holding any locks in evtchn_bind_vcpu(). However, this is 
> misleading to say there is no problem with evtchn_close().
> 
> evtchn_close() can be called with current != d and therefore, there is a 
> risk that port_is_valid() may be valid and then invalid because 
> d->valid_evtchns is decremented in evtchn_destroy().

While this is the case for other functions as well (and hence a
comment along the lines of what you ask for below should have
been in place already), I've added

/*
 * While calling the function is okay without holding a suitable lock yet
 * (see the comment ahead of struct evtchn_port_ops for which ones those
 * are), for a dying domain it may start returning false at any point - see
 * evtchn_destroy(). This is not a fundamental problem though, as the
 * struct evtchn instance won't disappear (and will continue to hold valid
 * data) until final cleanup of the domain, at which point the domain itself
 * cannot be looked up anymore and hence calls here can't occur anymore in
 * the first place.
 */

...

> Thankfully the memory is still there. So the current code is okayish and 
> I could reluctantly accept this behavior to be spread. However, I don't 
> think this should be left uncommented in both the code (maybe on top of 
> port_is_valid()?) and the commit message.

... ahead of port_is_valid() (and not, as I did intend originally,
in evtchn_close()). As far as the commit message goes, I'll have it
refer to the comment only.

I hope this satisfies the requests of both of you. I'll take the
liberty and retain your ack, Roger.

Jan

