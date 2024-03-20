Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC9788170C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 19:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696088.1086709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn0Hc-0005mC-MK; Wed, 20 Mar 2024 18:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696088.1086709; Wed, 20 Mar 2024 18:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn0Hc-0005jr-J2; Wed, 20 Mar 2024 18:03:24 +0000
Received: by outflank-mailman (input) for mailman id 696088;
 Wed, 20 Mar 2024 18:03:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Jnl=K2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rn0Hb-0005jl-4o
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 18:03:23 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22c0c8b6-e6e4-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 19:03:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1790782854B3;
 Wed, 20 Mar 2024 13:03:20 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id iGIJomhWCXi6; Wed, 20 Mar 2024 13:03:19 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 330FD82856C4;
 Wed, 20 Mar 2024 13:03:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bzzdeW9PvU1Q; Wed, 20 Mar 2024 13:03:19 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D6DBB82854B3;
 Wed, 20 Mar 2024 13:03:18 -0500 (CDT)
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
X-Inumbo-ID: 22c0c8b6-e6e4-11ee-afdd-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 330FD82856C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710957799; bh=KcSvGIaamdfvQf1F2LYHVibTUa2X0uPCe4IZx+pdkU4=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=gYxiZkLizET5lbPcoqycHaSatrqS8hALYnmjSz1l/MwUEFWY6hKaI3xfsQUaOTU0T
	 5MVq7TYK1tKDiNQ5E8Z/nRX8UcnVEgKcX+NgTUSlECJK14jCAFrlwZqzqVoHCgD7Vx
	 ozwrfNE2cuWnr2CjAQ0z4mnXLPYnepc3XdIkOTsI=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <2e51fe7e-1434-445a-8920-884152df4d37@raptorengineering.com>
Date: Wed, 20 Mar 2024 13:03:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] xen/ppc: mm-radix: Allocate all paging structures
 at runtime
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <00f22a6a08451614179219fd430539fbb1e6e8cf.1710443965.git.sanastasio@raptorengineering.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <00f22a6a08451614179219fd430539fbb1e6e8cf.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/14/24 5:15 PM, Shawn Anastasio wrote:
> In the initial mm-radix implementation, the in-memory partition and
> process tables required to configure the MMU, as well as the page tables
> themselves were all allocated statically since the boot allocator was
> not yet available.
> 
> Now that it is, allocate these structures at runtime and bump the size
> of the Process Table to its maximum supported value (on POWER9).

After some additional testing, I realized that it is necessary to clear
the memory allocated for these structures before using it, so a small
follow-up is necessary. I will include this with v4 if it is necessary.

diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index edae41e0be..f425185259 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -37,6 +37,8 @@ static mfn_t __initdata max_alloc_mfn = {0};
  * minimum mfns that have been allocated. This information is used by
  * setup_initial_mapping to include the allocated pages in the initial
  * page mapping.
+ *
+ * Additionally, allocated pages are zeroed before return.
  */
 static mfn_t __init initial_page_alloc(unsigned long nr_pfns,
                                        unsigned long pfn_align)
@@ -49,6 +51,8 @@ static mfn_t __init initial_page_alloc(unsigned long
nr_pfns,
     min_alloc_mfn = _mfn(min(mfn_x(min_alloc_mfn), mfn_x(mfn_first)));
     max_alloc_mfn = _mfn(max(mfn_x(max_alloc_mfn), mfn_x(mfn_last)));

+    memset(__va(mfn_to_maddr(mfn_first)), 0, nr_pfns << PAGE_SHIFT);
+
     return mfn_first;
 }

