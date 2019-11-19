Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C6B102A5B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 18:01:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX6pT-0005qn-0c; Tue, 19 Nov 2019 16:58:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QaT1=ZL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iX6pR-0005qi-DZ
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 16:58:13 +0000
X-Inumbo-ID: c5208bfa-0aed-11ea-a2ff-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5208bfa-0aed-11ea-a2ff-12813bfff9fa;
 Tue, 19 Nov 2019 16:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574182692;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OCwHVRVhVo1meIsAhSG3oHxo9S4adauEHlo8hZYNiwU=;
 b=ZvpPjfrf5oVzUAAI2HqjugBcwmJ+flvaaWmktXaKElca69eqvB4lpJ1A
 u0kigtGbZOtSG5F47fDMp0A5AmYeWyqK4/a5Ks3Jla0vdaqaJKuHMoBU2
 2H5iWt/AKUY66KBMWcqKwL99VAo3RKIiLDljqzHtnSBROegA6iWYtnjoe Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Kq+p/n5zEyuDyNUtdHAxF9mqdxP82wpj7/32FcebA4n0DIl4/ua2PlezItxQ44Zu5cv1M5nFLu
 p4X/cGqYLJK6hllPOKP0jbb3QQ2B4rHswM8hdEstQaP2lJ0UigttAJqvzqXOza6hfqPGx3Aghn
 soH3BP7CWOveor08Du68qlKLJjuRagWsMjPrUIi+TmN7RjBETFfLnn4ZI5C34NZFF+6VvPzwm0
 0abK2mAQggrkhDpOmw6WNxBWxiHaEqSWWnb/AceOynJ9bAM+QQ7uduk4TWD7ywFb8LmVUgvm+Y
 WxE=
X-SBRS: 2.7
X-MesageID: 8554089
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,218,1571716800"; 
   d="scan'208";a="8554089"
