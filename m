Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D361829EC73
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 14:06:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14159.35149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY7cR-0001mJ-42; Thu, 29 Oct 2020 13:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14159.35149; Thu, 29 Oct 2020 13:05:31 +0000
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
	id 1kY7cR-0001lx-0v; Thu, 29 Oct 2020 13:05:31 +0000
Received: by outflank-mailman (input) for mailman id 14159;
 Thu, 29 Oct 2020 13:05:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY7cQ-0001ls-1o
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 13:05:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfa4114d-9e52-4e67-92ab-7e99f77221a3;
 Thu, 29 Oct 2020 13:05:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB72EAE63;
 Thu, 29 Oct 2020 13:05:27 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY7cQ-0001ls-1o
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 13:05:30 +0000
X-Inumbo-ID: dfa4114d-9e52-4e67-92ab-7e99f77221a3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id dfa4114d-9e52-4e67-92ab-7e99f77221a3;
	Thu, 29 Oct 2020 13:05:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603976728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZG7lWK1DTImLm3namvGtYDcL9nQhEHL5orYTN2wH3g=;
	b=QxISMQeJp9E/9+HaCR1VwRZJZt2c02rkSf4g9kqmX0Sry9MolT7xM1n0XoTnMwJGRqlozg
	459zVLF/onrlYAiuYYGS8GjS0/C8HQYIinUNYT9hFv091PL7XtQqhY/mOWbFj68kBMBhXI
	+sn0sfHYje6/hgw1be1x8Lex7hgRNpM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EB72EAE63;
	Thu, 29 Oct 2020 13:05:27 +0000 (UTC)
Subject: Re: [PATCH v3] x86/pv: inject #UD for entirely missing SYSCALL
 callbacks
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0e76675b-c549-128e-449f-0c7a4df64f11@suse.com>
 <0ac0f006-c529-2437-4286-62158c2c491b@citrix.com>
 <1fca003e-72d4-2f56-3180-6c39ba123a99@suse.com>
Message-ID: <5f1e9751-c7b5-3bd8-a01e-3ef4f86ae79e@suse.com>
Date: Thu, 29 Oct 2020 14:05:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1fca003e-72d4-2f56-3180-6c39ba123a99@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.10.2020 09:53, Jan Beulich wrote:
> On 28.10.2020 22:31, Andrew Cooper wrote:
>> On 26/10/2020 09:40, Jan Beulich wrote:
>>> In the case that no 64-bit SYSCALL callback is registered, the guest
>>> will be crashed when 64-bit userspace executes a SYSCALL instruction,
>>> which would be a userspace => kernel DoS.  Similarly for 32-bit
>>> userspace when no 32-bit SYSCALL callback was registered either.
>>>
>>> This has been the case ever since the introduction of 64bit PV support,
>>> but behaves unlike all other SYSCALL/SYSENTER callbacks in Xen, which
>>> yield #GP/#UD in userspace before the callback is registered, and are
>>> therefore safe by default.
>>>
>>> This change does constitute a change in the PV ABI, for the corner case
>>> of a PV guest kernel not registering a 64-bit callback (which has to be
>>> considered a defacto requirement of the unwritten PV ABI, considering
>>> there is no PV equivalent of EFER.SCE).
>>>
>>> It brings the behaviour in line with PV32 SYSCALL/SYSENTER, and PV64
>>> SYSENTER (safe by default, until explicitly enabled).
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <JBeulich@suse.com>
>>> ---
>>> v3:
>>>  * Split this change off of "x86/pv: Inject #UD for missing SYSCALL
>>>    callbacks", to allow the uncontroversial part of that change to go
>>>    in. Add conditional "rex64" for UREGS_rip adjustment. (Is branching
>>>    over just the REX prefix too much trickery even for an unlikely to be
>>>    taken code path?)
>>
>> I find this submission confusion seeing as my v3 is already suitably
>> acked and ready to commit.  What I haven't had yet enough free time to
>> do so.
> 
> My objection to the other half stands, and hence, I'm afraid, stands
> in the way of your patch getting committed. Aiui Roger's ack doesn't
> invalidate my objection, sorry.

Actually I realize now that earlier I said I'm okay with this going in
if Roger acks it. I take it that Roger was aware of the controversy
when providing the ack. Therefore I'd like to take back what I've said
above, and your supposed v3 ought to be okay to get committed.

As to backporting - I'd surely be taking the split off part here, but
I have to admit I'm hesitant to take the full change. IOW splitting
the two changes might still be a helpful thing.

Jan

