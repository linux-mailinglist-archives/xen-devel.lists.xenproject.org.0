Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D792761E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 14:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753799.1162084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPLeC-00046X-Fp; Thu, 04 Jul 2024 12:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753799.1162084; Thu, 04 Jul 2024 12:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPLeC-00044O-Cs; Thu, 04 Jul 2024 12:33:12 +0000
Received: by outflank-mailman (input) for mailman id 753799;
 Thu, 04 Jul 2024 12:33:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puvF=OE=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1sPLeA-00044E-Op
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 12:33:10 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91a9d354-3a01-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 14:33:08 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a725041ad74so22389666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 05:33:08 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58d50c4dad9sm1817894a12.10.2024.07.04.05.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 05:33:06 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9AD645F839;
 Thu,  4 Jul 2024 13:33:05 +0100 (BST)
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
X-Inumbo-ID: 91a9d354-3a01-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720096388; x=1720701188; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f19Bs9ZT0OpY9y4aYpk3+UQ7z4NKFudecNznbxwtnC0=;
        b=ZN/lW55Vw7dkemLJoF8Iyq2gsL7VlJiwWOWmaRpUksBNuKOLtUoAd7YTYOaWIzdRPZ
         uQfi3eZ7zC4s3jnaCnviAmqDjcaUt6HQx0/s93Q7mLd+LlVj33p8L11ZXkI3xYACK5YI
         19TPlftwiuJFPq6by8haxkmtMia5hiQ8/IkgyAVCwWqzRHpfm2fhdGOgVAGVMAdeCf4A
         KldPpRVwhXnEw5AAdyMXgoRWFaVwiPUGSOjUUrHokLrrzgGuOJrdWFrWSJxV/II1ugfv
         a5Ia8ZZr/63aCzhwqz48Myi5klkN1JPLv76+92h3f1ggWd19sbKyYRSqXdHHj4OubY10
         I7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096388; x=1720701188;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f19Bs9ZT0OpY9y4aYpk3+UQ7z4NKFudecNznbxwtnC0=;
        b=ZPodZfV6mNlPXBzlvS/lvVRlJB/DwxDgX1+DRkfmCAoo8fGtbBpLb3uEwtjQQG/IMC
         E/j2tuSBy6N0mLcAOVEVE8t4iD3FUj3PsU6Co+L56qpOdwpWcYjwPzSSVwTjaEZoY+b/
         5hFfIT8C7fnEQ7EhJ7J+mDHZAsQu/BaDoBQhS8abQuMbV7YVBXUgRbo1JPrn0Usb2EPx
         us3OtFWwpABWofG9TaJ7Vn5EFQobO7/AeixKlnXBPt32RwW0zq70kBP6S4N5Q4A6FzFz
         39G2rE2jg3Q43d162/qsy1uScwdMVwE0BKMNspH28PLluqxUcIh5xjZTm+gkP/uBgg4J
         0s9g==
X-Forwarded-Encrypted: i=1; AJvYcCUFhchBaeZRlcYP9/ia6kVB7ycc2AQY2yojprDfuJPhiCliHoRx2l5MQKAfHW08Fsx6XFJ0ODgEC+rnEOS8UIIupOG1bEEJLXMUb+GERyU=
X-Gm-Message-State: AOJu0YzMqn33/cy1EECk2IneRZT3u9ABhYEdYorydMwzGmLOMkaLXj9q
	x3mwSmEFqoSsBjQMe5vxzQXtDdLkRdyRqfjSPpn3ryUSmyLsAj89UmVAP1SnrrI=
X-Google-Smtp-Source: AGHT+IHJ3ZLpuxYytL1DyxnCP+DvoaUgRS13CTvCqP8SY1N58Wkfb2LrCUmoL6UbQ+1/8ezcXP5vYQ==
X-Received: by 2002:a05:6402:22f0:b0:58c:8c63:22ee with SMTP id 4fb4d7f45d1cf-58e5be72411mr1004212a12.42.1720096387662;
        Thu, 04 Jul 2024 05:33:07 -0700 (PDT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org,  sstabellini@kernel.org,  anthony@xenproject.org,
  paul@xen.org,  edgar.iglesias@amd.com,  xen-devel@lists.xenproject.org,
  Paolo Bonzini <pbonzini@redhat.com>,  Peter Xu <peterx@redhat.com>,
  David Hildenbrand <david@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v1 1/2] physmem: Bail out qemu_ram_block_from_host() for
 invalid ram addrs
In-Reply-To: <CAJy5ezpD6i3Fc9K-i58=V0e1uxrB-VZ2sd+gtoOc4TnbkWHSZQ@mail.gmail.com>
	(Edgar E. Iglesias's message of "Thu, 4 Jul 2024 14:42:25 +0300")
References: <20240701224421.1432654-1-edgar.iglesias@gmail.com>
	<20240701224421.1432654-2-edgar.iglesias@gmail.com>
	<87ikxlo3lx.fsf@draig.linaro.org>
	<CAJy5ezpD6i3Fc9K-i58=V0e1uxrB-VZ2sd+gtoOc4TnbkWHSZQ@mail.gmail.com>
Date: Thu, 04 Jul 2024 13:33:05 +0100
Message-ID: <875xtlnxq6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Edgar E. Iglesias" <edgar.iglesias@gmail.com> writes:

> On Thu, Jul 4, 2024 at 1:26=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:
>
>  "Edgar E. Iglesias" <edgar.iglesias@gmail.com> writes:
>
>  > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>  >
>  > Bail out in qemu_ram_block_from_host() when
>  > xen_ram_addr_from_mapcache() does not find an existing
>  > mapping.
>  >
>  > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>  > ---
>  >  system/physmem.c | 4 ++++
>  >  1 file changed, 4 insertions(+)
>  >
>  > diff --git a/system/physmem.c b/system/physmem.c
>  > index 33d09f7571..59d1576c2b 100644
>  > --- a/system/physmem.c
>  > +++ b/system/physmem.c
>  > @@ -2277,6 +2277,10 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, b=
ool round_offset,
>  >          ram_addr_t ram_addr;
>  >          RCU_READ_LOCK_GUARD();
>  >          ram_addr =3D xen_ram_addr_from_mapcache(ptr);
>  > +        if (ram_addr =3D=3D RAM_ADDR_INVALID) {
>  > +            return NULL;
>  > +        }
>  > +
>
>  Isn't this indicative of a failure? Should there at least be a trace
>  point for failed mappings?
>
> Yes but there are already trace points for the failure cases inside xen_r=
am_addr_from_mapcache().
> Do those address your concerns or do you think we need additional
> trace points?

Ahh that will do.

I am curious for the reasons why we might not have an entry in the
mapcache. I guess the trace_xen_map_cache() covers all insertions into
the cache although you need to check trace_xen_map_cache_return() to see
if anything failed.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

