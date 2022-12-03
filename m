Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEC7641867
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 19:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452723.710505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1X1z-0000ub-H7; Sat, 03 Dec 2022 18:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452723.710505; Sat, 03 Dec 2022 18:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1X1z-0000r9-Db; Sat, 03 Dec 2022 18:14:31 +0000
Received: by outflank-mailman (input) for mailman id 452723;
 Sat, 03 Dec 2022 18:14:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1X1x-0000r1-JK
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 18:14:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1X1x-0008Pc-7T; Sat, 03 Dec 2022 18:14:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1X1x-0005VZ-1q; Sat, 03 Dec 2022 18:14:29 +0000
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
	bh=i15Apg9baLRmJwv7RIXfph8fJFXfXoc3ZnaKlTU73M4=; b=pAC+fzDXnx2NFECcWKnUMIWc24
	yepY4Y0CLnfC1vP8LO9wLcvum81RFZRILA0rhnH70OUvQYU7U8vz2Ex/J/rDcOS/eN59oq+PI7JRl
	HqwkzUl+HJCN+GyQJP+b0pqttO5pifeAZ/zeVwWclOeYk+r8Q04hdi2HYarnT2wLkrvY=;
Message-ID: <3ecfc563-6c8e-28a9-1d84-729fa18830d3@xen.org>
Date: Sat, 3 Dec 2022 18:14:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [XEN v4 02/11] xen/Arm: GICv3: Do not calculate affinity level 3
 for AArch32
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
 <20221128155649.31386-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221128155649.31386-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/11/2022 15:56, Ayan Kumar Halder wrote:
> Refer ARM DDI 0487I.a ID081822, G8-9817, G8.2.169
> Affinity level 3 is not present in AArch32.
> Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106,
> Affinity level 3 is not present in Armv7 (ie arm32).
> Thus, any access to affinity level 3 needs to be guarded within
> "ifdef CONFIG_ARM_64".
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

