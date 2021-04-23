Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B68F369220
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 14:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116267.221916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZuwt-00078r-VC; Fri, 23 Apr 2021 12:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116267.221916; Fri, 23 Apr 2021 12:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZuwt-00078S-Rp; Fri, 23 Apr 2021 12:30:19 +0000
Received: by outflank-mailman (input) for mailman id 116267;
 Fri, 23 Apr 2021 12:30:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZuws-00078N-56
 for xen-devel@lists.xen.org; Fri, 23 Apr 2021 12:30:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ec9d2ac-5a52-4bb1-bb0a-87df74ff90a7;
 Fri, 23 Apr 2021 12:30:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D834EAE58;
 Fri, 23 Apr 2021 12:30:15 +0000 (UTC)
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
X-Inumbo-ID: 2ec9d2ac-5a52-4bb1-bb0a-87df74ff90a7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619181015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s8gxPmkATKSIBIXbUhMi1EgRjNnqEjOCcHpB6u0MUus=;
	b=AgJiTZynF5evAffWMnoVetR8oe+SxcBxhcFnUvVDI1qOC6IYKD6Kc/VlP1a+QL31eLoLhZ
	TggNIV9mnxsvOQxqtSEXUVEN019WZUtAQP/YsROdRQBufQAyXkEu0LYXNp6vjw8jxfA+/v
	RWyCoePINcOwE5PPOOuSeUuqILn5C0Q=
Subject: Re: Fwd: [BUG] Windows is frozen after restore from snapshot
To: Sergey Kovalev <valor@list.ru>
Cc: zaytsevgu@gmail.com, xen-devel@lists.xen.org
References: <6237e102-f2cf-a66e-09b6-954ebfe28f8c@list.ru>
 <46f8bf3e-cd6e-e2de-94c1-c8a55fb10648@list.ru>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <57478641-ed64-32bd-a577-428a50c880e2@suse.com>
Date: Fri, 23 Apr 2021 14:30:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <46f8bf3e-cd6e-e2de-94c1-c8a55fb10648@list.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.04.2021 12:22, Sergey Kovalev wrote:
> # Abstract
> 
> After `xl save win win.mem` and then `xl restore win.hvm win.mem`
> the Windows 10 VM remain frozen for about a minute. After the
> minute it becomes responsive.
> 
> During the freeze the OS remains semi-responsive: on `Ctrl+Shift+Esc`
> press the wait cursor appears (blue circle indicator).
> 
> This is an intermittent fault been reproduced only twice.
> 
> # Technical notes
> 
> It have been noticed that there were no timer interrupts during
> the freeze.
> 
> zaytsevgu@gmail.com has debugged the received Xen state file and
> noticed that the flag HPET_TN_PERIODIC been set after unfreeze.
> 
> Based on that he provided two Python scripts: one to check the
> value and one to patch it.
> 
> Both "broken" state files we have been detected and patched
> successfully.

"Patched successfully" meaning the guest, when resumed using that
state, did not stall initially?

In any event, if HPET_TN_PERIODIC was set after unfreeze, it was
also set upon saving state. (Or are you suggesting the flag got
"magically" set?) In which case we can't go and clear it behind
the OS'es back. So I suspect if there is a (rare) problem here,
it is likely connected to other parts of the HPET state. Since
you've taken apart saved state, could you supply the full set of
values (ideally multiple ones, if you happen to have them, plus
ones where the problem didn't occur, to allow someone perhaps
spot a pattern)?

Jan

