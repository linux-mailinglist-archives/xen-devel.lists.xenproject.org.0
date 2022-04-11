Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28D44FB93F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302865.516693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndr7Q-0004Ky-SP; Mon, 11 Apr 2022 10:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302865.516693; Mon, 11 Apr 2022 10:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndr7Q-0004I5-P8; Mon, 11 Apr 2022 10:18:00 +0000
Received: by outflank-mailman (input) for mailman id 302865;
 Mon, 11 Apr 2022 10:17:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndr7P-0004Hr-AQ
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:17:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndr7O-0003Qa-Tx; Mon, 11 Apr 2022 10:17:58 +0000
Received: from [54.239.6.185] (helo=[192.168.17.122])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndr7O-0001nH-O6; Mon, 11 Apr 2022 10:17:58 +0000
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
	bh=RZic369XXvhlfp1WwuJOseUM5biGA0c+lrGuAwVTkdo=; b=Dr5QIiKVeua3HeTT3klJNTv1PZ
	Rih3FDsodVraX82G609cP7jtUtdQVjntZt0srBVREW/gm9g1AXEiQuh1P+v0l9VIBCQdhBimPe2Tv
	00iNcuYMkdJy+eGqQaqxZYRAOBzT8USLN0JOJWQY5l8Ta/sQ1eTBaCmRfSUH2clt66yk=;
Message-ID: <a732b01e-0656-0795-466f-0c2a27b40325@xen.org>
Date: Mon, 11 Apr 2022 11:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v5 2/2] xen: Populate xen.lds.h and make use of its macros
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220411070300.77380-1-michal.orzel@arm.com>
 <20220411070300.77380-3-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220411070300.77380-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 11/04/2022 08:03, Michal Orzel wrote:
> Populate header file xen.lds.h with the first portion of macros storing
> constructs common to x86 and arm linker scripts. Replace the original
> constructs with these helpers.
> 
> No functional improvements to x86 linker script.
> 
> Making use of common macros improves arm linker script with:
> - explicit list of debug sections that otherwise are seen as "orphans"
>    by the linker. This will allow to fix issues after enabling linker
>    option --orphan-handling one day,
> - extended list of discarded section to include: .discard, destructors
>    related sections, .fini_array which can reference .text.exit,
> - sections not related to debugging that are placed by ld.lld. Even
>    though we do not support linking with LLD on Arm, these sections do
>    not cause problem to GNU ld,
> 
> As we are replacing hardcoded boundary specified as an argument to ALIGN
> function with POINTER_ALIGN, this changes the alignment in HYPFS_PARAM
> construct for arm32 from 8 to 4. It is fine as there are no 64bit values
> used in struct param_hypfs.
> 
> Please note that this patch does not aim to perform the full sync up
> between the linker scripts. It creates a base for further work.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

