Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA98584F634
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 14:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678716.1056207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYRKE-0000T7-E3; Fri, 09 Feb 2024 13:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678716.1056207; Fri, 09 Feb 2024 13:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYRKE-0000Qc-BO; Fri, 09 Feb 2024 13:53:54 +0000
Received: by outflank-mailman (input) for mailman id 678716;
 Fri, 09 Feb 2024 13:53:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vtu=JS=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rYRKC-0000QW-0v
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 13:53:52 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4bd1674-c752-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 14:53:47 +0100 (CET)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171]) by mx.zohomail.com
 with SMTPS id 1707486822674974.7715314425574;
 Fri, 9 Feb 2024 05:53:42 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-604b23fc6a7so10861517b3.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 05:53:42 -0800 (PST)
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
X-Inumbo-ID: a4bd1674-c752-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; t=1707486823; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mtRQSytfSnfrgPL8u7ZP0DpsqIEqZRXtfJb5z+UAaO0QKy4Ffirhp1RetJVBeJeClcVKNnozZBT+i9htT2SwzAceAbzUSewExNrlETYnvJonKqO2D/VoEwSjep87x8qq6T9eJEmCVf0a4VhbPSTwIOeWi8kfzQmVUyWT8+L0awI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1707486823; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oqnESpiVyk/PjxgNGOrqwPCDLj/GqlaTMXewMMadClQ=; 
	b=PIMDBG9Ilua4/ePvMs7EPx7+6fQckoUYLTJDugsSO6gfMyNKPQN15oN6X50e2OWiLPG/x8kRklCOvehU6ZFAuxIikpz5QoXU9hCf2OZppcRexgKb31AIeQ4k91tvXkddNW6jpetWX1ldwwjb7GiuSGPmKfxjihzfnpore0e9MOA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1707486823;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oqnESpiVyk/PjxgNGOrqwPCDLj/GqlaTMXewMMadClQ=;
	b=P98QSSeJKx/ujZTdCQUXp4EzWG94DJHp174SDFUF9YiqkBqnTYc32UrK7LPD/LuG
	9TbmeyGcV5KBhK6tdIEiFeU3+4T5rhoHvQJYjtQ36NHiI0uiCpTrUyVlA6JPhepUMlM
	V2SP8xiLKPm63b6qnyfldLLvnvp8WVz8aNxikS2c=
X-Gm-Message-State: AOJu0YxKUlI7ovlV9fYgyRP5ST9lLOarbUrrivee1eJoh6aAZfYhvRY1
	6q4fmq77dYuvT3L8cb5t+lcj8lOePgF9kSv/7AKIB/B2LhHary8c0iAT+MXBXrPj6TZchRvC3Hm
	QQvoYD72mrcAsw1ctnhZlIejLivE=
X-Google-Smtp-Source: AGHT+IEi9KoJlvzKr2w6/bJN14FwerfDBAfbJqruA7jmCavob4uS/RB5aAUOXUhc/zHN64EFifwnNh5X3dKtiUOVcac=
X-Received: by 2002:a81:4e83:0:b0:5eb:de3c:fbff with SMTP id
 c125-20020a814e83000000b005ebde3cfbffmr1727657ywb.27.1707486821808; Fri, 09
 Feb 2024 05:53:41 -0800 (PST)
MIME-Version: 1.0
References: <fa519b9a544d3d19a31313292a909d12775e6e1f.1707427103.git.w1benny@gmail.com>
In-Reply-To: <fa519b9a544d3d19a31313292a909d12775e6e1f.1707427103.git.w1benny@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 9 Feb 2024 08:53:07 -0500
X-Gmail-Original-Message-ID: <CABfawhnqjTVh6=YCjN1CHEQOEh_ji_6dMzDk=sdXnzBony3g+Q@mail.gmail.com>
Message-ID: <CABfawhnqjTVh6=YCjN1CHEQOEh_ji_6dMzDk=sdXnzBony3g+Q@mail.gmail.com>
Subject: Re: [PATCH] x86/hvm: Fix fast singlestep state persistence
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 4:20=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.com> =
wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> This patch addresses an issue where the fast singlestep setting would per=
sist
> despite xc_domain_debug_control being called with XEN_DOMCTL_DEBUG_OP_SIN=
GLE_STEP_OFF.
> Specifically, if fast singlestep was enabled in a VMI session and that se=
ssion
> stopped before the MTF trap occurred, the fast singlestep setting remaine=
d
> active even though MTF itself was disabled.  This led to a situation wher=
e, upon
> starting a new VMI session, the first event to trigger an EPT violation w=
ould
> cause the corresponding EPT event callback to be skipped due to the linge=
ring
> fast singlestep setting.
>
> The fix ensures that the fast singlestep setting is properly reset when
> disabling single step debugging operations.
>
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>

Thanks, this has been a known bug that awaited a fix for a long time.

Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>

