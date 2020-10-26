Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3BA29959A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 19:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12551.32663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX7Ts-0003kp-Cp; Mon, 26 Oct 2020 18:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12551.32663; Mon, 26 Oct 2020 18:44:32 +0000
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
	id 1kX7Ts-0003kQ-9M; Mon, 26 Oct 2020 18:44:32 +0000
Received: by outflank-mailman (input) for mailman id 12551;
 Mon, 26 Oct 2020 18:44:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Eey=EB=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kX7Tq-0003kL-9z
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 18:44:30 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24418615-9ad3-465d-8d85-6cf4678a606e;
 Mon, 26 Oct 2020 18:44:29 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kX7To-0003D8-QX; Mon, 26 Oct 2020 18:44:28 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kX7To-0000gJ-K4; Mon, 26 Oct 2020 18:44:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Eey=EB=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kX7Tq-0003kL-9z
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 18:44:30 +0000
X-Inumbo-ID: 24418615-9ad3-465d-8d85-6cf4678a606e
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 24418615-9ad3-465d-8d85-6cf4678a606e;
	Mon, 26 Oct 2020 18:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=XBYOMVI6KLwqG7Lz5TsppMwW/9efEZo7+jiuHBf6LRM=; b=K8sVIpL3kW1x2SriEEkM6p/WM8
	yp6olEBGKiwORB3prOpoy5hn8bB3voVQvadkUoDY2bcbVKysEkEy/Q2ftQgw8LCh69QNRrbpwZtRV
	0mK8WvIb7xemum+nmggyTZ5LRXF5/tMsDoOXoGZjYDQeHXnNg+znCtefA4+vKfZh/NyM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kX7To-0003D8-QX; Mon, 26 Oct 2020 18:44:28 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kX7To-0000gJ-K4; Mon, 26 Oct 2020 18:44:28 +0000
Subject: Re: Xen on RP4
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, roman@zededa.com,
 xen-devel@lists.xenproject.org
References: <20201016003024.GA13290@mattapan.m5p.com>
 <23885c28-dee5-4e9a-dc43-6ccf19a94df6@xen.org>
 <20201022021655.GA74011@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221620230.12247@sstabellini-ThinkPad-T480s>
 <20201023005629.GA83870@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221801490.12247@sstabellini-ThinkPad-T480s>
 <20201023211941.GA90171@mattapan.m5p.com>
 <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
 <20201024053540.GA97417@mattapan.m5p.com>
 <4fcf4832-9266-443f-54d0-fa1fff4b6e14@xen.org>
 <20201026160316.GA20589@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7a904044-8206-b45d-8ec2-d4e48b07ea83@xen.org>
Date: Mon, 26 Oct 2020 18:44:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026160316.GA20589@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Elliott,

On 26/10/2020 16:03, Elliott Mitchell wrote:
> On Mon, Oct 26, 2020 at 01:31:42PM +0000, Julien Grall wrote:
>> On 24/10/2020 06:35, Elliott Mitchell wrote:
>>> ACPI has a distinct
>>> means of specifying a limited DMA-width; the above fails, because it
>>> assumes a *device-tree*.
>>
>> Do you know if it would be possible to infer from the ACPI static table
>> the DMA-width?
> 
> Yes, and it is.  Due to not knowing much about ACPI tables I don't know
> what the C code would look like though (problem is which documentation
> should I be looking at first?).

What you provided below is an excerpt of the DSDT. AFAIK, DSDT content 
is written in AML. So far the shortest implementation I have seen for 
the AML parser is around 5000 lines (see [1]). It might be possible to 
strip some the code, although I think this will still probably too big 
for a single workaround.

What I meant by "static table" is a table that looks like a structure 
and can be parsed in a few lines. If we can't find on contain the DMA 
window, then the next best solution is to find a way to identity the 
platform.

I don't know enough ACPI to know if this solution is possible. A good 
starter would probably be the ACPI spec [2].

> 
> Handy bit of information is in the RP4 Tianocore table source:
> https://github.com/tianocore/edk2-platforms/blob/d492639638eee331ac3389e6cf53ea266c3c84b3/Platform/RaspberryPi/AcpiTables/Dsdt.asl
> 
>        Name (_DMA, ResourceTemplate() {
>          //
>          // Only the first GB is available.
>          // Bus 0xC0000000 -> CPU 0x00000000.
>          //
>          QWordMemory (ResourceConsumer,
>            ,
>            MinFixed,
>            MaxFixed,
>            NonCacheable,
>            ReadWrite,
>            0x0,
>            0x00000000C0000000, // MIN
>            0x00000000FFFFFFFF, // MAX
>            0xFFFFFFFF40000000, // TRA
>            0x0000000040000000, // LEN
>            ,
>            ,
>            )
>        })
> 
> There should be some corresponding code in the Linux 5.9 kernels.  From
> the look of that, it might even be possible to specify a memory range
> which didn't start at address 0.
> 
> 

Cheers,

[1] https://github.com/openbsd/src/blob/master/sys/dev/acpi/dsdt.c
[2] https://www.uefi.org/sites/default/files/resources/ACPI_6.0.pdf

-- 
Julien Grall

