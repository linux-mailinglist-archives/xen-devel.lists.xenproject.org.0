Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36C1F9E0B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 19:04:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jksX8-0000p9-8Y; Mon, 15 Jun 2020 17:04:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mLd=74=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jksX7-0000p4-7n
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 17:04:29 +0000
X-Inumbo-ID: 458eff16-af2a-11ea-8496-bc764e2007e4
Received: from mail-ed1-x531.google.com (unknown [2a00:1450:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 458eff16-af2a-11ea-8496-bc764e2007e4;
 Mon, 15 Jun 2020 17:04:28 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w7so12094468edt.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 10:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=S2de4X8bQU6oWpw9XaayCjvxIw6dq1jIeG/5ypF6h+0=;
 b=sK8XRmAd3KFxuWu4466Dk9HVnw2TiJbEsJSnm/6lyEXt5N0espnfh695n52Ooim3Q+
 Kfu1H/t3HLf5O3oVs5KrkOYqugjesNReYM6Ub/6LZZLGe2nLlJsBfy2XnS/6DmBZI+su
 Z/u0bKGj912/LN39/OG/UxiT9KU7yEwLhaKzCAhEylz5NHicjxsGgIE7muU+Vjig+pzQ
 RCtwoHPgWVU1a4K2PeqHwm/aIcQ+kfo3rXkccGf15j4cbrt3F/xdFsOk+ib1WqCOY7zJ
 CCEtzTOtZ9r33QpeVOrc3tuII9BFLhWFlHIelJpMAY9sH7NNJSIWcmkrsUU2jTrpngYr
 wbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=S2de4X8bQU6oWpw9XaayCjvxIw6dq1jIeG/5ypF6h+0=;
 b=jkSkmIcczUz9WQQtOoMg1SLokAqd3QiihwDJW6r+1ljXM12WSHTu7CjQtcm0o1WNuT
 4SmP4NYMQuk9i1Sh+IIVDCeATEwxzREoBe80AklnM1O91YsYC8hPaCtnD2v/7An4idkh
 rlkTYV+UnGU6Ibh2+tId7eIbI2TbleqqjOcH1dAjqBT2AHMK0HuqENwn7vg0i71Hw97v
 jjMylZ1Pb1Ec/GZZRehiaf1tMvkglIrU8weo/arAXzTxRsOxbBgKXOtpNPxBUGRV7eSC
 +WmINk/Te4klvS3ufb6Ii0Duuw2U9ebAtFmn53AwMPBD2sbjLzRLYyY/DG3LdXcC5KrT
 wkwg==
X-Gm-Message-State: AOAM531DNiFM3zVi4znaCOODv7mWVvRavwUJ7A8be0Eh3/rzjESCnmrP
 qX63tlBTC5GR5wrdi2zokhVdtWizrwY=
X-Google-Smtp-Source: ABdhPJyDMSfThUyMXff4nQaOrfl9LFCNstxUsEyenT5TwyNyCOjz7pFCoVbJp91tnuNCUR4Hbbt9Qg==
X-Received: by 2002:a05:6402:3052:: with SMTP id
 bu18mr24025992edb.323.1592240667450; 
 Mon, 15 Jun 2020 10:04:27 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id o16sm9416577ejg.106.2020.06.15.10.04.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 10:04:26 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200615141532.1927-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH for-4.14 0/9] XSA-320 follow for IvyBridge
Date: Mon, 15 Jun 2020 18:04:25 +0100
Message-ID: <003101d64337$06b202c0$14160840$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQBu9n1OIN1/SF0JEfFzSQwAilcbPKuogK/g
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
Cc: 'Ian Jackson' <Ian.Jackson@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>,
 'Wei Liu' <wl@xen.org>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Andrew Cooper
> Sent: 15 June 2020 15:15
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>; Andrew Cooper =
<andrew.cooper3@citrix.com>; Jan
> Beulich <JBeulich@suse.com>; Ian Jackson <Ian.Jackson@citrix.com>; =
Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>
> Subject: [PATCH for-4.14 0/9] XSA-320 follow for IvyBridge
>=20
> This is some work in light of IvyBridge not gaining microcode to =
combat SRBDS
> / XSA-320.  It is a mix of some work I'd planned for 4.15, and some =
patches
> posted already and delayed due to dependence's I'd discovered =
after-the-fact.
>=20
> This provides a more user-friendly way of making IvyBridge safe by =
default
> without encountering migration incompatibilities.
>=20
> In terms of functionality, it finishes the "fresh boot" vs =
"migrate/restore
> from pre-4.14" split in the libxc CPUID logic, and uses this to let us =
safely
> hide features by default without breaking the "divine what a guest may =
have
> seen previously" logic on migrate.
>=20
> On top of that, we hide RDRAND by default to mitigate XSA-320.
>=20
> Additionally, take the opportunity of finally getting this logic =
working to
> hide MPX by default (as posted previously), due to upcoming Intel =
timelines.
>=20
> Request for 4.14.  The IvyBridge angle only became apparent after the =
public
> embargo on Tue 9th.  Otherwise, I would have made a concerted effort =
to get
> this logic sorted sooner and/or part of XSA-320 itself.
>=20
> Strictly speaking, patches 1-4 aren't necessary, but without them the =
logic is
> very confusing to follow, particularly the reasoning about the safely =
of later
> changes.  As it is a simple set of transforms, we're better with them =
than
> without.
>=20
> Also, the MPX patch isn't related to the RDRAND issue, but I was =
planning to
> get it into 4.14 already, until realising that the migration path was =
broken.
> Now that the path is fixed for the RDRAND issue, include the MPX patch =
as it
> pertains to future hardware compatibility (and would be backported to =
4.14.1
> if it misses 4.14.0).
>=20

Fair enough. Once the series has all the requisite maintainer acks then =
I'll release-ack it.

  Paul

> Andrew Cooper (9):
>   tools/libx[cl]: Introduce struct xc_xend_cpuid for xc_cpuid_set()
>   tests/cpu-policy: Confirm that CPUID serialisation is sorted
>   tools/libx[cl]: Move processing loop down into xc_cpuid_set()
>   tools/libx[cl]: Merge xc_cpuid_set() into xc_cpuid_apply_policy()
>   tools/libx[cl]: Plumb bool restore down into xc_cpuid_apply_policy()
>   x86/gen-cpuid: Distinguish default vs max in feature annotations
>   x86/hvm: Disable MPX by default
>   x86/cpuid: Introduce missing feature adjustment in =
calculate_pv_def_policy()
>   x86/spec-ctrl: Hide RDRAND by default on IvyBridge
>=20
>  docs/misc/xen-command-line.pandoc           |  20 ++-
>  tools/libxc/include/xenctrl.h               |  42 ++++-
>  tools/libxc/xc_cpuid_x86.c                  | 239 =
++++++++++++++++------------
>  tools/libxl/libxl.h                         |   8 +-
>  tools/libxl/libxl_cpuid.c                   |  17 +-
>  tools/libxl/libxl_create.c                  |   2 +-
>  tools/libxl/libxl_dom.c                     |   2 +-
>  tools/libxl/libxl_internal.h                |  12 +-
>  tools/libxl/libxl_nocpuid.c                 |   2 +-
>  tools/tests/cpu-policy/test-cpu-policy.c    |  49 +++++-
>  xen/arch/x86/cpuid.c                        |  23 +++
>  xen/include/public/arch-x86/cpufeatureset.h |   4 +-
>  xen/tools/gen-cpuid.py                      |  18 +--
>  13 files changed, 278 insertions(+), 160 deletions(-)
>=20
> --
> 2.11.0
>=20



