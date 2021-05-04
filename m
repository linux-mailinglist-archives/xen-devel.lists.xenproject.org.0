Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1713729D8
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122225.230490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtqn-0001Wy-BP; Tue, 04 May 2021 12:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122225.230490; Tue, 04 May 2021 12:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtqn-0001WZ-7w; Tue, 04 May 2021 12:08:29 +0000
Received: by outflank-mailman (input) for mailman id 122225;
 Tue, 04 May 2021 12:08:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldtql-0001WU-GV
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:08:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 993177b1-c634-4b88-99ae-a387a9e82b1c;
 Tue, 04 May 2021 12:08:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3F6EB1D9;
 Tue,  4 May 2021 12:08:25 +0000 (UTC)
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
X-Inumbo-ID: 993177b1-c634-4b88-99ae-a387a9e82b1c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620130106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HugiPDxWd/SWOnt+uFJRfy4G9pnjfLXVMvwsebfJ/Fg=;
	b=D5fZTiEEvouPpa8z3vRhzjyhRpNi0Dy8oRVlOcpVz6laJM5GF6rYFR1ChC+EXRtJk9+2Ct
	bIYSQA840Bm714rj/CUPt08u49qWSTKsUqXmMapLXNzzbWtr28KNvz0RjNpO8R1FCPe329
	pER8pn3xMfmhEZY7KogcARKlzRstcZU=
Subject: Re: [PATCH 3/5] x86/xstate: Rework xstate_ctxt_size() as
 xstate_uncompressed_size()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-4-andrew.cooper3@citrix.com>
 <a8487667-1f47-1aae-1528-4a1224cbda7b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <07a03e61-742c-5880-1003-fcded7efc662@suse.com>
Date: Tue, 4 May 2021 14:08:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <a8487667-1f47-1aae-1528-4a1224cbda7b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.05.2021 20:17, Andrew Cooper wrote:
> On 03/05/2021 16:39, Andrew Cooper wrote:
>> We're soon going to need a compressed helper of the same form.
>>
>> The size of the uncompressed image is a strictly a property of the highest
>> user state.  This can be calculated trivially with xstate_offsets/sizes, and
>> is much faster than a CPUID instruction in the first place, let alone the two
>> XCR0 writes surrounding it.
>>
>> Retain the cross-check with hardware in debug builds, but forgo it normal
>> builds.  In particular, this means that the migration paths don't need to mess
>> with XCR0 just to sanity check the buffer size.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> The Qemu smoketests have actually found a bug here.
> 
> https://gitlab.com/xen-project/patchew/xen/-/jobs/1232118510/artifacts/file/smoke.serial
> 
> We call into xstate_uncompressed_size() from
> hvm_register_CPU_save_and_restore() so the previous "xcr0 == 0" path was
> critical to Xen not exploding on non-xsave platforms.
> 
> This is straight up buggy - we shouldn't be registering xsave handlers
> on non-xsave platforms, but the calculation is also wrong (in the safe
> directly at least) when we use compressed formats.  Yet another
> unexpected surprise for the todo list.

I don't view this as buggy at all - it was an implementation choice.
Perhaps not the best one, but still correct afaict. Then again I'm
afraid I don't understand "in the safe directly at least", so I may
well be overlooking something. Will wait for your updated patch ...

Jan

