Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEBB19DB3A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 18:16:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKOzn-00085g-Ik; Fri, 03 Apr 2020 16:16:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DmfO=5T=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jKOzm-00085b-8N
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 16:16:38 +0000
X-Inumbo-ID: 7e525c14-75c6-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e525c14-75c6-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 16:16:37 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id de14so9900617edb.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2020 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=JXnAs7PB0D0XSzaENfgTFNKheDadagnj92ewXtvYShs=;
 b=cftuOYhNNXPnOze2+N+4ekrHOOqIpMdDsmBrNQFgF3R5ypr48DRQe+zy3sxljp1XlE
 0Z3XZYLx59YjRDssTaKtGipNnVuSzfbSq7rtGhXWw5oOsydI5nR0jCHpUG7Whx6aQSgM
 2lYfoa4q02a8DSG4KDxrsqHcxt6CqEegD1EqwpkR1Zw1VZ++jOfV4d274QwowoQRCAdc
 NFkkRNw/f1cxnPv+aIS7KUDRHqeTgoYjOqSXOUVz+pi9FCLCZEt/5mdAeUUVw4ORBb6g
 /xRJFTuoOxIuwqzgDzLjarP/aY9/JSjLqm2XZ/IAT80t6eVQwFCrlQk3+vwqWpCflRI7
 NpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=JXnAs7PB0D0XSzaENfgTFNKheDadagnj92ewXtvYShs=;
 b=l0pRWxvrLCS2vBAwF0BtpD8EC0pcf/0MoQBSP4+bgcTumSMF+FhMH3AKMJZuSLsd0u
 jdgUBW9Wpi36DfZaLz9osXJdse0tNnNNAo/+1mxTen/lpSZ2HjW6eXafag0/KeiklgZS
 WrUdfO0eRUYIRrLyNetOZ55MKWHADJ81JGWTJdN2mF1g/x+iHgFxM4iUrb6nOMpEP72/
 2umJon80mr6ZhkvfwVJSIaKXHMSDJHp7F27QvqBxytQhuY9aC24ZHmaAkJXYueTGzqiP
 TITvedzIZaQGESpRgSRIyrthXda5B/+h9uaFz3RIQ56LgK9AA0LyK6JzKPTiZx4xwhqe
 wFIg==
X-Gm-Message-State: AGi0PuYxgxb3G96yAUfsCSNOnAQpAJ32R7CO+GAQpexAeGSuXOTWfL5J
 TfqY6Ux7HWBVuBKy7rPMoWY=
X-Google-Smtp-Source: APiQypLgI2LG046VwBNjr2fdyMYsh/9PLXJo0Uhy1WG8oFeeZF+nz+Vqu9XX9gIdkbyKJ1kLz6aBNg==
X-Received: by 2002:a17:906:405b:: with SMTP id
 y27mr9350959ejj.213.1585930596742; 
 Fri, 03 Apr 2020 09:16:36 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id j9sm1474523edl.67.2020.04.03.09.16.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 09:16:36 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
 "'Jan Beulich'" <jbeulich@suse.com>
References: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
 <66ee36a9-b525-50d4-17e8-8a10f6afd55f@suse.com>
 <0faaee38-e314-24a8-b97d-9f000251a63e@citrix.com>
 <9cba6eda-2c7c-9700-a484-c72100b8268f@citrix.com>
 <050e4847-df42-6e16-3707-19fadbae9229@suse.com>
 <c4b676a9-58ce-ae11-e13b-aae41b6c27b1@citrix.com>
 <24e20e5d-c661-3f40-ceb0-e0c6f0a753b2@suse.com>
 <7827d387-90be-a538-a41c-af104a7b2dd3@citrix.com>
In-Reply-To: <7827d387-90be-a538-a41c-af104a7b2dd3@citrix.com>
Subject: RE: [PATCH] hvmloader: probe memory below 4G before allocation for
 OVMF
Date: Fri, 3 Apr 2020 17:16:34 +0100
Message-ID: <002401d609d3$3f6b62c0$be422840$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG43QgZrYFtbI4DTXRTLQ+qV9/XEwI0/7ePAeAaX+8BZMC3uwEJJlr6Aj+gMhMCf4lRzQIXFG6lqDch/gA=
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, ian.jackson@eu.citrix.com,
 xen-devel@lists.xenproject.org, wl@xen.org, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Igor Druzhinin
> Sent: 03 April 2020 16:36
> To: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; roger.pau@citrix.com; =
ian.jackson@eu.citrix.com;
> wl@xen.org; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH] hvmloader: probe memory below 4G before =
allocation for OVMF
>=20
> On 03/04/2020 16:28, Jan Beulich wrote:
> > On 03.04.2020 17:17, Igor Druzhinin wrote:
> >> On 03/04/2020 16:05, Jan Beulich wrote:
> >>> On 03.04.2020 16:47, Igor Druzhinin wrote:
> >>>> There multiple technical complications that caused this mess.
> >>>> One of them is that there is no unfortunately a better place for =
the
> >>>> framebuffer to be located initially. Second, SR-IOV device
> >>>> is real and adding a virtual BAR to it is also complicated (due =
to
> >>>> compatibility reasons) and NVIDIA decided to avoid that.
> >>>
> >>> In which case I wonder - aren't you ending up with the MMIO case
> >>> that I had mentioned, and that you said is difficult to deal with?
> >>
> >> No, it's VRAM area (normal RAM pages) - not MMIO.
> >
> > Well, VRAM is still MMIO from the CPU's perspective, just without
> > any side effects. But if it was another device that was passed
> > through, couldn't its MMIO similarly end up in that area?
>=20
> As Andrew said, Xen VRAM is just normal RAM. It's originally
> populated in this area for the lack of a better place (at least now).
> It's special and has nothing to do with the device passed through
> using conventional PCI mechanisms which BARs will only occupy MMIO =
hole.
>=20

I assume Jan's point is that the guest doesn't access it as if it is =
normal RAM. It's only accessed directly if it is present in a PCI BAR, =
otherwise it is accessed indirectly (via QEMU) in response to accesses =
to the VGA aperture.

  Paul



