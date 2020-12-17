Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22872DCDA1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 09:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55758.97163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpoey-0008Hu-SM; Thu, 17 Dec 2020 08:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55758.97163; Thu, 17 Dec 2020 08:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpoey-0008HV-P0; Thu, 17 Dec 2020 08:29:16 +0000
Received: by outflank-mailman (input) for mailman id 55758;
 Thu, 17 Dec 2020 08:29:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epRl=FV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kpoex-0008HQ-0w
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 08:29:15 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fcaa918-b833-40fc-b20a-da12d6ffdeb8;
 Thu, 17 Dec 2020 08:29:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d13so7414602wrc.13
 for <xen-devel@lists.xenproject.org>; Thu, 17 Dec 2020 00:29:13 -0800 (PST)
Received: from CBGR90WXYV0 (host86-166-98-87.range86-166.btcentralplus.com.
 [86.166.98.87])
 by smtp.gmail.com with ESMTPSA id j10sm7635096wmj.7.2020.12.17.00.29.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 00:29:12 -0800 (PST)
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
X-Inumbo-ID: 8fcaa918-b833-40fc-b20a-da12d6ffdeb8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=dFnmyhGK1dH5Ahx0r85mEoGTGW27Pstio+R/BsNOdTA=;
        b=aZ/qoCfZV0LMz++7ECSwQtJUU8Miw/ruL0JnjbNB8tBSjYS1ls707Y3IsQwf4K2zmF
         2655pl2jyCTnO6rUM0egIYwvqREoCB14OdYT8N1+XfwrSDOwOVJP+EtbXT447jBmVu9n
         Fo1qXoJlLYHezYMdyzh4KzzmCU2d5HONFikwXC3adIu5rVwSaHmNJFLrdi8cOMgMLhFd
         Sjy/TG55TTvqcdOxXn283ShZlI8e4Qexp1xDv9X78OzlQlyI79iro9cEiAbfKTJ08zo3
         18aWJ9wK6oGQHbAkuaVfGrtAo4yqmvmTX3PW2DMmQTJ2/csdndO9LPD+eNk0FKxn4btF
         s1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=dFnmyhGK1dH5Ahx0r85mEoGTGW27Pstio+R/BsNOdTA=;
        b=UEXeyEZXxuMLd6mbsPTZEoSw6bPOFmeifuj/xG+0pJlbIPwZVm1ZpfBSPKoF61bwZU
         IaB1l/kd/O79NpHCxNZNfm1c987DrMP/IUDR9vwpO6fHEI5LsK1hVyvzQPM/1yZaNQlT
         0acDq3CTx9kFmQhRCz/C5ziTm3AQcmTu4bVJ0PHcoUmWVEOs9+gnu/0/r9MnCCj+nyAm
         siUDyV8eKJOX7w7ggc2aYiq5UFQ3pJc2TfoMX6j0YAZJ9wU7tq/sZgnHxGV+k7Glh/uH
         +D1ViYGL3i9mKDcOhcOAm9wYnP5UrtKHvrylPo1DXJGVZyln3NBVEqGhHfgdiNAEyEFX
         75xg==
X-Gm-Message-State: AOAM533Ak8L9EOOM9ODAzBuauiEpUoP3WemIDXF5UpvGJvxNB1YEoGRj
	0IX8gf+c6N3o91+JlAHLN6k=
X-Google-Smtp-Source: ABdhPJym0YR7aMw1m/PlO08/3rZHiOFM5+cmmAfmRNzZpwKsQjO1c8GpGE9U20oM56Ha421hkcCiNQ==
X-Received: by 2002:a05:6000:5:: with SMTP id h5mr42339710wrx.153.1608193752888;
        Thu, 17 Dec 2020 00:29:12 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>
Cc: "'osstest service owner'" <osstest-admin@xenproject.org>,
	<xen-devel@lists.xenproject.org>
