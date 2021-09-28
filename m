Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2971E41A737
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 07:40:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197494.350568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV5qQ-0008Uh-EY; Tue, 28 Sep 2021 05:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197494.350568; Tue, 28 Sep 2021 05:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV5qQ-0008RX-Aj; Tue, 28 Sep 2021 05:39:58 +0000
Received: by outflank-mailman (input) for mailman id 197494;
 Tue, 28 Sep 2021 05:39:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tiex=OS=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1mV5qP-0008RP-Aq
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 05:39:57 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e31740fb-978c-4aa5-ba91-342dbd110875;
 Tue, 28 Sep 2021 05:39:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C7BD201BB;
 Tue, 28 Sep 2021 05:39:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB01913A98;
 Tue, 28 Sep 2021 05:39:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JO5JKKqqUmHUNQAAMHmgww
 (envelope-from <hare@suse.de>); Tue, 28 Sep 2021 05:39:54 +0000
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
X-Inumbo-ID: e31740fb-978c-4aa5-ba91-342dbd110875
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1632807595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=13TnURwhS8h4t01lwoZLD/d/5oPL9agrfycanDfeTRQ=;
	b=PT9kgFrx9DkgIx21N+ey4rvrG+p5lgzclkflex7M8ulg7b/MPe/8YBUPSSqsTo2GTahbjJ
	Gey5RuOSF1hNpbYAFgKbf2oL0K4d67fdRAt+eRdY+iU4RsWpBKefK/X7oBdujgebC7iQbz
	cH9ujOHUnez6nwSvlDTdjkQYCRSdxBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1632807595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=13TnURwhS8h4t01lwoZLD/d/5oPL9agrfycanDfeTRQ=;
	b=VnyBApxFuoR87JCq7TgLnoYycKzbt1M/1osAF+bIrqg5sP1C+l/tWJFxYA8+084TxkpCY5
	Hr8IhCD3XymifdAw==
Subject: Re: [PATCH v2 03/10] nvme-multipath: add error handling support for
 add_disk()
To: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk, colyli@suse.de,
 kent.overstreet@gmail.com, kbusch@kernel.org, sagi@grimberg.me,
 vishal.l.verma@intel.com, dan.j.williams@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, konrad.wilk@oracle.com, roger.pau@citrix.com,
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 minchan@kernel.org, ngupta@vflare.org, senozhatsky@chromium.org
Cc: xen-devel@lists.xenproject.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210927220039.1064193-1-mcgrof@kernel.org>
 <20210927220039.1064193-4-mcgrof@kernel.org>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <85d33b80-1d54-67ba-47f9-0298093b6d80@suse.de>
Date: Tue, 28 Sep 2021 07:39:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210927220039.1064193-4-mcgrof@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/28/21 12:00 AM, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
> 
> Since we now can tell for sure when a disk was added, move
> setting the bit NVME_NSHEAD_DISK_LIVE only when we did
> add the disk successfully.
> 
> Nothing to do here as the cleanup is done elsewhere. We take
> care and use test_and_set_bit() because it is protects against
> two nvme paths simultaneously calling device_add_disk() on the
> same namespace head.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>   drivers/nvme/host/multipath.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
> index e8ccdd398f78..35cace4f3f5f 100644
> --- a/drivers/nvme/host/multipath.c
> +++ b/drivers/nvme/host/multipath.c
> @@ -496,13 +496,22 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
>   static void nvme_mpath_set_live(struct nvme_ns *ns)
>   {
>   	struct nvme_ns_head *head = ns->head;
> +	int rc;
>   
>   	if (!head->disk)
>   		return;
>   
> +	/*
> +	 * test_and_set_bit() is used because it is protecting against two nvme
> +	 * paths simultaneously calling device_add_disk() on the same namespace
> +	 * head.
> +	 */
>   	if (!test_and_set_bit(NVME_NSHEAD_DISK_LIVE, &head->flags)) {
> -		device_add_disk(&head->subsys->dev, head->disk,
> -				nvme_ns_id_attr_groups);
> +		rc = device_add_disk(&head->subsys->dev, head->disk,
> +				     nvme_ns_id_attr_groups);
> +		if (rc)
> +			return;
> +		set_bit(NVME_NSHEAD_DISK_LIVE, &head->flags);
>   		nvme_add_ns_head_cdev(head);
>   	}
>   
> Errm.
Setting the same bit twice?
And shouldn't you unset the bit if 'device_add_disk()' fails?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

