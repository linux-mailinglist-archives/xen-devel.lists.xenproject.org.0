Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B44295CEB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 12:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10361.27582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVY9D-0003JD-ON; Thu, 22 Oct 2020 10:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10361.27582; Thu, 22 Oct 2020 10:48:43 +0000
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
	id 1kVY9D-0003Io-Kx; Thu, 22 Oct 2020 10:48:43 +0000
Received: by outflank-mailman (input) for mailman id 10361;
 Thu, 22 Oct 2020 10:48:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVY9C-0003Ij-Eu
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 10:48:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 235be151-fe57-4da3-a2cc-737d36ade19f;
 Thu, 22 Oct 2020 10:48:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D57D8ACA3;
 Thu, 22 Oct 2020 10:48:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVY9C-0003Ij-Eu
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 10:48:42 +0000
X-Inumbo-ID: 235be151-fe57-4da3-a2cc-737d36ade19f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 235be151-fe57-4da3-a2cc-737d36ade19f;
	Thu, 22 Oct 2020 10:48:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603363721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0b+aO4geVivMxoOImVN5TC2oxRBqcdDWLWc9IG6Dja4=;
	b=eNZuxA34i5wiLPoll7WkPXL2PX8QR7fJehNfp3WFLosE56YkjFThkSySoANZJSUtVORyjn
	vTuaFa64zaqVevu+h3k5ObPjj9MuRVNO4EeA082UC/Yf2AJPz+zCqLSmoAHttaXSq3E31/
	HZtKCZJjbqa6RE6eAcjPoSNlWdpRUa8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D57D8ACA3;
	Thu, 22 Oct 2020 10:48:40 +0000 (UTC)
Subject: Re: [PATCH] x86/alternative: don't call text_poke() in lazy TLB mode
To: Peter Zijlstra <peterz@infradead.org>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>
References: <20201009144225.12019-1-jgross@suse.com>
 <28ccccfe-b95b-5c4d-af27-5004e9f02c40@suse.com>
 <20201022104527.GI2594@hirez.programming.kicks-ass.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <61d30267-733f-49b5-8ca1-3246485e8151@suse.com>
Date: Thu, 22 Oct 2020 12:48:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022104527.GI2594@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.10.20 12:45, Peter Zijlstra wrote:
> On Thu, Oct 22, 2020 at 11:24:39AM +0200, Jürgen Groß wrote:
>> On 09.10.20 16:42, Juergen Gross wrote:
>>> When running in lazy TLB mode the currently active page tables might
>>> be the ones of a previous process, e.g. when running a kernel thread.
>>>
>>> This can be problematic in case kernel code is being modified via
>>> text_poke() in a kernel thread, and on another processor exit_mmap()
>>> is active for the process which was running on the first cpu before
>>> the kernel thread.
>>>
>>> As text_poke() is using a temporary address space and the former
>>> address space (obtained via cpu_tlbstate.loaded_mm) is restored
>>> afterwards, there is a race possible in case the cpu on which
>>> exit_mmap() is running wants to make sure there are no stale
>>> references to that address space on any cpu active (this e.g. is
>>> required when running as a Xen PV guest, where this problem has been
>>> observed and analyzed).
>>>
>>> In order to avoid that, drop off TLB lazy mode before switching to the
>>> temporary address space.
>>>
>>> Fixes: cefa929c034eb5d ("x86/mm: Introduce temporary mm structs")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Can anyone look at this, please? It is fixing a real problem which has
>> been seen several times.
> 
> As it happens I picked it up yesterday, just pushed it out for you.

Thank you very much!


Juergen

