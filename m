Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE06669303
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:33:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476956.739422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGR4-00015n-JZ; Fri, 13 Jan 2023 09:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476956.739422; Fri, 13 Jan 2023 09:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGR4-00013j-Gq; Fri, 13 Jan 2023 09:33:18 +0000
Received: by outflank-mailman (input) for mailman id 476956;
 Fri, 13 Jan 2023 09:33:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NGZF=5K=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1pGGR3-00013d-1h
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:33:17 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4def6a57-9325-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 10:33:15 +0100 (CET)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-PhUiYbgXPaKVDQegHcb74Q-1; Fri, 13 Jan 2023 04:33:13 -0500
Received: by mail-ej1-f71.google.com with SMTP id
 sd1-20020a1709076e0100b00810be49e7afso14985849ejc.22
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jan 2023 01:33:13 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 a17-20020a170906369100b007c0f2c4cdffsm8257387ejc.44.2023.01.13.01.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 01:33:11 -0800 (PST)
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
X-Inumbo-ID: 4def6a57-9325-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673602394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EGmXSGcryLyMwWBJBAGRPqNc83FeWcTOUw9/1eaT3RA=;
	b=fnz3gJuqJqcOzEh4EGw3XDs0F+yCs2Hg+zkDZpnGQlO9Rin9cXyIdONpZ46JgJ9KecAIpw
	SOrb1V0YncpCtxHbsK5wtKQKhzRQUB/jkW9QAmqU9yea9QqBU7z44yRfPImc4/heXETYMU
	9k/eSkDRSz0lBoEyv5Dpt/KQ6NduaTE=
X-MC-Unique: PhUiYbgXPaKVDQegHcb74Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGmXSGcryLyMwWBJBAGRPqNc83FeWcTOUw9/1eaT3RA=;
        b=yJIrt3mBMcYRxDTT+v6KVW5WLROf6CBHPLfAs310hZ9lxEMyhHk55NJlLEPf3G8DZt
         reIy2devi7mxN3D66fiSeYaibDTCLkQKqB2e+Qnnxrx6sx25b5CnyssJygc4V/dgvtgF
         n9+k2AuNbUXjHBOyefwaEXueaT25H0DswN1x6/WVMrgjnNrJZQWbEEuGcPM0V0PeC8YD
         abI86OvcPRbjh9eWItsyvTB5vFpzEFXWteePmg0jYtMiyEgnlbopxMNk5cLjPzkHLDHO
         IFqhPKblVV2yso7uez3giVr3Z//V5LdVbvXSZnGeUDnzmYX9qZ3KmxeK8k3Ye/u+KiPo
         viAw==
X-Gm-Message-State: AFqh2krAORvoTMaFNeEOnbHDhbokJeR8Zb/2zR5Ro+XhuuRXdvB64+vd
	ThEtDjuJz5NWokmixD6FZ9CmM8125eUxpjR33SkFjl/0Bths72q1MDQaVWnvaPBXQxRRuKIWKLg
	DLeQruwkx/szoHbwJ9jtM0F1apiw=
X-Received: by 2002:a17:906:6d14:b0:7c1:765:9cfc with SMTP id m20-20020a1709066d1400b007c107659cfcmr2434449ejr.34.1673602392309;
        Fri, 13 Jan 2023 01:33:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvMyiZunNV7hT53Eb0xO5saoqrfpCr+V6WcY8sAbjY0cHEl4y6/dAWivhbcVBq6Aq75LiToFA==
X-Received: by 2002:a17:906:6d14:b0:7c1:765:9cfc with SMTP id m20-20020a1709066d1400b007c107659cfcmr2434437ejr.34.1673602392137;
        Fri, 13 Jan 2023 01:33:12 -0800 (PST)
Date: Fri, 13 Jan 2023 10:33:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230113103310.3da703ab@imammedo.users.ipa.redhat.com>
In-Reply-To: <128d8ee2-8ee9-0a76-10de-af4c1b364179@aol.com>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
	<a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
	<20230110030331-mutt-send-email-mst@kernel.org>
	<a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
	<D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
	<9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
	<7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
	<20230112180314-mutt-send-email-mst@kernel.org>
	<128d8ee2-8ee9-0a76-10de-af4c1b364179@aol.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Jan 2023 23:14:26 -0500
Chuck Zmudzinski <brchuckz@aol.com> wrote:

> On 1/12/23 6:03=E2=80=AFPM, Michael S. Tsirkin wrote:
> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote: =20
> >> I think the change Michael suggests is very minimalistic: Move the if
> >> condition around xen_igd_reserve_slot() into the function itself and
> >> always call it there unconditionally -- basically turning three lines
> >> into one. Since xen_igd_reserve_slot() seems very problem specific,
> >> Michael further suggests to rename it to something more general. All
> >> in all no big changes required. =20
> >=20
> > yes, exactly.
> >  =20
>=20
> OK, got it. I can do that along with the other suggestions.

have you considered instead of reservation, putting a slot check in device =
model
and if it's intel igd being passed through, fail at realize time  if it can=
't take
required slot (with a error directing user to fix command line)?
That could be less complicated than dealing with slot reservations at the c=
ost of
being less convenient.

>=20
> Thanks.
>=20


