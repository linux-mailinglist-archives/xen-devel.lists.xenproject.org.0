Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA11B86D01
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 21:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126571.1468095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzKmJ-00016r-7e; Thu, 18 Sep 2025 19:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126571.1468095; Thu, 18 Sep 2025 19:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzKmJ-00015F-4z; Thu, 18 Sep 2025 19:58:51 +0000
Received: by outflank-mailman (input) for mailman id 1126571;
 Thu, 18 Sep 2025 19:58:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j8y1=35=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1uzKmH-000159-A2
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 19:58:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e02c2246-94c9-11f0-9809-7dc792cee155;
 Thu, 18 Sep 2025 21:58:42 +0200 (CEST)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-aRxG5rpCMx6-Pb2hK5WnQw-1; Thu, 18 Sep 2025 15:58:38 -0400
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b7a5595a05so29153961cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Sep 2025 12:58:38 -0700 (PDT)
Received: from x1.local
 (bras-base-aurron9134w-grc-11-174-89-135-121.dsl.bell.ca. [174.89.135.121])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4bdaa0c5156sm18265951cf.45.2025.09.18.12.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 12:58:36 -0700 (PDT)
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
X-Inumbo-ID: e02c2246-94c9-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758225521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZhJgUVOrIl/9LhFZvU5vWNCdAStYK7nWNGdsvwSJnMA=;
	b=Xk/T2/0eg3aNeKzJuRENqlwy0f6ugZ7nRYkDMx9TRGAswTetDfQOZp0EG+zyY4GFN9Jhyc
	ASr393UiDEb7AlCUq4YlgBfqoGZPoJM0iT2uv94tMCaOKDDP+RR83C30Gvlf+lI23d858R
	yIaTPO4M9eB1an+G0FTbIBhyMUM8+II=
X-MC-Unique: aRxG5rpCMx6-Pb2hK5WnQw-1
X-Mimecast-MFC-AGG-ID: aRxG5rpCMx6-Pb2hK5WnQw_1758225518
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225517; x=1758830317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhJgUVOrIl/9LhFZvU5vWNCdAStYK7nWNGdsvwSJnMA=;
        b=hxaQlyKYOjzMLS4IqVTXZfdvvpMGPJ11geWlR26yfTOJ1E2IM6wSKeoAEqcGG5j4zm
         aCe0i6YtX0Dy3vrCOhJk4TGhhaF0fqw5NmAlAoD1ygDMv9tIcItxvst2aV+mdGiMz5ca
         JXKeUH+YHrUEcZ8ax7GuvmeRIM8lkhByClUSDq44LiremSjmCk/vJFmaSZAG12nbmo5Y
         g+nXRsfKX8I7PVd0hHqXw1lNlbF5kAPD/GW1qebNqh5GOuA5NYmjxNStextO+8JzxHTR
         TF4fHlFRLzPrTKzUF0YGkjfl+eFZkvhnndAHWw8g+60XuxKyVL2UUp9kAcbNwmT3ULfy
         /lmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkhEKf2B5ebFgHzMnA2YKfV9HTzbvrR7mhi2mfok+cWVF9TeB4ElbV2Yt9pmLj1JeJvbibPhjnCxA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGTvrBxYXoEAH8njMoezSUmpPCFKUfAoqoDHBWa/W+vYWPonnS
	Io/YgdGWNDvvh8GRij/F9YGto1wIfoKorNkZjKMn6rdy6Qxg5Hz8ASkZNS/BCrDNc7G6sxCV5xQ
	hVFRce1a8PeDbZGftqIemUBFlRblIWOY32z2fdx4H02fdTOyLDDqY0KWINU9lJz1SbHUg
X-Gm-Gg: ASbGncuCGkuZq2LFF6RKD80yOgtnqPSL4ZYrExIIzqD/nSzYg6yhrE9TklGgaqA+AjO
	2IXC7ajyuaxqOwUk17SzkNPE5Qd3L+S+wJaLtgQ9uQbLL979UJTDA6penawNhphx7l7WUKrkeZZ
	Z4UjFxKbCNjghGgzXBPawHlTRjGM2pApv/H7Vcd8nHmD+Qsgk4xWbGpVDrEYxjM31hE/BPSZf8V
	Ve5adoXo+VkK1jT4jf6HriPUZWbkUeuzhtjp5gos3zOk4nsPhJbZRblOtnBEUFB3Gt1l0o5jDN3
	tpS/vO/R/lUzpGwVWkTlo6xs53B/ffMYzSbvRnoNDJ+7rUX3Yyjv9ZJMUCpl7g4gbKGl2aFyaG7
	iGH21Kyz8iDtfuHhESU1MzA==
