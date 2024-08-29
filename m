Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B879648CE
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 16:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785949.1195495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjgLz-0007fN-PG; Thu, 29 Aug 2024 14:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785949.1195495; Thu, 29 Aug 2024 14:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjgLz-0007d4-Mc; Thu, 29 Aug 2024 14:42:27 +0000
Received: by outflank-mailman (input) for mailman id 785949;
 Thu, 29 Aug 2024 14:42:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LPGY=P4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sjgLx-0007cy-OB
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 14:42:25 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e726c094-6614-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 16:42:23 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2f50966c448so7929561fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 07:42:23 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614f384eesm1860351fa.62.2024.08.29.07.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:42:22 -0700 (PDT)
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
X-Inumbo-ID: e726c094-6614-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724942543; x=1725547343; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yegLIobAX3JcGEVXi/TSJXJCqTJI6vrDcDN4DRWWpac=;
        b=ME8iB/03C75jhIxjBqmezRCKjYeaRSlIcnQRyp8ZGXZ5Z0EwhG2vsfbfSsWlCDrwfQ
         KCDaTfCjIkibmchJs4YVQ8cY3YKyrm6hSFui/TlH7RjZ9h4Tro2MuO27a+tQOWd+dojb
         FZTfeOX2oQCqXXWQ7Tij3CFxOHcH1pY+AivQl3srGpOBTWL0fhj3WLOwNoRjzAc412Lz
         z2aIRTQDwBrelRubyu0ZNSBbfTRFRP9f6O97RGWXy+NxugX/AUt7tNW5isR2yePwKeYN
         ULVsbHGQjjh7exzpkuVYRr7Zv1FJJ9jQqxDm+3ZaY0vUf2NyWeZcjZZHjKYGm60688Go
         vwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724942543; x=1725547343;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yegLIobAX3JcGEVXi/TSJXJCqTJI6vrDcDN4DRWWpac=;
        b=M0wl+wLXPXxleVEuM5PVvowLXa8AnW3m7py4GMsTrYLLp56k5KuoLuIfCkA/rMN9wX
         A3YOMnRFT50tlmKUmIXHJ5Q69p3SFZFlgOhrayS3/QS9TV7epISsnp6iAi0k9eIJoTsj
         RBu/gYDY3xToSeldt2wWgldlZs3g5/7dbkkxkIwnxpqTXQt9JUZ/t0vPIXrjYhqy6w7x
         ukYRqoDj2D4VVa7JWUKnGCxhu/MBBOtsQdUXKvOKNJwInztcYgoD1JWgxbZHFv4nUedr
         aTcnnUeItAnLPDAVQN/IP/d6OlErCNeWkA1aK/eb/uWxbNSW82i99GvtlFko+1JTdhuO
         /qww==
X-Forwarded-Encrypted: i=1; AJvYcCVwA9wa6CYVS/254mUnnwCvA91E10css9fNGN21OWkpcmIRnStomHhP9UV99xstH+SG5cJUkmQsz3Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUfonvUkVH9fSOOWSc2E2C8M1IhTKBTfSNN9f9q8wwIMVj3t13
	dpgbqQDXbGvLtaQvA/M74FJ9NG8+xYvHxbivaUpJVn+iT2xpSfw/
X-Google-Smtp-Source: AGHT+IENl01FmC8OHBQVgf3q0WKnjPnkqOViJhqUB93HWNl+/4fCZM20ykW0MDCALyMK2Mxj+ElZGQ==
X-Received: by 2002:a05:651c:548:b0:2f4:3de7:ac4c with SMTP id 38308e7fff4ca-2f6103908d3mr27692921fa.8.1724942542256;
        Thu, 29 Aug 2024 07:42:22 -0700 (PDT)
Message-ID: <9cc1fdf64f52ae5242e28ced7fec309c4f2e2d55.camel@gmail.com>
Subject: Re: [PATCH v5 6/7] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 29 Aug 2024 16:42:21 +0200
In-Reply-To: <05a08778-7c3f-416e-a7ef-12a1472d3fce@suse.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
	 <090e617d88b279ae88f1a7859875a7e1a0c6ae73.1724256027.git.oleksii.kurochko@gmail.com>
	 <c0005454-3b34-427d-8ea0-620aba632487@suse.com>
	 <ed84c53454cb63082aa96befe89a89d8f234ef71.camel@gmail.com>
	 <b83e7d23-2171-447f-a4e5-48563e4068a5@suse.com>
	 <4418002b93a3ae101e15e390dc537c726948bcb4.camel@gmail.com>
	 <05a08778-7c3f-416e-a7ef-12a1472d3fce@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-08-29 at 14:14 +0200, Jan Beulich wrote:
> > > > > =C2=A0Also note that "`mfn` is
> > > > > valid" isn't the same as "mfn !=3D INVALID_MFN". You want to be
> > > > > precise
> > > > > here,
> > > > > to avoid confusion later on. (I say that knowing that we're
> > > > > still
> > > > > fighting
> > > > > especially shadow paging code on x86 not having those
> > > > > properly
> > > > > separated.)
> > > > If it is needed to be precise and mfn is valid isn't the same
> > > > as
> > > > "mfn
> > > > !=3D INVALID_MFN" only for the case of shadow paging?
> > >=20
> > > No, I used shadow paging only as an example of where we have
> > > similar
> > > issues. I'd like to avoid that a new port starts out with
> > > introducing
> > > more instances of that. You want to properly separate INVALID_MFN
> > > from
> > > "invalid MFN", where the latter means any MFN where either
> > > nothing
> > > exists at all, or (see mfn_valid()) where no struct page_info
> > > exists.
> > Well, now I think I understand the difference between "INVALID_MFN"
> > and
> > "invalid MFN."
> >=20
> > Referring back to your original reply, I need to update the comment
> > above pt_update():
> > ```
> > =C2=A0=C2=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If `mfn` is valid ( exist ) and flags =
has PTE_VALID bit set
> > then it
> > =C2=A0=C2=A0=C2=A0 means that inserting will be done.
> > ```
> > Would this be correct and more precise?
>=20
> That depends on whether it correctly describes what the code does. If
> the code continues to check against INVALID_MFN, such a description
> wouldn't be correct. Also, just to re-iterate, ...
>=20
> > Based on the code for mfn_valid(), the separation is currently done
> > using the max_page value, which can't be initialized at the moment
> > as
> > it requires reading the device tree file to obtain the RAM end.
>=20
> ... mfn_valid() may return false for MMIO pages, for which it may
> still
> be legitimate to create mappings. IMO ...
>=20
> > We could use a placeholder for the RAM end (for example, a very
> > high
> > value like -1UL) and then add __mfn_valid() within pt_update().
> > However, I'm not sure if this approach aligns with what you
> > consider by
> > proper separation between INVALID_MFN and "invalid MFN."
>=20
> ... throughout the code here you mean INVALID_MFN and never "invalid
> MFN".
IIC INVALID_MFN should mean that mfn exist ( correspond to some usable
memory range of memory map ) but hasn't been mapped yet. Then for me
what I have in the comment seems correct to me:
```
   if `mfn` isn't equal to INVALID_MFN ( so it is valid/exist in terms
   that there is real memory range in memory map to which this mfn
   correspond ) and flags PTE_VALID bit set ...
```


> Populating page tables is lower a layer than where you want to be
> concerned with that distinction; the callers of these low level
> functions
> will need to make the distinction where necessary.
Then the question now is just in a proper wording of the pt_update()
arguments values?

~ Oleksii


