Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9393A7656E1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571171.894384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2Ym-0007DP-Sa; Thu, 27 Jul 2023 15:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571171.894384; Thu, 27 Jul 2023 15:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2Ym-0007BD-PA; Thu, 27 Jul 2023 15:05:48 +0000
Received: by outflank-mailman (input) for mailman id 571171;
 Thu, 27 Jul 2023 15:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3xgU=DN=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qP2Yl-00077y-En
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:05:47 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ffe260b-2c8f-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 17:05:45 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5222a38c0a0so1424671a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 08:05:45 -0700 (PDT)
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
X-Inumbo-ID: 0ffe260b-2c8f-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690470345; x=1691075145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPQKyiqbZMpiF3LYxGfLwkrBq8XZzon+LVcdzcrHHQ8=;
        b=MwICS+y2/dSiRjJieGbFY7SZQSZ29DSSMeX10It4QsdLHyYV532DH45aHAMK7Rsxw7
         852H+nQnzsgQu7teJ4VZ1L4UZNy3YO+pqveCax4US6fdwwOc0HRLD63TfaB5x96YKjKa
         oD/Nwq1mz8uuoC9ti/3683HjdYLbGuRUpbop85V3uAVRG0i5l8ok1FFIsr5KFiCsAjK4
         ZteV3zUPI6uk7XqobbNJ42YQ6riNryhbHZM4I0PqQ2aRKWtdk3Jhmtx+mxMMDbFOtf+6
         vEkiKLH8b8cQy9WPiLQrSV/KRnefGWFCttJmysAKZ1n4XLR6F0SueZpE0OruxV26IdxM
         uUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690470345; x=1691075145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPQKyiqbZMpiF3LYxGfLwkrBq8XZzon+LVcdzcrHHQ8=;
        b=IpLwUZ+X13Y7dmYaoHJ25Rbkl/U2a5g7eMuWbyFqyT1UtHQiqMLkcPks0dK9+VIiGg
         vew8aN5mDYvV9Y19dOOJE79lalWChoLT5r0EGKEBOHNZb8xb3vqt0J4D9mEH/e+L0AkX
         4JTNLOxJYIaM6I9PASJG8Lb7+Oq4ViEyE3G4wG5+sXKlqHv0hwS8W191QIIHO21WjxbP
         LELXNgovYbNRreJ+ZycxGfVfTqjfeDWZoSNRub5pTaWFGLvI8LJr6NJVT0ON5YrYw6mu
         r7gWrcVAxbOQUqdFIMQaFi1j2FUWDFMUHI2aw7bzkspEGBXaSP5Wg3FhYPnh7kfLcM6u
         jbDg==
X-Gm-Message-State: ABy/qLavHU01CyPoxvxQ64B2cz7WzvJpn0P+mXzFo59g618r5ANWZhHJ
	/mL5J0mCNNFmmnp5ufaaauY/uYu43wx8DEzyE0LZ0DdnzJM=
X-Google-Smtp-Source: APBJJlHiihw7fjuihL1aqqtEH3W4W/tZ8DvmnEYlp2PXPnTrQ51GD0IWALfdHkf27a6cnrVE3fn7X3PiuMYxGzmU+2s=
X-Received: by 2002:aa7:db4b:0:b0:522:4f0a:6822 with SMTP id
 n11-20020aa7db4b000000b005224f0a6822mr1951360edt.22.1690470345069; Thu, 27
 Jul 2023 08:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230726170945.34961-1-jandryuk@gmail.com> <20230726170945.34961-5-jandryuk@gmail.com>
 <5a6365b0-7809-4287-96fa-be7809d664c8@perard>
In-Reply-To: <5a6365b0-7809-4287-96fa-be7809d664c8@perard>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 27 Jul 2023 11:05:33 -0400
Message-ID: <CAKf6xpvzKiCkNkWYQyngENmF4+VmT3EgTWubDrQ0OZXgK9-jJg@mail.gmail.com>
Subject: Re: [PATCH v7 04/15] xen/sysctl: Nest cpufreq scaling options
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 6:27=E2=80=AFAM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Wed, Jul 26, 2023 at 01:09:34PM -0400, Jason Andryuk wrote:
> > Add a union and struct so that most of the scaling variables of struct
> > xen_get_cpufreq_para are within in a binary-compatible layout.  This
> > allows cppc_para to live in the larger union and use uint32_ts - struct
> > xen_cppc_para will be 10 uint32_t's.
> >
> > The new scaling struct is 3 * uint32_t + 16 bytes CPUFREQ_NAME_LEN + 4 =
*
> > uint32_t for xen_ondemand =3D 11 uint32_t.  That means the old size is
> > retained, int32_t turbo_enabled doesn't move and it's binary compatible=
.
> >
> > The out-of-context memcpy() in xc_get_cpufreq_para() now handles the
> > copying of the fields removed there.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > NOTE: Jan would like a toolside review / ack because:
> >     Nevertheless I continue to be uncertain about all of this: Parts of
> >     the struct can apparently go out of sync with the sysctl struct, bu=
t
> >     other parts have to remain in sync without there being an
> >     appropriate build-time check (checking merely sizes clearly isn't
> >     enough). Therefore I'd really like to have a toolstack side review =
/
> >     ack here as well.
>
> I wish we could just use "struct xen_get_cpufreq_para" instead of
> having to make a copy to replace the XEN_GUEST_HANDLE_*() macro.
>
> Next I guess we could try to have something like the compat layer in xen
> is doing, with plenty of CHECK_FIELD_ and other CHECK_* macro, but that
> would be a lot of work. (xen/include/xen/compat.h and how it's used in
> xen/include/compat/xlat.h)

I can add a set of BUILD_BUG_ON()s checking the offsets of the two
structs' members.  I think that would work and we don't need the
complication of the compat code.  The build of the library just deals
with a single bit-width and needs to be consistent.  The hypervisor
needs to deal with receiving differing pointer sizes and layouts, but
the userspace library just uses whatever it was compiled for.  The
preprocessor expands XEN_GUEST_HANDLE_64(uint32) -> "typedef struct {
uint32_t *p; } __guest_handle_uint32", so it's just going to be a
single pointer in size, which will match between the two.

Does that sound right, or am I missing something?

> Unless you feel like adding more build check, I guess the patch is good
> enough like that:
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

If I am incorrect about the above... I'll just leave it as-is.

Thanks,
Jason

