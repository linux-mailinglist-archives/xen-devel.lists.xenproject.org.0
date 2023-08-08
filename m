Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5813F773886
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 09:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579287.907206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTGpF-0004Ut-L6; Tue, 08 Aug 2023 07:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579287.907206; Tue, 08 Aug 2023 07:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTGpF-0004SK-Hu; Tue, 08 Aug 2023 07:08:17 +0000
Received: by outflank-mailman (input) for mailman id 579287;
 Tue, 08 Aug 2023 07:08:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYul=DZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTGpE-0004SA-7B
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 07:08:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 571023df-35ba-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 09:08:13 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 498924EE0737;
 Tue,  8 Aug 2023 09:08:13 +0200 (CEST)
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
X-Inumbo-ID: 571023df-35ba-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Tue, 08 Aug 2023 09:08:13 +0200
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
Message-ID: <55599ec7a1c6d07af6093920fe3f9125@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2023 11:10, Jan Beulich wrote:
> On 07.08.2023 10:59, Nicola Vetrini wrote:
>> On 07/08/2023 10:09, Jan Beulich wrote:
>>> On 04.08.2023 17:27, Nicola Vetrini wrote:
>>>> The variable declared in the header file
>>>> 'xen/arch/x86/include/asm/e820.h'
>>>> is shadowed by many function parameters, so it is renamed to avoid
>>>> these
>>>> violations.
>>>> 
>>>> No functional changes.
>>>> 
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> ---
>>>> This patch is similar to other renames done on previous patches, and
>>>> the
>>>> preferred strategy there was to rename the global variable. This one
>>>> has more occurrences that are spread in various files, but
>>>> the general pattern is the same.
>>> 
>>> Still I think it would be better done the other way around, and 
>>> perhaps
>>> in
>>> more than a single patch. It looks like "many == 3", i.e.
>>> - e820_add_range(), which is only ever called with "e820" as its
>>> argument,
>>>   and hence the parameter could be dropped,

I see another downside with this approach (I should have spotted this 
sooner):
Since e820_add_range and the other functions expected e820 as a pointer, 
they are
written like this:

for ( i = 0; i < e820->nr_map; ++i )
     {
         uint64_t rs = e820->map[i].addr;
         uint64_t re = rs + e820->map[i].size;

         if ( rs == e && e820->map[i].type == type )
         {
             e820->map[i].addr = s;
             return 1;
         }
...

Dropping the parameter would either mean
1. Use a local parameter that stores the address of e820, which kind of
    nullifies the purpose of dropping the parameter imho;
2. Rewrite it so that it operates on a "struct e820map", which would 
mean
    substantial churn;
3. Make the global a pointer, which is reminiscent of (1)

All in all, I do like the global renaming approach more, because it 
lessens
the amount of code that needs to change to accomodate a case of 
shadowing.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

