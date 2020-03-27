Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BAB1953B3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 10:18:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHl2R-0006I4-1l; Fri, 27 Mar 2020 09:12:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1/Y8=5M=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jHl2Q-0006Hy-77
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 09:12:26 +0000
X-Inumbo-ID: 12c44eaa-700b-11ea-bec1-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12c44eaa-700b-11ea-bec1-bc764e2007e4;
 Fri, 27 Mar 2020 09:12:25 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g62so11504303wme.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2020 02:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=e5hxRwcrbIRsmZ2SceVLFa5xfjfNq7+xOuIr3aaA/9M=;
 b=ScrtgswJxta2vbF0YRVFofbureDSb1jdc4iXNQiEVwxjXNaj/QU+MW8wkiQ15HZgoF
 xeQ7Kj5Q4bdgR+0VWZK2yqpQ8OVNWUbszgGjI77TAgfLSB3Jtj7xefwHXOO1+dUBhOS/
 afnTpMkMiRIWiOYzEZT4vnjDlkDDC6jIsp6hlCpcs6jrinqiwOib6OEfgsskH/kGt4uT
 i0bp3Y/X61dKELxiNOZhtulP7XOW9asOnVGf9SdWK8z7Nl5hFlq650wKv/33gdaTEpgV
 zQo7BXoiNs6tlyfpoGLOUmgbUrOq+n/5QBuyZNu6AZz0dho6TOM3ueB3zlXv760N6px0
 +snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=e5hxRwcrbIRsmZ2SceVLFa5xfjfNq7+xOuIr3aaA/9M=;
 b=EF7psruU++C90q3YiT/yg72UUKF7izL6SO9ug44YKoPgY95AIY1/SbSjrvNGwqaUQv
 9DTfOOX6ATQ2CItIzPp8bhEfk/JHiFc5jK79KuxyHopZjmVHlo37vWsBMm2aw8ASTB93
 3e+uuYgPHzz1avrl1tRe4PIO2akeCIoHNru9nJ71DqpXnozOj5TwZ8MxVGiuYTRzpfIL
 B+B+XHqXXKlkHrVQHqweSKbT1IUUZuYc9vysF7NZejc7C/MtQZQ1pWp+rI7sCe4ws/Co
 7BAydQ9Wp5hQXCXJCf/BKHJ2gYZtNMUfZAzMoy45Zb4J48CFz+2dJaXQxfJaDq+UiqlN
 svZg==
X-Gm-Message-State: ANhLgQ1wrVSeKo6p8kifzsFXDmc24S5Dqbc5BsbpLrVevVI8biz2PDZY
 el86avX5OGRKRaqONzHDhrc=
X-Google-Smtp-Source: ADFU+vtBlZKkX46lxjuRU/A1icUusfc7Q/BaQMkCVnApy87ac5k6H6o1MI87cHtkrDK4Qg/H5y4v8A==
X-Received: by 2002:a1c:de82:: with SMTP id v124mr4292285wmg.70.1585300344415; 
 Fri, 27 Mar 2020 02:12:24 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id h132sm7680795wmf.18.2020.03.27.02.12.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Mar 2020 02:12:23 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roman Shaposhnik'" <roman@zededa.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
References: <CAMmSBy861_4VXrpC1S0LU8M7ut3ZWErtjqT2vvx8nqnHkrXmYQ@mail.gmail.com>
 <20200325110533.GC28601@Air-de-Roger>
 <CAMmSBy_oX34t5388xYUxUE_jE56bpy=wKAfujZvR1-zaehDs3g@mail.gmail.com>
In-Reply-To: <CAMmSBy_oX34t5388xYUxUE_jE56bpy=wKAfujZvR1-zaehDs3g@mail.gmail.com>
Date: Fri, 27 Mar 2020 09:12:11 -0000
Message-ID: <000c01d60417$d3cacad0$7b606070$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQK7WN7tejeTPbW4bJ1HX/TusTaP5QFaAdeOAdPXZCSmeA4FMA==
Subject: Re: [Xen-devel] PCIe IOMMU ACS support
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Kevin Tian' <kevin.tian@intel.com>,
 'Jan Beulich' <jbeulich@suse.com>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roman Shaposhnik <roman@zededa.com>
> Sent: 26 March 2020 22:03
> To: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Cc: xen-devel@lists.xenproject.org; Jan Beulich <jbeulich@suse.com>; =
Paul Durrant <paul@xen.org>;
> Kevin Tian <kevin.tian@intel.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>
> Subject: Re: [Xen-devel] PCIe IOMMU ACS support
>=20
> On Wed, Mar 25, 2020 at 4:05 AM Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com> wrote:
> >
> > Adding the PCI and IOMMU maintainers.
> >
> > On Mon, Mar 23, 2020 at 01:55:01PM -0700, Roman Shaposhnik wrote:
> > > Hi!
> > >
> > > I was going through how Xen support PCIe IOMMU ACS and
> > > all I could find is this:
> > >     =
https://github.com/xen-project/xen/blob/master/xen/drivers/passthrough/pc=
i.c#L608
> > > which looks to me as an attempt of enabling ACS opportunistically,
> > > but still proceeding forward even if it fails.
> >
> > That's correct AFAICT. Xen will try to enable some features, but =
will
> > proceed normally if ACS is not available, or if some of the features
> > are not implemented.
> >
> > Are you looking to ensure that all devices on the system have a
> > certain feature enabled?
>=20
> My primary objective was to get some visibility into how Xen would
> prevent two PCIe devices behind a common bridge from doing p2p
> transactions (thus violating VM boundaries if those devices are
> assigned to different domains).
>=20
> It looks like Xen simply trusts the hardware.
>=20
> > Can you provide some more details about what you expect of ACS
> > handling?
>=20
> I was actually surprised not to see IOMMU groups in the style of what
> VFIO https://www.kernel.org/doc/Documentation/vfio.txt
>=20

I did write a doc some time ago to present the issues facing Xen w.r.t. =
IOMMU and device pass-through. Hopefully you can see it at =
https://docs.google.com/document/d/12-z6JD41J_oNrCg_c0yAxGWg5ADBQ8_bSiP_N=
H6Hqwo/edit?usp=3Dsharing

  Paul


