Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBECCA0AED
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 18:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177040.1501461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQr43-0006o3-9v; Wed, 03 Dec 2025 17:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177040.1501461; Wed, 03 Dec 2025 17:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQr43-0006mb-7I; Wed, 03 Dec 2025 17:54:55 +0000
Received: by outflank-mailman (input) for mailman id 1177040;
 Wed, 03 Dec 2025 17:54:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NLTO=6J=knorrie.org=hans@srs-se1.protection.inumbo.net>)
 id 1vQr41-0006mV-V3
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 17:54:53 +0000
Received: from albatros.knorrie.org (albatros.knorrie.org [35.156.0.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2aeb8e37-d071-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 18:54:51 +0100 (CET)
Received: from [IPV6:2a10:3781:4007:a::15] (unknown
 [IPv6:2a10:3781:4007:a::15])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by albatros.knorrie.org (Postfix) with ESMTPSA id B7569690FA7;
 Wed,  3 Dec 2025 18:54:50 +0100 (CET)
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
X-Inumbo-ID: 2aeb8e37-d071-11f0-980a-7dc792cee155
Message-ID: <c72ef282-2774-4405-ad62-d690229495bd@knorrie.org>
Date: Wed, 3 Dec 2025 18:54:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: Drop ThumbEE support
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <JBeulich@suse.com>,
 Maximilian Engelhardt <maxi@daemonizer.de>
References: <20251203171608.1714964-1-andrew.cooper3@citrix.com>
 <a7f28465-e068-4250-873a-42e6cce71a04@knorrie.org>
 <e5ca01e0-bcd3-4fdc-8136-8b62baa3e8c2@citrix.com>
Content-Language: en-US
From: Hans van Kranenburg <hans@knorrie.org>
In-Reply-To: <e5ca01e0-bcd3-4fdc-8136-8b62baa3e8c2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/3/25 6:49 PM, Andrew Cooper wrote:
> On 03/12/2025 5:47 pm, Hans van Kranenburg wrote:
>> Hi Andrew,
>>
>> On 12/3/25 6:16 PM, Andrew Cooper wrote:
>>> It was reported that Xen no longer builds on Debian Trixie:
>> The FTBFS is on Debian *unstable/sid*.
>>
>> The build on Debian 13 Trixie is OK.
> 
> Ah ok.  I can tweak that.
> 
>>
>>>   Assembler messages:
>>>   {standard input}:474: Error: unknown or missing system register name at operand 1 -- `msr TEECR32_EL1,x0'
>>>   {standard input}:480: Error: unknown or missing system register name at operand 1 -- `msr TEEHBR32_EL1,x0'
>>>   {standard input}:488: Error: unknown or missing system register name at operand 2 -- `mrs x0,TEECR32_EL1'
>>>   {standard input}:494: Error: unknown or missing system register name at operand 2 -- `mrs x0,TEEHBR32_EL1'
>>>   make[5]: *** [Rules.mk:249: arch/arm/domain.o] Error 1
>>>
>>> This turns out to be an intentional change in bintuils.  ThumbEE was dropped
>>> from the architecture and doesn't exist in v8 (i.e. AArch64).
>>>
>>> Xen supports v7+virt extentions so in principle we could #ifdef CONFIG_ARM_32
>>> to keep it working, but there was apparently no use of ThumbEE outside of demo
>>> code, so simply drop it.
>>>
>>> Reported-by: Hans van Kranenburg <hans@knorrie.org>
>> Thanks!
>>
>> I have just applied the patch here and have now successfully built the
>> Debian Xen packages using Debian unstable/sid build chroot on the arm64
>> Debian VM that I have here on my work macbook.
> 
> Assuming that the maintainers are happy, can I translate this into a
> Tested-by tag?

Well, it builds, but if it behaves, I do not know, since I don't have an
easy way to boot the arm64 packages here.

So, if a Build-Tested-by also exists, that one would be fine :D

Hans

