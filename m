Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64204F17DB
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 17:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298395.508320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOEj-0004K5-4V; Mon, 04 Apr 2022 15:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298395.508320; Mon, 04 Apr 2022 15:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOEj-0004HT-1W; Mon, 04 Apr 2022 15:03:21 +0000
Received: by outflank-mailman (input) for mailman id 298395;
 Mon, 04 Apr 2022 15:03:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEUQ=UO=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nbOEi-0004HN-4h
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 15:03:20 +0000
Received: from MTA-09-3.privateemail.com (mta-09-3.privateemail.com
 [68.65.122.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bf0160b-b428-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 17:03:18 +0200 (CEST)
Received: from mta-09.privateemail.com (localhost [127.0.0.1])
 by mta-09.privateemail.com (Postfix) with ESMTP id E40B118000B3
 for <xen-devel@lists.xenproject.org>; Mon,  4 Apr 2022 11:03:16 -0400 (EDT)
Received: from mail-ot1-f52.google.com (unknown [10.20.151.174])
 by mta-09.privateemail.com (Postfix) with ESMTPA id BEBE818000AC
 for <xen-devel@lists.xenproject.org>; Mon,  4 Apr 2022 11:03:16 -0400 (EDT)
Received: by mail-ot1-f52.google.com with SMTP id
 x8-20020a9d6288000000b005b22c373759so7409962otk.8
 for <xen-devel@lists.xenproject.org>; Mon, 04 Apr 2022 08:03:16 -0700 (PDT)
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
X-Inumbo-ID: 5bf0160b-b428-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1649084596;
	bh=3rv4X8v+VGFIEOQfPKafCqAi6l5xacN9nmqLtCCxR9w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QPD4eGBrqiawNky3ZzP0C7VYDrGdcMs9/T3CjHvlN2VPqQgBvlHe7G95ZuHcyJnJ5
	 HpMzAbDTzEU1Tg7nnKCI16soBxCqndLsIb/pQykSxrwzB0QASL576iztt8gLynNouJ
	 H5GC/2/exK07qOjA4oxk0bbot/9G/tRmPJ40GQ4+7agUJbRUVGCuU4htbFPRxRC2yE
	 Q/z8dyerOKh3rgvlyj1DsP8oeB+uIdWziwuqSVvhcmsFj37gRGoJHY2CjCD8lAU8Xn
	 0J27Nleu9tDgaWmPbSTYgfiCRV1oy9mW6K/u8PkV9W0fjpKwT5an2OuClr5Ag6CYDD
	 oiHZB5F27ld/g==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1649084596;
	bh=3rv4X8v+VGFIEOQfPKafCqAi6l5xacN9nmqLtCCxR9w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QPD4eGBrqiawNky3ZzP0C7VYDrGdcMs9/T3CjHvlN2VPqQgBvlHe7G95ZuHcyJnJ5
	 HpMzAbDTzEU1Tg7nnKCI16soBxCqndLsIb/pQykSxrwzB0QASL576iztt8gLynNouJ
	 H5GC/2/exK07qOjA4oxk0bbot/9G/tRmPJ40GQ4+7agUJbRUVGCuU4htbFPRxRC2yE
	 Q/z8dyerOKh3rgvlyj1DsP8oeB+uIdWziwuqSVvhcmsFj37gRGoJHY2CjCD8lAU8Xn
	 0J27Nleu9tDgaWmPbSTYgfiCRV1oy9mW6K/u8PkV9W0fjpKwT5an2OuClr5Ag6CYDD
	 oiHZB5F27ld/g==
X-Gm-Message-State: AOAM533VxnaXFVp8YYR644Xf1wxazW9VYCnXdCziYE9olQpRFRhgAS7W
	4lomn3x1HRzbKR4hCeApb02p1UwiDHi4VOWYLVU=
X-Google-Smtp-Source: ABdhPJyS+YTZKechuqmsDoNGN6OV4rFSQOCJbOiyL8/JF+o8Gw+ww72Zs9vqALKC7L8WiPCmE2GgHNBTSyEl7la4T4U=
X-Received: by 2002:a9d:638a:0:b0:5cd:a7fc:aa89 with SMTP id
 w10-20020a9d638a000000b005cda7fcaa89mr208281otk.204.1649084596279; Mon, 04
 Apr 2022 08:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
 <10b1b71d918b7d7315b49b5932497d094f767a1e.1648561546.git.tamas.lengyel@intel.com>
 <259a550c-9657-d0d2-d58b-c7c7914fa25a@suse.com>
In-Reply-To: <259a550c-9657-d0d2-d58b-c7c7914fa25a@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 4 Apr 2022 11:02:40 -0400
X-Gmail-Original-Message-ID: <CABfawhnwA1fx+S+TO+KZE5-Fh5nOUsXyt7Km0nmDAAgF-CmXEQ@mail.gmail.com>
Message-ID: <CABfawhnwA1fx+S+TO+KZE5-Fh5nOUsXyt7Km0nmDAAgF-CmXEQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] x86/mem_sharing: add fork_complete field to mem_sharing_domain
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Mar 29, 2022 at 11:51 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 29.03.2022 16:03, Tamas K Lengyel wrote:
> > The fork's physmap should only be populated with select special pages during
> > the setup of the fork. The rest of the fork's physmap should only be populated
> > as needed after the fork is complete. Add a field to specify when the fork is
> > complete so fork_page() can determine whether it's time to start adding entries
> > to the physmap.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks! After further consideration I'll drop this and the empty_p2m
patch from the series as there is a corner-case with PAE-mode guests
which doesn't play nice with enforcing a start with an empty p2m.
Working around that issue leads to a cascading changeset which
ultimately isn't a worthwhile effort.

Tamas

