Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1022C28F6F2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7564.19880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6GX-000401-Uf; Thu, 15 Oct 2020 16:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7564.19880; Thu, 15 Oct 2020 16:38:09 +0000
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
	id 1kT6GX-0003zf-RU; Thu, 15 Oct 2020 16:38:09 +0000
Received: by outflank-mailman (input) for mailman id 7564;
 Thu, 15 Oct 2020 16:38:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LoCs=DW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kT6GW-0003za-GM
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:38:08 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0573e44a-b5e7-4114-8606-4114c68c410f;
 Thu, 15 Oct 2020 16:38:07 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LoCs=DW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kT6GW-0003za-GM
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:38:08 +0000
X-Inumbo-ID: 0573e44a-b5e7-4114-8606-4114c68c410f
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0573e44a-b5e7-4114-8606-4114c68c410f;
	Thu, 15 Oct 2020 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602779888;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Qj6daUl3a4L1zT29nMoh4pa8HEVDUNhuxBVEfS5VrR0=;
  b=hnDmHVSLHLgJVG9K+ZY7BNvKNsE8Vtzug6amD2tWZNFjxtXklTVaQ+WR
   MxH3aU22Vjjh5c5+J02gcYKbY7GiKKB9yMqAYx+Z5t1qz/0+Ghgx4XGux
   o0t2CHsX9eKHoZ9zajqyPpoisGnJ2Zziq44JIPLY3KQjlTZWbTYZAt2iN
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1dZCXaNiv6f3fJrYWfHabfZpoSQ/ExdZYjaapkQ0S1kuJwO3sfOM9HbFuNpN/MxAjkAJRJGbk8
 JPKIVWcaNLrbRS/B/te1m8+nn6O5b8buupV3l4EqsTaN6WSJvDO009kCF8d1YYP7X4QC56oxsn
 izy8usIuT6AtRVcAJ7v6rkH2REAK18MYeiMiGoceEwOmaV/8ay8fS1rd0lanonjaPlrJ1jb9rv
 p3cp7bpXy1lH2Fm0Q3LcUQwuZBX4bVCTO9uh2WiVXF2Vf/EeNYBKsdZR7lBoyrZPlztspRrZmM
 zGo=
X-SBRS: 2.5
X-MesageID: 29101339
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,379,1596513600"; 
   d="scan'208";a="29101339"
Subject: Re: [PATCH v2] x86/smpboot: Don't unconditionally call
 memguard_guard_stack() in cpu_smpboot_alloc()
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201014184708.17758-1-andrew.cooper3@citrix.com>
 <0ed412d9-c9a2-194b-c953-c74ee102664f@suse.com>
 <0a294279-5de5-3b54-b1f9-847de1159447@citrix.com>
 <578a0afd-693a-c704-317e-477e5e27d497@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5df2626b-8755-8cdb-7cbc-74d51b569a0b@citrix.com>
Date: Thu, 15 Oct 2020 17:38:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <578a0afd-693a-c704-317e-477e5e27d497@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 15/10/2020 16:16, Jan Beulich wrote:
> On 15.10.2020 16:02, Andrew Cooper wrote:
>> On 15/10/2020 09:50, Jan Beulich wrote:
>>> On 14.10.2020 20:47, Andrew Cooper wrote:
>>>> cpu_smpboot_alloc() is designed to be idempotent with respect to partially
>>>> initialised state.  This occurs for S3 and CPU parking, where enough state to
>>>> handle NMIs/#MCs needs to remain valid for the entire lifetime of Xen, even
>>>> when we otherwise want to offline the CPU.
>>>>
>>>> For simplicity between various configuration, Xen always uses shadow stack
>>>> mappings (Read-only + Dirty) for the guard page, irrespective of whether
>>>> CET-SS is enabled.
>>>>
>>>> Unfortunately, the CET-SS changes in memguard_guard_stack() broke idempotency
>>>> by first writing out the supervisor shadow stack tokens with plain writes,
>>>> then changing the mapping to being read-only.
>>>>
>>>> This ordering is strictly necessary to configure the BSP, which cannot have
>>>> the supervisor tokens be written with WRSS.
>>>>
>>>> Instead of calling memguard_guard_stack() unconditionally, call it only when
>>>> actually allocating a new stack.  Xenheap allocates are guaranteed to be
>>>> writeable, and the net result is idempotency WRT configuring stack_base[].
>>>>
>>>> Fixes: 91d26ed304f ("x86/shstk: Create shadow stacks")
>>>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Wei Liu <wl@xen.org>
>>>>
>>>> This can more easily be demonstrated with CPU hotplug than S3, and the absence
>>>> of bug reports goes to show how rarely hotplug is used.
>>>>
>>>> v2:
>>>>  * Don't break S3/CPU parking in combination with CET-SS.  v1 would, for S3,
>>>>    turn the BSP shadow stack into regular mappings, and #DF as soon as the TLB
>>>>    shootdown completes.
>>> The code change looks correct to me, but since I don't understand
>>> this part I'm afraid I may be overlooking something. I understand
>>> the "turn the BSP shadow stack into regular mappings" relates to
>>> cpu_smpboot_free()'s call to memguard_unguard_stack(), but I
>>> didn't think we come through cpu_smpboot_free() for the BSP upon
>>> entering or leaving S3.
>> The v1 really did fix Marek's repro of the problem.
>>
>> The only possible way this can occur is if, somewhere, there is a call
>> to cpu_smpboot_free() for CPU0 with remove=0 on the S3 path
> I didn't think it was the BSP's stack that got written to, but the
> first AP's before letting it run.

Oh yes - my analysis was wrong.  The CPU notifier for CPU 1 to come up
runs on CPU 0.

So only the --- text was wrong.  Are you happy with the fix now?

~Andrew

