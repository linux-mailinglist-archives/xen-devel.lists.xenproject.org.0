Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AC4779EB6
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 11:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582847.912831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUlJe-000437-P8; Sat, 12 Aug 2023 09:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582847.912831; Sat, 12 Aug 2023 09:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUlJe-00041S-MB; Sat, 12 Aug 2023 09:53:50 +0000
Received: by outflank-mailman (input) for mailman id 582847;
 Sat, 12 Aug 2023 09:53:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NgeL=D5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qUlJd-00041M-Tx
 for xen-devel@lists.xenproject.org; Sat, 12 Aug 2023 09:53:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2016565f-38f6-11ee-8613-37d641c3527e;
 Sat, 12 Aug 2023 11:53:47 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4271D4EE0738;
 Sat, 12 Aug 2023 11:53:44 +0200 (CEST)
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
X-Inumbo-ID: 2016565f-38f6-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Sat, 12 Aug 2023 11:53:44 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 tamas@tklengyel.com
Subject: Re: [XEN PATCH 3/6] x86/vm_event: add missing include
In-Reply-To: <alpine.DEB.2.22.394.2308111600190.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <f303a1782aeb67186c3181e01a51153fdce70cfb.1691676251.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308111600190.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <449fa348676e754b7eae9b8acc00fb86@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>> diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
>> index 7027c08a926b..499b6b349d79 100644
>> --- a/xen/arch/x86/vm_event.c
>> +++ b/xen/arch/x86/vm_event.c
>> @@ -20,6 +20,7 @@
>> 
>>  #include <xen/sched.h>
>>  #include <xen/mem_access.h>
>> +#include <xen/vm_event.h>
>>  #include <asm/vm_event.h>
>> 
>>  /* Implicitly serialized by the domctl lock. */
> 
> I think the problem here is that ./arch/x86/include/asm/vm_event.h,
> differently from ./arch/arm/include/asm/vm_event.h, doesn't #include
> <xen/vm_event.h>

I see your point. Do you think it would be better to include 
xen/vm_event.h
in asm/vm_event.h for x86 or move the inclusion of xen/vm_event.h for 
arm to
the source file, as done in the patch?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

