Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8894206EC
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 14:29:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRFSn-0000D1-EH; Thu, 16 May 2019 12:26:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Nh3=TQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRFSl-0000Ct-6M
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:26:19 +0000
X-Inumbo-ID: cdd2dfbb-77d5-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cdd2dfbb-77d5-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 12:26:17 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: hjhGLis2KOAreCortrNrQ/5TkgkxiB0aOqH1zTmUYxz5MvXrPVgKjZlrkZzme4U0pQoRE/PGjT
 2G1y2ezrN4ZrfURP0mtx0+mBzzwXaEg4TmRU+fMqEuajKGYThhmH9lHVkmI+9GvWV3/7PKzL9k
 raJmwjRvytpygmkIlu2HoKxprqT54gR6KDxLvnGohcoh2SR6PRYPyEe+u2Qo5WXiqNFsZroNi0
 tm9a+du8li6tlfdMuzsNZEY/VRtv0d0GCGG6sbRNbrxFWwmboa5DhacEDjRQpkrAhy8DnOGezg
 WEo=
X-SBRS: 2.7
X-MesageID: 521084
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="521084"
To: "wencongyang (A)" <wencongyang2@huawei.com>,
 <xen-devel@lists.xenproject.org>
References: <6bca3b07-c2aa-124f-e77e-59d5eb7bbd5c@huawei.com>
 <5cdbd5ec-3ee9-04ff-5ce8-73c542b8b752@citrix.com>
 <e30d844e-72e6-8ec5-354c-e61ef5c82093@huawei.com>
 <67885e5e-d67c-8067-eded-69290429714b@citrix.com>
 <cdd37ad5-d54f-6f52-bbb6-49ef7a7ace21@huawei.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f20276c6-28cc-5e7c-ac56-d6f0e6969de7@citrix.com>
Date: Thu, 16 May 2019 13:26:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cdd37ad5-d54f-6f52-bbb6-49ef7a7ace21@huawei.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Question about MDS mitigation
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
Cc: gaowanlong <gaowanlong@huawei.com>,
 "Liujinsong \(Paul\)" <liu.jinsong@huawei.com>, maoming.maoming@huawei.com,
 Huangzhichao <huangzhichao@huawei.com>, "Chentao
 \(Boby\)" <boby.chen@huawei.com>, guijianfeng <guijianfeng@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDUvMjAxOSAxMjo0OCwgd2VuY29uZ3lhbmcgKEEpIHdyb3RlOgo+Cj4gT24gMjAxOS81
