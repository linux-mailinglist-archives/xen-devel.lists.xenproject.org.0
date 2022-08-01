Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1294586697
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 10:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378588.611844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIR8t-0002jX-OJ; Mon, 01 Aug 2022 08:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378588.611844; Mon, 01 Aug 2022 08:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIR8t-0002gX-LF; Mon, 01 Aug 2022 08:51:15 +0000
Received: by outflank-mailman (input) for mailman id 378588;
 Mon, 01 Aug 2022 08:51:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oIR8s-0002gR-KK
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 08:51:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oIR8s-0006LP-2q; Mon, 01 Aug 2022 08:51:14 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.0.187])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oIR8r-0000Hz-Qy; Mon, 01 Aug 2022 08:51:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=CZ3AQ0rzsgpr3ZGO1JUGS5i+btgNssy3XRYFzDHnUHU=; b=M9Nk5aBhk7B9tNo0P/gRZNKykR
	p51lG3ONhSIW7m99WOTQwxunWOxqNekF9S+UMHbC4FnWKymJIvySc1FM1fXJZ7MGmn9PzJpbW/zCY
	466dJXg+rkr18aoUHvCPM4ISuPd3YZwTLdtNC/AacIss1b2RD71Pq1AuozpDnK9mkvWg=;
Message-ID: <7444eeec-5a7c-6a18-ffde-cb32528a0e20@xen.org>
Date: Mon, 1 Aug 2022 09:51:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type
Content-Language: en-US
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
 libvir-list@redhat.com
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220729155024.3327364-1-olekstysh@gmail.com>
 <d29b2ad1-fa32-4897-a113-c8a0864c6630@redhat.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d29b2ad1-fa32-4897-a113-c8a0864c6630@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal,

On 01/08/2022 09:23, Michal Prívozník wrote:
> On 7/29/22 17:50, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Xen toolstack has gained basic Virtio support recently which becides
>> adding various virtio related stuff introduces new disk backend type
>> LIBXL_DISK_BACKEND_STANDALONE [1].
>>
>> Unfortunately, this caused a regression in libvirt build with Xen support
>> enabled, reported by the osstest today [2]:
>>
>> CC       libxl/libvirt_driver_libxl_impl_la-xen_xl.lo
>> ../../src/libxl/xen_xl.c: In function 'xenParseXLDisk':
>> ../../src/libxl/xen_xl.c:779:17: error: enumeration value 'LIBXL_DISK_BACKEND_STANDALONE'
>>     not handled in switch [-Werror=switch-enum]
>>                   switch (libxldisk->backend) {
>>                   ^~~~~~
>> cc1: all warnings being treated as errors
>>
>> The interesting fact is that switch already has a default branch (which ought
>> to cover such new addition), but the error is triggered as -Wswitch-enum
>> gives a warning about an omitted enumeration code even if there is a default
>> label.
> 
> This is expected and in fact working correctly. We want compiler to warn
> us about enum members that are not handled in a switch() statement.

For us this is treated as an error. Is it intended?

If it is, then I think this will be a problem for Xen because it means 
we will always need to fix libvirt before accepting a patch in Xen (see 
more below).

>  The
> 'default' case exists in some places because we suspect the value might
> not have been validated before. For instance:
> 
> libxl_disk_backend x = atoi(argv[1]); /* or parse something from XML */
> 
> switch(x) {
> case LIBXL_DISK_BACKEND_UNKNOWN:
> case LIBXL_DISK_BACKEND_PHY:
> case LIBXL_DISK_BACKEND_TAP:
> case LIBXL_DISK_BACKEND_QDISK:
>    // Neither of these might be exectuted ..
> default:
>    // .. in which case this will.
> }
> 
> 
> But we are not very consistent in putting 'default' case, sadly.
> 
>>
>> Also there is a similar issue in libxlUpdateDiskDef() which I have reproduced
>> after fixing the first one, but it that case the corresponding switch doesn't
>> have a default branch.
>>
>> Fix both issues by inserting required enumeration item to make the compiler
>> happy and adding ifdef guard to be able to build against old Xen libraries
>> as well (without LIBXL_HAVE_DEVICE_DISK_SPECIFICATION). Also add a default
>> branch to switch in libxlUpdateDiskDef().
>>
>> Please note, that current patch doesn't implement the proper handling of
>> LIBXL_DISK_BACKEND_STANDALONE and friends, it is just intended to fix
>> the regression immediately to unblock the osstest.  Also it worth mentioning
>> that current patch won't solve the possible additions in the future.
>>
>> [1] https://lore.kernel.org/xen-devel/20220716163745.28712-1-olekstysh@gmail.com/
>> [2] https://lore.kernel.org/xen-devel/E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org/
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Cc: Julien Grall <julien@xen.org>
>> Cc: Anthony PERARD <anthony.perard@citrix.com>
>> Cc: Michal Privoznik <mprivozn@redhat.com>
>>
>> Please note, the patch is tested on:
>> https://xenbits.xen.org/gitweb/?p=libvirt.git;a=shortlog;h=refs/heads/xen-tested-master
>> but should work on the master as well (as the same code is present here).
>> ---
>>   src/libxl/libxl_conf.c | 4 ++++
>>   src/libxl/xen_xl.c     | 3 +++
>>   2 files changed, 7 insertions(+)
> 
> Ah, I couldn't find the commit in master, and it's simply because it's
> not there yet. It's in staging:
> 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;f=tools/libs/light/libxl_types.idl;h=66dd1c62b2a3c707bd5c55750d10a8223fbd577f
> 
> The patch looks correct. Do you have any estimate when it can be merged
> into master? I'm not sure what our, libvirt, rules about xen staging
> are, but for qemu we require master (even unreleased yet).

The patches usually land in master after our test suite has completed. 
One of the test is to confirm that libvirt is still working. Therefore, 
the Xen patch will not be part of master until the patch in libvirt is 
added.

Cheers,

-- 
Julien Grall

