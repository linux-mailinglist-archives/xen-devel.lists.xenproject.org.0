Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C466498B80E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 11:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807867.1219569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYw3-0005OG-AE; Tue, 01 Oct 2024 09:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807867.1219569; Tue, 01 Oct 2024 09:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYw3-0005ML-7X; Tue, 01 Oct 2024 09:12:47 +0000
Received: by outflank-mailman (input) for mailman id 807867;
 Tue, 01 Oct 2024 09:12:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1svYw2-0005MF-0h
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 09:12:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svYw1-00075v-BX; Tue, 01 Oct 2024 09:12:45 +0000
Received: from [15.248.2.236] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svYw1-0003qj-2K; Tue, 01 Oct 2024 09:12:45 +0000
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
	bh=csZCI8Gq00QAqNb7SpGmQwLVhp4ks4e97yTsLBvxtZI=; b=wY+JKVlkQS+6B+njQAk6qs5H28
	29bRrSJF9sB39Y8QSeKO7mdC5dGs8skg74/IjXTr7vHeOxS50gAxjhE+Ydu63Vgz+tiFGUm6GX5Z4
	IpkAuspp/jLiPebA2ESbTJVIPM8muHkJ0e/hgfkannffh0+7DNip27+KS2PC/U69NLt8=;
Message-ID: <40a44ce9-6804-4380-a660-abf5276e7790@xen.org>
Date: Tue, 1 Oct 2024 10:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] types: replace remaining uses of s64
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <ab2d325e-0d91-4308-b4d1-06314ad5ba0c@suse.com>
 <a6126dc2-a10f-4a90-9d2f-80f6f32f1386@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a6126dc2-a10f-4a90-9d2f-80f6f32f1386@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/09/2024 13:20, Jan Beulich wrote:
> ... and move the type itself to linux-compat.h.
> 
> While doing so
> - correct the type of union uu's uq field in lib/divmod.c,
> - switch a few adjacent types as well, for (a little bit of)
>    consistency.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Split off ubsan.[ch] adjustments. Re-base.
> 
> --- a/xen/arch/arm/arm64/cpufeature.c
> +++ b/xen/arch/arm/arm64/cpufeature.c

This file is meant to follow the Linux coding style so it is easier to 
re-sync. Therefore I think we want to keep s64/u64 and include 
linux-compat.h.

Cheers,

-- 
Julien Grall


