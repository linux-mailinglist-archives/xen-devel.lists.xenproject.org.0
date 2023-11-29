Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB49F7FD726
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 13:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643903.1004456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8K3D-00073E-7M; Wed, 29 Nov 2023 12:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643903.1004456; Wed, 29 Nov 2023 12:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8K3D-00071Z-3r; Wed, 29 Nov 2023 12:52:23 +0000
Received: by outflank-mailman (input) for mailman id 643903;
 Wed, 29 Nov 2023 12:52:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1bx=HK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r8K3B-00071O-Jw
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 12:52:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21851732-8eb6-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 13:52:19 +0100 (CET)
Received: from [192.168.1.15] (host-82-59-158-146.retail.telecomitalia.it
 [82.59.158.146])
 by support.bugseng.com (Postfix) with ESMTPSA id B37C64EE0737;
 Wed, 29 Nov 2023 13:52:18 +0100 (CET)
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
X-Inumbo-ID: 21851732-8eb6-11ee-9b0e-b553b5be7939
Message-ID: <33fba2a1-d8cb-4978-a193-b1c6a1e7a551@bugseng.com>
Date: Wed, 29 Nov 2023 13:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/guest_walk: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <e0422c0127ebb402bb4f593d41571caf36b0864b.1701164432.git.federico.serafini@bugseng.com>
 <320b5d4c-73c0-45de-92d5-953bcae59e4a@suse.com>
 <4f09cc01-3975-4c2f-960f-67f3ac1f53a4@citrix.com>
 <74748681-dca2-437a-a438-f0a6294ea8e4@suse.com>
 <a1b56fe2-b19d-4ecf-ae10-df7f3d911e47@bugseng.com>
 <b418a851-35ee-4df8-b4b6-a37bea415b03@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <b418a851-35ee-4df8-b4b6-a37bea415b03@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/23 12:09, Jan Beulich wrote:
> On 29.11.2023 10:35, Federico Serafini wrote:
>> I take this opportunity to inform that we are really close to the end
>> with Rule 8.3 for x86, this is the situation:
>> - do_multicall(), Stefano sent a patch;
>> - guest_walk_tables(), Andrew will take care of it;
>> - xenmem_add_to_physmap_one(), this is the last one.
>>
>> For the latter, I see you (x86) share the declaration with ARM,
>> where "gfn" is used for the last parameter instead of "gpfn".
>> Do you agree in changing the name in the definition from "gpfn"
>> to "gfn"?
> 
> Yes.
> 
>> If you agree, do you have any suggestions on how to rename
>> the local variable "gfn"?
> 
> Considering its exclusive use for the XENMAPSPACE_gmfn case, I'm inclined
> to suggest "gmfn", despite this being a term we generally try to get rid
> of. Maybe Andrew or Roger have a better suggestion.
> 
> Along with renaming "gpfn" it would be nice (for consistency) to also
> rename "old_gpfn" at the same time.

Thank you.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

