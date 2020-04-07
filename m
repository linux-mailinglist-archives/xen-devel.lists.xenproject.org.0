Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FA81A0864
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 09:34:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLijx-0006Tn-3L; Tue, 07 Apr 2020 07:33:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xamf=5X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jLijv-0006Ti-L5
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 07:33:43 +0000
X-Inumbo-ID: 1b1a579e-78a2-11ea-83d8-bc764e2007e4
Received: from mail-ed1-x52a.google.com (unknown [2a00:1450:4864:20::52a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b1a579e-78a2-11ea-83d8-bc764e2007e4;
 Tue, 07 Apr 2020 07:33:42 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id cf14so2740037edb.13
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2020 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Ftxk7s3a+m4QXLU226g63n99y4nDxX2y/xQ5q86Zf+Q=;
 b=mgjeBAs+a8483OGUVMKYrNbTRRc+cNx8/Vc6rIl6d1uTj5tPuyDD4CMTUIbTJhkO8u
 BIL2brLZTBHQ+9TTRRilOBAGaZbFpEipUyAfVc+NdTfdG770IwOAdqOWMrUxkTlEIbok
 9a3WlWbNOXnlh+vjLjBZP5qDLAYy0LjAT37dUZxAKSR5n1E7N4vFOpGO1oYmO5rl7K4T
 APfA0ebb51kEHUDEKRkFF5+wM4F5/t9Rib+1sdpeUNvPMTTl8eHp8a8M+NiGUYT1J+FX
 AL78IfbGg05h4A1/uDdv5HOpEttuozsxyesUq8VgzVjAGSIAHYd54tBOTiCI4sATglzw
 MaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Ftxk7s3a+m4QXLU226g63n99y4nDxX2y/xQ5q86Zf+Q=;
 b=uLoD8wEF/3jXuwxTBipAAU/58mwBCmxxHblgzLZhibimluIge9xcb2dEeD8WsPZcvd
 7Pn/KGLJblt8ku20g2XOhim+truG+iFhBo75PzYef0+kPbrz2Yoo/kUWDwcctwBC6jvJ
 PbtFVSIEElTyBTWewpI1GiL3IPqxAnhRWYPQULGTumhBIkJPallmFl6CPjCwyytLsCmB
 vjJhOM2/5vJstEcCOzIk6qgL1BDMR82nbawL9FF2glsUMcw/QwfHFiXWCcJvwxoEb7f1
 4eVdWk5eaONereLBkbdubnOn7zweCqlAQwxoYyBEEEQ6GF1lHtuJkTXTjDnwt6IbWc2j
 T1TA==
X-Gm-Message-State: AGi0Puaw13jEMGcJhw3sr3ZO6uRaPEAqHLN/Ym6CHpP/ahVE9eDecLYO
 tZS0y8B2bSPrJ8Rjyqtxj18=
X-Google-Smtp-Source: APiQypKfF8gpIMMiSXi0BSTTFpOoM7jQgJCCELmtJSXQkhYBpMG07SbBAd/Y+QNg0TacopBudKhM4w==
X-Received: by 2002:a17:907:2143:: with SMTP id
 rk3mr771035ejb.50.1586244821862; 
 Tue, 07 Apr 2020 00:33:41 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.188])
 by smtp.gmail.com with ESMTPSA id o27sm1769336ejc.23.2020.04.07.00.33.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 00:33:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Harsha Shamsundara Havanur'" <havanur@amazon.com>,
 <xen-devel@lists.xenproject.org>
References: <f7b9e16e394e7e94700ed690f0c9fbd7ce7b5c74.1586195196.git.havanur@amazon.com>
 <6a112896-9d22-eca1-f406-7bfa3f047b40@citrix.com>
In-Reply-To: <6a112896-9d22-eca1-f406-7bfa3f047b40@citrix.com>
Subject: RE: [XEN PATCH] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Date: Tue, 7 Apr 2020 08:33:39 +0100
Message-ID: <001301d60cae$dc3e94e0$94bbbea0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLv5qvTmuvbc0jpqBdZKffFHl7s5gFvtzJgpi4QzNA=
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
Cc: 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Jan Beulich' <jbeulich@suse.com>, 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Andrew Cooper
> Sent: 06 April 2020 19:07
> To: Harsha Shamsundara Havanur <havanur@amazon.com>; =
xen-devel@lists.xenproject.org
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; Jan =
Beulich <jbeulich@suse.com>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Subject: Re: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after =
all resource allocation
>=20
> On 06/04/2020 18:46, Harsha Shamsundara Havanur wrote:
> > It was observed that PCI MMIO and/or IO BARs were programmed with
> > BUS master, memory and I/O decodes (bits 0,1 and 2 of PCI COMMAND
> > register) enabled, during PCI setup phase. This resulted in
> > spurious and premature bus transactions as soon as the lower bar of
> > the 64 bit bar is programmed. It is highly recommended that BARs be
> > programmed whilst decode bits are cleared to avoid spurious bus
> > transactions.
>=20
> What kinds of spurious transactions?
>=20
> Keeping memory and I/O decoding disabled until the BARs are set up is =
a
> no-brainer, but busmastering is a more complicated subject.  =
Therefore,
> it would be helpful to know exactly what you've seen in the way of
> spurious transactions.
>=20

I think you know of some GPU h/w that doesn't necessarily stop DMAing =
after an FLR. There is no reason why hvmloader, or anything else until =
the function driver loads, needs BME to be on. As you say mem and io =
decodes are no-brainers, yet without this patch hvmloader enables them =
after the first BAR on the device is programmed, thus causing much fun =
for device models when the subsequent BARs are programmed.

> >
> > This patch address the issue by deferring enablement of memory and
> > I/O decode in command register until all the resources, like =
interrupts
> > I/O and/or MMIO BARs for all the PCI device functions are =
programmed.
> > PCI bus memory and I/O space is enabled in command register after
> > all the resources like interrupts, I/O and/or MMIO BARs are
> > programmed for all valid device functions. PCI BUS MASTER is kept
> > disabled in the bootloader as this needs to be enabled by the guest
> > OS driver once it initializes and takes control of the device.
>=20
> Has this been tested with an Intel integrated graphics card?  These =
have
> a habit of hitting a platform reset line if busmaster is ever =
disabled.
>=20

No, we don't have suitable h/w for that AFAIK. If that is the case then =
we ought to quirk it.

> A lot of this will depend on what Qemu does behind the scenes, and
> whether disabling busmastering gets reflected in the real device.
>=20

When I last looked at upstream QEMU modifications to the BME bit were =
echoed through.

> >
> > Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>
> > Ack-by: Paul Durrant <pdurrant@amazon.com>
>=20
> Acked-by

This was a little premature as I have not yet looked at the re-based =
code.

  Paul

>=20
> ~Andrew



