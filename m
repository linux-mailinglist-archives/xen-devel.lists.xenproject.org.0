Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3B6829ACF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 13:59:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665433.1035633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNYB5-0006Cj-WA; Wed, 10 Jan 2024 12:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665433.1035633; Wed, 10 Jan 2024 12:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNYB5-0006Ag-TL; Wed, 10 Jan 2024 12:59:27 +0000
Received: by outflank-mailman (input) for mailman id 665433;
 Wed, 10 Jan 2024 12:59:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG7w=IU=damsy.net=pierre-eric@srs-se1.protection.inumbo.net>)
 id 1rNYB3-0006Aa-Nl
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 12:59:26 +0000
Received: from mail.damsy.net (mail.damsy.net [85.90.245.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13a624f7-afb8-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 13:59:23 +0100 (CET)
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
X-Inumbo-ID: 13a624f7-afb8-11ee-9b0f-b553b5be7939
Message-ID: <aefe25cd-6d67-4594-a368-f8f424526c7d@damsy.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=damsy.net; s=201803;
	t=1704891562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A4r8eZazLgjiMzk/DKUXZkBu5yIo/Yei+trtO5Q1vHc=;
	b=tXwagdUZZJx73BpxwNt/W6hboXzr1kY06nolXMI7SwYX/ZI+Y8t53jiiIBPI02pos1lpHs
	jcg2bZgS7JUsJgI0SXv2dr+4ZM6b7OAQRbi8VagYjc364QntbAjwZzZLReQ4fHYVVfyIyK
	kDvgAKBa9imlvh5lDZLpxG8KXU4OjDVTKY39BF9mZx/b96TxQtD3jDBkngTDJ89Qc9DWDQ
	Ef1tkfbGQNO40X/kycCb6SWUFCQGN4HTQDkej0+MjpyKiHFQTKHf+q305uQdZkoMpr+wDB
	2n0etZdJ5L2KP0bbMtVHsJ5J/sMQAUNJ9m5HSKC+GNq5gzOfO8jAfKVJvZyMsQ==
Date: Wed, 10 Jan 2024 13:59:21 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v6 07/11] virtio-gpu: Handle resource blob commands
To: Akihiko Odaki <akihiko.odaki@daynix.com>, Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, ernunes@redhat.com,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-8-ray.huang@amd.com>
 <0d08a014-cdf5-4b4f-a683-171ae4c8b6e0@daynix.com>
Content-Language: fr
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <0d08a014-cdf5-4b4f-a683-171ae4c8b6e0@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 21/12/2023 à 09:09, Akihiko Odaki a écrit :
> On 2023/12/19 16:53, Huang Rui wrote:
>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>
>> Support BLOB resources creation, mapping and unmapping by calling the
>> new stable virglrenderer 0.10 interface. Only enabled when available and
>> via the blob config. E.g. -device virtio-vga-gl,blob=true
> 
> I have another concern about delaying virgl_renderer_resource_unref() until the resource gets unmapped; the guest will expect the resource ID will be available for a new resource immediately after VIRTIO_GPU_CMD_RESOURCE_UNREF, but it will break the assumption and may corrupt things.
> 

Yes this is a problem.

And another one is virglrenderer is not really thread-safe, so this callstack:

#0  virgl_resource_blob_async_unmap ()
#1  object_finalize ()
#2  object_unref ()
#3  memory_region_unref ()
#4  flatview_destroy ()
#5  call_rcu_thread ()
#6  qemu_thread_start ()

Will call into virgl_renderer_ctx_resource_unmap which in turn uses virgl_resource_lookup
without any multithreading considerations.


Regards,
Pierre-Eric

