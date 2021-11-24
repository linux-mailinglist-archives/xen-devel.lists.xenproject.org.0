Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE1645CC6C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 19:47:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230526.398506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpxIS-0001hD-7H; Wed, 24 Nov 2021 18:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230526.398506; Wed, 24 Nov 2021 18:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpxIS-0001el-4J; Wed, 24 Nov 2021 18:47:08 +0000
Received: by outflank-mailman (input) for mailman id 230526;
 Wed, 24 Nov 2021 18:47:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jHA0=QL=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mpxIQ-0001ef-Cb
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 18:47:06 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eae39735-4d56-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 19:47:05 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:33430)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mpxIO-000Tky-70 (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 24 Nov 2021 18:47:04 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E886E1FBF1;
 Wed, 24 Nov 2021 18:47:03 +0000 (GMT)
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
X-Inumbo-ID: eae39735-4d56-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <471892da-6e64-2faa-3198-3859531c4d11@srcf.net>
Date: Wed, 24 Nov 2021 18:47:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-GB
To: Ian Jackson <iwj@xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20211124161649.83189-1-roger.pau@citrix.com>
 <24990.26451.287618.213116@mariner.uk.xensource.com>
 <9fd0c2f4-1b8f-bcd3-93bd-eea47b61e445@srcf.net>
 <24990.32581.766301.992950@mariner.uk.xensource.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max
 policies
In-Reply-To: <24990.32581.766301.992950@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/11/2021 18:07, Ian Jackson wrote:
> (Hoisting Roger and Jan to the To:)
>
> Andrew Cooper writes ("Re: [PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max policies"):
>> On 24/11/2021 16:24, Ian Jackson wrote:
>>> Questions from my RM hat:
>>>
>>> Is there a workaround ?
>> No.
>>
>> The safety check being tripped is intended to prevent the VM crashing on
>> resume, and is functioning correctly.
>>
>>> What proportion of machines do we think this might affect ?
>> Any pre-xsave machines (~2012 and older), and any newer machines booted
>> with no-xsave.
>>
>> All AMD machines are actually broken by this, except that failure is
>> being masked by other changes in 4.16.  Future AMD machines will break
>> in the same way.
> This is quite bad, then, I think.  I'm inclined to treat this as a
> blocker for the release.

I would also classify it as a blocker.

>
>>> Jan, Andy, do you have an opinion ?
>> The reversion doesn't go far enough.
>>
>> While the shrinking of the max policies manifests as a concrete breakage
>> here, there is further breakage caused by shrinking the default
>> policies, because it renders some cpuid= settings in VM config files broken.
>>
>> There is still no feedback or error checking from individual cpuid=
>> settings, so this will manifest as the VM admin settings silently no
>> longer taking effect.
>>
>>
>> I recommend a full and complete reversion of 540d911c28.  The
>> justification for it in the first place is especially weak because it is
>> explicitly contrary to how real hardware behaves, and this is the 3rd
>> ABI breakage it has caused, with more expected in the future based on
>> the analysis of what has gone wrong so far.
> I would like to collect as many opinions as possible.  Do we have
> other options besides (a) reverting 540d911c28, or (b) releasing with
> this bug ?

There is a 3rd option of taking this patch as-is, which is half way
between (a) and (b), but anything other than (a) leaves us with known
breakages that have no workaround.

Shutting the VM down on the old host, copying it's disks and config file
manually, then booting it clean would avoid this specific breakage on
migrate, but you'd still be subject to the silent breakage from certain
cpuid= settings not taking effect.

> What bad consequences follow, for users of Xen, from reverting
> 540d911c28 ?

Nothing.  It will take everything back to the same behaviour as 4.15 and
older.

>   Presumably it had some purpose which will be undermined
> by reverting it.  The commit message speaks of details but doesn't
> explain the ultimate impact, at least not to someone like me who only
> dimly perceives the underlying technical aspects.

540d911c28 "fixes" an issue which is theoretical at best.

Real hardware behaviour does not trim max leaf when certain features are
turned off, and will report blocks of trailing zeros.

None of the software manuals permit any inference based on max leaf,
which is why the 4.15 behaviour has been fine for the lifetime of Xen so
far.

> I did an experimental git-revert.  It seemed to go cleanly.
> If we go for the revert, we would need a commit message.

It may revert cleanly, but it won't build because of the first hunk in
81da2b544cbb00.  That hunk needs reverting too, because it too breaks
some cpuid= settings in VM config files.

In principle, the *final* thing the toolstack should do, *for brand new
VMs only*, is a shrink of that form, but this depends on whole load more
toolstack work before it can be done safely.  There is a plan to fix
CPUID handling, in a safe way, and it is ongoing (subject to all the
security interruptions), but has a long way to go yet.

~Andrew

