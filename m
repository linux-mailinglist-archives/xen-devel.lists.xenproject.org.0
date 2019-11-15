Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DAFFE249
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 17:08:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVe6V-0002JI-Ei; Fri, 15 Nov 2019 16:05:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ISM0=ZH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iVe6T-0002JD-U3
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 16:05:45 +0000
X-Inumbo-ID: c7899c1c-07c1-11ea-9631-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7899c1c-07c1-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 16:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573833945;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=R+e1Qm19yvRLNCdIEV/PWytwwFYC2MX1ghD17FYGXzc=;
 b=idj1yL045AHyPrshgEc6JDi3xdd3x77U1MfzpXHPB4xu3+gZaqssj/Fs
 mlzvJqx2JxuBy0nmnDALMeLTWMBWlex7sGaqQZua3WubgVBv7HVR7tSFb
 R0IQi+OKJ5ZU+7F7cazFBaEfcEWC5+1Uv2QjmMfVQHEyiYoNSxq1q2xrS c=;
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
IronPort-SDR: KW+p3K25T/xYnHHtA192/8qb+CpO3wvKAbY8Efxa/c0fixfHy9VO8ripfkw61/Sn8WgTOWQ7M9
 pvX6BoMK24h/kjqhamMkA205nC3UlcaJ0EjrR74fBo0w28Z/I5X5yk/74ZXkj9HmEhk4JlmCWu
 GcWDudOdjssrLleVQTYJTSEy0LKBzZXuOjFUZxR/dKLiHmMm4jJiKTa9GW7cRyEKKGAd+0EMhr
 fJVyVquBvrumx9T1pnhgUXpor7Ub+CCgcBhfpk8T3aM+7LdW3GDdqOMAprkv3zxZnb83wjYLyQ
 IVY=
X-SBRS: 2.7
X-MesageID: 8505893
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8505893"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24014.52437.757470.244618@mariner.uk.xensource.com>
Date: Fri, 15 Nov 2019 16:05:41 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191030180704.261320-2-anthony.perard@citrix.com>
References: <20191030180704.261320-1-anthony.perard@citrix.com>
 <20191030180704.261320-2-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 1/6] libxl: Introduce
 libxl__ev_child_kill_deregister
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xMyB2MiAxLzZdIGxpYnhs
OiBJbnRyb2R1Y2UgbGlieGxfX2V2X2NoaWxkX2tpbGxfZGVyZWdpc3RlciIpOgo+IEFsbG93IHRv
IGRlcmVnaXN0ZXIgdGhlIGNhbGxiYWNrIGFzc29jaWF0ZWQgd2l0aCBhIGNoaWxkIGRlYXRoIGV2
ZW50Lgo+IAo+IFRoZSBkZWF0aCBpc24ndCBpbW1lZGlhdGUgd2lsbCBuZWVkIHRvIGJlIGNvbGxl
Y3RlZCBsYXRlciwgc28gdGhlCj4gZXZfY2hpbGQgbWFjaGluZXJ5IHJlZ2lzdGVyIGl0cyBvd24g
Y2FsbGJhY2suCj4gCj4gbGlieGxfX2V2X2NoaWxkX2tpbGxfZGVyZWdpc3RlcigpIG1pZ2h0IGJl
IGNhbGxlZCBieSBhbiBBTyBvcGVyYXRpb24KPiB0aGF0IGlzIGZpbmlzaGluZy9jbGVhbmluZyB1
cCB3aXRob3V0IGEgY2hhbmNlIGZvciBsaWJ4bCB0byBiZQo+IG5vdGlmaWVkIG9mIHRoZSBjaGls
ZCBkZWF0aCAodmlhIFNJR0NITEQpLiBTbyBpdCBpcyBwb3NzaWJsZSB0aGF0IHRoZQo+IGFwcGxp
Y2F0aW9uIGNhbGxzIGxpYnhsX2N0eF9mcmVlKCkgd2hpbGUgdGhlcmUgYXJlIHN0aWxsIGNoaWxk
IGFyb3VuZC4KPiBUbyBhdm9pZCB0aGUgYXBwbGljYXRpb24gZ2V0dGluZyB1bmV4cGVjdGVkIFNJ
R0NITEQsIHRoZSBsaWJ4bF9fYW8KPiByZXNwb25zaWJsZSBmb3Iga2lsbGluZyBhIGNoaWxkIHdp
bGwgaGF2ZSB0byB3YWl0IHVudGlsIGl0IGhhcyBiZWVuCj4gcHJvcGVybHkgcmVhcGVkLgoKVmVy
eSBnb29kLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
