Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B8126DCE0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 15:33:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIu2J-0007no-K8; Thu, 17 Sep 2020 13:33:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t+a8=C2=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kIu2I-0007ni-4P
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 13:33:18 +0000
X-Inumbo-ID: e0187f6b-7337-40d1-9ee7-d7fe929d860f
Received: from mail-40131.protonmail.ch (unknown [185.70.40.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0187f6b-7337-40d1-9ee7-d7fe929d860f;
 Thu, 17 Sep 2020 13:33:14 +0000 (UTC)
Date: Thu, 17 Sep 2020 13:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600349593;
 bh=1YhBO7cl11LUPtWGEC7nSSMptlNvKB6XXY1hEaMLeiQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=lIPuenDNPD+WT3MOGAlgr0uhH7l0o0OxjbCF9267eiOwdqYMOnqWH6pxjO2r5I0rY
 qCTkxQ8MhHR9Lacw8F4YlRlDKqynKo2xomp3uLqybFZieh2nRhXebpLyRrdsVmg2eQ
 oe7/G1//p6JszBd4NAG/XMPgoqFQAJje1E5HGG0s=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v4 3/4] efi: Enable booting unified
 hypervisor/kernel/initrd images
Message-ID: <6Vz2rQJvGRtW6Uinda3l_V45Sor337x8uIkVphhgLRUkZSQz33lOJn-qkqwyUhtO-8ZWS28kdVrgIduNAq5Fkv0JPGbJf6_MTvlGAGRYm_s=@trmm.net>
In-Reply-To: <f77dk3H4FvbqMm9PBWKLDGxWMhJA8Hb9ClafHpPOzZZ5kYgUBVHaa4nUi_m2FY74cS8pV9m6tBy50oWG5TD2u0R-nVIh6S7lqDqjX21ZeEc=@trmm.net>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-4-hudson@trmm.net>
 <bce3b96d-8e40-0f46-81a8-1cffb464dbd6@suse.com>
 <f77dk3H4FvbqMm9PBWKLDGxWMhJA8Hb9ClafHpPOzZZ5kYgUBVHaa4nUi_m2FY74cS8pV9m6tBy50oWG5TD2u0R-nVIh6S7lqDqjX21ZeEc=@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thursday, September 17, 2020 9:04 AM, Trammell Hudson <hudson@trmm.net> =
wrote:
> On Thursday, September 17, 2020 8:33 AM, Jan Beulich jbeulich@suse.com wr=
ote:
> > [...]
> > > -   if ( read_section(image, ".ucode", &ucode, NULL) )
> > > -            return;
> > >
> > > -   name.s =3D get_value(&cfg, section, "ucode");
> >
> > With the Arm change already in mind and with further similar
> > changes further down, may I suggest to consider passing
> > 'section' into read_section(), thus guaranteeing consistent
> > naming between image section and config file items, not only now
> > but also going forward? read_section() would then check for the
> > leading dot followed by the specified name.
>
> That could work, I think. Let me test it out for v5.

Or maybe not. section is the "section-name" of the config file
that is being booted:

[global]
default=3Dsection-name

Meanwhile, read_section() wants the PE section name, like ".ucode", which m=
ight appear as a line item in that section.

--
Trammell

