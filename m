Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DCFA66305
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 00:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918272.1322981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKGD-000086-Dp; Mon, 17 Mar 2025 23:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918272.1322981; Mon, 17 Mar 2025 23:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKGD-00005N-Ai; Mon, 17 Mar 2025 23:52:45 +0000
Received: by outflank-mailman (input) for mailman id 918272;
 Mon, 17 Mar 2025 23:52:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r22Q=WE=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1tuKGB-00005A-VR
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 23:52:43 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8e8b5c2-038a-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 00:52:41 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1742255556120804.5923560081613;
 Mon, 17 Mar 2025 16:52:36 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6ff1e375a47so44057377b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 16:52:35 -0700 (PDT)
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
X-Inumbo-ID: e8e8b5c2-038a-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; t=1742255557; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fRr3WRGNwqFML/tS9/jr6+KBoSI2UOGKyWyEX/1BKgUxFoYYtMgyFPlZQgqj2tpuCgl54MszwMbzQv7eRwoz4RKPUO13oxJbzriavwhEsO5499niRfyrHKlMwmc6xrkLBYKh/w4ltnRx0GA3s6CT4WRFNqRQvPsNrzom8Tmmi4Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742255557; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E+FhAZKJK7JUoUFqBGMTOlH/+yUw1+AycTUDLcEwjSo=; 
	b=Bm8F+GjLFh9JXDto4IqBvf8tECH3bgPRFFIWOoJYeWuZAmF/E3TfFC8133PVbxrdnyRlRL8Bk179lxpyzjNIZadNq1viDga6tpSp5wAWrAbrFL2ZjHIJzhEfhpo79cpMLM3CVuSTDrQ8COCF0QmWUem3U07bIqCSW0xiF5lydbU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742255557;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=E+FhAZKJK7JUoUFqBGMTOlH/+yUw1+AycTUDLcEwjSo=;
	b=K5vqQX1X19cCpsAYJpaYSUS7JADzvU8cMglk8xOioils03j7cd/9ibvyH2h8Z9YX
	K27A81JJC+GQwUj9DJPPWJmcoYqy1soIFqwh1SNrEN2oBhyd79GOHsZXaSRd/kwzDDJ
	kAOitHe2DskgBX3CSQliAVkpfy0MmaR0mqY4t7AM=
X-Gm-Message-State: AOJu0YzqatLfvlUwR3VXAcASmBjiht/v+S3RhYDq4RP8ffcU8TNvMAo0
	mwKfW7Yq8WmWttWHm+lTOLkwSOW66fO4zbtujPonSrotKLhrjN9QzXZmvUVb3pCx72gvM5oZOyv
	le91NRcJaL2gUf/Edy3RQmdNPdxQ=
X-Google-Smtp-Source: AGHT+IHcm6EK58GudvWY/JicUEPt8h5M0kVyQuYMP3LFHA3Bxn+Ysleh4gcMHDphT73Xo0MmewfF4j3L3KGqQeaq7Zo=
X-Received: by 2002:a05:690c:4982:b0:6ef:761e:cfc with SMTP id
 00721157ae682-6ff4608f376mr179034287b3.25.1742255555092; Mon, 17 Mar 2025
 16:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250317230806.1179478-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250317230806.1179478-1-volodymyr_babchuk@epam.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 17 Mar 2025 19:51:58 -0400
X-Gmail-Original-Message-ID: <CABfawhkjGAytjnJ8U5vx_baHdxZmpRdPpdwLdUfAa=ujOOvbYQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqpdRg51rf-YO2SYJsWUAoczCzFr7dClWY08kJsu24yrdUpWhJNXl1TWCM
Message-ID: <CABfawhkjGAytjnJ8U5vx_baHdxZmpRdPpdwLdUfAa=ujOOvbYQ@mail.gmail.com>
Subject: Re: [PATCH] xen: vm_event: do not do vm_event_op for an invalid domain
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 7:08=E2=80=AFPM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> A privileged domain can issue XEN_DOMCTL_vm_event_op with
> op->domain =3D=3D DOMID_INVALID. In this case vm_event_domctl()
> function will get NULL as the first parameter and this will
> cause hypervisor panic, as it tries to derefer this pointer.
>
> Fix the issue by checking if valid domain is passed in.
>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> ---
>
> This issue was found by the xen fuzzer ([1])
>
> [1] https://lore.kernel.org/all/20250315003544.1101488-1-volodymyr_babchu=
k@epam.com/
> ---
>  xen/common/vm_event.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> index fbf1aa0848..a4c233de52 100644
> --- a/xen/common/vm_event.c
> +++ b/xen/common/vm_event.c
> @@ -600,6 +600,13 @@ int vm_event_domctl(struct domain *d, struct xen_dom=
ctl_vm_event_op *vec)
>          return 0;
>      }
>
> +    if ( unlikely(!d) )
> +    {
> +        gdprintk(XENLOG_INFO,
> +                 "Tried to do a memory event op on invalid domain\n");

This is not a memory event op?

Tamas

