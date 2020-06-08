Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBC21F1BAD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 17:07:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiJMd-0005nc-L0; Mon, 08 Jun 2020 15:07:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiJMc-0005nW-Lp
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 15:07:02 +0000
X-Inumbo-ID: b4b51e3e-a999-11ea-9b55-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4b51e3e-a999-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 15:07:02 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so17764577wrn.11
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=QB5BKohjXJ32ObghKFMDps1tKYPC1acdJx9MCMAOsC0=;
 b=GqCBO1MsYlAi/jAEUcqsWXRH770V1vlToZ2+rFS14pFsdhBJKHq6itHPaplghJLKHu
 BN0VfP5nXHP/ihJqZrv6NwbEjtVDPst143ppNVV8cK3yxbE0BaC4nCC2VfWE3Y+EVdeo
 qD9g+fy/FnRiyOmNtt9uKJK+TGAmxsIyELu3momWxT+OGr4szstDXbCyYXhC1o7Oynt0
 jBLUtyzVC/tI4KI8QbxqXfHjBUcpNESJlVF8gK4VYqpZrDrj8YAunxRp+np0Yev7h24/
 8rRxMNPZ25tVd/tCdEkz2Eu2LYXdYWQCBtjAmPUc5ogD4KJAySUxrqjJH6PukCVL0oTa
 89NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=QB5BKohjXJ32ObghKFMDps1tKYPC1acdJx9MCMAOsC0=;
 b=uCGp+PDE2SkSvRz0ADjqNkB+dn+BP3zaM/r4blnX3HbbOhjUsGfRg+CFNj2qSCemcS
 VVuO+QIZR+C3ornPKiu4Pk95NaMP5jIHE8GP/fFOFeF92ff4ScXjrg8hI7/MqXKAA6mG
 QSbzWac6+EuEuGffDsUjMJlA9H4YGk6tvdRvm9fHcViOOP/jUW7ORyZZNlhG/CgoyyCE
 5wDiCOot113FEVkT7NrCfVESoV5ctEoH1fOoqcEXU/IhPEP+c/PZUHv73dKcAHb9aAbJ
 3JLEtTjPXm2YGOPpPJWQDoU1vldE8duHnyiY5z2zky6nyY9Ea56C2acEbRZqWDXoybde
 LHsw==
X-Gm-Message-State: AOAM530rVLirELpqvhAp00IuJrrmTYryBsvfi9/OiftCCLSxfqeMOAO5
 GIqo73+zlZYaJIIF13flyio=
X-Google-Smtp-Source: ABdhPJzAMXwWHE/RsCcwmdSNbSaJl0ri5Y5vMAp64ThZ2XsYp4AQAslGOX2H7FKuSc+W/z3AE4COCg==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr23255066wrm.93.1591628821191; 
 Mon, 08 Jun 2020 08:07:01 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id p7sm20599wro.26.2020.06.08.08.06.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 08:07:00 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'George Dunlap'" <George.Dunlap@citrix.com>,
 "'Nick Rosbrook'" <rosbrookn@gmail.com>
References: <20200606161025.19057-1-rosbrookn@ainfosec.com>
 <B9F0A2FB-CF09-46DA-A136-54D6ABA17B4B@citrix.com>
 <34A9DEE3-7408-4717-853B-43BD5BA7B6C8@citrix.com>
In-Reply-To: <34A9DEE3-7408-4717-853B-43BD5BA7B6C8@citrix.com>
Subject: RE: [PATCH for-4.14] golang/xenlight: remove call to go fmt in
 gengotypes.py
Date: Mon, 8 Jun 2020 16:06:59 +0100
Message-ID: <004501d63da6$75d9ecd0$618dc670$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQMZuxlWX/GkGcJw6dDksLH66QFH1QGz0NGjAkULNCymKA+YwA==
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
Cc: 'Nick Rosbrook' <rosbrookn@ainfosec.com>,
 'Xen-devel' <xen-devel@lists.xenproject.org>, 'Wei Liu' <wl@xen.org>,
 'Ian Jackson' <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: George Dunlap <George.Dunlap@citrix.com>
> Sent: 08 June 2020 15:16
> To: Nick Rosbrook <rosbrookn@gmail.com>
> Cc: Xen-devel <xen-devel@lists.xenproject.org>; Nick Rosbrook =
<rosbrookn@ainfosec.com>; Ian Jackson
> <Ian.Jackson@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>
> Subject: Re: [PATCH for-4.14] golang/xenlight: remove call to go fmt =
in gengotypes.py
>=20
> CC=E2=80=99ing release manager
>=20
> > On Jun 8, 2020, at 12:39 PM, George Dunlap =
<george.dunlap@citrix.com> wrote:
> >
> >>
> >> On Jun 6, 2020, at 5:10 PM, Nick Rosbrook <rosbrookn@gmail.com> =
wrote:
> >>
> >> Since the golang bindings are now set to be re-generated whenever a
> >> change is made to tools/libxl/libxl_types.idl, the call to go fmt =
in
> >> gengotypes.py results in a dirty git tree for users without go
> >> installed.
> >>
> >> As an immediate fix, just remove the call to go fmt from =
gengotypes.py.
> >> While here, make sure the DO NOT EDIT comment and package =
declaration
> >> remain formatted correctly. All other generated code is left
> >> un-formatted for now.
> >>
> >> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> >
> > Reviewed-by: George Dunlap <george.dunlap@citrix.com>
>=20
> Paul, this is a fix to the build system that only affects the =
formatting of some generated code.  (At
> the moment, the generated code will look differently depending on =
whether you have golang installed or
> not.)

Ok, that sounds low risk.

Release-acked-by: Paul Durrant <paul@xen.org>



