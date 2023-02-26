Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA5D6A35B6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 00:52:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502168.773881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWQmx-0006lS-Og; Sun, 26 Feb 2023 23:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502168.773881; Sun, 26 Feb 2023 23:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWQmx-0006jj-LY; Sun, 26 Feb 2023 23:50:43 +0000
Received: by outflank-mailman (input) for mailman id 502168;
 Sun, 26 Feb 2023 23:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G6mB=6W=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1pWQmw-0006jd-45
 for xen-devel@lists.xenproject.org; Sun, 26 Feb 2023 23:50:42 +0000
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ef36cda-b630-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 00:50:39 +0100 (CET)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 187D86602DCD;
 Sun, 26 Feb 2023 23:50:37 +0000 (GMT)
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
X-Inumbo-ID: 5ef36cda-b630-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677455438;
	bh=JYRpxATqvkNno1FwoBgptX7gQvro7kbdKaoh02c9VEQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=TqSCfmh49xkDbtgdLhYXyECizYrDVzOlSc4QBhUnSkdoQBHhIiPRhn8+7lHI9/9li
	 e8HZpOK/Mo6d2omwCQIfEe5i7lLxY7GKYfFKKTdInzjMwboFn9AXcDn0KGQf64Vf8A
	 Uv0b10EbzFkgDzRcxhD08xlEmcbpLo8Lnr5aO/rkyJqqjvkoFRhZ8eht4eo6Nwi0dC
	 /IkZJm1mntY20f3yi75AZkKIuYm+OgpIrU7k+uxVssus+JfPaOq4a72cuHFHlA2VAP
	 IuV7JW/2gw/aYpwuuv/nYTRBrrJ5S355O2kkcBhW4kpTmr7mezO+JGiV2Eq+8hnz7G
	 02drfzM2+WNlw==
Message-ID: <32f2442d-9150-0288-499c-9206084d8732@collabora.com>
Date: Mon, 27 Feb 2023 02:50:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/virtio: Pass correct device to
 dma_sync_sgtable_for_device()
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20230224153450.526222-1-olekstysh@gmail.com>
 <4cb50dcb-b877-9602-3802-d651eea57b89@collabora.com>
Content-Language: en-US
In-Reply-To: <4cb50dcb-b877-9602-3802-d651eea57b89@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/23 17:55, Dmitry Osipenko wrote:
> On 2/24/23 18:34, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The "vdev->dev.parent" should be used instead of "vdev->dev" as a device
>> for which to perform the DMA operation in both
>> virtio_gpu_cmd_transfer_to_host_2d(3d).
>>
>> Because the virtio-gpu device "vdev->dev" doesn't really have DMA OPS
>> assigned to it, but parent (virtio-pci or virtio-mmio) device
>> "vdev->dev.parent" has. The more, the sgtable in question the code is
>> trying to sync here was mapped for the parent device (by using its DMA OPS)
>> previously at:
>> virtio_gpu_object_shmem_init()->drm_gem_shmem_get_pages_sgt()->
>> dma_map_sgtable(), so should be synced here for the same parent device.
>>
>> Fixes: b5c9ed70d1a9 ("drm/virtio: Improve DMA API usage for shmem BOs")
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
...
> Indeed, it's only the vgpu drm device that was moved to use the pci
> parent device. On x86 the vdev always has dma-ops, also
> virtio_has_dma_quirk=true for modern Qemu. So I didn't test this code
> path and apparently it's only testable on Xen, which is good to know.
> 
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Applied to misc-fixes

-- 
Best regards,
Dmitry


