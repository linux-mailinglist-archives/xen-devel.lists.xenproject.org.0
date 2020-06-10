Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAB01F54F1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 14:34:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jizvU-0003VL-7d; Wed, 10 Jun 2020 12:33:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mslP=7X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jizvS-0003VF-Le
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 12:33:50 +0000
X-Inumbo-ID: a2b54ae6-ab16-11ea-8496-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2b54ae6-ab16-11ea-8496-bc764e2007e4;
 Wed, 10 Jun 2020 12:33:50 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w7so1264516edt.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 05:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=6duC29xjD4uFOGGkP0FGAO4O4N4hAPvDiy7sVwN0h7k=;
 b=TG8/dFYafdcgRIN00CG5pRWjopf2a6te+TDR0L2N1Dqs5AzOGgok74H6GcBbUBB34Q
 C7uYbFjdziOodmtO/0j0fx8Nhfmq841mFtlFEIuQ7640SnxZSrEcwJ4SfIRqIII47Mhd
 ejAxJChaRNAO7qFwzqzq5B+Qnpq8JkXqAVkxcOVhMlv4Rt3j9As6lbPR/Atf52ff/hbB
 Bktld/z2RQPmXndQqAttTJV0Z1R6TOWAATBrbjQ7XHL/bkebYWo772VYXjjjA3WD9UyJ
 uApbOKbyHSFloHyc6Gjp0jA9O5kS7oslnuvRo6VS+FDdXMqC6TlXsXt4AuvhVqxjCg3+
 3Z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=6duC29xjD4uFOGGkP0FGAO4O4N4hAPvDiy7sVwN0h7k=;
 b=QgCqcFZEwneVdjuxT4IcrRpQmIKdwLqAQLNAnfVK9RTmActxZiE7iy0kTX8FNt8MQ1
 lwsftCQUXNcwchhvZZklY8UfKM1ROhEpHhojtBpTrSyjSoAkBfccPNNc/M9hKsB1/jDK
 vgBrzebhbCOUIuTx3OVVnDkU8KgIKrk51hDHE9IKWiywXopgI1iToqvGb1vRkg7JNhV7
 epOqMy0ZtWv3OczdEC/WMbPS3j47Re+5Y6SG670n/bJXleGmS2BApWwkBsIy4uxDjHoo
 XK/Qo3gZ41e+5A11DWCpX2ah+cLL9rNtcjQK5uuLBUqdGFvt7mcpO5KW+7Im166eIZC4
 sHkw==
X-Gm-Message-State: AOAM532F16c3U9l2wNnu8YbqnksB86/MhDqVWKXYc2kQxN8ehzETD7N2
 YUGNF98IK3wOHDsVm2rk+QM=
X-Google-Smtp-Source: ABdhPJzaLiYrG35h0C27DpTxD926lo1oB+/asTx3gRA3qId6AFZvftazzdbQotXgP21oVsl9zvDVZg==
X-Received: by 2002:a50:afa5:: with SMTP id h34mr2332023edd.34.1591792429226; 
 Wed, 10 Jun 2020 05:33:49 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id m91sm3676447ede.96.2020.06.10.05.33.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 05:33:48 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200610115103.7592-1-roger.pau@citrix.com>
 <20200610115103.7592-2-roger.pau@citrix.com>
In-Reply-To: <20200610115103.7592-2-roger.pau@citrix.com>
Subject: RE: [PATCH for-4.14 1/2] x86/passthrough: do not assert edge
 triggered GSIs for PVH dom0
Date: Wed, 10 Jun 2020 13:33:46 +0100
Message-ID: <00e301d63f23$63c83a00$2b58ae00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJ/+0U2guq5J+wcejb54ge6+rzRyAJA9sgcp2xHeiA=
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
> Sent: 10 June 2020 12:51
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH for-4.14 1/2] x86/passthrough: do not assert edge =
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
> ---
>  xen/arch/x86/hvm/irq.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
> index 9c8adbc495..9a56543c1b 100644
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -169,9 +169,10 @@ void hvm_pci_intx_deassert(
>=20
>  void hvm_gsi_assert(struct domain *d, unsigned int gsi)
>  {
> +    int level =3D vioapic_get_trigger_mode(d, gsi);
>      struct hvm_irq *hvm_irq =3D hvm_domain_irq(d);
>=20
> -    if ( gsi >=3D hvm_irq->nr_gsis )
> +    if ( gsi >=3D hvm_irq->nr_gsis || level < 0 )
>      {
>          ASSERT_UNREACHABLE();
>          return;
> @@ -186,9 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned =
int gsi)
>       * to know if the GSI is pending or not.
>       */
>      spin_lock(&d->arch.hvm.irq_lock);
> -    if ( !hvm_irq->gsi_assert_count[gsi] )
> +    if ( !level || !hvm_irq->gsi_assert_count[gsi] )

We have definitions of VIOAPIC_EDGE_TRIG and VIOAPIC_LEVEL_TRIG. It =
seems odd not to use them here.

  Paul

>      {
> -        hvm_irq->gsi_assert_count[gsi] =3D 1;
> +        if ( !level )
> +            hvm_irq->gsi_assert_count[gsi] =3D 1;
>          assert_gsi(d, gsi);
>      }
>      spin_unlock(&d->arch.hvm.irq_lock);
> @@ -196,11 +198,12 @@ void hvm_gsi_assert(struct domain *d, unsigned =
int gsi)
>=20
>  void hvm_gsi_deassert(struct domain *d, unsigned int gsi)
>  {
> +    int level =3D vioapic_get_trigger_mode(d, gsi);
>      struct hvm_irq *hvm_irq =3D hvm_domain_irq(d);
>=20
> -    if ( gsi >=3D hvm_irq->nr_gsis )
> +    if ( level <=3D 0 || gsi >=3D hvm_irq->nr_gsis )
>      {
> -        ASSERT_UNREACHABLE();
> +        ASSERT(level =3D=3D 0 && gsi < hvm_irq->nr_gsis);
>          return;
>      }
>=20
> --
> 2.26.2



