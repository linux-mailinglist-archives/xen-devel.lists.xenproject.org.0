Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C123AB96E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 15:39:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6EQL-0003XY-Hm; Fri, 06 Sep 2019 13:37:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6EQK-0003XO-2C
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 13:37:12 +0000
X-Inumbo-ID: 6d5ecf84-d0ab-11e9-abf6-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d5ecf84-d0ab-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 13:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567777030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aP2jU86ow+ZCsy7eLtoUNsDJIbCdWw8H/5F2MhRRe90=;
 b=fsoosfJ2/ARluM9pMeBkyEHGOdekgnZzyaNh54VAUZXZdOk2M+kPH//S
 5SmJyHwX1LoT5WW1GLN5MxHO8pWqc172IMMHuhKj9mLYt2JckbxKfsZtJ
 OrcQO5SsvR8iTYKEPm33zthVVTD3+rheolaSPKn04Z6htmTgoFi5y+oqH k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RNWVhuMgscsutWcqvp91Go7LVusObrxD4UO5TQf1c2uJmTue7gKw7YY2BPfx8j5pV+mIlHKT6M
 hngcbkDlMqNn18vVurak4GuKkfF44aOsI/ddq4gBQUJLdXWtcKD/JNsQXd3TgP+jjpMcUpQrgN
 1c3Z5FINkmKHoKEtpfvSQSE23oEB/uZoMCC081JvGz7NoqpPO8aSHnHE7FnXYa7AVcYntnr8pr
 39XKRezNimLHcq5Gi5VbeBmLvPAVcJyYRxW2RSkqUZk1HimIy+kjQSg04CCO+sNd60hic+mCPI
 brM=
X-SBRS: 2.7
X-MesageID: 5512891
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5512891"
Date: Fri, 6 Sep 2019 15:37:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190906133702.bnf4sovrtreusgro@Air-de-Roger>
References: <20190905160424.6686-1-roger.pau@citrix.com>
 <e210725e-78f5-67fd-14ba-113598278512@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e210725e-78f5-67fd-14ba-113598278512@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] xstate: make use_xsave non-init
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDM6MzM6NTBQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDUuMDkuMjAxOSAxODowNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L3hzdGF0ZS5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYveHN0YXRlLmMK
PiA+IEBAIC01NzcsNyArNTc3LDExIEBAIHVuc2lnbmVkIGludCB4c3RhdGVfY3R4dF9zaXplKHU2
NCB4Y3IwKQo+ID4gIC8qIENvbGxlY3QgdGhlIGluZm9ybWF0aW9uIG9mIHByb2Nlc3NvcidzIGV4
dGVuZGVkIHN0YXRlICovCj4gPiAgdm9pZCB4c3RhdGVfaW5pdChzdHJ1Y3QgY3B1aW5mb194ODYg
KmMpCj4gPiAgewo+ID4gLSAgICBzdGF0aWMgYm9vbCBfX2luaXRkYXRhIHVzZV94c2F2ZSA9IHRy
dWU7Cj4gPiArICAgIC8qCj4gPiArICAgICAqIE5COiB1c2VfeHNhdmUgY2Fubm90IGxpdmUgaW4g
aW5pdGRhdGEgYmVjYXVzZSBsbHZtIG1pZ2h0IG9wdGltaXplCj4gPiArICAgICAqIHJlYWRpbmcg
aXQsIHNlZTogaHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9pZD0zOTcwNwo+ID4g
KyAgICAgKi8KPiA+ICsgICAgc3RhdGljIGJvb2wgdXNlX3hzYXZlID0gdHJ1ZTsKPiA+ICAgICAg
Ym9vbGVhbl9wYXJhbSgieHNhdmUiLCB1c2VfeHNhdmUpOwo+ID4gIAo+ID4gICAgICBib29sIGJz
cCA9IGMgPT0gJmJvb3RfY3B1X2RhdGE7Cj4gCj4gSSB0aGluayB3ZSdkIHdhbnQgdG8gdXNlIF9f
cmVhZF9tb3N0bHkgdGhlbiBpbnN0ZWFkLiBDYW4gYmUgYWRkZWQKPiB3aGlsZSBjb21taXR0aW5n
IG9mIGNvdXJzZSwgaWYgeW91IGFncmVlLiBXaXRoIHRoZSBhZGRpdGlvbgo+IEFja2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpZZXMsIHRoYXQgc2VlbXMgT0sgdG8gbWUu
IEZlZWwgZnJlZSB0byBleHBhbmQgdGhlIGNvbW1pdCBtZXNzYWdlIHRvCm1lbnRpb24gdGhlIGNo
YW5nZSB0byByZWFkX21vc3RseSBpZiB5b3Ugd2FudC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
