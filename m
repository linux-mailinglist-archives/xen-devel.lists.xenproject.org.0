Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A883C6EA1C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 19:30:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoWf5-0007zV-Pm; Fri, 19 Jul 2019 17:27:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tC9P=VQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hoWf3-0007zQ-PH
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 17:27:13 +0000
X-Inumbo-ID: 6fde2232-aa4a-11e9-99d0-7750cbe430fe
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fde2232-aa4a-11e9-99d0-7750cbe430fe;
 Fri, 19 Jul 2019 17:27:09 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8aMZOBUYAtbIyTEtg9GKuhxBq/k9zJ7dKv0q4Y5mcghbDtUlImxFKa8kekcBWcMQuZ1wxrUmbD
 dXyEM3UwjNRwy0MC08fduL4tlXrokWun2RAFPmezg1QdTq03s971c4myikcSrmrQ9PhHUcgTLn
 Etrl0yfP6wbvbNRnvfeOmY0HWS02w4/ohpn9d3NxA43zgEMRr01OcRcOEhZk35rhM55rm2G+kZ
 6nwkyfgPX8uYAza/xJNOtS8cSXD8cBfCrVQ2ijoV2NejMdE5kbttTseK1ya1u/i1hu4utfh0CW
 NSA=
X-SBRS: 2.7
X-MesageID: 3305351
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,283,1559534400"; 
   d="scan'208";a="3305351"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <94c28919-81cd-e6fa-aa43-e05dfea7cbed@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9612f97f-904d-7b72-cff9-ead2e8590ffc@citrix.com>
