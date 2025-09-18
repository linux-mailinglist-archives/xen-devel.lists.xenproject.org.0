Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6062CB86D21
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 22:04:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126585.1468105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzKrG-0002i8-PG; Thu, 18 Sep 2025 20:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126585.1468105; Thu, 18 Sep 2025 20:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzKrG-0002g5-Mb; Thu, 18 Sep 2025 20:03:58 +0000
Received: by outflank-mailman (input) for mailman id 1126585;
 Thu, 18 Sep 2025 20:03:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j8y1=35=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1uzKrF-0002fu-Il
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 20:03:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b815562-94ca-11f0-9d14-b5c5bf9af7f9;
 Thu, 18 Sep 2025 22:03:57 +0200 (CEST)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-4FgNIfiwPGqI7IfuebIWrg-1; Thu, 18 Sep 2025 16:03:54 -0400
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b60dd9634dso28278751cf.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Sep 2025 13:03:54 -0700 (PDT)
Received: from x1.local
 (bras-base-aurron9134w-grc-11-174-89-135-121.dsl.bell.ca. [174.89.135.121])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4bda15f91a0sm19307741cf.1.2025.09.18.13.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 13:03:52 -0700 (PDT)
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
X-Inumbo-ID: 9b815562-94ca-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758225836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LgVRs4qDWWl/SassPeYOJGunpCbcT4oPhyAu1oaWNOQ=;
	b=S7Ki0vBOvTkGsDnbAugmyhW83aFqvZGqXhokZtk3aQrUJoHeQUqU2emEfsUZxamDcOt7Wl
	1phEZkaA+7AFuYsF20h6aEH3LBpVMtsVU1nLoSykrBjWfW8VWn59fYevUHxkQnT/GjQ9iL
	dIb5wk+wYHOMsIV4SsY5Lh08uHe1yDY=
X-MC-Unique: 4FgNIfiwPGqI7IfuebIWrg-1
X-Mimecast-MFC-AGG-ID: 4FgNIfiwPGqI7IfuebIWrg_1758225834
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225834; x=1758830634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgVRs4qDWWl/SassPeYOJGunpCbcT4oPhyAu1oaWNOQ=;
        b=Zl4Wn99oGVdrl0ETQTPhTU8H/a1nYcOfUw9S/VvOdgWJzq11pYk+e7wdqI2n/RO8pB
         QgvG24eydz0SLnWjcnFdeL0Uq5MmsJ5EQqGjizghjWwHXjoijImPnnivQc43yT9HBdk+
         0btJiICsGlLfI51Pz4F9O/nLpe8EqmTmWWGXZBh5SSdoOfQCfyQW/QwXJiykGhU2yp4T
         AZOOSbHbo6a/IlEOmNu2w6GHNs+NXvc/+X4YDfmXdIrHz+tr/GHgeGJAuYZBWTnzAR3+
         9MdjjtpZBa9VNiu9yZ1L5+U9GgXU/JtA2YqLiF9mvFFvNiPWEZWQ29Kd445mdJ0ZLfyq
         QwnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVagIlIqWx38xajlMhnAvo222+CrdWjmqxULOA+7L5m0oojLEnxUsWaw9x/cX6EKYrzE145+2Re7pU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOSDxj5+jaKb9ZF9W1tsE4UU2V9YH0WQOZrQK6Z4qHR3HaSvyv
	SVLH+P+nYkFiRx00Igqed8Mlw1ChOGp9iN8eV5RjjdZ0pS5LCK8mKyDNLeZ3ZS6Z8+Xe9NsKEoh
	+PR0SOcztlgPAni0OWAIUKJQ3KEkb0zaNfl6CJjWlUwwHOZV5Ggc7JiL+fx62hJX+Kurh
