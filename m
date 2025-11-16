Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EE9C613DC
	for <lists+xen-devel@lfdr.de>; Sun, 16 Nov 2025 12:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163255.1490438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKbFr-0004lz-J2; Sun, 16 Nov 2025 11:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163255.1490438; Sun, 16 Nov 2025 11:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKbFr-0004is-Fh; Sun, 16 Nov 2025 11:49:15 +0000
Received: by outflank-mailman (input) for mailman id 1163255;
 Sun, 16 Nov 2025 11:49:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vKbFq-0004il-Ib
 for xen-devel@lists.xenproject.org; Sun, 16 Nov 2025 11:49:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKbFp-00A6tD-2p;
 Sun, 16 Nov 2025 11:49:13 +0000
Received: from [2a02:8012:3a1:0:850b:33c3:9f1f:5f9a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKbFp-000cCx-1r;
 Sun, 16 Nov 2025 11:49:13 +0000
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
	bh=xxd443B4sjSFd8oiJhCzyVgbepHscnaS2zOexdHh95E=; b=C2o0g3X51daa2QQfKiK5mNPEr8
	J/iwcZZ/yvmn/zAz5UOoAXop9nwUYFoxxpVQiFna6IxZNdKMlrThwQwVqTQja8QBap8VDS5nNkgBS
	lqY/ln0osAlXgIpCBwIG6NIG9KncPmkbjpYl/EXS4FDx6CgLHxgKaV+9NTxUKi0uzsuc=;
Message-ID: <4085a78a-dbd0-428f-86e9-2606b1acd8e4@xen.org>
Date: Sun, 16 Nov 2025 11:49:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libfdt: Replace hardcoded FDT version numbers with macros
Content-Language: en-GB
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <b449ec7262c4e04c7e82eb50df294991dd9fbe50.1763030084.git.dmytro_prokopchuk1@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b449ec7262c4e04c7e82eb50df294991dd9fbe50.1763030084.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/11/2025 10:36, Dmytro Prokopchuk1 wrote:
> Replace all hardcoded FDT version numbers (such as 16 and 17, or 0x10 and 0x11)
> with the macros FDT_LAST_COMPATIBLE_VERSION and FDT_LAST_SUPPORTED_VERSION
> throughout the Xen device tree and libfdt code.
> 
> This avoids magic numbers and makes the Xen codebase more robust to future FDT
> version changes.
 > > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
>   xen/common/device-tree/device-tree.c |  2 +-
>   xen/common/libfdt/fdt.c              |  8 +++++---
>   xen/common/libfdt/fdt_ro.c           | 13 +++++++------
>   xen/common/libfdt/fdt_rw.c           | 16 ++++++++--------

While I appreciate the goal, libfdt/ is meant to be a verbatim copy of 
the [1]. I would like to keep it like that (backports would be 
acceptable). So if you want to make any change, then it first needs to 
be merged in the upstream repo.

Cheers,

[1] https://github.com/dgibson/dtc/tree/main/libfdt

-- 
Julien Grall


