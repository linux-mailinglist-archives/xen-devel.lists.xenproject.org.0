Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38763155A19
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 15:52:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j04wh-0004UA-CX; Fri, 07 Feb 2020 14:49:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C2i2=33=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j04wg-0004U5-DD
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 14:49:26 +0000
X-Inumbo-ID: 0917c97c-49b9-11ea-b18b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0917c97c-49b9-11ea-b18b-12813bfff9fa;
 Fri, 07 Feb 2020 14:49:26 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j04we-0002T5-J7; Fri, 07 Feb 2020 14:49:24 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j04we-0005ts-97; Fri, 07 Feb 2020 14:49:24 +0000
Date: Fri, 7 Feb 2020 14:49:21 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200207144921.wtdnznewejdnsrvx@debian>
References: <20200206132452.11802-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206132452.11802-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/hvm: Fix handling of obsolete HVM_PARAMs
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMDYsIDIwMjAgYXQgMDE6MjQ6NTJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgbG9jYWwgeGNfaHZtX3BhcmFtX2RlcHJlY2F0ZWRfY2hlY2soKSBpbiBsaWJ4
YyB0cmllcyB0byBndWVzcyBYZW4ncwo+IGJlaGF2aW91ciBmb3IgdGhlIE1FTU9SWV9FVkVOVCBw
YXJhbXMsIGJ1dCBpcyB3cm9uZyBmb3IgdGhlIGdldCBzaWRlLCB3aGVyZQo+IFhlbiB3b3VsZCBy
ZXR1cm4gMCAod2hpY2ggaXMgYWxzbyBhIGJ1ZykuICBEZWxldGUgdGhlIGhlbHBlci4KPiAKPiBJ
biBYZW4sIHBlcmZvcm0gdGhlIGNoZWNrcyBpbiBodm1fYWxsb3dfc2V0X3BhcmFtKCksIHJhdGhl
ciB0aGFuCj4gaHZtX3NldF9wYXJhbSgpLCBhbmQgYWN0dWFsbHkgaW1wbGVtZW50IGNoZWNrcyBv
biB0aGUgZ2V0IHNpZGUgc28gdGhlCj4gaHlwZXJjYWxsIGRvZXNuJ3QgcmV0dXJuIHN1Y2Nlc3Nm
dWxseSB3aXRoIDAgYXMgYW4gYW5zd2VyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpPSy4gTm93IHRoZSBjaGVjayBpcyBwdXNo
ZWQgZG93biB0byBoeXBlcnZpc29yLiBJJ20gY2VydGFpbmx5IGhhcHB5IHRvCmhhdmUgbGVzcyBj
b2RlIGluIGxpYnhjLgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
