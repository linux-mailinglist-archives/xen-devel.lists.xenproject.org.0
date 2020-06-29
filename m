Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E804E20CCFD
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 09:38:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpoMp-0008QY-0y; Mon, 29 Jun 2020 07:38:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xxse=AK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jpoMo-0008QQ-9N
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 07:38:14 +0000
X-Inumbo-ID: 7ceef572-b9db-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ceef572-b9db-11ea-bca7-bc764e2007e4;
 Mon, 29 Jun 2020 07:38:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so15436726wrs.11
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 00:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ThtpoKw1x1EDOR8zDEy2fkpLsaLUgF2xKKKJKpZT2gc=;
 b=WzlsLD67+BjVSzeig1JBDhmPHqPczMlYvSNcFit4PK4hHi8YnNhSTaeR+41dnE1CbM
 jhUXGguMtwaCRY2klBms7nqL6Ch/O78/rB5xtqHsYx240kzQDZ8zXaymJLA9kDV0VUiP
 4E0Vowzvfi945TOvbGfr9zJ47bl6UHGL7Byst9GSmCJibRjnyCHk7k1qInHgbnU1U1R0
 N9tAKPLH6SEBq9WAzm3D5A4REMY5/MfXN1ur5HeQVIGPV9GtYKn1NvANn8xCjRehx5WK
 69Al0K5De7hXaj47VDWwc3Tdoq7fBKwZlkrB5INiad50/G8EOUFk1NcEyouJqo4+XSse
 /hBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ThtpoKw1x1EDOR8zDEy2fkpLsaLUgF2xKKKJKpZT2gc=;
 b=tPhvZMllPnNMO5mw7b1Kz9gSWT5f8aINISl16ww2ZRHjBBScmzip1ye8JepmxIxMLe
 D2DpCoViMwfv/T+Zt/eZ7rseT9Cu6hbbS6RieYKFwye03fWGd4RGLtNhBh+CeaKrluVD
 6hvPbHtvmxZlHDDpNY731mdXd4GlG+LUke3BnJbzGU/0XFp79Tkx5y2sfVdcs7wdwXeK
 SC/630PtpsIfH6CVCjiPM/IV72ox0Jri49nxVHSRgi2WA6NTTIsMMjMONkjPpCQKA0su
 4AQhoabHi2p5ZNwxiMWOqpDFhVxvjj4NKrggqfbI1AumaWbBLHR4EQytaATxzB8ZP/Oq
 mKaw==
X-Gm-Message-State: AOAM531MOQdA60awDNaCaki512uP+AedRRMLkOomWCGpfntc6QAEbES2
 hhobH/LOgwZzFS51YtXSZRo=
X-Google-Smtp-Source: ABdhPJwU2fBCQQWvVVW7kGBWvjRWuBetHO3xdqLHeub6HRdJtys6st+Yk1JI5HgynxbP0NFJ0GgNrw==
X-Received: by 2002:a5d:5607:: with SMTP id l7mr15312294wrv.261.1593416293067; 
 Mon, 29 Jun 2020 00:38:13 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id g3sm52911285wrb.46.2020.06.29.00.38.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 00:38:12 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 "'Julien Grall'" <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200627095533.14145-1-julien@xen.org>
 <20200627095533.14145-2-julien@xen.org>
 <f2639da1-820b-c64f-cd91-a4fb5296676f@suse.com>
In-Reply-To: <f2639da1-820b-c64f-cd91-a4fb5296676f@suse.com>
Subject: RE: [PATCH v4 for-4.14 1/2] pvcalls: Clearly spell out that the
 header is just a reference
Date: Mon, 29 Jun 2020 08:38:11 +0100
Message-ID: <000101d64de8$3e3e25a0$baba70e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGCK99Cn3HYUOxaNEXy0vUgpkd+jQHxehugAhWOP2ipd0BgsA==
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
Cc: 'Julien Grall' <jgrall@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 27 June 2020 12:55
> To: Julien Grall <julien@xen.org>; xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Julien Grall <jgrall@amazon.com>
> Subject: Re: [PATCH v4 for-4.14 1/2] pvcalls: Clearly spell out that =
the header is just a reference
>=20
> On 27.06.20 11:55, Julien Grall wrote:
> > From: Julien Grall <jgrall@amazon.com>
> >
> > A recent thread on xen-devel [1] pointed out that the header was
> > provided as a reference for the specification.
> >
> > Unfortunately, this was never written down in xen.git so for an =
external
> > user (or a reviewer) it is not clear whether the spec or the header
> > shoudl be followed when there is a conflict.
>=20
> should
>=20
> >
> > To avoid more confusion, a paragraph is added at the top of the =
header
> > to clearly spell out it is only provided for reference.
> >
> > [1] =
https://lore.kernel.org/xen-devel/alpine.DEB.2.21.2006151343430.9074@ssta=
bellini-ThinkPad-T480s/
> >
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> Reviewed-by: Juergen Gross <jgross@suse.com>
>=20

Release-acked-by: Paul Durrant <paul@xen.org>

>=20
> Juergen


