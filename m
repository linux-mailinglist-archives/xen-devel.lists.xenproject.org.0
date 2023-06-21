Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A836673823D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 13:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552662.862859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBvn2-0002AW-3m; Wed, 21 Jun 2023 11:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552662.862859; Wed, 21 Jun 2023 11:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBvn2-00028W-0s; Wed, 21 Jun 2023 11:14:20 +0000
Received: by outflank-mailman (input) for mailman id 552662;
 Wed, 21 Jun 2023 11:14:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hYL=CJ=collabora.com=bob.beckett@srs-se1.protection.inumbo.net>)
 id 1qBvn0-00028Q-Ht
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 11:14:18 +0000
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [2a00:1098:0:82:1000:25:2eeb:e5ab])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c21a2d75-1024-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 13:14:16 +0200 (CEST)
Received: from [192.168.178.53] (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E5D586606F8B;
 Wed, 21 Jun 2023 12:14:14 +0100 (BST)
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
X-Inumbo-ID: c21a2d75-1024-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687346055;
	bh=MJIa8GnFWfms/olooPp651/+u8wmfzSy1yn/q7OMU28=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TlctRtqxSe2Xfa93NmrfOZsDe3qO+n5QormbBFMXTqpdUajdSHjL7aC6Oxlxd1bDK
	 2nYpU77KYpXJkWmEViBea8NjmWeM+Wnd4K38CSYLVt7HzIZFMTZ0JCf9s3UVwZqBmH
	 gxhUEZb2cfbKeE5cm69nLVrjTt77BOXHu06WoDST4zUNqAL6M42gdsevvM1sY9SceH
	 8FVltG6sbbgf61AIwFkoqJKA4+LXTyPjhMegrOokmeXhLtoc9GErYo18Le5WSCAfd1
	 yFVm7p4XY/v5CT1u9dn1Exw4RHic1pLUcUJR/w9UvRYoMMtPNF7WJlY8XPd8UM+wPA
	 zknwi14bIv5Qg==
Message-ID: <e9e10508-c26c-cf2a-6407-8e26a1342370@collabora.com>
Date: Wed, 21 Jun 2023 12:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [QEMU PATCH 1/1] virtgpu: do not destroy resources when guest
 suspend
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
References: <20230608025655.1674357-1-Jiqian.Chen@amd.com>
 <20230608025655.1674357-2-Jiqian.Chen@amd.com>
 <CAJ+F1CKjTW7zycr2xAW0x+d_7CEy+LxWur2Tqp2dvsb=PoJ5Dw@mail.gmail.com>
 <q2rpqbg5b4bqxb7oayclzgbf5fplofm3dmxgmpmskjf4mcfzpn@peeiuxwkqxbb>
 <BL1PR12MB58491E2E13F959365AA3F594E75CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <lgan3p6wqmxht5fpduh5nvg3f5m5n636k7zrrealnu2lilghhh@qlbvgu3l4apw>
 <2164ff79-aa09-d959-cc61-c7a2a21db5e3@collabora.com>
 <2s33vb2tfogntkyk5laxzcmgexf42mhkpwr2gh3gjvpitav6ez@h5zbmuklzmv5>
Content-Language: en-US
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <2s33vb2tfogntkyk5laxzcmgexf42mhkpwr2gh3gjvpitav6ez@h5zbmuklzmv5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 21/06/2023 09:39, Gerd Hoffmann wrote:
> On Tue, Jun 20, 2023 at 01:26:15PM +0100, Robert Beckett wrote:
>> On 20/06/2023 10:41, Gerd Hoffmann wrote:
>>>     Hi,
>>>
>>>>> The guest driver should be able to restore resources after resume.
>>>> Thank you for your suggestion!
>>>> As far as I know, resources are created on host side and guest has no backup, if resources are destroyed, guest can't restore them.
>>>> Or do you mean guest driver need to send commands to re-create resources after resume?
>>> The later.  The guest driver knows which resources it has created,
>>> it can restore them after suspend.
>> Are you sure that this is viable?
>>
>> How would you propose that a guest kernel could reproduce a resource,
>> including pixel data upload during a resume?
>>
>> The kernel would not have any of the pixel data to transfer to host.
> Depends on the of resource type.  For resources which are created by
> uploading pixel data (using VIRTIO_GPU_CMD_TRANSFER_TO_HOST_*) a guest
> mirror exists which can be used for re-upload.

unfortunately this is not always the case.

https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gallium/drivers/virgl/virgl_resource.c#L668

Often mesa will decide that it won't need to access a resource again 
after initial upload (textures etc). In this case, if it is able to copy 
back from host if needed, it will not maintain the guest shadow copy. 
Instead it will create a single page proxy object. The transfer to host 
will then over fill it to the correct size.

I think this was a fairly huge optimization for them.

>
> For resources filled by gl rendering ops this is indeed not the case.
>
>> Could you explain how you anticipate the guest being able to reproduce the
>> resources please?
> Same you do on physical hardware?  Suspend can poweroff your PCI
> devices, so there must be some standard way to handle that situation
> for resources stored in gpu device memory, which is very similar to
> the problem we have here.

In traditional PCI gfx card setups, TTM is used as the memory manager in 
the kernel. This is used to migrate the buffers back from VRAM to system 
pages during a suspend.

This would be suitable for use to track host blob buffers that get 
mapped to guest via the PCI BAR, though would be a significant 
re-architecting of virtio gpu driver.

It would not help with the previously mentioned proxied resources. 
Though in theory the driver could read the resources back from host to 
guest pages during suspend, this would then be potentially complicated 
by suspend time alloc failures etc.


As virtio drivers are by design paravirt drivers ,I think it is 
reasonable to accept some knowledge with and cooperation with the host 
to manage suspend/resume.

It seems to me like a lot of effort and long term maintenance to add 
support for transparent suspend/resume that would otherwise be unneeded.

Perhaps others have alternative designs for this?

>
> take care,
>    Gerd
>

