Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB49A168770
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 20:30:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5Dws-0002bZ-IZ; Fri, 21 Feb 2020 19:26:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lzBC=4J=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j5Dwr-0002bU-Ii
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 19:26:53 +0000
X-Inumbo-ID: 1c77b951-54e0-11ea-86e2-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c77b951-54e0-11ea-86e2-12813bfff9fa;
 Fri, 21 Feb 2020 19:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582313212;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ys9nbDZVYr17T/DT3IaS575BxqFufd85eZHd6gl3qyo=;
 b=JfE9V4PJUJU+WqO0+g5nOLsCN7Czz/xNDMrazp+zBuNo6q63FznV6DNg
 TxCNmmQvfvRqzSpdx6h/a98vfy/KzOTnHWOBqTSEEQSXPxjDJuezizEA0
 LQBBzRcwm1RZi8rO3gOcNa3AgLemN+3op7SXAzZamTfNMBE1aRaaHDAw6 g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KWssCwScQw+uoXc2/Q9ZmO0kQxT4D9jw33hMAqoA1CmUETzcuj/BTa9GwHhHnwXOdSUEng5V0c
 Rr1GAfAwj6PE5zpDsIugzmIyhORVpcPsQg8hsTf72khoPec0fgHCKQFerR+Fg4f/OjuNbVAaH3
 nZrtGYwN6/OuMtHagPciqFKkGlA+fEQKxkZ5FxPuAUhCF9wUIuY1rl00t1hAY63TXvgtKyv3cD
 RjbJvPmOL1Yq17tx7qt9ciHKp0tHgxJMFE5GWumrLqVtJ2WGgt04WFuvRB+3XKdoDcb3zt9KVK
 XkI=
X-SBRS: 2.7
X-MesageID: 13193657
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,469,1574139600"; d="scan'208";a="13193657"
To: Jan Beulich <jbeulich@suse.com>
References: <1582133128-25638-1-git-send-email-igor.druzhinin@citrix.com>
 <1d138bf8-0cec-b66d-c852-fd7d6392e69d@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <5f27be3d-263b-42b6-7489-8fbc1079c38b@citrix.com>
Date: Fri, 21 Feb 2020 19:26:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1d138bf8-0cec-b66d-c852-fd7d6392e69d@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/cpu: Sync any remaining RCU
 callbacks after CPU up/down
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEvMDIvMjAyMCAxNjoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMDIuMjAyMCAx
ODoyNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwu
Ywo+PiArKysgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKPj4gQEAgLTc4LDggKzc4LDExIEBAIHN0
YXRpYyB2b2lkIGwzX2NhY2hlX2dldCh2b2lkICphcmcpCj4+ICBsb25nIGNwdV91cF9oZWxwZXIo
dm9pZCAqZGF0YSkKPj4gIHsKPj4gICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gKHVuc2lnbmVkIGxv
bmcpZGF0YTsKPj4gLSAgICBpbnQgcmV0ID0gY3B1X3VwKGNwdSk7Cj4+ICsgICAgaW50IHJldDsK
Pj4gIAo+PiArICAgIC8qIEZsdXNoIHBvdGVudGlhbGx5IHNjaGVkdWxlZCBSQ1Ugd29yayBmcm9t
IHByZWNlZGluZyBDUFUgb2ZmbGluZSAqLwo+PiArICAgIHJjdV9iYXJyaWVyKCk7Cj4+ICsgICAg
cmV0ID0gY3B1X3VwKGNwdSk7Cj4+ICAgICAgaWYgKCByZXQgPT0gLUVCVVNZICkKPj4gICAgICB7
Cj4+ICAgICAgICAgIC8qIE9uIEVCVVNZLCBmbHVzaCBSQ1Ugd29yayBhbmQgaGF2ZSBvbmUgbW9y
ZSBnby4gKi8KPj4gQEAgLTEwNCw3ICsxMDcsMTEgQEAgbG9uZyBjcHVfdXBfaGVscGVyKHZvaWQg
KmRhdGEpCj4+ICBsb25nIGNwdV9kb3duX2hlbHBlcih2b2lkICpkYXRhKQo+PiAgewo+PiAgICAg
IGludCBjcHUgPSAodW5zaWduZWQgbG9uZylkYXRhOwo+PiAtICAgIGludCByZXQgPSBjcHVfZG93
bihjcHUpOwo+PiArICAgIGludCByZXQ7Cj4+ICsKPj4gKyAgICAvKiBGbHVzaCBwb3RlbnRpYWxs
eSBzY2hlZHVsZWQgUkNVIHdvcmsgZnJvbSBwcmVjZWRpbmcgQ1BVIG9ubGluZSAqLwo+PiArICAg
IHJjdV9iYXJyaWVyKCk7Cj4+ICsgICAgcmV0ID0gY3B1X2Rvd24oY3B1KTsKPj4gICAgICBpZiAo
IHJldCA9PSAtRUJVU1kgKQo+PiAgICAgIHsKPj4gICAgICAgICAgLyogT24gRUJVU1ksIGZsdXNo
IFJDVSB3b3JrIGFuZCBoYXZlIG9uZSBtb3JlIGdvLiAqLwo+Pgo+IAo+IFRoZXJlIGFyZSBtb3Jl
IGNhbGxzIHRvIGNwdV91cCgpIC8gY3B1X2Rvd24oKSwgbW9zdCBub3RhYmx5IGluCj4gY29yZV9w
YXJraW5nLmMuIFdvdWxkbid0IGl0IGJlIGJldHRlciB0byBtYWtlIHRoZSBiYXJyaWVyIHBhcnQK
PiBvZiB0aGUgdHdvIGZ1bmN0aW9ucz8gVGhpcyB3b3VsZCB0aGUgYWxzbyBjb3ZlciBub24teDg2
IGluCj4gY2FzZSBhbiBhcmNoIHdhbnRzIHRvIHN1cHBvcnQgb2ZmbGluaW5nL29ubGluaW5nIG9m
IENQVXMuCgpUaG9zZSBmdW5jdGlvbnMgYXJlIGNhbGxlZCBmcm9tIGVhcmx5IGluaXQgY29kZSBh
bmQgcmN1X2JhcnJpZXIoKSBpcwphbiBleHBlbnNpdmUgb3BlcmF0aW9uLiBJIHRoaW5rIGl0J3Mg
YmV0dGVyIGlmIGNhbGxlciBpcyByZXNwb25zaWJsZQpmb3Igc3luY2luZyB0aGUgc3RhdGUuIFRo
aXMgaXMgdGhlIHJlYXNvbiBJIG1vdmVkIHJjdV9iYXJyaWVyKCkgaW4gZnJvbnQKb2YgY3B1X3Vw
L2Rvd24uCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