X-Gm-Gg: ASbGncvPxgrwiQWBuYihJnkP8jahgfekuNSZEvmWP8EkVTXGd0sjgZswNRhZG1zQoxX
	xugf6apH41VwOYWenrd1GVQRJ+7aQjR5f/BPAcOVZrhEwxM/yrIfnC6J9MR7G66SqZiZc/SAatK
	cEwFOwa6THU/3n+eqaWLz+act5TRDvuQEU1kan0eDyiwt7Vy4Nh1hU+J9AkPwSRWh8GQcNWr4Lk
	FIZrB+KNFQbIKT0pNFNbYpkVFFRKUOmji5wCqDt0TRcyGDpzj7vD36Ba7bZhV9vpc4AmDxnvWxn
	aT0KI9AqoYUoFltzDQYxjsCOnbbSsH5vs/Mr94HMT+vkmtjNmyKHduUPNAwfvapcck3hWnCjEMN
	QK9Vhx1n9Mid6sxb5efPHmA==
X-Received: by 2002:a05:622a:5a88:b0:4b7:a98b:8933 with SMTP id d75a77b69052e-4c072d2d400mr6025911cf.62.1758225833754;
        Thu, 18 Sep 2025 13:03:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB62ZbYxbCV9ZW2QX6E1EIwlRMLvImUy5ZMYB2/qRwmfyMDoEyMnXIs2TXp5P2RdybchVl+g==
X-Received: by 2002:a05:622a:5a88:b0:4b7:a98b:8933 with SMTP id d75a77b69052e-4c072d2d400mr6025121cf.62.1758225833133;
        Thu, 18 Sep 2025 13:03:53 -0700 (PDT)
Date: Thu, 18 Sep 2025 16:03:49 -0400
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
Message-ID: <aMxlpfp_LSgiIk9Z@x1.local>
References: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
 <20250917-use-v3-1-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
In-Reply-To: <20250917-use-v3-1-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DP4OJgtEntgX6uPWD2zYiopcK8FreBLhMwm9YZLDtfI_1758225834
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 17, 2025 at 07:13:26PM +0900, Akihiko Odaki wrote:
> Children are automatically unparented so manually unparenting is
> unnecessary.
> 
> Worse, automatic unparenting happens before the instance_finalize()
> callback of the parent gets called, so object_unparent() calls in
> the callback will refer to objects that are already unparented, which
> is semantically incorrect.
> 
> Remove the instruction to call object_unparent(), and the exception
> of the "do not call object_unparent()" rule for instance_finalize().
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>  docs/devel/memory.rst | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
> index 57fb2aec76e0..749f11d8a4dd 100644
> --- a/docs/devel/memory.rst
> +++ b/docs/devel/memory.rst
> @@ -161,18 +161,11 @@ or never.
>  Destruction of a memory region happens automatically when the owner
>  object dies.
>  
> -If however the memory region is part of a dynamically allocated data
> -structure, you should call object_unparent() to destroy the memory region
> -before the data structure is freed.  For an example see VFIOMSIXInfo
> -and VFIOQuirk in hw/vfio/pci.c.

Should we still keep some of these examples?  After the series they'll be
doing the right things.  Dynamic MRs are still slightly tricky, I think
it's still good to have some references.

> -
>  You must not destroy a memory region as long as it may be in use by a
>  device or CPU.  In order to do this, as a general rule do not create or
> -destroy memory regions dynamically during a device's lifetime, and only
> -call object_unparent() in the memory region owner's instance_finalize
> -callback.  The dynamically allocated data structure that contains the
> -memory region then should obviously be freed in the instance_finalize
> -callback as well.
> +destroy memory regions dynamically during a device's lifetime.
> +The dynamically allocated data structure that contains the
> +memory region should be freed in the instance_finalize callback.
>  
>  If you break this rule, the following situation can happen:
>  
> @@ -198,9 +191,9 @@ this exception is rarely necessary, and therefore it is discouraged,
>  but nevertheless it is used in a few places.
>  
>  For regions that "have no owner" (NULL is passed at creation time), the
> -machine object is actually used as the owner.  Since instance_finalize is
> -never called for the machine object, you must never call object_unparent
> -on regions that have no owner, unless they are aliases or containers.
> +machine object is actually used as the owner.  You must never call
> +object_unparent on regions that have no owner, unless they are aliases
> +or containers.

This looks like a completely separate change.  So we start to allow
machines to be finalized now?  I'm not familiar with machine object
lifecycles.  Maybe split it out even if it's true?

-- 
Peter Xu


