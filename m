Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD01A480B7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 15:15:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898123.1306697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnefZ-0002AQ-OW; Thu, 27 Feb 2025 14:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898123.1306697; Thu, 27 Feb 2025 14:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnefZ-00028W-Lz; Thu, 27 Feb 2025 14:15:21 +0000
Received: by outflank-mailman (input) for mailman id 898123;
 Thu, 27 Feb 2025 14:15:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKwg=VS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tnefX-00028Q-Uz
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 14:15:19 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45585095-f515-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 15:15:18 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso10714975e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 06:15:18 -0800 (PST)
Received: from localhost ([46.149.103.8]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0b9a90sm129025766b.34.2025.02.27.06.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 06:15:16 -0800 (PST)
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
X-Inumbo-ID: 45585095-f515-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740665717; x=1741270517; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX6xuW7F3dw8ByisW6Gw5S2uDO6YIAh8PCvYZ9W8WKY=;
        b=Nb71Ld+QFe3uICL7xRcBPuDKQR6/4xuUMUmxX5EoIpQCDcuIRFfZ9ZQSn21grUTbLl
         cJBiIv5hGn6GlTE/nlvksIkUIDK+VgZAX18+bYR9iZ3V17eXOYbT/bnNmAXpVX8bekhe
         uBPkEd0Z2BoaBrWC1YgOIJwcWdsaFke8tt0pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740665717; x=1741270517;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kX6xuW7F3dw8ByisW6Gw5S2uDO6YIAh8PCvYZ9W8WKY=;
        b=vsoQ7Mg26UFYKoZPCdnXgFGJaOZkOoKeEJe1B3ZNuScC3akAMJLUQ/G3AUF8HAOk1X
         77hnvoDrRd+XGeLBMupy6MLEA+bfTyDrQHBDZSeOgeFdqkV/RKTnUQsRWUigyYllZRd7
         VJHScquAO3ZkYeRWINDDezejZv5EW/OoMHIEOR/WcyV2qvZ7OlngJeqEpFbkerHboSd/
         XP+TM0eXtCnT+goClai+n/ugvwGy9cJX0bxEw7QrZ3sb0Q/iMC51fFgQ+5esDGxDRWSa
         WK/UwqM82gMm49B6SmreOivBcoXcdoTAFEuc3X0o34XUy8BqyXfESOBBJ5aElr90sMUN
         Pxig==
X-Forwarded-Encrypted: i=1; AJvYcCWseALTPUHjpbK2caa+4fTYIeKTtWhLdQh0wVYmVbqnCWuR/MIX6Nn6kqIIDWWw6bAF+dN+fW+BtEc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmSXxSC3w0/juzRBNldGKh5XKDEltRVXunnfgoq67Y9y5iXQ8n
	JxXzw17ms+v3ffHc5tHadZBmIHyjr3UipRJEnyyxFkCeSasAgxwTZacmkhX2F6g=
X-Gm-Gg: ASbGncvd9AGpdfyoh+i5jXVVFkDfg7lo+ZBe5dFA0Usk/KE/eEv6+pdB0XIbQ0VjulU
	2OBfm4pnR8vmd0PyfEfzj5ZMDo7HUZDTEbx6ByZ1ajCdbvstoMj7quBYzlGo0yBKu9inSGPF+b/
	FjqhtgXI6JtMgLdIUmFtCzLxeFgqfPY6NhFJ7FoDM8hg8/vwAVjeE1SvjuVPt9G0YGm4/bnVU+c
	48bcW3XoIpaALceSEYXIwMRk+oqtrRk7HkZYWgKhGA0DSCR/+Yahl/0GOahanKBQ81NljEeOlJM
	cxD7u1ILaPup8KtSghXy85/B0oxZysk=
X-Google-Smtp-Source: AGHT+IFBwo5elktvfKfE4ZKvQUdwjF9s6++z++DuMcYACSAdihNaQQ5wlhpY13uIrw345Wf5bbs8kg==
X-Received: by 2002:adf:e309:0:b0:38c:5fbf:10ca with SMTP id ffacd0b85a97d-390cc631b60mr12005528f8f.39.1740665717277;
        Thu, 27 Feb 2025 06:15:17 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Feb 2025 14:15:16 +0000
Message-Id: <D83AHYNG8UV2.2NDUTZU5G50YG@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: Add APIC IDs to the per-vLAPIC save area
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250218142259.6697-1-alejandro.vallejo@cloud.com>
 <1de43f95-5ed1-46c1-a157-094ceb84ac83@suse.com>
In-Reply-To: <1de43f95-5ed1-46c1-a157-094ceb84ac83@suse.com>

On Wed Feb 26, 2025 at 1:11 PM GMT, Jan Beulich wrote:
> On 18.02.2025 15:22, Alejandro Vallejo wrote:
> > Today, Xen hardcodes apic_id =3D vcpu_id * 2, but this is unwise and
> > interferes with providing accurate topology information to the guest.
> >=20
> > Introduce a new x2apic_id field into hvm_hw_lapic.=C2=A0 This is immuta=
ble
> > state from the guest's point of view, but it will allow the toolstack t=
o
> > eventually configure the value, and for the value to move on migrate.
> >=20
> > For backwards compatibility, the patch rebuilds the old-style APIC IDs
> > from migration streams lacking them when they aren't present.
>
> Nit: "when they aren't present" looks to duplicate "lacking them"?

Indeed, I'll get rid of the former.

>
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> > I've split this one from the rest of the topology series as it's indepe=
ndent
> > and entangled with another patch from Andrew.
>
> Albeit I think meanwhile we've settled that the entangling isn't quite as
> problematic.
>
> > @@ -1621,6 +1624,14 @@ static int cf_check lapic_load_hidden(struct dom=
ain *d, hvm_domain_context_t *h)
> >          return -EINVAL;
> >      }
> > =20
> > +    /*
> > +     * Xen 4.20 and earlier had no x2APIC ID in the migration stream a=
nd
> > +     * hard-coded "vcpu_id * 2". Default back to this if we have a
> > +     * zero-extended record.
> > +     */
> > +    if ( h->size <=3D offsetof(struct hvm_hw_lapic, x2apic_id) )
> > +        s->hw.x2apic_id =3D v->vcpu_id * 2;
>
> While we better wouldn't get to see such input, it is in principle possib=
le
> to have an input stream with, say, half the field. Imo the condition ough=
t
> to be such that we'd make the adjustment when less than the full field is
> available.
>
> Jan

I think this is addressed by Roger's proposal later on, so I'll leave it at
that. Thanks.

Cheers,
Alejandro

