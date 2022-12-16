Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E90A64EB10
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:59:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464524.722946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69MP-00035K-94; Fri, 16 Dec 2022 11:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464524.722946; Fri, 16 Dec 2022 11:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69MP-00032G-5i; Fri, 16 Dec 2022 11:58:41 +0000
Received: by outflank-mailman (input) for mailman id 464524;
 Fri, 16 Dec 2022 11:58:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69MN-000329-DY
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:58:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69ML-0002Sn-Gp; Fri, 16 Dec 2022 11:58:37 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69ML-0005M9-AB; Fri, 16 Dec 2022 11:58:37 +0000
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
	bh=ffeG7YpB3DegaNbNub/9ODCz5ESjbn6mDee0awUYju0=; b=TiKdTzzEGT2kie6jqiZewyWgzZ
	EIL2Ksdsx/AhKWlTVMWEicCS0rXt0MpCXRzDcc+afAhib5legQ8CEqQxNeu/KFUFxBIzdPFfnFAv/
	LnS2NFMCKlH3wbybUZ2KNgdeogFDeYXbgghALVnc81tgwS15ohzFNy7RZmNoESOyLAtM=;
Message-ID: <3328f716-8550-60f5-b12c-489bb51dde4d@xen.org>
Date: Fri, 16 Dec 2022 11:58:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 "Smith, Jackson" <rsmith@riversideresearch.org>
Cc: "Brookes, Scott" <sbrookes@riversideresearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org> <Y5j7KQ9g5Yb/ufn+@itl-email>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Y5j7KQ9g5Yb/ufn+@itl-email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Demi,

On 13/12/2022 22:22, Demi Marie Obenour wrote:
> On Tue, Dec 13, 2022 at 08:55:28PM +0000, Julien Grall wrote:
>> On 13/12/2022 19:48, Smith, Jackson wrote:
>>> Hi Xen Developers,
>>
>> Hi Jackson,
>>
>> Thanks for sharing the prototype with the community. Some questions/remarks
>> below.
> 
> [snip]
> 
>>> With this technique, we protect the integrity and confidentiality of
>>> guest memory. However, a compromised hypervisor can still read/write
>>> register state during traps, or refuse to schedule a guest, denying
>>> service. We also recognize that because this technique precludes
>>> modifying Xen's page tables after startup, it may not be compatible
>>> with all of Xen's potential use cases. On the other hand, there are
>>> some uses cases (in particular statically defined embedded systems)
>>> where our technique could be adopted with minimal friction.
>>
>>  From what you wrote, this sounds very much like the project Citrix and
>> Amazon worked on called "Secret-free hypervisor" with a twist. In your case,
>> you want to prevent the hypervisor to map/unmap the guest memory.
>>
>> You can find some details in [1]. The code is x86 only, but I don't see any
>> major blocker to port it on arm64.
> 
> Is there any way the secret-free hypervisor code could be upstreamed?

I have posted a new version with also a PoC for arm64:

https://lore.kernel.org/xen-devel/20221216114853.8227-1-julien@xen.org/T/#t

For convenience, I have also pushed a branch to my personal git:

https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=summary

branch no-directmap-v1

Cheers,

-- 
Julien Grall

