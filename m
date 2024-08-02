Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE9945EA6
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 15:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771179.1181749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsJl-00057F-I1; Fri, 02 Aug 2024 13:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771179.1181749; Fri, 02 Aug 2024 13:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsJl-00055d-FK; Fri, 02 Aug 2024 13:27:37 +0000
Received: by outflank-mailman (input) for mailman id 771179;
 Fri, 02 Aug 2024 13:27:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sZsJj-00055V-UA
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 13:27:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sZsJf-00063b-QM; Fri, 02 Aug 2024 13:27:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sZsJf-0003ux-Ht; Fri, 02 Aug 2024 13:27:31 +0000
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
	bh=VlUTGn6xtobJG8lTUxNL8lDtfe2NNnec5m5HU9Fti6U=; b=WQnrIO7n9JoLVV37I4QsbiS8+X
	KKL5idpBtk6RdKNHu8V2Yd41lQLpiuT5/ismKQ2urkklG3985bmJIcr1kON54YAzuQPrRfWXrLlwh
	vPyfTN1SKh4z2mQn0HqvPej7xn0Qc/vRFtpbUr6cgECXSGNkB/SAqOUVLOQE8toEwxqE=;
Message-ID: <a17d0c07-3f98-4eab-9f84-77d64b562cbf@xen.org>
Date: Fri, 2 Aug 2024 14:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen: arm: make VMAP only support in MMU system
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>
References: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
 <20240802121443.1531693-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240802121443.1531693-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/08/2024 13:14, Ayan Kumar Halder wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> VMAP is widely used in ALTERNATIVE feature, CPUERRATA feature, etc to
> remap a range of memory with new memory attributes. Since this is
> highly dependent on virtual address translation, we choose to fold VMAP
> in MMU system.
> 
> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
> only support in MMU system on ARM architecture. And we make features
> like ALTERNATIVE, CPUERRATA, etc, now depend on VMAP.

While I agree that alternative should depend on VMAP (for now), I feel 
this is incorrect for CPUERRATA. Very likely, you will need to deal with 
them on the MPU.

Before making any suggestion, would you be able to clarify how you 
envision to deal with errata? Will they be selected at built time or 
boot time?

Cheers,

-- 
Julien Grall


