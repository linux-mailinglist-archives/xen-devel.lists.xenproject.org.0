Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B595E8DA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 08:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783322.1192636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siTHL-0000F2-Au; Mon, 26 Aug 2024 06:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783322.1192636; Mon, 26 Aug 2024 06:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siTHL-0000E2-7d; Mon, 26 Aug 2024 06:32:39 +0000
Received: by outflank-mailman (input) for mailman id 783322;
 Mon, 26 Aug 2024 06:32:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=75pI=PZ=redhat.com=jasowang@srs-se1.protection.inumbo.net>)
 id 1siTHJ-0000Dw-F1
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 06:32:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faf154a9-6374-11ef-a50b-bb4a2ccca743;
 Mon, 26 Aug 2024 08:32:36 +0200 (CEST)
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-GAU5o5qGNPmmD9l4NVVahg-1; Mon, 26 Aug 2024 02:32:31 -0400
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-498cd41e002so1479024137.1
 for <xen-devel@lists.xenproject.org>; Sun, 25 Aug 2024 23:32:31 -0700 (PDT)
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
X-Inumbo-ID: faf154a9-6374-11ef-a50b-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JESifInmWvZeQwWI8Jn8J0cYeIeDZ3prAXhvDlTsSj8=;
	b=KItGRfcS2Lvxd1m0u7N4RiETE+AfSkM3mh2FoTfQjeKJLsutgttZ/inBtuvU85/F3ux3Bl
	uugK4gheL50W6LPxVyO62C5/UNCbJaKsdkYfvTtWACpxvvSb52PSJ9MGeXr2HjXcMPAr+R
	ejU9tTj3y6wxYp5Q2AYQWscWjE/pc1g=
X-MC-Unique: GAU5o5qGNPmmD9l4NVVahg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724653951; x=1725258751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JESifInmWvZeQwWI8Jn8J0cYeIeDZ3prAXhvDlTsSj8=;
        b=tuAyVBAnXr/2x8Dp7/+Fu8buGVnXIHeUm4LC4oPhTiEKB0OYILWFNAumRgfpRuYd9n
         fyFLCQywPSXDch1V2fkUtAfgZUevwjJyyG9u7C1BC1CdvFgWx6gc7Yyho2933uhYmos1
         WbWDS5Pu72GncpC1A4XFjXya+B4bGcmlrsdgQ+P4idCUqHhbwpA/9MgV739zT6tG05jY
         pbOaJHH3I+xmdrbbZNp98LLJL9zlpbCArfa6OrhhBJjMogBDzuKMeheXctMzoISNGwNz
         eROhF1sT6MaX5jyFCbMNF4ZmVbT2tLRpB98IKFA8+doj1k9hVznBk3S3shXA3o5DRpJh
         D6Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUEphv6mrL0wTTSLH/83aZEIAsore6u5mOibvhRi2MAlGwsKfe8yc+8FwlthHWuB/TXie8GWM6B7kk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpapKYMalva/iTzFHS43GZ7cAWtZjC786/KRuO68js+QQbN1be
	Ss2Hq4yCAAyg2SI5ih2irdDw+vvSxDE5NSrwZvZlCeD1iEy4DQEXfnuJcksc12xug+ZPVGP/wzG
	JT7YHsy4wbQSZMD63dGURbfohiNg13n5NOf8cBPIf/EG7xff3JD+Y6MYFtd8f4NbTLYcF9mrNUx
	YdxFdg5oJ6UcGHEag9aVc2su/5DZnn0BIy8W1DXyM=
X-Received: by 2002:a05:6102:3f0f:b0:498:cca9:8b3 with SMTP id ada2fe7eead31-498f4768d98mr6498557137.31.1724653950690;
        Sun, 25 Aug 2024 23:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwydcuFOVlgtFmwjWlxiF2u2xtiMO6UvY+/x7l/PEgUFs/udwBSaHF5gxdau0K58G8iWDDv631otNdoDoL8Rg=
X-Received: by 2002:a05:6102:3f0f:b0:498:cca9:8b3 with SMTP id
 ada2fe7eead31-498f4768d98mr6498530137.31.1724653950260; Sun, 25 Aug 2024
 23:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240824035817.1163502-1-hch@lst.de> <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com>
 <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com> <20240826063002.GA30266@lst.de>
In-Reply-To: <20240826063002.GA30266@lst.de>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Aug 2024 14:32:15 +0800
Message-ID: <CACGkMEvB20-iwNKepBdJBNAvxN-5+MduxnX6XDbPFsVA4hNz5A@mail.gmail.com>
Subject: Re: clearly mark DMA_OPS support as an architecture feasture
To: Christoph Hellwig <hch@lst.de>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, iommu@lists.linux.dev, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-media@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 2:30=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Mon, Aug 26, 2024 at 02:27:27PM +0800, Jason Wang wrote:
> > Actually I meant, we can extend the virtio_config_ops to allow mapping
> > ops there, then simulator and VDUSE can hook the map ops there.
>
> From a quick glance that feels like the right layer of abstraction,
> although the config part of the name feels wrong at that point.

Right, or we could have a dedicated map_ops instead of trying to use
virtio_config_ops.

Thanks

>


