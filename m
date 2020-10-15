Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E2928F43F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 16:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7403.19325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT3qH-0002Uf-53; Thu, 15 Oct 2020 14:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7403.19325; Thu, 15 Oct 2020 14:02:53 +0000
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
	id 1kT3qH-0002UJ-1s; Thu, 15 Oct 2020 14:02:53 +0000
Received: by outflank-mailman (input) for mailman id 7403;
 Thu, 15 Oct 2020 14:02:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LoCs=DW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kT3qE-0002U3-OT
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:02:50 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f95744fe-b802-4a0a-8d5d-e93722dcb3ee;
 Thu, 15 Oct 2020 14:02:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LoCs=DW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kT3qE-0002U3-OT
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:02:50 +0000
X-Inumbo-ID: f95744fe-b802-4a0a-8d5d-e93722dcb3ee
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f95744fe-b802-4a0a-8d5d-e93722dcb3ee;
	Thu, 15 Oct 2020 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602770570;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=vJmFyAUEzqg6ecFBFpUq4RyHD+WUMAaJ+2eNPktHAdo=;
  b=GKJUmsCyZTYXcaefd7ScZW1oB7oJE818VFSmeYN9fLbhoRCxZDr3p9js
   ZfGU9AAN9NAYqij79+xit7Chfj5jQjYe+Hbg3SUBF4QecnQxQ1dipZFoJ
   EwOEPuMLVDBPCZovOJLO1/Ip4ge0VKi6x19fQEQeGwiXEaLvFk53G1kxY
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kmYhWeC8acTVT2lKvp+ywlNO8ZYGSPIKuI/DKZo4eiAkK1F7pCmiWhvLJx9qELnrEVdFxBngDr
 G5o4oIBM0ghyQjJJh1GYPiMG04gN73CVzZsxTBoYdNQEXepgZuFwqf22b5Ho/nVG5fnmyhjQc9
 op+OCY8PzgsvZ31UVFzq+17yRc/Dxhjco9Drh/yDAMUk/S/0Nwkjt9EMoLVcVfDL5riA2D786/
 6kgGtCRm8XeiWQiLwClixvbrmvXUK9f6dAxCf1tIwnpO8zWLm0lqfeKxEz/IIs6k2P6NH7Ao+J
 7Ww=
X-SBRS: 2.5
X-MesageID: 29410899
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,379,1596513600"; 
   d="scan'208";a="29410899"
Subject: Re: [PATCH v2] x86/smpboot: Don't unconditionally call
 memguard_guard_stack() in cpu_smpboot_alloc()
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201014184708.17758-1-andrew.cooper3@citrix.com>
 <0ed412d9-c9a2-194b-c953-c74ee102664f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0a294279-5de5-3b54-b1f9-847de1159447@citrix.com>
Date: Thu, 15 Oct 2020 15:02:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0ed412d9-c9a2-194b-c953-c74ee102664f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 15/10/2020 09:50, Jan Beulich wrote:
> On 14.10.2020 20:47, Andrew Cooper wrote:
>> cpu_smpboot_alloc() is designed to be idempotent with respect to partially
>> initialised state.  This occurs for S3 and CPU parking, where enough state to
>> handle NMIs/#MCs needs to remain valid for the entire lifetime of Xen, even
>> when we otherwise want to offline the CPU.
>>
>> For simplicity between various configuration, Xen always uses shadow stack
>> mappings (Read-only + Dirty) for the guard page, irrespective of whether
>> CET-SS is enabled.
>>
>> Unfortunately, the CET-SS changes in memguard_guard_stack() broke idempotency
>> by first writing out the supervisor shadow stack tokens with plain writes,
>> then changing the mapping to being read-only.
>>
>> This ordering is strictly necessary to configure the BSP, which cannot have
>> the supervisor tokens be written with WRSS.
>>
>> Instead of calling memguard_guard_stack() unconditionally, call it only when
>> actually allocating a new stack.  Xenheap allocates are guaranteed to be
>> writeable, and the net result is idempotency WRT configuring stack_base[].
>>
>> Fixes: 91d26ed304f ("x86/shstk: Create shadow stacks")
>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> This can more easily be demonstrated with CPU hotplug than S3, and the absence
>> of bug reports goes to show how rarely hotplug is used.
>>
>> v2:
>>  * Don't break S3/CPU parking in combination with CET-SS.  v1 would, for S3,
>>    turn the BSP shadow stack into regular mappings, and #DF as soon as the TLB
>>    shootdown completes.
> The code change looks correct to me, but since I don't understand
> this part I'm afraid I may be overlooking something. I understand
> the "turn the BSP shadow stack into regular mappings" relates to
> cpu_smpboot_free()'s call to memguard_unguard_stack(), but I
> didn't think we come through cpu_smpboot_free() for the BSP upon
> entering or leaving S3.

The v1 really did fix Marek's repro of the problem.

The only possible way this can occur is if, somewhere, there is a call
to cpu_smpboot_free() for CPU0 with remove=0 on the S3 path

I have to admit that I can't actually spot where it is.


Either way - it doesn't impact the fix, which attempts to make "the
stack" into a single object.  I experimented with introducing
smpboot_{alloc,free}_stack(), but the result wasn't clean and I
abandoned that approach.

~Andrew

