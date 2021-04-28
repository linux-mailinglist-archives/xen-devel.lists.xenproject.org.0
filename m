Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278FA36D7EB
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 15:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119330.225778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbjqg-0005F3-0b; Wed, 28 Apr 2021 13:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119330.225778; Wed, 28 Apr 2021 13:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbjqf-0005Ee-Tc; Wed, 28 Apr 2021 13:03:25 +0000
Received: by outflank-mailman (input) for mailman id 119330;
 Wed, 28 Apr 2021 13:03:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbjqe-0005EZ-6x
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 13:03:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d45dd5e4-2d19-452e-8446-f71693284ce6;
 Wed, 28 Apr 2021 13:03:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4C1EB181;
 Wed, 28 Apr 2021 13:03:21 +0000 (UTC)
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
X-Inumbo-ID: d45dd5e4-2d19-452e-8446-f71693284ce6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619615002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bb2X/zWNGgoHjla4O1+5XkvRuAvUb+IU89t7YVxTqbc=;
	b=JuWCwOERnc3gYm7cGj1uzbs/9aJ19eaS97f2ISXYdmXM4mQdkYofgkEDf5wPQ+cf49uFd4
	xx2VIz6LGpalUKqoKy6cOXHRJKcigu7b5G728oEF22k6XNWcEUmmx7NVJ9lSM0OOySANlN
	ey7f9+Z14IDX6qd32BAXSLETaXrEAlU=
Subject: Re: [PATCH 0/3] x86: Initial pieces for guest CET support
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <03630ebd-861e-b02c-e845-1e2324211562@suse.com>
 <3e5369d1-a6eb-92c4-868c-0b9d205aba7a@citrix.com>
 <d687a294-f0d8-62d0-12ac-2cb5582b8605@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4f0446c-545f-f7c0-172a-a2ff88e19ad9@suse.com>
Date: Wed, 28 Apr 2021 15:03:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d687a294-f0d8-62d0-12ac-2cb5582b8605@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.04.2021 14:25, Andrew Cooper wrote:
> On 27/04/2021 11:13, Andrew Cooper wrote:
>> There are 3 emulator complexities for shadow stack instructions.  SSP
>> itself as a register, WRUSS no longer being CPL-based for
>> user/supervisor, and the fact that RSTORSSP in particular uses an atomic
>> block which microcode can express, but can't be encoded at an ISA
>> level.  I've got no idea what to do about this last problem, because we
>> can't map the two guest frames and re-issue the instruction - the
>> aliasing check on the tokens forces us to map the two frames in their
>> correct linear addresses.
> 
> Actually, RSTORSSP isn't too difficult.  I'd mis-read the pseudocode.
> 
> The atomic block is a check&edit of the token on the remote stack (not
> both stacks, as I'd mistakenly thought).  The purpose is to prevent two
> concurrent RSTORSSP's moving two threads onto the same shadow stack.
> 
> Without microcode superpowers, the best we can do this with a read,
> check, cmpxchg() loop.
> 
> The common case will be no conflict, as stack switching will be well
> formed (outside of debugging).  Any conflict here from real code is
> going to yield #GP/#CP on one of the threads participating, so in the
> case of a conflict in the emulator, a likely consequence of the 2nd
> iteration is going to be a hard failure.
> 
> That said, malicious cases within the guest, or from foreign mappings,
> can cause the cmpxchg() loop to take an unbounded time, so after 3
> retries or so, we need to escalate to vcpu_pause_all_except_self(), and
> or the ARM stop_machine() big hammer.
> 
> I'm tempted to just throw #GP back after 3 retries.  Its potentially
> non-architectural behaviour, but won't occur in non-malicious
> circumstances, and all fallback mechanisms have system-wide implications
> that we oughtn't to be bowing to in a malicious circumstance.

I agree.

Jan

