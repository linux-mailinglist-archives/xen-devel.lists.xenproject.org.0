Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62511115FDB
	for <lists+xen-devel@lfdr.de>; Sun,  8 Dec 2019 00:44:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idjgO-0001DH-HT; Sat, 07 Dec 2019 23:40:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ACXR=Z5=amazon.com=prvs=2375083a5=jgrall@srs-us1.protection.inumbo.net>)
 id 1idjgM-0001DC-Bf
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 23:40:14 +0000
X-Inumbo-ID: e98be1ae-194a-11ea-8650-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e98be1ae-194a-11ea-8650-12813bfff9fa;
 Sat, 07 Dec 2019 23:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575762013; x=1607298013;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7Y+sPNwHqr6y8+zmbxqARlwYP/qo8NbBBXB8YTTpY/I=;
 b=A2znPyFeHjqSwdKl3mc613QithlARdtWpNpN47tXzhYJXhCFlvjz4PxN
 bNnuH4XqeMunsbBnYcpTGmSMV6lAii2P0kcUID4MAJfARUULjSb5HeCow
 AaTVAPKFvP/RafR6ioaUrkoP7Pnp3PALhfbFKVRlNQtv5KYIygl5fDzDs U=;
IronPort-SDR: RnrPqEpH6nKM+mq0+juF1eJcH7QOmpCV9vBkhEGqP1OnZK1RVeUwSsGH0N3O6TaGuRsu9hHvE5
 SDoDpU6QFEpg==
X-IronPort-AV: E=Sophos;i="5.69,289,1571702400"; d="scan'208";a="13573893"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 07 Dec 2019 23:39:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id C5208A2E04; Sat,  7 Dec 2019 23:39:55 +0000 (UTC)
Received: from EX13D37EUA002.ant.amazon.com (10.43.165.200) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 7 Dec 2019 23:39:54 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D37EUA002.ant.amazon.com (10.43.165.200) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 7 Dec 2019 23:39:53 +0000
Received: from a483e7b01a66.ant.amazon.com (10.95.98.207) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Sat, 7 Dec 2019 23:39:51 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>, Hongyan Xia
 <hongyxia@amazon.com>, <xen-devel@lists.xenproject.org>
References: <cover.1575646580.git.hongyxia@amazon.com>
 <86a6fb68f76ab287f5c2d99d1e7954e8b2d1ab05.1575646580.git.hongyxia@amazon.com>
 <e303e937-7341-5c39-7a12-c0d055d8fce4@amazon.com>
 <1de175ac-f29e-cfd4-d48b-5fd8743beb2f@citrix.com>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <08ec291a-a169-1272-c16d-4047a57cf2d9@amazon.com>
