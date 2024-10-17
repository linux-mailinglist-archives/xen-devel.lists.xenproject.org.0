Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC2C9A2559
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 16:44:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820664.1234205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1RjF-0002uG-TI; Thu, 17 Oct 2024 14:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820664.1234205; Thu, 17 Oct 2024 14:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1RjF-0002rX-QQ; Thu, 17 Oct 2024 14:43:53 +0000
Received: by outflank-mailman (input) for mailman id 820664;
 Thu, 17 Oct 2024 14:43:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1RjE-0002rR-2Y
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 14:43:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1RjD-0004RG-OH; Thu, 17 Oct 2024 14:43:51 +0000
Received: from [15.248.2.232] (helo=[10.24.67.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1RjD-0001PX-GT; Thu, 17 Oct 2024 14:43:51 +0000
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
	bh=goCESiCAIPpr21klwQunsXMu3zzAXDLCliOnXZrx/Io=; b=FrYfdQ6T4O4GFhqFonGyVcghB7
	PwhUJxxT3adaDeotvZkT4gcY2P8c66Nri/hLIqnJ77KziYd+EfAKe8BHgzrkZC14DnPKTGCfq3ZM1
	Dzii8neFCHAH6Oa/plrh4iBcKd0KvL3CXjW+f/DdW1MxvwJjscl38u0BMKN5EnGi/I7A=;
Message-ID: <eccb4aca-8e62-410b-a530-b933f1f96507@xen.org>
Date: Thu, 17 Oct 2024 15:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: dom0less: cope with missing /gic phandle
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241011211957.447290-1-stewart.hildebrand@amd.com>
 <alpine.DEB.2.22.394.2410111428450.471028@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2410111428450.471028@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/10/2024 22:28, Stefano Stabellini wrote:
> On Fri, 11 Oct 2024, Stewart Hildebrand wrote:
>> If a partial DT has a /gic node, but no references to it, dtc may omit
>> the phandle property. With the phandle property missing,
>> fdt_get_phandle() returns 0, leading Xen to generate a malformed domU
>> dtb due to invalid interrupt-parent phandle references. 0 is an invalid
>> phandle value. Add a zero check, and fall back to GUEST_PHANDLE_GIC.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

This is now committed.

Cheers,

-- 
Julien Grall


