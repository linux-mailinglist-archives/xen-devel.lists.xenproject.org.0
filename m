Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB21302348
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 10:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73941.132897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3yK4-0002ag-1m; Mon, 25 Jan 2021 09:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73941.132897; Mon, 25 Jan 2021 09:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3yK3-0002aH-Um; Mon, 25 Jan 2021 09:38:11 +0000
Received: by outflank-mailman (input) for mailman id 73941;
 Mon, 25 Jan 2021 09:38:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l3yK2-0002aC-73
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 09:38:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db7a1e8b-ce8b-4d65-86f3-86e22b9717e2;
 Mon, 25 Jan 2021 09:38:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF754AE64;
 Mon, 25 Jan 2021 09:38:07 +0000 (UTC)
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
X-Inumbo-ID: db7a1e8b-ce8b-4d65-86f3-86e22b9717e2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611567488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lmr01KDbtQQSbnTac7oRGL0s+cafjIwrRRGYlr5sFsE=;
	b=MR329Y/xGUhKD6qJl0f8RzRDAprSIW4w7wEAPlpb37O8fQr5kveF98yskDt+7eFKY35G3H
	4hVTadX9DhO0Ij1dGGOff8aIIewCTCymfoBba9muz3vMh77zilix96JrRdIS7bL7ImgTe9
	9XCI10zc3FCNBdDtbS3Yp2CzsT1uz7E=
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Claudemir Todo Bom <claudemir@todobom.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com>
 <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>
 <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
 <CANyqHYehUWeNfVXqVJX6nrBS_CcKL1DQjyNVa1cUbvbx+zD83w@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9d04edfe-0059-6fbf-c1da-2087f6190e64@suse.com>
Date: Mon, 25 Jan 2021 10:38:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CANyqHYehUWeNfVXqVJX6nrBS_CcKL1DQjyNVa1cUbvbx+zD83w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.01.2021 00:36, Claudemir Todo Bom wrote:
> Em qua., 20 de jan. de 2021 às 12:13, Jürgen Groß <jgross@suse.com> escreveu:
>>
>> On 20.01.21 09:50, Jan Beulich wrote:
>>> On 19.01.2021 20:36, Claudemir Todo Bom wrote:
>>>> I do not have serial output on this setup, so I recorded a video with
>>>> boot_delay=50 in order to be able to get all the kernel messages:
>>>> https://youtu.be/y95h6vqoF7Y
>>>
>>> This doesn't show any badness afaics.
>>>
>>>> This is running 4.14 from debian bullseye (testing).
>>>>
>>>> I'm also attaching the dmesg output when booting xen 4.8 with  the same
>>>> kernel version and same parameters.
>>>>
>>>> I visually compared all the messages, and the only thing I noticed was that
>>>> 4.14 used tsc as clocksource and 4.8 used xen. I tried to boot the kernel
>>>> with "clocksource=xen" and the problem is happening with that also.
>>>
>>> There's some confusion here I suppose: The clock source you talk
>>> about is the kernel's, not Xen's. I didn't think this would
>>> change for the same kernel version with different Xen underneath,
>>> but the Linux maintainers of the Xen code there may know better.
>>> Cc-ing them.
>>
>> This might depend on CPUID bits given to dom0 by Xen, e.g. regarding
>> TSC stability.
>>
> 
> Looks like the CPUID changes I observed and wrote on the other
> messages are another
> problem I may end up with. I narrowed down the cause of the problem on
> booting of dom0 with more than 1 core on the following commit:
> 
> https://github.com/xen-project/xen/commit/63e1d01b8fd948b3e0fa3beea494e407668aa43b
> 
> Code built from this commit doesn't boot, built from the parent of it, boots.

Odd.

> Now, there is something I can do on the command line to make it boots?
> Or its needed to fix on the code?

That's too early to ask. We first need to understand what's going
on. There are two things I'd like you to try: One is to use
"clocksource=tsc" on the Xen (not the kernel) command line, and
the other (without that option) is to try the debugging patch
below. Of course that patch is only going to be useful when you
can somehow record Xen's log messages up to the point where the
system hangs. (Both ideally on as new a Xen as you can arrange
for.)

Jan

--- unstable.orig/xen/arch/x86/time.c
+++ unstable/xen/arch/x86/time.c
@@ -1799,9 +1799,11 @@ static void time_calibration(void *unuse
     cpumask_copy(&r.cpu_calibration_map, &cpu_online_map);
 
     /* @wait=1 because we must wait for all cpus before freeing @r. */
+printk("TSC: %ps\n", time_calibration_rendezvous_fn);//temp
     on_selected_cpus(&r.cpu_calibration_map,
                      time_calibration_rendezvous_fn,
                      &r, 1);
+printk("TSC: end rendezvous\n");//temp
 }
 
 static struct cpu_time_stamp ap_bringup_ref;
@@ -2043,6 +2045,7 @@ static int __init verify_tsc_reliability
      * While with constant-rate TSCs the scale factor can be shared, when TSCs
      * are not marked as 'reliable', re-sync during rendezvous.
      */
+printk("TSC: c=%d r=%d\n", !!boot_cpu_has(X86_FEATURE_CONSTANT_TSC), !!boot_cpu_has(X86_FEATURE_TSC_RELIABLE));//temp
     if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
          !boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
         time_calibration_rendezvous_fn = time_calibration_tsc_rendezvous;
@@ -2056,6 +2059,7 @@ int __init init_xen_time(void)
 {
     tsc_check_writability();
 
+printk("TSC: c=%d r=%d\n", !!boot_cpu_has(X86_FEATURE_CONSTANT_TSC), !!boot_cpu_has(X86_FEATURE_TSC_RELIABLE));//temp
     open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
 
     /* NB. get_wallclock_time() can take over one second to execute. */


