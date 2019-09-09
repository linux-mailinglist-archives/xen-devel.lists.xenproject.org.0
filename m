Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E3ADAF7
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:15:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7KOH-0007ZF-1A; Mon, 09 Sep 2019 14:11:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiN8=XE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7KOG-0007ZA-3M
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:11:36 +0000
X-Inumbo-ID: b80e9a16-d30b-11e9-ac0c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b80e9a16-d30b-11e9-ac0c-12813bfff9fa;
 Mon, 09 Sep 2019 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568038290;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=6g2MQQ8cbWIPyd3bBIeIrhN3K7jjfTjYCAGkz94Vu/E=;
 b=OsvleA7CwvOjc+wutYnEb3UhgtDzJuxuxrKRCRhe9aodyquwezidwizN
 PrYKn3PPn8q4qwoa2aF2zkqWqRcS2nn6Ul0cj4ReXBru9m0AZW243XPI7
 OeDq8VC3BOdnAVknhBnQGnsCFVgYeCo9B9HHEwswXiMH5Zh1m01BMdofI k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eYRJxShTw3cOtrbLPze1k7bfF+b0FWJoOGxl+BlQyZiOXqPB76c2c/W4P3uejT0TWeO86O+VOx
 OAE8ed8iKien9cQaPc10YdNL5gms868RI7SzyyLD3O30CjF2sS+xTfL1K8bWfcxDchLRbvGJlP
 aGbRoys2kdODnIOGnlpkvZ6V0KeNu2j1/ntPHM3k9ga001Tz5Qi6IDoCMhAmeh4gHUY2wLFlKW
 ywPIOnfPuPNqK4Ebt7p79IlppJWX0XDXDpM+IigjkB42EeVODT+Yyh1dnihLQ2h5UAm42Td0Cr
 rHU=
X-SBRS: 2.7
X-MesageID: 5317246
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,484,1559534400"; 
   d="scan'208";a="5317246"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23926.23920.517188.114846@mariner.uk.xensource.com>
Date: Mon, 9 Sep 2019 15:10:56 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20190906143021.28261-3-roger.pau@citrix.com>
References: <20190906143021.28261-1-roger.pau@citrix.com>
 <20190906143021.28261-3-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 2/2] sysctl/libxl: choose a sane default
 for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim  \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCB2MyAyLzJdIHN5c2N0bC9saWJ4bDogY2hv
b3NlIGEgc2FuZSBkZWZhdWx0IGZvciBIQVAiKToKPiBDdXJyZW50IGxpYnhsIGNvZGUgd2lsbCBh
bHdheXMgZW5hYmxlIEhhcmR3YXJlIEFzc2lzdGVkIFBhZ2luZyAoSEFQKSwKPiBleHBlY3Rpbmcg
dGhhdCB0aGUgaHlwZXJ2aXNvciB3aWxsIGZhbGxiYWNrIHRvIHNoYWRvdyBpZiBIQVAgaXMgbm90
Cj4gYXZhaWxhYmxlLiBXaXRoIHRoZSBjaGFuZ2VzIHRvIHRoZSBkb21haW4gYnVpbGRlciB0aGF0
J3Mgbm90IHRoZSBjYXNlCj4gYW55IGxvbmdlciwgYW5kIHRoZSBoeXBlcnZpc29yIHdpbGwgcmFp
c2UgYW4gZXJyb3IgaWYgSEFQIGlzIG5vdAo+IGF2YWlsYWJsZSBpbnN0ZWFkIG9mIHNpbGVudGx5
IGZhbGxpbmcgYmFjayB0byBzaGFkb3cuCj4gCj4gSW4gb3JkZXIgdG8ga2VlcCB0aGUgcHJldmlv
dXMgZnVuY3Rpb25hbGl0eSByZXBvcnQgd2hldGhlciBIQVAgaXMKPiBhdmFpbGFibGUgb3Igbm90
IGluIFhFTl9TWVNDVExfcGh5c2luZm8sIHNvIHRoYXQgdGhlIHRvb2xzdGFjayBjYW4KPiBzZWxl
Y3QgYSBzYW5lIGRlZmF1bHQgaWYgdGhlcmUncyBubyBleHBsaWNpdCB1c2VyIHNlbGVjdGlvbiBv
ZiB3aGV0aGVyCj4gSEFQIHNob3VsZCBiZSB1c2VkLgo+IAo+IE5vdGUgdGhhdCBvbiBBUk0gaGFy
ZHdhcmUgSEFQIGNhcGFiaWxpdHkgaXMgYWx3YXlzIHJlcG9ydGVkIHNpbmNlIGl0J3MKPiBhIHJl
cXVpcmVkIGZlYXR1cmUgaW4gb3JkZXIgdG8gcnVuIFhlbi4KPiAKPiBGaXhlczogZDBjMGJhN2Qz
ZGUgKCd4ODYvaHZtL2RvbWFpbjogcmVtb3ZlIHRoZSAnaGFwX2VuYWJsZWQnIGZsYWcnKQo+IFNp
Z25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IFJl
dmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IEFja2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
