Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3D9A7272D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 00:42:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928309.1331034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txaNc-0005Ii-Jn; Wed, 26 Mar 2025 23:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928309.1331034; Wed, 26 Mar 2025 23:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txaNc-0005FZ-Gk; Wed, 26 Mar 2025 23:41:52 +0000
Received: by outflank-mailman (input) for mailman id 928309;
 Wed, 26 Mar 2025 23:41:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1txaNa-0005FT-SW
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 23:41:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txaNa-00A0dK-0w;
 Wed, 26 Mar 2025 23:41:50 +0000
Received: from [2a02:8012:3a1:0:ede3:7fd5:aa96:e2db]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txaNZ-000gN3-2f;
 Wed, 26 Mar 2025 23:41:49 +0000
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
	bh=exC6y6z3n5IDU7786xQsAjpYm3hjuZ5S047t/wCthYI=; b=Hs7/PwWoAQ5dEdBzPN4QQV67mL
	kOM7tLTlh83FxoB9L2ah+HH6luxlJ28UeRaapmiI+pBlNCKsqpEfc/dz7NWmaRlPhlSSThD/issa6
	ETja0cBuOle6kXCVo825lAUokN/RcCdYf1pc2i1zAH5amXTLeG+i8N/4QsimzQqMFbTA=;
Message-ID: <6727ece4-d589-4ab4-9172-07dd6a7f2b44@xen.org>
Date: Wed, 26 Mar 2025 23:41:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] xen/arm: ffa: Enable VM to VM without firmware
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <0f5cf498c3c511ed192e8b7b7d0f4987e00e5c0d.1742824138.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0f5cf498c3c511ed192e8b7b7d0f4987e00e5c0d.1742824138.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 24/03/2025 13:53, Bertrand Marquis wrote:
> When VM to VM support is activated and there is no suitable FF-A support
> in the firmware, enable FF-A support for VMs to allow using it for VM to
> VM communications.

tee/ and the callbacks associated are meant to be used for mediatiors. 
My current interpretation ist this is only meant to interpose between a 
guest and physical resources. Here you are extending the meaning to 
"virtual TEE". I am sort of ok with that but ...

> If there is OP-TEE running in the secure world and using the non FF-A
> communication system, having CONFIG_FFA_VM_TO_VM could be non functional
> (if optee is probed first) or OP-TEE could be non functional (if FF-A is
> probed first) so it is not recommended to activate the configuration
> option for such systems.

... this part is concerning me. You should be able to build with 
CONFIG_FFA_VM_TO_VM and still boot when OP-TEE is present on the system. 
This is not too critical now as this is tech preview but this is 
definitely a blocker for making FFA supported. Can this be mentioned at 
the top of the ffa.c file (which already contains existing blocker)?

Also, given this would expose a fully virtual TEE, we should be able to 
have a system where you have some VMs talking FFA and some using the 
physical OPTEE (or another TEE). Whether we want to support it is a 
different question but this design would prevent it. Is this intended?

Cheers,

-- 
Julien Grall


