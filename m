Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F355448E1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344999.570637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFOi-0002FJ-F5; Thu, 09 Jun 2022 10:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344999.570637; Thu, 09 Jun 2022 10:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFOi-0002Cm-C2; Thu, 09 Jun 2022 10:28:16 +0000
Received: by outflank-mailman (input) for mailman id 344999;
 Thu, 09 Jun 2022 10:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nuio=WQ=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1nzFOf-0002CP-Va
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:28:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc4cbace-e7de-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 12:28:11 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-mZyfLHhaM-GD1Jv_Xb-K4Q-1; Thu, 09 Jun 2022 06:28:07 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8EC529AA2E7;
 Thu,  9 Jun 2022 10:28:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 935C3492C3B;
 Thu,  9 Jun 2022 10:28:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1B42E1800094; Thu,  9 Jun 2022 12:28:05 +0200 (CEST)
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
X-Inumbo-ID: dc4cbace-e7de-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654770490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gTg5vlQmIJu4b20Pu0C1H0E0ALbjaRUIwY0jnF9uY2Q=;
	b=ISsgwOrVZ+zz2ODNNFtchATqJh9iS+bwfTZ6SnXlfO3YfRWl9bk0Rlx6qIDehTfjV/He7Y
	mjDH3uWs2NtNHHlOrjmIzdSsSze2GqDt2M89WxrALk4cYA25ga0ZJuI2WsJyJKDA9LoCyH
	HHodfZ+K12ZV2UmXU09X2G2ny2C2nXM=
X-MC-Unique: mZyfLHhaM-GD1Jv_Xb-K4Q-1
Date: Thu, 9 Jun 2022 12:28:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 2/3] ui: Deliver refresh rate via QemuUIInfo
Message-ID: <20220609102805.qz2xrnd6ms6cigir@sirius.home.kraxel.org>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
 <20220226115516.59830-3-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220226115516.59830-3-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -139,6 +139,7 @@ typedef struct QemuUIInfo {
>      int       yoff;
>      uint32_t  width;
>      uint32_t  height;
> +    uint32_t  refresh_rate;
>  } QemuUIInfo;
>  
>  /* cursor data format is 32bit RGBA */
> @@ -426,7 +427,6 @@ typedef struct GraphicHwOps {
>      void (*gfx_update)(void *opaque);
>      bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
>      void (*text_update)(void *opaque, console_ch_t *text);
> -    void (*update_interval)(void *opaque, uint64_t interval);
>      void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
>      void (*gl_block)(void *opaque, bool block);
>  } GraphicHwOps;

So you are dropping update_interval, which isn't mentioned in the commit
message at all.  Also this patch is rather big.  I'd suggest:

(1) add refresh_rate
(2) update users one by one
(3) finally drop update_interval when no user is left.

thanks,
  Gerd


