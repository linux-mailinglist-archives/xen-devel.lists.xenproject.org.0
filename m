Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938CC7D2E15
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621135.967281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qur8O-0002H2-6h; Mon, 23 Oct 2023 09:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621135.967281; Mon, 23 Oct 2023 09:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qur8O-0002EV-2t; Mon, 23 Oct 2023 09:22:04 +0000
Received: by outflank-mailman (input) for mailman id 621135;
 Mon, 23 Oct 2023 09:22:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qur8M-0002CZ-Sh
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:22:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qur8M-0002Vz-Db; Mon, 23 Oct 2023 09:22:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qur8M-0006Cg-6n; Mon, 23 Oct 2023 09:22:02 +0000
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
	bh=yOVusp4UZHcT+1yGns52uk1ZJbX8ivEMT5/yOQmxTm0=; b=6zBM6+whCh08R6Vs5mtN/5LIKa
	QJkhyGTcgFH2SABSQ3OwVRfPXp/p+07xTemK5FVO8Grg9nJoQyqN3DkzYebw3EMofKqk1dX7DZE2a
	Fu6nC4Zo9vwlsxv5fABSr+09tpNRmaCqYCoX18IJcwLQplHYmsKolzbuOAbiI8osFm34=;
Message-ID: <a54192e0-0871-4735-ac09-7972a3ab69ec@xen.org>
Date: Mon, 23 Oct 2023 10:21:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] xen/arm: don't pass iommu properties to hwdom for
 iommu-map
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
 <20231004145604.1085358-2-stewart.hildebrand@amd.com>
 <31cdf500-959d-42cb-a1ce-bbee7cb5e251@xen.org>
 <755bb8c6-d386-405a-a825-34a0d5ba3816@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <755bb8c6-d386-405a-a825-34a0d5ba3816@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/10/2023 10:00, Michal Orzel wrote:
> As for supporting legacy bindings, I think
> we would be good if we search for #iommu-cells || mmu-masters

For me, it is clear in the device-tree bindings documentation that 
#iommu-cells will belong to a IOMMU node. It is less clear for 
mmu-masters, therefore I would rather prefer if we use the compatible to 
detect legacy bindings.

I am not that concerned to properly remove any nodes using legacy 
bindings because new platforms should not use it. So we could also keep 
the existing behavior (i.e. exposing the IOMMU unless it is used by Xen).

Cheers,

-- 
Julien Grall

