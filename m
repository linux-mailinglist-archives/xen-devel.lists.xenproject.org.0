Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9F49D04F0
	for <lists+xen-devel@lfdr.de>; Sun, 17 Nov 2024 18:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839014.1254829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCjYn-0004FM-8N; Sun, 17 Nov 2024 17:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839014.1254829; Sun, 17 Nov 2024 17:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCjYn-0004CA-4P; Sun, 17 Nov 2024 17:59:45 +0000
Received: by outflank-mailman (input) for mailman id 839014;
 Sun, 17 Nov 2024 17:59:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tCjYl-0004Bu-E7
 for xen-devel@lists.xenproject.org; Sun, 17 Nov 2024 17:59:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCjYk-009jdO-2a;
 Sun, 17 Nov 2024 17:59:43 +0000
Received: from [2a02:8012:3a1:0:dc92:b14d:2764:76ac]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCjYk-009W2V-2w;
 Sun, 17 Nov 2024 17:59:43 +0000
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
	bh=ArqupjsVzxtRZsIcfb3qi2CuApPOy73jn86lW1QwepQ=; b=Htj+2ok4ND5KdE1MnFJyJlwWXc
	W+72wTJdpErG+Jj8KCtxwV3hCoVTxzHJ9+FfXV12ALNzAIimg3QJRS3j9o/cQd364finKUy1Wb94c
	iJR9IE5wFLJ8Y8pnUdZqNc8yBfA1pdZfhOU7icV9Mip2OJru15WTGQ8tnEXo4eaS3F2E=;
Message-ID: <91608049-60c0-425d-8a2e-8eed4d2c9be6@xen.org>
Date: Sun, 17 Nov 2024 17:59:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] xen/arm: Use vmap_contig instead of __vmap where it's
 possible
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-5-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241115105036.218418-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 15/11/2024 10:50, Luca Fancellu wrote:
> Currently the arm code uses __vmap function in few parts to map
> physically contiguous pages, vmap_contig was introduced recently
> and does the same because it's a wrapper for __vmap, so use the
> latter instead of the direct __vmap function.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

