Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F426A2A5B
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 15:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501768.773516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVvxP-00061s-9D; Sat, 25 Feb 2023 14:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501768.773516; Sat, 25 Feb 2023 14:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVvxP-0005zE-6E; Sat, 25 Feb 2023 14:55:27 +0000
Received: by outflank-mailman (input) for mailman id 501768;
 Sat, 25 Feb 2023 14:55:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p2HO=6V=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1pVvxM-0005z5-Mt
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 14:55:25 +0000
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d3dbf59-b51c-11ed-88bb-e56d68cac8db;
 Sat, 25 Feb 2023 15:55:21 +0100 (CET)
Received: from [192.168.2.94] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 417C96602FB5;
 Sat, 25 Feb 2023 14:55:20 +0000 (GMT)
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
X-Inumbo-ID: 6d3dbf59-b51c-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677336921;
	bh=GPaYuR5Gy6chLlPOIU2JZ+7K9lpjG/p10DVFCLmE4vI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MU5VbcbfC0QusKjWBXD79gAq7WtPDI4jCbUCX37OTtNCxYhAzQRsMdIYvIcZQnliX
	 kIXwP//+YsQHnEJ/oLmaSftzRZ5vlhn0Sl6QZGQnajq7AWz9XL5xsNgzfzNW9E9hEc
	 jHjE6VR8vCGBK70YCdNZB05GYvJhsWDy5DEoqGR+AfJnYZbfnw7Uo//Y2gbPd4Ty4+
	 r9RcLrILyKrWv0bNT/hMD3YY3ggV6IoYPPEULvRmjAqyhO/vuV3x36tTCTapKf+zuS
	 sEc4uW51ZoPz/NIiC8l7jCYmwaAKotiLFVU+N8roRIoJIfYJ0kIQBG39ssTUoizeoK
	 rzYbb8McmO57g==
