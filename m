Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A1F87EE50
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:03:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694996.1084477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGOD-0008Jf-QO; Mon, 18 Mar 2024 17:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694996.1084477; Mon, 18 Mar 2024 17:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGOD-0008H9-ND; Mon, 18 Mar 2024 17:03:09 +0000
Received: by outflank-mailman (input) for mailman id 694996;
 Mon, 18 Mar 2024 17:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QoDm=KY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rmGOC-0008Gz-Cy
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 17:03:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 640fefa6-e549-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 18:03:07 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8D9E84EE0744;
 Mon, 18 Mar 2024 18:03:06 +0100 (CET)
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
X-Inumbo-ID: 640fefa6-e549-11ee-afdd-a90da7624cb6
MIME-Version: 1.0
Date: Mon, 18 Mar 2024 18:03:06 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 07/10] xen/efi: efibind: address violations of MISRA C
 Rule 20.7
In-Reply-To: <28eaf480-4ed6-4c1d-9508-63e8d497d530@suse.com>
References: <cover.1710762555.git.nicola.vetrini@bugseng.com>
 <d2bc16c1b2d00b85f4b1a96bd855bbfe38861e87.1710762555.git.nicola.vetrini@bugseng.com>
 <28eaf480-4ed6-4c1d-9508-63e8d497d530@suse.com>
Message-ID: <c2626d7ac0551a988e8519d86c739ad3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-18 17:49, Jan Beulich wrote:
> On 18.03.2024 12:53, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that 
>> all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> This file is matched by exclude-list.json, but the fix is rather 
>> trivial
>> and impacts code that in under the scope of MISRA compliance.
> 
> On the same basis as the other change:
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 

Thanks.

> I wonder though: Where do we draw the line?
> 
> Jan

So far the policy, at least from my side, has been to submit a patch if 
the change is simple enough, to avoid adding a special case that needs 
to be documented and maintained.
In case concerns were raised, propose a deviation and follow up from 
there.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

