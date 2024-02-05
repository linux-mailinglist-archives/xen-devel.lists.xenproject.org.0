Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742F84A06A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 18:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676449.1052572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX2bn-0008Vo-Jo; Mon, 05 Feb 2024 17:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676449.1052572; Mon, 05 Feb 2024 17:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX2bn-0008TZ-H7; Mon, 05 Feb 2024 17:18:15 +0000
Received: by outflank-mailman (input) for mailman id 676449;
 Mon, 05 Feb 2024 17:18:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rX2bm-0008TT-Ov
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 17:18:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX2bl-00033V-Nz; Mon, 05 Feb 2024 17:18:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX2bl-0004Yg-Ep; Mon, 05 Feb 2024 17:18:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=dtFtpwA9k+Tnq6W1cMFNl2l9PfphsVGGnDsjmQ4CZ+w=; b=QBRMHebTJVKTjLIdSE+xiptcP5
	aVtqNpO23BZNl7LryCBIjieB+z1lKnfrEfWEZoUFmZgeYYNr7UHwRQZDnZJ09KL3dEZl51S3iG3LK
	3jcoF+pjpjG0XnYAYjlJEd/Qv6CkCZ013oqQ7ATGd9FX9uz3kzP7dBZxlue9J6Q3CQZM=;
Message-ID: <c635e693-fe07-458c-9d58-273e2779f5b9@xen.org>
Date: Mon, 5 Feb 2024 17:18:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/32] tools: enable xenstore-stubdom to use 9pfs
Content-Language: en-GB
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20240205105001.24171-1-jgross@suse.com>
 <689635a7-6d34-44fe-b00b-31fdc03f6969@xen.org>
 <d4740502-795a-4e22-afe2-abd0746da843@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d4740502-795a-4e22-afe2-abd0746da843@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 05/02/2024 11:08, Jürgen Groß wrote:
> On 05.02.24 11:55, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 05/02/2024 10:49, Juergen Gross wrote:
>>> This series is adding 9pfs support to Xenstore-stubdom, enabling it
>>> to do logging to a dom0 directory.
>>>
>>> This is a prerequisite for the final goal to add live update support
>>> to Xenstore-stubdom, as it enables the stubdom to store its state in
>>> a dom0 file.
>>>
>>> The 9pfs backend is a new daemon written from scratch. Using a
>>> dedicated 9pfs daemon has several advantages:
>>>
>>> - it is using much less resources than a full blown qemu process
>>> - it can serve multiple guests (the idea is to use it for other
>>>    infrastructure domains, like qemu-stubdom or driver domains, too)
>>> - it is designed to support several security enhancements, like
>>>    limiting the number of files for a guest, or limiting the allocated
>>>    file system space
>>> - it doesn't support file links (neither hard nor soft links) or
>>>    referencing parent directories via "..", minimizing the risk that
>>>    a guest can "escape" from its home directory
>>>
>>> Note that for now the daemon only contains the minimal needed
>>> functionality to do logging from Xenstore-stubdom. I didn't want to
>>> add all the 9pfs commands and security add-ons in the beginning, in
>>> order to avoid needless efforts in case the idea of the daemon is
>>> being rejected.
>>>
>>> Changes in V4:
>>> - patch 2 of V3 was applied
>>> - added support of reading directories
>>> - addressed review comments
>>>
>>> Changes in V3:
>>> - new patches 1, 23-25
>>> - addressed review comments
>>>
>>> Changes in V2:
>>> - support of multiple rings per device
>>> - xenlogd->xen-9pfsd rename
>>> - addressed review comments
>>> - fixed some bugs
>>>
>>> Juergen Gross (32):
>>>    tools: add access macros for unaligned data
>>>    tools: add a new xen logging daemon
>>>    tools/xen-9pfsd: connect to frontend
>>>    tools/xen-9pfsd: add transport layer
>>>    tools/xen-9pfsd: add 9pfs response generation support
>>>    tools/xen-9pfsd: add 9pfs version request support
>>>    tools/xen-9pfsd: add 9pfs attach request support
>>>    tools/xen-9pfsd: add 9pfs walk request support
>>>    tools/xen-9pfsd: add 9pfs open request support
>>>    tools/xen-9pfsd: add 9pfs clunk request support
>>>    tools/xen-9pfsd: add 9pfs create request support
>>>    tools/xen-9pfsd: add 9pfs stat request support
>>>    tools/xen-9pfsd: add 9pfs write request support
>>>    tools/xen-9pfsd: add 9pfs read request support
>>>    tools/libs/light: add backend type for 9pfs PV devices
>>>    tools/xl: support new 9pfs backend xen_9pfsd
>>>    tools/helpers: allocate xenstore event channel for xenstore stubdom
>>>    tools/xenstored: rename xenbus_evtchn()
>>>    stubdom: extend xenstore stubdom configs
>>>    tools: add 9pfs device to xenstore-stubdom
>>>    tools/xenstored: add early_init() function
>>>    tools/xenstored: move systemd handling to posix.c
>>>    tools/xenstored: move all log-pipe handling into posix.c
>>>    tools/xenstored: move all socket handling into posix.c
>>>    tools/xenstored: get own domid in stubdom case
>>>    tools/xenstored: rework ring page (un)map functions
>>>    tools/xenstored: split domain_init()
>>>    tools/xenstored: map stubdom interface
>>>    tools/xenstored: mount 9pfs device in stubdom
>>>    tools/xenstored: add helpers for filename handling
>>>    tools/xenstored: support complete log capabilities in stubdom
>>>    tools/xenstored: have a single do_control_memreport()
>>
>> I haven't checked what's the state of the 9PFS patches. Can part of 
>> the xenstored changes be committed without the 9PFS changes?
> 
> The following patches can go in without the 9pfs daemon:

It looks like the gitalb CI is not happy with the following patches [1]:

In function ‘free_stat’,
     inlined from ‘write_9pfs’ at 9pfront.c:935:9:
9pfront.c:120:14: error: ‘stat.name’ may be used uninitialized 
[-Werror=maybe-uninitialized]
   120 |     free(stat->name);
       |          ~~~~^~~~~~
9pfront.c: In function ‘write_9pfs’:
9pfront.c:929:20: note: ‘stat’ declared here
   929 |     struct p9_stat stat;
       |                    ^~~~

I think...

> 
> tools/helpers: allocate xenstore event channel for xenstore stubdom
> tools/xenstored: rename xenbus_evtchn()
> stubdom: extend xenstore stubdom configs

.. this is related to this patch. Can you have a look?

I have just pushed a new branch without this patch. Let see if the CI 
[2] will pass this time.

> tools/xenstored: add early_init() function
> tools/xenstored: move systemd handling to posix.c
> tools/xenstored: move all log-pipe handling into posix.c
> tools/xenstored: move all socket handling into posix.c
> tools/xenstored: get own domid in stubdom case
> tools/xenstored: rework ring page (un)map functions
> tools/xenstored: split domain_init()
> tools/xenstored: map stubdom interface

Cheers,

[1] https://gitlab.com/xen-project/people/julieng/xen/-/pipelines/1165147815
[2] https://gitlab.com/xen-project/people/julieng/xen/-/pipelines/1165166977

-- 
Julien Grall

