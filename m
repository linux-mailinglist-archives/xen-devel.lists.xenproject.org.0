Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B90882E040
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 19:52:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667548.1038923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPS3V-0006YJ-2k; Mon, 15 Jan 2024 18:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667548.1038923; Mon, 15 Jan 2024 18:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPS3U-0006Vi-Ve; Mon, 15 Jan 2024 18:51:28 +0000
Received: by outflank-mailman (input) for mailman id 667548;
 Mon, 15 Jan 2024 18:51:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rPS3T-0006Vc-St
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 18:51:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPS3T-0001iy-ET; Mon, 15 Jan 2024 18:51:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPS3T-0008Rj-98; Mon, 15 Jan 2024 18:51:27 +0000
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
	bh=RhvMhAZQ58TeT9cB54zWCxVx3eCTFyFoaQp4xr4dzqo=; b=y4ip/buhoZOADk9G9w45BgTVnE
	IoDZzjRpqWaiWAf9venT0lzZc52OMjIBIK5wxwFe2x5D60v8tg8lkRrYdn08YVSEs9d1piSVQOr3s
	TpZ7b23hHBTveGENMWGqabqiAoJeMz6GFlle3RMju5AaUjpn+mQ7dk4Q39m7STkaoEK8=;
Message-ID: <204abd64-7d16-43f8-acb2-55e84a37a510@xen.org>
Date: Mon, 15 Jan 2024 18:51:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm32: head: Move earlyprintk 'hex' to
 .rodata.idmap
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240115124859.89218-1-michal.orzel@amd.com>
 <20240115124859.89218-2-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240115124859.89218-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 15/01/2024 12:48, Michal Orzel wrote:
> Thanks to 1ec3fe1f664f ("xen/arm32: head: Improve logging in head.S"),
> we can now use PRINT_ID() macro to print messages when running on
> identity mapping. For that, all the strings need to be part of the first
> page that is mapped. This is not the case for a 'hex' string (used by
> asm_putn when printing register values), which currently resides in
> .rodata.str. Move it to .rodata.idmap to allow making use of print_reg
> macro from anywhere (mostly to aid debugging).
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

