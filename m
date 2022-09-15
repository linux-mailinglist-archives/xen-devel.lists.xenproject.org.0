Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D565B9DC2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 16:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407484.650034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYqEl-0000HJ-Ht; Thu, 15 Sep 2022 14:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407484.650034; Thu, 15 Sep 2022 14:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYqEl-0000FW-Ei; Thu, 15 Sep 2022 14:53:07 +0000
Received: by outflank-mailman (input) for mailman id 407484;
 Thu, 15 Sep 2022 14:53:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMgp=ZS=minervasys.tech=marco.solieri@srs-se1.protection.inumbo.net>)
 id 1oYqEj-0000FQ-Ai
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 14:53:05 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19841464-3506-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 16:53:03 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id d1so1959074eje.8
 for <xen-devel@lists.xenproject.org>; Thu, 15 Sep 2022 07:53:03 -0700 (PDT)
Received: from localhost (nb2assolieri.mat.unimo.it. [155.185.4.56])
 by smtp.gmail.com with ESMTPSA id
 tl1-20020a170907c30100b0077fde38993asm4263316ejc.152.2022.09.15.07.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 07:53:02 -0700 (PDT)
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
X-Inumbo-ID: 19841464-3506-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=CM2op29jHNaWz7B0LewxVe7CUQIIdaDJXgS/4awh6zk=;
        b=qs+XMXiWQ8CvK1uMyMyhXZNfeg7vwqYe3PLUmDuEoWkcITNUzEzAgFMXCja0gb6L+3
         9JiY3f8p6ZTWJ3Imyf9ecz0YkBqO2j25FuP6i4zqOysbVyT1yEuEzoFiIWupNNmv7HG+
         upsA8SlO+dmeMubTaJ8otwv+Hg0bH5h3g4PBahKlI5uHroRDX6GiSkLcqIBej+s3jj9A
         WXfvz+IDGualb0jQcGS63oEULiO8vcux0T/Ktmc/jRW30On/SWM4NMwN+mkmsDgNcutd
         YIMFWeUrBYMPLnCZecucLpIa+tuz7XLZFi+OMR54UN0hMON+fZtFClNRFVyQWZtbDj/6
         ppeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=CM2op29jHNaWz7B0LewxVe7CUQIIdaDJXgS/4awh6zk=;
        b=GrO0f/Yy7dnihC4nKZhnYimArqYQPuUC+JPtS0QmVce+yjwW7uTP9saga+gg4gKdDp
         MvzCOzIYrBvdMcZYiLsmSQ7JJce860dQC8X0Ht1jRUPbDh6VJnKfEMiz/UXD1Wb1NdU6
         YBAjhu4lkbTC3ipYnbVuGB1jDr9aJ7NXlEgG0f7yc2X0KV/vka4NckMQZ/h22+GOp1y4
         cGsaFo9ZQ8OOq3xwEPDXDh3u+sqte7bFhJ1zdDiQvcCLQpzB57fiuPq9FGo0wyR1X8ud
         3S96cN3BLhBSEauGsLdImP+PLU6mvIttlyW+1sneh/JT/8agsC56YyDGkEi02p4kuDgv
         3piQ==
X-Gm-Message-State: ACrzQf2CR9+/PfSwp/J4paVtIkwIPFOl8yOOzuOhiFKYnNYu3uE5oX6B
	t1c95CBUX40u5q+SMzhTGIXVHQ==
X-Google-Smtp-Source: AMsMyM7FxVisLUSk8IDplznq5ctacqcQU6hvRVh+liIumq4EYVF4pp4cy0BIlshgYXgJRrB04Yt2DQ==
X-Received: by 2002:a17:906:7094:b0:73d:c95a:e66e with SMTP id b20-20020a170906709400b0073dc95ae66emr250618ejk.179.1663253582860;
        Thu, 15 Sep 2022 07:53:02 -0700 (PDT)
Date: Thu, 15 Sep 2022 16:52:10 +0200
From: Marco Solieri <marco.solieri@minervasys.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>, andrew.cooper3@citrix.com,
	george.dunlap@citrix.com, julien@xen.org,
	stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/12] Arm cache coloring
Message-ID: <20220915145210.wfdvhf2gskqagz4l@carbon.xt3.it>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <65f5a6b5-37a7-4b5f-b42b-805a51790a60@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d7pn54jbtvcdo6a2"
Content-Disposition: inline
In-Reply-To: <65f5a6b5-37a7-4b5f-b42b-805a51790a60@suse.com>


