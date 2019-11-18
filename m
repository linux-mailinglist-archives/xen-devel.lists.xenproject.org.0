Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177B2100AE4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 18:53:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWlA1-0001WA-RZ; Mon, 18 Nov 2019 17:50:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vqm6=ZK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iWlA0-0001W0-BP
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 17:50:00 +0000
X-Inumbo-ID: d6ce01ce-0a2b-11ea-a2dd-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6ce01ce-0a2b-11ea-a2dd-12813bfff9fa;
 Mon, 18 Nov 2019 17:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574099400;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=99OnaYuFlFdDtJdyB5mdo08bj8yMp6Ken5jblxPNSMY=;
 b=A/SFVhFQKDRsDJhMDoupy8D1+cmzdcNhKhXiTFQOtUYbCdrwaRBuo3y4
 lezPHr4B2bSXR4xKslLfbkGXDdPE+fpXfyl/err01Y8e7wF/n6KPkqR98
 CmWSYCgL68A5DYazy0rfGyEuLKAMGlGW3XmsoQu/xdurhC+7Q95tuFweW Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fZrEReBve1noSbWMBITGa9JR/VDHc0JtKjhVU5WNNgKfkiGkGOTKogaqp9XqR47HSbS0ltkqGE
 WUL0vSzkqOPJlrGP3n2iXT9Tih9Htqwp3U1Ub2M/VpYQGvWWz2E/7fjsX6o+L4jA9rKPqOWkXD
 QkhkC/uNl0yqAPkwa5iGJqunhGaBHlVcPWR7mWrY+ce3W4HF49kz+1/g9NlXr+iz0edBJ27Vn4
 M90D7hTcOm7BgYOMVcnZW378ufRVA1cN8NjkQMBHPYalHNrW5l3t0hS7BlVwzzPb5uYDIfiElT
 23E=
X-SBRS: 2.7
X-MesageID: 8478150
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,321,1569297600"; 
   d="scan'208";a="8478150"
Date: Mon, 18 Nov 2019 17:49:56 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191118174956.GD1425@perard.uk.xensource.com>
References: <20191118171309.1459302-1-anthony.perard@citrix.com>
 <20191118171309.1459302-7-anthony.perard@citrix.com>
 <24018.54449.703124.372517@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24018.54449.703124.372517@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3 6/7] libxl: Introduce
 libxl__ev_immediate
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

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDU6Mjg6MTdQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xMyB2MyA2Lzdd
IGxpYnhsOiBJbnRyb2R1Y2UgbGlieGxfX2V2X2ltbWVkaWF0ZSIpOgo+ID4gVGhpcyBuZXcgZXYg
YWxsb3dzIHRvIGFycmFuZ2UgYSBub24tcmVlbnRyYW50IGNhbGxiYWNrIHRvIGJlIGNhbGxlZC4K
PiA+IFRoaXMgaGFwcGVuIGltbWVkaWF0ZWx5IGFmdGVyIHRoZSBjdXJyZW50IGV2ZW50IGlzIHBy
b2Nlc3NlZCBhbmQgYWZ0ZXIKPiA+IG90aGVyIGV2X2ltbWVkaWF0ZXMgdGhhdCB3b3VsZCBoYXZl
IGFscmVhZHkgYmVlbiByZWdpc3RlcmVkLgo+IAo+IFRoYW5rcyBmb3IgZG9pbmcgdGhpcyB3b3Jr
Lgo+IAo+ID4gKyAgICBMSUJYTF9UQUlMUV9GT1JFQUNIX1NBRkUoZWksICZlZ2MtPmV2X2ltbWVk
aWF0ZXMsIGVudHJ5LCBlaV90bXApIHsKPiA+ICsgICAgICAgIExJQlhMX1RBSUxRX1JFTU9WRSgm
ZWdjLT5ldl9pbW1lZGlhdGVzLCBlaSwgZW50cnkpOwo+IAo+IEkgdGhpbmsgTElCWExfVEFJTFFf
Rk9SRUFDSF9TQUZFIGlzIG5vdCBzYWZlIGVub3VnaCBoZXJlLgo+IGVpLT5jYWxsYmFjayBtaWdo
dCAqYWRkKiB0aGluZ3MgdG8gZWdjLT5ldl9pbW1lZGlhdGVzLiAgVGhlIG1hbnBhZ2UKPiBqdXN0
IHNheXMKPiAKPiAgICAgIEhvd2V2ZXIsIHVubGlrZSB0aGVpciB1bnNhZmUgY291bnRlcnBhcnRz
LCBUQUlMUV9GT1JFQUNIIGFuZAo+ICAgICAgVEFJTFFfRk9SRUFDSF9SRVZFUlNFIHBlcm1pdCB0
byBib3RoIHJlbW92ZSB2YXIgYXMgd2VsbCBhcyBmcmVlCj4gICAgICBpdCBmcm9tIHdpdGhpbiB0
aGUgbG9vcCBzYWZlbHkgd2l0aG91dCBpbnRlcmZlcmluZyB3aXRoIHRoZQo+ICAgICAgdHJhdmVy
c2FsLgo+IAo+IEkgY2FuJ3QgZmluZCBhbiBleHBsaWNpdCBzdGF0ZW1lbnQgYWJvdXQgdGhlIGFs
bG93YWJsZSBjaGFuZ2VzIHdpdGgKPiBMSUJYTF9UQUlMUV9GT1JFQUNIIGJ1dCBJIGV4cGVjdCB0
aGV5IGFyZSAibm9uZSIuICBTZWUgdGhlIGxvb3AgaW4KPiBhb19fYWJvcnQgZm9yIHdoYXQgSSB0
aGluayBpcyB0aGUgY29ycmVjdCBwYXR0ZXJuIChhbGJlaXQgZW1iZWRkZWQgaW4KPiBzb21ldGhp
bmcgbW9yZSBjb21wbGV4KS4KClNvdW5kIGdvb2QuIEknbGwgYWxzbyBzd2l0Y2ggdG8gU1RBSUxR
IGluc3RlYWQsIHNpbmdsZS1saW5rIHRhaWwgcXVldWUKZm9yIGEgRklGTyBsaXN0LgoKVGhhbmtz
LAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
