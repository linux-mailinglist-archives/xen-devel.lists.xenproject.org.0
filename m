Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8AB357C05
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 07:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107026.204569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUNeF-0007hf-6B; Thu, 08 Apr 2021 05:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107026.204569; Thu, 08 Apr 2021 05:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUNeF-0007hG-2N; Thu, 08 Apr 2021 05:56:11 +0000
Received: by outflank-mailman (input) for mailman id 107026;
 Thu, 08 Apr 2021 05:56:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUNeE-0007hB-BV
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 05:56:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 601408db-92cf-4cba-baea-92d30bdfbfc4;
 Thu, 08 Apr 2021 05:56:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6F3BDAFE8;
 Thu,  8 Apr 2021 05:56:07 +0000 (UTC)
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
X-Inumbo-ID: 601408db-92cf-4cba-baea-92d30bdfbfc4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617861367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jSmWBxiyMH5VNDpuGT7S8hLoJSPm8i2aXRLOgYL65E=;
	b=TekRN2Bsc8CpLLOLuSQAQkSLJt5dr4wjZmRhzr38lkmhabEhcSPVg1jz8Pu9z6ueNgErse
	tCOUqER3L92oyLeu+kVCGS5fEhpxSFCXMpdUlXgsMVV4Zn5fpYZlupjXURvcwJTPZLwRYp
	E6Jhjd4dOg/jlF7BbAGTDu40EoPTLu8=
Subject: Re: [PATCH 0/2] Introducing hyperlaunch capability design (formerly:
 DomB mode of dom0less)
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <jgrall@amazon.com>, Julien Grall <Julien.grall.oss@gmail.com>,
 iwj@xenproject.org, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 luca.fancellu@arm.com, paul@xen.org, Adam Schwalm <adam.schwalm@starlab.io>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <6314f50f-b4fc-e472-4c9a-3591e168d2c3@apertussolutions.com>
 <bd61f993-f719-ec87-638f-f53d6e983c3e@suse.com>
 <CACMJ4GY1QpTYUYV5oG5zOfah_PzPq_-__K3-F3qUfzX95R3w8g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2651d116-7c44-261e-8561-c9b3b5a4aab8@suse.com>
Date: Thu, 8 Apr 2021 07:56:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CACMJ4GY1QpTYUYV5oG5zOfah_PzPq_-__K3-F3qUfzX95R3w8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.04.2021 21:23, Christopher Clark wrote:
> On Tue, Mar 30, 2021 at 7:31 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 16.03.2021 04:56, Daniel P. Smith wrote:
>>> To assist in reading, please find attached rendered copies of the design
>>> docs. It should be noted that due to poor rendering by pandoc, we forced
>>> the tables to stay as ASCII tables in the patches whereas the attached
>>> docs have the tables rendered properly by rst2pdf.
>>
>> In section 3.6 I found "As a result, on x86 the hyperlaunch capability does
>> not rely on nor preclude any specific BIOS boot protocol, i.e legacy BIOS
>> boot or UEFI boot. The only requirement is that the boot loader supports
>> the Multiboot2 (MB2) protocol." I'm afraid the two sentences contradict
>> one another, as UEFI on its own doesn't provide MB2 functionality. It is
>> my understanding that you don't require this anyway - what you need is a
>> way to load modules beyond just Dom0 kernel and an initrd.
> 
> Thanks - we'll amend the doc. Given the already sizeable scope of the
> project, our current approach for host UEFI is to recommend use of
> GRUB.efi to load Xen and the initial domains via the multiboot2 method.
> 
>> I'm also struggling to see how you mean to associate the (MB2) modules
>> passed to Xen with the individual functions. I.e. I don't see how it will
>> be ensure that the embedded mb-index is in sync with the order or modules
>> actually supplied.
> 
> To make sure I'm following the concern raised here, my understanding is:
> 
> - the multiboot module list is ordered and stable, so that the order
>   that the bootloader provides the modules in is the same order in which
>   Xen receives them, in the multiboot data structure, so the modules can
>   be referenced by an index into that list

In a separate context (parallel ongoing discussion under "multiboot2
and module2 boot issues via GRUB2") Andrew raised the (imo valid)
point of this getting the more fragile the more modules there are.

> - for a given Launch Control Module file (expressed in a Device Tree, as
>   described in our second design document), the provided multiboot
>   modules will need to match, both in type (kernel, ramdisk, microcode,
>   xsm policy) and order

"Need to match" meaning what? You don't clarify how boot loader
config and device tree blob are meant to be kept in sync.

> - we think that at some point the LCM will end up being dynamically
>   generated by an enlightened bootloader, assembling it from the
>   bootloader config file, which will list the modules and their types
> 
>> As to modules - iirc there are placement restrictions by at least some
>> boot loaders (below 4Gb). If that's correct, do you have any thoughts
>> towards dealing with the limited space available to hold these modules?
>> I've seem systems with lots of memory, but with as little as just 1Gb
>> below the 4Gb boundary.
> 
> At this point, I don't think that we'll break anything that currently
> works, and that hardware or platform limitations can always constrain
> what is deployable.

I'm not concerned of you breaking anything. I merely raised a possible
scalability issue of your current proposal.

Jan

