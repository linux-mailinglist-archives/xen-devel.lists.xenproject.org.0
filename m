Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8748B1EE484
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 14:37:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgp6l-0004Q4-IV; Thu, 04 Jun 2020 12:36:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jgp6j-0004Pz-Og
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 12:36:29 +0000
X-Inumbo-ID: 02f2fc52-a660-11ea-ae73-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02f2fc52-a660-11ea-ae73-12813bfff9fa;
 Thu, 04 Jun 2020 12:36:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A43AAC4A;
 Thu,  4 Jun 2020 12:36:31 +0000 (UTC)
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
Date: Thu, 4 Jun 2020 14:36:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.06.2020 13:13, Andrew Cooper wrote:
> On 04/06/2020 08:08, Jan Beulich wrote:
>> On 04.06.2020 03:46, Marek Marczykowski-Górecki wrote:
>>> Then, we get the main issue:
>>>
>>>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
>>>     (XEN) domain_crash called from io.c:178
>>>
>>> Note, there was no XEN_DOMCTL_destroydomain for domain 3 nor its stubdom
>>> yet. But XEN_DMOP_remote_shutdown for domain 3 was called already.
>> I'd guess an issue with the shutdown deferral logic. Did you / can
>> you check whether XEN_DMOP_remote_shutdown managed to pause all
>> CPUs (I assume it didn't, since once they're paused there shouldn't
>> be any I/O there anymore, and hence no I/O emulation)?
> 
> The vcpu in question is talking to Qemu, so will have v->defer_shutdown
> intermittently set, and skip the pause in domain_shutdown()
> 
> I presume this lack of pause is to allow the vcpu in question to still
> be scheduled to consume the IOREQ reply?  (Its fairly opaque logic with
> 0 clarifying details).
> 
> What *should* happen is that, after consuming the reply, the vcpu should
> notice and pause itself, at which point it would yield to the
> scheduler.  This is the purpose of vcpu_{start,end}_shutdown_deferral().
> 
> Evidentially, this is not happening.

We can't tell yet, until ...

> Marek: can you add a BUG() after the weird PIO printing?  That should
> confirm whether we're getting into handle_pio() via the
> handle_hvm_io_completion() path, or via the vmexit path (at which case,
> we're fully re-entering the guest).

... we know this. handle_pio() gets called from handle_hvm_io_completion()
after having called hvm_wait_for_io() -> hvm_io_assist() ->
vcpu_end_shutdown_deferral(), so the issue may be that we shouldn't call
handle_pio() (etc) at all anymore in this state. IOW perhaps
hvm_wait_for_io() should return "!sv->vcpu->domain->is_shutting_down"
instead of plain "true"?

Adding Paul to Cc, as being the maintainer here.

Jan

