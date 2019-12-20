Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D8127EE6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 16:01:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJjW-0001R6-3j; Fri, 20 Dec 2019 14:58:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RRu=2K=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iiJjU-0001R1-Ft
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:58:24 +0000
X-Inumbo-ID: 2b366d7b-2339-11ea-9378-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b366d7b-2339-11ea-9378-12813bfff9fa;
 Fri, 20 Dec 2019 14:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576853903;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=VboxXmOL3mmEBcLCnmrV8DFC4HrWNCZ/0/6hxTQc4hQ=;
 b=RBbZ83fuyFZkSKOqaFi2luCks15+AKjbU2SuqhFxY/2aEc0GnQX/Jphn
 kweD32ekrgSnPPwCwFAl8+fp5CwBqw0Zve8v7X8kyv4T0RmloA3zN/W3Y
 H7+wIbfCDpj6uPsUfb0UdOolnAnVbhZ+NaXvHaXm4b+EYOdqaqaWB+W0X o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lw8RF3DZGmhS/mwpDFU3wSmr88i6BXhnTBHmcDqeQHjERxYTr6OmoLjrng0f34In4M7fx3kURu
 HmKBHu4z5OOQrAEFW1zt6ypw52dN5Pvl3LB1YQlmoSb6/vflIggHGSEWQ9CkFqfn8PKaOrq4Gd
 kN1xSkgka91gOrPh77llFdqDWX1QMlnQRK7eCktn28PFsUOEKI/O1cIcKYmmNBefd1lGYbShA6
 EJw3g8qO2LC6PtSFbsvmj07zMcMQKGbJAlboZPyFaAhff+F2OYFn2CiV20JnGVblFEZFYkhvzB
 G9Y=
X-SBRS: 2.7
X-MesageID: 10358398
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; d="scan'208";a="10358398"
To: Jan Beulich <jbeulich@suse.com>
References: <8b611419-a0c7-743f-fec4-f02a04caf114@suse.com>
 <17723247-f12e-5a43-836b-6aff95a93ab1@citrix.com>
 <ab5cd434-0c9a-ca6e-f615-eea57ae40853@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <3b3cb270-7dfe-2f7b-bafc-48a30db12d55@citrix.com>