Date: Tue, 19 Nov 2019 16:58:09 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191119165809.GE1425@perard.uk.xensource.com>
References: <20191114180542.1016867-1-anthony.perard@citrix.com>
 <d0f286d0-544e-70e2-a298-b37bdd5bf017@suse.com>
 <e16dd837-49bc-aad3-6080-35490f46cda4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e16dd837-49bc-aad3-6080-35490f46cda4@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] xen: Fix race to build
 arch/x86/efi/relocs-dummy.o
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMDU6MzI6NTNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMTEuMjAxOSAxNzoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBPbiAxNC4x
MS4yMDE5IDE5OjA1LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+PiBXaXRoICQoVEFSR0VUKS5l
ZmkgZGVwZW5kaW5nIG9uIGVmaS9yZWxvY3MtZHVtbXkubywgYXJjaC94ODYvTWFrZWZpbGUKPiA+
PiB3aWxsIGF0dGVtcHQgdG8gYnVpbGQgdGhhdCBvYmplY3QuIFRoaXMgcmVzdWx0IGluIHRoZSBk
ZXBlbmRlbmN5IGZpbGUKPiA+PiBiZWVuIGdlbmVyYXRlZCB3aXRoIHJlbG9jcy1kdW1teS5vIGRl
cGVuZGluZyBvbiBlZmkvcmVsb2NzLWR1bW15Lm8uCj4gPj4KPiA+PiBUaGVuLCB3aGVuIGFyY2gv
eDg2L2VmaS9NYWtlZmlsZSB0cmllcyB0byBidWlsZCByZWxvY3MtZHVtbXkubywgd2VsbAo+ID4+
IGVmaS9yZWxvY3MtZHVtbXkuUyBkb2Vzbid0IGV4aXN0Lgo+ID4+Cj4gPj4gSGF2ZSBvbmx5IG9u
ZSBtYWtlZmlsZSByZXNwb25zaWJsZSBmb3IgYnVpbGRpbmcgcmVsb2NzLWR1bW15Lm8uCj4gPiAK
PiA+IE9uIGEgc3lzdGVtIHdpdGggdG9vIG9sZCBhIHRvb2wgY2hhaW4gZm9yIHRoZSBFRkkgYnVp
bGQgdG8gZ2V0Cj4gPiBlbmFibGVkIEkgbm93IGdldCBhYm91dCBhIGRvemVuIGluc3RhbmNlcyBw
ZXIgYnVpbGQgb2YKPiA+IAo+ID4gbm06ICdlZmkvcmVsb2NzLWR1bW15Lm8nOiBObyBzdWNoIGZp
bGUKPiA+IAo+ID4gSSBkb24ndCBzdXBwb3NlIHlvdSBkaWQgdHJ5IG91dCB5b3VyIGNoYW5nZSBp
biBzdWNoIGFuIG9sZGlzaAo+ID4gZW52aXJvbm1lbnQ/IEkgYXNzdW1lIHRoZSBwcm9ibGVtIGFy
ZSB0aGVzZSB0d28gbGluZXM6Cj4gPiAKPiA+ICQoVEFSR0VUKS5lZmk6IFZJUlRfQkFTRSA9IDB4
JChzaGVsbCAkKE5NKSBlZmkvcmVsb2NzLWR1bW15Lm8gfCBzZWQgLW4gJ3MsIEEgVklSVF9TVEFS
VCQkLCxwJykKPiA+ICQoVEFSR0VUKS5lZmk6IEFMVF9CQVNFID0gMHgkKHNoZWxsICQoTk0pIGVm
aS9yZWxvY3MtZHVtbXkubyB8IHNlZCAtbiAncywgQSBBTFRfU1RBUlQkJCwscCcpCj4gPiAKPiA+
IEknbSBub3Qgc3VyZSBpdCBpcyB3ZWxsIGRlZmluZWQgd2hlbiBtYWtlIHdvdWxkIGV2YWx1YXRl
IHN1Y2gKPiA+IHRhcmdldCBzcGVjaWZpYyB2YXJpYWJsZSBhc3NpZ25tZW50cyAoaS5lLiBJJ20g
bm90IHN1cmUgdGhpcwo+ID4gZG9lc24ndCBwb2ludCBvdXQgYW4gaXNzdWUgZXZlbiBvbiBFRkkg
Y2FwYWJsZSB0b29sIGNoYWlucykuCj4gPiBUaGVuIGFnYWluIHRoZXNlIG5vdCB1c2luZyA6PSBz
aG91bGQgY2F1c2UgdGhlbSB0byBnZXQKPiA+IGV2YWx1YXRlZCBvbmx5IHVwb24gdXNlLCBpLmUu
IG5ldmVyLgo+IAo+IEFoLCB0aGlzIHdhcyB3cm9uZyAtIHRoZSAkKGd1YXJkKSBwcmVmaXggY2F1
c2VzIHRoZW0gdG8gZ2V0Cj4gZXZhbHVhdGVkIGV2ZW4gd2hlbiB4ZW4uZWZpIGNhbm5vdCBiZSBi
dWlsdC4gU28gSSBndWVzcyB0aGlzIGlzCj4ganVzdCBhIGNvc21ldGljIGlzc3VlIHRoZW4sIHdo
aWNoIHdvdWxkIGhvd2V2ZXIgc3RpbGwgYmUgbmljZQo+IHRvIHNlZSBhZGRyZXNzZWQuCgpUaGF0
ICQoZ3VhcmQpIHRoaW5nIGlzIHdlaXJkLCBhbmQgY2FuIHByb2JhYmx5IGJlIHJlcGxhY2Ugbm93
LgoKSSdsbCB0cnkgdG8gcmVtb3ZlIHRoYXQgdGhpbmcsIGFuZCBhbHNvIGF2b2lkIGhhdmluZyAk
KFRBUkdFVCkuZWZpCmRlcGVuZGluZyBvbiBlZmkvcmVsb2NzLWR1bW15Lm8gd2hlbiBpdCBpc24n
dCBnb2luZyB0byBiZSBidWlsdCAod2hlbgpYRU5fQlVJTERfRUZJPW4pLgoKLS0gCkFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
