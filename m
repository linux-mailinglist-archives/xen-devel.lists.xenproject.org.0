Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E1D8D2FF6
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731609.1137205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCELx-0003BK-4P; Wed, 29 May 2024 08:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731609.1137205; Wed, 29 May 2024 08:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCELx-00039S-1q; Wed, 29 May 2024 08:08:09 +0000
Received: by outflank-mailman (input) for mailman id 731609;
 Wed, 29 May 2024 08:08:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZuD=NA=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sCELv-00039M-BM
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:08:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9219fb80-1d92-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 10:08:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 34657CE17E7;
 Wed, 29 May 2024 08:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775ACC2BD10;
 Wed, 29 May 2024 08:07:54 +0000 (UTC)
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
X-Inumbo-ID: 9219fb80-1d92-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716970076;
	bh=03smAZVJ+ZngbkLzugn+0eqk3vVwA0F29enlttGAPng=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bpShr1IttagkOMnjhsCdo/g2zCZdY/J9hEgnQoOTkwd/TZHIkKASoDSf8+3m+pnEU
	 5dgEnznMnW+pmlqrkv7jTaUFTY8kya1x2kUeM5RGbZFNTb0NPcdTvktgyScpIfQiJz
	 9SYMygauOoY+shIGTFDnwWQBHpng4+D37VR3bFWoOFjpfjsD6ALyH7jGpvSUfQiild
	 6MYzCPhcHg2QsVviU+udRgGt0N3LKskHM5NeZnp90eaxAQpCTzBcjNqXPPgoNsWukV
	 tC4NqjBN6Q6n3ZjWDlVJ+cmaEz8hv6lMBRlGWijOn043mJOWWcO86EQJdQiEIrkwsT
	 sU1UkJ18oQYDg==
Message-ID: <24cad983-a1a0-4983-989d-79bcc9fd8a0a@kernel.org>
Date: Wed, 29 May 2024 17:07:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] sd: simplify the ZBC case in
 provisioning_mode_store
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Josef Bacik
 <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
References: <20240529050507.1392041-1-hch@lst.de>
 <20240529050507.1392041-4-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/24 14:04, Christoph Hellwig wrote:
> Don't reset the discard settings to no-op over and over when a user
> writes to the provisioning attribute as that is already the default
> mode for ZBC devices.  In hindsight we should have made writing to
> the attribute fail for ZBC devices, but the code has probably been
> around for far too long to change this now.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/scsi/sd.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> index 3dff9150ce11e2..15d0035048d902 100644
> --- a/drivers/scsi/sd.c
> +++ b/drivers/scsi/sd.c
> @@ -461,14 +461,13 @@ provisioning_mode_store(struct device *dev, struct device_attribute *attr,
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EACCES;
>  
> -	if (sd_is_zoned(sdkp)) {
> -		sd_config_discard(sdkp, SD_LBP_DISABLE);
> -		return count;
> -	}
> -
>  	if (sdp->type != TYPE_DISK)
>  		return -EINVAL;
>  
> +	/* ignore the proivisioning mode for ZBB devices */

s/proivisioning/provisioning
s/ZBB/ZBC

With that fixed,

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> +	if (sd_is_zoned(sdkp))
> +		return count;
> +
>  	mode = sysfs_match_string(lbp_mode, buf);
>  	if (mode < 0)
>  		return -EINVAL;

-- 
Damien Le Moal
Western Digital Research


