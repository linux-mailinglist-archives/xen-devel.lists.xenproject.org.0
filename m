Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200B0453A19
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 20:23:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226551.391514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn42n-0002Yd-Ns; Tue, 16 Nov 2021 19:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226551.391514; Tue, 16 Nov 2021 19:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn42n-0002WN-Kg; Tue, 16 Nov 2021 19:23:01 +0000
Received: by outflank-mailman (input) for mailman id 226551;
 Tue, 16 Nov 2021 19:23:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mn42m-0002WH-7u
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 19:23:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mn42l-0002k8-3c; Tue, 16 Nov 2021 19:22:59 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.85.43.125])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mn42k-0007ee-SG; Tue, 16 Nov 2021 19:22:59 +0000
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
	bh=YSZ0WWJXuCf7N5BEKh4RtM575I9HYjtZ/UwCdyOGPuc=; b=oi60Sxx6X0dQ2ApxPIi1hNEXVZ
	ynMUZPYbORlpIQOv3NzC+jYMnkCOOHoW3EPXq2oQL0cajgpD0JNWq0ryHIb7FoKBVtGDaTahxhOM5
	TjulirZ9FjdAh7vzHZay95PbPeldrCAcXDFX7J+Ze23GVbp7QDrvk/DGf0UtEzjFYFhI=;
Message-ID: <997e2ad5-9b52-73b4-a02d-f255480684d9@xen.org>
Date: Tue, 16 Nov 2021 19:22:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v6 5/7] xen/arm: do not map IRQs and memory for disabled
 devices
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-6-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211105063326.939843-6-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 05/11/2021 06:33, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Currently Xen maps all IRQs and memory ranges for all devices except
> those marked for passthrough, e.g. it doesn't pay attention to the
> "status" property of the node.
> 
> According to the device tree specification [1]:
>   - "okay"     Indicates the device is operational.
>   - "disabled" Indicates that the device is not presently operational,
>                but it might become operational in the future (for example,
> 	      something is not plugged in, or switched off).
> 	      Refer to the device binding for details on what disabled means
> 	      for a given device.
> 
> So, "disabled" status is device dependent and mapping should be taken by
> case-by-case approach with that respect. Although in general Xen should map
> IRQs and memory ranges as the disabled devices might become operational

Right, this change effectively prevent dom0 to use such device if it 
becomes operational in the future. So this sounds like a big regression.

How do you plan to handle it?

> it
> makes it impossible for the other devices, which are not operational in
> any case, to skip the mappings.

You wrote "makes it impossible for the other devices", but it is not 
clear to me what's would go wrong when we map a disabled device (Dom0 
should not touch it). Do you have an example?

Cheers,

-- 
Julien Grall

