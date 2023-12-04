Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD7B80390C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 16:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647141.1009905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAB5H-00062M-Sn; Mon, 04 Dec 2023 15:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647141.1009905; Mon, 04 Dec 2023 15:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAB5H-0005zy-Q4; Mon, 04 Dec 2023 15:42:11 +0000
Received: by outflank-mailman (input) for mailman id 647141;
 Mon, 04 Dec 2023 15:42:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PiNa=HP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rAB5G-0005zs-Q1
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 15:42:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae8596b1-92bb-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 16:42:08 +0100 (CET)
Received: from [192.168.1.27] (host-79-46-48-173.retail.telecomitalia.it
 [79.46.48.173])
 by support.bugseng.com (Postfix) with ESMTPSA id 385484EE073D;
 Mon,  4 Dec 2023 16:42:08 +0100 (CET)
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
X-Inumbo-ID: ae8596b1-92bb-11ee-9b0f-b553b5be7939
Message-ID: <e349b85b-53b4-4850-a1af-5d99ff7eba82@bugseng.com>
Date: Mon, 4 Dec 2023 16:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/2] x86/p2m: preparation work for
 xenmem_add_to_physmap_one()
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, xen-devel@lists.xenproject.org
References: <cover.1701344917.git.federico.serafini@bugseng.com>
 <aeafaee0fc4a507f6ba0c10e8fed90ed73a6bd6d.1701344917.git.federico.serafini@bugseng.com>
 <43513284-c28a-407b-9567-2f120b2e322f@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <43513284-c28a-407b-9567-2f120b2e322f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/23 15:51, Jan Beulich wrote:
> On 30.11.2023 16:48, Federico Serafini wrote:
>> The objective is to use parameter name "gfn" for
>> xenmem_add_to_physmap_one().
>> Since the name "gfn" is currently used as identifier for a local
>> variable, bad things could happen if new uses of such variable are
>> committed while a renaming patch is waiting for the approval.
>> To avoid such danger, as first thing rename the local variable from
>> "gfn" to "gmfn".
> 
> "..., in line with XENMAPSPACE_gmfn which is the only case it is used
> with."
> 
> This is to justify the name not matching our generally aimed at "gfn"
> and "mfn" scheme.
> 
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

There is an use of "gfn" also few lines outside of the
switch statement, within an if condition where also XENMAPSPACE_gmfn is
involved:
what is true is that "gfn" is used only when space == XENMAPSPACE_gmfn.

What do you think about improve the description by adding:
"..., in line with XENMAPSPACE_gmfn which is the only *space* it is used
with."

However, the description improvement can be done on commit?

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

