Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89AA28D4A9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 21:38:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6373.16970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSQ7K-0005iM-IS; Tue, 13 Oct 2020 19:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6373.16970; Tue, 13 Oct 2020 19:37:50 +0000
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
	id 1kSQ7K-0005hx-Ey; Tue, 13 Oct 2020 19:37:50 +0000
Received: by outflank-mailman (input) for mailman id 6373;
 Tue, 13 Oct 2020 19:37:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5yF7=DU=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1kSQ7H-0005hs-Dx
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 19:37:48 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c3879a7-088e-4c22-b34f-fde749a72974;
 Tue, 13 Oct 2020 19:37:43 +0000 (UTC)
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kSQ6F-000768-Gq; Tue, 13 Oct 2020 19:36:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5yF7=DU=infradead.org=willy@srs-us1.protection.inumbo.net>)
	id 1kSQ7H-0005hs-Dx
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 19:37:48 +0000
X-Inumbo-ID: 0c3879a7-088e-4c22-b34f-fde749a72974
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0c3879a7-088e-4c22-b34f-fde749a72974;
	Tue, 13 Oct 2020 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=julNFvrjaFWkGS8+6W5JRZKKlBpdy19jf/hCoUdzdEM=; b=iOPFuszmnN+d5S+Ahd5uX1N4pM
	9RF6NzOI8Sd5OvAHWw4A5T4V7HBzV5SYmEitcrT6L9uijzivpv3AAlrlQ+EeeMBwBERzfaRW96tDf
	PKzX+Sl2uCT2ULOLsIaATERkdV1cx8TAcLFUKC9PDDXh3BUb0PThsEH5DExMv1qS5B9SNDc+ifGE8
	i5adkcq3oTTGJk72Oatktad6H8mS4gZ84Snyq0JJxGsD2588n+HRQh2ps2O3qrgewJ3m2qt+GgsvN
	M0CVp3vtxwWhumjXm1Xcpjg1G/4g9JvOqlT5q+mB/7fQkjMGPjGhStjIFbjEA/fecM1aATnK3yCCv
	pha3ulKA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSQ6F-000768-Gq; Tue, 13 Oct 2020 19:36:43 +0000
Date: Tue, 13 Oct 2020 20:36:43 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: "Weiny, Ira" <ira.weiny@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicolas Pitre <nico@fluxnic.net>, X86 ML <x86@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux MM <linux-mm@kvack.org>, linux-kselftest@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	KVM list <kvm@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
	bpf@vger.kernel.org, Kexec Mailing List <kexec@lists.infradead.org>,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	devel@driverdev.osuosl.org, linux-efi <linux-efi@vger.kernel.org>,
	linux-mmc@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
	target-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-ext4 <linux-ext4@vger.kernel.org>,
	linux-aio@kvack.org, io-uring@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-um@lists.infradead.org,
	linux-ntfs-dev@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
	cluster-devel@redhat.com, ecryptfs@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	linux-btrfs <linux-btrfs@vger.kernel.org>,
	linux-afs@lists.infradead.org,
	linux-rdma <linux-rdma@vger.kernel.org>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
	intel-gfx@lists.freedesktop.org, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-cachefs@redhat.com, samba-technical@lists.samba.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize new kmap_thread()
Message-ID: <20201013193643.GK20115@casper.infradead.org>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-34-ira.weiny@intel.com>
 <CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>

On Tue, Oct 13, 2020 at 11:44:29AM -0700, Dan Williams wrote:
> On Fri, Oct 9, 2020 at 12:52 PM <ira.weiny@intel.com> wrote:
> >
> > From: Ira Weiny <ira.weiny@intel.com>
> >
> > The kmap() calls in this FS are localized to a single thread.  To avoid
> > the over head of global PKRS updates use the new kmap_thread() call.
> >
> > Cc: Nicolas Pitre <nico@fluxnic.net>
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >  fs/cramfs/inode.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> > index 912308600d39..003c014a42ed 100644
> > --- a/fs/cramfs/inode.c
> > +++ b/fs/cramfs/inode.c
> > @@ -247,8 +247,8 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
> >                 struct page *page = pages[i];
> >
> >                 if (page) {
> > -                       memcpy(data, kmap(page), PAGE_SIZE);
> > -                       kunmap(page);
> > +                       memcpy(data, kmap_thread(page), PAGE_SIZE);
> > +                       kunmap_thread(page);
> 
> Why does this need a sleepable kmap? This looks like a textbook
> kmap_atomic() use case.

There's a lot of code of this form.  Could we perhaps have:

static inline void copy_to_highpage(struct page *to, void *vfrom, unsigned int size)
{
	char *vto = kmap_atomic(to);

	memcpy(vto, vfrom, size);
	kunmap_atomic(vto);
}

in linux/highmem.h ?

