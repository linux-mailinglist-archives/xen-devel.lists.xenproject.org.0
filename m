Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CB913BEB9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 12:43:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irh2I-0002L6-Bx; Wed, 15 Jan 2020 11:40:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irh2G-0002L1-OE
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 11:40:32 +0000
X-Inumbo-ID: d3494c60-378b-11ea-8524-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3494c60-378b-11ea-8524-12813bfff9fa;
 Wed, 15 Jan 2020 11:40:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8CB46AF23;
 Wed, 15 Jan 2020 11:40:26 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
Date: Wed, 15 Jan 2020 12:40:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200115094703.GH11756@Air-de-Roger>
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com,
 wl@xen.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAyMCAxMDo0NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEph
biAxNCwgMjAyMCBhdCAwNzozNjoyMVBNICswMDAwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4g
LS0tIGEveGVuL2FyY2gveDg2L3RpbWUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvdGltZS5jCj4+
IEBAIC05NTUsMTAgKzk1NSwxNiBAQCB1NjQgc3RpbWUydHNjKHNfdGltZV90IHN0aW1lKQo+PiAg
Cj4+ICB2b2lkIGNzdGF0ZV9yZXN0b3JlX3RzYyh2b2lkKQo+PiAgewo+PiArICAgIHN0cnVjdCBj
cHVfdGltZSAqdCA9ICZ0aGlzX2NwdShjcHVfdGltZSk7Cj4+ICsKPj4gICAgICBpZiAoIGJvb3Rf
Y3B1X2hhcyhYODZfRkVBVFVSRV9OT05TVE9QX1RTQykgKQo+PiAgICAgICAgICByZXR1cm47Cj4+
ICAKPj4gLSAgICB3cml0ZV90c2Moc3RpbWUydHNjKHJlYWRfcGxhdGZvcm1fc3RpbWUoTlVMTCkp
KTsKPj4gKyAgICB0LT5zdGFtcC5tYXN0ZXJfc3RpbWUgPSByZWFkX3BsYXRmb3JtX3N0aW1lKE5V
TEwpOwo+PiArICAgIHQtPnN0YW1wLmxvY2FsX3RzYyA9IHN0aW1lMnRzYyh0LT5zdGFtcC5tYXN0
ZXJfc3RpbWUpOwo+PiArICAgIHQtPnN0YW1wLmxvY2FsX3N0aW1lID0gdC0+c3RhbXAubWFzdGVy
X3N0aW1lOwo+PiArCj4+ICsgICAgd3JpdGVfdHNjKHQtPnN0YW1wLmxvY2FsX3RzYyk7Cj4gCj4g
SW4gb3JkZXIgdG8gYXZvaWQgdGhlIFRTQyB3cml0ZSAoYW5kIHRoZSBsaWtlbHkgYXNzb2NpYXRl
ZCB2bWV4aXQpLAo+IGNvdWxkIHlvdSBpbnN0ZWFkIGRvOgo+IAo+IHQtPnN0YW1wLmxvY2FsX3N0
aW1lID0gdC0+c3RhbXAubWFzdGVyX3N0aW1lID0gcmVhZF9wbGF0Zm9ybV9zdGltZShOVUxMKTsK
PiB0LT5zdGFtcC5sb2NhbF90c2MgPSByZHRzY19vcmRlcmVkKCk7Cj4gCj4gSSB0aGluayBpdCBz
aG91bGQgYWNoaWV2ZSB0aGUgc2FtZSBhcyBpdCBzeW5jcyB0aGUgbG9jYWwgVFNDIHN0YW1wIGFu
ZAo+IHRpbWVzLCB3b3VsZCBhdm9pZCB0aGUgVFNDIHdyaXRlIGFuZCBzbGlnaHRseSBzaW1wbGlm
aWVzIHRoZSBsb2dpYy4KCldvdWxkbid0IHRoaXMgcmVzdWx0IGluIGd1ZXN0cyBwb3NzaWJseSBv
YnNlcnZpbmcgdGhlIFRTQyBtb3ZpbmcKYmFja3dhcmRzPwoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
