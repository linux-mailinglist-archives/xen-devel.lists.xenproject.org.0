Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671A18FCF35
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 15:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735777.1141896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEqfi-0006vs-Oo; Wed, 05 Jun 2024 13:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735777.1141896; Wed, 05 Jun 2024 13:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEqfi-0006ur-KF; Wed, 05 Jun 2024 13:27:22 +0000
Received: by outflank-mailman (input) for mailman id 735777;
 Wed, 05 Jun 2024 13:27:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OW4N=NH=redhat.com=mlureau@srs-se1.protection.inumbo.net>)
 id 1sEqfh-0006ul-5U
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 13:27:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53e288df-233f-11ef-90a2-e314d9c70b13;
 Wed, 05 Jun 2024 15:27:19 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-G0jeKpUlOxC9KhJDWL7tqA-1; Wed, 05 Jun 2024 09:27:14 -0400
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-57a9e2e43c0so457976a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jun 2024 06:27:14 -0700 (PDT)
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
X-Inumbo-ID: 53e288df-233f-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717594036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f9e4KwmmjiJ5xmaAO0+LStJyYZP1//KhEcep2QFkcTI=;
	b=YRhepYGQ89MVJb4rYm1ilpmmqU0u1RVcHcYRz45Z9q2RrwoIFDQRnf3P2StBpwyncmGdmH
	9HzoTwU4OyX4sUhnM5M+tzIKq51kbx8TJ/eG2NKPlfnFOj/GgCC9PC1a4gqxsYPiFxMQCw
	WqKYooRC7VDevw6TLteJEsGPkYu2Oe4=
X-MC-Unique: G0jeKpUlOxC9KhJDWL7tqA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717594031; x=1718198831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9e4KwmmjiJ5xmaAO0+LStJyYZP1//KhEcep2QFkcTI=;
        b=OmQ7d7ynYpVdow0fT5PTrceM/9MptJALvf0b2bwBkQBBdssUeV0WtDAlzfXK/8hHaN
         GuHkNKjVrhPZ0rzVO/B+ZbBd1PJVJkmQkfLTxz2t8egVm/P4wLXHNbl4XV+c3zxecita
         YAE9Ba+OIv/wNVMH8fNIVIolksjEe05mYuUpvJ3U1ycXSb9ItVjqsIzXfzzsRk92uIO+
         IlogfUw9Qs892gphoPvPA6vhFL4IvvY2DPankVfb0RcpAgRlAXdB7F+El/ng45Qtq3n5
         qCnRu+uZ/piGXGB2CJTiXNJvIXjpctqfksoX8MQRk6bNKImwdMr+315cV16agk7/LDNV
         E3ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW47EGNwcUBR0XjvBWiHspkoIvpM6rmEEFmBHIz9koBrl574GH3ShIl+PaosoyTQuTEvdFzlKCIgJhewQJy8P/ftNkYZu0fPCKCBahr328=
X-Gm-Message-State: AOJu0YxrCcPnSmbZExinAG7jRkddnP4yjN5IJdyMY5pTH5qi6UotJVja
	BP+Qu6GRgvLS4UvXrDToNIPGNvTsWfdIAU+EacA4r03a0F4oQxqh9DSKmCoPhqu9ceEvNpf1q8d
	m45FmzcaU6qTnBCrTgNkP6pQiSTOJPSML8fSxdEAMEM593ULV/qfI8m+gpGyphz/365TYFkmI5U
	Js2GHwO7WV8VsWmBsSAtdzw2JGnJrwRaDQVvFXzAA=
X-Received: by 2002:a50:9e0f:0:b0:579:d34c:396a with SMTP id 4fb4d7f45d1cf-57a7a6c18bdmr4149077a12.11.1717594031345;
        Wed, 05 Jun 2024 06:27:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrqbKaA8JYmGJu9SWv44omNvgzVPehMk6+vUutUBatoaFuw/tX7cJUj872ybAZaprPmRtrqSdff3f+TbTs/Ww=
X-Received: by 2002:a50:9e0f:0:b0:579:d34c:396a with SMTP id
 4fb4d7f45d1cf-57a7a6c18bdmr4149067a12.11.1717594030978; Wed, 05 Jun 2024
 06:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240605131444.797896-1-kraxel@redhat.com>
In-Reply-To: <20240605131444.797896-1-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 5 Jun 2024 17:26:58 +0400
Message-ID: <CAMxuvawet2HKobd7RjQ3dG5bW17zuMTNMj_Zmoc-m==iizB8xQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] stdvga: fix screen blanking
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, 
	Anthony PERARD <anthony@xenproject.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 5:14=E2=80=AFPM Gerd Hoffmann <kraxel@redhat.com> wr=
ote:
>
>
>
> Gerd Hoffmann (3):
>   stdvga: fix screen blanking
>   ui+display: rename is_placeholder() -> surface_is_placeholder()
>   ui+display: rename is_buffer_shared() -> surface_is_allocated()
>
>  include/ui/surface.h    |  6 +++---
>  hw/display/qxl-render.c |  2 +-
>  hw/display/vga.c        | 24 +++++++++++++++---------
>  hw/display/xenfb.c      |  5 +++--
>  ui/console.c            |  3 ++-
>  ui/sdl2-2d.c            |  2 +-
>  ui/sdl2-gl.c            |  2 +-
>  7 files changed, 26 insertions(+), 18 deletions(-)
>

for the series:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