LzE2IDE1OjU4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNi8wNS8yMDE5IDA4OjU2LCB3
ZW5jb25neWFuZyAoQSkgd3JvdGU6Cj4+PiBPbiAyMDE5LzUvMTYgMTU6MzgsIEFuZHJldyBDb29w
ZXIgd3JvdGU6Cj4+Pj4gT24gMTYvMDUvMjAxOSAwMzo0Niwgd2VuY29uZ3lhbmcgKEEpIHdyb3Rl
Ogo+Pj4+PiBIaSBhbGwKPj4+Pj4KPj4+Pj4gRmlsbCBidWZmZXJzLCBsb2FkIHBvcnRzIGFyZSBz
aGFyZWQgYmV0d2VlbiB0aHJlYWRzIG9uIHRoZSBzYW1lIHBoeXNpY2FsIGNvcmUuCj4+Pj4+IFdl
IG5lZWQgdG8gcnVuIG1vcmUgdGhhbiBvbmUgdm0gb24gdGhlIHNhbWUgcGh5c2ljYWwgY29yZS4K
Pj4+Pj4gSXMgdGhlcmUgYW55IGNvbXBsZXRlIG1pdGlnYXRpb24gZm9yIGVudmlyb25tZW50cyB1
dGlsaXppbmcgU01UPwo+Pj4+IE5vIC0gbm90IHJlYWxseS4KPj4+Pgo+Pj4+IEFuIGFwcHJvYWNo
IHdoaWNoIHdhcyB3b3JrZWQgb24gd2FzIHRoYXQgb2Ygc3luY2hyb25pc2VkIHNjaGVkdWxpbmcs
Cj4+Pj4gd2hlcmVieSBwcml2aWxlZ2UgdHJhbnNpdGlvbnMgYXJlIHN5bmNyaG9uaXNlZCB0byBl
bnN1cmUgdGhhdCB3ZSdyZQo+Pj4+IG5ldmVyIHJ1bm5pbmcgY29kZSBmcm9tIGRpZmZlcmVudCBw
cml2aWxlZ2UgbGV2ZWxzIGNvbmN1cnJlbnRseSBvbgo+Pj4+IGFkamFjZW50IHRocmVhZHMuICAo
VGhpcyBpcyB0aGUgbWl0aWdhdGlvbiBkZXNjcmliZWQgYXMgR3JvdXAgU2NoZWR1bGluZwo+Pj4+
IGluCj4+Pj4gaHR0cHM6Ly9zb2Z0d2FyZS5pbnRlbC5jb20vc2VjdXJpdHktc29mdHdhcmUtZ3Vp
ZGFuY2UvaW5zaWdodHMvZGVlcC1kaXZlLWludGVsLWFuYWx5c2lzLW1pY3JvYXJjaGl0ZWN0dXJh
bC1kYXRhLXNhbXBsaW5nCj4+Pj4gKQo+Pj4gc3luY2hyb25pc2VkIHNjaGVkdWxpbmcgaXMgbm90
IGEgY29tcGxldGUgbWl0aWdhdGlvbi4gR3Vlc3QgQSBhbmQgR3Vlc3QgQgo+Pj4gcnVuIG9uIHRo
ZSBzYW1lIHBoeXNpY2FsIGNvcmUsIGFuZCB0aGUgcHJpdmlsZWdlIGxldmVsIGlzIHRoZSBzYW1l
LiBTbwo+Pj4gR3Vlc3QgQSBjYW4gaW5mZXIgZGF0YSBmcm9tIEd1ZXN0IEIuIEd1ZXN0IEEgY2Fu
bm90IGluZmVyIGRhdGEgZnJvbSBoeXBlcnZpc29yCj4+PiBiZWNhdXNlIHRoZXkgYXJlIGluIGRp
ZmZlcmVudCBwcml2aWxlZ2UgbGV2ZWxzLgo+PiBUaGlzIGlzIChvbmUgb2YgdGhlIHJlYXNvbnMp
IHdoeSBjb3JlIHNjaGVkdWxpbmcgaXMgYSBwcmVyZXF1aXNpdGUgdG8KPj4gc3luY2hyb25pc2Vk
IHNjaGVkdWxpbmcuCj4+Cj4+IFdpdGggY29yZSBzY2hlZHVsaW5nIGFjdGl2ZSwgeW91IHdpbGwg
bmV2ZXIgaGF2ZSBndWVzdCBBIGFuZCBCCj4+IGNvbmN1cnJlbnRseSBydW5uaW5nIG9uIGFkamFj
ZW50IHRocmVhZHMgb2YgdGhlIHNhbWUgY29yZS4KPiBBbm90aGVyIHF1ZXN0aW9uOgo+IFRoZXJl
IGFyZSBhIENQVUlEIGJpdChUU1hfRk9SQ0VfQUJPUlQpIGFuZCBNU1IoTVNSX1RTWF9GT1JDRV9B
Qk9SVCkgaW4geHNhMjk3L3hzYTI5Ny00LjctMS5wYXRjaC4KPiBCdXQgd2UgZG8gbm90IGZpbmQg
dGhlbSBpbiB0aGUgcGF0Y2hzIG9mIGt2bS4KPgo+IElJVUMsIHRoaXMgTVNSIGlzIG5vdCBmb3Ig
TURTIG1pdGlnYXRpb24uIElzIHRoaXMgcmlnaHQ/CgpPb3BzIC0gSSBpbnRlbmRlZCB0byBtYWtl
IHRoaXMgYSBiaXQgbW9yZSBjbGVhciBpbiB0aGUgYWR2aXNvcnkuCgpDb3JyZWN0IC0gdGhpcyBp
c24ndCB0byBkbyB3aXRoIE1EUywgYnV0IHRoZSBiZWhhdmlvdXJhbCBjaGFuZ2Ugd2FzIGluCnRo
ZSBzYW1lIHBpZWNlIG9mIG1pY3JvY29kZSBhcyB0aGUgTURTIGZpeGVzLCB3aGljaCBpcyB3aHkg
aXQgd2FzIGluY2x1ZGVkLgoKU2VlCmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2RvY3MvdW5zdGFi
bGUvbWlzYy94ZW4tY29tbWFuZC1saW5lLmh0bWwjdnBtdS14ODYKYW5kIHJ0bS1hYm9ydD08Ym9v
bD4gZm9yIHRoZSBkZXRhaWxzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
