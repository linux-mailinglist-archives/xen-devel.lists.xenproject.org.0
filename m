Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D29A6AAD9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 17:16:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922916.1326701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIYs-0006GU-4q; Thu, 20 Mar 2025 16:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922916.1326701; Thu, 20 Mar 2025 16:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIYs-0006DX-0t; Thu, 20 Mar 2025 16:16:02 +0000
Received: by outflank-mailman (input) for mailman id 922916;
 Thu, 20 Mar 2025 16:16:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hxt=WH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tvIYq-0006DR-SC
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 16:16:00 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b4e408a-05a6-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 17:15:58 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-223fd89d036so20192405ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 09:15:58 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73711694e4bsm13993765b3a.125.2025.03.20.09.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 09:15:56 -0700 (PDT)
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
X-Inumbo-ID: 9b4e408a-05a6-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742487357; x=1743092157; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JYCZ5/8zxr1I/W5r2+bzQhCRViUcHiPcuh5hVyEGNWk=;
        b=GzKXUi8CkPwT1Ee64XW897YYJXsN7ZmmwhtETDMjPYRnC5fttPTr0t/1AXM2SOXELH
         cCeUyy4kxm4qELvo8vRBxrxdbBTVwG/2wR4rEGTdKnjucx0vU/xMKF5gc27Me2NologG
         /MQ51BDbRkESxTKc0a2ONNd+dQRtKIzThsFko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742487357; x=1743092157;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYCZ5/8zxr1I/W5r2+bzQhCRViUcHiPcuh5hVyEGNWk=;
        b=M9VGmCZayR63rRoeJM2xq1g2dWiAaAP5d6L8gFuw/tEUW9hSDejKwU42bJrueD2Fx7
         jETLcR4LMNVOqgBViJ8D+n/JOlKVEp0vNNWz09NduDRmzn7PhxP0DmbyAnLnp1lp35tB
         3PdLEycEtSHADAWZuw5iTxSSVXLu1Ox/zJQF3AnS97bQuajyEqKSrCEqLBbjv/NmsnMd
         QjZ94sqoLXrXCnKIfvQJXunG2vjbXlhKLrU7v4BXofzRfaSaRjCipbN0FIBK1SQGTZdF
         0GKsxZKxLRpjIC4g1TF9tqxTusmzAXMSvKq4YLgaHPfuq2MB2E+8MoiGhRzLHLxzg50J
         QOtw==
X-Forwarded-Encrypted: i=1; AJvYcCWSrhLCGM6dVDZ+AllgVPvrMDTQo4Kdoc+z/yN934XyviRBphESqZVVevVvJpk0+ORlGTIal6nuvxE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQBktfqHYmk83n5JQHni0AV/2w5rRBvKq/2PlTl0KFop8aNU5O
	5jliJG269EeR+OqXbiua8FqFEU6CoV2Ialj5WaDN2H38gWTePMI5Wx80ceGw0MvnpkZs+1iWPnm
	e
X-Gm-Gg: ASbGncsyR/hHfCUm7hYsQ5IUCSHETzd3VaaOkoR+9qwzGKnOnXMfJ15GNJfY7ceeUKC
	RwxtBON8EFt3hxf5+tgMeiKRI3XA5ZpZhRmMdLim+WofQz0biA/tRnx8GNCYgUuhOH7MOX2vtrd
	LjhIMlYMQehP4usZrAq5H8RjawNXh1iRc6UNtXAHShz9+h7k0DvpBoh5Mj26v1HqO6RW9GtHrsd
	l8GyBKSX/Q6FBqzFYER1EyTAXicmT0yuFRxppKpBhckAz26zkY64VkqhjG++XDx1jPo+MXLyb7E
	8H0QEH6UL5oPABIS3iOlv7N3i9/FnunlOzgoDV9XYT7fop8Qs+ZB4M4=
X-Google-Smtp-Source: AGHT+IEyHz2IyRSGLI09jCIfhHA6l/qI0S69KuU2H7yNIymlciQgSDiIDdvGxbUebMAAusFoJKC5hg==
X-Received: by 2002:a05:6a21:692:b0:1f5:8f65:a6e6 with SMTP id adf61e73a8af0-1fbecd36d56mr11709751637.27.1742487356879;
        Thu, 20 Mar 2025 09:15:56 -0700 (PDT)
Date: Thu, 20 Mar 2025 17:15:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] x86/vga: fix mapping of the VGA text buffer
Message-ID: <Z9w_N6nGurDGbuWe@macbook.local>
References: <20250320151109.88228-1-roger.pau@citrix.com>
 <92a378b3-c041-4573-8abd-4ab07a4338ae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92a378b3-c041-4573-8abd-4ab07a4338ae@suse.com>

On Thu, Mar 20, 2025 at 04:25:25PM +0100, Jan Beulich wrote:
> On 20.03.2025 16:11, Roger Pau Monne wrote:
> > The call to ioremap_wc() in video_init() will always fail, because
> > video_init() is called ahead of vm_init_type(), and so the underlying
> > __vmap() call will fail to allocate the linear address space.
> > 
> > Fix by reverting to the previous behavior and use __va() for the VGA text
> > buffer, as it's below the 1MB boundary, and thus always mapped in the
> > directmap.
> > 
> > Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> Nevertheless a remark:
> 
> > --- a/xen/drivers/video/vga.c
> > +++ b/xen/drivers/video/vga.c
> > @@ -71,7 +71,7 @@ void __init video_init(void)
> >      {
> >      case XEN_VGATYPE_TEXT_MODE_3:
> >          if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) ||
> > -             ((video = ioremap_wc(0xB8000, 0x8000)) == NULL) )
> > +             ((video = __va(0xB8000)) == NULL) )
> 
> Without having a good suggestion, find such dependencies upon the low
> 1Mb always being mapped (in case we wanted to revisit this, for example)
> is going to be moderately hard. It might be good to somehow mark them.

Hm, if we where to change this, we should likely go over all the
usages of ioremap() and __va() to find them?

I assume you are fine with this going in as-is.

Thanks, Roger.

