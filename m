Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3501C760D
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 18:15:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWMgu-0000Xe-Lh; Wed, 06 May 2020 16:14:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qiEG=6U=gmail.com=malus.brandywine@srs-us1.protection.inumbo.net>)
 id 1jWMgt-0000XZ-22
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 16:14:35 +0000
X-Inumbo-ID: acbf19a4-8fb4-11ea-ae69-bc764e2007e4
Received: from mail-vs1-xe2e.google.com (unknown [2607:f8b0:4864:20::e2e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acbf19a4-8fb4-11ea-ae69-bc764e2007e4;
 Wed, 06 May 2020 16:14:34 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id a5so1364194vsm.7
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2020 09:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l3mdOtu577kPSbiCaat4KPi2GMtAE32pt3egFdx040Y=;
 b=KPANkYJMK9xkhrEW3tQNVuLFiEV16dJGY3sR150cIg2XHHEv25y9/LJX7fdGOVxcR8
 wuqgipzvEJKr+39+wAxRC4a6mnypp/v0x+sdhgkYSjd9F0R+GFQY/gwt4MBjHNbMuhU6
 2jK7aCfCUMI0BBYD80lCpDpx/QD01z/ObdPDQg3nV3asHyklWO0Bi/94V9wpq/x1FGKU
 7zST94iC1ywWrJ0GSfv7iQQQTQADmpsE+ZLEd5oUK83RMkYTO3wQ0dDe6h7E+EFG/VHg
 Y1XW5aH4Fy8oscxLVzjebZwTTWDiWQrxnLjbCzCMr4YxVrnktEhF9k111mU8BOdslJM9
 Dxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l3mdOtu577kPSbiCaat4KPi2GMtAE32pt3egFdx040Y=;
 b=hpRWZ07ZHMX6eHzkctLoGtLCdHiFsRBm4kirwvJSNrJy5+MxbA+DWj0gqYmecxSKdY
 wCN0+tCcXWcfYGx3bEhdhPb167KOAo2BnoPqmx+PO2yDydOdyRozw2c09e4Wkx20CNVa
 Lh7jou+31YB9G5PhUIMpQ8FYCksYIMqlWqeBtnVFRWOQvmXGZuEaSemfoPF5OgUAhZbA
 bRwrNy5FZv1lb3jO+Ae+L5yc4ClBs6fUq7lXgxxBGIt0rp4ECdZ9k+F07X04sbluNJFX
 YqAZcoWyMCZqD40oZvPfhBAZrIOEUIs3JFF5dV7pAtcQgBHjULfJx+E324Rm2+ss3/4U
 OA8g==
X-Gm-Message-State: AGi0PuYJYwNvdpcWCJZASyYKMeJYUQGiN772KVCnMaMHyIjo/LyJoDyX
 e1Ia/mPsP8FCyHJEs5dSBRnSia30owjgHc72bak=
X-Google-Smtp-Source: APiQypLNpB2Sj/pWyvcXNlaPIw1tzPhFhoMqKURGqGI+nUHR+ly4iTdXr09t+e+YRVuUr54vVc5DYkgc8yGt00m4lm4=
X-Received: by 2002:a67:80d6:: with SMTP id b205mr8894264vsd.57.1588781674048; 
 Wed, 06 May 2020 09:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <20200501114201.GE9902@minyard.net>
 <CAMmSBy_h9=5cjMv3+-BKHYhBikgna731DoA+t-8FK-2tbPUH-A@mail.gmail.com>
 <20200502021647.GG9902@minyard.net>
 <4f6ef562-e213-8952-66d6-0f083bf8c593@xen.org>
 <20200502173529.GH9902@minyard.net>
 <ed02b555-dbaa-2ebf-d09f-0474e1a7a745@xen.org>
 <20200504124453.GI9902@minyard.net>
 <CAMmSBy-w1HOyGGCjB_nJcn2xw+4sNdDrtJ8PC3foaxJOtdRmnQ@mail.gmail.com>
 <alpine.DEB.2.21.2005042004500.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy-yymEGQcuUBHZi-tL9ra7x9nDv+ms8SLiZr1H=BpHUiQ@mail.gmail.com>
 <alpine.DEB.2.21.2005051508180.14706@sstabellini-ThinkPad-T480s>
 <9ee0fb6f-98df-d993-c42e-f47270bf2eaa@suse.com>
 <DB6PR0402MB2760AF88FE7E3DF47401BE5988A40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CADz_WD5Ln7Pe1WAFp73d2Mz9wxspzTE3WgAJusp5S8LX4=83Bw@mail.gmail.com>
 <2187cd7c-4d48-986b-77d6-4428e8178404@oracle.com>
In-Reply-To: <2187cd7c-4d48-986b-77d6-4428e8178404@oracle.com>
From: Nataliya Korovkina <malus.brandywine@gmail.com>
Date: Wed, 6 May 2020 12:14:22 -0400
Message-ID: <CADz_WD68bYj-0CSm_zib+LRiMGd1+1eoNLgiJj=vHog685Khsw@mail.gmail.com>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, "minyard@acm.org" <minyard@acm.org>,
 Roman Shaposhnik <roman@zededa.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 6, 2020 at 9:43 AM Boris Ostrovsky
<boris.ostrovsky@oracle.com> wrote:
>
>
> On 5/6/20 9:08 AM, Nataliya Korovkina wrote:
> > Hello,
> >
> > What I found out: rpi_firmware_property_list() allocates memory from
> > dma_atomic_pool which was mapped to VMALLOC region, so virt_to_page()
> > is not eligible in this case.
>
>
> So then it seems it didn't go through xen_swiotlb_alloc_coherent(). In
> which case it has no business calling xen_swiotlb_free_coherent().
>
>
> -boris
>
>
>
>

It does go.
dma_alloc_coherent() indirectly calls xen_swiotlb_alloc_coherent(),
then  xen_alloc_coherent_pages() eventually calls arch_dma_alloc() in
remap.c which successfully allocates pages from atomic pool.

The patch Julien offered for domian_build.c moved Dom0 banks in the
first G of RAM.
So it covered the previous symptom (a crash during allocation) because
now we avoid pathway  when we mark a page "XenMapped".

But the symptom still remains in xen_swiotlb_free_coherent() because
"TestPage..." is called unconditionally. virt_to_page() is not
applicable to such allocations.

Thanks,
Nataliya

