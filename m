Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FE42C2ED0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 18:38:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36670.68674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcGm-0000Im-Al; Tue, 24 Nov 2020 17:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36670.68674; Tue, 24 Nov 2020 17:38:24 +0000
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
	id 1khcGm-0000IJ-7P; Tue, 24 Nov 2020 17:38:24 +0000
Received: by outflank-mailman (input) for mailman id 36670;
 Tue, 24 Nov 2020 17:38:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khcGl-0000I0-5t
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:38:23 +0000
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3de8506-d005-4f14-9e38-daddd4b34fbe;
 Tue, 24 Nov 2020 17:38:22 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id l2so21559209qkf.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:38:22 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id x21sm13062842qkx.31.2020.11.24.09.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:38:21 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khcGl-0000I0-5t
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:38:23 +0000
X-Inumbo-ID: c3de8506-d005-4f14-9e38-daddd4b34fbe
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c3de8506-d005-4f14-9e38-daddd4b34fbe;
	Tue, 24 Nov 2020 17:38:22 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id l2so21559209qkf.0
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m2ZvAloMQE/4x6qZGlu4klEd6I1OFmrdg9L02bbThZY=;
        b=mQ/2SdU+idAG7rNq1qMaVxb9CR+RcWt1BHKTZWsDVy8fWCHqwJhHCvkgRkFmG5gG6l
         63dI7pIc19199ylq2PWs338wpUAaIlVHv4bO05m/1Tk1mu08D8CqxB2E3PYFAkryMgfE
         H/1POZOqIABmkG6petf6pD/3aOMnkDRssdWhk0UsaRx2ckUhxiT3bRltu9ZmDeO6w6xs
         euBOjZvBw84KJ31lUkNXglzMy/nzFsEPPBt7GRVCqAEkecyLnn3pxEkW/JpPGKSWAdFb
         ar0JpCcxfg2HCjARPmkDqdzRoKlh3PeHrwbTzFIOvsccSM84XNZBR0TOpFWESYxO6GeG
         MgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=m2ZvAloMQE/4x6qZGlu4klEd6I1OFmrdg9L02bbThZY=;
        b=BobeQLSwQsDMS8ad/SowOU/SUyLKfRhFoCHg6vk0b0F+vEIobzF5PzNsftnn6MYLkx
         eyzNi5k9DI6/VQWKCfLd6jyUfzLYHLt2Jyr37yg4heouzhj7Hw25t7MV+5BrdfaHkct7
         12W1G55WVpPqGD0qOjaGCqs+XFoPcrOi9mydh5bP6kV6aGMjDTnRruga42f1P1BMa6Ja
         8FNCaBtLNsRrgTOtgNY1EmE0wcq8onilwwxV9uzK5/Qs1XfCATXlUdOCUwS+brPUk0RF
         ahoIqW2m6ZIZcpy/0yQc3pcc6HgE+BIVYS9KIvJ/uwC0avRLJ26BFkfVkdsGRoVmjj45
         Bqrw==
X-Gm-Message-State: AOAM532S/QhgYub9r+d0sJd8lWMQSGDFqXKsDq0Man19qvZNa138/OF2
	OhhGgurfzvfPrBVWWK7i0ho=
X-Google-Smtp-Source: ABdhPJydGVRMFQ1+r3+Z46PpDtXJ8+bSnv4nPK+7aFRRl1d4ZdhaX+JqGpjWBGRDvXsi5fkaK49s7A==
X-Received: by 2002:ae9:e80d:: with SMTP id a13mr6004436qkg.140.1606239502291;
        Tue, 24 Nov 2020 09:38:22 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id x21sm13062842qkx.31.2020.11.24.09.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:38:21 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 12:37:58 -0500
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
Subject: Re: [PATCH 15/45] block: use put_device in put_disk
Message-ID: <X71E9mG4sw2WiIEj@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-16-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-16-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:21PM +0100, Christoph Hellwig wrote:
> Use put_device to put the device instead of poking into the internals
> and using kobject_put.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

