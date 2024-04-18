Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6AA8A93B5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707974.1106457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLqg-0001uK-Dl; Thu, 18 Apr 2024 07:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707974.1106457; Thu, 18 Apr 2024 07:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLqg-0001q2-9u; Thu, 18 Apr 2024 07:06:22 +0000
Received: by outflank-mailman (input) for mailman id 707974;
 Thu, 18 Apr 2024 07:06:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECj6=LX=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1rxLqf-0001nt-1C
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:06:21 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27c440d6-fd52-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 09:06:20 +0200 (CEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2a28b11db68so412209a91.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 00:06:20 -0700 (PDT)
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
X-Inumbo-ID: 27c440d6-fd52-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713423978; x=1714028778; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMnKedljnvby1Tgsb4GiSHYS8ERlxtZ6hox9q6N76gM=;
        b=gbgEFtrwrTC5e//5iodjEZjeq/fyK+LlwD8M9pZjW7eyaYjVr8JGx8npczkFT/zEZT
         2ramZ0tresaO5GNMVjtvpTNnXUmBc4CY6E9qBDz1qDAUJRiSfWVq2CNHGR2Xs/rp1we8
         WSNU9SGbJGD3jkREgjWUGW+C0UUPku8bVQOxCBmgAeq7BJISoXmWHDy5VfMu1pMwoD9U
         g68QqqAdplXS3Fo+QaQ7iDLtTstIvs98MHJFnA4WM5r6iakU0GHu085ka8ZIi/n72xM+
         XPB8BT+heizOqAG5UhKQbTQ5CjiOX0sa+LKDk2Ois5KWVXB8J2ZUplqxbBEWqmYcI71o
         U00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713423978; x=1714028778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMnKedljnvby1Tgsb4GiSHYS8ERlxtZ6hox9q6N76gM=;
        b=J9mmf/BY4zeXEr76WYkpxT0envA0eHPR9p9b+4wIrCcAR4USzA6PLbYCDTksIvdP4n
         l1EuQTTAkhTucOIattNoBDDFRord34LtM6H2LR54J1TMny+8ISkIneS6G7NzYo+3+SOT
         Sa0zPiB6w7BSYObZzds8MvRKD2sTqYmrtKdkfklweUvlfnpvjSP6aRJv/Gu5nCoyeJvA
         w/a2cCVyLbcgFXX+hSeIIYJb7loCZSetl3xJteCCb2CkxLqp+p1ZVh6VS3VvMy5/XsQn
         vgIAj7oL5D7ewHVoBNfP7A64aXHh34ZfRs0T65gh7IvuPQ16xekuQ93Apka1oRVumg7+
         9VLA==
X-Gm-Message-State: AOJu0YzqG8JCpQty6X8SPM9kX+zcwK/qz/cLidlF28wSdaC/h9S0yZwq
	E9hC/sANf2YBFPs78sQ2j/dm+eJtTLB6a2YdjnqOLbO4Je1Y3CRsRD2AWz1CM5tWmNLyIVb+APh
	pirXmzm+q+sEr5OH1OfgF8h2dGqk=
X-Google-Smtp-Source: AGHT+IE6jfj5ptwJ+K51hQoVxxUuGmCwNh+hInsaA5N0yf+xxCZFEwrVdZpcGDZx+KWo5I8l7s4E+6ZT/AcIS6BKEkI=
X-Received: by 2002:a17:90b:68e:b0:2ab:a825:ae5 with SMTP id
 m14-20020a17090b068e00b002aba8250ae5mr1763873pjz.22.1713423978330; Thu, 18
 Apr 2024 00:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240410091947.1498695-1-edgar.iglesias@gmail.com>
 <20240410091947.1498695-2-edgar.iglesias@gmail.com> <9f12ebbb-5080-4eff-a965-8d5ab8e3ccd0@citrix.com>
 <CAJy5ezraDhjVvAp_VCG0FO0smNK7=5goVOwcnCEY_8LycjwWYQ@mail.gmail.com> <f65ae42d-32e0-4d95-b4a8-625da7158d41@suse.com>
In-Reply-To: <f65ae42d-32e0-4d95-b4a8-625da7158d41@suse.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 18 Apr 2024 09:06:03 +0200
Message-ID: <CAJy5ezpiokTwj5S==0AnGKpdabXg6cTEE9Tc1Rk9JNPWUpovLg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] xen/arm64: entry: Use xen/linkage.h to
 annotate symbols
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
	bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
	edgar.iglesias@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 8:10=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.04.2024 12:24, Edgar E. Iglesias wrote:
> > On Wed, Apr 10, 2024 at 12:21=E2=80=AFPM Andrew Cooper <andrew.cooper3@=
citrix.com>
> > wrote:
> >
> >> On 10/04/2024 10:19 am, Edgar E. Iglesias wrote:
> >>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >>>
> >>> Use the generic xen/linkage.h macros when annotating symbols.
> >>>
> >>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> >>> ---
> >>>  xen/arch/arm/arm64/entry.S | 12 ++++++------
> >>>  1 file changed, 6 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> >>> index f963c923bb..6188dd2416 100644
> >>> --- a/xen/arch/arm/arm64/entry.S
> >>> +++ b/xen/arch/arm/arm64/entry.S
> >>> @@ -480,9 +480,9 @@ guest_fiq_invalid_compat:
> >>>  guest_error_compat:
> >>>          guest_vector compat=3D1, iflags=3DIFLAGS__AI_, trap=3Dguest_=
serror
> >>>
> >>> -ENTRY(return_to_new_vcpu32)
> >>> +FUNC(return_to_new_vcpu32)
> >>>          exit    hyp=3D0, compat=3D1
> >>
> >> In the new world, you want an END() too, which sets the size of the sy=
mbol.
> >>
> >> A good cross-check of this annotation stuff is:
> >>
> >> readelf -Wa xen-syms | grep return_to_new_vcpu32
> >>
> >> which in this case will tell you that the symbol called
> >> return_to_new_vcpu32 still has a size of 0.
> >
> > Patch 2/2 adds the END, I should probably have squashed them into one..=
.
>
> Only partly afaics: return_to_new_vcpu{32,64} are still left without. And
> yes, preferably the adjustments to the start annotation for a symbol
> would come with an END() addition right away.
>

Thanks Jan,

Yes, in v2 I've squashed the patches into one to avoid confusion:
https://patchew.org/Xen/20240415231541.4140052-1-edgar.iglesias@gmail.com/

Here's the hunk in patch 2/2 of the first v1 RFC submission that added
the END's to return_to_new_vcpuXX:
https://lists.xenproject.org/archives/html/xen-devel/2024-04/msg00505.html

FUNC(return_to_new_vcpu32)
         exit    hyp=3D0, compat=3D1
+END(return_to_new_vcpu32)
+
 FUNC(return_to_new_vcpu64)
         exit    hyp=3D0, compat=3D0
+END(return_to_new_vcpu64)

Cheers,
Edgar

