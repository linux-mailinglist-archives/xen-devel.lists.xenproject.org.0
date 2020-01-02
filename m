Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A45212E970
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 18:32:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in4IJ-0007GL-2t; Thu, 02 Jan 2020 17:29:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h/dY=2X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1in4II-0007GG-1S
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 17:29:58 +0000
X-Inumbo-ID: 7ea019a6-2d85-11ea-a3a1-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ea019a6-2d85-11ea-a3a1-12813bfff9fa;
 Thu, 02 Jan 2020 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577986198;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=mLnkqup8Jif3VApSlqMOfNyGsFzZUqN8Fyl4tn/nRsc=;
 b=Q23SMDQ3HZOkoTg7fSVf626TlIGx5bEsISHMyQTvR9rPsg4+z92lqPR2
 aeUyduzLtboSHaP5A3b2nlXJSHMQLLgDYX+EYd1Nnpv3MQ0DRhNQli+F+
 6z2nEYL8ERtGucQTr2FuuvYcqOqKJUl0yasOyPF9JvS4YUovBUXYIZ/sr o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5mOLq0y9/Wn7zasiMrbaHw687Pu8Yl7plFJvWKjGO8zADWYRdiJ0WAQKcfa+OnOP0kDH58z1E4
 /8B3doOPl5KxrcX9YrzkI9uR29BGpyRCnRazlUuvG1nUQMwejtvPkLNcSx/4prN1391WlKMDsh
 6IT/op0x9WnGFewe1CYBHDoknHnAth36bXugY2OKJJ4rs0Q/5YT91mv+oY7pczejPt6gkbD1pU
 UW9AOh8/MQfaVfmqxU1lLvB5+RlNBz8w2DEebDBxiLYAozQZX3J8I/kwVZPLPAEPeSZaVe4s9N
 RvU=
X-SBRS: 2.7
X-MesageID: 10541396
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10541396"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24078.10385.878947.19392@mariner.uk.xensource.com>
Date: Thu, 2 Jan 2020 17:29:53 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20191224130416.3570-7-pdurrant@amazon.com>
References: <20191224130416.3570-1-pdurrant@amazon.com>
 <20191224130416.3570-7-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 6/6] xl: allow specified domain id to be
 used for create, restore and migrate
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCA2LzZdIHhsOiBhbGxvdyBzcGVjaWZpZWQgZG9t
YWluIGlkIHRvIGJlIHVzZWQgZm9yIGNyZWF0ZSwgcmVzdG9yZSBhbmQgbWlncmF0ZSIpOgo+IFRo
aXMgcGF0Y2ggYWRkcyB0aGUgb3B0aW9uIHRvIHVzZSBhIHNwZWNpZmllZCBkb21haW4gaWQgdG8g
YmUgdXNlZCBmb3IKPiB0aGUgY3JlYXRlLCByZXN0b3JlIGFuZCBtaWdyYXRlIGxpZmVjeWNsZSBv
cGVyYXRpb25zIGFuZCBkb2N1bWVudGF0aW9uCj4gdGhlcmVvZi4KCkkgYXBwcm92ZSBvZiB0aGUg
aWRlYSB0aGF0IHRoZSB4bCB1c2VyIGNhbiBzcGVjaWZ5IHRoZSBkb21pZC4gIEJ1dDoKCldoeSBz
aG91bGQgdGhpcyBiZSBhIGNvbW1hbmQgbGluZSBhcmd1bWVudCB0byB4bCwgcmF0aGVyIHRoYW4g
YSBkb21haW4KY29uZmlnIHBhcmFtZXRlciA/ICBPYnZpb3VzbHkgdGhlcmUgbmVlZHMgdG8gYmUg
YSB3YXkgdG8gb3ZlcnJpZGUgdGhlCmNob2ljZSwgZXNwZWNpYWxseSB0byBtYWtlIGxvY2FsaG9z
dCBtaWdyYXRpb24gd29yaywgYnV0IHRoZXJlIGlzCmFscmVhZHkgYSB3YXkgdG8gc3BlY2lmeSBl
eHRyYSBjb25maWcgb24gZG9tYWluIGNyZWF0ZSwgYXQgbGVhc3QuCgpUaGFua3MsCklhbi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
