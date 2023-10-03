Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403507B61EF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 09:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611913.951713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZOi-0007hy-8W; Tue, 03 Oct 2023 07:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611913.951713; Tue, 03 Oct 2023 07:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZOi-0007fJ-5w; Tue, 03 Oct 2023 07:00:48 +0000
Received: by outflank-mailman (input) for mailman id 611913;
 Tue, 03 Oct 2023 07:00:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g4lE=FR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qnZOg-0007fD-QI
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 07:00:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92c8bd04-61ba-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 09:00:45 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A05994EE0737;
 Tue,  3 Oct 2023 09:00:44 +0200 (CEST)
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
X-Inumbo-ID: 92c8bd04-61ba-11ee-98d2-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 03 Oct 2023 09:00:44 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Henry.Wang@arm.com, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 4/7] x86/grant: switch included header to make
 declarations visible
In-Reply-To: <alpine.DEB.2.22.394.2310021541230.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com>
 <ec3179df569d3e2b392360539bddfb3adc726a5e.1696232393.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310021541230.2348112@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <7dcb6b040d0fab33553dac18e9080465@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2023 00:42, Stefano Stabellini wrote:
> On Mon, 2 Oct 2023, Nicola Vetrini wrote:
>> The declarations for {create,replace}_grant_p2m_mapping are
>> not visible when these functions are defined, therefore the right
>> header needs to be included to allow them to be visible.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/arch/x86/hvm/grant_table.c             | 3 +--
>>  xen/arch/x86/include/asm/hvm/grant_table.h | 2 ++
>>  2 files changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/xen/arch/x86/hvm/grant_table.c 
>> b/xen/arch/x86/hvm/grant_table.c
>> index 30d51d54a949..afe449d8882c 100644
>> --- a/xen/arch/x86/hvm/grant_table.c
>> +++ b/xen/arch/x86/hvm/grant_table.c
>> @@ -9,8 +9,7 @@
>> 
>>  #include <xen/types.h>
>> 
>> -#include <public/grant_table.h>
>> -
>> +#include <asm/hvm/grant_table.h>
>>  #include <asm/p2m.h>
> 
> This makes sense...
> 
> 
>>  int create_grant_p2m_mapping(uint64_t addr, mfn_t frame,
>> diff --git a/xen/arch/x86/include/asm/hvm/grant_table.h 
>> b/xen/arch/x86/include/asm/hvm/grant_table.h
>> index 33c1da1a25f3..576aeb50adf4 100644
>> --- a/xen/arch/x86/include/asm/hvm/grant_table.h
>> +++ b/xen/arch/x86/include/asm/hvm/grant_table.h
>> @@ -10,6 +10,8 @@
>>  #ifndef __X86_HVM_GRANT_TABLE_H__
>>  #define __X86_HVM_GRANT_TABLE_H__
>> 
>> +#include <asm/paging.h>
> 
> ... but I don't understand this one. It doesn't look like
> asm/hvm/grant_table.h actually needs asm/paging.h ? Maybe it should be
> included in xen/arch/x86/hvm/grant_table.c instead ?
> 
> 
>>  #ifdef CONFIG_HVM
>> 
>>  int create_grant_p2m_mapping(uint64_t addr, mfn_t frame,
>> --
>> 2.34.1
>> 

See this thread [1] for more context. There was no response, so I went 
for the route that
made more sense to me. I guess you could say that only <xen/mm-frame.h> 
is actually needed
to get a definition of mfn_t, but I put <asm/paging.h> as in the 
<asm/grant_table.h> header.

[1] 
https://lore.kernel.org/xen-devel/a4b6710b66ed05292388ac6882b940ec@bugseng.com/

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

