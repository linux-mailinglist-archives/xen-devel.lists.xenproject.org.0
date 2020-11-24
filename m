Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A06DA2C2ED3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 18:38:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36681.68686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcH7-0000RH-Lh; Tue, 24 Nov 2020 17:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36681.68686; Tue, 24 Nov 2020 17:38:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcH7-0000Qp-Hc; Tue, 24 Nov 2020 17:38:45 +0000
Received: by outflank-mailman (input) for mailman id 36681;
 Tue, 24 Nov 2020 17:38:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khcH6-0000Ng-07
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:38:44 +0000
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id accd4014-829b-4220-bea6-1c47a85ed49f;
 Tue, 24 Nov 2020 17:38:39 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id i199so8038257qke.5
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:38:39 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id s7sm13183950qkm.124.2020.11.24.09.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:38:38 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khcH6-0000Ng-07
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:38:44 +0000
X-Inumbo-ID: accd4014-829b-4220-bea6-1c47a85ed49f
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id accd4014-829b-4220-bea6-1c47a85ed49f;
	Tue, 24 Nov 2020 17:38:39 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id i199so8038257qke.5
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g4LY6zleEye3uEtWn8BHkQWiPOUg2vGvLOmcGW0MhEo=;
        b=b7LkmYjxPrHR9TH3nlGv8RR4yt2n5LXnfymO+2DyzzU25nyOq3KZcwcvGjHXs52rxS
         +2ZXS0GcpcERn/nD7GKubAB3+B2PcUxizzfKAr8S2K2+IhWzgsJmU4g5HL09fBRhhrfd
         O9DxlLMUUmPA8UQ1XMZvrQyWKKdOK7UwZVw5EW2mNWCI7GBjN/XmPhbk3TYX7y+MWxjO
         swjqQPApTPanWu4qovGXQq//Y6ENdGy9PdgI17eJIoJsi/+bV6r0YDHFS6xz5gpMJ5IK
         uIvwIkKQlKgUDmgdCif0kTpOaJ/NZcVJOzZhxhpZTTstgSJmyH2+hiJsrfoAgMEwi33G
         0McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=g4LY6zleEye3uEtWn8BHkQWiPOUg2vGvLOmcGW0MhEo=;
        b=GvZG3Bw1dprskT1vpwBrbB+i/9m9k//AJhVZvvwK7Z6HG/nikJy/XbXxwJxttVmFIP
         sKrWoHc0x3HfC0IaHWmSznktO+GprxI/xuUk8w/xeLpG6wJ4QIdyHFvPJ6eU1iNb/PHQ
         k1anXlOb4L5VdpEyGIjPH4Ktp2b0posxKiNDDxhK+yeRCTfZBty+paPIZfoYFAIn49q1
         YPZ0ZPHLnizl225m8ewOrlZMvrueZ9AwYZOsNaj6+JJhKnTyH59+eaMtkfsgPlp8xvFo
         +F7//31t1hEFjxNf+BgkLn+AY6ZU4pU42P4Qz8vOu63CviYR1rXuPlJyWjR5MWWgWItG
         7liA==
X-Gm-Message-State: AOAM533EEUPQ+KDoQ3J0IOMTbyPsaTcV+S+vwyEDqIYYB1ADP+dPrFhm
	VSbBNywM/Nz6IkwjmY4cTvE=
X-Google-Smtp-Source: ABdhPJw43+aOSAPykQeYdeX4DmgWRqK+CIO4uPy4u98lyqJL8LkKiYWD+c6leseDOSmCa64pRPr2xg==
X-Received: by 2002:a37:e40b:: with SMTP id y11mr5925723qkf.29.1606239519064;
        Tue, 24 Nov 2020 09:38:39 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id s7sm13183950qkm.124.2020.11.24.09.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:38:38 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 12:38:16 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 16/45] block: change the hash used for looking up block
 devices
Message-ID: <X71FCKpLZLywTTT8@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-17-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-17-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:22PM +0100, Christoph Hellwig wrote:
> Adding the minor to the major creates tons of pointless conflicts. Just
> use the dev_t itself, which is 32-bits and thus is guaranteed to fit
> into ino_t.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

