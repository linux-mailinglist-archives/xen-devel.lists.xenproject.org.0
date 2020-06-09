Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380BB1F4104
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 18:36:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jihEC-00029w-HX; Tue, 09 Jun 2020 16:35:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fMpV=7W=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1jihEA-00029r-Q3
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 16:35:54 +0000
X-Inumbo-ID: 49a3489c-aa6f-11ea-8496-bc764e2007e4
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49a3489c-aa6f-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 16:35:54 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id q8so23459326iow.7
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=dDmpwfxSB7xq+nl+xf69iWKoal8j+zfpCNakAwwcUgc=;
 b=sNZwBXv00cxskE5SIHqXQw6g4j1XBMeSJQsN28+4r7vzGHcc9X+/tJQwB7dLM7cmK7
 uHA+Qy9pghOn+pZYfrVcimJJCUKaM/Ti2tSTsB4iwq4otl9ibsq0ckrapQFIeFnM9Qao
 uf/2YZ6M9Qy6P7lhM7XvdmQGTGOEPV3wtjnOuyEiyrERMmp9NbaKyDlIr+LCqJvbETDH
 JzWsfYESprzGB1D95Z5/M1IK+tDqPlNL6GiRJKEp8CcysxAg6TOGqj2uUf7sTg9EIs4o
 7NWTb3vbsUifOw62UgJcZ2iXsIlsOLunmjuW4zTFK7TbiwtQ6VxugsEdT5UFP8yfT7d5
 R5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=dDmpwfxSB7xq+nl+xf69iWKoal8j+zfpCNakAwwcUgc=;
 b=Dsl+/kxaYGRR3U8YUa1k36D3EialiPtypnjE0POc3XE5PL0zXPo1GwAnqr6cfHRcV6
 BVRxKzE6Hb5nW+KWP/ui25DpcWqZ65ssr9TiRQo6QFu5obkxj2a3x7s6PoyirPaPigKr
 VqtJODBFCnWMf7A5mwjG1ddXZYxDpb/2oSmeEfTIugpEmIlqA92fo1jLTa6HwnqS8qGP
 EJRT4emgqI8aiPrwyDueeWHhM/WcOMjgJtaU/yPUBZjCUTZGQDEmCHMVFL51dIFhPplc
 2FtYXHUJKzTWRfjWpzwn5GBgBns5FIc9Stlb6dQeHaKm+HFzd1ePY8kwcIfS3k0es446
 jhyg==
X-Gm-Message-State: AOAM533jop3MpUVhi7A4uSjscN+fN6FTHV8Eb1O/6VqsC25Px4uMfK/0
 D1iFy8+QT6FpDQwfdVVrRtQ=
X-Google-Smtp-Source: ABdhPJyKCI/p/AACig2mOdVXBRSKvBBIJOzuzKETn/UHazI9mMMgjgd+Q6oKsPXCKqLOwX0qtZaj8A==
X-Received: by 2002:a6b:e714:: with SMTP id b20mr28249467ioh.195.1591720553712; 
 Tue, 09 Jun 2020 09:35:53 -0700 (PDT)
Received: from [100.64.72.28] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id a10sm9617754ilb.31.2020.06.09.09.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 09:35:52 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v1] tools: fix usage of strncpy
Date: Tue, 9 Jun 2020 12:35:51 -0400
Message-Id: <E1632643-349D-4B0B-A78C-A06E64321964@gmail.com>
References: <20200608161111.26c2cdd4.olaf@aepfle.de>
In-Reply-To: <20200608161111.26c2cdd4.olaf@aepfle.de>
To: Olaf Hering <olaf@aepfle.de>
X-Mailer: iPhone Mail (17F75)
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Jun 8, 2020, at 10:12, Olaf Hering <olaf@aepfle.de> wrote:
>=20
> =EF=BB=BFAm Mon, 8 Jun 2020 08:43:50 -0400
> schrieb Jason Andryuk <jandryuk@gmail.com>:
>=20
>> I added a length check in this patch:
>=20
> gcc will not recognize such runtime checks and will (most likely) complain=
 about the strncpy usage anyway, just as it does now in libxl__prepare_socka=
ddr_un. While the usage in libxl__prepare_sockaddr_un is fatal due to -Werro=
r, libvchan is apparently built without -Werror.
>=20
> Olaf

Is there any reason not to take a patch that builds libvchan with -Werror?

Rich=