Date: Fri, 20 Dec 2019 14:58:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ab5cd434-0c9a-ca6e-f615-eea57ae40853@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/EPT: adjustments for redundant function
 arguments
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMjAvMTkgMjo0MSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjAuMTIuMjAxOSAx
NToyNiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMTIvMjAvMTkgMjoyMSBQTSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBJbiBlcHRfcDJtX3R5cGVfdG9fZmxhZ3MoKSBwYXNzaW5nIGluIHR5
cGUgYW5kIGFjY2VzcyBhcyBzZXBhcmF0ZQo+Pj4gcGFyYW1ldGVycyBjYW4gYmUgY29uc2lkZXJl
ZCBhbiBvcHRpbWl6YXRpb24sIGFzIGFsbCBjYWxsZXJzIHNldCB0aGUKPj4+IHJlc3BlY3RpdmUg
ZmllbGRzIGluIHRoZSBlbnRyeSBiZWluZyB1cGRhdGVkIGJlZm9yZSB0aGUgY2FsbC4gUmV0YWlu
Cj4+PiB0aGlzIGJlaGF2aW9yIGJ1dCBhZGQgYXNzZXJ0aW9ucy4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IEluIHdoYXQgd2F5IGlz
IGl0IGFuIG9wdGltaXphdGlvbj8KPiAKPiBUaGVyZSdzIG5vIHBvaW50ZXIgZGUtcmVmIG5lZWRl
ZDsgdGhlIHZhbHVlcyB3aWxsIGFscmVhZHkgY29tZSBpbgo+IHZpYSByZWdpc3RlcnMuIEFuZCAi
Y2FuIGJlIGNvbnNpZGVyZWQiIGJlY2F1c2UgcG9zc2libHkgc29tZQo+IGNvbXBpbGVycyBhcmUg
c21hcnQgZW5vdWdoIHRvIGVsaW1pbmF0ZSB0aGUgcG9pbnRlciBkZS1yZWYgYWdhaW4KPiAoYnV0
IHRoZW4gaXQnbGwgc3RpbGwgYmUgYSBiaXRmaWVsZCBleHRyYWN0LCB3aGljaCBjYWxsZXJzIG1h
eQo+IGJlIGFibGUgdG8gYXZvaWQpLgoKUmlnaHQ7IG9uIHRoZSB3aG9sZSBJJ2QgcmF0aGVyIGxl
dCBjb21waWxlcnMgZG8gdGhpcyBzb3J0IG9mCm1pY3JvLW9wdGltaXphdGlvbiwgYW5kIG9ubHkg
ZG8gdGhpcyAibWFudWFsIiBzb3J0IG9mIG9wdGltaXphdGlvbiB3aXRoCnNvbWUgc29ydCBvZiBi
ZW5jaG1hcmtzIHNob3dpbmcgdGhhdCBpcyBoYXMgc29tZSBraW5kIG9mIGVmZmVjdC4KCj4gCj4+
IEkgZG9uJ3QgbmVjZXNzYXJpbHkgb3Bwb3NlIHRoaXMsIGJ1dCBnaXZlbiB0aGF0IDMgb2YgdGhl
IDQgY2FsbGVycwo+PiBsaXRlcmFsbHkgZG8gc29tZXRoaW5nIGxpa2U6Cj4+Cj4+ICAgICBlcHRf
cDJtX3R5cGVfdG9fZmxhZ3MocDJtLCAmZSwgZS5zYV9wMm10LCBlLmFjY2Vzcyk7Cj4+Cj4+IEl0
IHNlZW1zIGxpa2UganVzdCBnZXR0aW5nIHJpZCBvZiB0aGUgZXh0cmFuZW91cyBhcmd1bWVudHMg
bWlnaHQgYSBiZQo+PiBiZXR0ZXIgb3B0aW9uLgo+IAo+IFRoYXQgd2FzIG15IG9yaWdpbmFsIGlu
dGVudGlvbiBhcyB3ZWxsLCBidXQgaWlyYyBBbmRyZXcgZGlkbid0IGxpa2UKPiBpdCB3aGVuIHdl
IGRpc2N1c3NlZCBpdCBiYWNrIHRoZW4gKHRoZSBjb250ZXh0IGhlcmUgYmVpbmcgWFNBLTMwNCku
CgpJIGRpZCBhIHF1aWNrIHNraW0gdGhyb3VnaCB0aG9zZSB0aHJlYWRzIGFuZCBjb3VsZG4ndCBm
aW5kIGFueSBjb21tZW50Cm9uIHRoaXMgaXNzdWUuICBDb3VsZCB5b3UgcG9pbnQgbWUgdG8gdGhl
IG1haWwgd2l0aCBpdD8gIChPciBBbmR5LCB3b3VsZAp5b3UgY2FyZSB0byByZXBlYXQgeW91ciBh
cmd1bWVudD8pCgpVbHRpbWF0ZWx5IHRoZSBwYXRjaCBhcyBpdCBzdGFuZHMgaXMgb25seSBtYWtp
bmcgdGhlIGV4aXN0aW5nIGNvZGUKc2FmZXIsIHNvIEknbSBPSyB3aXRoIGdpdmluZyBpdCBteSBB
Y2sgaWYgeW91IGRvbid0IHdhbnQgdG8gcHVyc3VlIHRoZQpvdGhlciBvcHRpb247IGJ1dCBJJ2Qg
cHJlZmVyIHRyeWluZyB0byB1bmRlcnN0YW5kIGFuZCBwb3RlbnRpYWxseQppbXByb3ZlIHRoaW5n
cyB3aGlsZSB3ZSdyZSBhdCBpdC4gIChBbmQgaWYgdGhlcmUgKmlzKiBhIGdvb2QgcmVhc29uIGZv
cgpwYXNzaW5nIGluIHBhcmFsbGVsIHBhcmFtZXRlcnMsIGl0IHdvdWxkIGJlIGdvb2QgdG8gcmVj
b3JkIGl0IGluIGEKY29tbWVudCBzbyB3ZSBkb24ndCBoYXZlIHRoaXMgY29udmVyc2F0aW9uIGFn
YWluIGluIDMgeWVhcnMnIHRpbWUuKQoKIC0gR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
