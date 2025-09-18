Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8701B86DB4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 22:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126599.1468115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzKzK-0004Nt-IM; Thu, 18 Sep 2025 20:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126599.1468115; Thu, 18 Sep 2025 20:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzKzK-0004Km-FS; Thu, 18 Sep 2025 20:12:18 +0000
Received: by outflank-mailman (input) for mailman id 1126599;
 Thu, 18 Sep 2025 20:12:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j8y1=35=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1uzKzI-0004Kg-9s
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 20:12:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0078c65-94cb-11f0-9d14-b5c5bf9af7f9;
 Thu, 18 Sep 2025 22:12:07 +0200 (CEST)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-VBwf8nGCM1uiYMIaqUIzrA-1; Thu, 18 Sep 2025 16:12:04 -0400
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5fbf0388eso18110091cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Sep 2025 13:12:04 -0700 (PDT)
Received: from x1.local
 (bras-base-aurron9134w-grc-11-174-89-135-121.dsl.bell.ca. [174.89.135.121])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4bda23b2f56sm18877261cf.17.2025.09.18.13.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 13:12:02 -0700 (PDT)
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
X-Inumbo-ID: c0078c65-94cb-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758226326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oEVcW8H0ePrVkukmBhlQeYMXet9+27y8NnV6UVsaWN8=;
	b=gSPHM0yjwNoopRRUHJn9eZoRNY5uxy1pp041qJxzK7LW1ZToTjfKrI+6j/L2goQ3nX+j4q
	dfBBrRx9OA9AQJ9X48mct8j3SWDcYMwZ7ZAlrPyakrdFdI9syuVBFDnCKPkYeSNCygj7Y5
	MpreG3xHNVQcLIVMpZytib9/zUaEkgw=
X-MC-Unique: VBwf8nGCM1uiYMIaqUIzrA-1
X-Mimecast-MFC-AGG-ID: VBwf8nGCM1uiYMIaqUIzrA_1758226324
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758226324; x=1758831124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEVcW8H0ePrVkukmBhlQeYMXet9+27y8NnV6UVsaWN8=;
        b=kjeuqpNQavzd2hC5kyqz27UWv5nAbKs7jKLTRMyZjyxYtqAsXtAG3Lk3Yah02e4PkW
         VH9X5q1inRvkRYK6297VQ9+0LmmivERFG8BK3EhwerXO5I80Uwermq0Xmwe7IyslgQt0
         cecT+F13O+rLhY9BwqNcuL9r/or0XmLTTPrNJ/o3MfmYPxvNf0rSwl4SSXthaly8pAqu
         R8YR1HlBkncCfZvQ5WkJ98uyjWjpKS6PzwJgx90V1a1B8JM6DGF/lM3hQDCAC2Gnk29a
         7eSPfrpATkjkSFqE3pGOvwbsLG/5tkmn/j7oGohd7+PE+VCQy+jr6uA7yaenQDsJJol/
         ePNw==
X-Forwarded-Encrypted: i=1; AJvYcCWtD5XWFcDdlQXHWTckThV7sj6LOU4k00H4al/gS57HB/XEw4SR0tSlc4UUg4NglAomWwdHZQrkYQc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBbtxIMQHmk3TAbPC+NUUqaY0W5pEXXPuiMoHYzLzNUC/EP7VK
	h5OeH3s0iTboFDBe3taz9RhLRVeon+r2by7jk8uYLWKze13UiYURgaETGHIZCCC4mvz8NgRLG8Y
	N4pRZCtXch3L5wsiplXzCY/NTDzP58UqqdJqTZ7uJqiSqY0SE4qUXi9L1kd+5ObHogqTl
X-Gm-Gg: ASbGncv9pzBr21MdRbMbZ7w6DrQ7sccW+oXbIq/Uhd4RuTPnYmmVPYZ5eqIYHkQzP7I
	CovH4GmVxkLzcgewfjpqBKr1Jl7ifhZIcbV/1MqsT+ItbkdTH09K5ikXJwktZ9sx0Iif+T3ln0e
	T5nTcdirJgVqe2AuzOEDD+8CMig9g2ZGbi/xhcbU34l7NQt76p/maZuiu2wvB0TIIZ1F7uw7Hj5
	G4yXERnmwJ9sd+90ZRh3nC9jsGbkhdqpWJkgAs4lGGaj8g+FwDfff5ho3Wk8BTrQ5xV89CUO4Ew
	zqvcQfJ3Yli6lJVDAWMfg6QaDBWM02AeaJ2BkRji+6QKRWvtKkJFei6UAY/EVQDX4YCIWrgkKlX
	8/M7FVP3Yxmt/YKd44I4tig==
