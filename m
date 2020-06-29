Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F35820CCFE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 09:39:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpoMT-0008ON-OM; Mon, 29 Jun 2020 07:37:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xxse=AK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jpoMS-0008OI-NV
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 07:37:52 +0000
X-Inumbo-ID: 6fc3c5f8-b9db-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fc3c5f8-b9db-11ea-bca7-bc764e2007e4;
 Mon, 29 Jun 2020 07:37:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g18so15491394wrm.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=2fwn6pIqS5z7HIEO057khAR+BqVUuqXv4UaASW9OBtA=;
 b=nhCQNleSGGSYdz2iY8qWzdX0G1oFYsDQBA4/lXVNsE4uD5bsdt3JO3aK+vCi3mhFPS
 NNJLeAUMyFFn0RP+nuFGgsMJIHX8U8XGZFjVEyHBZf8C1Ir5gdVQYxgrA/k2q0PHOP1b
 jhe1OUfqeDaJ9odq6JtwQMzqcSLXiyjeSK6TB1eWHcGDFBX+WsES8lVeUsCIXLJcJcXZ
 UTFGmHphGTVXVw73j6FrAI3+rFA4wrPgvfJdRc+hG+TMNw4TN4cu9wohTqgSihuSJB7O
 KS+0XqaBopuwvlogbL8Py0mChG5mQUOC2VuNVZ1JTUjWs41rMnWLRkQYxhG9OZb9Xf+d
 DhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=2fwn6pIqS5z7HIEO057khAR+BqVUuqXv4UaASW9OBtA=;
 b=WTsFiRygc0YPA3Wq9MHAYubTc7t/wOQEm/nOCO7Y4lO8QHdMFqkeagap4uCXrnCFon
 N2B/bB1gaG3AZ5m19+a9LflctYGGzQFo5VzbgAo16SsfU3NNngc8bxruM1bMJqIcJroU
 7Doa2fwqcJK6wR/0W9F1sfBFKc9gOzNikBH8bhg2CDKIjRLHRiAQzJo2sqRroR1SXX45
 2LImKids/Z24YjO1ZX5/lGQO176JtHn4fqGLzqfI2qFYDH8PRSX9q+fctTsOL5+D/plo
 52F49PihTcGdcg8gW9vh8zt1kh/vNvfpNwKyRuM6JrmxUGMbv5UBQ0Yddc3rZSNiIWT0
 k7lg==
X-Gm-Message-State: AOAM532Oz0HhcX0h0aMiW7O52iGFLZl4URgIHLadhp8vrb/ibl9haaJN
 DsNM8afWopPUeAfALHQw/GQ=
X-Google-Smtp-Source: ABdhPJxrUKPrzjNieTfhQ89HLIGViTHGrRTLE3ngdgJj8kxwuzBkdxh9IIvjiidLZZ3tfR3Tf85eqQ==
X-Received: by 2002:adf:ed4f:: with SMTP id u15mr15360789wro.318.1593416270929; 
 Mon, 29 Jun 2020 00:37:50 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id r12sm46906288wrc.22.2020.06.29.00.37.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 00:37:50 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 "'Julien Grall'" <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200627095533.14145-1-julien@xen.org>
 <20200627095533.14145-3-julien@xen.org>
 <82c445c0-f7fc-176f-fdac-386228cc17f5@suse.com>
In-Reply-To: <82c445c0-f7fc-176f-fdac-386228cc17f5@suse.com>
Subject: RE: [PATCH v4 for-4.14 2/2] pvcalls: Document correctly and
 explicitely the padding for all arches
Date: Mon, 29 Jun 2020 08:37:49 +0100
Message-ID: <000001d64de8$31028b10$9307a130$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGCK99Cn3HYUOxaNEXy0vUgpkd+jQFSczG1Aiw0Rw2pe4NCoA==
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Julien Grall' <jgrall@amazon.com>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 27 June 2020 12:54
> To: Julien Grall <julien@xen.org>; xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Julien Grall <jgrall@amazon.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Wei =
Liu <wl@xen.org>
> Subject: Re: [PATCH v4 for-4.14 2/2] pvcalls: Document correctly and =
explicitely the padding for all
> arches
>=20
> On 27.06.20 11:55, Julien Grall wrote:
> > From: Julien Grall <jgrall@amazon.com>
> >
> > The specification of pvcalls suggests there is padding for 32-bit =
x86
> > at the end of most the structure. However, they are not described in
> > in the public header.
> >
> > Because of that all the structures would be 32-bit aligned and not
> > 64-bit aligned for 32-bit x86.
> >
> > For all the other architectures supported (Arm and 64-bit x86), the
> > structure are aligned to 64-bit because they contain uint64_t field.
> > Therefore all the structures contain implicit padding.
> >
> > Given the specification is authoriitative, the padding will the same =
for
>=20
> s/authoriitative/authoritative/
>=20
> > the all architectures. The potential breakage of compatibility is =
ought
>=20
> s/the//
>=20
> > to be fine as pvcalls is still a tech preview.
> >
> > As an aside, the padding sadly cannot be mandated to be 0 as they =
are
> > already present. So it is not going to be possible to use the =
padding
> > for extending a command in the future.
> >
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> With above fixed:
>=20
> Reviewed-by: Juergen Gross <jgross@suse.com>
>=20

Release-acked-by: Paul Durrant <paul@xen.org>

>=20
> Juergen


