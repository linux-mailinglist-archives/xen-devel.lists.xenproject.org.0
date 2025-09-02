Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D60B3FEA3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 13:54:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106171.1456920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utPa2-0000PB-OB; Tue, 02 Sep 2025 11:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106171.1456920; Tue, 02 Sep 2025 11:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utPa2-0000Nd-LW; Tue, 02 Sep 2025 11:53:42 +0000
Received: by outflank-mailman (input) for mailman id 1106171;
 Tue, 02 Sep 2025 11:53:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1utPa1-0000NX-Lg
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 11:53:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utPa0-002rup-3D;
 Tue, 02 Sep 2025 11:53:41 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utPa0-00D3Sm-34;
 Tue, 02 Sep 2025 11:53:41 +0000
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
	bh=0Zyq2pGGRUwcN7gtUS3MHMga2TViRRCdqDexNWRucnk=; b=I56VAH524DZzPrl6HImyxGxw81
	WfOaSYo9RLqNlNMQRuyqC9SidPCTDatZHOesh1ZPznhEMki5NaBEsSvuMfdu8krqAhuTBUrhfVcEi
	tiGui4dCncbjL3LRQ8QaP5Gq4C/CgVOq5ajYVIAxoVuS+GscLZLkCShxdn02y6opo3LI=;
Message-ID: <a8366d24-c69f-475a-9f98-a2219f281a49@xen.org>
Date: Tue, 2 Sep 2025 12:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: dm: Drop XEN_DMOP_get_ioreq_server_info from
 supported
Content-Language: en-GB
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250902094931.1733774-1-oleksandr_tyshchenko@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250902094931.1733774-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/09/2025 10:49, Oleksandr Tyshchenko wrote:
> The said sub-op is not supported on Arm, since it:
>   - does not support the buffered emulation (so bufioreq_port/bufioreq_gfn
>     cannot be returned), please refer to ioreq_server_create()

Yet. I can see use in the future to optimize some emulation (e.g. virtio 
notification).

To be honest, I don't quite see the benefit of removing this code as 
most of it is mainly generic.

Cheers,

-- 
Julien Grall


