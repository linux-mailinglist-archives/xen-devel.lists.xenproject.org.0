Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C45D6E786
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 16:45:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoU5B-0002Qm-PE; Fri, 19 Jul 2019 14:42:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tC9P=VQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hoU5A-0002Qh-4Z
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 14:42:00 +0000
X-Inumbo-ID: 5bdead04-aa33-11e9-8644-d3d8a6d9fb62
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bdead04-aa33-11e9-8644-d3d8a6d9fb62;
 Fri, 19 Jul 2019 14:41:57 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2EvaKkNPpbJlWbNV5aX0T9guUhu4s2w3NE8tmi9wpjq1r5TguALwGzN6/JnyiZEskGddp5XUrp
 RJNKwsU85aRqe8TJLALa2edGBIRT05/nwOwrGbui7ATGJadThLpSuRVWEWFz7GOx4Nh+OCClnD
 C9I3xDlVEbtj2lraS75PX/P1E0xheUNKp+PybHxaz/3Bi8ldkwLIF5e4apiszaHvgVtzOlnltQ
 ZN9Wdqqr3ojA3cxqoztxpVcvcDu4YL+DUBdxLwp54glgf6BFg2yBPn7Ta2zMehHCuq5y9JQfQM
 4Wo=
X-SBRS: 2.7
X-MesageID: 3277610
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,282,1559534400"; 
   d="scan'208";a="3277610"
To: Laszlo Ersek <lersek@redhat.com>, Anthony PERARD
 <anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-7-anthony.perard@citrix.com>
 <a91c8d00-a40b-3906-6432-b9e0c2953843@citrix.com>
 <20190719102008.GB1208@perard.uk.xensource.com>
 <03cc01a5-d6a8-84b7-d382-d83fadea486b@redhat.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c2f583f7-a88c-010a-115d-2df4457dba5e@citrix.com>
Date: Fri, 19 Jul 2019 15:41:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <03cc01a5-d6a8-84b7-d382-d83fadea486b@redhat.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 06/35] OvmfPkg/XenResetVector: Add new
 entry point for Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDcvMjAxOSAxNTozMywgTGFzemxvIEVyc2VrIHdyb3RlOgo+IE9uIDA3LzE5LzE5IDEy
OjIwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPj4gT24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDI6
NTc6MDZQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDA0LzA3LzIwMTkgMTU6
NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblJl
c2V0VmVjdG9yL0lhMTYvUmVzZXRWZWN0b3JWdGYwLmFzbSBiL092bWZQa2cvWGVuUmVzZXRWZWN0
b3IvSWExNi9SZXNldFZlY3RvclZ0ZjAuYXNtCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+
PiBpbmRleCAwMDAwMDAwMDAwLi45NTgxOTViYzVlCj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsr
KyBiL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWExNi9SZXNldFZlY3RvclZ0ZjAuYXNtCj4+Pj4g
K3Z0ZlNpZ25hdHVyZToKPj4+PiArICAgIERCICAgICAgJ1YnLCAnVCcsICdGJywgMAo+Pj4+ICsK
Pj4+PiArQUxJR04gICAxNgo+Pj4+ICsKPj4+PiArcmVzZXRWZWN0b3I6Cj4+Pj4gKzsKPj4+PiAr
OyBSZXNldCBWZWN0b3IKPj4+PiArOwo+Pj4+ICs7IFRoaXMgaXMgd2hlcmUgdGhlIHByb2Nlc3Nv
ciB3aWxsIGJlZ2luIGV4ZWN1dGlvbgo+Pj4+ICs7Cj4+Pj4gKyAgICBub3AKPj4+PiArICAgIG5v
cAo+Pj4gV2h5IHR3byBub3BzPwo+PiBJIGRvbid0IGtub3csIHRoaXMgaXMgZXhpc3RpbmcgY29k
ZSB0aGF0IEkgZHVwbGljYXRlZCB0byBhbGxvdyBhZGRpbmcgYQo+PiBuZXcgZW50cnkgcG9pbnQu
IChJIHdhbnRlZCB0byB1c2UgLS1maW5kLWNvcGllcy1oYXJkZXIgd2hlbiBzZW5kaW5nIHRoZQo+
PiBwYXRjaCwgYnV0IGZvcmdvdCB0aGlzIHRpbWUuCj4gTm90IGEgYmlnIHByb2JsZW07IHdoaWxl
IHJldmlld2luZyB2MywgSSBkaWQgc3VjaCBjb21wYXJpc29ucyBteXNlbGYsIGluCj4gbXkgbG9j
YWwgY2xvbmUuIEZlZWwgZnJlZSB0byBza2lwICItLWZpbmQtY29waWVzLWhhcmRlciIgd2hlbiBw
b3N0aW5nIHY0Cj4gdG9vOyBJIHRoaW5rIHRoZXJlIGlzbid0IG11Y2ggY2h1cm4gZ29pbmcgb24g
aW4gcGFyYWxsZWwgcmlnaHQgbm93Lgo+Cj4gSG93ZXZlciwgYSBuZXcgcmVxdWVzdCBmb3IgdjQ6
IHBsZWFzZSBtYWtlIHN1cmUgdGhhdCB0aGUgbmV3IG1vZHVsZXMgLwo+IHBhdGhzIGludHJvZHVj
ZWQgYnkgdGhpcyBwYXRjaCBzZXQgYXJlIGNvdmVyZWQgaW4gTWFpbnRhaW5lcnMudHh0Lgo+Cj4+
IFRoaXMgcGFydCBvZiB0aGUgY2h1bmsgd291bGQgbm90IGJlIHRoZXJlLikKPiBSZWdhcmRpbmcg
dGhlIE5PUHM6IGFsbCBJIGNhbiB0ZWxsIHlvdSBpcyB0aGF0IHRoZXkgb3JpZ2luYXRlIGZyb20K
PiBjb21taXQgODMzMjk4M2UyZTMzICgiVWVmaUNwdVBrZzogUmVwbGFjZSB0aGUgdW4tbmVjZXNz
YXJ5IFdCSU5WRAo+IGluc3RydWN0aW9uIGF0IHRoZSByZXNldCB2ZWN0b3Igd2l0aCB0d28gTk9Q
cyBpbiBWVEYwLiIsIDIwMTEtMDgtMDQpLgo+Cj4gV2hldGhlciB0aGF0IGNoYW5nZSBtYWRlIHNl
bnNlIGJhY2sgdGhlbiwgbGV0IGFsb25lIGlmIGl0IG1ha2VzIHNlbnNlCj4gbm93OiBubyBjbHVl
LgoKRHJvcHBpbmcgd2JpbnZkIG1ha2VzIHNlbnNlLCBiZWNhdXNlIHdoZW4gdmlydHVhbGlzZWQs
IHRoZSBjYWNoZXMgKGFuZApwYWdpbmcgZm9yIHRoYXQgbWF0dGVyKSBhcmUgYWx3YXlzIHVwIGFu
ZCBydW5uaW5nIGNvcnJlY3RseS7CoCBJdHMgYW4KdW5uZWNlc3Nhcnkgdm1leGl0IGZvciBzb21l
dGhpbmcgd2hpY2ggdGhlIGh5cGVydmlzb3Igd2lsbCBub3Agb3V0IGFueXdheS4KCkxlYXZpbmcg
dHdvIG5vcHMgYmVoaW5kIG1ha2VzIG5vIHNlbnNlIGF0IGFsbC4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
