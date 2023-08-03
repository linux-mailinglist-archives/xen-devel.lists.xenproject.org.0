Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B0776E435
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 11:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576133.901937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUVQ-0001UF-GL; Thu, 03 Aug 2023 09:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576133.901937; Thu, 03 Aug 2023 09:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUVQ-0001Sb-DV; Thu, 03 Aug 2023 09:20:28 +0000
Received: by outflank-mailman (input) for mailman id 576133;
 Thu, 03 Aug 2023 09:20:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PRme=DU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRUVP-0001ST-38
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 09:20:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa7edf91-31de-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 11:20:25 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CE68F4EE0737;
 Thu,  3 Aug 2023 11:20:24 +0200 (CEST)
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
X-Inumbo-ID: fa7edf91-31de-11ee-b268-6b7b168915f2
MIME-Version: 1.0
Date: Thu, 03 Aug 2023 11:20:24 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, xenia.ragiadakou@amd.com, Ayan Kumar Halder
 <ayankuma@amd.com>, consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Address MISRA C:2012 Rule 8.4
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <786d24b044bfa503a73a36d2a01eae8c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

The headline of Rule 8.4 is as follows:
"A compatible declaration shall be visible when an object or
function with external linkage is defined".

Some functions reported in [1][2] are lacking a declaration in the 
respective header files;
as remarked on xen-devel's IRC channel, this is ok since they are only 
called from asm code (e.g., start_xen). A similar discussion
had taken place in the past (see [3]) and the general consensus was to 
deviate these cases.
If that is still the case, a suitable project-wide deviation can be 
added to address these violations.

[1] 
https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/ARM64-Set1/210/PROJECT.ecd;/by_service/MC3R1.R8.4.html
[2] 
https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/210/PROJECT.ecd;/by_service/MC3R1.R8.4.html
[3] 
https://lore.kernel.org/all/20220705210218.483854-2-burzalodowa@gmail.com/

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

