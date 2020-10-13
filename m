Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8494828D3F9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 20:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6362.16928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSPHz-00017B-2N; Tue, 13 Oct 2020 18:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6362.16928; Tue, 13 Oct 2020 18:44:47 +0000
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
	id 1kSPHy-00016m-VD; Tue, 13 Oct 2020 18:44:46 +0000
Received: by outflank-mailman (input) for mailman id 6362;
 Tue, 13 Oct 2020 18:44:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BppY=DU=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1kSPHx-00016h-DJ
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 18:44:45 +0000
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1beafb17-dccc-4b10-841a-34d84209a6d9;
 Tue, 13 Oct 2020 18:44:42 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id i5so541220edr.5
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 11:44:42 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BppY=DU=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
	id 1kSPHx-00016h-DJ
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 18:44:45 +0000
X-Inumbo-ID: 1beafb17-dccc-4b10-841a-34d84209a6d9
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1beafb17-dccc-4b10-841a-34d84209a6d9;
	Tue, 13 Oct 2020 18:44:42 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id i5so541220edr.5
        for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 11:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ACWQZXFIYAYZvPtA0kqqET9/h2VeNuWUmvFkuiSdGDk=;
        b=DayNIijN9rJ4wynxycYBrXAQR84x3xjByl1z2VFzt7YCa69TNkAlkIdWKG0xwP6Yp3
         3F/H2nz44gihJO9JHyXWzYL4P1dc46CKqiaNR3yRo/w37eMMjkAo/koyRg9J9cet4J5o
         8pAZLke452kN1ce4bdWIlGHc47qEL6KSVsDbeqJDAMDzDUrFyC9OKIrNu9C/VaSoREWg
         9B9an2yfiyuzSelcHqdOabrCOxSG6vx+IObNMb98zyieMNME4f/11W7Es7O7m/+Kevvk
         a0bkM4fWgVplo/2Lunr6iSwR8tSVOWAyX1+gyP4UJdvdg+R8/4qIc/xXlFMWt9dzq4A3
         WVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ACWQZXFIYAYZvPtA0kqqET9/h2VeNuWUmvFkuiSdGDk=;
        b=YPKpkNftpxCxIOIwgN058wXBO4xViabu12vwY9HZ070vNi2b3VicPoxpudeOxUoUI+
         BV5ujP8/m16IjwPtCSjk9/vvwG/XIBp/daazGRsWJxuesYsL03FSkYZwl7glQgWlCNKR
         ZgJvtO2DA0yFpII2NYaq1go8xOpRwzyN/sOk0n6U6ezmG+nQin29mKezjwQ6+pIjOa9k
         BuEjr/haULlWrdnDssuuPgJ6Wdu1C2km09GUwx2eGDtF2JeZJB38d1O1eHkOSjoF6YEB
         ObVMXXGd+fnvzMgEe+sAKQ5eKJy7mkExrELegKkaOLpt9Ir8MHdCR0lBQ52QKz8PYPjF
         buJQ==
X-Gm-Message-State: AOAM530/zxOfZNAH0w1XQOfQJvKCq6Tf7vPBlKXnHfKvXR9KywgnkmBO
	CcesTf3T3qAO4gzB4tFUVnk83ENCLrGQU00Q3NP3XQ==
X-Google-Smtp-Source: ABdhPJx/D4CFI8iBKDneanR6scqyHSM4b5ae7bBsGU7JbHG59bZqw8grXz+3fxsJ2hpJPfBR1HipQc3XH+/A2xgb2Ys=
X-Received: by 2002:a50:8e1e:: with SMTP id 30mr1027503edw.354.1602614681174;
 Tue, 13 Oct 2020 11:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201009195033.3208459-1-ira.weiny@intel.com> <20201009195033.3208459-34-ira.weiny@intel.com>
In-Reply-To: <20201009195033.3208459-34-ira.weiny@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 13 Oct 2020 11:44:29 -0700
Message-ID: <CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
Subject: Re: [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize new kmap_thread()
To: "Weiny, Ira" <ira.weiny@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nicolas Pitre <nico@fluxnic.net>, X86 ML <x86@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
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

On Fri, Oct 9, 2020 at 12:52 PM <ira.weiny@intel.com> wrote:
>
> From: Ira Weiny <ira.weiny@intel.com>
>
> The kmap() calls in this FS are localized to a single thread.  To avoid
> the over head of global PKRS updates use the new kmap_thread() call.
>
> Cc: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  fs/cramfs/inode.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> index 912308600d39..003c014a42ed 100644
> --- a/fs/cramfs/inode.c
> +++ b/fs/cramfs/inode.c
> @@ -247,8 +247,8 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
>                 struct page *page = pages[i];
>
>                 if (page) {
> -                       memcpy(data, kmap(page), PAGE_SIZE);
> -                       kunmap(page);
> +                       memcpy(data, kmap_thread(page), PAGE_SIZE);
> +                       kunmap_thread(page);

Why does this need a sleepable kmap? This looks like a textbook
kmap_atomic() use case.

