Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A738983CACB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 19:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671713.1045204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4Nr-0000KX-7U; Thu, 25 Jan 2024 18:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671713.1045204; Thu, 25 Jan 2024 18:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4Nr-0000JN-2g; Thu, 25 Jan 2024 18:23:27 +0000
Received: by outflank-mailman (input) for mailman id 671713;
 Thu, 25 Jan 2024 18:23:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rT4Np-0000HS-7y
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 18:23:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4Nj-000246-KP; Thu, 25 Jan 2024 18:23:19 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.5.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4Nj-0007Ph-Bh; Thu, 25 Jan 2024 18:23:19 +0000
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
	bh=AD+zfIW7mXJnTz6aOr2nBeXKqCaz6Kvs97fIflSfmCc=; b=c49eXfSjzltVBaW8Ufed9g33u2
	3hYDTF2lyQT6xY00fPANHm/IBHXnseJSbfLTT73PK+KHtFZLH887AH06pXKfh9hAyc9V1UAxDrObO
	kv2ZNKbE3/CoARmc6Cd5QY8F/4kyDE2CfD16RO02zIxn/GS5H6FJYw/KzK+juY6/Nme0=;
Message-ID: <98934d62-71de-4cb3-8d0e-8d1e3a679cdf@xen.org>
Date: Thu, 25 Jan 2024 18:23:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [PATCH v2] NUMA: no need for asm/numa.h when !NUMA
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <94cffa48-5e31-4557-827d-c6dec6031d05@suse.com>
 <32ab102b-d91a-4076-a9df-94f08c7e6fa0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <32ab102b-d91a-4076-a9df-94f08c7e6fa0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/01/2024 17:00, Jan Beulich wrote:
> On 08.01.2024 12:30, Jan Beulich wrote:
>> There's no point in every architecture carrying the same stubs for the
>> case when NUMA isn't enabled (or even supported). Move all of that to
>> xen/numa.h; replace explicit uses of asm/numa.h in common code. Make
>> inclusion of asm/numa.h dependent upon NUMA=y.
>>
>> Drop the no longer applicable "implement NUMA support" comments - in a
>> !NUMA section this simply makes no sense.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> May I please ask for an Arm ack (or otherwise) here?

Thanks for the reminder.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

