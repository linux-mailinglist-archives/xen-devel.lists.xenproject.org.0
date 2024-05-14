Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D3F8C5A8C
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 19:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721692.1125305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6wGk-0006QA-0f; Tue, 14 May 2024 17:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721692.1125305; Tue, 14 May 2024 17:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6wGj-0006OE-U2; Tue, 14 May 2024 17:48:53 +0000
Received: by outflank-mailman (input) for mailman id 721692;
 Tue, 14 May 2024 17:48:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s6wGj-0006O8-DH
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 17:48:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6wGj-0003lQ-29; Tue, 14 May 2024 17:48:53 +0000
Received: from [15.248.3.89] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6wGi-00074A-Qz; Tue, 14 May 2024 17:48:52 +0000
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
	bh=XTMxr9qgFNEbabVWtjxqC8Gu8FdyBZ6yMETWB/9DvL0=; b=LRoAQ79pkTJ4VNQuK/XcKDOvVs
	y1TEiSHFE7MciszkS59EExTbDlr1SAy26k62ylwJ+tD0b459pueTEi6HI9XXu22xRcXPF+2S1+Ec4
	PpdnRsNtEZYROnMz/eU1oIVu0Ip7NtSQYlW+FFOyDxfwRNz8vM+Oh19IAssCyTgljY2c=;
Message-ID: <cf646df7-0e92-4138-8b54-471c72f44cb8@xen.org>
Date: Tue, 14 May 2024 18:48:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 5/5] arm/vpci: honor access size when returning an
 error
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240514143400.152280-1-stewart.hildebrand@amd.com>
 <20240514143400.152280-6-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240514143400.152280-6-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 14/05/2024 15:33, Stewart Hildebrand wrote:
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

With one remark below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> v9->10:
> * New patch in v10.
> ---
>   xen/arch/arm/vpci.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 348ba0fbc860..aaf9d9120c3d 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -41,6 +41,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>   {
>       struct pci_host_bridge *bridge = p;
>       pci_sbdf_t sbdf;
> +    const uint8_t access_size = (1 << info->dabt.size) * 8;
> +    const uint64_t access_mask = GENMASK_ULL(access_size - 1, 0);
>       /* data is needed to prevent a pointer cast on 32bit */
>       unsigned long data;
>   
> @@ -48,7 +50,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>   
>       if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
>       {
> -        *r = ~0UL;
> +        *r = access_mask;

The name 'access_mask' is a bit confusing. I would not expect such value 
for be returned to the guest. What about 'invalid'?

Also can you confirm whether patches #4 and #5 be committed without the 
rest of the series?

Cheers,

-- 
Julien Grall

