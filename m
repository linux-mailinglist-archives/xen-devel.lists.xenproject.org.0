Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4F2B02A70
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jul 2025 12:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041790.1412376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXXj-0007cI-1N; Sat, 12 Jul 2025 10:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041790.1412376; Sat, 12 Jul 2025 10:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXXi-0007a2-UP; Sat, 12 Jul 2025 10:33:18 +0000
Received: by outflank-mailman (input) for mailman id 1041790;
 Sat, 12 Jul 2025 10:33:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uaXXh-0007Zt-6B
 for xen-devel@lists.xenproject.org; Sat, 12 Jul 2025 10:33:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXXe-00Dmyn-2g;
 Sat, 12 Jul 2025 10:33:14 +0000
Received: from [2a02:8012:3a1:0:700f:1c87:7a7d:6616]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXXe-000sAJ-29;
 Sat, 12 Jul 2025 10:33:14 +0000
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
	bh=Y7wx5NgJhgVbCkFIhjURvndbL0HvzY/xzBnogMzKuPg=; b=OvXTw2NQaXAz3kXNVHzJvlX0xz
	S5vWy29MtLSFC1UwQ1evbV4FkgxGVXbT6K98uGR4JFsVVlb+Rt2ICsXDX6aggTPYTCle8KZ+2lpJq
	HuhpPt6xJM3RjeMtI8cTy/I7h/uzOkrWlzL1qNaDrk8cofLkmtmoYe6dqb2vvusi3xFQ=;
Message-ID: <c4cd738f-377e-45bd-898b-99aed4a695a0@xen.org>
Date: Sat, 12 Jul 2025 11:33:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Enhance IPMMU-VMSA driver robustness and debug
 output
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Jahan Murudi <jahan.murudi.zg@renesas.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250620103123.2174529-1-jahan.murudi.zg@renesas.com>
 <445c5594-a003-4cd8-aa46-8544c0543b1c@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <445c5594-a003-4cd8-aa46-8544c0543b1c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/06/2025 08:25, Orzel, Michal wrote:
> 
> 
> On 20/06/2025 12:31, Jahan Murudi wrote:
>> - Fix typo in source comment ("you can found" -> "which can be found").
>> - Add dsb(sy) after IMCTR write to ensure flush is complete before polling.
>> - Add dev_info() log in ipmmu_device_reset() to indicate the number of disabled contexts.
>>
>> These changes improve memory operation ordering, code readability, and runtime traceability
>> for IPMMU on R-Car Gen3/Gen4 SoCs
>>
>> Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
> Acked-by: Michal Orzel <michal.orzel@amd.com>

This is now committed.

Cheers,

-- 
Julien Grall


