Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E99B64FD
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 14:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828238.1243091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t69Da-0002YW-3k; Wed, 30 Oct 2024 13:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828238.1243091; Wed, 30 Oct 2024 13:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t69Da-0002Wc-0r; Wed, 30 Oct 2024 13:58:38 +0000
Received: by outflank-mailman (input) for mailman id 828238;
 Wed, 30 Oct 2024 13:58:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQZl=R2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t69DY-0002WQ-Gc
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 13:58:36 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c2d48c8-96c7-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 14:58:32 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9acafdb745so172493366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 06:58:32 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1e0b23b2sm576711766b.4.2024.10.30.06.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 06:58:30 -0700 (PDT)
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
X-Inumbo-ID: 0c2d48c8-96c7-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBjMmQ0OGM4LTk2YzctMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjk2NzEyLjA0NDQ3OSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730296711; x=1730901511; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4SZ/TzHGFzJoaz7uI1YwHvLHPV/Y2WS0NvKgFEAdVY=;
        b=IHEWwZ4nRfYfiNWlJeu4FcFp1ouV1RawRjkvoZCrAmYya3oHfy9qVz9kyU3hYdwENP
         oZI073p2MuWKq9QSDQDV6/8v2E5UI6VKIUPTlLRo+hYhDnfhkfRjYG4jsj9asAECnRkH
         UJzbrDUyGeUMSc6yG5Zb8TBTbpGuTalvCXPso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730296711; x=1730901511;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V4SZ/TzHGFzJoaz7uI1YwHvLHPV/Y2WS0NvKgFEAdVY=;
        b=wR0XJn5qhmLW3NuihpN+TbBxa6dAev6rzycBeZd1PhggAVgVN6BpF1WCUUdPwK+NpQ
         OAbPo5Vxhbte85lXrUbMdwO4RrY8H9ziffdj9DFdoYvJiaKxUiE2MUPwkBHz4SVSIoAT
         pbapyK9AeL396GzYn/4e7z3EEm2ESEoNS5lBWJAHTZdnzzyIOfO6GWFl0r9skLLgPTw6
         TR1yJsvmfjnD1z2XFHPA/VfkfepHdJJLR4tjc0uhdFDVdjuaD6AslGWc4S0jD9k31tXH
         IhgjUpRVIAfK3SZsMeABfkpzcT6K2Wj4pXOgTQPTF/mmM87z0wzS1jv0eXHbG0Bm3SA2
         nVKg==
X-Forwarded-Encrypted: i=1; AJvYcCVoRJVbXh5ep6BvA+mecwHNb6I9ypBrVW2PRLf+Hjmqnx3jQz4HpQXVRYoD4yejqfPaEUpEc63wwQU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPpaQFUo9Ws2r50pK4ojTskyRPEka0l7eQfmnnRTJUD5XGoqrP
	Bal7NrMTaXY4JoV0+z28O9ddU8IAJdtd338vJd47Tgwg6xULLu94QNQB+g+SS1c=
X-Google-Smtp-Source: AGHT+IG6owuFhti0+kvaY7XH5hfRcI/nd+u3CtJ0PIniyayuIqeMkBfdHa4BVtu3idTLSaQoT5D1dQ==
X-Received: by 2002:a17:907:78c:b0:a99:f5d8:726 with SMTP id a640c23a62f3a-a9e2b62f094mr521815466b.23.1730296711245;
        Wed, 30 Oct 2024 06:58:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Oct 2024 13:58:30 +0000
Message-Id: <D596ZR1TFSWB.2BADAOBFA66CJ@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall"
 <julien@xen.org>, <xen-devel@lists.xenproject.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 1/6] xen/domctl: Refine grant_opts into
 grant_version
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
 <20241029181632.69600-2-alejandro.vallejo@cloud.com>
 <e89ec737-9405-4969-aca8-9a89c19c9e4c@suse.com>
In-Reply-To: <e89ec737-9405-4969-aca8-9a89c19c9e4c@suse.com>

Hi,

On Wed Oct 30, 2024 at 9:08 AM GMT, Jan Beulich wrote:
> On 29.10.2024 19:16, Alejandro Vallejo wrote:
> > grant_opts is overoptimizing for space packing in a hypercall that
> > doesn't warrant the effort. Tweak the ABI without breaking it in order
> > to remove the bitfield by extending it to 8 bits.
> >=20
> > Xen only supports little-endian systems, so the transformation from
> > uint32_t to uint8_t followed by 3 octets worth of padding is not an ABI
> > breakage.
> >=20
> > No functional change
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> >  xen/include/public/domctl.h | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
>
> This isn't a complete patch, is it? I expect it'll break the build withou=
t
> users of the field also adjusted.

Indeed. The non-RFC version would have everything folded in one. I just wan=
ted
to avoid Cc-ing everyone in MAINTAINERS for the same single RFC patch. It's
split by (rough) maintained area.

>
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -90,11 +90,18 @@ struct xen_domctl_createdomain {
> >      int32_t max_grant_frames;
> >      int32_t max_maptrack_frames;
> > =20
> > -/* Grant version, use low 4 bits. */
> > -#define XEN_DOMCTL_GRANT_version_mask    0xf
> > -#define XEN_DOMCTL_GRANT_version(v)      ((v) & XEN_DOMCTL_GRANT_versi=
on_mask)
> > +    /*
> > +     * Maximum grant table version the domain can be configured with.
> > +     *
> > +     * Domains always start with v1 (if CONFIG_GRANT_TABLE) and can be=
 bumped
> > +     * to use up to `max_grant_version` via GNTTABOP_set_version.
> > +     *
> > +     * Must be zero iff !CONFIG_GRANT_TABLE.
> > +     */
> > +    uint8_t max_grant_version;
> > =20
> > -    uint32_t grant_opts;
> > +    /* Unused */
> > +    uint8_t rsvd0[3];
> > =20
> >  /*
> >   * Enable altp2m mixed mode.
>
> Just to mention it: I think while binary compatible, this is still on the=
 edge
> of needing an interface version bump. We may get away without as users of=
 the
> removed identifiers will still notice by way of observing build failures.
>
> Jan

If users are forced to rebuild either way, might as well prevent existing
binaries from breaking. There ought to be a strict distinction between ABI =
and
API compatibility because, while they typically move in lockstep, they don'=
t
always (and this is one such an example).

Regardless, this is a discussion for the final patch if we get there.

Cheers,
Alejandro

