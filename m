Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE307A936E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 12:04:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606261.944039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjGXJ-0006pv-Sc; Thu, 21 Sep 2023 10:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606261.944039; Thu, 21 Sep 2023 10:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjGXJ-0006nO-Q2; Thu, 21 Sep 2023 10:03:53 +0000
Received: by outflank-mailman (input) for mailman id 606261;
 Thu, 21 Sep 2023 10:03:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qjGXI-0006nI-Cz
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 10:03:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qjGXG-0003FZ-5h; Thu, 21 Sep 2023 10:03:50 +0000
Received: from [54.239.6.189] (helo=[192.168.8.60])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qjGXF-0003Zm-V3; Thu, 21 Sep 2023 10:03:50 +0000
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
	bh=eR/8ui2NxiU3kMNySF32gy/gNmcgcYZK6nFbLOvgmNc=; b=GvNdfBM/dDhnVpQCdCMMfo063C
	Bhnx8v1YofOAG29osFpsrhyl66h/9cnyVNvoqe24k9iciVYmfWSVuJpRTaF6MhnMQrtBpONE9Z1Ei
	3LLa0+UNwZskfVY3gxlXU2VQiiCt8RCOVkFrjSFezugCKcqU4aOCC96z2J5uDp1u9oWY=;
Message-ID: <c9fedc61-ab24-4d3e-8104-dd2280cfaddf@xen.org>
Date: Thu, 21 Sep 2023 11:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18 v2] tools/light: Revoke permissions when a PCI
 detach for HVM domain
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20230915125204.22719-1-julien@xen.org>
 <B61F59E5-C5E5-482E-8F03-3472F976ACDC@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <B61F59E5-C5E5-482E-8F03-3472F976ACDC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/09/2023 01:11, Henry Wang wrote:
>> On Sep 15, 2023, at 20:52, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, libxl will grant IOMEM, I/O port and IRQ permissions when
>> a PCI is attached (see pci_add_dm_done()) for all domain types. However,
>> the permissions are only revoked for non-HVM domain (see do_pci_remove()).
>>
>> This means that HVM domains will be left with extra permissions. While
>> this look bad on the paper, the IRQ permissions should be revoked
>> when the Device Model call xc_physdev_unmap_pirq() and such domain
>> cannot directly mapped I/O port and IOMEM regions. Instead, this has to
>> be done by a Device Model.
>>
>> The Device Model can only run in dom0 or PV stubdomain (upstream libxl
>> doesn't have support for HVM/PVH stubdomain).
>>
>> For PV/PVH stubdomain, the permission are properly revoked, so there is
>> no security concern.
>>
>> This leaves dom0. There are two cases:
>>   1) Privileged: Anyone gaining access to the Device Model would already
>>      have large control on the host.
>>   2) Deprivileged: PCI passthrough require PHYSDEV operations which
>>      are not accessible when the Device Model is restricted.
>>
>> So overall, it is believed that the extra permissions cannot be exploited.
>>
>> Rework the code so the permissions are all removed for HVM domains.
>> This needs to happen after the QEMU has detached the device. So
>> the revocation is now moved to pci_remove_detached().
>>
>> Also add a comment on top of the error message when the PIRQ cannot
>> be unbind to explain this could be a spurious error as QEMU may have
>> already done it.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> As in discussion in v1, it is agreed that this patch should be included in
> 4.18, although technically my release-ack tag should be effective after
> code freeze, I am still providing the tag to avoid possible confusion:
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks. I have committed the patch with Anthony's reviewed-by tag.

Cheers,

-- 
Julien Grall

