Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4E3FA3B8
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 06:36:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174017.317799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJq3M-0003bZ-9D; Sat, 28 Aug 2021 04:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174017.317799; Sat, 28 Aug 2021 04:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJq3M-0003Zm-5v; Sat, 28 Aug 2021 04:34:48 +0000
Received: by outflank-mailman (input) for mailman id 174017;
 Fri, 27 Aug 2021 20:29:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/OcF=NS=kernel.org=kbusch@srs-us1.protection.inumbo.net>)
 id 1mJiTq-0007xt-3l
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 20:29:38 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f0002fa-0775-11ec-ab0e-12813bfff9fa;
 Fri, 27 Aug 2021 20:29:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 977CB60FD8;
 Fri, 27 Aug 2021 20:29:34 +0000 (UTC)
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
X-Inumbo-ID: 7f0002fa-0775-11ec-ab0e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630096176;
	bh=88bih5eGKB9i2ESLsafMWzYIwyGke7MVW8Rm8LZaCJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VqgAkXLSFQ2s8YBhV0/BkRbyvjYS7iN8wS3+vPnrfYwjeVZbT3EcOkpsbz+6iOIIg
	 K59JPqJADG5mnk2BZMwXfm+2K/QX3GabYmGmJMq75CAhfxkg4e7sYb4W90iqXt4wjY
	 CCBcmFMkK/fitfaaSpE06RYuhbvQkR1xSjgZLyqV+ldHSk85VfL/sYK3yuWYBDlle0
	 4C9yBY22Kb164kHW1308QMn1cbMYjo7ekT+NZW9nIbbZyeN7dvOl3QZ8uGzlQBiwYO
	 xvNRlNxn6B/Q+DSji3QgnHGBcKriUM+BPc6qVP1hIdIo6lvljcLrqIlc4i6mgmBrgk
	 KvuManA4RC1Fw==
Date: Fri, 27 Aug 2021 13:29:32 -0700
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
Subject: Re: [PATCH 03/10] nvme-multipath: add error handling support for
 add_disk()
Message-ID: <20210827202932.GA82376@dhcp-10-100-145-180.wdc.com>
References: <20210827191809.3118103-1-mcgrof@kernel.org>
 <20210827191809.3118103-4-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827191809.3118103-4-mcgrof@kernel.org>

On Fri, Aug 27, 2021 at 12:18:02PM -0700, Luis Chamberlain wrote:
> @@ -479,13 +479,17 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
>  static void nvme_mpath_set_live(struct nvme_ns *ns)
>  {
>  	struct nvme_ns_head *head = ns->head;
> +	int rc;
>  
>  	if (!head->disk)
>  		return;
>  
> -	if (!test_and_set_bit(NVME_NSHEAD_DISK_LIVE, &head->flags)) {
> -		device_add_disk(&head->subsys->dev, head->disk,
> -				nvme_ns_id_attr_groups);
> +	if (!test_bit(NVME_NSHEAD_DISK_LIVE, &head->flags)) {

This should still be test_and_set_bit() because it is protecting against
two nvme paths simultaneously calling device_add_disk() on the same
namespace head.

> +		rc = device_add_disk(&head->subsys->dev, head->disk,
> +				     nvme_ns_id_attr_groups);
> +		if (rc)
> +			return;
> +		set_bit(NVME_NSHEAD_DISK_LIVE, &head->flags);
>  		nvme_add_ns_head_cdev(head);
>  	}