--d7pn54jbtvcdo6a2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Thu, Sep 15, 2022 at 03:29:08PM +0200, Jan Beulich wrote:
> On 26.08.2022 14:50, Carlo Nonato wrote:
> > Shared caches in multi-core CPU architectures represent a problem for
> > predictability of memory access latency. This jeopardizes applicability
> > of many Arm platform in real-time critical and mixed-criticality
> > scenarios. We introduce support for cache partitioning with page
> > coloring, a transparent software technique that enables isolation
> > between domains and Xen, and thus avoids cache interference.
> >=20
> > When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
> > the user to define assignments of cache partitions ids, called colors,
> > where assigning different colors guarantees no mutual eviction on cache
> > will ever happen. This instructs the Xen memory allocator to provide
> > the i-th color assignee only with pages that maps to color i, i.e. that
> > are indexed in the i-th cache partition.
> >=20
> > The proposed implementation supports the dom0less feature.
> > The solution has been tested in several scenarios, including Xilinx Zynq
> > MPSoCs.
>=20
> Having looked at the non-Arm-specific parts of this I have one basic
> question: Wouldn't it be possible to avoid the addition of entirely
> new logic by treating the current model as just using a single color,
> therefore merely becoming a special case of what you want?

Nice question.  Thanks!

In principle, you are quite right: monochrome is just a degenerate
choice of colouring---the colouring implementation with a single colour
allows assigning all the available pages, exactly as it happens with the
ordinary allocator.  The difference lies in the allocation algorithm.

In practice, that would be quite inefficient.  This is because the
allocation logic used by the coloured allocator is quite simpler, since
it operates with lists, instead of binary trees.  Now, upgrading the
logic of the coloured allocator would be an overkill because lowering
the complexity of insertion/removal operations from linear to
logarithmic does not change much, since in the real world, the longest
sequence of physically contiguous pages that may be assigned is
max_colours - 1.

Cheers.

--=20
Marco Solieri, Ph.D.
CEO & Founder
Tel: +39-059-205-5182 -- Mobile: +39-349-678-66-65 -- OpenPGP: 0x75822E7E

Minerva Systems SRL -- https://www.minervasys.tech
Via Campi 213/B, 41125, Modena, Italy -- PIVA/CF 03996890368

~~>
Discover how to easily optimise complex embedded solutions
for high-performance, safety and predictability. Together.

> Plus an advanced question: In how far does this interoperate with
> static allocation, which again is (for now) an Arm-only feature?
> Your reference to dom0less above doesn't cover this afaict.
>=20
> Jan

--d7pn54jbtvcdo6a2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAmMjPBMACgkQCtn83XWC
Ln4zLQ//Y7S/raGU4rfr4w8AtCppbkuijfXl0m5cLy2yPCtZgqLEgITPUcHOf2zX
jSn6ZlDx2OfS5GFqcgcssY+8NxjQEKxRhCDv4VEp9+kMbk+0eYNh0DpbsEOckQ4T
Tb7C3agXfD5L0U6Mmuf/gWykKqu89tdvmHd8ORWN6381t73fINIBg3jatxeg4YiW
ujEAtVN/AfaVm6mdl5CR1AIz1F0cpQ6DUpAEIc1ch5Va13+cz12R33kRQC33SnnC
IcE1BqdZD7EdhveStckbMFyKTvE229DvSARowup3Z95y5o33ZPHjt16ys4DDl6fC
TvBpUGcjYL5PAvleSAHjuM/GqQhzqZI8R9uV7cX8nHmpyE2swmgu8eRDzZk+wN2z
n8NHZnbs/Me1lNlKAXC7aXmfW00QkAy0ep5CAfyHdQgoCS9ttiYTaba863Svp64R
FIPZh5ixk+x/WlT096y4FejTiRnkzvW+gb239N0L8bSHEyPtk2C9tHAnz30nxhzm
bWnqqbJL4mw13K3v9DbzaOoYxWSUpqnJpbajY8OHy9k/6KM1Dolvw49qJ7dxD3ES
fXwsAZpk74ZAgOLCsMTr963A8+orAAo+glcRAQocl3+dpEAitjT6RJhGGEXIrq/z
T05DtN8QUCkARN8+1Mv6Y+Ldm53sdeJjBMOVQEpqU0Ucd/5RBiE=
=h9PM
-----END PGP SIGNATURE-----

--d7pn54jbtvcdo6a2--

