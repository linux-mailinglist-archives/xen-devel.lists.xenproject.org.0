Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6D27C8063
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 10:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616290.958166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDct-0006LD-8a; Fri, 13 Oct 2023 08:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616290.958166; Fri, 13 Oct 2023 08:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDct-0006Ip-4q; Fri, 13 Oct 2023 08:34:31 +0000
Received: by outflank-mailman (input) for mailman id 616290;
 Fri, 13 Oct 2023 08:34:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrDcr-0006Ij-L6
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 08:34:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrDcr-0002TY-6d; Fri, 13 Oct 2023 08:34:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrDcq-0001si-Ti; Fri, 13 Oct 2023 08:34:29 +0000
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
	bh=i2dWisYBz7u3pG0UOrse+398WLK2TV4LwlT6H2rPLCk=; b=Jjfgf9JgpOjAVmvJT2MVySERgc
	m6DiovzOhtZwUd+4lVHIAedl0pGVzb4Wggs1bCgNbIR/V/6WI3cELrsx9o5OODm37pSQFgiPgVIiH
	BJLZwM54x6ADZehr1ffcsNV2uQtZNzjHz9FaRsD6g1BGbjL3EeRzN2wvWtPIPLLA0opU=;
Message-ID: <8f70079a-ab08-4b41-8aab-834958ae93eb@xen.org>
Date: Fri, 13 Oct 2023 09:34:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/17] xen/arm: account IO handlers for emulated PCI
 MSI-X
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-16-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231012220854.2736994-16-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 12/10/2023 23:09, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> At the moment, we always allocate an extra 16 slots for IO handlers
> (see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
> MSI-X registers we need to explicitly tell that we have additional IO
> handlers, so those are accounted.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some process remark. All the patches you send (even if they are 
unmodified) should also contain your signed-off-by. This is to comply 
with point (b) in the DCO certificate:

https://cert-manager.io/docs/contributing/sign-off/

Please check the other patches in this series.

> Acked-by: Julien Grall <jgrall@amazon.com>

Is this patch depends on the rest of the series? If not we can merge it 
in the for-4.19 branch Stefano created. This will reduce the number of 
patches you need to resend.

Cheers,

-- 
Julien Grall

