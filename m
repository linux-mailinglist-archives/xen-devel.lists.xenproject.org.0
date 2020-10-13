Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D3D28D527
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 22:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6385.16997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSQVY-0008RT-Rk; Tue, 13 Oct 2020 20:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6385.16997; Tue, 13 Oct 2020 20:02:52 +0000
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
	id 1kSQVY-0008R4-Ok; Tue, 13 Oct 2020 20:02:52 +0000
Received: by outflank-mailman (input) for mailman id 6385;
 Tue, 13 Oct 2020 20:02:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cX9a=DU=ftp.linux.org.uk=viro@srs-us1.protection.inumbo.net>)
 id 1kSQVX-0008Qt-4I
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 20:02:51 +0000
Received: from ZenIV.linux.org.uk (unknown [2002:c35c:fd02::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2a18346-39cc-4698-aa73-2500b050fe38;
 Tue, 13 Oct 2020 20:02:49 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kSQUX-00H96b-NT; Tue, 13 Oct 2020 20:01:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cX9a=DU=ftp.linux.org.uk=viro@srs-us1.protection.inumbo.net>)
	id 1kSQVX-0008Qt-4I
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 20:02:51 +0000
X-Inumbo-ID: a2a18346-39cc-4698-aa73-2500b050fe38
Received: from ZenIV.linux.org.uk (unknown [2002:c35c:fd02::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a2a18346-39cc-4698-aa73-2500b050fe38;
	Tue, 13 Oct 2020 20:02:49 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSQUX-00H96b-NT; Tue, 13 Oct 2020 20:01:49 +0000
Date: Tue, 13 Oct 2020 21:01:49 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
	"Weiny, Ira" <ira.weiny@intel.com>,
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
Message-ID: <20201013200149.GI3576660@ZenIV.linux.org.uk>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-34-ira.weiny@intel.com>
 <CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
 <20201013193643.GK20115@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013193643.GK20115@casper.infradead.org>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Oct 13, 2020 at 08:36:43PM +0100, Matthew Wilcox wrote:

> static inline void copy_to_highpage(struct page *to, void *vfrom, unsigned int size)
> {
> 	char *vto = kmap_atomic(to);
> 
> 	memcpy(vto, vfrom, size);
> 	kunmap_atomic(vto);
> }
> 
> in linux/highmem.h ?

You mean, like
static void memcpy_from_page(char *to, struct page *page, size_t offset, size_t len)
{
        char *from = kmap_atomic(page);
        memcpy(to, from + offset, len);
        kunmap_atomic(from);
}

static void memcpy_to_page(struct page *page, size_t offset, const char *from, size_t len)
{
        char *to = kmap_atomic(page);
        memcpy(to + offset, from, len);
        kunmap_atomic(to);
}

static void memzero_page(struct page *page, size_t offset, size_t len)
{
        char *addr = kmap_atomic(page);
        memset(addr + offset, 0, len);
        kunmap_atomic(addr);
}

in lib/iov_iter.c?  FWIW, I don't like that "highpage" in the name and
highmem.h as location - these make perfect sense regardless of highmem;
they are normal memory operations with page + offset used instead of
a pointer...

