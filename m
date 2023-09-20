Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBAD7A8962
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 18:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605813.943418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj01R-00040t-DH; Wed, 20 Sep 2023 16:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605813.943418; Wed, 20 Sep 2023 16:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj01R-0003yn-AT; Wed, 20 Sep 2023 16:25:53 +0000
Received: by outflank-mailman (input) for mailman id 605813;
 Wed, 20 Sep 2023 16:25:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KN1t=FE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qj01P-0003yh-Ve
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 16:25:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bf25cb2-57d2-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 18:25:49 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id E4C994EE073F;
 Wed, 20 Sep 2023 18:25:48 +0200 (CEST)
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
X-Inumbo-ID: 5bf25cb2-57d2-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Wed, 20 Sep 2023 18:25:48 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
Subject: New MISRA C:2012 R10.3 violations due to XSA-438 fix
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <94f7aad4a3e6629fe947883ab0fca53f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

In light of the recent changes introduced by commit 
fb0ff49fe9f784bfee0370c2a3c5f20e39d7a1cb,
as part of XSA-438 [1], the signature of function pointer 'update_cr3' 
in
'xen/arch/x86/include/asm/paging.h', line 121, changed its second 
parameter to a boolean.
Consequently, all calls to that function should use a boolean to comply 
with MISRA C:2012
Rule 10.3 ("The value of an expression shall not be assigned to an 
object with a narrower
essential type or of a different essential type category"), but they 
still use integers.
These were the ones I can find:
xen/arch/x86/include/asm/paging.h:299:    return 
paging_get_hostmode(v)->update_cr3(v, 1, noflush);
xen/arch/x86/mm/hap/hap.c:797:    hap_update_cr3(v, 0, false);
xen/arch/x86/mm/shadow/common.c:2513:    
v->arch.paging.mode->update_cr3(v, 0, false);
xen/arch/x86/mm/shadow/multi.c:2478:        
v->arch.paging.mode->update_cr3(v, 0, false);

[1] 
https://lore.kernel.org/xen-devel/E1qitNQ-0001Pu-0K@xenbits.xenproject.org/

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

