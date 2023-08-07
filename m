Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 060CF7720D7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578094.905449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyEz-0005q1-QQ; Mon, 07 Aug 2023 11:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578094.905449; Mon, 07 Aug 2023 11:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyEz-0005fZ-77; Mon, 07 Aug 2023 11:17:37 +0000
Received: by outflank-mailman (input) for mailman id 578094;
 Mon, 07 Aug 2023 11:17:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qSy9q-0002Ee-4k
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:12:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44c6a4fd-3513-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 13:12:17 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 9C0FD4EE0737;
 Mon,  7 Aug 2023 13:12:16 +0200 (CEST)
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
X-Inumbo-ID: 44c6a4fd-3513-11ee-b27d-6b7b168915f2
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 13:12:16 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/6] x86: rename variable 'e820' to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <742f4a4a-5938-82f5-7e76-1189a2519063@suse.com>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com>
 <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com>
 <838a53b9ef4a8d258feceabb4c811534@bugseng.com>
 <742f4a4a-5938-82f5-7e76-1189a2519063@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <871a501fb76cff724ed1c2b09277e2a3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>> Besides the one you listed, there are these other occurrences:
>> - xen/arch/x86/mm.c:4678 in 'arch_memory_op' as local variable 'struct
>> e820entry'
> 
> This probably wants renaming; my suggestion would be just "e" here.

Ok

> 
>> - xen/arch/x86/include/asm/guest/hypervisor.h:55 in
>> 'hypervisor_e820_fixup'
>> - xen/arch/x86/include/asm/pv/shim.h:88 in 'pv_shim_fixup'
> 
> These can likely again have their parameters dropped, for it only
> ever being the "e820" global which is passed. (Really I think in such
> cases the names being the same should be permitted.)
> 
>> - xen/arch/x86/setup.c:689 in 'kexec_reserve_area'
> 
> This surely can quite sensibly have boot_e820 use moved into the
> function itself.
> 

Ok, although your suggestion of breaking these renames/deletions in more 
than one patch may not be applicable,
as 'kexec_reserve_area' calls 'reserve_e820_ram', which in turn calls 
'e820_change_range_type'.
Similarly, the call stack containing 'e820_add_range' includes other 
calls to the modified functions, so
effectively it's best to drop the parameter everywhere all at once to 
prevent accidental mistakes.

>> We can take the first approach you suggested (which was my original
>> attempt, but then upon feedback on other
>> patches I reworked this patch before submitting). My doubt about it 
>> was
>> that it would introduce a naming
>> inconsistency with other e820-related objects/types. Anyway, if 
>> e820_map
>> is not a good name, could e820_arr be it?
> 
> But how does "arr" describe the purpose? I would have suggested a name,
> but none I can think of (e820_real, e820_final) I'd be really happy 
> with.
> Just e820 is pretty likely the best name we can have here.
> 

Ok, so perhaps the best way is using the strategy above, although I'm 
curious why in other places this
was not the preferred alternative (as the global may be dropped or the 
callers may use a e820map other
than the global one, but here I recognize my lack of knowledge on the 
internals of Xen).

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

