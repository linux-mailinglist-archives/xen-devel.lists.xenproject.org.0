Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59A771CB9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577854.904923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSw5c-0006QU-3V; Mon, 07 Aug 2023 08:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577854.904923; Mon, 07 Aug 2023 08:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSw5c-0006Oo-0Z; Mon, 07 Aug 2023 08:59:48 +0000
Received: by outflank-mailman (input) for mailman id 577854;
 Mon, 07 Aug 2023 08:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qSw5a-0006Oi-Dd
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 08:59:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0d139a1-3500-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 10:59:44 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4FACB4EE0737;
 Mon,  7 Aug 2023 10:59:44 +0200 (CEST)
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
X-Inumbo-ID: c0d139a1-3500-11ee-b27d-6b7b168915f2
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 10:59:44 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/6] x86: rename variable 'e820' to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com>
 <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <838a53b9ef4a8d258feceabb4c811534@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2023 10:09, Jan Beulich wrote:
> On 04.08.2023 17:27, Nicola Vetrini wrote:
>> The variable declared in the header file 
>> 'xen/arch/x86/include/asm/e820.h'
>> is shadowed by many function parameters, so it is renamed to avoid 
>> these
>> violations.
>> 
>> No functional changes.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> This patch is similar to other renames done on previous patches, and 
>> the
>> preferred strategy there was to rename the global variable. This one
>> has more occurrences that are spread in various files, but
>> the general pattern is the same.
> 
> Still I think it would be better done the other way around, and perhaps 
> in
> more than a single patch. It looks like "many == 3", i.e.
> - e820_add_range(), which is only ever called with "e820" as its 
> argument,
>   and hence the parameter could be dropped,
> - e820_change_range_type(), which is in the same situation, and
> - reserve_e820_ram(), which wants its parameter renamed.
> Alternatively, if we really were to change the name of the global, we'd
> want to take a more complete approach: Right now we have e820_raw[],
> boot_e820[], and e820[]. We'd want them to follow a uniform naming 
> scheme
> then (e820_ first or _e820 last), with the other part of the name 
> suitably
> describing the purpose (which "map" doesn't do).
> 
> Jan

Besides the one you listed, there are these other occurrences:
- xen/arch/x86/mm.c:4678 in 'arch_memory_op' as local variable 'struct 
e820entry'
- xen/arch/x86/include/asm/guest/hypervisor.h:55 in 
'hypervisor_e820_fixup'
- xen/arch/x86/include/asm/pv/shim.h:88 in 'pv_shim_fixup'
- xen/arch/x86/setup.c:689 in 'kexec_reserve_area'

We can take the first approach you suggested (which was my original 
attempt, but then upon feedback on other
patches I reworked this patch before submitting). My doubt about it was 
that it would introduce a naming
inconsistency with other e820-related objects/types. Anyway, if e820_map 
is not a good name, could e820_arr be it?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

