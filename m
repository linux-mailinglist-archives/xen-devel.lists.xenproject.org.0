Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B0227FEB8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 14:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1232.4155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNxFH-0007e0-1Y; Thu, 01 Oct 2020 11:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1232.4155; Thu, 01 Oct 2020 11:59:34 +0000
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
	id 1kNxFG-0007dd-Ty; Thu, 01 Oct 2020 11:59:34 +0000
Received: by outflank-mailman (input) for mailman id 1232;
 Thu, 01 Oct 2020 11:59:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNxFF-0007dY-Ce
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:59:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 024ccc64-2281-4118-ab57-301af51e97cd;
 Thu, 01 Oct 2020 11:59:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15EAAB4BD;
 Thu,  1 Oct 2020 11:59:31 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNxFF-0007dY-Ce
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:59:33 +0000
X-Inumbo-ID: 024ccc64-2281-4118-ab57-301af51e97cd
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 024ccc64-2281-4118-ab57-301af51e97cd;
	Thu, 01 Oct 2020 11:59:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601553571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p2VZgp2dT8N5z2eZt1FOZQ2yn/BCkhnnb7PdoRhqEdI=;
	b=CEYh6CUo5ht1o5uwL83EpP6PClJqDYcHkIIr0ApHRIWG3TiOixOJ4PVAw6iiGjT3/Vt78t
	cwyXa3PJofESVtTaZ+s1s/Y3NbJVK05/KbDxdELGma16fLeV+QoP1IpXqGZYBv64jRzhf1
	ja/MVr5stAkcqUP6D83HBkGItdGHXBM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 15EAAB4BD;
	Thu,  1 Oct 2020 11:59:31 +0000 (UTC)
Subject: Re: Yet another S3 issue in Xen 4.14
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20201001011245.GL3962@mail-itl>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a80ad59b-feb1-01c8-2b14-dbf6568d0ff5@suse.com>
Date: Thu, 1 Oct 2020 13:59:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201001011245.GL3962@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.10.2020 03:12, Marek Marczykowski-Górecki wrote:
> After patching the previous issue ("x86/S3: Fix Shadow Stack resume
> path") I still encounter issues resume from S3.
> Since I had it working on Xen 4.13 on this particular hardware (Thinkpad
> P52), I bisected it and got this:
> 
> commit 4304ff420e51b973ec9eb9dafd64a917dd9c0fb1
> Author: Andrew Cooper <andrew.cooper3@citrix.com>
> Date:   Wed Dec 11 20:59:19 2019 +0000
> 
>     x86/S3: Drop {save,restore}_rest_processor_state() completely
>     
>     There is no need to save/restore FS/GS/XCR0 state.  It will be handled
>     suitably on the context switch away from the idle.
>     
>     The CR4 restoration in restore_rest_processor_state() was actually fighting
>     later code in enter_state() which tried to keep CR4.MCE clear until everything
>     was set up.  Delete the intermediate restoration, and defer final restoration
>     until after MCE is reconfigured.
>     
>     Restoring PAT can be done earlier, and ideally before paging is enabled.  By
>     moving it into the trampoline during the setup for 64bit, the call can be
>     dropped from cpu_init().  The EFI path boot path doesn't disable paging, so
>     make the adjustment when switching onto Xen's pagetables.
>     
>     The only remaing piece of restoration is load_system_tables(), so suspend.c
>     can be deleted in its entirety.
>     
>     Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>     Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Parent of this commit suspends and resumes just fine. With this commit
> applied, it (I think) it panics, at least I get reboot after 5s. Sadly, I
> don't have serial console there.
> 
> I tried also master and stable-4.14 with this commit reverted (and also
> the other fix applied), but it doesn't work. In this case I get a hang on
> resume (power led still flashing, but fan woke up). There are probably
> some other dependencies.

Since bisection may also point you at some intermediate breakage, which
these last results of yours seem to support, could you check whether
55f8c389d434 put immediately on top of the above commit makes a difference,
and if so resume bisecting from there?

Jan

