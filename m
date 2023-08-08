Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5063773925
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 10:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579440.907412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIMw-0000wy-Ty; Tue, 08 Aug 2023 08:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579440.907412; Tue, 08 Aug 2023 08:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIMw-0000u1-QX; Tue, 08 Aug 2023 08:47:10 +0000
Received: by outflank-mailman (input) for mailman id 579440;
 Tue, 08 Aug 2023 08:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VzHb=DZ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qTIMv-0000tv-0m
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 08:47:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 271fb911-35c8-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 10:47:06 +0200 (CEST)
Received: from [192.168.1.15] (host-79-35-203-138.retail.telecomitalia.it
 [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id AB9714EE0737;
 Tue,  8 Aug 2023 10:47:05 +0200 (CEST)
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
X-Inumbo-ID: 271fb911-35c8-11ee-8613-37d641c3527e
Message-ID: <5972799c-99a6-73f5-eff2-b24469f7428d@bugseng.com>
Date: Tue, 8 Aug 2023 10:47:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Subject: MISRA violations in hypercall-defs
Organization: BUGSENG srl
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: jgross@suse.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone.

I would like to to ask your opinion about the auto-generated file
xen/include/xen/hypercall-defs.h which contains some violations of
MISRA C:2012 Rule 8.3:
"All declarations of an object or function shall use the same names and
type qualifiers".

Such violations can be seen at the following links
(copy and paste the link on you browser, including also the characters
after the '#'):

- arm
https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/ARM64-Set1/218/PROJECT.ecd;/by_service/MC3R1.R8.3.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"file","inputs":[{"enabled":true,"text":"xen/include/xen/hypercall-defs.h"}]}]}}}

- x86
https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/218/PROJECT.ecd;/by_service/MC3R1.R8.3.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"file","inputs":[{"enabled":true,"text":"xen/include/xen/hypercall-defs.h"}]}]}}}

Some of the violations are due to mismatches on the return types
and the use of `ret_t`.
I see that xen/include/hypercall-defs.c generates the declarations
but I am not sure about what might be the best way to modify it
so as to address violations with the least amount of changes.
Do you have any suggestions?

Regards
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

