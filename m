Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF7012EA17
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 19:54:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in5Z8-0006oY-33; Thu, 02 Jan 2020 18:51:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9dTL=2X=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1in5Z6-0006oT-Oe
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 18:51:24 +0000
X-Inumbo-ID: dfac8288-2d90-11ea-b6f1-bc764e2007e4
Received: from mail-yw1-xc2e.google.com (unknown [2607:f8b0:4864:20::c2e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfac8288-2d90-11ea-b6f1-bc764e2007e4;
 Thu, 02 Jan 2020 18:51:24 +0000 (UTC)
Received: by mail-yw1-xc2e.google.com with SMTP id i190so17592848ywc.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2020 10:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :to:cc; bh=O8aXbCk2s28cIbpxZkzJ04cdc4EVBI0EIQB92wjz5Ik=;
 b=RMhYWTLe0IIID7k7VHI8F7Kk0eT/ia/WXbDi4o//2xynx9e99uzsGiinnh/xqga19p
 2pMWLdBpw39GL6jnDLfNTTUyDeu7j5hQNYt3Q9qqi9KXNwIY7Z/Uk5Bwx3imgPBCNXQW
 jc43KqndtIbQxTPCdVA5G2wXF8sC1rUtd2S1Nj2kqCmidmijZgCRp93jaQf8Rv7o+Xnx
 pFWe8tm5tZmnUXwSxIJ2Gj9zlTyUvAdFXrS5i6glRYlGIhtU9UVEDiRjU1dL5umj5+Pg
 o2qf0/990QkWjZIikhLfjA0zQyAthb1TNH9nMAxrOroY2TiFfUTkbiYlDl2gMBPUwC0Q
 6CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:to:cc;
 bh=O8aXbCk2s28cIbpxZkzJ04cdc4EVBI0EIQB92wjz5Ik=;
 b=MSFj8deFsMJksvaOss1moSo5xFikB3knCoBz/VH6QI9lLy1AikErYwKclqA37fzHBD
 USJpP2tIrV/hGxsZPfFkZXRu887CsQG9qYXHvmF0HxLSLAuDhU3dbn4Wz8HAOD+BcRL8
 PX3fbMoBRxgIQeU3LqKZHUN6jvlaU5QD1LAc8dVBCOpivQ7ZNlur5ftf/sEMBagejYoW
 +CS9NRdXWdYmmW9q8fxLncVmQLBffd7mw0YCE4L9Z9lgEYMff0/tPdIhz2gnYPeI+x0S
 +SrIf5dRJk7HZ76QFNK77aLvcyzldiWJoxMeWl4RALDu3Fd9EZau/xZAYWCaKY6D1GQo
 KDhg==
X-Gm-Message-State: APjAAAUNpvAxVFeDkPBuWXM5jt9zgT3vR+MnmjxffTzDkr9fVd0PtoK7
 6T+1QMM6UYoV610ScvL4Akw=
X-Google-Smtp-Source: APXvYqyJOLEAD8F3DCx9RVjNR3ZXt/UItRqtQp6zWbD8y5zUf9DjRSQcS20ez6DP9KQRWQY7NJ0+IQ==
X-Received: by 2002:a81:b548:: with SMTP id c8mr60585143ywk.465.1577991083544; 
 Thu, 02 Jan 2020 10:51:23 -0800 (PST)
Received: from [100.64.72.94] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id e131sm22168862ywb.81.2020.01.02.10.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2020 10:51:22 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <5A310C33-58F6-47F0-8892-1BE7D256A374@gmail.com>
Date: Thu, 2 Jan 2020 13:51:21 -0500
To: xen-devel <xen-devel@lists.xenproject.org>
X-Mailer: iPad Mail (17C54)
Subject: [Xen-devel] Making save/restore optional in toolstack,
 for edge/embedded derivatives
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============1661287179140193946=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1661287179140193946==
Content-Type: multipart/alternative; boundary=Apple-Mail-C273E887-7134-4AD1-A20A-2FA7F7A199DA
Content-Transfer-Encoding: 7bit


--Apple-Mail-C273E887-7134-4AD1-A20A-2FA7F7A199DA
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Linux stubdom patches currently require qemu in dom0 for consoles [1], due t=
o the upstream toolstack need for save/restore.  Until a long-term solution i=
s available (multiple console support in xenconsoled), would tools maintaine=
rs consider a patch that made save/restore build-time configurable for the t=
oolstack?  This would avoid Xen edge/embedded derivatives having to patch do=
wnstream to remove save/restore, e.g. to avoid qemu in dom0.

Rich

https://github.com/marmarek/xen/commit/13c6d27259929eca56a11bd0dacbe55727422=
4d3


--Apple-Mail-C273E887-7134-4AD1-A20A-2FA7F7A199DA
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body dir="auto"><div dir="ltr"><span>Linux stubdom patches currently require qemu in dom0 for consoles [1], due to the upstream toolstack need for save/restore. &nbsp;Until a long-term solution is available (multiple console support in xenconsoled), would tools maintainers consider a patch that made save/restore build-time configurable for the toolstack? &nbsp;This would avoid Xen edge/embedded derivatives having to patch downstream to remove save/restore, e.g. to avoid qemu in dom0.</span><br><span></span><br><span>Rich</span></div><div dir="ltr"><span><br></span></div><div dir="ltr"><a href="https://github.com/marmarek/xen/commit/13c6d27259929eca56a11bd0dacbe557274224d3">https://github.com/marmarek/xen/commit/13c6d27259929eca56a11bd0dacbe557274224d3</a></div><div dir="ltr"><br></div></body></html>
--Apple-Mail-C273E887-7134-4AD1-A20A-2FA7F7A199DA--


--===============1661287179140193946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1661287179140193946==--