Message-ID: <4cb50dcb-b877-9602-3802-d651eea57b89@collabora.com>
Date: Sat, 25 Feb 2023 17:55:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/virtio: Pass correct device to
 dma_sync_sgtable_for_device()
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20230224153450.526222-1-olekstysh@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230224153450.526222-1-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/24/23 18:34, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The "vdev->dev.parent" should be used instead of "vdev->dev" as a device
> for which to perform the DMA operation in both
> virtio_gpu_cmd_transfer_to_host_2d(3d).
> 
> Because the virtio-gpu device "vdev->dev" doesn't really have DMA OPS
> assigned to it, but parent (virtio-pci or virtio-mmio) device
> "vdev->dev.parent" has. The more, the sgtable in question the code is
> trying to sync here was mapped for the parent device (by using its DMA OPS)
> previously at:
> virtio_gpu_object_shmem_init()->drm_gem_shmem_get_pages_sgt()->
> dma_map_sgtable(), so should be synced here for the same parent device.
> 
> Fixes: b5c9ed70d1a9 ("drm/virtio: Improve DMA API usage for shmem BOs")
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> This patch fixes the following issue when running on top of Xen with 
> CONFIG_XEN_VIRTIO=y (patch was only tested in Xen environment (ARM64 guest)
> w/ and w/o using Xen grants for virtio):
> 
> [    0.830235] [drm] pci: virtio-gpu-pci detected at 0000:00:03.0
> [    0.832078] [drm] features: +virgl +edid -resource_blob -host_visible
> [    0.832084] [drm] features: -context_init
> [    0.837320] [drm] number of scanouts: 1
> [    0.837460] [drm] number of cap sets: 2
> [    0.904372] [drm] cap set 0: id 1, max-version 1, max-size 308
> [    0.905399] [drm] cap set 1: id 2, max-version 2, max-size 696
> [    0.907202] [drm] Initialized virtio_gpu 0.1.0 0 for 0000:00:03.0 on minor 0
> [    0.927241] virtio-pci 0000:00:03.0: [drm] drm_plane_enable_fb_damage_clips() not called
> [    0.927279] Unable to handle kernel paging request at virtual address ffffffffc0053000
> [    0.927284] Mem abort info:
> [    0.927286]   ESR = 0x0000000096000144
> [    0.927289]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.927293]   SET = 0, FnV = 0
> [    0.927295]   EA = 0, S1PTW = 0
> [    0.927298]   FSC = 0x04: level 0 translation fault
> [    0.927301] Data abort info:
> [    0.927303]   ISV = 0, ISS = 0x00000144
> [    0.927305]   CM = 1, WnR = 1
> [    0.927308] swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000004127f000
> [    0.927312] [ffffffffc0053000] pgd=0000000000000000, p4d=0000000000000000
> [    0.927323] Internal error: Oops: 0000000096000144 [#1] PREEMPT SMP
> [    0.927329] Modules linked in:
> [    0.927336] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.2.0-rc4-yocto-standard #1
> [    0.927343] Hardware name: XENVM-4.18 (DT)
> [    0.927346] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.927352] pc : dcache_clean_poc+0x20/0x38
> [    0.927370] lr : arch_sync_dma_for_device+0x24/0x30
> [    0.927379] sp : ffff80000972b3e0
> [    0.927381] x29: ffff80000972b3e0 x28: ffff000001aa8a00 x27: 0000000000000000
> [    0.927389] x26: 0000000000000000 x25: ffff000002815010 x24: 0000000000000000
> [    0.927396] x23: ffff8000090f9078 x22: 0000000000000001 x21: 0000000000000002
> [    0.927403] x20: ffff000002b6b580 x19: 8000000000053000 x18: ffffffffffffffff
> [    0.927410] x17: 0000000000000000 x16: 0000000000000000 x15: ffff80000963b94e
> [    0.927416] x14: 0000000000000001 x13: ffff80000963b93b x12: 64615f616d645f67
> [    0.927423] x11: ffff800009513110 x10: 000000000000000a x9 : ffff80000972b360
> [    0.927430] x8 : ffff8000095130c8 x7 : ffff80000972b150 x6 : 000000000000000c
> [    0.927436] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 000000000000003f
> [    0.927443] x2 : 0000000000000040 x1 : ffffffffc0067000 x0 : ffffffffc0053000
> [    0.927450] Call trace:
> [    0.927452]  dcache_clean_poc+0x20/0x38
> [    0.927459]  dma_direct_sync_sg_for_device+0x124/0x130
> [    0.927466]  dma_sync_sg_for_device+0x64/0xd0
> [    0.927475]  virtio_gpu_cmd_transfer_to_host_2d+0x10c/0x110
> [    0.927483]  virtio_gpu_primary_plane_update+0x340/0x3d0
> [    0.927490]  drm_atomic_helper_commit_planes+0xe8/0x20c
> [    0.927497]  drm_atomic_helper_commit_tail+0x54/0xa0
> [    0.927503]  commit_tail+0x160/0x190
> [    0.927507]  drm_atomic_helper_commit+0x16c/0x180
> [    0.927513]  drm_atomic_commit+0xa8/0xe0
> [    0.927521]  drm_client_modeset_commit_atomic+0x200/0x260
> [    0.927529]  drm_client_modeset_commit_locked+0x5c/0x1a0
> [    0.927536]  drm_client_modeset_commit+0x30/0x60
> [    0.927540]  drm_fb_helper_set_par+0xc8/0x120
> [    0.927548]  fbcon_init+0x3b8/0x510
> [    0.927557]  visual_init+0xb4/0x104
> [    0.927565]  do_bind_con_driver.isra.0+0x1c4/0x394
> [    0.927572]  do_take_over_console+0x144/0x1fc
> [    0.927577]  do_fbcon_takeover+0x6c/0xe4
> [    0.927583]  fbcon_fb_registered+0x1e4/0x1f0
> [    0.927588]  register_framebuffer+0x214/0x310
> [    0.927592]  __drm_fb_helper_initial_config_and_unlock+0x33c/0x540
> [    0.927599]  drm_fb_helper_initial_config+0x4c/0x60
> [    0.927604]  drm_fbdev_client_hotplug+0xc4/0x150
> [    0.927609]  drm_fbdev_generic_setup+0x90/0x154
> [    0.927614]  virtio_gpu_probe+0xc8/0x16c
> [    0.927621]  virtio_dev_probe+0x19c/0x240
> [    0.927629]  really_probe+0xbc/0x2dc
> [    0.927637]  __driver_probe_device+0x78/0xe0
> [    0.927641]  driver_probe_device+0xd8/0x160
> [    0.927645]  __driver_attach+0x94/0x19c
> [    0.927649]  bus_for_each_dev+0x70/0xd0
> [    0.927656]  driver_attach+0x24/0x30
> [    0.927660]  bus_add_driver+0x154/0x20c
> [    0.927664]  driver_register+0x78/0x130
> [    0.927670]  register_virtio_driver+0x24/0x3c
> [    0.927675]  virtio_gpu_driver_init+0x18/0x24
> [    0.927684]  do_one_initcall+0x50/0x1d0
> [    0.927691]  kernel_init_freeable+0x210/0x27c
> [    0.927699]  kernel_init+0x24/0x12c
> [    0.927707]  ret_from_fork+0x10/0x20
> [    0.927716] Code: d2800082 9ac32042 d1000443 8a230000 (d50b7a20)
> [    0.927721] ---[ end trace 0000000000000000 ]---
> [    0.927728] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    0.927732] SMP: stopping secondary CPUs
> [    0.927791] Kernel Offset: disabled
> [    0.927794] CPU features: 0x80000,41058100,0000421b
> [    0.927799] Memory Limit: none
> [    1.015063] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> ---
> ---
>  drivers/gpu/drm/virtio/virtgpu_vq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index a04a9b20896d..1778a2081fd6 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -604,7 +604,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
>  	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
>  
>  	if (virtio_gpu_is_shmem(bo) && use_dma_api)
> -		dma_sync_sgtable_for_device(&vgdev->vdev->dev,
> +		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
>  					    bo->base.sgt, DMA_TO_DEVICE);
>  
>  	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
> @@ -1026,7 +1026,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
>  	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
>  
>  	if (virtio_gpu_is_shmem(bo) && use_dma_api)
> -		dma_sync_sgtable_for_device(&vgdev->vdev->dev,
> +		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
>  					    bo->base.sgt, DMA_TO_DEVICE);
>  
>  	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));

Indeed, it's only the vgpu drm device that was moved to use the pci
parent device. On x86 the vdev always has dma-ops, also
virtio_has_dma_quirk=true for modern Qemu. So I didn't test this code
path and apparently it's only testable on Xen, which is good to know.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry


