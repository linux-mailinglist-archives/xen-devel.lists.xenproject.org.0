Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629A07825BD
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 10:44:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587389.918755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0WR-0004tk-3u; Mon, 21 Aug 2023 08:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587389.918755; Mon, 21 Aug 2023 08:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0WQ-0004rO-Vw; Mon, 21 Aug 2023 08:44:26 +0000
Received: by outflank-mailman (input) for mailman id 587389;
 Mon, 21 Aug 2023 08:44:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY0WP-0004rI-Bg
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 08:44:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY0WO-0000bM-VL; Mon, 21 Aug 2023 08:44:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY0WO-00032Q-Qi; Mon, 21 Aug 2023 08:44:24 +0000
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
	bh=5szsNSxP3V1ZvcTQfGflSJChjKTa95IPl8p2VZx9ROI=; b=ypQmFM5KQXEBFvp1y75t7nQFvH
	AkGTjMwD2+eCXOg6R6QMjs9a6m+nPCF54hQjX+omT2Mp0+I99wGirT/81KNGaW/dDXjIvksQH3Okh
	Qw9IUkTS/5iIyyMlQqJGs67LC2veXHd4iK+9duH5Mea/xUVR30ecxYLMFq6TOYy3XGdw=;
Message-ID: <d6afb536-e0b6-42fd-81ea-cc37c00192f7@xen.org>
Date: Mon, 21 Aug 2023 09:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] xen/arm64: prepare for moving MMU related code
 from head.S
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Julien Grall <jgrall@amazon.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814042536.878720-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 14/08/2023 05:25, Henry Wang wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> We want to reuse head.S for MPU systems, but there are some
> code are implemented for MMU systems only. We will move such
> code to another MMU specific file. But before that we will
> do some indentations fix in this patch to make them be easier
> for reviewing:
> 1. Fix the indentations and incorrect style of code comments.
> 2. Fix the indentations for .text.header section.
> 3. Rename puts() to asm_puts() for global export
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Is this patch depends on the first two? If not, I will commit it before v6.

Cheers,

-- 
Julien Grall

