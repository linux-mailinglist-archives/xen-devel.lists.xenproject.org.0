Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AEA22CE2E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 20:54:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz2pQ-0007lG-5Y; Fri, 24 Jul 2020 18:53:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3qI=BD=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jz2pP-0007lA-4t
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 18:53:55 +0000
X-Inumbo-ID: 0548cf44-cddf-11ea-887f-bc764e2007e4
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0548cf44-cddf-11ea-887f-bc764e2007e4;
 Fri, 24 Jul 2020 18:53:54 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id g10so9144642wmc.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2020 11:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=1hESilcHyFiWy0lDakQCudSaZyHaY0Rx4qsU8Kbsh0I=;
 b=lvRYWU2kUx0wKP6oWcuaNQNEXGEs4/z1U6rU6cATeL3K7S2V5E7aHKZQS6pZYzHtM5
 XrQm8QvQ2Bg4XTaUlv0f7D3mWRSmzWArrZlOATWxkuTvFapIYKBqzw+Xwx3Q31RfB8tm
 ZmZOhg1bzMSvOEuYtQ55JvFvAWFJkH/KOOg1aHvn2p47cewVpwMknvKhnAYELqSzVBmO
 /4Biu8WYjNs3ltBKutFHPN9gvUyq+9IiDxUmT2JS5lWOdELgTQqoRNwKSzNB1uIG2mnE
 Dyh4FMw/jwkhJfMmkfb0MAP8V0WLtqidHCrBmESw9eMYga0dUsbFyxwxd2p3fqyX8tfr
 5fSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=1hESilcHyFiWy0lDakQCudSaZyHaY0Rx4qsU8Kbsh0I=;
 b=cmwOcDOqqgIv60NN94wXy4u0wLpwKF4fNpDnMoP+Kd8r8FYkLSBXidYQTaRZINqqZ+
 vbL6LfG7q0Vm2YTWSshVeKwvdk1G2iJrspavRlo/PY1U0UMNBm6mNOb5Ren9pFnV4SH5
 SAQPLkbC1E1ZoDnvvz/XHaVQOER9hZeHgHFhmguZq1MHl4nTvlYhtlRX6OhBBTATPh7N
 EAaqtmE8+LZVwfQtZydXwQAimr19jHNZzpmt42FoDrQ3S3RoGz/kCTMLzplltdrHrGYC
 uKz4KVZxt9uKpT5TFW1n1nAYs6jD8GLhGHCYV8fZ+mvKQwISRo4koFx9blIzvqAomunn
 348g==
X-Gm-Message-State: AOAM53006A6XAP4DgTl66QGbVbJvtYkoJE2gmbNuIu3CNMEmRK6/hxgL
 R06FlEcMa8Ej7cVeTTH7zkA=
X-Google-Smtp-Source: ABdhPJxjDhXVXCedhv7QyMPMNHXfK0NMU/+HFjDAZUK3ZOwcpZsna6I2gLlv+QiPlUEIIOSbRQ+Rcw==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr9460170wmh.108.1595616833533; 
 Fri, 24 Jul 2020 11:53:53 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:10dd:8439:6158:5aba])
 by smtp.gmail.com with ESMTPSA id j8sm2337535wrd.85.2020.07.24.11.53.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jul 2020 11:53:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-4-paul@xen.org>
 <c47710e1-fcb6-3b5d-ff6a-d237a4149b3b@citrix.com>
In-Reply-To: <c47710e1-fcb6-3b5d-ff6a-d237a4149b3b@citrix.com>
Subject: RE: [PATCH 3/6] iommu: remove iommu_lookup_page() and the
 lookup_page() method...
Date: Fri, 24 Jul 2020 19:53:52 +0100
Message-ID: <000101d661eb$c68a75a0$539f60e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJEvXWV1fglpFS8p501Sb8VALJosQFSVPHsAgBGpZeoH8cQ8A==
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
Cc: 'Paul Durrant' <pdurrant@amazon.com>, 'Kevin Tian' <kevin.tian@intel.com>,
 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 24 July 2020 19:39
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Kevin Tian =
<kevin.tian@intel.com>; Jan Beulich
> <jbeulich@suse.com>
> Subject: Re: [PATCH 3/6] iommu: remove iommu_lookup_page() and the =
lookup_page() method...
>=20
> On 24/07/2020 17:46, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > ... from iommu_ops.
> >
> > This patch is essentially a reversion of dd93d54f "vtd: add =
lookup_page method
> > to iommu_ops". The code was intended to be used by a patch that has =
long-
> > since been abandoned. Therefore it is dead code and can be removed.
>=20
> And by this, you mean the work that you only partial unstreamed, with
> the remainder of the feature still very much in use by XenServer?
>=20

I thought we basically decided to bin the original PV IOMMU idea though? =


> Please don't go breaking in-use things, simply because we're fixing
> Xen's IOMMU mess once large XSA at a time...
>=20
> As far as I can tell, this patch doesn't interact with any others in =
the
> series.
>=20

I can leave it, but I still don't think anything other than current =
XenServer will ever use it... so it really ought to just be in the =
downstream patch queue IMO.

  Paul

> ~Andrew


