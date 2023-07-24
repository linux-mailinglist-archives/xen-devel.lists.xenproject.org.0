Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BA775FA6A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 17:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569021.889325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNx8h-0008Cq-J2; Mon, 24 Jul 2023 15:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569021.889325; Mon, 24 Jul 2023 15:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNx8h-0008A5-GO; Mon, 24 Jul 2023 15:06:23 +0000
Received: by outflank-mailman (input) for mailman id 569021;
 Mon, 24 Jul 2023 15:06:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1ryx=DK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qNx8g-00089z-6I
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 15:06:22 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a47ab3b4-2a33-11ee-b23b-6b7b168915f2;
 Mon, 24 Jul 2023 17:06:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DFC908285470;
 Mon, 24 Jul 2023 10:06:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GxqBjUqR8x07; Mon, 24 Jul 2023 10:06:17 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 239DF82854B7;
 Mon, 24 Jul 2023 10:06:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0FqT181aTRYw; Mon, 24 Jul 2023 10:06:17 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 913638285470;
 Mon, 24 Jul 2023 10:06:16 -0500 (CDT)
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
X-Inumbo-ID: a47ab3b4-2a33-11ee-b23b-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 239DF82854B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690211177; bh=v3Djm0mV8rUJTjPy/MbJN0Eqiw3J7S3u/mG6Rima90U=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=S3wwud6B63gbnncyQiP7KCWP9Boq6euegPxEuuOc3rtChVp0GNcFCG6uuwOkDRIBA
	 ETLDHkLkTxxuqyiopdN5WBAvL6K5GXxBHCvnfDP2U4OMXEp8UmhjKlwseV6UWuzgJg
	 NXhJvEgW4t76HyR9xD7j1HgRRUTmfeRuY32YIB3c=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <cf7e418f-763a-6f27-d498-c88b19c8a9eb@raptorengineering.com>
Date: Mon, 24 Jul 2023 10:06:15 -0500
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
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <019914c7-c6ca-70b9-6c90-e1891f4201c4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/24/23 7:40 AM, Jan Beulich wrote:
> On 21.07.2023 19:02, Shawn Anastasio wrote:
>> On typical Power VMs (e.g. QEMU's -M pseries), a variety of services
>> including an early serial console are provided by Open Firmware.
>> Implement the required interfaces to call into Open Firmware and write
>> to the serial console.
>>
>> Since Open Firmware runs in 32-bit Big Endian mode and Xen runs in
>> 64-bit Little Endian mode, a thunk is required to save/restore
>> any potentially-clobbered registers as well as to perform the
>> required endianness switch. Thankfully, linux already has such
>> a routine, which was imported into ppc64/of-call.S.
>>
>> Support for bare metal (PowerNV) will be implemented in a future
>> patch.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> While I've committed the earlier two patches, I had to back out this
> one. In my environment (gcc13) the build fails due an unresolved
> reference to memset() out of boot-of.c (supposedly from of_call()).

Does removing the `{ 0 }` initializer to `struct of_service s` on line
43 resolve this?

> Jan

Thanks,
Shawn