References: <E1kpMXk-0006zb-Jk@osstest.test-lab.xenproject.org> <19ed8894-23f7-0f9d-f3c4-1d5ea5bc0c02@citrix.com> <20201216104357.wcggzckdii76d4iz@liuwe-devbox-debian-v2>
In-Reply-To: <20201216104357.wcggzckdii76d4iz@liuwe-devbox-debian-v2>
Subject: RE: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Date: Thu, 17 Dec 2020 08:29:12 -0000
Message-ID: <00e501d6d44e$b2fa6420$18ef2c60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLfRoVMfz30YRXb6SCWrJ23es5KvwIrMUEmAlwjqk2nxdTfgA==

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 16 December 2020 10:44
> To: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant =
<paul@xen.org>
> Cc: osstest service owner <osstest-admin@xenproject.org>; =
xen-devel@lists.xenproject.org; Paul Durrant
> <paul@xen.org>; Wei Liu <wl@xen.org>
> Subject: Re: [xen-unstable-smoke bisection] complete =
build-amd64-libvirt
>=20
> Paul, are you able to cook up a patch today? If not I will revert the
> offending patch(es).
>=20

Sorry I was otherwise occupied yesterday. It's not so simple to avoid =
the API change the way things are in the series... it will
take a reasonable amount of re-factoring to avoid it. I'll re-base and =
fix it.

  Paul

> Wei.
>=20
> On Wed, Dec 16, 2020 at 10:17:29AM +0000, Andrew Cooper wrote:
> > On 16/12/2020 02:27, osstest service owner wrote:
> > > branch xen-unstable-smoke
> > > xenbranch xen-unstable-smoke
> > > job build-amd64-libvirt
> > > testid libvirt-build
> > >
> > > Tree: libvirt git://xenbits.xen.org/libvirt.git
> > > Tree: libvirt_keycodemapdb =
https://gitlab.com/keycodemap/keycodemapdb.git
> > > Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> > > Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> > > Tree: xen git://xenbits.xen.org/xen.git
> > >
> > > *** Found and reproduced problem changeset ***
> > >
> > >   Bug is in tree:  xen git://xenbits.xen.org/xen.git
> > >   Bug introduced:  929f23114061a0089e6d63d109cf6a1d03d35c71
> > >   Bug not present: 8bc342b043a6838c03cd86039a34e3f8eea1242f
> > >   Last fail repro: =
http://logs.test-lab.xenproject.org/osstest/logs/157589/
> > >
> > >
> > >   commit 929f23114061a0089e6d63d109cf6a1d03d35c71
> > >   Author: Paul Durrant <pdurrant@amazon.com>
> > >   Date:   Tue Dec 8 19:30:26 2020 +0000
> > >
> > >       libxl: introduce 'libxl_pci_bdf' in the idl...
> > >
> > >       ... and use in 'libxl_device_pci'
> > >
> > >       This patch is preparatory work for restricting the type =
passed to functions
> > >       that only require BDF information, rather than passing a =
'libxl_device_pci'
> > >       structure which is only partially filled. In this patch only =
the minimal
> > >       mechanical changes necessary to deal with the structural =
changes are made.
> > >       Subsequent patches will adjust the code to make better use =
of the new type.
> > >
> > >       Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > >       Acked-by: Wei Liu <wl@xen.org>
> > >       Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> >
> > This breaks the API.=A0 You can't make the following change in the =
IDL.
> >
> > =A0libxl_device_pci =3D Struct("device_pci", [
> > -=A0=A0=A0 ("func",=A0=A0=A0=A0=A0 uint8),
> > -=A0=A0=A0 ("dev",=A0=A0=A0=A0=A0=A0 uint8),
> > -=A0=A0=A0 ("bus",=A0=A0=A0=A0=A0=A0 uint8),
> > -=A0=A0=A0 ("domain",=A0=A0=A0 integer),
> > -=A0=A0=A0 ("vdevfn",=A0=A0=A0 uint32),
> > +=A0=A0=A0 ("bdf", libxl_pci_bdf),
> > +=A0=A0=A0 ("vdevfn", uint32),
> >
> > ~Andrew


