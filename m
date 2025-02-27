Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F501A480AC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 15:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898110.1306687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnedM-0001Z3-9P; Thu, 27 Feb 2025 14:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898110.1306687; Thu, 27 Feb 2025 14:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnedM-0001XI-6J; Thu, 27 Feb 2025 14:13:04 +0000
Received: by outflank-mailman (input) for mailman id 898110;
 Thu, 27 Feb 2025 14:13:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKwg=VS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tnedK-0001XC-SC
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 14:13:02 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f39a906b-f514-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 15:13:00 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5dca468c5e4so1547248a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 06:13:00 -0800 (PST)
Received: from localhost ([46.149.103.12]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c43a54a9sm1127477a12.67.2025.02.27.06.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 06:12:59 -0800 (PST)
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
X-Inumbo-ID: f39a906b-f514-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740665580; x=1741270380; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RiGxt8S4pp4NVdU4UWYAUBg3HkBB8R9opyPexE0ESg=;
        b=S+gERN8S51pLyejc5n/XCJHXQ7KJWezHi2igstN/cCHk9Vtwki5QMyQdMD4za8NVbZ
         skEOfLVIlcuU28vzrKcr7mVMg5D9JIheJwlp+9WCGCdvsXfWy9N0oXO1Egity//siEPh
         mAO+KTIFD3v2fwwsd0P0RLcA29WzQVJphRNwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740665580; x=1741270380;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8RiGxt8S4pp4NVdU4UWYAUBg3HkBB8R9opyPexE0ESg=;
        b=WlmQFzRMjmsA9Qqh/bFAP0NIEOKSx616gawLddSyazu+Ua4scFvOQ6KPVu9KFS+BSf
         Ch6yftJL6f1j0hnyzMwpraU5QBSTlS7VRqk+HykpiGAJekjIxrpIgUMcZSlFgyxxzQ+l
         Z/MPhNgDzOo1EMgWTniaTdb4FPG9iuai9BgCQk2E5Cp3CDKhYYwIqadiB1kwCqflsyMl
         bMvhR6vwvlGN45YrU4blfUYbBLBzxR51GZPounQjhs/e2urV+kNaq77v786IVJMZWoQy
         UEGaWJwlG3A8fZVg19n8/yXN6sLzsOuSTUbRZdMi90rnIDzWY0TItcQG13V3lbtY0HAG
         7cIg==
X-Forwarded-Encrypted: i=1; AJvYcCWB2JOyCyjk0nIFj7EQERWPjguyZKcNnS57eag9Bhkm5Sn/sH+pApc0ZwvKGBwxs7AakRM5delSdPs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysR3rlxaPYNq81Kkbc1skRCdsvwMIOSi+PBJ/xSZ79yFsLMSV9
	mMtIbrb6Nfiu+nuvbv8LjE2qv+cp5L9MVPZ9tMQ75zhoj2mC4j6lRojrzSIWEi4=
X-Gm-Gg: ASbGnctVxdZEr9a/D9XtRBVwY1XLQv93603Uokomi2Sm+mlZIoRSS8rw0iAPORBmQgu
	z66L+IUlUZttcqSXL1C8PSsHNZLvgzBh69nOI9Fzq1lVm3FwYdWgTtd7o6GwPRn5p9AAbSXP6qc
	aT3DO7QWaCkLAPJEcpkHEVMVczsDFS74wI+BfO6y94vr0MxNmspampXAwk21iqD6ictbiJPq1v5
	ZqsL5wlaiFUkkkeJmyzBDzZ55JSD02/7CbXH6Z9DGcvUGKz8X9kMdgib7B5Oud0B3YWcs9ry1OU
	ZaZKYNLmy8mlXEN9Fu5gyw8ar/KazU+R
X-Google-Smtp-Source: AGHT+IFfFW0ahvgJXpyYh3QeF45874qC2NjRt+HQ+rzqojYUFXsSdDsanu8jy9/KEOn1uRDhm+e8gw==
X-Received: by 2002:a05:6402:3487:b0:5dc:c9ce:b022 with SMTP id 4fb4d7f45d1cf-5e4457abb46mr14134457a12.9.1740665580163;
        Thu, 27 Feb 2025 06:13:00 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Feb 2025 14:12:58 +0000
Message-Id: <D83AG7NO6F5P.YV16VNJWJ8FS@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: Add APIC IDs to the per-vLAPIC save area
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250218142259.6697-1-alejandro.vallejo@cloud.com>
 <1de43f95-5ed1-46c1-a157-094ceb84ac83@suse.com>
 <Z79Qe3kMS18P6JNQ@macbook.local>
In-Reply-To: <Z79Qe3kMS18P6JNQ@macbook.local>

Hi,

On Wed Feb 26, 2025 at 5:33 PM GMT, Roger Pau Monn=C3=A9 wrote:
> On Wed, Feb 26, 2025 at 02:11:23PM +0100, Jan Beulich wrote:
> > On 18.02.2025 15:22, Alejandro Vallejo wrote:
> > > Today, Xen hardcodes apic_id =3D vcpu_id * 2, but this is unwise and
> > > interferes with providing accurate topology information to the guest.
> > >=20
> > > Introduce a new x2apic_id field into hvm_hw_lapic.=C2=A0 This is immu=
table
> > > state from the guest's point of view, but it will allow the toolstack=
 to
> > > eventually configure the value, and for the value to move on migrate.
> > >=20
> > > For backwards compatibility, the patch rebuilds the old-style APIC ID=
s
> > > from migration streams lacking them when they aren't present.
> >=20
> > Nit: "when they aren't present" looks to duplicate "lacking them"?
> >=20
> > > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > > ---
> > > I've split this one from the rest of the topology series as it's inde=
pendent
> > > and entangled with another patch from Andrew.
> >=20
> > Albeit I think meanwhile we've settled that the entangling isn't quite =
as
> > problematic.
> >=20
> > > @@ -1621,6 +1624,14 @@ static int cf_check lapic_load_hidden(struct d=
omain *d, hvm_domain_context_t *h)
> > >          return -EINVAL;
> > >      }
> > > =20
> > > +    /*
> > > +     * Xen 4.20 and earlier had no x2APIC ID in the migration stream=
 and
> > > +     * hard-coded "vcpu_id * 2". Default back to this if we have a
> > > +     * zero-extended record.
> > > +     */
> > > +    if ( h->size <=3D offsetof(struct hvm_hw_lapic, x2apic_id) )
> > > +        s->hw.x2apic_id =3D v->vcpu_id * 2;
> >=20
> > While we better wouldn't get to see such input, it is in principle poss=
ible
> > to have an input stream with, say, half the field. Imo the condition ou=
ght
> > to be such that we'd make the adjustment when less than the full field =
is
> > available.
>
> I would add an additional check to ensure _rsvd0 remains 0, to avoid
> further additions from attempting to reuse that padding space.
>
> if ( s->hw._rsvd0 )
>     return -EINVAL;

That's already on lapic_check_hidden(), so it's guaranteed to be zero. Unle=
ss
you mean something else?

>
> if ( s->hw._rsvd0 )
>     return -EINVAL;
>
> In fact I would be tempted to overwrite the ID if the stream size
> doesn't match the expected one, ie:
>
> if ( h->size < (offsetof(struct hvm_hw_lapic, _rsvd0) +
>                 sizeof(s->hw._rsvd0)) )
>     s->hw.x2apic_id =3D v->vcpu_id * 2;

That looks better. I'll do that instead.

>
> Regards, Roger.

Cheers,
Alejandro