X-Received: by 2002:ac8:6f15:0:b0:4b7:9aea:1a0d with SMTP id d75a77b69052e-4c0755a38cdmr6897491cf.76.1758225517485;
        Thu, 18 Sep 2025 12:58:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2L65vYNy7m4Z+UcdbfZGg3yWRQ/fGOSzmRN1Yhv/tl482ETUqjK3x9J9txcg/04v64li47Q==
X-Received: by 2002:ac8:6f15:0:b0:4b7:9aea:1a0d with SMTP id d75a77b69052e-4c0755a38cdmr6896771cf.76.1758225516835;
        Thu, 18 Sep 2025 12:58:36 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:58:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org,
	Alex Williamson <alex.williamson@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
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
Subject: Re: [PATCH v3 0/7] Do not unparent in instance_finalize()
Message-ID: <aMxkaLbykwqD1yHn@x1.local>
References: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
 <aMqiK5SaeBJlSa_h@redhat.com>
 <a1ad2a8f-8a69-4d25-bffd-482aec2fe9db@rsg.ci.i.u-tokyo.ac.jp>
 <aMq073aYphuFO2En@redhat.com>
 <aMq2V0rD2Q27VXOg@redhat.com>
MIME-Version: 1.0
In-Reply-To: <aMq2V0rD2Q27VXOg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XTiPRqaDJkq9AHUL8Fa1SdICQKWJwd2mZCxb29MJ_6o_1758225518
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Sep 17, 2025 at 02:23:35PM +0100, Daniel P. Berrangé wrote:
> On Wed, Sep 17, 2025 at 02:17:35PM +0100, Daniel P. Berrangé wrote:
> > On Wed, Sep 17, 2025 at 09:24:04PM +0900, Akihiko Odaki wrote:
> > > On 2025/09/17 20:57, Daniel P. Berrangé wrote:
> > > > On Wed, Sep 17, 2025 at 07:13:25PM +0900, Akihiko Odaki wrote:
> > > > > Based-on: <cover.1751493467.git.balaton@eik.bme.hu>
> > > > > ("[PATCH v2 00/14] hw/pci-host/raven clean ups")
> > > > > 
> > > > > Supersedes: <20240829-memory-v1-1-ac07af2f4fa5@daynix.com>
> > > > > ("[PATCH] docs/devel: Prohibit calling object_unparent() for memory region")
> > > > > 
> > > > > Children are automatically unparented so manually unparenting is
> > > > > unnecessary.
> > > > 
> > > > Where is automatic unparenting you're referring to being done ?
> > > > 
> > > > > Worse, automatic unparenting happens before the instance_finalize()
> > > > > callback of the parent gets called, so object_unparent() calls in
> > > > > the callback will refer to objects that are already unparented, which
> > > > > is semantically incorrect.
> > > > 
> > > > IIUC, object_property_add_child will acquire a reference on
> > > > the child, and object_property_del_child (and thus
> > > > object_unparent) will release that reference.
> > > > 
> > > > The 'object_finalize' method, and thus 'instance_finalize'
> > > > callback, won't be invoked until the last reference is
> > > > dropped on the object in question.
> > > > 
> > > > IOW, it should be impossible for 'object_finalize' to ever
> > > > run, as long as the child has a parent set.
> > > > 
> > > > So if we're in the 'finalize' then 'object_unparent' must
> > > > be a no-op as the child must already have no references
> > > > held and thus no parent.
> > > > 
> > > > IOW, the reason to remove 'object_unparent' calls from
> > > > finalize is surely because they do nothing at all,
> > > > rather than this talk about callbacks being run at the
> > > > wrong time ?
> > > 
> > > This patch series deals with the situation where the parent calls
> > > object_unparent() in its instance_finalize() callback. The process of
> > > finalization looks like as follows:
> > > 
> > > 1. The parent's reference count reaches to zero. Please note that there can
> > > be remaining children that are referenced by the parent at this point.
> > > 
> > > 2. object_finalize() is called.
> > > 
> > > 2a. object_property_del_all() is called and the parent releases references
> > > to its children. This is what I referred as "automatic unparenting". The
> > > children without any other references will be finalized here.
> > > 
> > > 2b. instance_finalize() is called. Past children may be already finalized,
> > > and calling object_unparent() here will cause dereferencing finalized
> > > objects in that case, which should be avoided.
> > 
> > Oh, so these object_unparent calls run by the parent, against the child
> > in fact use-after-free flaws.
> 
> Oh actually not a use-after-free since memory regions aren't directly
> freed by object_finalize.

We discussed this previously, I think so far it's 100% safe to call
object_unparent() twice, because step (2a) will reset child->parent=NULL.
Then at (2b) calling object_unparent() will be 100% safe because it's no-op
for an object that is orphaned.

So the series looks good, but it's kind of a cleanup, as object_unparent()
is just unnecessary for these MRs, same to the memory.rst doc suggestions
which can be avoided.

Thanks,

-- 
Peter Xu


