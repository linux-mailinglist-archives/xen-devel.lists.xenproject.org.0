Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7644ABA28
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 16:03:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Env-0006cC-BQ; Fri, 06 Sep 2019 14:01:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6Ent-0006bq-Mq
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:01:33 +0000
X-Inumbo-ID: d231beab-d0ae-11e9-abf6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d231beab-d0ae-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 14:01:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7E5C6B63B;
 Fri,  6 Sep 2019 14:01:29 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <67f6d8cc-05cf-ac8e-38c0-55578f9f595a@suse.com>
Message-ID: <35bb2f38-9d50-c12c-1051-7005251685ca@suse.com>
Date: Fri, 6 Sep 2019 16:01:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <67f6d8cc-05cf-ac8e-38c0-55578f9f595a@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/3] x86/apic: do not initialize LDR and DFR for
 bigsmp
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGVnYWN5IGFwaWMgaW5pdCB1c2VzIGJpZ3NtcCBmb3Igc21wIHN5c3RlbXMgd2l0aCA4IGFuZCBt
b3JlIENQVXMuIFRoZQpiaWdzbXAgQVBJQyBpbXBsZW1lbnRhdGlvbiB1c2VzIHBoeXNpY2FsIGRl
c3RpbmF0aW9uIG1vZGUsIGJ1dCBpdApuZXZlcnRoZWxlc3MgaW5pdGlhbGl6ZXMgTERSIGFuZCBE
RlIuIFRoZSBMRFIgZXZlbiBlbmRzIHVwIGluY29ycmVjdGx5IHdpdGgKbXVsdGlwbGUgYml0IGJl
aW5nIHNldC4KClRoaXMgZG9lcyBub3QgY2F1c2UgYSBmdW5jdGlvbmFsIHByb2JsZW0gYmVjYXVz
ZSBMRFIgYW5kIERGUiBhcmUgaWdub3JlZAp3aGVuIHBoeXNpY2FsIGRlc3RpbmF0aW9uIG1vZGUg
aXMgYWN0aXZlLCBidXQgaXQgdHJpZ2dlcmVkIGEgcHJvYmxlbSBvbiBhCjMyLWJpdCBLVk0gZ3Vl
c3Qgd2hpY2gganVtcHMgaW50byBhIGtkdW1wIGtlcm5lbC4KClRoZSBtdWx0aXBsZSBiaXRzIHNl
dCB1bmVhcnRoZWQgYSBidWcgaW4gdGhlIEtWTSBBUElDIGltcGxlbWVudGF0aW9uLiBUaGUKY29k
ZSB3aGljaCBjcmVhdGVzIHRoZSBsb2dpY2FsIGRlc3RpbmF0aW9uIG1hcCBmb3IgVkNQVXMgaWdu
b3JlcyB0aGUKZGlzYWJsZWQgc3RhdGUgb2YgdGhlIEFQSUMgYW5kIGVuZHMgdXAgb3ZlcndyaXRp
bmcgYW4gZXhpc3RpbmcgdmFsaWQgZW50cnkKYW5kIGFzIGEgcmVzdWx0LCBBUElDIGNhbGlicmF0
aW9uIGhhbmdzIGluIHRoZSBndWVzdCBkdXJpbmcga2R1bXAKaW5pdGlhbGl6YXRpb24uCgpSZW1v
dmUgdGhlIGJvZ3VzIExEUi9ERlIgaW5pdGlhbGl6YXRpb24uCgpUaGlzIGlzIG5vdCBpbnRlbmRl
ZCB0byB3b3JrIGFyb3VuZCB0aGUgS1ZNIEFQSUMgYnVnLiBUaGUgTERSL0RGUgppbmluaXRhbGl6
YXRpb24gaXMgd3Jvbmcgb24gaXRzIG93bi4KClN1Z2dlc3RlZC1ieTogVGhvbWFzIEdsZWl4bmVy
IDx0Z2x4QGxpbnV0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IEJhbmRhbiBEYXMgPGJzZEByZWRo
YXQuY29tPgpbTGludXggY29tbWl0IGJhZTNhOGQzMzA4ZWU2OWE3ZGJkZjE0NTkxMWIxOGRmZGE4
YWRlMGRdCgpEcm9wIGluaXRfYXBpY19sZHJfeDJhcGljX3BoeXMoKSBhdCB0aGUgc2FtZSB0aW1l
LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEv
eGVuL2FyY2gveDg2L2dlbmFwaWMvZGVsaXZlcnkuYworKysgYi94ZW4vYXJjaC94ODYvZ2VuYXBp
Yy9kZWxpdmVyeS5jCkBAIC00MCwxMSArNDAsNyBAQCB1bnNpZ25lZCBpbnQgY3B1X21hc2tfdG9f
YXBpY2lkX2ZsYXQoY29uCiAKIHZvaWQgaW5pdF9hcGljX2xkcl9waHlzKHZvaWQpCiB7Ci0JdW5z
aWduZWQgbG9uZyB2YWw7Ci0JYXBpY193cml0ZShBUElDX0RGUiwgQVBJQ19ERlJfRkxBVCk7Ci0J
LyogQSBkdW1teSBsb2dpY2FsIElEIHNob3VsZCBiZSBmaW5lLiBXZSBvbmx5IGRlbGl2ZXIgaW4g
cGh5cyBtb2RlLiAqLwotCXZhbCA9IGFwaWNfcmVhZChBUElDX0xEUikgJiB+QVBJQ19MRFJfTUFT
SzsKLQlhcGljX3dyaXRlKEFQSUNfTERSLCB2YWwpOworCS8qIFdlIG9ubHkgZGVsaXZlciBpbiBw
aHlzIG1vZGUgLSBubyBzZXR1cCBuZWVkZWQuICovCiB9CiAKIHZvaWQgX19pbml0IGNsdXN0ZXJl
ZF9hcGljX2NoZWNrX3BoeXModm9pZCkKLS0tIGEveGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGlj
LmMKKysrIGIveGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGljLmMKQEAgLTM4LDEwICszOCw2IEBA
IHN0YXRpYyBpbmxpbmUgdTMyIHgyYXBpY19jbHVzdGVyKHVuc2lnbmUKICAgICByZXR1cm4gcGVy
X2NwdShjcHVfMl9sb2dpY2FsX2FwaWNpZCwgY3B1KSA+PiAxNjsKIH0KIAotc3RhdGljIHZvaWQg
aW5pdF9hcGljX2xkcl94MmFwaWNfcGh5cyh2b2lkKQotewotfQotCiBzdGF0aWMgdm9pZCBpbml0
X2FwaWNfbGRyX3gyYXBpY19jbHVzdGVyKHZvaWQpCiB7CiAgICAgdW5zaWduZWQgaW50IGNwdSwg
dGhpc19jcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7CkBAIC0xNjcsNyArMTYzLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBnZW5hcGljIF9faW5pdGNvbnN0cgogICAgIEFQSUNfSU5JVCgieDJhcGlj
X3BoeXMiLCBOVUxMKSwKICAgICAuaW50X2RlbGl2ZXJ5X21vZGUgPSBkZXN0X0ZpeGVkLAogICAg
IC5pbnRfZGVzdF9tb2RlID0gMCAvKiBwaHlzaWNhbCBkZWxpdmVyeSAqLywKLSAgICAuaW5pdF9h
cGljX2xkciA9IGluaXRfYXBpY19sZHJfeDJhcGljX3BoeXMsCisgICAgLmluaXRfYXBpY19sZHIg
PSBpbml0X2FwaWNfbGRyX3BoeXMsCiAgICAgLmNsdXN0ZXJlZF9hcGljX2NoZWNrID0gY2x1c3Rl
cmVkX2FwaWNfY2hlY2tfeDJhcGljLAogICAgIC52ZWN0b3JfYWxsb2NhdGlvbl9jcHVtYXNrID0g
dmVjdG9yX2FsbG9jYXRpb25fY3B1bWFza19waHlzLAogICAgIC5jcHVfbWFza190b19hcGljaWQg
PSBjcHVfbWFza190b19hcGljaWRfcGh5cywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
