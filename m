Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7592DAEB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 23:30:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757077.1165823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sResb-0007il-SH; Wed, 10 Jul 2024 21:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757077.1165823; Wed, 10 Jul 2024 21:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sResb-0007fx-P0; Wed, 10 Jul 2024 21:29:37 +0000
Received: by outflank-mailman (input) for mailman id 757077;
 Wed, 10 Jul 2024 21:29:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sResa-0007fo-AV
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 21:29:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sResZ-0003N1-V1; Wed, 10 Jul 2024 21:29:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sResZ-00036l-NE; Wed, 10 Jul 2024 21:29:35 +0000
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
	bh=URCKJMbNc8tqwSY6dr3b3D5Ex7xsRozGtBiHkbSTkPM=; b=rAnxFUEQ4sbk2HcuL+IPm9UeeR
	cJEP/K3q7xlbD7hXBTquuKGdgYMnT35o1oSoTumGKvInEiOMByabTvt8s+ZO01tZJLr/Qohim045b
	SZxKTYSlCGqdZQo8NFMwy2bDAK4q9sFQL/khi640RTDmt05fi4vkF5UzdPW/HbsmHe/g=;
Message-ID: <99ba7e4e-7a0e-4a1b-85c9-5c21f767beda@xen.org>
Date: Wed, 10 Jul 2024 22:29:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] Arm64: amend "xen/arm64: head: Add missing code
 symbol annotations"
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <f7228594-fa64-4fd8-b55b-506d004b73cb@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f7228594-fa64-4fd8-b55b-506d004b73cb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 10/06/2024 14:37, Jan Beulich wrote:
> While the change[1] didn't go in yet, there is the intention for the ELF
> metadata annotations from xen/linkage.h to also effect honoring of
> CONFIG_CC_SPLIT_SECTIONS. In code that's placement / ordering sensitive,
> these annotations therefore need using with some care.

Looking at the code, I think the ordering only really matter for 
'start'. The rest can be ordered in any way within the assembly file. So...

> 
> [1] https://lists.xen.org/archives/html/xen-devel/2024-02/msg00470.html
> 
> Fixes: fba250ae604e ("xen/arm64: head: Add missing code symbol annotations")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> An alternative would be to use LABEL{,_LOCAL}() instead of FUNC{,_LOCAL}().
> That would avoid the need for any override, but would also lose the type
> information. 

... I would suggest to only convert FUNC(start) to LABEL(start).

> Question is whether the annotated ranges really are
> "functions" in whichever wide or narrow sense.

Everything but 'start' are functions.

Cheers,

-- 
Julien Grall

