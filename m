Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AECD7B2E61
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610409.949779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Dv-0003st-8a; Fri, 29 Sep 2023 08:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610409.949779; Fri, 29 Sep 2023 08:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Dv-0003rA-5Y; Fri, 29 Sep 2023 08:51:47 +0000
Received: by outflank-mailman (input) for mailman id 610409;
 Fri, 29 Sep 2023 08:51:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S2/E=FN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qm9Du-0003r3-79
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:51:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a19b94b-5ea5-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 10:51:44 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6797A4EE0739;
 Fri, 29 Sep 2023 10:51:43 +0200 (CEST)
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
X-Inumbo-ID: 6a19b94b-5ea5-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Fri, 29 Sep 2023 10:51:43 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, roger.pau@citrix.com, Wei Liu <wl@xen.org>
Subject: Definition of mfn_t in x86's hvm/grant_table.h
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <a4b6710b66ed05292388ac6882b940ec@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

while fixing a violation of R8.4 related to a missing include in 
x86/hvm/grant_table.c
I included <asm/hvm/grant_table.h>, since that file contains just the 
declarations needed
by the .c file. However, since the declaration uses the type mfn_t, 
which is defined in an
header not included from hvm/grant_table.h I'm wondering what is 
preferred:
1. include #include <asm/paging.h> in asm/hvm/grant_table.h, so that 
mfn_t can be used
   without relying on other headers using this one to provide it.
2. include <asm/grant_table.h> in x86/hvm/grant_table.c, which includes 
more declarations
   than needed, but has all type definitions.

I prefer (1), but (2) does not have major downsides either.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

