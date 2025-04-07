Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61891A7F089
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 00:57:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941280.1340790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1vOU-0003fP-IA; Mon, 07 Apr 2025 22:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941280.1340790; Mon, 07 Apr 2025 22:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1vOU-0003cy-Ec; Mon, 07 Apr 2025 22:56:42 +0000
Received: by outflank-mailman (input) for mailman id 941280;
 Mon, 07 Apr 2025 22:56:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DycC=WZ=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1u1vOT-0003cs-7l
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 22:56:41 +0000
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f3b0fce-1403-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 00:56:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1744066592989295.7658012033638;
 Mon, 7 Apr 2025 15:56:32 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3feaedb531dso1227520b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 15:56:32 -0700 (PDT)
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
X-Inumbo-ID: 8f3b0fce-1403-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1744066593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NQ5f2xe2yiSVnkfLP7zppWcXCbL9CsIydp6LqPhWQFolLqp29iORl+SnaiUMDjGew5p3d03UssDRNc/7EG1oZKka8BguT97DMRA9EQ+kpTjpoC8wKhYwTEtmVwMENZSXRDEu+6pJBkbrrJe4eT4JpmjydYHjB29rZ2mo79gY5pk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744066593; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9ij7JR4xtTJGt1m1JkbpWNxgtvYtQWdmN19gSKc272w=; 
	b=WtrNV3D3n/DF4F9ll9qXPTHlXWY7LMhxNKvuf0tdcOO4zoR5cWa8CFNHTpTV+5b05AaMI0TgroI3efAZviG/3OEwkc8VauRoZ196xMWNd0jHJl7EXD3n6X2YagmlNdaO3afPQ5Y373p8B7FTeJWOIgHy88UFXDVOW0JCmhITGhM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744066593;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9ij7JR4xtTJGt1m1JkbpWNxgtvYtQWdmN19gSKc272w=;
	b=UuQreXdQUBc3az/olBM3hc+OB38aI18PC0Gyrf3LptoW8vcOmMwXA79w0h+addJq
	FJqz2xJG6uCeK3FetQ4M5DHeY9eIX97T5YvDK20PedcwKVCnsaL0lreJ/hihlhBfJNj
	r/PeImu65dcxesvoecChMK8oRkTYitIpW6WDDSNI=
X-Gm-Message-State: AOJu0YwMZ8PcZ4XwQsljl7I0oxenjzNJWNP7y6+WEk97UMlciksFRagP
	NCj1ph1NCqLgaAe2gOCgNvwhGloT0uAtmng43mZEVgqVAoQWKJZUqWFk1O5egraAS0JVljBDcE3
	QvYsOOTtrPQQ2Vq7ix/30DgGPhIE=
X-Google-Smtp-Source: AGHT+IF/BcxL3gFvXAMR0+csW5IQhGm+PVKVHagBVpOq6b4NFGdfUkosmD0xOOIC36g6v9jlz//kMRv7o4TtEK5bFqY=
X-Received: by 2002:a05:6808:1b12:b0:3f8:5160:befb with SMTP id
 5614622812f47-4004563c8b9mr8787011b6e.35.1744066592147; Mon, 07 Apr 2025
 15:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250318003943.1191439-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250318003943.1191439-1-volodymyr_babchuk@epam.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 7 Apr 2025 18:55:56 -0400
X-Gmail-Original-Message-ID: <CABfawhkGp6eXu7k3EyGf0QksvQftOJw7LkKq5NZ9voMU9x3=bw@mail.gmail.com>
X-Gm-Features: ATxdqUFinyPGK6X7vECJC4_spFb_P96rFYoeCX0c-07jvGUSH2QRT76p8y_Rn7w
Message-ID: <CABfawhkGp6eXu7k3EyGf0QksvQftOJw7LkKq5NZ9voMU9x3=bw@mail.gmail.com>
Subject: Re: [PATCH v2] xen: vm_event: do not do vm_event_op for an invalid domain
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 8:40=E2=80=AFPM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> A privileged domain can issue XEN_DOMCTL_vm_event_op with
> op->domain =3D=3D DOMID_INVALID. In this case vm_event_domctl()
> function will get NULL as the first parameter and this will
> cause hypervisor panic, as it tries to derefer this pointer.
>
> Fix the issue by checking if valid domain is passed in.
>
> Fixes: 48b84249459f ("xen/vm-event: Drop unused u_domctl parameter from v=
m_event_domctl()")
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

