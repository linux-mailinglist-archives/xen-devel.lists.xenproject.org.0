Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8CFA05E5B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867299.1278755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVWpZ-0002X5-9A; Wed, 08 Jan 2025 14:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867299.1278755; Wed, 08 Jan 2025 14:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVWpZ-0002UG-6K; Wed, 08 Jan 2025 14:14:45 +0000
Received: by outflank-mailman (input) for mailman id 867299;
 Wed, 08 Jan 2025 14:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dPLU=UA=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1tVWpY-0002UA-Lq
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:14:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e765bc86-cdca-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 15:14:43 +0100 (CET)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-UP3WWTiqNrGV401L23r4hw-1; Wed, 08 Jan 2025 09:14:38 -0500
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5d3dbddb891so1020300a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:14:38 -0800 (PST)
Received: from redhat.com ([2a02:14f:175:d62d:93ef:d7e2:e7da:ed72])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80701ca31sm25153860a12.88.2025.01.08.06.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:14:35 -0800 (PST)
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
X-Inumbo-ID: e765bc86-cdca-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736345681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yNcVBbhGtCzb9GuZyfZlONnG3UaP4zdH2tNBP9ClSbY=;
	b=DyqYjGrAePt6RTYmQ2xhmQkyjzjifZRKHuZDmRiLZImxq9TpBneYYCVR8nYrT28wF6BfSm
	zzRgtddGFTgZ4p3KVfzplrCj71pW/X79PTqq398kOhnYBCXiNWK0B8klWF515y5yFOKVH5
	YCYaVuGYxb7VxJsJEWQwvZptLNOKaWk=
X-MC-Unique: UP3WWTiqNrGV401L23r4hw-1
X-Mimecast-MFC-AGG-ID: UP3WWTiqNrGV401L23r4hw
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345677; x=1736950477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNcVBbhGtCzb9GuZyfZlONnG3UaP4zdH2tNBP9ClSbY=;
        b=SU+SAk140orcjGWsNl1BDVpJepnFIyOQ5bo8gv3NTpYIcUr4IpzhhE44oh2Of+fNam
         X2Ud84DdscDsDwzsGQN9F+L4/YVJLPc6GbSA4UD5yTdKiNjI7dFiemkrSJGpSx4RGIE5
         mBs/QXWlhLGru/ryTKeMN3pVS19bt2kxsIl1v64s/V1XJb0YfCT9qWVN20fx0DRn6yX7
         zzPUnesxUYoCgHPUVcYugg2rUblG+p9fHEuRFcJFsVnGb6rvZsx5YyE3LKLGm2KH+zjS
         6k24E795HCxwyiOdNyLQOk2OKw9aUtSPFmhrC6H8VufhV/nv/tu/+rPBrroUSjiOXO1P
         CG6g==
X-Forwarded-Encrypted: i=1; AJvYcCXdIbEduNLheLjFsdM0OeAkU/gmgaLPivzgCdWcvUjUwwVOKIhS6vSRLUw3HsS55JE+dUMxVhs/lyg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBCJw1zOucm4k7yZVzwBm1HLgb3w6WCZtCmKTVRZ/q02lmCVJi
	33wWFYcTcqZstE5reUjtCaQNm0/kDQWjxjtCGEraUYT9DCLO64psxF4RWKoktQXiamBKA/lrPFF
	nJQfyommIqGCwZJhkq9hDtIiiIT6t4aAkOkkO0bMmODynza/aQMpc3pdWfvQjcoGP
X-Gm-Gg: ASbGncuqidb7MJD3gcsxcC3GRi1+11jleGENuYV5yB+xQ3h8YXC6h04a2Dz6fyQlVFS
	YI/XSX4/g+6lOBv7HBR0dfZVK1B+CbUN3Ol+4TdHouA8Hm7hOouuItB4ML7zVaRXcdz+gaiE94e
	dHocoAdAVeeBYGvDr6eLcyzOGXbkYyB769IjpBhSV1bMqP5QL6dTzTLIgFFeTfjpSPiAEpaNxgt
	WJm7uZw/+FZ3phzj3omQLCPk5fa9yl7AFfQWtajuVXXCd0uctk=
X-Received: by 2002:a05:6402:26cd:b0:5d0:d845:2882 with SMTP id 4fb4d7f45d1cf-5d971ba439cmr2707858a12.13.1736345677195;
        Wed, 08 Jan 2025 06:14:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKtk9x9QKCmWxztdABmLZGo0gNmHg9Dd/RFbOSpC8jj0cQZPb5Vvzgn8YqKiPuocWpS+tLNQ==
X-Received: by 2002:a05:6402:26cd:b0:5d0:d845:2882 with SMTP id 4fb4d7f45d1cf-5d971ba439cmr2707819a12.13.1736345676708;
        Wed, 08 Jan 2025 06:14:36 -0800 (PST)
Date: Wed, 8 Jan 2025 09:14:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Zhang <julia.zhang@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
	Penny Zheng <penny.zheng@amd.com>,
	Zhu Lingshan <Lingshan.Zhu@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	qemu-devel@nongnu.org
Subject: Re: [PATCH 3/3] virtio-gpu: add a new command to get p2pdma_distance
Message-ID: <20250108091357-mutt-send-email-mst@kernel.org>
References: <20241207105537.542441-1-julia.zhang@amd.com>
 <20241207105537.542441-4-julia.zhang@amd.com>
MIME-Version: 1.0
In-Reply-To: <20241207105537.542441-4-julia.zhang@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wFotA_itGZFiMhkQXq0I8oHeIRez2LsqWCVYmkeTdZI_1736345677
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 07, 2024 at 06:55:40PM +0800, Julia Zhang wrote:
> diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
> index 6459fdb9fb..2e55dcc2fe 100644
> --- a/include/standard-headers/linux/virtio_gpu.h
> +++ b/include/standard-headers/linux/virtio_gpu.h
> @@ -95,6 +95,7 @@ enum virtio_gpu_ctrl_type {
>  	VIRTIO_GPU_CMD_SUBMIT_3D,
>  	VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
>  	VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
> +	VIRTIO_GPU_CMD_P2PDMA_DISTANCE,
>  
>  	/* cursor commands */
>  	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
> @@ -108,6 +109,7 @@ enum virtio_gpu_ctrl_type {
>  	VIRTIO_GPU_RESP_OK_EDID,
>  	VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
>  	VIRTIO_GPU_RESP_OK_MAP_INFO,
> +	VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE,
>  
>  	/* error responses */
>  	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
> @@ -429,6 +431,23 @@ struct virtio_gpu_set_scanout_blob {
>  	uint32_t offsets[4];
>  };
>  
> +/* VIRTIO_GPU_CMD_P2PDMA_DISTANCE */
> +struct virtio_gpu_device_p2pdma_distance {
> +	struct virtio_gpu_ctrl_hdr hdr;
> +	__le32 provider_bus;
> +	__le32 provider_slot;
> +	__le32 provider_func;
> +	__le32 client_bus;
> +	__le32 client_slot;
> +	__le32 client_func;
> +};
> +
> +/* VIRTIO_GPU_RESP_DISTANCE */
> +struct virtio_gpu_resp_distance {
> +	struct virtio_gpu_ctrl_hdr hdr;
> +	__le32 distance;
> +};
> +
>  /* VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB */
>  struct virtio_gpu_resource_map_blob {
>  	struct virtio_gpu_ctrl_hdr hdr;
> -- 
> 2.34.1

This is not how we change this header.
you need a spec patch, an UAPI change to be accepted into linux.

-- 
MST


