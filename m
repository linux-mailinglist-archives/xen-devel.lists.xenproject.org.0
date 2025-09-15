Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A897EB57A4B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 14:19:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124300.1466722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy8Az-0006GZ-2o; Mon, 15 Sep 2025 12:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124300.1466722; Mon, 15 Sep 2025 12:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy8Az-0006DT-00; Mon, 15 Sep 2025 12:19:21 +0000
Received: by outflank-mailman (input) for mailman id 1124300;
 Mon, 15 Sep 2025 12:19:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKJ3=32=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1uy8Ax-0006DN-GQ
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 12:19:19 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 324116b4-922e-11f0-9d13-b5c5bf9af7f9;
 Mon, 15 Sep 2025 14:19:17 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1757938750772316.82499019828015;
 Mon, 15 Sep 2025 05:19:10 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-330d1565844so1624363fac.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Sep 2025 05:19:10 -0700 (PDT)
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
X-Inumbo-ID: 324116b4-922e-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; t=1757938752; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XKRIt9W7fHnavqJGbr3EbeEdKp7O6YOYfol7LqUcEFcN9eSANeujfkeBdrX6N74U8FAFNHcG6Eqg+Parj6cfU6pb5bNz1U/8+sVB7kf+0lr3QMUL356lhWvXWdVbK3Z2vFC1R6Dqw8IIr39bldKphS1Jdj6Q/YL1fv/mVwHfVv4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757938752; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nMENMgkEm0iRso4+GD3zG/CwrpYfs5RQRWgp6rLB49c=; 
	b=mIG1+I11dHUxpzavcR/2pG6BApf4VeTq1wGjaD1bxNJC4hrkSx9DCtV1oxCiOOZRWRq1S3ddF5VfN9queBjJxLXAcybybRtjhCB8ilJLxcITnmoTsSy+r18MdmjVlwDZvPkaoRZV+tr4Bmcg/z+lM4sUtbNtDCn6tXWWkzzTTRA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757938752;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nMENMgkEm0iRso4+GD3zG/CwrpYfs5RQRWgp6rLB49c=;
	b=IEoAaam3Zn7itG7dNrY+DGQy6+lO9oE1KsDhXMqXaKzVs3We29X5v9u2IzVHkGHA
	mC48TSmfm9nE+erbTnMIZTP2oYgI7dyhUqiqvJ1MD02Ei0GueMOMu+kYxLkUlyHtYHU
	Mc492F15OU23cwoiD9uIhSxn1REDswXVjQCIatpg=
X-Forwarded-Encrypted: i=1; AJvYcCXAnwHJ8Rei6mc2VJHKzs5o8eN5MJh1I3GVislwk+EQmvJZvtGDeiHm5iZXYhrtwT9jwod/hzUTojY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd4u0eOd72/MHhcbgRo0LeK+wdG/f23Xw8Y8v9pncXOBhx0LuN
	6YMUMDZpP2wE+NMbBNRK29jUuwblsQ1cw+3e7pQk9FakryLRjSogGS1FdD7Kft0Gat0zFprQq4h
	A9jcshgsVuWhs0VB5As44INS5r59lxts=
X-Google-Smtp-Source: AGHT+IEDc5j9CT82P/bxsO2/ozi7hX/BTTrSvYLxtKTerJ43hrZ3Ms712PfIjmpf5OxPr2lWW/wqJ833BwQOk/K+9z0=
X-Received: by 2002:a05:6870:2c8e:b0:31d:7467:e394 with SMTP id
 586e51a60fabf-32e560ccda0mr6814067fac.4.1757938749926; Mon, 15 Sep 2025
 05:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250912045254.3731398-1-Penny.Zheng@amd.com> <e29930b6-2f13-483b-a8ce-62a93550199d@suse.com>
 <CABfawhmB_WxfR0aL3F6kgo-jgVBJh8M6PLRZikboZPkPTF+hPA@mail.gmail.com> <2a818f1b-4326-4335-8ca5-4301632b1f33@suse.com>
In-Reply-To: <2a818f1b-4326-4335-8ca5-4301632b1f33@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 15 Sep 2025 08:18:35 -0400
X-Gmail-Original-Message-ID: <CABfawhmv-YeO1dznkiG7C7R=++Y56FP5o9Le4bb1Jw+ke3KDcg@mail.gmail.com>
X-Gm-Features: Ac12FXwGwFRKD5W32YGq_UAcjF4B6nNxjHy9XB3ZEoBMpyUf-ERQgphAGzqb_Bw
Message-ID: <CABfawhmv-YeO1dznkiG7C7R=++Y56FP5o9Le4bb1Jw+ke3KDcg@mail.gmail.com>
Subject: Re: [PATCH] xen/vm_event: introduce vm_event_is_enabled()
To: Jan Beulich <jbeulich@suse.com>
Cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 14, 2025 at 9:49=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 14.09.2025 01:24, Tamas K Lengyel wrote:
> >>> +static inline bool vm_event_is_enabled(struct vcpu *v)
> >>> +{
> >>> +#ifdef CONFIG_VM_EVENT
> >>> +    return v->arch.vm_event !=3D NULL;
> >>
> >> Is "enabled" (in the function name) a good description of this conditi=
on, Tamas?
> >
> > Sure, sounds fine to me.
>
> That is the pointer alone being non-NULL identifies "enabled"? And not
> just e.g. "active" or "available" (can be enabled with further things
> set up)?

Nope, just that the struct is non-NULL means vm_event is enabled.
There is no meaningful distinction of enabled vs active vs available
in the contexts this is being checked.

Tamas

