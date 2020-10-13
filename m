Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE0628D4C9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 21:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6375.16982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSQBG-0006YT-37; Tue, 13 Oct 2020 19:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6375.16982; Tue, 13 Oct 2020 19:41:54 +0000
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
	id 1kSQBG-0006Y4-06; Tue, 13 Oct 2020 19:41:54 +0000
Received: by outflank-mailman (input) for mailman id 6375;
 Tue, 13 Oct 2020 19:41:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BppY=DU=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1kSQBE-0006Xz-7v
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 19:41:52 +0000
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1df82f3-c83b-46d2-ae4d-bb6f3c07291a;
 Tue, 13 Oct 2020 19:41:49 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id p15so1446167ejm.7
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 12:41:49 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BppY=DU=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
	id 1kSQBE-0006Xz-7v
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 19:41:52 +0000
X-Inumbo-ID: c1df82f3-c83b-46d2-ae4d-bb6f3c07291a
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c1df82f3-c83b-46d2-ae4d-bb6f3c07291a;
	Tue, 13 Oct 2020 19:41:49 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id p15so1446167ejm.7
        for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 12:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jlOzF1QhqikCoQxsvfJV6M6Hjgbrow9dB9uNs1AoGLE=;
        b=kTjS5KS3nYcf/wrvTsuRt1BvzGw557kJOoPvyzYoBgiqb4b8bKtbI2/mMLiZYyRjFR
         J9ydTuu0x47x+MEvbUBFhFH3/2QgRWgMVRtg9k6OLuYDe131Mp/cuPa30fJMGhSFjepr
         cqBBXWNROTwzHkSN49lY/psarWhxU27El5EYWXEJaiWvhTqo66L6QK98x3Y0Yvi2nF9y
         UTW/CUag9LBP+VfPW+1mn8JfLpPCSXoAzeg5FBjWoJMu0+7UEW9Ka5T8iigFwOd+JDvR
         rrctnvxFOZW164mxjZq4IMmZGZxG4l2jAUbsCf6skOMzcKIRAwJ8OakZ/jL0rfexuXSd
         7ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jlOzF1QhqikCoQxsvfJV6M6Hjgbrow9dB9uNs1AoGLE=;
        b=pbJaZ+AMso4vtQUxqYRNi7j4BGwWlEVxSmWFN2+618lgCPVUalkzP7Nq6Vx6XLsMTk
         IrxHbI0k2fInFLoWd026pj2NSy+QZMqQrwyp07LAIMvj08IKpyAjF55yzCYOv5XMvBU9
         AKe1iCR6Rv9GF6J6HyWIDUXd3NDHBH5y9VlG2xN2T1vVCklESl/WmUCC3ZxrVdBioyhT
         L4F8SCI6/fyDIWDW3i74+636Z8tDRX8ZxjJtJScP8eTbdeUyrj+gmB5uNcke9ca10l+K
         /RDb3wv1PWOq3pRRRi1FSLy/SCDpyXMcOTUPMcR7E+XGApRPLy+U6OM/+KSO8FZI6kK+
         88pw==
X-Gm-Message-State: AOAM532OLBeSNbyqgP1aEerKWGxwmQjJ8IelFsgyYMQzjWwvTilZjors
	XDtGnjSfoZaLOG0bQh5+EmAzx5KQwVQZD222qtfuIQ==
X-Google-Smtp-Source: ABdhPJxGxhMZ7o2BYtIDXOupUr3pSHVXck0tIwC9HMZ0nIbp0pU6AQKRljKqMwVkoxmX0BYp74elTVEnpYvo3LWFH24=
X-Received: by 2002:a17:906:7e47:: with SMTP id z7mr1390518ejr.418.1602618108255;
 Tue, 13 Oct 2020 12:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201009195033.3208459-1-ira.weiny@intel.com> <20201009195033.3208459-34-ira.weiny@intel.com>
 <CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com> <20201013193643.GK20115@casper.infradead.org>
In-Reply-To: <20201013193643.GK20115@casper.infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 13 Oct 2020 12:41:36 -0700
Message-ID: <CAPcyv4gL70FcLe8az7ezmpcZV=bG0Cka7daKWcCdmV4GoenSZw@mail.gmail.com>
Subject: Re: [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize new kmap_thread()
To: Matthew Wilcox <willy@infradead.org>
Cc: "Weiny, Ira" <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Nicolas Pitre <nico@fluxnic.net>, 
	X86 ML <x86@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
	linux-kselftest@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	KVM list <kvm@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org, 
	Kexec Mailing List <kexec@lists.infradead.org>, linux-bcache@vger.kernel.org, 
	linux-mtd@lists.infradead.org, devel@driverdev.osuosl.org, 
	linux-efi <linux-efi@vger.kernel.org>, linux-mmc@vger.kernel.org, 
	linux-scsi <linux-scsi@vger.kernel.org>, target-devel@vger.kernel.org, 
	linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
	linux-ext4 <linux-ext4@vger.kernel.org>, linux-aio@kvack.org, io-uring@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-um@lists.infradead.org, 
	linux-ntfs-dev@lists.sourceforge.net, reiserfs-devel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org, 
	cluster-devel@redhat.com, ecryptfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-btrfs <linux-btrfs@vger.kernel.org>, 
	linux-afs@lists.infradead.org, linux-rdma <linux-rdma@vger.kernel.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org, 
	drbd-dev@lists.linbit.com, linux-block@vger.kernel.org, 
	xen-devel <xen-devel@lists.xenproject.org>, linux-cachefs@redhat.com, 
	samba-technical@lists.samba.org, intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2020 at 12:37 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Oct 13, 2020 at 11:44:29AM -0700, Dan Williams wrote:
> > On Fri, Oct 9, 2020 at 12:52 PM <ira.weiny@intel.com> wrote:
> > >
> > > From: Ira Weiny <ira.weiny@intel.com>
> > >
> > > The kmap() calls in this FS are localized to a single thread.  To avoid
> > > the over head of global PKRS updates use the new kmap_thread() call.
> > >
> > > Cc: Nicolas Pitre <nico@fluxnic.net>
> > > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > > ---
> > >  fs/cramfs/inode.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> > > index 912308600d39..003c014a42ed 100644
> > > --- a/fs/cramfs/inode.c
> > > +++ b/fs/cramfs/inode.c
> > > @@ -247,8 +247,8 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
> > >                 struct page *page = pages[i];
> > >
> > >                 if (page) {
> > > -                       memcpy(data, kmap(page), PAGE_SIZE);
> > > -                       kunmap(page);
> > > +                       memcpy(data, kmap_thread(page), PAGE_SIZE);
> > > +                       kunmap_thread(page);
> >
> > Why does this need a sleepable kmap? This looks like a textbook
> > kmap_atomic() use case.
>
> There's a lot of code of this form.  Could we perhaps have:
>
> static inline void copy_to_highpage(struct page *to, void *vfrom, unsigned int size)
> {
>         char *vto = kmap_atomic(to);
>
>         memcpy(vto, vfrom, size);
>         kunmap_atomic(vto);
> }
>
> in linux/highmem.h ?

Nice, yes, that could also replace the local ones in lib/iov_iter.c
(memcpy_{to,from}_page())

