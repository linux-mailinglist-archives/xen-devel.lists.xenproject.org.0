Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F60E76C78C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 09:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574771.900365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6gh-0003Gq-ON; Wed, 02 Aug 2023 07:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574771.900365; Wed, 02 Aug 2023 07:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6gh-0003F4-LW; Wed, 02 Aug 2023 07:54:31 +0000
Received: by outflank-mailman (input) for mailman id 574771;
 Wed, 02 Aug 2023 07:54:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qR6gg-0003Ey-LJ
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 07:54:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qR6gf-00034e-S3; Wed, 02 Aug 2023 07:54:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qR6gf-0002Ky-Kj; Wed, 02 Aug 2023 07:54:29 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=2hy0VfCSnJmQ7IYq0zC9qMqOGe29w9Pn0XRR3XHSWUA=; b=iZNl3KSQbZrkL2U0A9Vj0DmuOZ
	TaAaVq7o3gtvljHedcl78LQ9hYyCC+8r9amzDDtKssCV2kPwo8nBy0H/z2Ro+viS5e75vIQ8MXbtO
	eRM1OlYmapd3k0ZWM6H/zkYoQ41QOBLUnb9UPgLeOq10yjAezdHnr3uFqVwqGCY+kdJQ=;
Message-ID: <c75870a3-d7b4-891f-7c93-c62e97b25fdb@xen.org>
Date: Wed, 2 Aug 2023 08:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Jan Beulich <jbeulich@suse.com>, Khem Raj <raj.khem@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20230801174930.2995947-1-raj.khem@gmail.com>
 <18d3b823-22b2-85fc-18d2-09cf102b4506@xen.org>
 <f7501e7b-2064-38dd-af32-738e01a830c5@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] arm32: Avoid using solaris syntax for .section
 directive
In-Reply-To: <f7501e7b-2064-38dd-af32-738e01a830c5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 02/08/2023 08:22, Jan Beulich wrote:
> On 01.08.2023 23:02, Julien Grall wrote:
>> Hi,
>>
>> Title: This patch is not arm32 specific anymore. So I would replace
>> 'arm32' with 'arm'. This can be done on commit.
>>
>> On 01/08/2023 18:49, Khem Raj wrote:
>>> Assembler from binutils 2.41 rejects [1] this syntax
>>>
>>> .section "name"[, flags...]
>>>
>>> where flags could be #alloc, #write, #execinstr, #exclude, and #tls [2]
>>>
>>> It is almost like a regression compared to 2.40 or older release,
>>
>> The next word after ',' start with an uppercase. Did you intend to use
>> '.' rather than ','?
>>
>> That said, the documentation has the following:
>>
>> For SPARC ELF targets, the assembler supports another type of .section
>> directive for compatibility with the Solaris assembler:"
> 
> But note that "SPARC" was added there only by the commit introducing the
> perceived regression.

Yes, I noticed it while replying yesterday. I still would not describe 
it as a regression mainly because I am not convinced binutils will 
revert the change and it feels like a good move.

Also, regarding your point about older tree on the bug report. I don't 
think we guarantee that stable works all new toolchain without any change.

Cheers,

-- 
Julien Grall

