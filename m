Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86135CAD5B6
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:59:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180688.1503835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbli-0008BB-0h; Mon, 08 Dec 2025 13:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180688.1503835; Mon, 08 Dec 2025 13:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSblh-000897-U3; Mon, 08 Dec 2025 13:59:13 +0000
Received: by outflank-mailman (input) for mailman id 1180688;
 Mon, 08 Dec 2025 13:59:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vSblg-00088x-NB
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:59:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vSblf-0005fq-2x;
 Mon, 08 Dec 2025 13:59:12 +0000
Received: from [2a02:8012:3a1:0:55c6:6c20:a76e:cc19]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vSblg-005Qx2-02;
 Mon, 08 Dec 2025 13:59:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=q/gSLT5W0HlftcxYBIBbJXKMODHmxNE5EDQl/nus84U=; b=NJDKoXM/J8l6hlbivxITLle4UH
	W6UqNerhPTIYVpD5pQMs7WFsh6tjEFOotTSvf7VzE4GR6kB0QsbB9krgtXAd8ikzcW9nUDGNtZID0
	l14/gQ4VSbvOgRRYSbSw1ji/7I1BEsAYsZ/vMIOVW/d9cz55ykCooCryXOXE2lbHdhtM=;
Message-ID: <f7ea4b88-6f15-4608-9918-227bf9c82e3b@xen.org>
Date: Mon, 8 Dec 2025 13:59:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] symbols/arm: don't use symbols-dummy
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <f89a3d20-8194-4dc2-a38b-8788c070cd90@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <f89a3d20-8194-4dc2-a38b-8788c070cd90@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/11/2025 13:42, Jan Beulich wrote:
> In particular when linking with lld, which converts hidden symbols to
> local ones, the ELF symbol table can change in unhelpful ways between the
> first two linking passes, resulting in the .rodata contributions to change
> between the 2nd and 3rd pass. That, however, renders our embedded symbol
> table pretty much unusable; the recently introduced self-test may then
> also fail. (Another difference between compiling a C file and assembling
> the generated ones is that - with -fdata-sections in use - the .rodata
> contributions move between passes 1 and 2, when we'd prefer them not to.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