Date: Sat, 7 Dec 2019 23:39:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1de175ac-f29e-cfd4-d48b-5fd8743beb2f@citrix.com>
Content-Language: en-GB
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNy8xMi8yMDE5IDE5OjM3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDA3LzEyLzIw
MTkgMTk6MDQsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgSG9uZ3lhbiwKPj4KPj4gT24gMDYv
MTIvMjAxOSAxNTo1MywgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4+PiBtYXBfcGFnZXNfdG9feGVuIGFu
ZCBtb2RpZnlfeGVuX21hcHBpbmdzIGFyZSBwZXJmb3JtaW5nIGFsbW9zdCBleGFjdGx5Cj4+PiB0
aGUgc2FtZSBvcGVyYXRpb25zIHdoZW4gc2hhdHRlcmluZyBhbiBsMyBQVEUsIHRoZSBvbmx5IGRp
ZmZlcmVuY2UKPj4+IGJlaW5nIHdoZXRoZXIgd2Ugd2FudCB0byBmbHVzaC4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3l4aWFAYW1hem9uLmNvbT4KPj4+IC0tLQo+Pj4g
IMKgIHhlbi9hcmNoL3g4Ni9tbS5jIHwgODUgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygr
KSwgNDUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5j
IGIveGVuL2FyY2gveDg2L21tLmMKPj4+IGluZGV4IDdkNGRkODBhODUuLjQyYWFhYTEwODMgMTAw
NjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21t
LmMKPj4+IEBAIC01MTUxLDYgKzUxNTEsNDMgQEAgbDFfcGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9s
MWUodW5zaWduZWQgbG9uZyB2KQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZmx1c2hfYXJlYV9sb2NhbCgoY29uc3Qgdm9pZCAqKXYsIGYp
IDogXAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZmx1c2hfYXJlYV9hbGwoKGNvbnN0IHZvaWQgKil2LCBmKSkKPj4+ICDCoCArLyogU2hh
dHRlciBhbiBsMyBlbnRyeSBhbmQgcG9wdWxhdGUgbDIuIElmIHZpcnQgaXMgcGFzc2VkIGluLCBh
bHNvCj4+PiBkbyBmbHVzaC4gKi8KPj4+ICtzdGF0aWMgdm9pZCBzaGF0dGVyX2wzZShsM19wZ2Vu
dHJ5X3QgKnBsM2UsIGwyX3BnZW50cnlfdCAqbDJ0LAo+Pj4gK8KgwqDCoMKgwqDCoMKgIHVuc2ln
bmVkIGxvbmcgdmlydCwgYm9vbCBsb2NraW5nKQo+Pj4gK3sKPj4+ICvCoMKgwqAgdW5zaWduZWQg
aW50IGk7Cj4+PiArwqDCoMKgIGwzX3BnZW50cnlfdCBvbDNlID0gKnBsM2U7Cj4+PiArCj4+PiAr
wqDCoMKgIGZvciAoIGkgPSAwOyBpIDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCj4+PiAr
wqDCoMKgwqDCoMKgwqAgbDJlX3dyaXRlKGwydCArIGksCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBsMmVfZnJvbV9wZm4obDNlX2dldF9wZm4ob2wzZSkgKwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAoaSA8PCBQQUdFVEFCTEVfT1JERVIpLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsM2VfZ2V0X2ZsYWdzKG9sM2UpKSk7
Cj4+Cj4+IEkgdW5kZXJzdGFuZCB0aGlzIGlzIGp1c3QgYSBmYWN0b3Igb3V0IG9mIHRoZSBjdXJy
ZW50IGNvZGUsIGJ1dCB0aGUKPj4gY29kZSBmZWVscyB3cm9uZyAoYXQgbGVhc3QgaW4gdGhlb3J5
KSBhbmQgd2FzdGVmdWwuCj4+Cj4+IFlvdSB3b3VsZCBhbGxvY2F0ZSB0aGUgTDIgdGFibGUsIHBy
ZXBhcmUgaXQgYW5kIHRoZW4gZnJlZSBpdCBpZiB0aGUgTDMKPj4gZW50cnkgaGFzIF9QQUdFX1BS
RVNFTlQgb3IgX1BBR0VfUFNFIGNsZWFyZWQuCj4+Cj4+IEFsc28sIGluIHRoZW9yeSwgdGhlcmUg
aXMgbm90aGluZyBwcmV2ZW50aW5nIHRoZSBsMyBmbGFncyB0byBiZQo+PiBtb2RpZmllZCBiZWhp
bmQgeW91ciBiYWNrLiBTbyB5b3UgY291bGQgZW5kIHVwIHRvIGdlbmVyYXRlIHRoZSBsMgo+PiBl
bnRyaWVzIHdpdGggdGhlIG9sZCBsMyBmbGFncy4KPj4KPj4gSW4gbnV0c2hlbGwsIGl0IGZlZWxz
IHRvIG1lIHRoYXQgdGhlIHNoYXR0ZXJpbmcvYWxsb2NhdGlvbiBzaG91bGQKPj4gaGFwcGVuIHdp
dGggdGhlIGxvY2sgdGFrZW4uIFRoaXMgd291bGQgYWxzbyBhbGxvdyB5b3UgdG8gbm90IGFsbG9j
YXRlCj4+IHRoZSBsMiB0YWJsZSB3aGVuIHlvdSBhcmUgcmVtb3ZpbmcgdGhlIHBhZ2UuCj4gCj4g
VGhlIGV4aXN0aW5nIGJlaGF2aW91ciBpcyBkZWxpYmVyYXRlIGFuZCBtb3N0IGxpa2VseSB3YW50
cyB0byByZW1haW4uCj4gCj4gSXQgbWFrZXMgYWRqdXN0bWVudHMgc2FmZSB0byBjb25jdXJyZW50
IG1vZGlmaWNhdGlvbnMsIHdoaWxlIHJlZHVjaW5nCj4gdGhlIGNyaXRpY2FsIHNlY3Rpb24gb2Yg
dGhlIGxvY2sgdG8gb25seSB0aGUgYWx0ZXJhdGlvbiBvZiB0aGUgbGl2ZSBQVEVzLgo+IAo+IFdl
IGRvbid0IGV4cGVjdCBjb25jdXJyZW50IGNvbmZsaWN0aW5nIHVwZGF0ZXMgdG8gdGhlc2UgcGFn
ZXRhYmxlcyBhdAo+IGFsbCwgYnV0IGV4dGVuZGluZyB0aGUgbG9ja2VkIHJlZ2lvbiBhcm91bmQg
dGhlIG1lbW9yeSBhbGxvY2F0aW9uIGFuZAo+IHdyaXRpbmcgdGhlIG5ldyBwYWdldGFibGUgaXMg
YSBib3R0bGVrbmVjayB0byBwYXJhbGxlbCB1cGRhdGVzIG9mCj4gaW5kZXBlbmRlbnQgYWRkcmVz
c2VzLgoKSSBhbSBxdWl0ZSBpbnRlcmVzdGVkIHRvIGtub3cgYSBiaXQgbW9yZSBhYm91dCB0aGUg
cG90ZW50aWFsIApib3R0bGVuZWNrcy4gV2hlbiBJIHJld3JvdGUgdGhlIFhlbiBQVCBoZWxwZXJz
IGZvciBBcm0gSSBkaWRuJ3Qgc2VlIG1hbnkgCmFjY2VzcyB0byB0aGUgWGVuIFBULgoKVG8gbWFr
ZSBhIGNvbXBhcmlzb24sIEkgc2VlIG11Y2ggbW9yZSB1cGRhdGUgdG8gdGhlIFAyTS4gU28gSSB3
b3VsZCAKZXhwZWN0IHN1Y2ggb3B0aW1pemF0aW9uIHRvIGJlIG1vcmUgYSBjb25jZXJuIHRoZXJl
LiBZZXQgd2UgdGFrZSB0aGUgCmxvY2sgZm9yIHRoZSBmdWxsIHVwZGF0ZS4gTWF5YmUgdGhpcyB3
YXMgYW4gb3ZlcnNpZ2h0IHdoZW4gdGhlIFAyTSB3YXMgCmNyZWF0ZWQ/CgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
