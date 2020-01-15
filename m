Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D27F13C0D9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:27:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irhjz-0006Fc-EU; Wed, 15 Jan 2020 12:25:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OV/N=3E=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1irhjx-0006FU-VO
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:25:41 +0000
X-Inumbo-ID: 228d42d0-3792-11ea-8530-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 228d42d0-3792-11ea-8530-12813bfff9fa;
 Wed, 15 Jan 2020 12:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579091137;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=QU+QsZGLiAuVR2VvWBe1vmc/PzMsZ0xzlq411P9o1LQ=;
 b=BQv9mqcD0iSfasuWIue5/AsqMGBkEkW6XmtL9fdHy8GOiNry8mGAu5Ih
 eHM2xBLVkbA1XZhDBN8aPlqeI6+pgyGTD7sIhK6Ckw6lOFvS+kA11PVK/
 WCckhB1btGkDpRh49NfLLPYy4Pm/Oq0spOYNg0g34ecprmgKrcuNldKhJ s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ps7oKOWpAuVZ1w/NMw+XehqQA+Y4Y4tenw8RW0OTW7BjlX9mgTzqtrqL95aynEkPR9fzToU68G
 3ZzbfIAukZKTLreNoHjrZd0BTg/EZsLwVAYlmm4nsPiTpQsTAgbjQqCf0ewOd3SA+XajgoJT9e
 FMHVJcpUga0Lq9JowNd2DcbJEQBlCSBezsZ/YLpT62cvXy7s4T7OgCsF51r0o1N5ja6jd9V58H
 6I3CclhDQfgumiUJzQlUPSefGMwHYxBt0W8BMUvYQjk0FqGg+JBSXyZjbj14DqbUC8MHxHuRFz
 eCk=
X-SBRS: 2.7
X-MesageID: 11370448
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="11370448"
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <af5e509b-e24e-2fcc-c131-bb63e9e40790@citrix.com>
Date: Wed, 15 Jan 2020 12:25:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDEvMjAyMCAxMTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTUuMDEuMjAyMCAx
MDo0NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gVHVlLCBKYW4gMTQsIDIwMjAgYXQg
MDc6MzY6MjFQTSArMDAwMCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJj
aC94ODYvdGltZS5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvdGltZS5jCj4+PiBAQCAtOTU1LDEw
ICs5NTUsMTYgQEAgdTY0IHN0aW1lMnRzYyhzX3RpbWVfdCBzdGltZSkKPj4+ICAKPj4+ICB2b2lk
IGNzdGF0ZV9yZXN0b3JlX3RzYyh2b2lkKQo+Pj4gIHsKPj4+ICsgICAgc3RydWN0IGNwdV90aW1l
ICp0ID0gJnRoaXNfY3B1KGNwdV90aW1lKTsKPj4+ICsKPj4+ICAgICAgaWYgKCBib290X2NwdV9o
YXMoWDg2X0ZFQVRVUkVfTk9OU1RPUF9UU0MpICkKPj4+ICAgICAgICAgIHJldHVybjsKPj4+ICAK
Pj4+IC0gICAgd3JpdGVfdHNjKHN0aW1lMnRzYyhyZWFkX3BsYXRmb3JtX3N0aW1lKE5VTEwpKSk7
Cj4+PiArICAgIHQtPnN0YW1wLm1hc3Rlcl9zdGltZSA9IHJlYWRfcGxhdGZvcm1fc3RpbWUoTlVM
TCk7Cj4+PiArICAgIHQtPnN0YW1wLmxvY2FsX3RzYyA9IHN0aW1lMnRzYyh0LT5zdGFtcC5tYXN0
ZXJfc3RpbWUpOwo+Pj4gKyAgICB0LT5zdGFtcC5sb2NhbF9zdGltZSA9IHQtPnN0YW1wLm1hc3Rl
cl9zdGltZTsKPj4+ICsKPj4+ICsgICAgd3JpdGVfdHNjKHQtPnN0YW1wLmxvY2FsX3RzYyk7Cj4+
Cj4+IEluIG9yZGVyIHRvIGF2b2lkIHRoZSBUU0Mgd3JpdGUgKGFuZCB0aGUgbGlrZWx5IGFzc29j
aWF0ZWQgdm1leGl0KSwKPj4gY291bGQgeW91IGluc3RlYWQgZG86Cj4+Cj4+IHQtPnN0YW1wLmxv
Y2FsX3N0aW1lID0gdC0+c3RhbXAubWFzdGVyX3N0aW1lID0gcmVhZF9wbGF0Zm9ybV9zdGltZShO
VUxMKTsKPj4gdC0+c3RhbXAubG9jYWxfdHNjID0gcmR0c2Nfb3JkZXJlZCgpOwo+Pgo+PiBJIHRo
aW5rIGl0IHNob3VsZCBhY2hpZXZlIHRoZSBzYW1lIGFzIGl0IHN5bmNzIHRoZSBsb2NhbCBUU0Mg
c3RhbXAgYW5kCj4+IHRpbWVzLCB3b3VsZCBhdm9pZCB0aGUgVFNDIHdyaXRlIGFuZCBzbGlnaHRs
eSBzaW1wbGlmaWVzIHRoZSBsb2dpYy4KPiAKPiBXb3VsZG4ndCB0aGlzIHJlc3VsdCBpbiBndWVz
dHMgcG9zc2libHkgb2JzZXJ2aW5nIHRoZSBUU0MgbW92aW5nCj4gYmFja3dhcmRzPwoKWWVzLCBJ
IHRoaW5rIHNvLiBXb3VsZCByZXN0b3JpbmcgZnJvbSBUU0Mgc3RhbXAgaWYgaXQncyBoaWdoZXIg
dGhhbgpwbGF0Zm9ybSB0aW1lIGJldHRlciB5b3UgdGhpbms/CgpJZ29yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
