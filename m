Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DCA6B0C9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 23:13:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnUiJ-0007Am-Dm; Tue, 16 Jul 2019 21:10:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0oM/=VN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hnUiI-0007Ah-Cf
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 21:10:18 +0000
X-Inumbo-ID: 1c8afa49-a80e-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1c8afa49-a80e-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 21:10:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563311417; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=ZYvMnyRVEqeOIZPLk6eKXvRa4adi6qdHTv18pyfrS30=;
 b=hxWbCfv+noSLvkopkYO6e9PZwILyHGQclXDu+lUJeSs1phm775y7vUliFc14l+vH2o0/uM90
 RionoQbMB4InB6FM3tO7+7aqnv/zlN3LelXeGLLmHsErD8abs+PBA3uh+Th8S/M9ydCdBgjB
 HXWxD6EIl4FftTmLupmkw70Dgkg=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mxa.mailgun.org with ESMTP id 5d2e3d38.7f18345af470-smtp-out-n03;
 Tue, 16 Jul 2019 21:10:16 -0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r1so22422011wrl.7
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2019 14:10:16 -0700 (PDT)
X-Gm-Message-State: APjAAAW23gb0dUHqpJOerWvYemX0bOD9t/ua4HxdXEoDxEMR8BKa9N8y
 aWlq0aer6tOySXCJ3cYYCUI5ubNEE/5kB3PF2MQ=
X-Google-Smtp-Source: APXvYqwJzGMDzsCyH4KjXRW1Sitc54/BfJCMZr7OLljbRdUQ4WwYqpIEOfsrU0jN4DXSIi0lNmIbwnLjZY1xq1aq4R4=
X-Received: by 2002:a5d:5012:: with SMTP id e18mr9270234wrt.166.1563311415303; 
 Tue, 16 Jul 2019 14:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <2f0d996d9fde04c1a12cee7a1cb58486cf7788d6.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <2f0d996d9fde04c1a12cee7a1cb58486cf7788d6.1563293545.git.ppircalabu@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 16 Jul 2019 15:09:38 -0600
X-Gmail-Original-Message-ID: <CABfawhn1Y0wYfsFtj6tZFBF4BD=3kAC=A-gwzGkyDfyxX2pyEg@mail.gmail.com>
Message-ID: <CABfawhn1Y0wYfsFtj6tZFBF4BD=3kAC=A-gwzGkyDfyxX2pyEg@mail.gmail.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH v2 08/10] xen-access: Use getopt_long for
 cmdline parsing
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
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTE6MDYgQU0gUGV0cmUgUGlyY2FsYWJ1CjxwcGlyY2Fs
YWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNpbXBsaWZpZXMgdGhlIGNvbW1h
bmQgbGluZSBwYXJzaW5nIGxvZ2ljIGFuZCBtYWtlcyBpdCBlYXNpZXIgdG8KPiBhZGQgbmV3IHRl
c3QgcGFyYW1ldGVycy4KPgo+IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNh
bGFidUBiaXRkZWZlbmRlci5jb20+CgpUaGFua3MsIHRoaXMgd2FzIG11Y2ggbmVlZGVkLgoKQWNr
ZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
