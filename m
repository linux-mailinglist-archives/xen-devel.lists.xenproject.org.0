Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C2792740B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 12:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753651.1161831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPJfH-0001ef-Ki; Thu, 04 Jul 2024 10:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753651.1161831; Thu, 04 Jul 2024 10:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPJfH-0001bn-HI; Thu, 04 Jul 2024 10:26:11 +0000
Received: by outflank-mailman (input) for mailman id 753651;
 Thu, 04 Jul 2024 10:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puvF=OE=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1sPJfF-0001be-Ro
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 10:26:09 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d14cc884-39ef-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 12:26:04 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso631673a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 03:26:04 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab0b7f9asm583320566b.219.2024.07.04.03.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 03:26:03 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 40F8F5F839;
 Thu,  4 Jul 2024 11:26:02 +0100 (BST)
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
X-Inumbo-ID: d14cc884-39ef-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720088764; x=1720693564; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xC48v9f71+5BEv8BfLMiTZ3HX5Rc0SmAOdizqpMZ2xE=;
        b=MAIqOjdoneXeCTGjpXMjhi2VfK194q9Pftxk5HRsIPslTwHilHQIZgkcsUG41eB51m
         Wm5Zc2rQNRd5WPXis/tzEQXddhuXO6G8d2PctTJRlJxWABvw5H2xdmoddCtbz4V1SaFa
         sgCoWN19NugqZblL5Btctr9ceIsqW8djGocVGsVzBZjg2AjxBmuaD3xP+cMiK4wqRrfK
         hLAa76BI1HtR7Bv/VRyfcFTOA9cNsMvqjmjPDpkR6IyZA4+D6flp0uWGCQOnsASTDnEg
         RQbutu5CsGaSSJhH0NQ4ooP+jKLblW5d0W+BwINI5r29AmfUuP2xM3XmqJOMyeSjV+W4
         yAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720088764; x=1720693564;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xC48v9f71+5BEv8BfLMiTZ3HX5Rc0SmAOdizqpMZ2xE=;
        b=Byg8+b1grp0KFK6JfJk0mRujDQtj6wYsp1xT4VHLM5rcxPD3QqmEWGDOAArVSdxTbb
         k8UJjyIzNUAglb2MTqO4xRpfKmSQtdPabODIFfUN73FrkbobA+IpSFrrVGrXpGcvFBMq
         8UMFiX1tHVn5GW9KpnlQ2yaAhr6rbQ1G5OWIXdzq6UH1sNELTCir6yYt2sy6yV9+H4+Z
         4F7jPifd2dnGiN6UHDwDOPn9rpuebVVpKx6yb/UGCd8icTKFPkkEKzO1nEGGiKPG7qt/
         R/rLzH4fEwbRIOXSrHr007c+AXkQpMLyfYgliLZ0LEJF3apZV2IA+UUQxo0gApMiv3zA
         bQoA==
X-Forwarded-Encrypted: i=1; AJvYcCX1BjkX9m/BVq/ESY4gcb3cA0tmtmyXqqGVLSXz391P6GtK/fc+efbRrNHWNrxmut9iQJpmR6+P5dRZC1p2/2KP+sPVp2VxSmAjeuwzZyU=
X-Gm-Message-State: AOJu0Yze5vnHMkoHH29fQhCBvSPnGh/dNkd6nCKzTUO4dMpyKPOrRWAY
	eB7tPQfNKB87zfYWPI5+uoMfDJDS97BaoEveXaftMw0uRNkh9KzJ+Gf9gQWEOiQ=
X-Google-Smtp-Source: AGHT+IHz64s8lodGRvZkkyNhfG4JyZctTRVpw00+kq525U939ceTRawQk+CRkLio36MJ6fWXBYmhlg==
X-Received: by 2002:a17:906:618:b0:a72:b493:85f6 with SMTP id a640c23a62f3a-a77ba6fbd0amr79084666b.24.1720088763597;
        Thu, 04 Jul 2024 03:26:03 -0700 (PDT)
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
In-Reply-To: <20240701224421.1432654-2-edgar.iglesias@gmail.com> (Edgar E.
	Iglesias's message of "Tue, 2 Jul 2024 00:44:20 +0200")
References: <20240701224421.1432654-1-edgar.iglesias@gmail.com>
	<20240701224421.1432654-2-edgar.iglesias@gmail.com>
Date: Thu, 04 Jul 2024 11:26:02 +0100
Message-ID: <87ikxlo3lx.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Edgar E. Iglesias" <edgar.iglesias@gmail.com> writes:

> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> Bail out in qemu_ram_block_from_host() when
> xen_ram_addr_from_mapcache() does not find an existing
> mapping.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  system/physmem.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/system/physmem.c b/system/physmem.c
> index 33d09f7571..59d1576c2b 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -2277,6 +2277,10 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool=
 round_offset,
>          ram_addr_t ram_addr;
>          RCU_READ_LOCK_GUARD();
>          ram_addr =3D xen_ram_addr_from_mapcache(ptr);
> +        if (ram_addr =3D=3D RAM_ADDR_INVALID) {
> +            return NULL;
> +        }
> +

Isn't this indicative of a failure? Should there at least be a trace
point for failed mappings?

>          block =3D qemu_get_ram_block(ram_addr);
>          if (block) {
>              *offset =3D ram_addr - block->offset;

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

