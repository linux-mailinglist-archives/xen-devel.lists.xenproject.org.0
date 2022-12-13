Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2464BE4E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 22:22:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461190.719245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5CjT-0000im-Fg; Tue, 13 Dec 2022 21:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461190.719245; Tue, 13 Dec 2022 21:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5CjT-0000fq-CY; Tue, 13 Dec 2022 21:22:35 +0000
Received: by outflank-mailman (input) for mailman id 461190;
 Tue, 13 Dec 2022 21:22:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5CjS-0000fg-HN
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 21:22:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5CjS-0003lO-53; Tue, 13 Dec 2022 21:22:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5CjR-0000p5-UW; Tue, 13 Dec 2022 21:22:34 +0000
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
	bh=25WgTk7TUdam7O/dffDJLrpoKcOfiFMVV7PrcQdZ7SI=; b=gbs6QEQlD72YYjeaAXey5YzCld
	Wad9+FacyGx+pmcgMjIRg/+FajuYXqbaB0N7kFPidWJXYHIu8aQYe7sZjzDawf7iCpxL8Vj2Yr6ym
	XAhxTKG2ncQAs81ZvqtheGq0L34HhP7vyI9FvhZTrb8GcViF3E3UPb6RADP7xjMwQ+SQ=;
Message-ID: <b1206296-dda6-fa2f-b143-c2611bca4d43@xen.org>
Date: Tue, 13 Dec 2022 21:22:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v5 09/11] xen/Arm: GICv3: Define remaining GIC registers for
 AArch32
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
 <20221205132637.26775-10-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221205132637.26775-10-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/12/2022 13:26, Ayan Kumar Halder wrote:
> Define missing assembly aliases for GIC registers on arm32, taking the ones
> defined already for arm64 as a base. Aliases are defined according to the
> GIC Architecture Specification ARM IHI 0069H.
> 
> Defined the following registers:-
> 1. Interrupt Controller Interrupt Priority Mask Register
> 2. Interrupt Controller System Register Enable register
> 3. Interrupt Controller Deactivate Interrupt Register
> 4. Interrupt Controller End Of Interrupt Register 1
> 5. Interrupt Controller Interrupt Acknowledge Register 1
> 6. Interrupt Controller Binary Point Register 1
> 7. Interrupt Controller Control Register
> 8. Interrupt Controller Interrupt Group 1 Enable register
> 9. Interrupt Controller Maintenance Interrupt State Register
> 10. Interrupt Controller End of Interrupt Status Register
> 11. Interrupt Controller Empty List Register Status Register
> 12. Interrupt Controller Virtual Machine Control Register
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

