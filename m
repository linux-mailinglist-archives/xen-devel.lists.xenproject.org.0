Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09DA81C769
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 10:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659284.1028820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGc0X-0001Bi-IM; Fri, 22 Dec 2023 09:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659284.1028820; Fri, 22 Dec 2023 09:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGc0X-000199-Fr; Fri, 22 Dec 2023 09:39:53 +0000
Received: by outflank-mailman (input) for mailman id 659284;
 Fri, 22 Dec 2023 09:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGc0W-000193-8M
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 09:39:52 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dd6d3db-a0ae-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 10:39:51 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ccabf5a4beso3701581fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 01:39:51 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a2e9bc3000000b002cc864632fdsm187065ljj.100.2023.12.22.01.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 01:39:50 -0800 (PST)
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
X-Inumbo-ID: 0dd6d3db-a0ae-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703237991; x=1703842791; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mdqQrZr0DFSnQK2TmK1w8gWdKT8TtOToXsTF3VFvIDA=;
        b=LhsM44gyildkP7UzGbGhKOj6LpWOk91Q8CWl/Vtsddm9Rsmm4a1a7Mb2rz6FErqU8x
         fJszbHiO/koXV8kikf1swD0bNSFLXuq40p2/hF8A8HKXcLcItBR2QOpfpt1GeF83oAMN
         zUlmUHlTVKQ/Wgs8qbU4wsdpE5Y0+lYADScsOD/IZ8keOReDHb2lRCax3frYxYOvf4KB
         jC2pAFKtuniyKQycq9fIxk5tihGeqHKt+dg7gDuv6oktCVdSc8p+p0p9seX3boEid2XL
         2wOoBi39igC4MbST3ojUNvFyEkeJevQXs+Y/R9DGBBTL2nOFC3KAeMzhosYoE7MFRb29
         ZM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703237991; x=1703842791;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mdqQrZr0DFSnQK2TmK1w8gWdKT8TtOToXsTF3VFvIDA=;
        b=Q1WvD6U1tIyLlkJomgKiOyuZ93IpvQb4SHaMW3dni0pZn/zy/J9+CXsaYyJ+WvR1i4
         ELPIepUlrnQf1MmrmvSuy7e4x3mWH9JxcuVqc6OjboPlPA8icVfTgW/13d8+G0TNLm6R
         TGqtCc8xmxIFrJ5Q70Ds4DjjCM8EgleFzwXpUcXNpZIpHqnyVeTXKFg6klRw1uuCqCfz
         cWbS42ydK66k4sLZKuDeQMF8HyAW5/HOQPZNHckgkfyGVfbix5dTbue2gDgZYjPQ/4b8
         GAYkQJVLTnzn7VoEF7qScVWvGen2VIaFzcueMK54kiwocd0iumo5GdtwWUneC+zIhooj
         lwRw==
X-Gm-Message-State: AOJu0YwUkWQyjN2NL8oTpTK2x5NVIJdYpnQGFT6rZF2YcANyirVOc74O
	0dTaTk7RFzpoYBoTprB+MPc=
X-Google-Smtp-Source: AGHT+IHtWPuLCXfIny787qvk3Fn0KUSoLLkjV2SmVb3X7j+e7uiRk98I3xfV5TTkPb2HMZoRC/xGig==
X-Received: by 2002:a2e:9a94:0:b0:2cc:7990:b3a3 with SMTP id p20-20020a2e9a94000000b002cc7990b3a3mr236809lji.17.1703237990494;
        Fri, 22 Dec 2023 01:39:50 -0800 (PST)
Message-ID: <fb627eae0deb85569d3c3044154f1588e9202ec9.camel@gmail.com>
Subject: Re: [PATCH] move __read_mostly to xen/cache.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
  Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger
 Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>,  Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>,  "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Date: Fri, 22 Dec 2023 11:39:49 +0200
In-Reply-To: <893a5ebf-54e2-f2b2-1365-2a6d36ed3a39@suse.com>
References: <f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com>
	 <b49777c7-c677-826f-01da-c6b5b67f5b85@citrix.com>
	 <893a5ebf-54e2-f2b2-1365-2a6d36ed3a39@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2023-08-08 at 12:32 +0200, Jan Beulich wrote:
> On 08.08.2023 12:18, Andrew Cooper wrote:
> > On 08/08/2023 10:46 am, Jan Beulich wrote:
> > > There's no need for every arch to define its own identical copy.
> > > If down
> > > the road an arch needs to customize it, we can add #ifndef around
> > > the
> > > common #define.
> > >=20
> > > To be on the safe side build-breakage-wise, change a couple of
> > > #include
> > > <asm/cache.h> to the xen/ equivalent.
> > >=20
> > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >=20
> > Could we find a better place to put this?
> >=20
> > __read_mostly is just a section.=C2=A0 It's relationship to the cache i=
s
> > only
> > microarchitectural, and is not the same kind of information as the
> > rest
> > of cache.h
> >=20
> > __ro_after_init is only here because __read_mostly is here, but has
> > absolutely nothing to do with caches whatsoever.
> >=20
> > If we're cleaning them up, they ought to live elsewhere.
>=20
> I would be considering init.h (for having most other __section()
> uses,
> and for also needing __read_mostly), but that's not a great place to
> put these either. In fact I see less connection there than for
> cache.h.
> So the primary need is a good suggestion (I'm hesitant to suggest to
> introduce section.h just for this).
Andrew sent some suggestions here:
https://lore.kernel.org/xen-devel/3df1dad8-3476-458f-9022-160e0af57d39@citr=
ix.com/

Will that work for you?

>  In the absence of this, can we
> perhaps deal with this in a 2nd step, thus not blocking this patch
> and
> therefore not needing to then also clean up PPC-specific code?

~ Oleksii

