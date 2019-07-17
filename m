Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601CC6C018
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 19:12:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnnR5-00074J-5P; Wed, 17 Jul 2019 17:09:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CQpx=VO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hnnR3-00074E-Lb
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 17:09:45 +0000
X-Inumbo-ID: ac54ecd5-a8b5-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ac54ecd5-a8b5-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 17:09:44 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lXWKOwXeiNMufnsvOR7xrLNyWxPAPhn+ONuGfIXUPw30vEaQJzPeFHS3oeW62Qqs+HG7va9HPt
 5Igqfw5+Kj7V4Gvq1fgSEWtaXbZhK1PW1q4vtMB09eE41vjR3YGsKpJ2c1ON2fwocKkPeNfsxX
 Z/We3fLMDiE/1Ekd/bJPE+rGASjOuYTE5C7HxCNLBYoVf553G6RH3WU5bixu3UbnD+aIzgMhSl
 LH4hsRlVNwJ/sCV1KA2PSrOedfSVIH1di5DAGDIMEUoLGPlihIqqR3z1/v5qBkIMI/Qr6qqB/b
 xg0=
X-SBRS: 2.7
X-MesageID: 3122363
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,275,1559534400"; 
   d="scan'208";a="3122363"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <d7b10cdc-b33a-0297-458d-1bad42727fa0@suse.com>
 <18e7f37f-826e-0671-9d2c-1a33b1d1d6f3@citrix.com>
 <798637b0-2b1c-9ca0-43af-408868072eaf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <20c99768-6677-c322-8a4c-cdcaefff8f02@citrix.com>
Date: Wed, 17 Jul 2019 18:09:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <798637b0-2b1c-9ca0-43af-408868072eaf@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH RFC] x86emul: unconditionally deliver #UD
 for LWP insns
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDcvMjAxOSAxNDowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMDcuMjAxOSAx
Mzo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTcvMDcvMjAxOSAwNzo0MiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBUaGlzIGlzIHRvIGFjY29tcGFueSBjb21taXQgICgieDg2L3N2bTog
RHJvcCBzdXBwb3J0IGZvciBBTUQncwo+PiA5MWY4NmY4NjM0Cj4gSG1tLCBvZGQgLSBJJ20gc3Vy
ZSBJIGhhZCBjaGVja2VkLCByZXN1bHRpbmcgaW4gdGhlIGltcHJlc3Npb24gdGhhdAo+IHRoaXMg
ZGlkbid0IGdldCBjb21taXR0ZWQgeWV0Lgo+Cj4+PiBMaWdodHdlaWdodCBQcm9maWxpbmciKS4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pgo+
Pj4gLS0tCj4+PiBXaXRoIEFNRCBhcHBhcmVudGx5IGhhdmluZyBhYmFuZG9uZWQgWE9QIGVuY29k
ZWQgaW5zbnMsIGFub3RoZXIgb3B0aW9uCj4+PiB3b3VsZCBzZWVtIHRvIGJlIHRvIHNpbXBseSB3
aXJlIGFsbCB1bnJlY29nbml6ZWQgb25lcyBpbnRvICNVRCAocmF0aGVyCj4+PiB0aGVuIHJldHVy
bmluZyBVTklNUExFTUVOVEVEL1VOUkVDT0dOSVpFRCkuCj4+IFRoZXJlIGFyZSBzdGlsbCBzb21l
IFhPUCBpbnN0cnVjdGlvbnMgd2hpY2ggYWN0dWFsbHkgd29yayBvbiBGYW0xN2gKPj4gcHJvY2Vz
c29ycywgaWYgeW91IGlnbm9yZSBDUFVJRCBhbmQgZ28gYmxpbmRseSBleGVjdXRpbmcuCj4+Cj4+
IEdpdmVuIG5vIG9mZmljaWFsIHN0YXRlbWVudCB0aGF0IFhPUCBpcyBkZWFkLCBJJ2Qga2VlcCB0
aGUgc3VwcG9ydCB3ZQo+PiBjdXJyZW50bHkgaGF2ZS4KPiBUaGVuIG15IHJlbWFyayB3YXNuJ3Qg
Y2xlYXIgZW5vdWdoOiBJJ20gbm90IHN1Z2dlc3RpbmcgdG8gcmlwIG91dAo+IFhPUCBpbnNuIHN1
cHBvcnQgd2UgaGF2ZS4gSSdtIGluc3RlYWQgY29uc2lkZXJpbmcgd2hldGhlciB0byB3aXJlCj4g
YWxsIHVuc3VwcG9ydGVkIFhPUCBlbmNvZGluZ3MgaW50byAjVUQgKHJhdGhlciB0aGFuIHJldHVy
bgo+IFVOSU1QTEVNRU5URUQvVU5SRUNPR05JWkVEIGZvciB0aGVtKSwgbm90IGp1c3QgdGhlIExX
UCBvbmVzLgoKQWgsIGluIHdoaWNoIGNhc2UsIG5vLsKgIFR1cm5pbmcgYWxsIHVua25vd24gaW5z
dHJ1Y3Rpb25zIGludG8KRVhDRVBUSU9OLyNVRCB3aWxsIGJyZWFrIGludHJvc3BlY3Rpb24sIHdo
aWNoIHVzZXMgVU5SRUNPR05JU0VEIHRvIGNvdmVyCnRoZSBnYXBzIGluIHRoZSBlbXVsYXRvciBi
eSBzaW5nbGUtc3RlcHBpbmcgdGhlIHZjcHUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
