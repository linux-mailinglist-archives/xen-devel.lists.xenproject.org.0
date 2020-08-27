Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4BD2542E4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 11:58:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBEfb-0001al-1U; Thu, 27 Aug 2020 09:58:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBEfZ-0001ag-8A
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 09:58:09 +0000
X-Inumbo-ID: deb14f6a-86d9-41fe-90bc-b90d97ca4ea5
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id deb14f6a-86d9-41fe-90bc-b90d97ca4ea5;
 Thu, 27 Aug 2020 09:58:08 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u18so4584422wmc.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 02:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FOtlDCQHT6j6+ViWTgHo9Sf5zwbDPOGTr7HqdGKPk+s=;
 b=hgjbMHqAElhfut09w3UuUeMTlSbc/GrTFmJGKpeRmywc1SmhCUgVSU8mVCRhX9oK/A
 D+CHasFAhdMTvOJ+mvsfI3NN8aw749eQlUU+dsWYPMCzIC30h8DJgiQ7Z+D3Rs7GZYVP
 v0yAyDvfBHegqzx7bmpD9ZYOjO/Lyt86SjcHAWi4s44Is93PjH7cejFWSQdoKaVc6edp
 DYfa9s7ZM+yaqmVdBLfUblpgd7XnX1lln/0qWDutazdyyT3truJp7MD7of9zd1L6ExQe
 A+SKp94HumQ5asX+7fOGPENOr9NswuxFkZ77Lzo43EcFX+/9a/CEs/8+Aizi8PK/AxVP
 FhDQ==
X-Gm-Message-State: AOAM532dmTrD0pEHuQ5eaQCH2M1tAAaO7a4IJ2KXXR06+jh9cZz53yi8
 WOYAqd8H5JYIQoQtl6FLkAM=
X-Google-Smtp-Source: ABdhPJzD8nvzr/Y4AfqLjsiMTjMO/WH9BTZunrUmfZsXngTPizWIIFyerSjE8K9etnmnQuLFTn3QQg==
X-Received: by 2002:a1c:c913:: with SMTP id f19mr10690853wmb.173.1598522287312; 
 Thu, 27 Aug 2020 02:58:07 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id k11sm4813297wrq.85.2020.08.27.02.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 02:58:06 -0700 (PDT)
Date: Thu, 27 Aug 2020 09:58:05 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 0/8] tools: propogate MTU to vif frontends
Message-ID: <20200827095805.6mg3oolt5s246mku@liuwe-devbox-debian-v2>
References: <20200811080202.31163-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811080202.31163-1-paul@xen.org>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 11, 2020 at 09:01:54AM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This is an expansion from v2 of the series to include the facility to set
> the MTU in the vif config.
> 
> There is also one cleanup patch to remove the defunct 'vif2' script.
> 
> Paul Durrant (8):
>   public/io/netif: specify MTU override node
>   tools/hotplug/Linux: re-factor add_to_bridge() in
>     xen-network-common.sh
>   tools/hotplug/Linux: add remove_from_bridge()
>   tools/hotplug/Linux: remove code duplication in vif-bridge
>   libxl: wire the libxl_device_nic 'mtu' value into xenstore
>   tools/hotplug/Linux: modify set_mtu() to optionally use a configured
>     value...
>   xl: add 'mtu' option to network configuration
>   remove netchannel2 hotplug script... ancient history
> 

Patches 2 - 8:
Acked-by: Wei Liu <wl@xen.org>

(I already acked patch 1)

