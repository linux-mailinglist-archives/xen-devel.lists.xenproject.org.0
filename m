Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B982D808
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 12:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667300.1038432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKmT-0002FB-51; Mon, 15 Jan 2024 11:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667300.1038432; Mon, 15 Jan 2024 11:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKmT-0002Cj-2C; Mon, 15 Jan 2024 11:05:25 +0000
Received: by outflank-mailman (input) for mailman id 667300;
 Mon, 15 Jan 2024 11:05:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nyhf=IZ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rPKmS-0002Cd-9H
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 11:05:24 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa131b70-b395-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 12:05:22 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a28b2e1a13fso905367066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 03:05:22 -0800 (PST)
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
X-Inumbo-ID: fa131b70-b395-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1705316722; x=1705921522; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+1A3r8A/mtSHOVUpe7XomgsOGCCJ7c+QcdSEI0IBXs=;
        b=Zi9/E3AKRMHrK38KnloeOPgJYtZzIEi++KA2LvuEcwOut2KFGG0Mh53Vna/+DPH/Y5
         r6A/pu4ksF1nJabvLS3lo7W0VhSETubwyKr7ai92U3DY/F3h9oiz3TqbAzfH/ATVuNgW
         aexISNHTEgNMQQnQxI2F5YOE0kbaMRRG2gnMaQOlwgROZ5nbt97cxA3A1EdlmnIoJDIt
         MKlu8HGvvAj81c6OolcwrDmPYgk5vSLtMD3xUn1AM6aHBhigwZf3r3fVOSTpFavGG+Dz
         bYQWUadJo8pQ2tzvBwxTo+mleYGBhYWNB9Mox7cB8Oet0QL2lGzq48/CmBZ0XJYkvfDd
         we4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705316722; x=1705921522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+1A3r8A/mtSHOVUpe7XomgsOGCCJ7c+QcdSEI0IBXs=;
        b=jj8qVskm6afgmIzCgLH1X+dsDukmqP4HS0fSdWPihdtF54ebaKvo2muD6mQcdAK76V
         Fp/ZLyg3LRhcVWDOW9G7I2RWIuIXXg5Sy/xhai10mNX2d+hgXlBaJIFGmarC1iNd+CSC
         iDheZQ4mPaOgjopCojcbPezE8a4jfUBn7JHKp/Q7r6yNdjywXFrBu3zIKy/TgA6o2SMx
         ZHx6/uWjiUgAeiVgI3OkJybnjRWVlf6MLz+3GLMTYhqCNqZs0FqEf2ekKOL/l78bK6zf
         iwB+dlnVSvaFfcw5iEOkdJkhQFDD3RPsx+NvK4mKYDw10ToktiancU5f7/AEOQqh4JSw
         isnw==
X-Gm-Message-State: AOJu0YwCJulzPvNqZNnnBBh4Y9c2y9ZwMo6fBpalL22xo3e9+vQ8Qzus
	3V47dCsRWE+XnzKhdDC5AUru1sFUCOWECoy/vCuw16X6T5Sxdg==
X-Google-Smtp-Source: AGHT+IEXxsiJEK8g0TGxdQ1mNIa1GlA/I2w249GnNy8k4Y+86wKVOJgDbjuFCc36B1YBNbmfuxoqk5Je3+a1G+QX/+k=
X-Received: by 2002:a17:907:a08b:b0:a28:d132:c4a9 with SMTP id
 hu11-20020a170907a08b00b00a28d132c4a9mr2795255ejc.17.1705316721876; Mon, 15
 Jan 2024 03:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-3-carlo.nonato@minervasys.tech> <5eb9fa24-c95e-4ea0-84ef-be74c629c106@xen.org>
 <CAG+AhRW5Xxy7BHVhmfkBqbdeKqRz7E1Mrc7wNv6F+ecM4P_QPw@mail.gmail.com>
 <CAG+AhRUw23a92v7geAwoDX-vqPLTPUEg3uoyOTThiUzL1CTk7w@mail.gmail.com> <c31bf4a3-979a-4445-905c-6a5545f8a36b@xen.org>
In-Reply-To: <c31bf4a3-979a-4445-905c-6a5545f8a36b@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 15 Jan 2024 12:05:11 +0100
Message-ID: <CAG+AhRUs_O5XKGTm+0x68PUGYHavdSC+tJ-F5jnyb=J-mLhG=Q@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] xen/arm: add cache coloring initialization
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Thu, Jan 11, 2024 at 11:44=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
> On 11/01/2024 10:17, Carlo Nonato wrote:
> > Hi Julien,
>
> Hi Carlo,
>
> >>>> +bool __init llc_coloring_init(void)
> >>>> +{
> >>>> +    if ( !llc_way_size && !(llc_way_size =3D get_llc_way_size()) )
> >>>> +    {
> >>>> +        printk(XENLOG_ERR
> >>>> +               "Probed LLC way size is 0 and no custom value provid=
ed\n");
> >>>> +        return false;
> >>>> +    }
> >>>> +
> >>>> +    /*
> >>>> +     * The maximum number of colors must be a power of 2 in order t=
o correctly
> >>>> +     * map them to bits of an address, so also the LLC way size mus=
t be so.
> >>>> +     */
> >>>> +    if ( llc_way_size & (llc_way_size - 1) )
> >>>> +    {
> >>>> +        printk(XENLOG_WARNING "LLC way size (%u) isn't a power of 2=
.\n",
> >>>> +               llc_way_size);
> >>>> +        llc_way_size =3D 1U << flsl(llc_way_size);
> >>>> +        printk(XENLOG_WARNING
> >>>> +               "Using %u instead. Performances will be suboptimal\n=
",
> >>>> +               llc_way_size);
> >>>> +    }
> >>>> +
> >>>> +    nr_colors =3D llc_way_size >> PAGE_SHIFT;
> >>>> +
> >>>> +    if ( nr_colors < 2 || nr_colors > CONFIG_NR_LLC_COLORS )
> >>>
> >>> I didn't find any documentation explaining why we need at least two
> >>> colors. I guess you want to make sure that there is a color for Xen a=
nd
> >>> domain. But I wonder what could wrong with just one color (other than
> >>> been pointless)?
> >>
> >> Yes, it would just be pointless. I'll change it to 1.
> >
> > Just wanted to correct myself here. Having just a single color introduc=
es a
> > clear sharing of the cache between Xen and domains. So it's not just
> > pointless, but also inefficient. I would discourage such a configuratio=
n, so I
> > plan to better describe this with a range in the Kconfig option (see
> > discussion in #1).
>
> I understand this could be inneficient. But you are also allowing the
> user to not specify the color configuration (at least for dom0less
> domain). So the colors would end up to shared with everyone (including Xe=
n).
>
> I don't particularly mind which way you want to go, but I think we need
> some coherency. If we want to avoid innefficiency, then we should
> prevent all the setups.

I definitely don't want to check for overlapping configurations since that
could also be a desired setup, but I do want sane defaults. You found some
inchoerency there cause Xen and the domains share one color. Maybe the best
solution would be to have a default configuration for domains that doesn't
overlap with the Xen one.

Back to the original point, having a single color for the whole platform is
just stupid, not only pointless. It defeats completely the coloring idea.
On the other hand the default configuration is something that could have an
application (still pretty "basic").

In patch #5 (dom0less) there is some contradiction where Xen panics when no
configuration is provided. I also misuderstood your comment on that patch
and it can't actually panic in that case, but instead use the default
configuration.

Thanks.

> Cheers,
>
> --
> Julien Grall

