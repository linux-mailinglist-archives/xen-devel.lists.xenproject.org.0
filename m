Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4314F886D84
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 14:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696885.1088097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnf9i-0005wz-Ax; Fri, 22 Mar 2024 13:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696885.1088097; Fri, 22 Mar 2024 13:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnf9i-0005ua-8F; Fri, 22 Mar 2024 13:41:58 +0000
Received: by outflank-mailman (input) for mailman id 696885;
 Fri, 22 Mar 2024 13:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zbbD=K4=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1rnf9h-0005uS-Aj
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 13:41:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1e03297-e851-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 14:41:55 +0100 (CET)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-knYgoxYHPT-1D277Ai0Gog-1; Fri, 22 Mar 2024 09:41:52 -0400
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4311dd10102so7985991cf.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 06:41:52 -0700 (PDT)
Received: from x1n ([99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 b16-20020ac844d0000000b00430b772f3dfsm869813qto.55.2024.03.22.06.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 06:41:51 -0700 (PDT)
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
X-Inumbo-ID: f1e03297-e851-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711114914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RJo7/irORUSfHBxyzyE4PWgRdMa4wnSQmwiLtA6ROhw=;
	b=LJmS/0bsUohjx0lR2PFruSgMaqDKzZqKUBhcNnEP4W3MqlMfRQfSMiV1V3roLDniXeCg1t
	A3ofJ+7gubJsvwlzYJlalXl44gTbLTk1z0YlI10aBAMnCsCc0elVOMHiFpZmImKDkhwECC
	cuPfrIIsXoK44Sc0mjHUzUL1QbjDK2g=
X-MC-Unique: knYgoxYHPT-1D277Ai0Gog-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711114912; x=1711719712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJo7/irORUSfHBxyzyE4PWgRdMa4wnSQmwiLtA6ROhw=;
        b=rIWPWwtGUO6CnHbC+THccMWuL45RcvjJRoTBVWzkNzfuZBv7ivsAKXJfXsKv88l/GS
         IhATbgpRwKrBnQhtOiqnoBprCjfUavFn/rsuOv9sXYzAzEjb9hCUG4PlWzFB/bGcxmNK
         HM/+J8uYih43AARu23S8DN4qL5rTGAsoZ7moXt6aYK7MJK9WwFkTf3ez+9xkOiSF/52o
         7gjXKjYTpBMEyfSjJntItFmLnD8GVtBGLpKRFtNkUgxuTVrQQGd1fOTxv74XyTGtL7wJ
         1uxth8rz8kAe3aRqb/rDVRTpDI09bRPpub4LCUay8yrLqH741UU4pKbCRHi3e21ffHjW
         oVhA==
X-Forwarded-Encrypted: i=1; AJvYcCW/tmbLuScDr/RYr21VH/NVPxH010/cq7aNQ0K0mvJlKzJW1613WjTPLu4WvuDj+tSi8mwQuhur9urVvlicbm2RfGlAC3hU7GaZO4dIjJ4=
X-Gm-Message-State: AOJu0YwJiAvtoZZY7ktLtaumTOII867X8ZA8C6i0P+UuMr9qf+eW29Uk
	Ml/ANYehU34P/C6AzniVI9gus4in1IXktGi2wt7GvksPunJvbyabtV35tgYagUkamqjfAivohS4
	vbXkrk+eNEvsqfGnHpZFAOrficgRiTMEhBGhK8wigyP9S7vz827vVu4z3tOl0wka5
X-Received: by 2002:a05:622a:1828:b0:431:30cb:4fd2 with SMTP id t40-20020a05622a182800b0043130cb4fd2mr2022579qtc.0.1711114912081;
        Fri, 22 Mar 2024 06:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/0+yKyHflKpE6YElewzeWCB+HqYA1SbGgHWmnOQVycDPda2C/eX5ZaxeqW0tzatM+wiLZog==
X-Received: by 2002:a05:622a:1828:b0:431:30cb:4fd2 with SMTP id t40-20020a05622a182800b0043130cb4fd2mr2022539qtc.0.1711114911504;
        Fri, 22 Mar 2024 06:41:51 -0700 (PDT)
Date: Fri, 22 Mar 2024 09:41:49 -0400
From: Peter Xu <peterx@redhat.com>
To: Yong Huang <yong.huang@smartx.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
	qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Alex Williamson <alex.williamson@redhat.com>,
	Avihai Horon <avihaih@nvidia.com>,
	Markus Armbruster <armbru@redhat.com>,
	Prasad Pandit <pjp@fedoraproject.org>,
	xen-devel@lists.xenproject.org,
	Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH for-9.1 v5 11/14] memory: Add Error** argument to the
 global_dirty_log routines
Message-ID: <Zf2KndZqH5WYdAVL@x1n>
References: <20240320064911.545001-1-clg@redhat.com>
 <20240320064911.545001-12-clg@redhat.com>
 <Zfr-W0aubJC_lfaK@x1n>
 <CAK9dgmYyV-vH8YA=vkL8afXMByCTdnYUNM=XtG8xv5kpu4t6_A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9dgmYyV-vH8YA=vkL8afXMByCTdnYUNM=XtG8xv5kpu4t6_A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 22, 2024 at 09:55:18AM +0800, Yong Huang wrote:
> Indeed, for the GLOBAL_DIRTY_DIRTY_RATE and GLOBAL_DIRTY_LIMIT
> dirty tracking, they should handle the failure path of logging start.
> The work may be done once the current patchset is merged.

Thanks for confirming this, Yong.  I think I'll go ahead and queue it then.
It should be in the 1st migration pull for 9.1.  Thanks,

-- 
Peter Xu


