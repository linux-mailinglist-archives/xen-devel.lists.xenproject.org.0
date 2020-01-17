Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1CE140DA7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 16:16:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isTJh-00077T-1X; Fri, 17 Jan 2020 15:13:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b9RF=3G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1isTJf-00077O-2A
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 15:13:43 +0000
X-Inumbo-ID: edace196-393b-11ea-8e9a-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edace196-393b-11ea-8e9a-bc764e2007e4;
 Fri, 17 Jan 2020 15:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579274014;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tR8JPZbHUxcZYXs3lZBKPNz8XTBMiBMdbSOleTglRB8=;
 b=PsMSRXeEGo/JtnRfZ0Wr2+7+X/OBrUWLAHjSAy0lT4OGrPzVTldbCO1c
 6JsdTFBB3RUYt8ZVNZOfjaDlolFXsMF0Wlu9XjjT865qkvxqM5RfHWg2d
 EtUNhHTk8pjFhv87vliSUQ/AosmSnFQ2ueVxRG7tC56Gcj/0kXrFiXAmr Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MsqHqo/exLDBnrLIXYxKtkRAkIRd8DjhZPa9DS0cCXIi5VRV8F/SHzhPUKSaKvvctb3jOKo46/
 Nm6wmJ0zJxkLagzwnNszZjvEsnU/lFq3kluQOaxXk6fMMUQxOwxdelpkuM21DBBOcpGjBW4dv/
 kc9WUZeUnFl0Eq41vtfo8XYJD6Kl6jTuxkCBU6XSjgsGcLrks6RH+Bie/lbsWRu3sfbcI2st6q
 dVrqNu9WhdtryEZERBHTNHTECnHKBii+dEVWkczpONl4H4/1u7OR2f1p0PPyhXCHTCMFA4qFn1
 0OY=
X-SBRS: 2.7
X-MesageID: 11445514
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11445514"
Date: Fri, 17 Jan 2020 16:13:24 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200117151324.GS11756@Air-de-Roger>
References: <20200117143955.18892-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117143955.18892-1-jgross@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/blkfront: limit allocated memory size
 to actual use case
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
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgMDM6Mzk6NTVQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBUb2RheSB0aGUgWGVuIGJsa2Zyb250IGRyaXZlciBhbGxvY2F0ZXMgbWVtb3J5IGZv
ciBvbmUgc3RydWN0Cj4gYmxrZnJvbnRfcmluZ19pbmZvIGZvciBlYWNoIGNvbW11bmljYXRpb24g
cmluZy4gVGhpcyBzdHJ1Y3R1cmUgaXMKPiBzdGF0aWNhbGx5IHNpemVkIGZvciB0aGUgbWF4aW11
bSBzdXBwb3J0ZWQgY29uZmlndXJhdGlvbiByZXN1bHRpbmcKPiBpbiBhIHNpemUgb2YgbW9yZSB0
aGFuIDkwIGtCLgo+IAo+IEFzIHRoZSBtYWluIHNpemUgY29udHJpYnV0b3IgaXMgb25lIGFycmF5
IGluc2lkZSB0aGUgc3RydWN0LCB0aGUKPiBtZW1vcnkgYWxsb2NhdGlvbiBjYW4gZWFzaWx5IGJl
IGxpbWl0ZWQgYnkgbW92aW5nIHRoaXMgYXJyYXkgdG8gYmUKPiB0aGUgbGFzdCBzdHJ1Y3R1cmUg
ZWxlbWVudCBhbmQgdG8gYWxsb2NhdGUgb25seSB0aGUgbWVtb3J5IGZvciB0aGUKPiBhY3R1YWxs
eSBuZWVkZWQgYXJyYXkgc2l6ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CgpBY2tlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CgpUaGFua3MhIEl0IHdvdWxkIGJlIG5pY2UgdG8gYmFja3BvcnQgdGhpcywgYnV0
IEknbSBub3Qgc3VyZSBpdCB3b3VsZApxdWFsaWZ5IGFzIGEgYnVnIGZpeC4KClJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
