Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D18F77271F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578502.906029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0vu-0001EB-Vo; Mon, 07 Aug 2023 14:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578502.906029; Mon, 07 Aug 2023 14:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0vu-00019n-Sp; Mon, 07 Aug 2023 14:10:06 +0000
Received: by outflank-mailman (input) for mailman id 578502;
 Mon, 07 Aug 2023 14:10:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qT0vt-00013e-Qn
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:10:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a694a65-352c-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 16:10:03 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id EECD94EE0737;
 Mon,  7 Aug 2023 16:10:02 +0200 (CEST)
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
X-Inumbo-ID: 1a694a65-352c-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 16:10:02 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 4/4] x86/setup: address MISRA C:2012 Rule 5.3
In-Reply-To: <66d0ea64-0363-db7b-b4e2-5e404bff28d2@suse.com>
References: <cover.1691135862.git.nicola.vetrini@bugseng.com>
 <484a88bb35cdb6e5ec036d40fb2b4e20678fd975.1691135862.git.nicola.vetrini@bugseng.com>
 <55099faa-206a-b7ae-8ef1-64d1dc344c4c@suse.com>
 <f7d676d32355788620bda00a60be5258@bugseng.com>
 <66d0ea64-0363-db7b-b4e2-5e404bff28d2@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <50fe2600058c0e5224b822ad49db75eb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2023 15:42, Jan Beulich wrote:
> On 07.08.2023 15:18, Nicola Vetrini wrote:
>> On 07/08/2023 15:05, Jan Beulich wrote:
>>> On 04.08.2023 10:03, Nicola Vetrini wrote:
>>>> The parameters renamed in the function declaration caused shadowing
>>>> with the homonymous variable in 'xen/common/efi/boot.c'. Renaming
>>>> them also addresses Rule 8.3:
>>>> "All declarations of an object or function shall use the same names
>>>> and type qualifiers".
>>> 
>>> Can you explain to me how shadowing can happen in a declaration? I
>>> would focus on 8.3 here, and only mention the other name collision.
>> 
>> There's "static struct file __initdata kernel;" in
>> xen/common/efi/boot.c, which
>> is visible when the function is declared. Since renaming these 
>> parameter
>> names would
>> have been addressed by Federico for R8.3 anyway, my intention was to
>> address them both.
> 
> I understand what you say, but your reply doesn't answer my question.
> Just to emphasize the important aspect: I could see the shadowing
> aspect if the _definition_ of construct_dom0() used "kernel". But I'm
> asking about declarations (the one here as well as in general): I
> can't see how any shadowing can occur without there being any code in
> the position of using any such variable / parameter. IOW if Eclair
> spits out 5.3 violations on declarations, I'm inclined to think it's
> wrong. (Because of 8.3 a violation there would then need dealing with
> anyway, but _only_ because of 8.3, if the definition is already okay.)
> 
> Jan

The declaration itself is a scope and shadowing can happen, as in:

int x;
void f(int x, int arr[x]);

Now, the example is a bit contrived, but the fact that the rule does not 
list any
exception motivates this behaviour. In any case, I'll try to rephrase 
the commit message
to be less ambiguous.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

