Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2EB27FEC8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 14:10:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1239.4179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNxOy-0000P8-Ny; Thu, 01 Oct 2020 12:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239.4179; Thu, 01 Oct 2020 12:09:36 +0000
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
	id 1kNxOy-0000Oj-KX; Thu, 01 Oct 2020 12:09:36 +0000
Received: by outflank-mailman (input) for mailman id 1239;
 Thu, 01 Oct 2020 12:09:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNxOx-0000Oe-Ji
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 12:09:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f2150f8-94ab-4ce3-bd4a-ea1cd3a41fed;
 Thu, 01 Oct 2020 12:09:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7D72AFB5;
 Thu,  1 Oct 2020 12:09:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNxOx-0000Oe-Ji
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 12:09:35 +0000
X-Inumbo-ID: 4f2150f8-94ab-4ce3-bd4a-ea1cd3a41fed
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4f2150f8-94ab-4ce3-bd4a-ea1cd3a41fed;
	Thu, 01 Oct 2020 12:09:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601554173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AP2W93sOhCiXU1dh4UqXiv31c1fkggMfrQDeqedXe3Y=;
	b=j7kei7Iusr8Oz8nVP7o8kx0qaw5Jdb+msi21noCw4U3o0s4RpwU0nMGxP9VSo8wSURsReS
	JP6+/L0AsqvCuNryjidPPH4gxTtujMmJ0iEmdutU2T1jvpgxlE3GiegCk7k2pt8QusI5G5
	5cD2Z3xh18SGuOev9He+Led35teZ0sc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B7D72AFB5;
	Thu,  1 Oct 2020 12:09:33 +0000 (UTC)
Subject: Re: Yet another S3 issue in Xen 4.14
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20201001011245.GL3962@mail-itl> <20201001120010.GI1482@mail-itl>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab492756-8f41-fecf-4062-5d0272be1e7f@suse.com>
Date: Thu, 1 Oct 2020 14:09:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201001120010.GI1482@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.10.2020 14:00, Marek Marczykowski-Górecki wrote:
> On Thu, Oct 01, 2020 at 03:12:47AM +0200, Marek Marczykowski-Górecki wrote:
>> After patching the previous issue ("x86/S3: Fix Shadow Stack resume
>> path") I still encounter issues resume from S3.
>> Since I had it working on Xen 4.13 on this particular hardware (Thinkpad
>> P52), I bisected it and got this:
>>
>> commit 4304ff420e51b973ec9eb9dafd64a917dd9c0fb1
>> Author: Andrew Cooper <andrew.cooper3@citrix.com>
>> Date:   Wed Dec 11 20:59:19 2019 +0000
>>
>>     x86/S3: Drop {save,restore}_rest_processor_state() completely
>>     
>>     There is no need to save/restore FS/GS/XCR0 state.  It will be handled
>>     suitably on the context switch away from the idle.
>>     
>>     The CR4 restoration in restore_rest_processor_state() was actually fighting
>>     later code in enter_state() which tried to keep CR4.MCE clear until everything
>>     was set up.  Delete the intermediate restoration, and defer final restoration
>>     until after MCE is reconfigured.
>>     
>>     Restoring PAT can be done earlier, and ideally before paging is enabled.  By
>>     moving it into the trampoline during the setup for 64bit, the call can be
>>     dropped from cpu_init().  The EFI path boot path doesn't disable paging, so
>>     make the adjustment when switching onto Xen's pagetables.
>>     
>>     The only remaing piece of restoration is load_system_tables(), so suspend.c
>>     can be deleted in its entirety.
>>     
>>     Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>     Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Parent of this commit suspends and resumes just fine. With this commit
>> applied, it (I think) it panics, at least I get reboot after 5s. Sadly, I
>> don't have serial console there.
> 
> Reading the patch and discussion about it, I think the important details
> is this uses EFI boot.
> That may also explain why I haven't see it while bisecting the other
> S3 issue, where I use legacy boot path.

Hmm, interesting. I didn't think though that the code paths altered
by the commit above would be in any way dependent upon the way Xen
was booted. But if that's the observation, then perhaps there's
something I'm unaware of.

Jan

