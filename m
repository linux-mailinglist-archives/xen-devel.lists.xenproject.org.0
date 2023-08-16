Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E923A77E519
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 17:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584805.915639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWIPF-0004cs-G6; Wed, 16 Aug 2023 15:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584805.915639; Wed, 16 Aug 2023 15:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWIPF-0004aR-DN; Wed, 16 Aug 2023 15:25:57 +0000
Received: by outflank-mailman (input) for mailman id 584805;
 Wed, 16 Aug 2023 15:25:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hDLr=EB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qWIPE-0004aL-Ne
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 15:25:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30bd91ff-3c49-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 17:25:54 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id F293A4EE0737;
 Wed, 16 Aug 2023 17:25:53 +0200 (CEST)
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
X-Inumbo-ID: 30bd91ff-3c49-11ee-9b0c-b553b5be7939
MIME-Version: 1.0
Date: Wed, 16 Aug 2023 17:25:53 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: "stefano.stabellini@amd.com" <sstabellini@kernel.org>, Michal Orzel
 <michal.orzel@amd.com>, xenia.ragiadakou@amd.com, Ayan Kumar Halder
 <ayankuma@amd.com>, consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com, Julien
 Grall <julien@xen.org>, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Placing of the documentation for MISRA C:2012 Directive 4.1
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <95a86d69e97eb127a26f65cceb87e3bf@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

it has been agreed during past MISRA meetings that Directive 4.1
("Run-time failures shall be minimized") shall be dealt with by 
documenting
how in Xen such runtime failures are prevented, so by preparing a 
document analogous to
docs/misra/C-language-toolchain.rst.

A common way to deal with this in ECLAIR is to create an header file
and include it in at least one file that is part of the analyzed build, 
so that the
checker can see it.

One obvious candidate for this is having a .h file inside docs/misra 
that is included
either by a dummy .c file inside the same directory (and then build the 
docs in the analyzed
configuration) or somewhere else (I came up with no
good places where to include it).
It could also be a standalone .c file somewhere else, but I don't think 
this would be the preferred way.

You can see a possible draft of the structure of this file here [1], but 
providing the content
here would require a substantial amount of collaboration with people 
having a broader
knowledge about Xen and its practices to prevent the runtime errors 
delineated here, so
a possibility is making an RFC patch to gather some inputs to fill the 
sections appropriately.

As a side note, the directive should be added to docs/misra/rules.rst. 
It can be part of
the patch addressing the violations, tough.

[1] 
https://github.com/BUGSENG/eclair_demo/blob/main/ECLAIR/MISRA_C_2012_doc.h

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

