Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5992C48EE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 21:20:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38048.70661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki1GL-0004mu-Jv; Wed, 25 Nov 2020 20:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38048.70661; Wed, 25 Nov 2020 20:19:37 +0000
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
	id 1ki1GL-0004mV-GI; Wed, 25 Nov 2020 20:19:37 +0000
Received: by outflank-mailman (input) for mailman id 38048;
 Wed, 25 Nov 2020 20:19:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xEKP=E7=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1ki1GJ-0004mQ-JD
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 20:19:35 +0000
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92e952cb-6981-4854-aa53-d58b0626613c;
 Wed, 25 Nov 2020 20:19:34 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u4so5902611qkk.10
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 12:19:34 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id w54sm446145qtb.0.2020.11.25.12.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 12:19:33 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xEKP=E7=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1ki1GJ-0004mQ-JD
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 20:19:35 +0000
X-Inumbo-ID: 92e952cb-6981-4854-aa53-d58b0626613c
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 92e952cb-6981-4854-aa53-d58b0626613c;
	Wed, 25 Nov 2020 20:19:34 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u4so5902611qkk.10
        for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 12:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wTpG1f7I5Mn7omq14ZEE1b1D1RGafIOA8Nh3enwy9Pw=;
        b=dhUspYM1wMwx4g0p349xFh+cvmkFpUHO1fMAZy5dL/oqd7kSU1ym0YtWGCwe2K5BNw
         aVwhhCckrBdx67CbATI/FFwUOrbyBQxEavleHAqEAzxG3D9N0conr/HIspxr9fzB6SfX
         i43+lRwnKCGUgJA9cRAA9Ia9ro51DDhqCV8/s5EXlHTEJAjPYAn71BuXgNVEaOWGHhM5
         mSZeoeXij9s0EAWe8DhLGkPD+d8qJ0w9uk4zhr+1KpPzvTLi317obMTNtjWvqw22AAjn
         KI0qVXs/lejTVRHvWB2yfTW87bz2pPoM76U/jKdBe6vlpVASMEZRlI5rvHT10TKYbrfB
         7MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=wTpG1f7I5Mn7omq14ZEE1b1D1RGafIOA8Nh3enwy9Pw=;
        b=SF+j8vK5ty6igRsgEtPFQFYE6X7zIdcqdjG/s/CrnsFpqcJqp4kg3c0V3azAyQyGgH
         ox55Fa9dqPHrAB0OEvwnMzXjFlnLuu1xQAA4Hb/IGD+8FY/K07gj7JJBsT7xXeOgytY2
         QnbnWw//SqWCnGokst39nIJ6PCjZrQ2Au4cJeAjJous6sjfv8h5H6KLRT6MM2Q3Cit8U
         i7M5lt5WLXyDIhoxhtZ6g64Nag0OVb4+NTMsTJVxYzNqazH6L0TtX08XSrXUSPUZ/Qho
         RuIsHb11iM2S2l0/WzAc5o1iCfmVQI0d+U8Fyt/POIggt6z+9KRZ6agX60nW56EQERMV
         X+LA==
X-Gm-Message-State: AOAM5336VEPg4jXZG0rtmrd0HBjCh7habREQLWRXRIQ7izSU+KIGmfqL
	8sImAnS3UuEdg87CJ+eAJwM=
X-Google-Smtp-Source: ABdhPJzv1jmYfISttH52Qv7X3ML12jiaN/y3FPvYZps3l/Q0JJ9ycbQ/3m35eYW3aCrzEXDwhiCBYw==
X-Received: by 2002:a37:4796:: with SMTP id u144mr656941qka.235.1606335573858;
        Wed, 25 Nov 2020 12:19:33 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id w54sm446145qtb.0.2020.11.25.12.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 12:19:33 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 25 Nov 2020 15:19:10 -0500
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
Subject: Re: [PATCH 23/45] block: remove i_bdev
Message-ID: <X768PnFhrPtJk4U5@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-24-hch@lst.de>
 <X71g4Tm+3RiRg4Gf@mtj.duckdns.org>
 <20201125162926.GA1024@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125162926.GA1024@lst.de>

Hello,

On Wed, Nov 25, 2020 at 05:29:26PM +0100, Christoph Hellwig wrote:
> > I was wondering whether losing the stale bdev flushing in bd_acquire() would
> > cause user-visible behavior changes but can't see how it would given that
> > userland has no way of holding onto a specific instance of block inode.
> > Maybe it's something worth mentioning in the commit message?
> 
> With stale bdev flushing do you mean the call to bd_forget if
> i_bdev exists but is unhashed?  It doesn't actually flush anything but

Yeah.

> just detaches the old bdev from the inode so that the new one can be
> attached.  That problem goes away by definition if we don't attach
> the bdev to the inode.

Yeah, I think so. Was just wondering whether the problem actually goes away.

Thanks.

-- 
tejun

