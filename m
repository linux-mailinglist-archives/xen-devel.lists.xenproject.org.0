Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884E5763B68
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 17:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570559.892444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgek-0004vN-QV; Wed, 26 Jul 2023 15:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570559.892444; Wed, 26 Jul 2023 15:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgek-0004tg-N4; Wed, 26 Jul 2023 15:42:30 +0000
Received: by outflank-mailman (input) for mailman id 570559;
 Wed, 26 Jul 2023 15:42:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp0x=DM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qOgei-0004tK-O4
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 15:42:28 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03f9a5a9-2bcb-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 17:42:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 62C4A82857CB;
 Wed, 26 Jul 2023 10:42:23 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9Qd7TQYlRt_R; Wed, 26 Jul 2023 10:42:22 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8E0DE82858BD;
 Wed, 26 Jul 2023 10:42:22 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Css-cbOf54Gl; Wed, 26 Jul 2023 10:42:22 -0500 (CDT)
Received: from [192.168.82.115] (c-98-222-97-219.hsd1.il.comcast.net
 [98.222.97.219])
 by mail.rptsys.com (Postfix) with ESMTPSA id 979FA82857CB;
 Wed, 26 Jul 2023 10:42:21 -0500 (CDT)
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
X-Inumbo-ID: 03f9a5a9-2bcb-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8E0DE82858BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690386142; bh=vFrBIsBlrdha+MVX+yrqK5PHmRm3VMuYHZwSyCyQo5Y=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=GOTPzW75t1kBGanxr1juW5MSsKZ++jlU+oIEpCXOvE65AkOGanji8cbw9JeDa0U6G
	 UgoujAWPOTqu1To5UH4pdMZBdOk1Wdv3NzcayLDGw6cYiBLjsfAN2KCiAiLyj3fug9
	 hoJDCujdUsLDkSxZmEU/jtMLqMRchF2sjf02+cTw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <825b00d0-432b-5db8-fe12-2266dffdf06f@raptorengineering.com>
Date: Wed, 26 Jul 2023 10:42:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1689958538.git.sanastasio@raptorengineering.com>
 <f326168638ae05f5f387e4fa018ac2ed057bac8c.1689958538.git.sanastasio@raptorengineering.com>
 <019914c7-c6ca-70b9-6c90-e1891f4201c4@suse.com>
 <cf7e418f-763a-6f27-d498-c88b19c8a9eb@raptorengineering.com>
 <ab870428-fbce-240a-d4c7-4298fbed4050@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <ab870428-fbce-240a-d4c7-4298fbed4050@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/26/23 10:32 AM, Jan Beulich wrote:
> On 24.07.2023 17:06, Shawn Anastasio wrote:
>> On 7/24/23 7:40 AM, Jan Beulich wrote:
>>> On 21.07.2023 19:02, Shawn Anastasio wrote:
>>>> On typical Power VMs (e.g. QEMU's -M pseries), a variety of services
>>>> including an early serial console are provided by Open Firmware.
>>>> Implement the required interfaces to call into Open Firmware and write
>>>> to the serial console.
>>>>
>>>> Since Open Firmware runs in 32-bit Big Endian mode and Xen runs in
>>>> 64-bit Little Endian mode, a thunk is required to save/restore
>>>> any potentially-clobbered registers as well as to perform the
>>>> required endianness switch. Thankfully, linux already has such
>>>> a routine, which was imported into ppc64/of-call.S.
>>>>
>>>> Support for bare metal (PowerNV) will be implemented in a future
>>>> patch.
>>>>
>>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>
>>> While I've committed the earlier two patches, I had to back out this
>>> one. In my environment (gcc13) the build fails due an unresolved
>>> reference to memset() out of boot-of.c (supposedly from of_call()).
>>
>> Does removing the `{ 0 }` initializer to `struct of_service s` on line
>> 43 resolve this?
> 
> Yes, that's what's causing the call (and removing, whether or not correct,
> helps).

Thanks for confirming. Removing it should be fine since the code
manually initializes all of the other fields of the struct. The only
behavioral difference is that the members of `ofs_args` at indices >=
nargs would be left uninitialized. This shouldn't be an issue though
since we're guarding reads of the array on `nargs` and `nrets` and thus
only read explicitly initialized values (and of course, firmware would
do the same).

Naturally we can't avoid memset calls forever. I have lib/ building
locally, but if we could get this series in without having to make those
changes here that'd be great.

> Jan

Thanks,
Shawn


