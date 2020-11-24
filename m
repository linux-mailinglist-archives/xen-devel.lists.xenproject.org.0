Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A28902C2EB9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 18:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36650.68625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcFb-0008HX-WA; Tue, 24 Nov 2020 17:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36650.68625; Tue, 24 Nov 2020 17:37:11 +0000
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
	id 1khcFb-0008H8-Sm; Tue, 24 Nov 2020 17:37:11 +0000
Received: by outflank-mailman (input) for mailman id 36650;
 Tue, 24 Nov 2020 17:37:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khcFa-0008H3-QW
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:37:10 +0000
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bea408ea-7ccf-4717-889a-69e4a342fa7c;
 Tue, 24 Nov 2020 17:37:10 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id l7so10370225qtp.8
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:37:10 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id 137sm13319731qkj.109.2020.11.24.09.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:37:08 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khcFa-0008H3-QW
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:37:10 +0000
X-Inumbo-ID: bea408ea-7ccf-4717-889a-69e4a342fa7c
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bea408ea-7ccf-4717-889a-69e4a342fa7c;
	Tue, 24 Nov 2020 17:37:10 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id l7so10370225qtp.8
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RUiSFwuqBx5Z5RkIMV/LAo3IZ2wMWa1pe8Bi01kcv9s=;
        b=I/ritBavAlEmXZYTdxsCZ3TKkeS+XbD2T5fSeuu+WAKjEs5fvGA2bMQkLo5MtRefva
         qUl8yUxkVj+bBWUkgYhVfKpDhiO82hph16AQ0vGX7y+wlrcH9EWYcgfJQ+ri5yzcT/jj
         ur3RBED4twIKVJJFDo/q0nmklKouT/Ot6KY5VSp33Mrn+/sIul4sQvPJjUYsLJ8PVoUi
         uTUrhLlViP7uzPXo9Qlf/lrWs/mwSY/bN6T+YIT4kadfNOZMSiRbHdqwLGtEwY2FNG+a
         TyAacskIalN0dBCzTDwuIzKGsDgNK5Z2Dd7niqvvN6G5G9OXmjSjKHmLzT22iYm6LIXb
         z2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=RUiSFwuqBx5Z5RkIMV/LAo3IZ2wMWa1pe8Bi01kcv9s=;
        b=daUtIgpBr7ZDZVQhyvUf30QydLeTr9imJ5cZYKLrv/8D04BI0cWLLCk1/b0bajNqW1
         5/wp/QsEmWG0dmCy4RxgXGcqLoRgt1y/wEw0VcaBfITZlGPG0G06ODAjliDkttt6ZiXx
         u8bftj7XhSBIPpSq2aNRua6rjRJKJSbO/sw9p5Iwd6AJ4HX33KvLDW4RIZOWgaNk4V/k
         W2s1G8L9bCwLHDTDYNDMri99xYfbcWPAfdNovMMC8kQmprHfyN3jcbidSXhdZziz+XhL
         nUbMCL8XhtuwSO+75dXbDeC+I+mNGWSULKEdTQbYaRk63MfXJBN41bvCTIv8TKCT4POO
         sfSw==
X-Gm-Message-State: AOAM533xJ3bZ1B6xMeBZ7Va0Na1jegrzn4asJzpJpMnf65aS7N4z0M18
	eOCVzDW4pRZBPzs3NJRc6GU=
X-Google-Smtp-Source: ABdhPJzns9py3D52IrNBrxEn0rk+MGg8bhauWe2r/6sVRsp+lUoI9EtR7DOBSR7jcCHuxmdt3gs4iQ==
X-Received: by 2002:ac8:4802:: with SMTP id g2mr5435506qtq.235.1606239429633;
        Tue, 24 Nov 2020 09:37:09 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id 137sm13319731qkj.109.2020.11.24.09.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:37:08 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 12:36:46 -0500
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
Subject: Re: [PATCH 11/45] block: remove a duplicate __disk_get_part prototype
Message-ID: <X71ErqPWQu+CvXRI@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-12-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-12-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:17PM +0100, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

