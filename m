Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519CDA5FDF2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 18:36:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913219.1319326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsmTo-00050R-Id; Thu, 13 Mar 2025 17:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913219.1319326; Thu, 13 Mar 2025 17:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsmTo-0004yT-G1; Thu, 13 Mar 2025 17:36:24 +0000
Received: by outflank-mailman (input) for mailman id 913219;
 Thu, 13 Mar 2025 17:36:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rhEb=WA=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1tsmTn-0004yN-6B
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 17:36:23 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acdded1e-0031-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 18:36:21 +0100 (CET)
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-3WjiGEFbPjSckd-p95PnXg-1; Thu, 13 Mar 2025 13:36:17 -0400
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-e60aebf48e8so1759228276.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 10:36:17 -0700 (PDT)
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
X-Inumbo-ID: acdded1e-0031-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741887380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74LdO3L2papOXx6onu8X7dux3CgaxYMbpnbfEZf5vfs=;
	b=K4m8IFSl+u1sxHRI19hDZU/eQJNFrjhXR3zPY0N6wjPdo8eXgI8ADrY56GA8WQHWpwN7PZ
	uGu9ASfCU8a+l4PhTWsxaCdncu+8Ixlzc1mHMFEVwlfRTo8Sh4bEp3YUFvo5Tz5fUaOO9m
	hk4CqZo+62K41BgBlOBlN4bheeyAJ8w=
X-MC-Unique: 3WjiGEFbPjSckd-p95PnXg-1
X-Mimecast-MFC-AGG-ID: 3WjiGEFbPjSckd-p95PnXg_1741887377
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741887377; x=1742492177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74LdO3L2papOXx6onu8X7dux3CgaxYMbpnbfEZf5vfs=;
        b=v6uPJhvPF7fn02pl8lV+4k2OswDzcL0GCk5JV92bogBTCsMKKcbyCjM5LCQ13Fi0Ud
         hTn1qCE+qCCYua25lFPfk1AqEJtJQDRoCt77/txMVBCpn6Gfs9h8CSwxrw0pVHtLv6xs
         Mgp1WsiwSilDcVaYjkwT+Hrk1LEtMDUgMGGWwf8FJXSEDW3dMVsR0zTXq0jFHLZ5VPgd
         pDyGCvFMC+B4PKR7G99pp3xiFt/+EzIR6lnotT9qS44q6D93OTMOKxwSqY6wCFYHQ9Oy
         y/Bm+dcfHaRxcPjOI5fSuYy16IqK/84v40GTTjr6mV0fcR8FwJ7sRxjt8kn+BUUHO724
         Fovw==
X-Forwarded-Encrypted: i=1; AJvYcCVV5ncN+0PSatiS88TVAmt7NJw6Tr4y2vjNNWSs29+hc8tUzWolAaY9MRacDaLwx9FjI678Uo0W3F8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLIQb4U/gVKyElBjcSYHSRc9CDOwxrEuN+IP5FB62RnC/L8jQN
	T1JCA2ylkJ8oekRHLsqZiWiN4cCLpu44fsfFI8SqDlpOQLBZSGW41cl5vm9v0m3TECYSV1yotul
	UYx+8ZqIS5NsRlfmZlKUWQEvY7hmjif0rOWNrRXeaTTV+Oy01GsqUcUDSEuyhFtHGJdCn1I/7xN
	9srOtmQnn8kbVbC5BOwWyaUq1Aa9LWfyenPxbzh4k=
X-Gm-Gg: ASbGncu3dQaU/rMWHDqZNhuQyQvO+VzGDQVS7hKbyhibwg4S6IM5fXtNyNjCtbLArE6
	ij24cakdJPJUVY6U3whTU4jBY9DI5gGkgb1qgM77hPWhm2+2OaMbcgUkltVYxYCHi29Lo8kZkNX
	oGOM+kCgFUpw==
X-Received: by 2002:a05:6902:11cc:b0:e5d:d6b8:231d with SMTP id 3f1490d57ef6-e63f3c1ab89mr394110276.46.1741887377143;
        Thu, 13 Mar 2025 10:36:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESNapqN0/McTxEgf1yThn7lvo6wBYo3eRd0NunIcEjHGxMwrpjR53TwIJsg0lBT1jUk9YB7r7WxOStKAHssG0=
X-Received: by 2002:a05:6902:11cc:b0:e5d:d6b8:231d with SMTP id
 3f1490d57ef6-e63f3c1ab89mr394058276.46.1741887376762; Thu, 13 Mar 2025
 10:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250312000700.184573-1-npache@redhat.com> <20250312000700.184573-2-npache@redhat.com>
 <c4229ea5-d991-4f5e-a0ff-45dce78a242a@redhat.com> <CAA1CXcCv20TW+Xgn18E0Jn1rbT003+3gR-KAxxE9GLzh=EHNmQ@mail.gmail.com>
 <e9570319-a766-40f6-a8ea-8d9af5f03f81@redhat.com>
In-Reply-To: <e9570319-a766-40f6-a8ea-8d9af5f03f81@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 13 Mar 2025 11:35:49 -0600
X-Gm-Features: AQ5f1JrzcM5gNtNPl-Fo_pToh0DelHZYtUioYU9wKMINK1ALGT_dvw_uu_EmSak
Message-ID: <CAA1CXcBsnbj1toxZNbks+NxrR_R_xuUb76X4ANin551Fi0WROA@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: GE11DJ4xcpZtqpZQqtqtv6DXEd9WBseW1sM_kWYUa-0_1741887377
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 2:22=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 13.03.25 00:04, Nico Pache wrote:
> > On Wed, Mar 12, 2025 at 4:19=E2=80=AFPM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >> On 12.03.25 01:06, Nico Pache wrote:
> >>> Add NR_BALLOON_PAGES counter to track memory used by balloon drivers =
and
> >>> expose it through /proc/meminfo and other memory reporting interfaces=
.
> >>
> >> In balloon_page_enqueue_one(), we perform a
> >>
> >> __count_vm_event(BALLOON_INFLATE)
> >>
> >> and in balloon_page_list_dequeue
> >>
> >> __count_vm_event(BALLOON_DEFLATE);
> >>
> >>
> >> Should we maybe simply do the per-node accounting similarly there?
> >
> > I think the issue is that some balloon drivers use the
> > balloon_compaction interface while others use their own.
> >
> > This would require unifying all the drivers under a single api which
> > may be tricky if they all have different behavior
>
> Why would that be required? Simply implement it in the balloon
> compaction logic, and in addition separately in the ones that don't
> implement it.

Ah ok that makes sense!

>
> That's the same as how we handle PageOffline today.
>
> In summary, we have
>
> virtio-balloon: balloon compaction
> hv-balloon: no balloon compaction
> xen-balloon: no balloon compaction
> vmx-balloon: balloon compaction
> pseries-cmm: balloon compaction

I'm having a hard time verifying this... it looks like only
vmx-balloon uses the balloon_compaction balloon_page_list_enqueue
function that calls balloon_page_enqueue_one.

>
> So you'd handle 3 balloon drivers in one go.
>
> (this series didn't touch pseries-cmm)
Ah I didn't realize that was a balloon driver. Ill add that one to the todo=
.
>
> --
> Cheers,
>
> David / dhildenb
>


