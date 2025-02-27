Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B69A480C2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 15:17:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898130.1306708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tneh8-0002i9-2a; Thu, 27 Feb 2025 14:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898130.1306708; Thu, 27 Feb 2025 14:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tneh7-0002fk-W6; Thu, 27 Feb 2025 14:16:57 +0000
Received: by outflank-mailman (input) for mailman id 898130;
 Thu, 27 Feb 2025 14:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKwg=VS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tneh6-0002fV-2d
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 14:16:56 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eac8b6b-f515-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 15:16:54 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe82so1155102f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 06:16:54 -0800 (PST)
Received: from localhost ([46.149.103.9]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c74c766sm127863466b.127.2025.02.27.06.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 06:16:53 -0800 (PST)
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
X-Inumbo-ID: 7eac8b6b-f515-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740665813; x=1741270613; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mxeRIfobHq3MtliJfYmTsVVoVe8yeSafqTQaNvWGp0=;
        b=BD69poV5rhEEe217SKjOFs2oihHBu4TNNhCrSlMWvX3D6zN2CrO97QeH26ByIuxHKT
         w0H9GiOdjoo6IBj4WQ3hK/mnMD6L8hkz2xdSJ3yEwsLnZCyyPI2bjVbPXLgVRoDWUOux
         wfRCCNsiGi7ljkaK4ZDl1cu9gliKdm9JkUvT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740665813; x=1741270613;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3mxeRIfobHq3MtliJfYmTsVVoVe8yeSafqTQaNvWGp0=;
        b=IRbtrNVieAehB/d7qYdywOaNTZOR/3tZ7uf+qD3HE2DLo3E7nfTo0zDwbsFobm+HJ9
         OLyCvYraESClsoQ6LuHaShsmcRi+IF7t8Q7MlOxHuHoH9idKwiaRuDc6aXwWnalYAQVS
         QUOS7gEyBeucKkRR5A4AzPJapfJ/iJzgza6K2fYBW9e7GVmyBn22PXAEwQodrpMVw1cK
         yxw+ZRUmIk0Jj65ktES4D8rdmuaQroj6+1QxIuW2R4xjDdBMEaiyZt8hGeaOp1HlM+cU
         UkcCvQBvQgsJRGdS0l0KMj6nCn5mkeFLiKJHGuF1iwF1/UKCGXln4HgUxXNhwuIPYd7a
         XVaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR0CXQK2bbyIlW1hwI+yQNRE0xjpENlEwVdhr4G3mj5BRd0gaoCq3qhFEq5lw7tMWwqTpAwyOCkTM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjgPMH6YfNUiPRCNfCyBgsulu3JKTjnLoLwxL4BrWgUk47066Y
	BSLs8yzVuzz+y4BS9Z3+YJsebZ6F/JLiQ5jXj4DCZXBrFJ3Vz7/075WoCAOwHL8=
X-Gm-Gg: ASbGncvERbxBWNnK7q7m+OuHlfo5ctsYm0Rmp6CCzk8GoUN40fOllu9HgfyvgLQQp3J
	Lj9WKDvqgOlKNyPPwnw78ywGaJGQgo0pqbmzUQrKDmYYWtXQYmPx7Q/A9I553fpx8V3VeSm3NXv
	hPhS8EzMrko3WTrK2h7dAg13AGfreZm7QdrhJHVk55OoNcE7kLGKtlgMomVYK67U+/9kfoY/YDq
	mgqY8DrkB7rS4EIVuVKSNu8aG6HYxbWqpjzF5cxMjbnLLJHUEkhe6cmkUTK8gqCJ4P6jeMslWsu
	E2o+vFe4YO5LYppaxlUZ7lZi76gvUbo=
X-Google-Smtp-Source: AGHT+IF7CFDtQo78UqL1RXct1BtWP7I4xvjy7JKhHEo+vxczp0Kcl+jZ5bnMH3CAarJrfC0gX95nFw==
X-Received: by 2002:a5d:5f90:0:b0:390:df5b:474d with SMTP id ffacd0b85a97d-390df5b4a1bmr6741204f8f.53.1740665813590;
        Thu, 27 Feb 2025 06:16:53 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Feb 2025 14:16:52 +0000
Message-Id: <D83AJ6YCUHZK.EHST86QLX0TZ@cloud.com>
Subject: Re: [PATCH] x86/hvm: Add APIC IDs to the per-vLAPIC save area
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250218142259.6697-1-alejandro.vallejo@cloud.com>
 <1de43f95-5ed1-46c1-a157-094ceb84ac83@suse.com>
 <Z79Qe3kMS18P6JNQ@macbook.local>
 <256285aa-d4a5-4735-b8bf-68fccd912c83@suse.com>
In-Reply-To: <256285aa-d4a5-4735-b8bf-68fccd912c83@suse.com>

On Thu Feb 27, 2025 at 7:29 AM GMT, Jan Beulich wrote:
> On 26.02.2025 18:33, Roger Pau Monn=C3=A9 wrote:
> > On Wed, Feb 26, 2025 at 02:11:23PM +0100, Jan Beulich wrote:
> >> On 18.02.2025 15:22, Alejandro Vallejo wrote:
> >>> Today, Xen hardcodes apic_id =3D vcpu_id * 2, but this is unwise and
> >>> interferes with providing accurate topology information to the guest.
> >>>
> >>> Introduce a new x2apic_id field into hvm_hw_lapic.=C2=A0 This is immu=
table
> >>> state from the guest's point of view, but it will allow the toolstack=
 to
> >>> eventually configure the value, and for the value to move on migrate.
> >>>
> >>> For backwards compatibility, the patch rebuilds the old-style APIC ID=
s
> >>> from migration streams lacking them when they aren't present.
> >>
> >> Nit: "when they aren't present" looks to duplicate "lacking them"?
> >>
> >>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >>> ---
> >>> I've split this one from the rest of the topology series as it's inde=
pendent
> >>> and entangled with another patch from Andrew.
> >>
> >> Albeit I think meanwhile we've settled that the entangling isn't quite=
 as
> >> problematic.
> >>
> >>> @@ -1621,6 +1624,14 @@ static int cf_check lapic_load_hidden(struct d=
omain *d, hvm_domain_context_t *h)
> >>>          return -EINVAL;
> >>>      }
> >>> =20
> >>> +    /*
> >>> +     * Xen 4.20 and earlier had no x2APIC ID in the migration stream=
 and
> >>> +     * hard-coded "vcpu_id * 2". Default back to this if we have a
> >>> +     * zero-extended record.
> >>> +     */
> >>> +    if ( h->size <=3D offsetof(struct hvm_hw_lapic, x2apic_id) )
> >>> +        s->hw.x2apic_id =3D v->vcpu_id * 2;
> >>
> >> While we better wouldn't get to see such input, it is in principle pos=
sible
> >> to have an input stream with, say, half the field. Imo the condition o=
ught
> >> to be such that we'd make the adjustment when less than the full field=
 is
> >> available.
> >=20
> > I would add an additional check to ensure _rsvd0 remains 0, to avoid
> > further additions from attempting to reuse that padding space.
> >=20
> > if ( s->hw._rsvd0 )
> >     return -EINVAL;
>
> I agree we want such a check; I actually should have pointed that out, to=
o.
> I don't, however, see why the field couldn't be re-used going forward (un=
der
> the right conditions, of course).

It could be reused indeed, but at the point of making use of it we'd remove=
 the
check.

Cheers,
Alejandro

