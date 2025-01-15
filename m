Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3111A12A13
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 18:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872953.1283951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY7Ot-0002So-8N; Wed, 15 Jan 2025 17:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872953.1283951; Wed, 15 Jan 2025 17:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY7Ot-0002Pv-4b; Wed, 15 Jan 2025 17:41:55 +0000
Received: by outflank-mailman (input) for mailman id 872953;
 Wed, 15 Jan 2025 17:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa7S=UH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tY7Or-0002Pn-9p
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 17:41:53 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff46574f-d367-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 18:41:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6037C8286736;
 Wed, 15 Jan 2025 11:41:48 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gny4TwPY2_Qb; Wed, 15 Jan 2025 11:41:47 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 898538286868;
 Wed, 15 Jan 2025 11:41:47 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qDxMNjvKEPwZ; Wed, 15 Jan 2025 11:41:47 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E2EAA8286736;
 Wed, 15 Jan 2025 11:41:46 -0600 (CST)
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
X-Inumbo-ID: ff46574f-d367-11ef-99a4-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 898538286868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1736962907; bh=ByQYVunuVRpGxjkALScEYlY/PYEI+s0b6B6Z0C93INM=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=d1M1HBVb9X+EcHuvQ1BRNtm85ZKrp3SSy1Q6YYhEg1vU5L9NwMG4wcNeqB2uHGAFw
	 tj3OZv6nOVPy0XZ2RiuJqbxIhkCrXgJmCeXfrvc/f9S8bCybFGnGJWf4RApwBZGmdW
	 EZKqNrzuNnz1w2wNr7Hn3BmolkM5o9gcAn/mSFlU=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <502aafe5-1e92-4119-b5ff-c4402f2a0822@raptorengineering.com>
Date: Wed, 15 Jan 2025 11:41:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/ppc: Fix double xen_ulong_t typedef in
 public/arch-ppc.h
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250115150339.53931-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20250115150339.53931-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 1/15/25 9:03 AM, Andrew Cooper wrote:
> public/arch-ppc.h contains two adjacent #ifndef __ASSEMBLY__ blocks.
> 
> With these merged, it becomes very obvious that there's a duplicate
> definition of xen_ulong_t, which is also noticed by the docs build:
> 
>   /usr/bin/perl -w /local/xen.git/docs/xen-headers -O html/hypercall/ppc \
>           -T 'arch-ppc - Xen public headers' \
>           -X arch-arm -X arch-riscv -X arch-x86_32 -X arch-x86_64 \
>           -X xen-arm -X xen-riscv -X xen-x86_32 -X xen-x86_64 \
>           -X arch-x86 \
>           /local/xen.git/docs/../xen include/public include/xen/errno.h
>   include/public/memory.h:63: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:55
>   include/public/memory.h:63: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:61
>   include/public/memory.h:63: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:61
>   include/public/memory.h:63: multiple definitions of Typedef xen_ulong_t: include/public/arch-ppc.h:55
> 
> Drop the second typedef.  Finally, annotate the #endif so it's clear
> what it refers to.
> 
> Fixes: 08c192cc1127 ("xen/ppc: Add public/arch-ppc.h")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

