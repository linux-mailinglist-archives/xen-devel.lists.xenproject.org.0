Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B78677026D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 16:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577164.904101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRvM7-000633-JT; Fri, 04 Aug 2023 14:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577164.904101; Fri, 04 Aug 2023 14:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRvM7-00061K-Fr; Fri, 04 Aug 2023 14:00:39 +0000
Received: by outflank-mailman (input) for mailman id 577164;
 Fri, 04 Aug 2023 14:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRvM6-000613-Ck
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 14:00:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48d1a911-32cf-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 16:00:35 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5F6254EE0737;
 Fri,  4 Aug 2023 16:00:35 +0200 (CEST)
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
X-Inumbo-ID: 48d1a911-32cf-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Fri, 04 Aug 2023 16:00:35 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <stefano.stabellini@amd.com>, Michal Orzel <michal.orzel@amd.com>,
 xenia.ragiadakou@amd.com, Ayan Kumar Halder <ayankuma@amd.com>,
 consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: Address MISRA C:2012 Rule 8.4
In-Reply-To: <00fb1a58849ec08534465df2f8ca2284@bugseng.com>
References: <786d24b044bfa503a73a36d2a01eae8c@bugseng.com>
 <alpine.DEB.2.22.394.2308031733380.2127516@ubuntu-linux-20-04-desktop>
 <00fb1a58849ec08534465df2f8ca2284@bugseng.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <a44369bc5e64277cab6dedb636986dd3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> 
> Upon further examination, I identified the following patterns:
> 
> 1. Functions defined in .c called only from asm code (e.g., the
> already mentioned __start_xen)
> 2. Functions/variables declared in a .h, defined in a .c that does not
> include the .h with the declaration
> (e.g., 'fill_console_start_info' is defined in 'xen/drivers/vga.c',
> declared in 'xen/include/xen/console.h' which is not visible when
> compiling the .c).
> 3. Variables that are either extern or not, such as 'acpi_gbl_FADT' in
> 'xen/include/acpi/acglobal.h', depending on
>    DEFINE_ACPI_GLOBALS
> 
> Below are the proposed resolution strategies:
> 
> 1. I would advise to add the declaration in the relative .h, to
> support automatic consistency checks with the
>    implementation and a quick reference when touching the asm.
> 2. To comply with the rule, the header with the declaration should be
> included. Also note that there are some
>    corner cases, such as 'get_sec', which is used in 'cper.h' without
> including 'time.h' (which should gain a
>    declaration for it).
> 3. One possible resolution pattern is including 'acglobal.h' twice
> (either directly or indirectly trough acpi.h, if
>    the latter does not cause other issues) like so:
> 
>    (assuming DEFINE_ACPI_GLOBALS is undefined here)
>    #include "acglobal.h"
>    #define DEFINE_ACPI_GLOBALS
>    #include  "acglobal.h"
> 
>   this way, the rule is followed properly, though it's not the
> prettiest pattern and also clashes with the objectives
>   of D4.10 ("Precautions shall be taken in order to prevent the
> contents of a header file being included
>   more than once"), but then a motivated exception is allowed there.

One further question is whether functions under 
'xen/common/coverage/gcov_base.c' should gain
a declaration in 'gcov.h' or not, as they exist just for the purpose of 
being referenced
by autogenerated profiling code. I see no reason why they shouldn't, but 
they can also be safely deviated,
since they are not called by Xen code.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

