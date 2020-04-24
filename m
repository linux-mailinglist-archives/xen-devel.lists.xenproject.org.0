Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1F81B7B55
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 18:21:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jS14D-00008n-Bg; Fri, 24 Apr 2020 16:20:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IwUP=6I=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jS14B-00008i-3E
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 16:20:39 +0000
X-Inumbo-ID: 886b23d4-8647-11ea-b58d-bc764e2007e4
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 886b23d4-8647-11ea-b58d-bc764e2007e4;
 Fri, 24 Apr 2020 16:20:38 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id r26so11509248wmh.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2020 09:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=9bx51FvrRnVBJUfAFqmZlhxQJHQYPqoUXBbqDAvFKr4=;
 b=BQKWyuGvQD8pLMEHgdfFYnrgzJcKymI4F6Ie1ufnitB7O6rqrQFKW6bK3iW0rrIKbL
 NCaKwrzzuThRCRfantCUQr4TGf+uivt2V/1bDqupvLeB7r/h+xXAcjeXI3nG+Css2Pwc
 WHLJp8NHCGrAdJSN2hsGK8UXqXb73s+HjWNmPIh392jn5nKGL0gmNHoLVbiqz2hAuHEc
 wAU4yybFVet4BMUSuRVeapSKVBpDCmXJ0COUE9IJV6UfQWNVeoMh1VBjfjvdcuCUFo+v
 FQeAvJhcpznPY90EfPkc1bhOF4LwIwYwTUPMDfqREYjW2EqykqmphcMgdFok9lFskH17
 mMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=9bx51FvrRnVBJUfAFqmZlhxQJHQYPqoUXBbqDAvFKr4=;
 b=mVUvSOOsPu4HWWm3vIQiYnHxFBDoAdvAZeKxaeh050DUOKEFgXDIFtHdvMn9BBbntl
 hC7L4Y3G94YI/W8Hw1twwsB4y4iSGfhUK8BQhFYDg0omrKlkww0hRdCfH+5FaI/IpSVN
 m8G4vZkC0/4YTJIZBcTQyRlO6+rP98owNYdxeHrjWrVRs2fWPlMReTLJ9gj4G/bpQwzc
 1OZ9+VYhFJGlyyjefMxjK1FtsCu7q+SisjU4+gHIjkYkGaUfwgZDprrIUbBGLsDE4eiW
 B4rhd1HyCYgorGV0sPffEwGRKHntTaTs8YIFq8/Xm4Yl/4ZdHRaXcCdCYETug+QlcbRm
 FGcA==
X-Gm-Message-State: AGi0PuYdtwjBjZ1P5+FETAf+Oeali1A/mvoobvTthsV0bDMvYm8oXQhP
 AueqAMxN/0ExZaRkVLwRn+A=
X-Google-Smtp-Source: APiQypJSgpxJFEKxQjfMKuo2AQbwwRkWk8TWMZDIt2g8G7SIOELK0aWAFmZ8ZxwiUb58eu74oUzoBw==
X-Received: by 2002:a1c:5fc4:: with SMTP id
 t187mr11461942wmb.181.1587745237395; 
 Fri, 24 Apr 2020 09:20:37 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id o3sm8880754wru.68.2020.04.24.09.20.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 09:20:36 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
 =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20200424133736.737-1-paul@xen.org>
 <a1febde5-0a34-6480-6400-7142a6bb6f52@suse.com>
 <c7cb8073-44ef-c92e-2962-d427e1568748@xen.org>
 <8029c772-9c42-460c-e17c-85e18b32f102@suse.com>
 <7ae1bb1c-0029-c3f0-1565-e5f99effee51@xen.org>
 <33b38b41-9112-5a7f-7d3a-1663132b9603@suse.com>
 <e614fa8c-cea6-43f3-0bf2-003eabb4ae8f@xen.org>
In-Reply-To: <e614fa8c-cea6-43f3-0bf2-003eabb4ae8f@xen.org>
Subject: RE: [PATCH] docs/designs: re-work the xenstore migration document...
Date: Fri, 24 Apr 2020 17:20:35 +0100
Message-ID: <000301d61a54$498f2020$dcad6060$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIqV5bkCWemUTYZznnWnEmKpB0tyAKBFuAqAldPX9kCaOHC9AKAOo04AlN1xhgB05tb1adws5MQ
Content-Language: en-gb
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
Cc: 'Paul Durrant' <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 24 April 2020 17:04
> To: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>; Paul Durrant =
<paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>
> Subject: Re: [PATCH] docs/designs: re-work the xenstore migration =
document...
>=20
> Hi,
>=20
> On 24/04/2020 16:59, J=C3=BCrgen Gro=C3=9F wrote:
> > On 24.04.20 17:44, Julien Grall wrote:
> > If I extend the record and do a downgrade I'm losing the =
information,
> > too, as the old version won't read it in any case. BTW, extending =
the
> > record is no problem, as the length is stored in the header. Unknown
> > records (and extensions) will be just ignored when reading.
>=20
> That's very much up to the implementation. An implementation may =
decide
> to bail out if the record is not an exact size.
>=20

It won't know. The record will be whatever size it says it is, and if =
the format doesn't match what the implementation was expecting then =
it'll probably crash.

> >
> > In your case when reusing the paddings and doing a downgrade you =
would
> > crash, as the paddings are no longer zero.
> >
> > In case a downgrade should not be done due to vital information loss
> > then you should just not do it.
>=20
> Of course, however I don't think a user will necessarily know it =
should
> not do it. So how do you protect against misuse?
>=20

The stream is versioned. If information is vital then I'd expect the =
version to be bumped, which should prevent a downgrade.

  Paul



