Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A74F8B8E79
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 18:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715358.1116922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2D8O-0005Bm-C5; Wed, 01 May 2024 16:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715358.1116922; Wed, 01 May 2024 16:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2D8O-00058Z-8s; Wed, 01 May 2024 16:48:44 +0000
Received: by outflank-mailman (input) for mailman id 715358;
 Wed, 01 May 2024 16:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=93GK=ME=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1s2D8N-00058D-P9
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 16:48:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9d02b9d-07da-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 18:48:41 +0200 (CEST)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-mmJZd0p4NIaR1-oHJiddWQ-1; Wed, 01 May 2024 12:48:38 -0400
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-43a3632d56aso28221481cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 09:48:38 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 h2-20020ac85142000000b00439a1bdb6e5sm9468549qtn.17.2024.05.01.09.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 09:48:37 -0700 (PDT)
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
X-Inumbo-ID: a9d02b9d-07da-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714582120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W0rqb1II+fEQyts8xj8PiGw705f1XoyimiMNElU/2to=;
	b=HpvsD0Sn4IBb18Chv6mlys3QLv3az7QhlQg6grvlcG/hXKt9eSHT2ZR+LPtBnzhq+KxHsW
	+PcnlVuj6Z24N4APt1vmkUMksEUBY04jrA1VVLMY+zIjcqYNqbhtnaSUTckyNZqBrgMsZi
	GYBmC6THB3YbuATJOlJ6bVXR6+9yaa8=
X-MC-Unique: mmJZd0p4NIaR1-oHJiddWQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714582118; x=1715186918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0rqb1II+fEQyts8xj8PiGw705f1XoyimiMNElU/2to=;
        b=ARKZ815GC3OvDFfTgCV0sbn3PX2bTvYh3OO1weIgdyRb92hTA9ZfnQD7ObWgST5mz5
         NNyw/nBZV8RjJ3YC5UKRghxD7TBHIhnUQJip3iTqb9zGRF3AYrDeDTLz0jtJ8KwTsdOr
         mEcv0Uyd+EfG2dQt2Kxi49YAk6cI3grzhJy5QLx6QeMgdt9WGkPrj59dYNwAfdnn+OpQ
         xI8bs4i7LZ1hJUqSPuOotBlPUXcYxGK4OhLj+/LZ53XZLbN2wL5hWUH8kL7X3zfHGmy8
         X0SUpnso9iONH2sa6IOGTo4GP9IZK/H3ydjdjlTAQ+YLD6JdTklHQnC2+buQZbGESISM
         Ztyg==
X-Forwarded-Encrypted: i=1; AJvYcCUtSR4I3yZvbNIk3T6K1bruIUFhVw96QwhMAI+7nsOSe7UnCCSeh3LMJ7O6lPyuUJhH7bclsJfOUUYAK9ZtAg93mCFsvoDEZkDHPdCgnaY=
X-Gm-Message-State: AOJu0YwqN18675Lym3XFR80Mm8Viuf+t3dnc2SaypMJQFo3L6C2jm1eC
	vJhjb0pJV8r3RL7V7LGLONPNSZSTOzDRBNo3FKsu0fQGg967W4kOpDe7z2LP0DKrch0/RdBpWvf
	K667Rj+Stw9kG1tvX+pchOMal0kql1I59tW4u+D5BtZAOxuhpPknr1jQd/Iqcy8Mr
X-Received: by 2002:a05:622a:454:b0:43b:e8:3858 with SMTP id o20-20020a05622a045400b0043b00e83858mr3335557qtx.5.1714582118200;
        Wed, 01 May 2024 09:48:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlczwLQ1ydCbZMNGW1G2sQPdaOKLA7HRYhsgku2nl0OuzRoK0kJ+YcZfu1hxBiGpLYl+M3KQ==
X-Received: by 2002:a05:622a:454:b0:43b:e8:3858 with SMTP id o20-20020a05622a045400b0043b00e83858mr3335525qtx.5.1714582117703;
        Wed, 01 May 2024 09:48:37 -0700 (PDT)
Date: Wed, 1 May 2024 12:48:35 -0400
From: Peter Xu <peterx@redhat.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 13/17] softmmu: Pass RAM MemoryRegion and is_write
 xen_map_cache()
Message-ID: <ZjJyYzr-Qq9Y71BM@x1n>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-14-edgar.iglesias@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240430164939.925307-14-edgar.iglesias@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 30, 2024 at 06:49:35PM +0200, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Propagate MR and is_write to xen_map_cache().
> This is in preparation for adding support for grant mappings.
> 
> No functional change.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


