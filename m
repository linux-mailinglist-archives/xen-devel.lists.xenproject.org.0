Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA136B6D6D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 03:23:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509102.784302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbXpZ-0003sq-NN; Mon, 13 Mar 2023 02:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509102.784302; Mon, 13 Mar 2023 02:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbXpZ-0003rB-Fc; Mon, 13 Mar 2023 02:22:33 +0000
Received: by outflank-mailman (input) for mailman id 509102;
 Mon, 13 Mar 2023 02:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ez/1=7F=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1pbXpY-0003r5-5f
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 02:22:32 +0000
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e707be43-c145-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 03:22:30 +0100 (CET)
Received: from [192.168.2.203] (109-252-120-116.nat.spd-mgts.ru
 [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F1AD6602FE3;
 Mon, 13 Mar 2023 02:22:27 +0000 (GMT)
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
X-Inumbo-ID: e707be43-c145-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678674148;
	bh=8FllFrdYrwtSMdW711zen6F0H+nS+oSqdNhmJeRaVxU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=RMtEFfZuecbn5B+NLJhj9dOAHxXw/7wgY6w0ef4WzWmvHIICTxPxDzJdHh60qLpKA
	 pJ1WmO4eXb9NW6OJkl97njHBvAyUsrWJu3Sod2wDIsCJaG22Ejk8/FqmbGUKaATgye
	 jRqfgLnjfWz9iesYv3RLSKa1I/fgvTD2Cn7cd0eME6x8dYhAUwFNAwnkgPixP/RtSv
	 Da/zPW8Iz8+4F0hqS3Zbvc0DtL0tqQoaaARZZ2ZcjrBAYpbKgL2Z04jRnBPbfgcvkD
	 EGYwyVwE0yc2hBzqo+xPZgl7NaLnvP3s/nOLjByTjcq2cNzMNhCmKz0c0e++DE8wYr
	 Eoz3BqCYIW04g==
Message-ID: <d6f31fd0-bc04-79a5-266b-5e6ba7bf2a03@collabora.com>
Date: Mon, 13 Mar 2023 05:22:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC QEMU PATCH 08/18] virtio-gpu: Initialize Venus
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-9-ray.huang@amd.com>
 <68195782-0309-2f81-7f1f-84a7fe7bb05c@collabora.com>
In-Reply-To: <68195782-0309-2f81-7f1f-84a7fe7bb05c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/12/23 20:51, Dmitry Osipenko wrote:
> On 3/12/23 12:22, Huang Rui wrote:
>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>
>> Request Venus when initializing VirGL.
>>
>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>> ---
>>  hw/display/virtio-gpu-virgl.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>> index fe03dc916f..f5ce206b93 100644
>> --- a/hw/display/virtio-gpu-virgl.c
>> +++ b/hw/display/virtio-gpu-virgl.c
>> @@ -803,7 +803,11 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>>  {
>>      int ret;
>>  
>> +#ifdef VIRGL_RENDERER_VENUS
>> +    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
>> +#else
>>      ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
>> +#endif
> 
> Note that Venus now requires VIRGL_RENDERER_RENDER_SERVER flag to be
> set. Please test the patches with the latest virglrenderer and etc.
> 
> The #ifdef also doesn't allow adding new flags, it should look like:
> 
> #ifdef VIRGL_RENDERER_VENUS
>     flags |= VIRGL_RENDERER_RENDER_SERVER;
> #endif
> 
>     ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);
> 

BTW, Alex reviewed the Venus v3 patches a month ago [1] and the review
comments need to be addressed. AFAICS, you're actually using the very
old Venus patches here that stopped working about a year ago, so again
you're using a very outdated virglrenderer version.

Please take it all into account if you'll beat me to posting the next
version of Venus patches ;)

[1]
https://lore.kernel.org/qemu-devel/20220926142422.22325-1-antonio.caggiano@collabora.com/

-- 
Best regards,
Dmitry


