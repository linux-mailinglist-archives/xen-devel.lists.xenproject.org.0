Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0384A5E802
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:05:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910899.1317485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsV84-0000FU-Dd; Wed, 12 Mar 2025 23:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910899.1317485; Wed, 12 Mar 2025 23:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsV84-0000DJ-B3; Wed, 12 Mar 2025 23:04:48 +0000
Received: by outflank-mailman (input) for mailman id 910899;
 Wed, 12 Mar 2025 23:04:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SEQM=V7=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1tsV82-0000DD-TU
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:04:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 624f1cab-ff96-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 00:04:44 +0100 (CET)
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-PLFI9rpLNHeYc_ovx9-y7A-1; Wed, 12 Mar 2025 19:04:41 -0400
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6f6d40a61e7so5355477b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 16:04:41 -0700 (PDT)
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
X-Inumbo-ID: 624f1cab-ff96-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741820682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d5PEY+yC9Huewb0HnCtpeT52eaIOfYoMMqMSFveNI50=;
	b=MlU6q2A8a4uCwqBNOlxeDEILGorCOSeWUvxDY+SIWf5LWnKEi1j7LJyx151qsyGUl2RY6t
	NiR9c+TsFmuceIU6+dGFxR1J9sfo1xk8irhkoqPSbYwLVSnYz1FrJDYI8hqERbUhNU4yNv
	+8X9qeZ9LqKRd2CvH1K/NA4ervmG4fE=
X-MC-Unique: PLFI9rpLNHeYc_ovx9-y7A-1
X-Mimecast-MFC-AGG-ID: PLFI9rpLNHeYc_ovx9-y7A_1741820681
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741820681; x=1742425481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5PEY+yC9Huewb0HnCtpeT52eaIOfYoMMqMSFveNI50=;
        b=l3BVajjHrinnuu+2utVLHqDnz/toe8TC74hAxI8DyUGp4NVa9uBjjSAoxw+QGboJGJ
         SfxEfx0pj2LR3DwrEhKY/f3TQKbPjnFkmoFsnrRf4mMXn+NIvPE2Yae33ISREDT8DfFX
         3I1barp+/KdKGvq6hrZLVdq7WnGC+ervUSJwAaIOGBWysYGoHpjHnma+ZJkirceQ2kcK
         F/Q6j2uyzpuDHCbU7vL8ILiXLAuUkmB4fIcR807zXVqgmd4Vfi2XnjLri/TnERYsy4/4
         T1K2777LzAaqGpcUlgw5udeB1mdY20uLSWJCOLEOxKmQ9D7HSMluuzJv1/ZXdc2DcsOu
         RVVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk6N+POZIE5Xu+kZiyRLvujmRVyWzDgGf9VyaDXjdz1vDIrZ/BFbchybYz2EIYm+W4K6l3w3DB1nc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy00oRe6zlHlgEWff/m421QDMUYM75sJnb/tjYMP1c8HpyM6/OD
	BTCVJpzmPmWhxn9QvgYi05PPjsc+cta9m3roSJs4oFR1RVHa6V001sD5fYriH1h3roP526zcCis
	Ln8/wynGqxjWbrB5JxyBBZ4CqO4y9TlaQyY7na/zs6DK8ZqRykVkbyo9BD1zryeeW5NN17W+qf5
	/MTZdEZjMlIT6k8lhQJIKFFvmGW+VThF7wMnVaH3k=
X-Gm-Gg: ASbGncvO/stjGaSSCY9ibBuifJNjSwRgwYF/CPtSvx+FAiSN4vwl7SNQm6ES22qvHVe
	/ZqMG63MOKyVkqkwVRsHw1W/dPDFQJMZ7JBGK0kX4qhUE7phymNntORSBhvfZV+ExXds0T5Ts9l
	FhA0vBe3OrLOg=
X-Received: by 2002:a05:6902:2ec3:b0:e63:65bc:a173 with SMTP id 3f1490d57ef6-e6365bca293mr20489050276.41.1741820680985;
        Wed, 12 Mar 2025 16:04:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE29IOsL3if064ONRlZf/bCswPuk7JbIN/+ScTtHA6PhUNFhrt31PPwWl6SfPGyM46nmrjRUH8DQbWz44H/+M=
X-Received: by 2002:a05:6902:2ec3:b0:e63:65bc:a173 with SMTP id
 3f1490d57ef6-e6365bca293mr20489001276.41.1741820680678; Wed, 12 Mar 2025
 16:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250312000700.184573-1-npache@redhat.com> <20250312000700.184573-2-npache@redhat.com>
 <c4229ea5-d991-4f5e-a0ff-45dce78a242a@redhat.com>
In-Reply-To: <c4229ea5-d991-4f5e-a0ff-45dce78a242a@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Wed, 12 Mar 2025 17:04:14 -0600
X-Gm-Features: AQ5f1JrCck7ZrLXTjsNL6uP-21nbhhEyl_MT0WXZGBOwpNadq0-oKKZGcnVqKd4
Message-ID: <CAA1CXcCv20TW+Xgn18E0Jn1rbT003+3gR-KAxxE9GLzh=EHNmQ@mail.gmail.com>
Subject: Re: [RFC 1/5] meminfo: add a per node counter for balloon drivers
To: David Hildenbrand <david@redhat.com>
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, jerrin.shaji-george@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de, 
	gregkh@linuxfoundation.org, mst@redhat.com, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com, jgross@suse.com, 
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
	akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	nphamcs@gmail.com, yosry.ahmed@linux.dev, kanchana.p.sridhar@intel.com, 
	alexander.atanasov@virtuozzo.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D_RAca3pKHP7VPx27CbZwxO6rs34wCmYnlX7G5XzdwA_1741820681
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 4:19=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 12.03.25 01:06, Nico Pache wrote:
> > Add NR_BALLOON_PAGES counter to track memory used by balloon drivers an=
d
> > expose it through /proc/meminfo and other memory reporting interfaces.
>
> In balloon_page_enqueue_one(), we perform a
>
> __count_vm_event(BALLOON_INFLATE)
>
> and in balloon_page_list_dequeue
>
> __count_vm_event(BALLOON_DEFLATE);
>
>
> Should we maybe simply do the per-node accounting similarly there?

I think the issue is that some balloon drivers use the
balloon_compaction interface while others use their own.

This would require unifying all the drivers under a single api which
may be tricky if they all have different behavior
>
> --
> Cheers,
>
> David / dhildenb
>


