Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EEB772552
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578407.905893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT08S-0004GA-RY; Mon, 07 Aug 2023 13:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578407.905893; Mon, 07 Aug 2023 13:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT08S-0004EV-Og; Mon, 07 Aug 2023 13:19:00 +0000
Received: by outflank-mailman (input) for mailman id 578407;
 Mon, 07 Aug 2023 13:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qT08R-0003YZ-8Y
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:18:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7903bb7-3524-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 15:18:58 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 169184EE0737;
 Mon,  7 Aug 2023 15:18:58 +0200 (CEST)
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
X-Inumbo-ID: f7903bb7-3524-11ee-b280-6b7b168915f2
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 15:18:58 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 4/4] x86/setup: address MISRA C:2012 Rule 5.3
In-Reply-To: <55099faa-206a-b7ae-8ef1-64d1dc344c4c@suse.com>
References: <cover.1691135862.git.nicola.vetrini@bugseng.com>
 <484a88bb35cdb6e5ec036d40fb2b4e20678fd975.1691135862.git.nicola.vetrini@bugseng.com>
 <55099faa-206a-b7ae-8ef1-64d1dc344c4c@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <f7d676d32355788620bda00a60be5258@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2023 15:05, Jan Beulich wrote:
> On 04.08.2023 10:03, Nicola Vetrini wrote:
>> The parameters renamed in the function declaration caused shadowing
>> with the homonymous variable in 'xen/common/efi/boot.c'. Renaming
>> them also addresses Rule 8.3:
>> "All declarations of an object or function shall use the same names
>> and type qualifiers".
> 
> Can you explain to me how shadowing can happen in a declaration? I
> would focus on 8.3 here, and only mention the other name collision.

There's "static struct file __initdata kernel;" in 
xen/common/efi/boot.c, which
is visible when the function is declared. Since renaming these parameter 
names would
have been addressed by Federico for R8.3 anyway, my intention was to 
address them both.

> 
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1577,8 +1577,7 @@ void __init noreturn __start_xen(unsigned long 
>> mbi_p)
>>          s = map_s;
>>          if ( s < map_e )
>>          {
>> -            uint64_t mask = (1UL << L2_PAGETABLE_SHIFT) - 1;
>> -
>> +            mask = (1UL << L2_PAGETABLE_SHIFT) - 1;
>>              map_s = (s + mask) & ~mask;
>>              map_e &= ~mask;
>>              init_boot_pages(map_s, map_e);
> 
> Re-using the outer scope variable is a little risky, don't you agree?
> It just so happens that below here there's no further use requiring
> the earlier value (PAGE_SIZE - 1). This isn't to say I'm opposed, but
> it certainly needs evaluating with this in mind (mentioning of which
> in the description would have demonstrated that you did consider this
> aspect).
> 
> Jan

I guess I should have mentioned it

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

