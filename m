Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126AE8310F5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 02:38:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668593.1040914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQHLq-0002Uq-8t; Thu, 18 Jan 2024 01:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668593.1040914; Thu, 18 Jan 2024 01:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQHLq-0002Rb-5e; Thu, 18 Jan 2024 01:37:50 +0000
Received: by outflank-mailman (input) for mailman id 668593;
 Thu, 18 Jan 2024 01:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCV5=I4=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rQHLo-0002RM-L9
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 01:37:48 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e436043-b5a2-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 02:37:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C60A082855B4;
 Wed, 17 Jan 2024 19:37:45 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ujT5PvYBVMjx; Wed, 17 Jan 2024 19:37:45 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3A980828563D;
 Wed, 17 Jan 2024 19:37:45 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5NAssk0TXYAt; Wed, 17 Jan 2024 19:37:45 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C414D82855B4;
 Wed, 17 Jan 2024 19:37:44 -0600 (CST)
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
X-Inumbo-ID: 2e436043-b5a2-11ee-98f2-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3A980828563D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1705541865; bh=jTq2tsyCJHfP7v1jfSSaEx7F6HeAvpiOPz6e13Bhljw=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=e4riNZDHZELvuL2O+cpm6505FUrdLu3dzwIGDsEMPWA5p/hd3A0x/4cCqX3dNuRoW
	 QA1Rx53hVSw9w/2tUrU7eyX7brc/Um81dyIKV9t6xOdu70z4Y7Ri208RmPG/PIF2jB
	 AbmIuYlBeYxkwjellVL5clyDcQDF/NL/4Apg1dzA=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <f8367cf9-d85f-4a0a-ae86-4472c0d23167@raptorengineering.com>
Date: Wed, 17 Jan 2024 19:37:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen/ppc: mm-radix: Replace debug printing code
 with printk
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <a45e841068ef66cc8c1d836a2452910fd3effd50.1702607884.git.sanastasio@raptorengineering.com>
 <002559fc-e57c-48e2-b99d-db352c2fdf60@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <002559fc-e57c-48e2-b99d-db352c2fdf60@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/20/23 5:48 AM, Jan Beulich wrote:
> On 15.12.2023 03:44, Shawn Anastasio wrote:
>> Now that we have common code building, there's no need to keep the old
>> itoa64+debug print function in mm-radix.c
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Looks okay, just one question:
> 
>> --- a/xen/arch/ppc/mm-radix.c
>> +++ b/xen/arch/ppc/mm-radix.c
>> @@ -15,6 +15,12 @@
>>  
>>  void enable_mmu(void);
>>  
>> +#ifdef NDEBUG
>> +#define radix_dprintk(...)
>> +#else
>> +#define radix_dprintk(msg, ...) printk(XENLOG_DEBUG msg, ## __VA_ARGS__)
>> +#endif
> 
> Do you really mean NDEBUG here, and not CONFIG_DEBUG? NDEBUG is generally
> supposed to only control ASSERT() behavior.
>

Thanks for pointing this out. CONFIG_DEBUG does indeed seem to be a
better fit here. Will change in v3.

> Jan

Thanks,
Shawn

