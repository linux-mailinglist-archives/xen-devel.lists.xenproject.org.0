Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0323F304116
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 15:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75167.135274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PmS-0002YX-Ms; Tue, 26 Jan 2021 14:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75167.135274; Tue, 26 Jan 2021 14:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PmS-0002Y8-J7; Tue, 26 Jan 2021 14:57:20 +0000
Received: by outflank-mailman (input) for mailman id 75167;
 Tue, 26 Jan 2021 14:57:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=garG=G5=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1l4PmR-0002Y3-Qx
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 14:57:19 +0000
Received: from mail-wr1-f43.google.com (unknown [209.85.221.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85c33159-158e-47ad-b016-0f2a91b6c751;
 Tue, 26 Jan 2021 14:57:17 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id b5so16775515wrr.10
 for <xen-devel@lists.xenproject.org>; Tue, 26 Jan 2021 06:57:17 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u14sm3511919wmq.45.2021.01.26.06.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 06:57:16 -0800 (PST)
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
X-Inumbo-ID: 85c33159-158e-47ad-b016-0f2a91b6c751
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oMRD2IGlQe0VkH5NsMlo8MCUYOvYpaFDA5hfK4f4djg=;
        b=Gthsov8+ZZkSvjCsmwHQWY6DWIYBvL/i5zF7o9zuLtajt5ygwPbGaYhfnpTO6i8Z94
         spfCxm/xWykPuTd0hV0ravtNq+lemzzkUoZfcEXtqEq9R14ULtVB7W0DxHf2Opc6wdCA
         W9+65anJiNVHA5SqAUMedj4UM3w1es2Pn6vqwnx3LjJZMvsWOsdeWteeZhtRzPvY+Ia6
         yV/MLNtg4DBIxBRzjIFTn1mbM5iMI3+3cOaeje0Fo0JSUX9miK5hJ088ndozRBqUbk8Z
         UsVyMrnL+2DEX768nXbQLVa238kzYxYbpYwNk62sHxr3JjHOWfdna4MkQMAMeJKi0f3O
         7m2A==
X-Gm-Message-State: AOAM5330REzileNCO2DX6pJv1G4qF9dOQkk8nUn1vDO/R7zcDISTvIVG
	B5oDlGHZMPU9TLeI01zgJj8=
X-Google-Smtp-Source: ABdhPJw18oH4tmuy9z2F9V3xuEToq19UFYiLcSIFZ7flLsr+XdOXG/LONMS+wSMYNNeu+39F8YAJNA==
X-Received: by 2002:a5d:4402:: with SMTP id z2mr6518007wrq.265.1611673037155;
        Tue, 26 Jan 2021 06:57:17 -0800 (PST)
Date: Tue, 26 Jan 2021 14:57:15 +0000
From: Wei Liu <wei.liu@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Michal Hocko <mhocko@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Wei Yang <richard.weiyang@linux.alibaba.com>,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] mm/memory_hotplug: MEMHP_MERGE_RESOURCE ->
 MHP_MERGE_RESOURCE
Message-ID: <20210126145715.ne5m7lmnqgzn53a2@liuwe-devbox-debian-v2>
References: <20210126115829.10909-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126115829.10909-1-david@redhat.com>
User-Agent: NeoMutt/20180716

On Tue, Jan 26, 2021 at 12:58:29PM +0100, David Hildenbrand wrote:
> Let's make "MEMHP_MERGE_RESOURCE" consistent with "MHP_NONE", "mhp_t" and
> "mhp_flags". As discussed recently [1], "mhp" is our internal
> acronym for memory hotplug now.
> 
> [1] https://lore.kernel.org/linux-mm/c37de2d0-28a1-4f7d-f944-cfd7d81c334d@redhat.com/
> 
[...]
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Wei Liu <wei.liu@kernel.org>

