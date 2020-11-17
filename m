Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AB72B6CA8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 19:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29199.58452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf5TX-0007bf-D4; Tue, 17 Nov 2020 18:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29199.58452; Tue, 17 Nov 2020 18:13:07 +0000
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
	id 1kf5TX-0007bG-9l; Tue, 17 Nov 2020 18:13:07 +0000
Received: by outflank-mailman (input) for mailman id 29199;
 Tue, 17 Nov 2020 18:13:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kf5TV-0007bB-PR
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 18:13:05 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kf5TV-0006wG-B9; Tue, 17 Nov 2020 18:13:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kf5TV-0007bB-PR
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 18:13:05 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kf5TV-0006wG-B9; Tue, 17 Nov 2020 18:13:05 +0000
Subject: Re: [PATCH v6 0/3] XSA-343 followup patches
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20201109163826.13035-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <aaa3c26f-4bfa-d881-8e72-112e3108f4b5@xen.org>
Date: Tue, 17 Nov 2020 18:13:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201109163826.13035-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 09/11/2020 16:38, Juergen Gross wrote:
> The patches for XSA-343 produced some fallout, especially the event
> channel locking has shown to be problematic.
> 
> Patch 1 is targeting fifo event channels for avoiding any races for the
> case that the fifo queue has been changed for a specific event channel.
> 
> The second patch is modifying the per event channel locking scheme in
> order to avoid deadlocks and problems due to the event channel lock
> having been changed to require IRQs off by the XSA-343 patches.
> 
> Changes in V6:
> - added patch 3 (Jan Beulich)
> - switched some more read_trylock() cases to read_lock() (Jan Beulich)
> 
> Changes in V5:
> - moved evtchn_write_[un]lock() to event_channel.c (Jan Beulich)
> - used normal read_lock() in some cases (Jan Beulich)
> 
> Changes in V4:
> - switched to real rwlock
> 
> Changes in V3:
> - addressed comments
> 
> Juergen Gross (3):
>    xen/events: access last_priority and last_vcpu_id together
>    xen/evtchn: rework per event channel lock
>    xen/evtchn: revert 52e1fc47abc3a0123

While looking at the list of commits, I noticed that the first patch 
hasn't been committed. They were all acked/reviewed, so I am a bit 
puzzled why this was omitted...

I have nearly missed as I was expecting the 3 patches to be committed 
together. May I suggest that in the future we reply to the cover letter 
and mention which patches are (or not) committed?

Regarding patch #1, I will commit it tomorrow unless there are strong 
objections against.

Cheers,

-- 
Julien Grall

