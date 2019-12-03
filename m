Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A0310FEF9
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 14:41:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic8Mh-00032V-5C; Tue, 03 Dec 2019 13:37:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8e7=ZZ=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1ic8Mf-00032Q-W0
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 13:37:18 +0000
X-Inumbo-ID: 04e3f04f-15d2-11ea-81dd-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04e3f04f-15d2-11ea-81dd-12813bfff9fa;
 Tue, 03 Dec 2019 13:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575380236;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=eX4zCXCAM8e23DFkBrtH/W3RLOq0z3uuA6h+DcxGHvU=;
 b=fIaXtajFDyQOpOlUMQqzSTJNgaQg913iUSd0QLQAi2CtQFKvv7ahe6dD
 MdECXkUGB409Nn2k3tYyuspDApiVyVWOtUdnBmtYlpDX0JqsUVUr62nct
 PJI76kruowbYPcpNwkopNidxeHl9LLGp70DoMdKGF9hJc+b+NEOUU91so s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XgH8kU3Pys2rKhc+OQdOBBS6v41FwMFSMau7GB64uqG+d7eoyBa30O5jzRdSpq+9/H92t1+tdQ
 +3/Qd8lkK4Vyu++4g3FC606OwATxrb8j2MRNQhdBUSYd1G5fdPIjGS4r7lh5lXbdpMwGLpsEt4
 +PaH1TORfZdyukWGZKkG5UWEJ/8EYqZDaJ0xAB7Rr3vIcuKqraf2abW0UKI2h67X6XNJrqotfc
 yIfyqquVi7mLS15p5fFz5FilXsoVId2oCQjqgfXPECqtBF7Xu2ZOa6Jbe49+eEw2XC65GW2bHM
 82E=
X-SBRS: 2.7
X-MesageID: 9246342
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,273,1571716800"; 
   d="scan'208";a="9246342"
To: Jan Beulich <jbeulich@suse.com>
References: <1575057677-13839-1-git-send-email-igor.druzhinin@citrix.com>
 <47063d30-dd6a-2528-21f3-0bc7e7951b34@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <af520a2b-8319-c9bb-fb32-2d994f6d36bf@citrix.com>
Date: Tue, 3 Dec 2019 13:37:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <47063d30-dd6a-2528-21f3-0bc7e7951b34@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/AMD: unbreak CPU hotplug on
 AMD systems without RstrFpErrPtrs
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMTIvMjAxOSAxMDowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMTEuMjAxOSAy
MTowMSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvY29t
bW9uLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwo+PiBAQCAtNTQsNyArNTQs
NyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGZvcmNlZF9jYXBzW05DQVBJTlRTXTsKPj4gIAo+PiAg
REVGSU5FX1BFUl9DUFUoYm9vbCwgZnVsbF9nZHRfbG9hZGVkKTsKPj4gIAo+PiAtdm9pZCBfX2lu
aXQgc2V0dXBfY2xlYXJfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+PiArdm9pZCBzZXR1cF9j
bGVhcl9jcHVfY2FwKHVuc2lnbmVkIGludCBjYXApCj4+ICB7Cj4+ICAJY29uc3QgdWludDMyX3Qg
KmRmczsKPj4gIAl1bnNpZ25lZCBpbnQgaTsKPj4gQEAgLTgzLDcgKzgzLDcgQEAgdm9pZCBfX2lu
aXQgc2V0dXBfY2xlYXJfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+PiAgCX0KPj4gIH0KPj4g
IAo+PiAtdm9pZCBfX2luaXQgc2V0dXBfZm9yY2VfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+
PiArdm9pZCBzZXR1cF9mb3JjZV9jcHVfY2FwKHVuc2lnbmVkIGludCBjYXApCj4+ICB7Cj4+ICAJ
aWYgKF9fdGVzdF9hbmRfc2V0X2JpdChjYXAsIGZvcmNlZF9jYXBzKSkKPj4gIAkJcmV0dXJuOwo+
IAo+IFRoZSB0d28gZnVuY3Rpb25zIGFyZSBkZWxpYmVyYXRlbHkgX19pbml0LCBhcyBhbnkgY2Fs
bCB0byB0aGVtCj4gcG9zdC1pbml0IGlzIG5vdCBnb2luZyB0byB0YWtlIHN5c3RlbS13aWRlIGVm
ZmVjdC4gVGhlc2UgZnVuY3Rpb25zCj4gc2hvdWxkIHJlYWxseSBiZSBfX2luaXRfcHJlc21wLCBp
ZiB3ZSBoYWQgc29tZXRoaW5nIGxpa2UgdGhpcy4gTm8KPiB1c2Ugb2YgdGhlbSBvbiBhbiBBUCBi
b290IHBhdGggaXMgZ29pbmcgdG8gYWZmZWN0IHRoZSBCU1AsIGFuZAo+IGhlbmNlIHdpbGwgbGVh
dmUgdGhlIHN5c3RlbSBpbiBhbiBpbmNvbnNpc3RlbnQgc3RhdGUuCj4gCgpJIGFncmVlIHdpdGgg
eW91IGFuZCBoYXZlIGEgdmVyc2lvbiB3aGVyZSBJIGp1c3QgZ2F0ZSB0aGUgY29ycmVzcG9uZGlu
ZyAKY2FsbHMgd2l0aCAoYyA9PSAmYm9vdF9jcHVfZGF0YSkuIFJlbW92aW5nIF9faW5pdCB3YXMg
dGhlIGFwcHJvYWNoCnN1Z2dlc3RlZCBieSBBbmRyZXcgZm9sbG93aW5nIHRoZSBjb25jZXJuIG9m
IHBvdGVudGlhbGx5IGFzeW1tZXRyaWMKbWljcm9jb2RlIGluIGEgc3lzdGVtIHdoaWNoIEkgZG9u
J3QgdGhpbmsgd291bGQgd29yayBhbnl3YXkgZHVlIHRvCnRoZSByZWFzb25zIHlvdSBtZW50aW9u
ZWQuCgpJIHdpbGwgc2VuZCB0aGUgb3JpZ2luYWwgYXBwcm9hY2ggYXMgdjIuCgpJZ29yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
