Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E10690EDFD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 15:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743809.1150793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJvI3-0000nz-Hy; Wed, 19 Jun 2024 13:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743809.1150793; Wed, 19 Jun 2024 13:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJvI3-0000lC-EQ; Wed, 19 Jun 2024 13:23:55 +0000
Received: by outflank-mailman (input) for mailman id 743809;
 Wed, 19 Jun 2024 13:23:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JaCz=NV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sJvI1-0000l6-8w
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 13:23:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2aa99688-2e3f-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 15:23:50 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 632A64EE0738;
 Wed, 19 Jun 2024 15:23:50 +0200 (CEST)
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
X-Inumbo-ID: 2aa99688-2e3f-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Wed, 19 Jun 2024 15:23:50 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen Devel <xen-devel@lists.xenproject.org>
Cc: Jbeulich <jbeulich@suse.com>, Andrew Cooper3
 <andrew.cooper3@citrix.com>, Roger Pau <roger.pau@citrix.com>, Consulting
 <consulting@bugseng.com>
Subject: MISRA C Rule 5.3 violation - shadowing in mctelem.c
Message-ID: <f351f904fab43f88396b3ae1b5d64e95@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I was looking at the shadowing due to the struct identifier and the 
local variables "mctctl" in x86/cpu/mcheck/mctelem.c (see [1], the 
second report). This kind of shadowing seems very intentional, and the 
initial naive approach I devised was to simply rename the local 
variables.
This, however, results in build breakages, as sometimes the shadowed 
name seems to be used for accessing the global struct (unless I'm 
missing something), and as a result changing the name of the locals is 
not possible, at least not without further modifications to this file, 
which aren't obvious to me.

It would be really helpful if you could point me to either:
- avoid the shadowing in some way that does not occur to me at the 
moment;
- deviate this file, as many similar files in x86/cpu are already 
deviated.

What's your opinion on this?

Thanks,
   Nicola

[1] 
https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/staging/X86_64-BUGSENG/latest/PROJECT.ecd;/by_service/MC3R1.R5.3.html

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

