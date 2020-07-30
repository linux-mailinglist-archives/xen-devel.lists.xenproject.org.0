Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3369233866
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 20:29:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1DJQ-0004X1-Ai; Thu, 30 Jul 2020 18:29:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gz/s=BJ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k1DJO-0004Wm-JR
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 18:29:50 +0000
X-Inumbo-ID: a6b7ac09-d292-11ea-8db4-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6b7ac09-d292-11ea-8db4-bc764e2007e4;
 Thu, 30 Jul 2020 18:29:49 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p14so6568072wmg.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2020 11:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=/oQ2B/nA5GJoZwORYhxmg1CGViXflM1e2jiWcV2alIE=;
 b=MEUeLJfQhbMl2ymOXA24n4PxsLgYpsVwSjLBNJTxUwcL/HSofd5QMX+f01esEH79U8
 jIMgEEidPlJQarh1xEKZX4WwANvU0GDN6ZnK2vPhYbBNiInbx0znkhwo+nZwb/3BYhKy
 dacx2oUSlXEXmoJyncT1WFtg36WiSTaC4aAt0YAhcC0Yqx5KiOyQdF5QhArW9HT8KF7U
 Xax+c6lkoUYbi4qLZs/8DWfVdOq8hEG+DQQ9d+jWB82pfxh8bPzKr1sQjeCufoKWlOIl
 6KVnyVgHg1ugIvkNMPwrZQAxKsZ1DJBRmJ3NXu6yn8aDJx15YElqjC4qirg0/hDQOj63
 hBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=/oQ2B/nA5GJoZwORYhxmg1CGViXflM1e2jiWcV2alIE=;
 b=TANALuklAkbxUcSlzP0R+bIXgLB5jIj+AzNOgDt+61TmG2cxcbhAYW0XIbIyA2YNiT
 tuEiwzAizZvMT9HSuHaiigQ52LaVTFiq1pFJraN/3WGQ+Tp7F6pQFerto2UMhTgyAoLB
 iuRJ72+YdKfAZhNr04dsC5zoemlEn4tMpfTsgTNwaGxotZLa9VaxTMxpajz8dM51IO56
 Bdm+LBK5IukH8cEd1wCkerfKExbOgY1dvMHHO4E10REn1FLN5l0twGcEh+xJ/Rwev+jj
 DxPVvY16iM7KZ5J5fyBe8InMjDXLjOBfEJZkqUdXrzV3jsVuStqpd1o+TGzzj3XWgBnV
 Ciug==
X-Gm-Message-State: AOAM531h0oNW45E4oulmLxxfa57DMGuF8Lk15S3mKDtlcVh79fnuz8VD
 8hETyBJaXjS1kGbhwbaeJr8=
X-Google-Smtp-Source: ABdhPJwJ5JfmPslQwuRXUb66cXv4PAirCb1OjMzodPGqKFQ/dxT4SOW6am0FgccGpgNJrPjJWA/esg==
X-Received: by 2002:a05:600c:284:: with SMTP id 4mr513155wmk.48.1596133788881; 
 Thu, 30 Jul 2020 11:29:48 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id 31sm10855810wrp.87.2020.07.30.11.29.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 11:29:48 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-2-andrew.cooper3@citrix.com>
 <002601d66647$ca8567e0$5f9037a0$@xen.org>
 <33a10589-6890-b653-d8c2-7eb19a5e4929@citrix.com>
In-Reply-To: <33a10589-6890-b653-d8c2-7eb19a5e4929@citrix.com>
Subject: RE: [PATCH 1/5] xen/memory: Introduce CONFIG_ARCH_ACQUIRE_RESOURCE
Date: Thu, 30 Jul 2020 19:24:35 +0100
Message-ID: <003301d6669e$addc2500$09946f00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQF6ExwjYkgZ+OK4ROtT1vtJIEnjiAIw/yGXAh+jJtsCDzS7HKmmGCIw
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 'Jan Beulich' <JBeulich@suse.com>,
 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 30 July 2020 18:34
> To: paul@xen.org; 'Xen-devel' <xen-devel@lists.xenproject.org>
> Cc: 'Jan Beulich' <JBeulich@suse.com>; 'Wei Liu' <wl@xen.org>; 'Roger =
Pau Monn=C3=A9'
> <roger.pau@citrix.com>; 'Stefano Stabellini' <sstabellini@kernel.org>; =
'Julien Grall'
> <julien@xen.org>; 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>; =
'Micha=C5=82 Leszczy=C5=84ski'
> <michal.leszczynski@cert.pl>; 'Hubert Jasudowicz' =
<hubert.jasudowicz@cert.pl>
> Subject: Re: [PATCH 1/5] xen/memory: Introduce =
CONFIG_ARCH_ACQUIRE_RESOURCE
>=20
> On 30/07/2020 09:02, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Sent: 28 July 2020 12:37
> >> To: Xen-devel <xen-devel@lists.xenproject.org>
> >> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich =
<JBeulich@suse.com>; Wei Liu
> <wl@xen.org>;
> >> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Julien Grall
> >> <julien@xen.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; =
Paul Durrant <paul@xen.org>;
> Micha=C5=82
> >> Leszczy=C5=84ski <michal.leszczynski@cert.pl>; Hubert Jasudowicz =
<hubert.jasudowicz@cert.pl>
> >> Subject: [PATCH 1/5] xen/memory: Introduce =
CONFIG_ARCH_ACQUIRE_RESOURCE
> >>
> >> New architectures shouldn't be forced to implement no-op stubs for =
unused
> >> functionality.
> >>
> >> Introduce CONFIG_ARCH_ACQUIRE_RESOURCE which can be opted in to, =
and provide
> >> compatibility logic in xen/mm.h
> >>
> >> No functional change.
> > Code-wise, it looks fine, so...
> >
> > Reviewed-by: Paul Durrant <paul@xen.org>
>=20
> Thanks,
>=20
> >
> > ...but ...
> >
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Wei Liu <wl@xen.org>
> >> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >> CC: Julien Grall <julien@xen.org>
> >> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> >> CC: Paul Durrant <paul@xen.org>
> >> CC: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
> >> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> >> ---
> >>  xen/arch/x86/Kconfig     | 1 +
> >>  xen/common/Kconfig       | 3 +++
> >>  xen/include/asm-arm/mm.h | 8 --------
> >>  xen/include/xen/mm.h     | 9 +++++++++
> >>  4 files changed, 13 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> >> index a636a4bb1e..e7644a0a9d 100644
> >> --- a/xen/arch/x86/Kconfig
> >> +++ b/xen/arch/x86/Kconfig
> >> @@ -6,6 +6,7 @@ config X86
> >>  	select ACPI
> >>  	select ACPI_LEGACY_TABLES_LOOKUP
> >>  	select ARCH_SUPPORTS_INT128
> >> +	select ARCH_ACQUIRE_RESOURCE
> > ... I do wonder whether 'HAS_ACQUIRE_RESOURCE' is a better and more =
descriptive name.
>=20
> We don't have a coherent policy for how to categorise these things.  I
> can change the name if you insist, but I'm not sure it makes a useful
> difference.
>=20

Ok, it's fine. My R-b stands.

  Paul

> ~Andrew


