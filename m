Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 400EA8CAF9C
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 15:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726916.1131317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Po3-0002L9-Be; Tue, 21 May 2024 13:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726916.1131317; Tue, 21 May 2024 13:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Po3-0002Ja-8k; Tue, 21 May 2024 13:45:31 +0000
Received: by outflank-mailman (input) for mailman id 726916;
 Tue, 21 May 2024 13:45:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s9Po1-0002JU-7J
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 13:45:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s9Po0-0004yH-Pq; Tue, 21 May 2024 13:45:28 +0000
Received: from [15.248.2.238] (helo=[10.24.67.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s9Po0-0000Z2-Hh; Tue, 21 May 2024 13:45:28 +0000
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
	bh=SfXYgXJFvjs2JIPRGPh2HOmFDfPwtOxBmItpoSJCn2A=; b=5z7wz0eIiQ7hP8PE2ngkis5r/t
	xpB6JklFL5qGRiDLAN8sr+l+YH7p8r5eIhEm3tST8IPK/UlLstxneNDVPaA5d9vboEFLr6e92g4Hg
	4CZGsdRQj4S7a3aDyXAtB4COPG88zeepna2MzEh51eIkDNrx7+GUEZV7s2T18v92p36M=;
Message-ID: <8fa02e06-d8dc-4e73-a58e-e4d84b090ea8@xen.org>
Date: Tue, 21 May 2024 14:45:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/5] arm/vpci: honor access size when returning an
 error
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240517170619.45088-1-stewart.hildebrand@amd.com>
 <20240517170619.45088-2-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240517170619.45088-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 17/05/2024 18:06, Stewart Hildebrand wrote:
> From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> 
> Guest can try to read config space using different access sizes: 8,
> 16, 32, 64 bits. We need to take this into account when we are
> returning an error back to MMIO handler, otherwise it is possible to
> provide more data than requested: i.e. guest issues LDRB instruction
> to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
> register.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

