Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81A01F5703
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 16:50:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj22c-0007tT-9O; Wed, 10 Jun 2020 14:49:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mslP=7X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jj22a-0007tO-W4
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 14:49:21 +0000
X-Inumbo-ID: 90ae434e-ab29-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90ae434e-ab29-11ea-b7bb-bc764e2007e4;
 Wed, 10 Jun 2020 14:49:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q25so2110277wmj.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=aqKoAe5R3mErpPsGTBAYqJ8FZo4mhjQdiT2UrROsrh0=;
 b=syfU4IM9oGZ5ygoWgQxEuETrY5yi9RmR2pxf9ls9u3BYF/whrXpPw+aOGscUAuL9mg
 rOrmb9WfwSYEZaV0/6WeSM64IweBC+h5wmJTqd2mgpsC+Dg1YLjnfCsZ2ji3hFPZ6lfn
 L5dyDmN++y1+43Rhi+32lhuuKb34C6FNwpNGW+e3ZLk+9GRDbuYzozFGeKceFnQrZjHu
 +a9vrw6L2Ip/KiPoKi3NarqqitpXC5AEFM/AltXnT9riUW24M6jyzpod2OHNM2r2Da4K
 dqlaGdRY33jIBqyqGS9OJGLrGi3kjk1EMsL/is+QI2A222lYR2eqsJwj+juP2Yu2jy7h
 f2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=aqKoAe5R3mErpPsGTBAYqJ8FZo4mhjQdiT2UrROsrh0=;
 b=hDIEYWBbGnKdpRZXOFHac7r6HyxDKNScGEhzGx6En0/bIgkbo0btWz8B8vVnkMVqxy
 8hsxD2HcncqtKebmrONZnf7PtkabkR4ulI6lrH4psyuHNFgriTShg++HY3ReOT2r1LV6
 X+I/a7Gpk5K65vzru22hTaR7f+d7FgRoZsQ49FtHTXOnEI8t7/PotL1OidYE+S7lNw44
 y7ObhyKg5V2cGs539TWpind8hfnt5jYe1uYNmhCtOzIEOHVKF11HM1jCJmEtsHcfJuox
 hRf8kveFWgHWTEhT5snBbTjVg/+g0iVh7DcdKubLcmEz5TURr1/+DVZWYWRksz3ZTme2
 xcAQ==
X-Gm-Message-State: AOAM530511jgwqXQ86axYeyHQtb9qKa06b34ofpWY/nWWKXLEJNDB2Pf
 DoSIcXHj7R1c29o8c9DTFgI=
X-Google-Smtp-Source: ABdhPJwJiyLiGYOvu36CWHNE4eGRaZVP4SM1gWlHKmEfL1AN0qiiDj4VxZf0AxEAGIQPIeugikA/dg==
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr3734907wmi.66.1591800559284; 
 Wed, 10 Jun 2020 07:49:19 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id d16sm7087862wmd.42.2020.06.10.07.49.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 07:49:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-2-roger.pau@citrix.com>
In-Reply-To: <20200610142923.9074-2-roger.pau@citrix.com>
Subject: RE: [PATCH for-4.14 v2 1/2] x86/passthrough: do not assert edge
 triggered GSIs for PVH dom0
Date: Wed, 10 Jun 2020 15:49:17 +0100
Message-ID: <00e401d63f36$51cd4800$f567d800$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHx2+DDRjLQssRal4XfU2f+2Pe7FQGgF1ZFqI2zmqA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 10 June 2020 15:29
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH for-4.14 v2 1/2] x86/passthrough: do not assert edge =
triggered GSIs for PVH dom0
>=20
> Edge triggered interrupts do not assert the line, so the handling done
> in Xen should also avoid asserting it. Asserting the line prevents
> further edge triggered interrupts on the same vIO-APIC pin from being
> delivered, since the line is not de-asserted.
>=20
> One case of such kind of interrupt is the RTC timer, which is edge
> triggered and available to a PVH dom0. Note this should not affect
> domUs, as it only modifies the behavior of IDENTITY_GSI kind of passed
> through interrupts.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>
Release-acked-by: Paul Durrant <paul@xen.org>

> ---
> Changes since v1:
>  - Compare the triggering against VIOAPIC_{EDGE/LEVEL}_TRIG.
> ---
>  xen/arch/x86/hvm/irq.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
> index 9c8adbc495..fd02cf2e8d 100644
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -169,9 +169,10 @@ void hvm_pci_intx_deassert(
>=20
>  void hvm_gsi_assert(struct domain *d, unsigned int gsi)
>  {
> +    int trig =3D vioapic_get_trigger_mode(d, gsi);
>      struct hvm_irq *hvm_irq =3D hvm_domain_irq(d);
>=20
> -    if ( gsi >=3D hvm_irq->nr_gsis )
> +    if ( gsi >=3D hvm_irq->nr_gsis || trig < 0 )
>      {
>          ASSERT_UNREACHABLE();
>          return;
> @@ -186,9 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned =
int gsi)
>       * to know if the GSI is pending or not.
>       */
>      spin_lock(&d->arch.hvm.irq_lock);
> -    if ( !hvm_irq->gsi_assert_count[gsi] )
> +    if ( trig =3D=3D VIOAPIC_EDGE_TRIG || =
!hvm_irq->gsi_assert_count[gsi] )
>      {
> -        hvm_irq->gsi_assert_count[gsi] =3D 1;
> +        if ( trig =3D=3D VIOAPIC_LEVEL_TRIG )
> +            hvm_irq->gsi_assert_count[gsi] =3D 1;
>          assert_gsi(d, gsi);
>      }
>      spin_unlock(&d->arch.hvm.irq_lock);
> @@ -196,11 +198,12 @@ void hvm_gsi_assert(struct domain *d, unsigned =
int gsi)
>=20
>  void hvm_gsi_deassert(struct domain *d, unsigned int gsi)
>  {
> +    int trig =3D vioapic_get_trigger_mode(d, gsi);
>      struct hvm_irq *hvm_irq =3D hvm_domain_irq(d);
>=20
> -    if ( gsi >=3D hvm_irq->nr_gsis )
> +    if ( trig <=3D VIOAPIC_EDGE_TRIG || gsi >=3D hvm_irq->nr_gsis )
>      {
> -        ASSERT_UNREACHABLE();
> +        ASSERT(trig =3D=3D VIOAPIC_EDGE_TRIG && gsi < =
hvm_irq->nr_gsis);
>          return;
>      }
>=20
> --
> 2.26.2



