Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA653072F3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 10:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76821.138758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l53mj-0006gl-NX; Thu, 28 Jan 2021 09:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76821.138758; Thu, 28 Jan 2021 09:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l53mj-0006gM-KC; Thu, 28 Jan 2021 09:40:17 +0000
Received: by outflank-mailman (input) for mailman id 76821;
 Thu, 28 Jan 2021 09:40:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l53mh-0006gH-Uv
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 09:40:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l53mc-0002PS-VA; Thu, 28 Jan 2021 09:40:10 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l53mc-0000iN-Mi; Thu, 28 Jan 2021 09:40:10 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=g+7EOaomK7lZZFx0RaAG2Gdg3MkZOCsJLRVuydeMsCA=; b=Fzl2NVUumFLZdwE7Xw2NwznsqQ
	pI6bm0L6WUq1igiSD6BYzV5NrnFBRHMiETXDUY6GdUTyu/LahsMTino8PdzQxpZg36NFX0Ek7O6N/
	ifUOEe+cIv9ANU2ljw7ewozzyUBNDEEJd6Y3uG0V7ucGZKPeRKdxnNAMfUpOghiJbuHg=;
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
 <67136393-8454-9d28-628a-bfb380fd8fc9@xen.org>
 <aa19b356-aa5b-2427-ab8d-2c1ade84ad1c@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a5fd81ac-3ed4-40e7-66d7-a8daf3be4987@xen.org>
Date: Thu, 28 Jan 2021 09:40:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <aa19b356-aa5b-2427-ab8d-2c1ade84ad1c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 27/01/2021 19:20, Oleksandr wrote:
  >  >>> So I think we may be able to drop the include from 
asm/hvm/domain.h
> (this would avoid to include it everywhere...).
> 
> I have tried that, but other CUs use definitions from 
> public/hvm/dm_op.h, for example:
> 
> p2m-pt.c: In function 'p2m_type_to_flags':
> p2m-pt.c:87:33: error: 'XEN_DMOP_IOREQ_MEM_ACCESS_WRITE' undeclared 
> (first use in this function)
>           if ( p2m->ioreq.flags & XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>                                   ^
> So, I would prefer to leave it as is, please let me know if you think 
> otherwise.

AFAICT, there is only 2 places (p2m-pt.c and p2m-ept.c) that requires 
<public/hvm/dm_op.h> but doesn't directly include it. Folding the diff 
below in patch #4 should do the job:

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 975ab403f235..23d411f01d2f 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -17,6 +17,7 @@

  #include <xen/domain_page.h>
  #include <xen/sched.h>
+#include <public/hvm/dm_op.h>
  #include <asm/altp2m.h>
  #include <asm/current.h>
  #include <asm/paging.h>
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index c43d5d0413a1..f2afcf49a368 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -27,6 +27,7 @@
  #include <xen/vm_event.h>
  #include <xen/event.h>
  #include <xen/trace.h>
+#include <public/hvm/dm_op.h>
  #include <public/vm_event.h>
  #include <asm/altp2m.h>
  #include <asm/domain.h>
diff --git a/xen/include/asm-x86/hvm/domain.h 
b/xen/include/asm-x86/hvm/domain.h
index 3b36c2f41fa1..f26c1a2e2d5f 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -28,8 +28,6 @@
  #include <asm/hvm/vmx/vmcs.h>
  #include <asm/hvm/svm/vmcb.h>

-#include <public/hvm/dm_op.h>
-
  #ifdef CONFIG_MEM_SHARING
  struct mem_sharing_domain
  {

You would then need to move the include of <public/hvm/dm_op.h> in 
<xen/dm.h> from this patch to patch #9.

Cheers,

-- 
Julien Grall

