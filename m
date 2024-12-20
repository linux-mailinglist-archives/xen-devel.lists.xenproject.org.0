Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ED89F99C9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 19:52:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861945.1273965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOi6V-0008Of-6G; Fri, 20 Dec 2024 18:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861945.1273965; Fri, 20 Dec 2024 18:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOi6V-0008Mp-3m; Fri, 20 Dec 2024 18:52:03 +0000
Received: by outflank-mailman (input) for mailman id 861945;
 Fri, 20 Dec 2024 18:52:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xObb=TN=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tOi6T-0008Mi-EG
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 18:52:01 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da1dad0-bf03-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 19:51:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D8C668287F4B;
 Fri, 20 Dec 2024 12:51:57 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id l37Pon1itDYr; Fri, 20 Dec 2024 12:51:57 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F0B7D8287F7B;
 Fri, 20 Dec 2024 12:51:56 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lN1He4_pV2pG; Fri, 20 Dec 2024 12:51:56 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 29ABB8287F4B;
 Fri, 20 Dec 2024 12:51:56 -0600 (CST)
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
X-Inumbo-ID: 7da1dad0-bf03-11ef-99a3-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com F0B7D8287F7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1734720717; bh=oC83UZQmLWfaSJ1UzK3vR0Kcl/4T8SUXq0jOz1leuRM=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=K2w7LFjZAd/MKLfCdZbqOZU7nkfbbZ54h83Cie1EzNN82t5IoiOyzkWpM52uPBSRP
	 xavArstb54c527yOPW2qozHEPPACX/2ZqPq0xO02q+KldyauZRpctpVll666eBY7zd
	 Yd3qtWcdUMq76mQUG4eIXE7oi5w0hW44v2S6QDGk=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <b4eba262-69fb-43f8-9baf-9b27787930be@raptorengineering.com>
Date: Fri, 20 Dec 2024 12:51:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mm: Update page APIs to use unsigned long flags
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <7e3cd1dc48e30f19f2ac97794e21d1b78bc0c082.1734717055.git.sanastasio@raptorengineering.com>
 <f335aabf-18c2-443c-af52-1b6786c3ee92@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <f335aabf-18c2-443c-af52-1b6786c3ee92@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 12/20/24 12:23 PM, Andrew Cooper wrote:
> On 20/12/2024 5:53 pm, Shawn Anastasio wrote:
>> Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
>> set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
>> represent architecture-dependent page table entry flags. This assumption
>> does not work on PPC/radix where some flags go past 32-bits, so update
>> these APIs to use unsigned long for flags instead.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Funnily enough, the same is true on x86 too.  NX and ProtKey bits are
> from bit 63 downwards.
> 
> x86 funnels all PTE flags through {get,put}_pte_flags() which compresses
> a 64bit PTE's flags (top and bottom 12 bits) into a 24 bit number.
> 
> This was allegedly for the benefit of 32bit builds of Xen with PAE
> paging.  I'm not convinced this claim was backed up evidence, even in
> the 32bit days, because the areas of code working on flags separately
> from a 64bit PTE are minimal.
>
> Nevertheless, it's been 11 years since we dropped x86_32, and it's
> definitely tech debt and unnecessary overhead in x86_64.

Interesting -- I wasn't aware that x86 was running into this issue too,
and that approach to solving it definitely seems a bit dubious from an
overhead standpoint.

> I firmly support making this adjustment.  It's been on my todo list for
> years, but never high enough to get started.
> 
> However, instead of just a plain unsigned long, perhaps we should have a
> concrete type, perhaps pte_attr_t ?
> 
> This lets different architectures handle things differently, and also
> lets us make it TYPE_SAFE() like mfn and friends.
>

I fully agree that introducing a TYPE_SAFE per-arch type for this is the
more robust solution. I went with this approach as it requires the least
invasive changes to other architectures, but if there's sufficient
buy-in from everyone then I think that this would be the better route.

One other consideration with that approach would be the ergonomics of
using the TYPE_SAFE macros for these flags which are often OR'd
together.  I know mfn addresses this by offering mfn_{add,max,min,eq}
helper functions, so introducing similar bitwise helpers for the new
pte_attr_t type could work. typesafe.h could even be expanded to include
macros to generate these helper functions for numeric types to reduce
duplication if you think that'd be reasonable.

> Most importantly though, it makes it less likely that we're going to end
> up with paths that accidentally have some long->int truncation.

In this patch some of those paths are explicitly present, for example
in arm's pt.c. The thinking was that these architectures already
obviously have no issue with 32-bit pte flags, so the truncation won't
cause any issues, but I agree it's not ideal. At the very least, it
presents a potential pitfall if architectures like x86 transition to
using the full 64-bit field in the future.


