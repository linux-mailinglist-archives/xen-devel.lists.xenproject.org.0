Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE277ED099
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 20:56:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633847.988966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Lzk-0005su-Dy; Wed, 15 Nov 2023 19:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633847.988966; Wed, 15 Nov 2023 19:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Lzk-0005qv-Ap; Wed, 15 Nov 2023 19:56:16 +0000
Received: by outflank-mailman (input) for mailman id 633847;
 Wed, 15 Nov 2023 19:56:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3Lzi-0005lY-Qv
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 19:56:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3Lzi-0000sx-IH; Wed, 15 Nov 2023 19:56:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3Lzi-0002yu-DJ; Wed, 15 Nov 2023 19:56:14 +0000
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
	bh=yfz8vIkE7Z1Oktepvg3JcHHadvLDRr1sOHqQp8KgY/0=; b=KJM+VMADvFKhyEgsSbjED3wh2L
	NR1QiOjtIR6t2V+WyUYhCAilYCA6ptmIXowdOQrq+Ck+O9+jU9OXZtUMpGx8t87CNTYy5FMQKc5gH
	6LelrvENZFkFmOAMMsuOobzEYPbNgvPY6sKcCxYmCkX3NrfPpMiKG1Ln789viesDppqo=;
Message-ID: <d8c9717e-d408-475f-8c58-a3578383675f@xen.org>
Date: Wed, 15 Nov 2023 19:56:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Content-Language: en-GB
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <9e0760f2-6ffd-4010-aabf-ff4f643f288c@xen.org>
 <1e5b414b-c730-4fbf-bc51-c292e396f6c5@epam.com>
 <38ac9e15-3618-4178-b4f6-00a16eb53578@xen.org>
 <6b82639b-a2cb-43f5-9968-590aec3f086b@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6b82639b-a2cb-43f5-9968-590aec3f086b@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 15/11/2023 19:38, Oleksandr Tyshchenko wrote:
>> The ioreq.c code was always meant to be generic and is always for every
>> emulated MMIO. So you want to limit any change in it. Checking the MMIO
>> region belongs to the hostbridge and doing the translation is IMHO not a
>> good idea to do in ioreq.c. Instead you want to do the conversion from
>> MMIO to (sbdf, offset) in virtio_pci_mmio{read, write}(). So the job of
>> ioreq.c is to simply find the correct Device Model and forward it.
> 
> 
> 
> Are you about virtio_pci_ioreq_server_get_addr() called from
> arch_ioreq_server_get_type_addr()? If so and if I am not mistaken the
> x86 also check what PCI device is targeted there.
Well yes. We can do better to avoid extra complexity for each MMIO.

Note that the x86 version is somewhat more light-weight.

Cheers,

-- 
Julien Grall

