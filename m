Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC0D27BE1F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 09:37:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNACi-0003B3-A7; Tue, 29 Sep 2020 07:37:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNACh-0003Ay-2I
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 07:37:39 +0000
X-Inumbo-ID: 28569659-a65b-4e60-ac74-65c9860151cb
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28569659-a65b-4e60-ac74-65c9860151cb;
 Tue, 29 Sep 2020 07:37:38 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id w2so3568211wmi.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 00:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:thread-index:content-language;
 bh=+BlHaoelA3/upoGvh6+Yciezwrlus7eXvVe30G+MOC8=;
 b=YJ0njSUJkM+3JrZuGXybYD2vm/byl2tAJcSMDwNyzJBtX7Elf6CstioNq6iKAR82Ig
 LBuZDeGwcC2mYPLnrZvy1tnz8K3V3JHJBFnVZDRPKIJ2hVN5VmDmdrm7kOBR0T+EEDb+
 +bcnJ1GjBncHdbh9bj/R0cfrzXenvPop92QzVr9s6NTtPAS8exDXP1pakvmbUhB6jXE1
 x7draV6LA8ymOKDTjvI5wNs/J6d0iiO7b9hZ8M6gn/+KmNvRamf434sUMl20kzoz1kgQ
 C9RuIVS7bbl5cFdWqVGVdrW+MAAl+b0tgZD6R3TBF8TjNqJ3mxsxRUAYSYTlY5SRIzbQ
 TRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=+BlHaoelA3/upoGvh6+Yciezwrlus7eXvVe30G+MOC8=;
 b=JHEJF0olFUaO0DIQRmNebac1ULrLykmwczy+WtF7/ECu9m7y765dV4sUuUQBT7wnHY
 fiAhpYZXd94MOTQ92T8VmLglnpaDtfI1QBmpkAOVRbOEahL+zd+2t+eVEo+AOWIGAR7C
 f9UMbdMCxrkv77LpD/S3uyoM6+eVv3+gY6qZ+eOUunejSGVTOZvkcLz4GbC+yEB3PKW0
 4PeC621KJCMefmauZxT0MyHhzVdRUPwVOEQfBHHDHrf5HSoOROFVZdllL/QqeORW6qDz
 KBxQk1BjULUNhw0J5HNzmMaA5b8W2/3d+3PDn4NQf3xS6QKaukaDgWjTSKHS7II7B/pc
 LUlw==
X-Gm-Message-State: AOAM533mBjTutf1aLbLh7xre5fyrnSxi3GxR9UIO6FeErSj+k7tiFoU6
 fJeNRlAbJhfbOc5428fm7CU=
X-Google-Smtp-Source: ABdhPJwJUN1Ye+X19pTSQiRfR0F9C025ODRvvACYGfu8QFJkZ/hII87undBxVOPe7+vLBuTLBERZHg==
X-Received: by 2002:a1c:dd87:: with SMTP id u129mr3010179wmg.172.1601365057279; 
 Tue, 29 Sep 2020 00:37:37 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id e18sm4710456wrx.50.2020.09.29.00.37.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Sep 2020 00:37:36 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>
Cc: =?iso-8859-1?Q?'Roger_Pau_Monn=E9'?= <roger.pau@citrix.com>,
 "'Paul Durrant'" <paul@xen.org>, <xen-devel@lists.xenproject.org>,
 "'Anthony PERARD'" <anthony.perard@citrix.com>
Subject: RE: [PATCH 2/2] libxl: do not automatically force detach of block
 devices
Date: Tue, 29 Sep 2020 08:37:35 +0100
Message-ID: <003601d69633$66c0faf0$3442f0d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdaWM0f1K15UQCVISjCpoxPepwBrjQ==
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <iwj@xenproject.org>
> Sent: 28 September 2020 14:44
> To: Wei Liu <wl@xen.org>
> Cc: Roger Pau Monn=E9 <roger.pau@citrix.com>; Paul Durrant =
<paul@xen.org>; xen-
> devel@lists.xenproject.org; Durrant, Paul <pdurrant@amazon.co.uk>; =
Anthony PERARD
> <anthony.perard@citrix.com>
> Subject: RE: [EXTERNAL] [PATCH 2/2] libxl: do not automatically force =
detach of block devices
>=20
> CAUTION: This email originated from outside of the organization. Do =
not click links or open
> attachments unless you can confirm the sender and know the content is =
safe.
>=20
>=20
>=20
> Wei Liu writes ("Re: [PATCH 2/2] libxl: do not automatically force =
detach of block devices"):
> > On Mon, Sep 14, 2020 at 12:41:09PM +0200, Roger Pau Monn=E9 wrote:
> > > Maybe a new function should be introduced instead, that attempts =
to
> > > remove a device gracefully and fail otherwise?
> > >
> > > Then none of the current APIs would change, and xl could use this =
new
> > > function to handle VBD removal?
> >
> > This sounds fine to me.
>=20
> I agree.
>=20
> If there is going to be different default policy for different devices
> it ought to be in xl, not libxl, but frankly I think this is an
> anomaly.
>=20
> I suggest we have a new entrypoint that specifies the fallback
> behaviour explicitly.

Indeed. See v2 of my series, posted a couple of weeks ago, specifically:

https://lists.xenproject.org/archives/html/xen-devel/2020-09/msg01029.htm=
l

>  ISTM that there are three possible behaviours:
>  - fail if the guest does not cooperate

That is the newly introduced 'safe_remove'

>  - fall back to force remove

That is the existing 'remove'

>  - rip the device out immediately

That is the existing 'destroy'

> The last of these would be useful only in rare situations.  IDK if the
> length of the timeout (for the first two cases) ought to be a
> parameter too.
>=20

I think that would be a worthy enhancement but above and beyond the aim =
of this series.

  Paul




