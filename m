Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED7CE8BDF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:35:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPTUn-0005yu-CI; Tue, 29 Oct 2019 15:33:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPTUm-0005yo-Km
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:33:20 +0000
X-Inumbo-ID: 6e272e9b-fa61-11e9-9515-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e272e9b-fa61-11e9-9515-12813bfff9fa;
 Tue, 29 Oct 2019 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572363198;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=QKT/EN2cKz1ER9oh+qPeZgOZ0wJcsllVVmTlXpHqWRI=;
 b=gXd2wRZZdF0dMHxhxBltzLW98nphQwju1fbQ8vReNDohBoHTRoMKwb71
 uz0URxtYXaq29IskXtlPI06tXtBRVvjIqvsTwEo6dAwur2xFJbqVOBc6f
 gGGrxcJ8/ONmeXFphZf3dDt7MhFnNNqOuuqWYiGjyfKMqnpBC1ZvW6GwU c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cCi62VsAv8tZigJjmFSaMX52E3kKgJxwuDgnBc+HdZ5gvlcy1RZsdNgoRO/yF39vP2j7JbXd+4
 R1cMDMCi4JD0pz+dWBRt4TmOkBzmHIng60xvl5UF0VmU1sW3yVmUFHIIeEr2ORc9X+tihxS/A0
 LlAKVpGj8iyf3Gdgf8auLiwxOfxOdbaw3TvPJQ00tKHnZTmSJQaFiGVh2Xs1VL1GaHZ/hqslpG
 zvC2d0HA9f6O2aGcY3cduwMWDHxc8Ml2RBuI5zLUmo3roqMRZ6t9YMoL//kcN62TKmcf6lRFGc
 bCM=
X-SBRS: 2.7
X-MesageID: 8033394
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="8033394"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23992.23483.357316.284205@mariner.uk.xensource.com>
Date: Tue, 29 Oct 2019 15:33:15 +0000
To: Julien Grall <julien@xen.org>
In-Reply-To: <34a525d9-d9e2-b860-d238-7070670599a1@xen.org>
References: <20191028182216.3882-1-al1img@gmail.com>
 <20191028182216.3882-2-al1img@gmail.com>
 <34a525d9-d9e2-b860-d238-7070670599a1@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 1/1] libxl/gentypes: add range init to
 array elements in json parsing
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
Cc: "wl@xen.org" <wl@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Oleksandr Grytsov <al1img@gmail.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjEgMS8xXSBsaWJ4
bC9nZW50eXBlczogYWRkIHJhbmdlIGluaXQgdG8gYXJyYXkgZWxlbWVudHMgaW4ganNvbiBwYXJz
aW5nIik6Cj4gSSBoYXZlIG1hZGUgc29tZSBjb21tZW50cyByZWdhcmRpbmcgdGhlIHBhdGNoIGlu
IHRoZSBvcmlnaW5hbAo+IHRocmVhZC4gV2hpbGUgSSBhbSBub3QgYSBsaWJ4bCBleHBlcnQsIGl0
IHdvdWxkIGhhdmUgYmVlbiBuaWNlIHRvCj4gYWRkcmVzcyB0aGVtIG9yIGF0IGxlYXN0IGV4cGxh
aW4gd2h5IHRoZXkgd2VyZW4ndCBhZGRyZXNzZWQuCgpZZXMuCgo+IEkgd2lsbCByZXBlYXQgdGhl
bSBoZXJlIGZvciBjb252ZW5pZW5jZS4KClRoYW5rcy4gIEl0IGxvb2tzIGxpa2Ugb3VyIG1haWxz
IGFib3V0IHRoaXMgcGF0Y2ggY3Jvc3NlZC4KCj4gTXkga25vd2xlZGdlIG9mIGxpYnhsIGlzIHF1
aXRlIGxpbWl0ZWQuIEJ1dCBJIGRvbid0IHRoaW5rIHRoaXMgaXMKPiBjb3JyZWN0LCB5b3Ugd2Fu
dCB0byBjYWxsIGluaXRfZm4gd2hldGhlciB0aGlzIGhhcyBiZWVuCj4gYXV0b2dlbmVyYXRlZCBv
ciBub3QuCgpZZXMuCgo+IEkgYW0gYWxzbyBub3QgZW50aXJlbHkgc3VyZSB3aGV0aGVyIHdlIHNo
b3VsZCBhbHNvIGNhdGVyIHRoZQo+IHR5LmluaXRfdmFsICE9IE5vbmUgYXMgd2VsbCBoZXJlLgoK
V2Ugc2hvdWxkLgoKSSBoYXZlIGEgcmV2aXNlZCBwYXRjaC4gIEl0IG1ha2VzIG5vIGRpZmZlcmVu
Y2UgdG8gdGhlIEMgb3V0cHV0LApjb21wYXJlZCB0byBPbGVrc2FuZHIncyBwYXRjaC4gIEkgYXNz
dW1lIHdlIGhhdmUgbm8gYXJyYXlzIG9mIHRoaW5ncwp3aXRoIGFuIGluaXRfdmFsLi4uCgpJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
