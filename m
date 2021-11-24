Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F345C320
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 14:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230432.398324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpsNd-0006Wv-CX; Wed, 24 Nov 2021 13:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230432.398324; Wed, 24 Nov 2021 13:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpsNd-0006UV-9a; Wed, 24 Nov 2021 13:32:09 +0000
Received: by outflank-mailman (input) for mailman id 230432;
 Wed, 24 Nov 2021 13:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjDV=QL=arm.com=valentin.schneider@srs-se1.protection.inumbo.net>)
 id 1mpsNc-0006U9-63
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 13:32:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id e7902e60-4d2a-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 14:32:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D840A1042;
 Wed, 24 Nov 2021 05:32:05 -0800 (PST)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D945D3F73B;
 Wed, 24 Nov 2021 05:32:03 -0800 (PST)
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
X-Inumbo-ID: e7902e60-4d2a-11ec-a9d2-d9f7a1cc8784
From: Valentin Schneider <valentin.schneider@arm.com>
To: "Longpeng \(Mike\, Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gonglei
 \(Arei\)" <arei.gonglei@huawei.com>, "x86\@kernel.org" <x86@kernel.org>, "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: RE: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be brought up again.
In-Reply-To: <408748bfefde4a1b963382d372792661@huawei.com>
References: <20211122154714.xaoxok3fpk5bgznz@linutronix.de> <87r1b6d9kl.mognet@arm.com> <408748bfefde4a1b963382d372792661@huawei.com>
Date: Wed, 24 Nov 2021 13:31:58 +0000
Message-ID: <87lf1dd6i9.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain

On 24/11/21 00:19, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>> -----Original Message-----
>> From: Valentin Schneider [mailto:valentin.schneider@arm.com]
>> For my own education, this is talking about *host* CPU hotplug, right?
>>
>
> It's about the *guest* CPU hotplug.
>
> 1. Users in Primary VM:
> Split out vcpuX (offline from Primary VM) for Enclave VM
>
> 2. Hypervisor:
> Set a flag for vcpuX, all requests from Primary VM to bring up vcpuX
> will be ignore.
>
> 3. Users in Primary VM:
> echo 1 > .../vcpuX/online would fail and leave the CPU state of vcpuX
> in CPU_UP_PREPARE.
>
> 4. Users in Primary VM terminate the Enclave VM:
> Hypervisor should clear the flag (set in step 2) of vcpuX, so the vcpuX
> can continue to receive requests.
>
> 5. Users in Primary VM:
> Try to online the vcpuX again (expect success), but it's always failed.
>

If I followed the rabbit hole in the right direction, this is about:
ff8a4d3e3a99 ("nitro_enclaves: Add logic for setting an enclave vCPU")

So there's a 1:1 CPU:vCPU mapping and an Enclave carves a chunk out of the
Primary VM...

Thanks for the detailed explanation!

