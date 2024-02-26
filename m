Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C18868115
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 20:35:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685786.1067072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1regjc-00005p-El; Mon, 26 Feb 2024 19:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685786.1067072; Mon, 26 Feb 2024 19:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1regjc-0008VK-C3; Mon, 26 Feb 2024 19:33:56 +0000
Received: by outflank-mailman (input) for mailman id 685786;
 Mon, 26 Feb 2024 19:33:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kdE/=KD=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1regja-0008VB-EU
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 19:33:54 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6838935-d4dd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 20:33:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BBBBC8285534;
 Mon, 26 Feb 2024 13:33:47 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lBIrBmDgm9TK; Mon, 26 Feb 2024 13:33:46 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 69E7C82856C2;
 Mon, 26 Feb 2024 13:33:46 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UsSaXHAZACpY; Mon, 26 Feb 2024 13:33:46 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C18AB8285534;
 Mon, 26 Feb 2024 13:33:45 -0600 (CST)
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
X-Inumbo-ID: f6838935-d4dd-11ee-98f5-efadbce2ee36
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 69E7C82856C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1708976026; bh=gynGyrftQROr1vQf3qgFIDI8jMyRF6PVZXguwa8Svi0=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=mTEy0A4KKW3QGVAnTvDkZUhcmWy1lyDDH8gl7elEGL2fGbHMarzvBDbdJmv4z15Y6
	 slgvsCfpfsA+27swzJ2qZqN5JLA3gTBMe9VbdSU5WPEwfIzDy5sN/BTZsLOAy6pdg5
	 04hv5dT2CzuRM2FpznZzgsWzv4zj18iTjyTF1GP0=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <95824bd5-63e5-4759-bd2f-c903543b450f@raptorengineering.com>
Date: Mon, 26 Feb 2024 13:33:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] xen/ppc: address violations of MISRA C:2012 Rule
 11.8.
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
 <9270a4fe1712cff6a99e60c7862de1c1b2dde3d6.1702982442.git.maria.celeste.cesario@bugseng.com>
 <alpine.DEB.2.22.394.2402231518390.754277@ubuntu-linux-20-04-desktop>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <alpine.DEB.2.22.394.2402231518390.754277@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stefano,

Sorry for the delay on this.

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Best,
Shawn

On 2/23/24 5:19 PM, Stefano Stabellini wrote:
> Shawn,
> 
> I am thinking of committing this, if you disagree please say something
> in the next couple of days
> 
> 
> On Tue, 19 Dec 2023, Simone Ballarin wrote:
>> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
>>
>> The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
>> headline states:
>> "A conversion shall not remove any const, volatile or _Atomic qualification
>> from the type pointed to by a pointer".
>>
>> Fix violation by adding missing const qualifier in cast.
>>
>> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
>> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>> Adaptation requested by the community to make the code more consistent.
>> ---
>>  xen/arch/ppc/include/asm/atomic.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/ppc/include/asm/atomic.h b/xen/arch/ppc/include/asm/atomic.h
>> index 64168aa3f1..fe778579fb 100644
>> --- a/xen/arch/ppc/include/asm/atomic.h
>> +++ b/xen/arch/ppc/include/asm/atomic.h
>> @@ -16,7 +16,7 @@
>>  
>>  static inline int atomic_read(const atomic_t *v)
>>  {
>> -    return *(volatile int *)&v->counter;
>> +    return *(const volatile int *)&v->counter;
>>  }
>>  
>>  static inline int _atomic_read(atomic_t v)
>> -- 
>> 2.40.0
>>

