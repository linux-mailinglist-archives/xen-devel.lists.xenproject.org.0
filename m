Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6467D8FCBF1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 14:09:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735745.1141845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEpRl-0002Ij-5B; Wed, 05 Jun 2024 12:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735745.1141845; Wed, 05 Jun 2024 12:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEpRl-0002HA-2h; Wed, 05 Jun 2024 12:08:53 +0000
Received: by outflank-mailman (input) for mailman id 735745;
 Wed, 05 Jun 2024 12:08:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OW4N=NH=redhat.com=mlureau@srs-se1.protection.inumbo.net>)
 id 1sEpRj-0002Gz-Sq
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 12:08:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dd2ca5d-2334-11ef-b4bb-af5377834399;
 Wed, 05 Jun 2024 14:08:50 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-h_UGk8sUMvS-YfTWapbYEg-1; Wed, 05 Jun 2024 08:08:47 -0400
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-57a306c4b1eso3237982a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jun 2024 05:08:47 -0700 (PDT)
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
X-Inumbo-ID: 5dd2ca5d-2334-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717589328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2v9Z4zn5H16gf2IEP0RcvQSdt1WbgFyv76Fd0JybRQE=;
	b=NIsDfowt3iB6zNABTta6Cjs9pcnu/470jqWtXTPCs9BM7KZeXNlllBCNDxgjATgY0f6qbH
	empyx4v5qJD++bM60CzyV5jFmqBtPn1UtN6uEagXbv9HWqUFdftb0/D4EzdOJ4PCHVf2Eg
	EcCUzheeL7l7FvS/soiPjdcBflZ1dvg=
X-MC-Unique: h_UGk8sUMvS-YfTWapbYEg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717589326; x=1718194126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v9Z4zn5H16gf2IEP0RcvQSdt1WbgFyv76Fd0JybRQE=;
        b=iumGmIedipODdjRCamjY0ynhfPh1cGpcy4ME/z9NAjsiRNVu3jHlpAZK+gFnqPsh+L
         VnfXMhbO/bp9iKv8XvUohsBvgXsPZaOeTf6p4smQAfTCPUlGLB4+iIxWG4a2auZUjaqo
         fHiKmNEByxEAfSTIQGes6vMr7onxzWDavaXOmZITXXNCsT03vW2NiCqwNMLhb42sQmSP
         deZ/Z9Vib2TYCsT2RDHVmn9lAB/vmSYt7II8dHy9Z5Db9Gk45qtON/SAqpr+AwcAwoI2
         bMTtU+y/KJETDrJY//vSpqJ2TbGVxF9QNJDVHvWbL0iV0mUkBqoRy1xkALGG6sYHQBty
         xGsA==
X-Forwarded-Encrypted: i=1; AJvYcCVo7hW4ApSSleupNfS3VZbCyet2lhhD8Kjg4oITPtAHN0q0gtgl2F3eIHuy4Wh7cavM3tHN/DM9YKgkBErTyRzWIbvLssE/4UrFmwqONNc=
X-Gm-Message-State: AOJu0YxGOYKoZoUYCC8ESjuugWzB90vH/7eVHHD9bdQPD31rDvdtlN7I
	Z7mqFoqDmalziT0kqO3c9Zbi+dU64z8iH05Ja92MZ1lEJHAc3Eq34573NRkUExeIOwoCJfbBonX
	uKlbzUXeWwSbNK6wAHxieeUcyBFx+PKOFvpKQ6KIzknR1esMesDeIKKEV+9C/hKI0elgdFDB2ZF
	RQ+zm590tixwrnfZv1P0OelwkjUMGDbLlf6AnLoHw=
X-Received: by 2002:a50:ccc6:0:b0:57a:27e5:2a8a with SMTP id 4fb4d7f45d1cf-57a8b67c31fmr1805739a12.8.1717589326254;
        Wed, 05 Jun 2024 05:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+JxuJ520EzT+4QtY4uXVm+JfZMvYvj6q9jh0fTRQVgJJ52LosO9DfGMFok6kJpKaWnybVCz6cTTo87EWHuIc=
X-Received: by 2002:a50:ccc6:0:b0:57a:27e5:2a8a with SMTP id
 4fb4d7f45d1cf-57a8b67c31fmr1805731a12.8.1717589325928; Wed, 05 Jun 2024
 05:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240603151825.188353-1-kraxel@redhat.com> <20240603151825.188353-2-kraxel@redhat.com>
 <CAMxuvawqf-0dKPsZP2UTcDWPWQ+8FKbZ=S4KX02hQO1qeeGVMA@mail.gmail.com> <tmtartaqh2ac4azfq4cgwh22uuc4pnrnxjpcpky24xzjrkwb5c@ung7cyha4ppa>
In-Reply-To: <tmtartaqh2ac4azfq4cgwh22uuc4pnrnxjpcpky24xzjrkwb5c@ung7cyha4ppa>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 5 Jun 2024 16:08:33 +0400
Message-ID: <CAMxuvay6qMGCSc7eWzs0Nu7x=VOyG6D56Jb9sNe+azh80GFe1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] stdvga: fix screen blanking
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>, 
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, qemu-stable@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 5, 2024 at 11:36=E2=80=AFAM Gerd Hoffmann <kraxel@redhat.com> w=
rote:
>
> On Tue, Jun 04, 2024 at 10:27:18AM GMT, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > > +    if (is_buffer_shared(surface)) {
> >
> > Perhaps the suggestion to rename the function (in the following patch)
> > should instead be surface_is_allocated() ? that would match the actual
> > flag check. But callers would have to ! the result. Wdyt?
>
> surface_is_shadow() ?  Comes closer to the typical naming in computer
> graphics.

If the underlying flag is renamed too, that's ok to me.


