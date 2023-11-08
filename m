Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F427E5B1D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 17:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629350.981511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0lLu-0000Mq-Ko; Wed, 08 Nov 2023 16:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629350.981511; Wed, 08 Nov 2023 16:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0lLu-0000Ka-IB; Wed, 08 Nov 2023 16:24:26 +0000
Received: by outflank-mailman (input) for mailman id 629350;
 Wed, 08 Nov 2023 16:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7seD=GV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0lLt-0000In-3e
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 16:24:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46d60a4e-7e53-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 17:24:23 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id BD4EE4EE0737;
 Wed,  8 Nov 2023 17:24:22 +0100 (CET)
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
X-Inumbo-ID: 46d60a4e-7e53-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Wed, 08 Nov 2023 17:24:22 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen Devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Jbeulich <jbeulich@suse.com>, Andrew Cooper3
 <andrew.cooper3@citrix.com>, Roger Pau <roger.pau@citrix.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Consulting <consulting@bugseng.com>
Subject: Remaining violations of MISRA Rule 7.4
Message-ID: <21761f2a6633a08ceb2b70a46013486a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone,

I was looking at leftover violations for MISRA Rule 7.4:
'A string literal shall not be assigned to an object unless the object's 
type
is "pointer to const-qualified char" '

You can see the referenced violations at [1] and [2].

I think the ones in x86/setup.c can be taken care of either by making an 
early return
from cmdline_cook, given that one caller never supplies a NULL cmdline, 
while the other
properly takes care of the possibility of returning NULL, afaict.

  static char * __init cmdline_cook(char *p, const char *loader_name)
  {
-    p = p ? : "";
+    if ( p == NULL )
+        return NULL;

or changing the type of "loader" to const char*

  void __init noreturn __start_xen(unsigned long mbi_p)
  {
-    const char *memmap_type = NULL;
-    char *cmdline, *kextra, *loader;
+    const char *memmap_type = NULL, *loader = NULL;
+    char *cmdline, *kextra;;

as, as far as I can tell, it's never changed after

     loader = (mbi->flags & MBI_LOADERNAME)
         ? (char *)__va(mbi->boot_loader_name) : "unknown";

However, the one in xen/arch/arm/efi/efi-boot.h

name.s = "xen";

does not look to have a clear resolution
path, therefore I propose to deviate this with a SAF textual deviation, 
whose justification
relies on the fact that the string is never modified afterwards.

For the one in arm-uart.c from the discussion, I'm testing possible 
solution with no code
changes, but if that doesn't work out, then I'm inclined towards a 
deviation, as options
is never modified afterwards.

What do you think?

[1] 
https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/arm/for-4.19/ARM64-Set1/376/PROJECT.ecd;/by_service/MC3R1.R7.4.html

[2] 
https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/x86_64/staging/X86_64-Set1/376/PROJECT.ecd;/by_service/MC3R1.R7.4.html

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

