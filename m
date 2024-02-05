Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5907C849880
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 12:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675943.1051646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwqR-0008Ny-3K; Mon, 05 Feb 2024 11:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675943.1051646; Mon, 05 Feb 2024 11:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwqR-0008Lq-02; Mon, 05 Feb 2024 11:08:59 +0000
Received: by outflank-mailman (input) for mailman id 675943;
 Mon, 05 Feb 2024 11:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwqP-0008JF-PP
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 11:08:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2f31bb7-c416-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 12:08:54 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 814C12212D;
 Mon,  5 Feb 2024 11:08:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 442F8132DD;
 Mon,  5 Feb 2024 11:08:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0IHfDsXBwGWUOwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 11:08:53 +0000
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
X-Inumbo-ID: f2f31bb7-c416-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707131333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OTAX6IEAs+BtLQ3mCkBm+QT1FK6ZCTnoPrPnxLn3ttk=;
	b=ekxObCXlEApDTZ0EY4rTOaL4U2cQ37Fzp0mjVDsYy/WtrKni/xCsp4JDIL5u7uldij9p3I
	iJzXwJcZyKSjnABiU0/aEiXEoeLLFYfQHPMdP4JutLJ423PeOoarpqllzlk7S0v47lEgcd
	REwkwhk+klBYZ8SqARZ749ajHhSFPj8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707131333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OTAX6IEAs+BtLQ3mCkBm+QT1FK6ZCTnoPrPnxLn3ttk=;
	b=ekxObCXlEApDTZ0EY4rTOaL4U2cQ37Fzp0mjVDsYy/WtrKni/xCsp4JDIL5u7uldij9p3I
	iJzXwJcZyKSjnABiU0/aEiXEoeLLFYfQHPMdP4JutLJ423PeOoarpqllzlk7S0v47lEgcd
	REwkwhk+klBYZ8SqARZ749ajHhSFPj8=
Message-ID: <d4740502-795a-4e22-afe2-abd0746da843@suse.com>
Date: Mon, 5 Feb 2024 12:08:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/32] tools: enable xenstore-stubdom to use 9pfs
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20240205105001.24171-1-jgross@suse.com>
 <689635a7-6d34-44fe-b00b-31fdc03f6969@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <689635a7-6d34-44fe-b00b-31fdc03f6969@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.58
X-Spamd-Result: default: False [-3.58 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 BAYES_HAM(-3.00)[100.00%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.71)[subject];
	 FREEMAIL_CC(0.00)[xen.org,citrix.com,gmail.com,ens-lyon.org];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 05.02.24 11:55, Julien Grall wrote:
> Hi Juergen,
> 
> On 05/02/2024 10:49, Juergen Gross wrote:
>> This series is adding 9pfs support to Xenstore-stubdom, enabling it
>> to do logging to a dom0 directory.
>>
>> This is a prerequisite for the final goal to add live update support
>> to Xenstore-stubdom, as it enables the stubdom to store its state in
>> a dom0 file.
>>
>> The 9pfs backend is a new daemon written from scratch. Using a
>> dedicated 9pfs daemon has several advantages:
>>
>> - it is using much less resources than a full blown qemu process
>> - it can serve multiple guests (the idea is to use it for other
>>    infrastructure domains, like qemu-stubdom or driver domains, too)
>> - it is designed to support several security enhancements, like
>>    limiting the number of files for a guest, or limiting the allocated
>>    file system space
>> - it doesn't support file links (neither hard nor soft links) or
>>    referencing parent directories via "..", minimizing the risk that
>>    a guest can "escape" from its home directory
>>
>> Note that for now the daemon only contains the minimal needed
>> functionality to do logging from Xenstore-stubdom. I didn't want to
>> add all the 9pfs commands and security add-ons in the beginning, in
>> order to avoid needless efforts in case the idea of the daemon is
>> being rejected.
>>
>> Changes in V4:
>> - patch 2 of V3 was applied
>> - added support of reading directories
>> - addressed review comments
>>
>> Changes in V3:
>> - new patches 1, 23-25
>> - addressed review comments
>>
>> Changes in V2:
>> - support of multiple rings per device
>> - xenlogd->xen-9pfsd rename
>> - addressed review comments
>> - fixed some bugs
>>
>> Juergen Gross (32):
>>    tools: add access macros for unaligned data
>>    tools: add a new xen logging daemon
>>    tools/xen-9pfsd: connect to frontend
>>    tools/xen-9pfsd: add transport layer
>>    tools/xen-9pfsd: add 9pfs response generation support
>>    tools/xen-9pfsd: add 9pfs version request support
>>    tools/xen-9pfsd: add 9pfs attach request support
>>    tools/xen-9pfsd: add 9pfs walk request support
>>    tools/xen-9pfsd: add 9pfs open request support
>>    tools/xen-9pfsd: add 9pfs clunk request support
>>    tools/xen-9pfsd: add 9pfs create request support
>>    tools/xen-9pfsd: add 9pfs stat request support
>>    tools/xen-9pfsd: add 9pfs write request support
>>    tools/xen-9pfsd: add 9pfs read request support
>>    tools/libs/light: add backend type for 9pfs PV devices
>>    tools/xl: support new 9pfs backend xen_9pfsd
>>    tools/helpers: allocate xenstore event channel for xenstore stubdom
>>    tools/xenstored: rename xenbus_evtchn()
>>    stubdom: extend xenstore stubdom configs
>>    tools: add 9pfs device to xenstore-stubdom
>>    tools/xenstored: add early_init() function
>>    tools/xenstored: move systemd handling to posix.c
>>    tools/xenstored: move all log-pipe handling into posix.c
>>    tools/xenstored: move all socket handling into posix.c
>>    tools/xenstored: get own domid in stubdom case
>>    tools/xenstored: rework ring page (un)map functions
>>    tools/xenstored: split domain_init()
>>    tools/xenstored: map stubdom interface
>>    tools/xenstored: mount 9pfs device in stubdom
>>    tools/xenstored: add helpers for filename handling
>>    tools/xenstored: support complete log capabilities in stubdom
>>    tools/xenstored: have a single do_control_memreport()
> 
> I haven't checked what's the state of the 9PFS patches. Can part of the 
> xenstored changes be committed without the 9PFS changes?

The following patches can go in without the 9pfs daemon:

tools/helpers: allocate xenstore event channel for xenstore stubdom
tools/xenstored: rename xenbus_evtchn()
stubdom: extend xenstore stubdom configs
tools/xenstored: add early_init() function
tools/xenstored: move systemd handling to posix.c
tools/xenstored: move all log-pipe handling into posix.c
tools/xenstored: move all socket handling into posix.c
tools/xenstored: get own domid in stubdom case
tools/xenstored: rework ring page (un)map functions
tools/xenstored: split domain_init()
tools/xenstored: map stubdom interface


Juergen

