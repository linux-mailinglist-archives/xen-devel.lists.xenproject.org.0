Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA42A272A30
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 17:32:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKNnf-0005dv-Sm; Mon, 21 Sep 2020 15:32:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PHp+=C6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kKNne-0005dq-P8
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 15:32:18 +0000
X-Inumbo-ID: a1543276-b0b4-4555-8cfd-49f9501a7989
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1543276-b0b4-4555-8cfd-49f9501a7989;
 Mon, 21 Sep 2020 15:32:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id k18so13190725wmj.5
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=9trgNINn+LyVDF/WumzD5/u0j02dbE4bd4d7tBEzRdk=;
 b=s4adEvacP7VV88Z9+HYwXe9ObAKQU6VMqnF23eh/LhVxQI8V95JlbU9iaJ6i0OI/ri
 3HiiIrTBrL9KcUhLdYGVNZ3tX7fowZ/PgB2r6q/9Ae3enmZBbWWTfJxkKrf3CR13PXmy
 Dk/3K2f6KG0UPRISdl8c9CV3Ed/QpQklqh4An5S++/d/CHZlXLeEz7rvaXuMzEO7eadM
 8gmJShZnBGXAHvL5BCPuSbu+7gU/Q/5Lfqlyw7DjR21VuW08grMnmg+Y3tlAy0mJJoVB
 hWmexOHiYfEfHg+M2DApdKQazOhJSaX+ItRBZ3tKNKQOgo+jHIYAtGkOrlvpeD1nSASy
 zvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=9trgNINn+LyVDF/WumzD5/u0j02dbE4bd4d7tBEzRdk=;
 b=IAAOAjejthLt2IH9rcpZr8aIZNy3jO1giFVbtVaTuick/s80u+6PvK6PyUsgQY/3W4
 0NCZbdJZ4yUZNoWPSD+NSHG3ExjPBTP088i+wsrRdt2jCMcRxZwSd9mdIx0TSLU0YH43
 1ST1TbrF3ooxKY0r0XW+fsXzDm0puV8cE6Ax/F81Dxje0myhc+NmOs8qCVBNbCrbFMZM
 CzyLqm63y6LM6KJ4T4Xndv+osQ/Nur8wuyk45INpqWDMM8fm/kZXT6Q9qFyFwXdiB6q+
 lQ0TG5VkgC+2WHBRaraYfkworo22jCttHYs0CJRaN12uq8KTaOYuwt+BXhhDM8mJveOn
 oC9Q==
X-Gm-Message-State: AOAM53315b5WKJcDarmHPyRwR+qQJq+BZHZcHgXTfYc+aaPtP9NKIDfa
 HAB/A7hL3Vr1MgYqjsMmr60=
X-Google-Smtp-Source: ABdhPJwc1KXrqi3buiox2viu2FF+fjIp3ptZg3i80XRZbPjPpQ4wynzWnMWccbjfVODYY9my7yp/qg==
X-Received: by 2002:a1c:f716:: with SMTP id v22mr153221wmh.183.1600702336909; 
 Mon, 21 Sep 2020 08:32:16 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id w15sm20117068wro.46.2020.09.21.08.32.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 08:32:16 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Cc: "'Julien Grall'" <jgrall@amazon.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 "'Jan Beulich'" <jbeulich@suse.com>, "'Wei Liu'" <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Jun Nakajima'" <jun.nakajima@intel.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-6-julien@xen.org>
In-Reply-To: <20200730181827.1670-6-julien@xen.org>
Subject: RE: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
Date: Mon, 21 Sep 2020 16:32:15 +0100
Message-ID: <005b01d6902c$62a72410$27f56c30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQMZP/5qxAzbVNyk/kVqc0bzCNOmYwIMWlcApt11rlA=
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
> From: Julien Grall <julien@xen.org>
> Sent: 30 July 2020 19:18
> To: xen-devel@lists.xenproject.org
> Cc: julien@xen.org; Julien Grall <jgrall@amazon.com>; Stefano =
Stabellini <sstabellini@kernel.org>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Wei Liu <wl@xen.org>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Paul Durrant
> <paul@xen.org>; Jun Nakajima <jun.nakajima@intel.com>; Kevin Tian =
<kevin.tian@intel.com>
> Subject: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather =
than asm/guest_access.h
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Only a few places are actually including asm/guest_access.h. While =
this
> is fine today, a follow-up patch will want to move most of the helpers
> from asm/guest_access.h to xen/guest_access.h.
>=20
> To prepare the move, everyone should include xen/guest_access.h rather
> than asm/guest_access.h.
>=20
> Interestingly, asm-arm/guest_access.h includes xen/guest_access.h. The
> inclusion is now removed as no-one but the latter should include the
> former.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Viridian change...

Acked-by: Paul Durrant <paul@xen.org>


