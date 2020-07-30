Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F9233042
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 12:22:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k15hZ-0001V7-BF; Thu, 30 Jul 2020 10:22:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gz/s=BJ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k15hY-0001V2-Aa
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 10:22:16 +0000
X-Inumbo-ID: 89c7b4a6-d24e-11ea-8d2d-bc764e2007e4
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89c7b4a6-d24e-11ea-8d2d-bc764e2007e4;
 Thu, 30 Jul 2020 10:22:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r2so19276813wrs.8
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2020 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=GQCznpWXV7owUTyAWrYHY9kejsOcOU+xkozwwKynylo=;
 b=Ws3Non746GAlPBS+cBvXRTDCXlW+xM22M28ZVqbDeQNSUtzXVRL7R2SvYqRZ+qJUWR
 iseF341LGQG5gosdY/1Xcjq6PmOg6vyyevEEGOcRCnkhYS1TNtxZE/qaFEDJ/Bzi72ct
 rbhReMUrUsT/BXPUDIiCRqXgDsqgSpDRU/d6n0e10T7KmL8Bpx/wDjpccu54Fc7vsFpk
 Llak+8PFxx9pwREbpWrFHtk5sQXb8ZmxkFGfaj+danS2qLmclwtK3xPtOFqIaWE5PSaq
 scWx4HRaY/QGV7YRhbUcGStouvXu2oAyzSg6vo5tQzP7Xw4XcvbOJ+jABeKrXg3bwFnG
 bDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=GQCznpWXV7owUTyAWrYHY9kejsOcOU+xkozwwKynylo=;
 b=cfDLbR4wpdFAYUCgNwxtFj4Oxl6fX/Zx36yHJ1LXslXVCYnH4yCAr5nEsjYYiX5mnd
 8ZOGFHHc+uIRX3crmzoBJtN+ymJie3Yi+QO8a4dCHvYUevpFEGbf6d+qqE0Meh3+JDQ4
 3/cZm1HPjxJGkUuhzWnU3pkJsCGdiT8WU8RnwEWaVRlRT0HOIYtZte/9Wz86byJk/o5k
 jCGNF1WYJKBYRvrIEzVkMsxsn/RyjXams2PlorgKGFY8XdkcllbtyS81PRYtdkGBfKnY
 y+V00RJLXEu6TGiguxxzx3jZL9T2iCIkQmzIcE5p3KEsB+MtpIAjNWvfKjBZU7gmdE+Z
 0UEQ==
X-Gm-Message-State: AOAM530hj8rpGo/hkvgUjGCO5x2MT1jmdgYonAx6vPdD+LFMgrq5nV7D
 hR572Z0aRvo7uH5qK/swQus=
X-Google-Smtp-Source: ABdhPJxKgBghgtk5bx0Mwbv7J2HXc8IRyl5xpSYueNC79khDCeL22SJ6Q0YATeX32zwiquLWvZrrdg==
X-Received: by 2002:adf:9ec1:: with SMTP id b1mr33283408wrf.171.1596104534574; 
 Thu, 30 Jul 2020 03:22:14 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id c14sm8952610wrw.85.2020.07.30.03.22.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 03:22:13 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Jan Beulich'" <jbeulich@suse.com>
References: <20200727103136.53343-1-roger.pau@citrix.com>
 <ca6cd6a5-3221-4d34-08a0-8ea4b2dc92d0@suse.com>
 <20200730100801.GF7191@Air-de-Roger>
In-Reply-To: <20200730100801.GF7191@Air-de-Roger>
Subject: RE: [PATCH v3] print: introduce a format specifier for pci_sbdf_t
Date: Thu, 30 Jul 2020 11:17:01 +0100
Message-ID: <002e01d6665a$90f84d90$b2e8e8b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKdtgt63/bf5agZO9PNbWLjrxWJngIf8KDWAhHTObynb7rGsA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Julien Grall' <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 30 July 2020 11:08
> To: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; =
xen-devel@lists.xenproject.org; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; =
Julien Grall <julien@xen.org>;
> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; =
Paul Durrant <paul@xen.org>; Kevin
> Tian <kevin.tian@intel.com>; Julien Grall <julien.grall@arm.com>
> Subject: Re: [PATCH v3] print: introduce a format specifier for =
pci_sbdf_t
>=20
> On Wed, Jul 29, 2020 at 09:28:53PM +0200, Jan Beulich wrote:
> > On 27.07.2020 12:31, Roger Pau Monne wrote:
> > > The new format specifier is '%pp', and prints a pci_sbdf_t using =
the
> > > seg:bus:dev.func format. Replace all SBDFs printed using
> > > '%04x:%02x:%02x.%u' to use the new format specifier.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > > Acked-by: Julien Grall <julien.grall@arm.com>
> > > For just the pieces where Jan is the only maintainer:
> > > Acked-by: Jan Beulich <jbeulich@suse.com>
> [...]
> > In all reality, Roger, it looks to me as if you should have dropped
> > my ack, as there seems to be nothing left at this point that I'm
> > the only maintainer of.
>=20
> Yes, just realized that now, I'm sorry. Your Ack happened before Paul
> became a maintainer of vendor-independent IOMMU code and I completely
> forgot about it.
>=20
> I think the overall result of having a modifier for printing SBDFs is
> a win for everyone. TBH I just revived the patch because I think it
> will be helpful to the Arm folks doing the PCI work, if not I wouldn't
> have sent it again.

FWIW I am in favour of change.

  Paul

>=20
> Roger.


