Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C66528D3BB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 20:37:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6358.16916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSPAV-0000CG-7z; Tue, 13 Oct 2020 18:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6358.16916; Tue, 13 Oct 2020 18:37:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSPAV-0000Bp-4m; Tue, 13 Oct 2020 18:37:03 +0000
Received: by outflank-mailman (input) for mailman id 6358;
 Tue, 13 Oct 2020 18:37:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIOr=DU=fluxnic.net=nico@srs-us1.protection.inumbo.net>)
 id 1kSPAT-0000B8-6Y
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 18:37:01 +0000
Received: from pb-sasl-trial2.pobox.com (unknown [64.147.108.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8baad28-1d41-4efd-9377-84e8985dd080;
 Tue, 13 Oct 2020 18:36:59 +0000 (UTC)
Received: from pb-sasl-trial2.pobox.com (localhost.local [127.0.0.1])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id B35092F08C;
 Tue, 13 Oct 2020 14:36:58 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from pb-smtp1.nyi.icgroup.com (pb-smtp1.pobox.com [10.90.30.53])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id 7910C2F08B;
 Tue, 13 Oct 2020 14:36:58 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id CD98F955F4;
 Tue, 13 Oct 2020 14:36:57 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id CF7492DA0BC7;
 Tue, 13 Oct 2020 14:36:56 -0400 (EDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zIOr=DU=fluxnic.net=nico@srs-us1.protection.inumbo.net>)
	id 1kSPAT-0000B8-6Y
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 18:37:01 +0000
X-Inumbo-ID: d8baad28-1d41-4efd-9377-84e8985dd080
Received: from pb-sasl-trial2.pobox.com (unknown [64.147.108.86])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d8baad28-1d41-4efd-9377-84e8985dd080;
	Tue, 13 Oct 2020 18:36:59 +0000 (UTC)
Received: from pb-sasl-trial2.pobox.com (localhost.local [127.0.0.1])
	by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id B35092F08C;
	Tue, 13 Oct 2020 14:36:58 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
	:cc:subject:in-reply-to:message-id:references:mime-version
	:content-type; s=sasl; bh=1qdRcPgrMg9PaaTRWeHMHkWBgn4=; b=Epy+q5
	ans9ahJwXxlQvxdjICPrBYTo3ECIn9AzWxzmuo835zX7Go5RA+la+QVdJswbYHqY
	OA9uOWP+RHqwo1f/1Hjwskkbh9itwsmr5IKrZUme2Q4YRp5bQABuumhmd/Yh0NKM
	sMhZUgbkZQs79wJJn2wtIPZ7EN0v5uRSG8bTQ=
Received: from pb-smtp1.nyi.icgroup.com (pb-smtp1.pobox.com [10.90.30.53])
	by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id 7910C2F08B;
	Tue, 13 Oct 2020 14:36:58 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=/xoWviDLFg5PKRQ9rObRWDXVC++pmZtYhfbDb0DFq7E=; b=v5OoWtflZD131TYsBl2A9g0L/PCRe2nu6sy2IJY2ys8stI3sGPGydjk9hbVpZeTUKIjemrnRhLwKFlAM+dXEIGXz5t0LfwSiRA8m7hrB4WLH79+9F2ww8ICEhYu0fLjFgoDc1lKWqG4ZKNRDYjtbn/p6CJBipu1Te7ZvLuk/HMw=
Received: from yoda.home (unknown [24.203.50.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id CD98F955F4;
	Tue, 13 Oct 2020 14:36:57 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
	by yoda.home (Postfix) with ESMTPSA id CF7492DA0BC7;
	Tue, 13 Oct 2020 14:36:56 -0400 (EDT)
Date: Tue, 13 Oct 2020 14:36:56 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Ira Weiny <ira.weiny@intel.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, 
    Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    Dan Williams <dan.j.williams@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-nvdimm@lists.01.org, linux-fsdevel@vger.kernel.org, 
    linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, netdev@vger.kernel.org, 
    bpf@vger.kernel.org, kexec@lists.infradead.org, 
    linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org, 
    devel@driverdev.osuosl.org, linux-efi@vger.kernel.org, 
    linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
    target-devel@vger.kernel.org, linux-nfs@vger.kernel.org, 
    ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org, 
    linux-aio@kvack.org, io-uring@vger.kernel.org, 
    linux-erofs@lists.ozlabs.org, linux-um@lists.infradead.org, 
    linux-ntfs-dev@lists.sourceforge.net, reiserfs-devel@vger.kernel.org, 
    linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org, 
    cluster-devel@redhat.com, ecryptfs@vger.kernel.org, 
    linux-cifs@vger.kernel.org, linux-btrfs@vger.kernel.org, 
    linux-afs@lists.infradead.org, linux-rdma@vger.kernel.org, 
    amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
    intel-gfx@lists.freedesktop.org, drbd-dev@lists.linbit.com, 
    linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, 
    linux-cachefs@redhat.com, samba-technical@lists.samba.org, 
    intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize new
 kmap_thread()
In-Reply-To: <20201009195033.3208459-34-ira.weiny@intel.com>
Message-ID: <nycvar.YSQ.7.78.906.2010131436200.2184@knanqh.ubzr>
References: <20201009195033.3208459-1-ira.weiny@intel.com> <20201009195033.3208459-34-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID:
 13301A02-0D83-11EB-84D0-D152C8D8090B-78420484!pb-smtp1.pobox.com

On Fri, 9 Oct 2020, ira.weiny@intel.com wrote:

> From: Ira Weiny <ira.weiny@intel.com>
> 
> The kmap() calls in this FS are localized to a single thread.  To avoid
> the over head of global PKRS updates use the new kmap_thread() call.
> 
> Cc: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Acked-by: Nicolas Pitre <nico@fluxnic.net>

>  fs/cramfs/inode.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> index 912308600d39..003c014a42ed 100644
> --- a/fs/cramfs/inode.c
> +++ b/fs/cramfs/inode.c
> @@ -247,8 +247,8 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
>  		struct page *page = pages[i];
>  
>  		if (page) {
> -			memcpy(data, kmap(page), PAGE_SIZE);
> -			kunmap(page);
> +			memcpy(data, kmap_thread(page), PAGE_SIZE);
> +			kunmap_thread(page);
>  			put_page(page);
>  		} else
>  			memset(data, 0, PAGE_SIZE);
> @@ -826,7 +826,7 @@ static int cramfs_readpage(struct file *file, struct page *page)
>  
>  	maxblock = (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
>  	bytes_filled = 0;
> -	pgdata = kmap(page);
> +	pgdata = kmap_thread(page);
>  
>  	if (page->index < maxblock) {
>  		struct super_block *sb = inode->i_sb;
> @@ -914,13 +914,13 @@ static int cramfs_readpage(struct file *file, struct page *page)
>  
>  	memset(pgdata + bytes_filled, 0, PAGE_SIZE - bytes_filled);
>  	flush_dcache_page(page);
> -	kunmap(page);
> +	kunmap_thread(page);
>  	SetPageUptodate(page);
>  	unlock_page(page);
>  	return 0;
>  
>  err:
> -	kunmap(page);
> +	kunmap_thread(page);
>  	ClearPageUptodate(page);
>  	SetPageError(page);
>  	unlock_page(page);
> -- 
> 2.28.0.rc0.12.gb6a658bd00c9
> 
> 

