Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B903C1EDF0B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 10:08:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgkut-0002x2-2K; Thu, 04 Jun 2020 08:07:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EphU=7R=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jgkur-0002wx-Fw
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 08:07:57 +0000
X-Inumbo-ID: 7f508fa6-a63a-11ea-81bc-bc764e2007e4
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f508fa6-a63a-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 08:07:56 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c3so4993588wru.12
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 01:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=NxmGzct06XRMEU7rIZKUdCcw+WTOot7HRLTCpNpzNhA=;
 b=W6u56uDh31Or3xU/MYyaAR9l6lGl5ww6JdAlW7JGq38DHhlOwMNERBDkvlPQguQPqH
 +0vKVB541h2vSsXwgDpFV0eOHZHLwsVe6XAzTp/Yfi8BDP2RJ8AhF3+BnQFwQp1ZCr49
 HcP+2hCUu1/wuF/jME8/Y0S+wXQneY1c+/s4kIyiYoAr/fvd67xMiSMDeLM9VSGxEyW0
 J2+mDKLHc4iQxY6/ZANuL96AcFwTuv8QBY1VBqcBOR+Y6Ujt/jps1GdG5K3u4j0oDmPH
 hNA/xyRWSV9Jg32jBkWaKGvyOOGCkNzzxGbs1GhafGsN5qldWPLqCaRnCEK+RPsrFuZM
 JWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:references:in-reply-to:subject
 :date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=NxmGzct06XRMEU7rIZKUdCcw+WTOot7HRLTCpNpzNhA=;
 b=i1hb3B3LXlCkQvVl/kAZ7aYrXDOiDGMLs0pRDGGNnTBECEp5aNBfmC0ksr2mjtNIMF
 jUvivfTCmg3x59V0byOIdlHa72Stj8bSiiN8TfgapqUHb353HXN9bW599ruOKbWPs6b+
 zSu9HUL8aDg6OKOly/n0SgwRoibFYRIe+Uwj7X5+ri/7ozEyNGhBuqC9Z/N4Af/2VqHm
 fQDCFU9lW7dPRWqsuayCIQ8QNLmqIi+aZZGCIB7V+xSPvRO4oaWGP8g/JwViuQ83pqhL
 IMXj0O1Ngo3XjMEzzoLCUvg+zUlDYGZzviQRKH2lEiSjGOmHIk4w0aOrIqH6I4DmmVDh
 0XZw==
X-Gm-Message-State: AOAM532dTcP5wMAFf3ywaPkgpKotuFFhSJB6H2dQP3/P/eNBX62dPelY
 rOdmGEwlaSpVvyYrZPA/gM4=
X-Google-Smtp-Source: ABdhPJwgJ9yWrVGNGFftYWPtCLSOqlkCY+Mt84OPjicEO2z/QGgC0Ybkin5dabwdej2i8OW8qdo8rQ==
X-Received: by 2002:a5d:468d:: with SMTP id u13mr3422084wrq.73.1591258075866; 
 Thu, 04 Jun 2020 01:07:55 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id h7sm6116417wml.24.2020.06.04.01.07.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jun 2020 01:07:55 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <35df958d-eff8-9ca7-fd72-05694f07248d@suse.com>
In-Reply-To: <35df958d-eff8-9ca7-fd72-05694f07248d@suse.com>
Subject: RE: Xenstore quota and driver domains
Date: Thu, 4 Jun 2020 09:07:54 +0100
Message-ID: <006701d63a47$408511c0$c18f3540$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJua4BClDl1csHN5IQ1VoJLzvIqqqeXtW4Q
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
J=C3=BCrgen Gro=C3=9F
> Sent: 04 June 2020 06:03
> To: xen-devel@lists.xenproject.org
> Subject: Xenstore quota and driver domains
>=20
> A recent report on xen-users surfaced a problem we have with driver
> domains in medium sized or large configuration: the driver domain can
> easily hit the default Xenstore quota (in the report it was a driver
> domain for disks which hit the quota when 15 domUs were active at the
> same time).

Which quota is hit? Node or watch?

>=20
> Setting the quota to a higher limit will work, of course, but this
> enables "normal" domUs to use this quota, too, thus hogging lots of
> Xenstore resources.
>=20
> I believe the most sensible way to solve that would be to have a way
> to set per-domain quota in Xenstore. As the original reporter already
> raised concerns regarding rebooting the server for applying new global
> quota, I believe new quota settings should be possible at runtime.
>=20
> The question is how this interface should look like. Right now I could
> think of two variants:
>=20
> 1. A new XS_SET_QUOTA and XS_GET_QUOTA wire command pair which can set
>     and get the quota (both, default values for new domains and for =
any
>     existing domain)
>=20
> 2. A new XS_CONTROL command for setting/getting quota (same scope as =
1.)
>=20
> Both variants have advantages and disadvantages:
>=20
> 1. Pros: - clear interface, easily usable
>     Cons: - requires more code churn in tools (libxenstore, xl, libxl)
>             for support in domain-config
>           - any extension will again require similar churn
>=20
> 2. Pros: - easy extensible domain-config possible (via a single item,
>             e.g. "xenstore-quota=3D'watches=3D10 entries=3D2000'")
>     Cons: - text parsing in Xenstore instead of xl/libxl
>           - XS_CONTROL sub-options for quota will be ABI
>=20
> Any thoughts?

Even though 1 requires more code churn, I still think it is the better =
way to go.

  Paul

>=20
>=20
> Juergen