X-Received: by 2002:a05:622a:1c15:b0:4b7:7c2c:8534 with SMTP id d75a77b69052e-4c06e3f8fe3mr6440771cf.15.1758226323614;
        Thu, 18 Sep 2025 13:12:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlL/+jeC2xoiK55a+vc+/BjJtvtoJAoNqaFYRNOAjjjJKNk/RRtRDSXXsR7MkcplaBP8vv5Q==
X-Received: by 2002:a05:622a:1c15:b0:4b7:7c2c:8534 with SMTP id d75a77b69052e-4c06e3f8fe3mr6440401cf.15.1758226322974;
        Thu, 18 Sep 2025 13:12:02 -0700 (PDT)
Date: Thu, 18 Sep 2025 16:11:59 -0400
From: Peter Xu <peterx@redhat.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Helge Deller <deller@gmx.de>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
	Klaus Jensen <its@irrelevant.dk>,
	Jesper Devantier <foss@defmacro.it>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
	John Levon <john.levon@nutanix.com>,
	Thanos Makatos <thanos.makatos@nutanix.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/7] docs/devel: Do not unparent in instance_finalize()
Message-ID: <aMxnj7ID0PpWUVNu@x1.local>
References: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
 <20250917-use-v3-1-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
 <aMxlpfp_LSgiIk9Z@x1.local>
MIME-Version: 1.0
In-Reply-To: <aMxlpfp_LSgiIk9Z@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ewBEzSpwM5U06pT75eya7oFfG1QjkMRc16p7R5X04vc_1758226324
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Sep 18, 2025 at 04:03:49PM -0400, Peter Xu wrote:
> On Wed, Sep 17, 2025 at 07:13:26PM +0900, Akihiko Odaki wrote:
> > Children are automatically unparented so manually unparenting is
> > unnecessary.
> > 
> > Worse, automatic unparenting happens before the instance_finalize()
> > callback of the parent gets called, so object_unparent() calls in
> > the callback will refer to objects that are already unparented, which
> > is semantically incorrect.
> > 
> > Remove the instruction to call object_unparent(), and the exception
> > of the "do not call object_unparent()" rule for instance_finalize().
> > 
> > Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> > ---
> >  docs/devel/memory.rst | 19 ++++++-------------
> >  1 file changed, 6 insertions(+), 13 deletions(-)
> > 
> > diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
> > index 57fb2aec76e0..749f11d8a4dd 100644
> > --- a/docs/devel/memory.rst
> > +++ b/docs/devel/memory.rst
> > @@ -161,18 +161,11 @@ or never.
> >  Destruction of a memory region happens automatically when the owner
> >  object dies.
> >  
> > -If however the memory region is part of a dynamically allocated data
> > -structure, you should call object_unparent() to destroy the memory region
> > -before the data structure is freed.  For an example see VFIOMSIXInfo
> > -and VFIOQuirk in hw/vfio/pci.c.
> 
> Should we still keep some of these examples?  After the series they'll be
> doing the right things.  Dynamic MRs are still slightly tricky, I think
> it's still good to have some references.
> 
> > -
> >  You must not destroy a memory region as long as it may be in use by a
> >  device or CPU.  In order to do this, as a general rule do not create or
> > -destroy memory regions dynamically during a device's lifetime, and only
> > -call object_unparent() in the memory region owner's instance_finalize
> > -callback.  The dynamically allocated data structure that contains the
> > -memory region then should obviously be freed in the instance_finalize
> > -callback as well.
> > +destroy memory regions dynamically during a device's lifetime.
> > +The dynamically allocated data structure that contains the
> > +memory region should be freed in the instance_finalize callback.
> >  
> >  If you break this rule, the following situation can happen:
> >  
> > @@ -198,9 +191,9 @@ this exception is rarely necessary, and therefore it is discouraged,
> >  but nevertheless it is used in a few places.
> >  
> >  For regions that "have no owner" (NULL is passed at creation time), the
> > -machine object is actually used as the owner.  Since instance_finalize is
> > -never called for the machine object, you must never call object_unparent
> > -on regions that have no owner, unless they are aliases or containers.
> > +machine object is actually used as the owner.  You must never call
> > +object_unparent on regions that have no owner, unless they are aliases
> > +or containers.
> 
> This looks like a completely separate change.  So we start to allow
> machines to be finalized now?  I'm not familiar with machine object
> lifecycles.  Maybe split it out even if it's true?

I didn't see anything elsewhere.  If you agree with above, I can queue this
series with above touched up, then no need to repost.

Thanks,

-- 
Peter Xu


