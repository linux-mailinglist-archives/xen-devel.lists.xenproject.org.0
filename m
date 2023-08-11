Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F74779709
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 20:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582614.912467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUWol-0003Xr-GI; Fri, 11 Aug 2023 18:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582614.912467; Fri, 11 Aug 2023 18:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUWol-0003WT-DT; Fri, 11 Aug 2023 18:24:59 +0000
Received: by outflank-mailman (input) for mailman id 582614;
 Fri, 11 Aug 2023 18:24:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qUWoj-0003Uz-UF
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 18:24:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUWoj-0002Ng-8g; Fri, 11 Aug 2023 18:24:57 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.207.66]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUWoj-0002OI-2g; Fri, 11 Aug 2023 18:24:57 +0000
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
	bh=9Qd1ZLpmaSPx5tv+iRzbeLvFG6svWuVkCWVYXM3rroI=; b=eZhYyTS+ml0C0/nudbGygQXuXJ
	x0d8MUy56kR5NS8VEm1rwhpJo6uQUDLMHu1WZDVG0lQEpS/YpOnIO8cFn9X8jmZCc9VrN7SeUe3qX
	DSN1LE8UtJ0z1YkfS1JpGWI4E6/llFEkGTRXcpxCkpd4yCX40auNCzfRwrmFi51Q5CYM=;
Message-ID: <12e1067d-8050-4610-8c3b-c3d56a1b026f@xen.org>
Date: Fri, 11 Aug 2023 19:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Fix initrd placeholders generation in
 make_chosen_node()
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230810112544.17365-1-michal.orzel@amd.com>
 <20230810112544.17365-2-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230810112544.17365-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 10/08/2023 12:25, Michal Orzel wrote:
> When booting a dom0less domU without initial ramdisk, it was observed
> that Xen still creates empty linux,initrd-{start,end} properties under
> /chosen node. This is because in make_chosen_node(), generation of initrd
> placeholders (later on filled with the real values) is protected with
> a check for presence of kernel bootmodule (always present) instead of
> initrd bootmodule. Fix it along with renaming the variable from "mod" to
> "initrd" to prevent similar mistakes in the future.
> 
> Fixes: 48f4bf6bdeb4 ("arm/acpi: Create min DT stub for Dom0")

(No change required, just a remark about the tag)

Someone wanting to backport this would need to be cautious. The fix 
would not apply as-is for Xen older than ~4.11 because 'mod' is used to 
fetch the command line as well.

This also means that it would not be correct to simply replace 'mod' 
with 'initrd'. Anyway, for upstream, this would only be backported up to 
4.17 as the other release are either only security supported or not 
supported at all. So this is not a concern for us.

Cheers,

-- 
Julien Grall