Date: Fri, 19 Jul 2019 18:27:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <94c28919-81cd-e6fa-aa43-e05dfea7cbed@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 08/14] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDcvMjAxOSAxNzozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhpcyBpcyBpbiBwcmVw
YXJhdGlvbiBvZiBhY3R1YWxseSBlbmFibGluZyB4MkFQSUMgbW9kZSwgd2hpY2ggcmVxdWlyZXMK
PiB0aGlzIHdpZGVyIElSVEUgZm9ybWF0IHRvIGJlIHVzZWQuCj4KPiBBIHNwZWNpZmljIHJlbWFy
ayByZWdhcmRpbmcgdGhlIGZpcnN0IGh1bmsgY2hhbmdpbmcKPiBhbWRfaW9tbXVfaW9hcGljX3Vw
ZGF0ZV9pcmUoKTogVGhpcyBieXBhc3Mgd2FzIGludHJvZHVjZWQgZm9yIFhTQS0zNiwKPiBpLmUu
IGJ5IDk0ZDRhMTExOWQgKCJBTUQsSU9NTVU6IENsZWFuIHVwIG9sZCBlbnRyaWVzIGluIHJlbWFw
cGluZwo+IHRhYmxlcyB3aGVuIGNyZWF0aW5nIG5ldyBvbmUiKS4gT3RoZXIgY29kZSBpbnRyb2R1
Y2VkIGJ5IHRoYXQgY2hhbmdlIGhhcwo+IG1lYW53aGlsZSBkaXNhcHBlYXJlZCBvciBmdXJ0aGVy
IGNoYW5nZWQsIGFuZCBJIHdvbmRlciBpZiAtIHJhdGhlciB0aGFuCj4gYWRkaW5nIGFuIHgyYXBp
Y19lbmFibGVkIGNoZWNrIHRvIHRoZSBjb25kaXRpb25hbCAtIHRoZSBieXBhc3MgY291bGRuJ3QK
PiBiZSBkZWxldGVkIGFsdG9nZXRoZXIuIEZvciBub3cgdGhlIGdvYWwgaXMgdG8gYWZmZWN0IHRo
ZSBub24teDJBUElDCj4gcGF0aHMgYXMgbGl0dGxlIGFzIHBvc3NpYmxlLgoKVGhlcmUgYXJlIHBs
ZW50eSBvZiBtaXN0YWtlcyB3aXRoIFhTQS0zNi7CoCBSZWFkaW5nIHRoZSBYU0EgYmFjaywgdGhl
Ck1JVElHQVRJT04gc2VjdGlvbiBnZXRzIHRoZSBzZW5zZSBvZiB0aGUgaW9tbXU9YW1kLWlvbW11
LXBlcmRldi1pbnRyZW1hcApib29sZWFuIHRoZSB3cm9uZyB3YXkgYXJvdW5kLsKgIE9oIHdlbGwu
Li4KClNQNTEwMCBlcnJhdHVtIDI4IG9ubHkgcmVxdWlyZXMgdGhhdCB0aGUgSURFIGFuZCBTQVRB
IGRldmljZXMgc2hhcmUKdGFibGVzLCBub3QgdGhhdCBldmVyeSBkZXZpY2Ugb24gdGhlIHdob2xl
IHN5c3RlbSBzaGFyZXMgdGFibGVzLgoKV2l0aCB0aGUgcHJvcG9zZWQgd29yayB0byBwZXJmb3Jt
IElPTU1VIGFzc2lnbm1lbnQgYnkgZ3JvdXAgcmF0aGVyIHRoYW4KaW5kaXZpZHVhbGx5LCB0aGlz
IHdpbGwgbmF0dXJhbGx5IGZhbGwgb3V0IGFzIGEgcXVpcmsgcmVxdWlyaW5nIHRoZSB0d28KZGV2
aWNlcyB0byBiZSBncm91cGVkLCBhdCB3aGljaCBwb2ludCB3ZSBjYW4gZHJvcCBhbGwgcmVtbmFu
dHMgb2YgZ2xvYmFsCnJlbWFwcGluZyB0YWJsZXMuCgpJbiB0aGlzIGNhc2UsIEknbSBub3Qgc3Vy
ZSBpdCBpcyB3b3J0aCBjYXJpbmcgYWJvdXQgc2hhcmVkLXRhYmxlIG1vZGUgb24KeDJhcGljLWNh
cGFibGUgc3lzdGVtcy7CoCAwIHBlb3BsZSB3aWxsIGJlIHVzaW5nIHRoYXQgbW9kZS7CoCBUaGF0
IHNhaWQsCmlmIGl0cyBlYXNpZXIgdG8gd2FpdCB1bnRpbCB0aGUgSU9NTVUgY2hhbmdlcyB0byBt
YWtlIHRoaXMgYWRqdXN0bWVudCwKdGhlbiBmaW5lLgoKPiBAQCAtMTQyLDcgKzE3OCwxNSBAQCBz
dGF0aWMgdm9pZCBmcmVlX2ludHJlbWFwX2VudHJ5KGNvbnN0IHN0Cj4gICB7Cj4gICAgICAgdW5p
b24gaXJ0ZV9wdHIgZW50cnkgPSBnZXRfaW50cmVtYXBfZW50cnkoaW9tbXUsIGJkZiwgaW5kZXgp
Owo+ICAgCj4gLSAgICBBQ0NFU1NfT05DRShlbnRyeS5wdHIzMi0+cmF3WzBdKSA9IDA7Cj4gKyAg
ICBpZiAoIGlvbW11LT5jdHJsLmdhX2VuICkKPiArICAgIHsKPiArICAgICAgICBBQ0NFU1NfT05D
RShlbnRyeS5wdHIxMjgtPnJhd1swXSkgPSAwOwo+ICsgICAgICAgIC8qIExvdyBoYWxmIChjb250
YWluaW5nIFJlbWFwRW4pIG5lZWRzIHRvIGJlIGNsZWFyZWQgZmlyc3QuICovCj4gKyAgICAgICAg
YmFycmllcigpOwoKV2hpbGUgdGhpcyB3aWxsIGZ1bmN0aW9uIG9uIHg4NiwgSSBzdGlsbCBjb25z
aWRlciB0aGlzIGJ1Z2d5LsKgIEZyb20gYQpjb25jZXB0dWFsIHBvaW50IG9mIHZpZXcsIGJhcnJp
ZXIoKSBpcyBub3QgdGhlIGNvcnJlY3QgY29uc3RydWN0aW9uIHRvCnVzZSwgd2hlcmVhcyBzbXBf
d21iKCkgaXMuCgpBcyB0aGlzIGlzIHRoZSBvbmx5IHJlbWFpbmluZyBpc3N1ZSwgd2l0aCBpdCBm
aXhlZCBpbiBlYWNoIGxvY2F0aW9uLApBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
