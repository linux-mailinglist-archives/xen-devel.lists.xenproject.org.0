Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900EA33331
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 00:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886922.1296511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiLr2-00086H-5T; Wed, 12 Feb 2025 23:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886922.1296511; Wed, 12 Feb 2025 23:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiLr2-00084U-2I; Wed, 12 Feb 2025 23:09:16 +0000
Received: by outflank-mailman (input) for mailman id 886922;
 Wed, 12 Feb 2025 23:09:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tiLr0-00084M-AI
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 23:09:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tiLqz-00FBWn-3B;
 Wed, 12 Feb 2025 23:09:13 +0000
Received: from [2a02:8012:3a1:0:4060:8ed:ba21:1efd]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tiLqz-009EgL-1c;
 Wed, 12 Feb 2025 23:09:13 +0000
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
	bh=T6k+itjd3WCgdoyTPBhLlSDvGrWuv4RYMTQy7EX0TIs=; b=SzhZsHVFPuMnigLRnNvDZN6LAT
	yLoUDyXnCEGGV2OJJ9j9vSSbdrnZRCLk8bFclxzdBkl1YAqSPxt3bzCp8NF5f3K3ssJCINMimpOfA
	jNBm/oAkhV7NSRm47VD4bmEEsLbdO6lYq+1bKDWxvr5j4EcZ7VWiD70+mhm7IPlU5I+I=;
Message-ID: <7e224bff-8f94-437c-bd4c-c72f7fc68d22@xen.org>
Date: Wed, 12 Feb 2025 23:09:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] dom0less vcpu affinity bindings
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xenia.Ragiadakou@amd.com,
 dpsmith@apertussolutions.com
References: <alpine.DEB.2.22.394.2502101746240.619090@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2502101746240.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 11/02/2025 01:56, Stefano Stabellini wrote:
> We have received requests to introduce Dom0less vCPU affinity bindings
> to allow configuring which pCPUs a given vCPU is allowed to run on.
> 
> After considering different approaches, I am thinking of using the
> following binding format:
> 
>      vcpu0 {
>             compatible = "xen,vcpu-affinity"; // compatible string
>             id = <0>;  // vcpu id
>             hard-affinity = "1,4-7"; // pcpu ranges

This would be CPU logical ID, right? This is a value assigned by Xen 
based on how pCPU are brought up. So in theory it could change between 
Xen version as the order is not guaranteed. I know this is what the 
toolstack is currently using.

However, as we define a new binding, I wonder whether it would be better 
to instead have a phandle to the CPU device-tree node or just plain 
MPIDRs? This would guarantee that the vCPU will always land on a given 
pCPU (this could be important when taking into account the cache topology).

Cheers,

-- 
Julien Grall


