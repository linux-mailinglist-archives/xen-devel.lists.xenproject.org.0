Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C93341A2C8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 00:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197274.350301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUysC-0000in-Ko; Mon, 27 Sep 2021 22:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197274.350301; Mon, 27 Sep 2021 22:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUysC-0000h0-Hu; Mon, 27 Sep 2021 22:13:20 +0000
Received: by outflank-mailman (input) for mailman id 197274;
 Mon, 27 Sep 2021 22:13:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v5uC=OR=kernel.org=kbusch@srs-us1.protection.inumbo.net>)
 id 1mUysA-0000gt-Ut
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 22:13:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1df77b4a-1fe0-11ec-bc5f-12813bfff9fa;
 Mon, 27 Sep 2021 22:13:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 014C460F94;
 Mon, 27 Sep 2021 22:13:14 +0000 (UTC)
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
X-Inumbo-ID: 1df77b4a-1fe0-11ec-bc5f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632780797;
	bh=aUkvMSo84Ts+2hyfPmGVIgM4abSwV67b0JY7DU1pVzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CR3ThJMTzNN7IxGCoQ9SihnqkQkkv3F41YJaAr67klqD8ay7cRcSeppUUhh/8+7PQ
	 DFxOyaBzoI962F2usbjfziq1easTinlTyXoLnTwCKEIgdylqvj9h8QEVuaeDIXyhCf
	 8pRA7I8t7831enPRtpE/358VVKwNsUwrPG5b/lRH5qyH1IXU821Yn+C1LYzW65TQiM
	 Kr2pNyLsYwmCCd+A88QwrYslEh5QjuzWUx1TBVYz6/tBtiRBBMVllLOKUI3Il17WX7
	 FhuTQ1Q9A8S1JL3ILSV0TNBfSOS3l81jmsFCnMM1Pvg1VT7bDaBh2KmwsWKeTC3U9m
	 OIVZBum14ZcHw==
Date: Mon, 27 Sep 2021 15:13:12 -0700
From: Keith Busch <kbusch@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: axboe@kernel.dk, colyli@suse.de, kent.overstreet@gmail.com,
	sagi@grimberg.me, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, dave.jiang@intel.com, ira.weiny@intel.com,
	konrad.wilk@oracle.com, roger.pau@citrix.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	minchan@kernel.org, ngupta@vflare.org, senozhatsky@chromium.org,
	xen-devel@lists.xenproject.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] nvme-multipath: add error handling support for
 add_disk()
Message-ID: <20210927221312.GD387558@dhcp-10-100-145-180.wdc.com>
References: <20210927220039.1064193-1-mcgrof@kernel.org>
 <20210927220039.1064193-4-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927220039.1064193-4-mcgrof@kernel.org>

On Mon, Sep 27, 2021 at 03:00:32PM -0700, Luis Chamberlain wrote:
> +	/*
> +	 * test_and_set_bit() is used because it is protecting against two nvme
> +	 * paths simultaneously calling device_add_disk() on the same namespace
> +	 * head.
> +	 */
>  	if (!test_and_set_bit(NVME_NSHEAD_DISK_LIVE, &head->flags)) {
> -		device_add_disk(&head->subsys->dev, head->disk,
> -				nvme_ns_id_attr_groups);
> +		rc = device_add_disk(&head->subsys->dev, head->disk,
> +				     nvme_ns_id_attr_groups);
> +		if (rc)
> +			return;
> +		set_bit(NVME_NSHEAD_DISK_LIVE, &head->flags);

No need to set_bit() here since the test_and_set_bit() already took care
of that.

