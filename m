Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D4167560E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 14:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481789.746912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrfM-00012S-2C; Fri, 20 Jan 2023 13:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481789.746912; Fri, 20 Jan 2023 13:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrfL-00010N-Vk; Fri, 20 Jan 2023 13:42:47 +0000
Received: by outflank-mailman (input) for mailman id 481789;
 Fri, 20 Jan 2023 13:42:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIrfK-00010H-4d
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 13:42:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIrf9-0006GN-8s; Fri, 20 Jan 2023 13:42:35 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.149.154]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIrf8-0007fj-VX; Fri, 20 Jan 2023 13:42:35 +0000
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
	bh=qJeBhOWE3Lj0DaWJ9fcnnSccFHTRm2OxoFXO8lOO3I4=; b=DK4/3DiDR8uTfCUnzX0gTWmlpw
	X53/Ig8sNjOUVVBX2yK6JtI/Qsj3EgaKIy8h13fi+3Bmy55tB/N+GN6y33KfSCpoP9VRFtAgNsGd5
	+c66lO+auSAkwFNMSoLga6pl9I8Ect0zkfutH/4gBHGazbqPq8QfbSThFbLI5W7AVql4=;
Message-ID: <b85ff051-ca1b-4b38-3a18-b781b3b85961@xen.org>
Date: Fri, 20 Jan 2023 13:42:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tools/symbols: drop asm/types.h inclusion
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1eaa4cce-2ef2-ca38-56d2-5d551c9c1ae9@suse.com>
 <d519b6c5-5972-ff31-c3ee-39649babde7c@xen.org>
 <95d73822-5321-4c9b-04d1-8ee4f78ff35d@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <95d73822-5321-4c9b-04d1-8ee4f78ff35d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/01/2023 13:19, Jan Beulich wrote:
> On 20.01.2023 12:24, Julien Grall wrote:
>> On 20/01/2023 08:40, Jan Beulich wrote:
>>> While this has been there forever, it's not clear to me what it was
>>> (thought to be) needed for.
>>
>> asm/types.h used to be directly included in assembly x86 file. This was
>> dropped by commit 3f76e83c4cf6 "x86/entry: drop unused header inclusions".
> 
> Just to clarify: The statement in the description is about $subject,
> not ...
> 
>>>   In fact, all three instances of the header
>>> already exclude their entire bodies when __ASSEMBLY__ was defined.
>>> Hence, with no other assembly files including this header, we can at the
>>> same time get rid of those conditionals.
> 
> ... this further aspect. I can certainly see why the guards may have
> been there (without having gone look for when the last such use may
> have disappeared) beyond the bogus use by the tool.

Ah! Thanks for the clarification. I indeed misinterpreted the first 
sentence.

Cheers,

-- 
Julien Grall

