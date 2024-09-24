Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1376A9849A4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803146.1213592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8R2-0002jz-Gi; Tue, 24 Sep 2024 16:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803146.1213592; Tue, 24 Sep 2024 16:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8R2-0002hn-EA; Tue, 24 Sep 2024 16:30:44 +0000
Received: by outflank-mailman (input) for mailman id 803146;
 Tue, 24 Sep 2024 16:30:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1st8R0-0002hh-MM
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:30:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st8R0-0003zu-4V; Tue, 24 Sep 2024 16:30:42 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st8Qz-000706-UG; Tue, 24 Sep 2024 16:30:42 +0000
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
	bh=oKxM+OwHD4A/BgG9fxkGri37De/QdltpN5+xIu/8c3w=; b=oo460Z9Bc7pqFEvxPO61kZAJ/s
	j55hPHtAUmnUvxbJuZ4Be6L8ay6MDYGag+5lDIqUsVSPM7pgpFQsw/kKPYH0A+TTxibJi7jlEaw1b
	T4s8zUKpK125xCq/rL44wmjx1kSGfETSBvz56Uy/gANP+txwbnkLvnTe18XgArAoDozA=;
Message-ID: <f20c2ddb-162b-4e62-93b6-882e19e17852@xen.org>
Date: Tue, 24 Sep 2024 17:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] xen/arm: Decrease size of the 2nd ram bank
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, dpsmith@apertussolutions.com,
 edgar.iglesias@amd.com
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-2-edgar.iglesias@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240924162359.1390487-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar,

On 24/09/2024 17:23, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> The address range between 4G (32bit) and 1TB (40bit) is fully
> allocated. There's no more room for devices on ARM systems with
> 40-bit physicall address width.
 > > This decreases the size of the second RAM bank to free up space
> in preparation for virtio-pci and for future use-cases.

I don't think we should reduce the amount of RAM supported in the 
default case. Instead, I think it is time to support a more dynamic 
layout so we still allow 1TB guest when QEMU is not emulated a virtual 
PCI hostbridge.

Cheers,

-- 
Julien Grall


