Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D94AB1C1C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 13:24:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8jdf-0004Gq-9M; Fri, 13 Sep 2019 11:21:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FEpq=XI=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1i8jde-0004Gl-3T
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 11:21:18 +0000
X-Inumbo-ID: 9a5bd67d-d618-11e9-95aa-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a5bd67d-d618-11e9-95aa-12813bfff9fa;
 Fri, 13 Sep 2019 11:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568373677;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=K1h4ZXuUoGkWMDDbkKsZgDjlBsUCz2p/7slWqJ46pFo=;
 b=B3CKPtlQHYtux8F2HjyOkKTZU7/uFqYGu09VjbTK82ExYiDiNbg5JkGB
 Ubl41feskQXfM23jKbrWXZ+zMbnGHH2qxYUVXIBDyeX4EkUCA7VG4cfpt
 GbsQbMnRB/ewn4fI/7nUxSB05i249ez8x1dGX34rbACCDhCiPksS2eXfQ 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LBfmu1gdhq7PDd1N1I6GYOQu2M1Bzn98NZkojRtvmYxqIsbOSJdtojLySsaebX7XFQH165jD7E
 2gzndtkAWAkKtQjOQI+MlovNSy6Nkl2dBK7v9zOg2Cld8shGBnupXZuFYStH6W5yVdPkUL5nW4
 /NxzRbFWEhC+A8HhRfEaqRJ04Afpm03oJYrjqUE+TZSalqSTGfdkEEynJ9aWx+jx+1wpMz4BnR
 /kL88db5UYN/plPW2Wxq8Rib+/LtSUIfJljSqHTR6w5PwIaqoKtxXN1/LsNOziTaSEUSfC4oTI
 gqU=
X-SBRS: 2.7
X-MesageID: 5728032
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,500,1559534400"; 
   d="scan'208";a="5728032"
To: Nicholas Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
 <c1c1663b-81ea-4704-e21e-c27a6d5999ba@citrix.com>
 <3da1f8bd6ee94d03b76d9f54e16de8a5@ainfosec.com>
 <da37ddde-0148-7e91-5dba-276df823d895@citrix.com>
 <bb81297d6d7441399425fd6079ac8bb7@ainfosec.com>
 <24acd142b70345038dc0dfdd61bb9520@ainfosec.com>
 <76c02038-fcce-2774-c4f5-73ab9e0fdeef@citrix.com>
 <102c4923aacb48b9b80795e65107451a@ainfosec.com>
 <871a9191-f32b-383e-4f78-1a0a79737cd8@citrix.com>
 <dbeeb071-25ae-9652-4be1-e3067109179f@citrix.com>
 <6e12ee2ca2d846e38450bd40bf73dde4@ainfosec.com>
 <75c37260-3ff9-0731-ec0c-a1cb6a6acfea@citrix.com>
 <1be9800ff98f4cff82a72e747286f5f5@ainfosec.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <4ebed087-27b6-c473-6bca-487e2bf85381@citrix.com>
Date: Fri, 13 Sep 2019 12:21:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1be9800ff98f4cff82a72e747286f5f5@ainfosec.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] Generating Go bindings for libxl
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
Cc: "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 Brendan Kerrigan <kerriganb@ainfosec.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xMi8xOSA2OjM1IFBNLCBOaWNob2xhcyBSb3Nicm9vayB3cm90ZToKPiBJJ20gbm90IHN0
cm9uZ2x5IG9wcG9zZWQgdG8gdGhlIHN0cnVjdCBkdXBsaWNhdGlvbiwgYnV0IEkgZG8gcHJlZmVy
IHRoZSBhYmlsaXR5Cj4gdG8gcGVyZm9ybSB0eXBlIGFzc2VydGlvbnMgYXMgYSB3YXkgdG8gZGV0
ZXJtaW5lIHdoaWNoIGZpZWxkIGlzICJ2YWxpZC4iCgpGYWlyIGVub3VnaC4KCj4+IFNvIHRoZSBh
ZHZhbnRhZ2Ugb2YgdGhpcyBpcyB0aGF0IHlvdSBjYW4ganVzdCBjYWxsOgo+Pgo+PiDCoMKgwqAg
ZnJvbUMoJmRpLCAmY2RpKQo+Pgo+PiBSYXRoZXIgdGhhbjoKPj4KPj4gwqDCoMKgIGRpLmZyb21D
KCZjZGkpCj4+Cj4+ID8KPj4KPj4gQnV0IHRoZSBjb3N0IGZvciB0aGlzIGlzIHRoYXQgd2UncmUg
c3dpdGNoaW5nIGZyb20gc3RhdGljIHR5cGUtY2hlY2tpbmcKPj4gdG8gZHluYW1pYyB0eXBlLWNo
ZWNraW5nLsKgIElmIGluIHRoZSBmaXJzdCBleGFtcGxlLCBjZGkgaXMgdGhlIHdyb25nCj4+IHR5
cGUgKGZvciBpbnN0YW5jZSwgaWYgd2UgZm9yZ2V0IHRoZSAmIGF0IHRoZSBmcm9udCksIGV2ZXJ5
dGhpbmcgd2lsbAo+PiBjb21waWxlLCBhbmQgd2Ugd29uJ3Qgbm90aWNlIHVubGVzcyB0aGUgZnVu
Y3Rpb24gYWN0dWFsbHkgZ2V0cyBjYWxsZWQuCj4+IEluIHRoZSBzZWNvbmQgZXhhbXBsZSwgaWYg
d2UncmUgbm90IHRyeWluZyB0byBpbXBsZW1lbnQgYSBnZW5lcmljCj4+ICJtYXJzaGFsZXIiIG1l
dGhvZCwgd2UgY2FuIGRlZmluZSB0aGUgZnVuY3Rpb24gc2lnbmF0dXJlIHRvIHNwZWNpZnkKPj4g
ZXhhY3RseSB3aGF0IHBvaW50ZXIgd2UgbmVlZC4KPiAKPiBUaGUgYWR2YW50YWdlIGlzIGl0IHNp
bXBsaWZpZXMgdGhlIGdlbmVyYXRlZCBjb2RlJ3MgZXJyb3IgaGFuZGxpbmcuIEhvd2V2ZXIsCj4g
SSB3YXMgcmUtdGhpbmtpbmcgdGhpcyBwb3J0aW9uIGFzIHdlbGwsIGJlY2F1c2UgZ2l2aW5nIHVw
IHRoZSBzdGF0aWMgdHlwZQo+IGNoZWNraW5nIGlzIG5vdCB3b3J0aCAiY2xlYW5lciIgZ2VuZXJh
dGVkIGNvZGUuIEknbGwgbWFrZSB0aGF0IGNoYW5nZS4KCkFoLCByaWdodCB0aGUgbWFpbiBwdXJw
b3NlIHdhcyB0byBoYXZlIHRoZSBzaW5nbGUgcGxhY2UgYXQgdG9wIHRvIGNhdGNoCiBleGNlcHRp
b25zXldeVyByZWNvdmVyIGZyb20gcGFuaWNzLCBub3Qgc28gbXVjaCBiZWNhdXNlIG9uZSBmb3Jt
IG9mIHRoZQpmdW5jdGlvbiB3YXMgbmljZXIgdGhhbiB0aGUgb3RoZXIgb25lLiAgU3RpbGwsIEkg
dGhpbmsgc3RhdGljIHR5cGUKY2hlY2tpbmcgaXMgYSBiaWcgdGhpbmcgdG8gZ2l2ZSB1cCB0byBt
YWtlIGdlbmVyYXRlZCBjb2RlIGNsZWFuZXIuICBUaGFua3MuCgo+PiBJJ2QgYmUgdGVtcHRlZCB0
byBzYXkganVzdCBkbyBzb21ldGhpbmcgbGlrZToKPj4KPj4gdHlwZSBDcHVpZFBvbGljeUxpc3Qg
c3RydWN0IHsKPj4gwqDCoMKgIHZhbCBDLmxpYnhsX2NwdWlkX3BvbGljeV9saXN0Cj4+IH07Cj4+
Cj4+IEEgcGFydCBvZiBtZSB0aGlua3MgZXZlbiBzb21ldGhpbmcgbGlrZSB0aGlzIHdvdWxkbid0
IGJlIHRlcnJpYmxlOgo+Pgo+PiB0eXBlIENwdWlkUG9saWN5TGlzdCBDLmxpYnhsX2NwdWlkX3Bv
bGljeV9saXN0Cj4+Cj4+IEl0ICJsZWFrcyIgdGhlIGludGVybmFscyBvdXQgdG8gdGhlIGNhbGxl
cnMsIGJ1dCBpdCBhbHNvIG1lYW5zIHlvdSBkb24ndAo+PiBoYXZlIHRvIGRvIGFsbCB0aGlzIGZh
ZmYgb2YgbWFyc2hhbGxpbmcgLyB1bm1hcnNoYWxsaW5nIHdoYXQncwo+PiBlc3NlbnRpYWxseSBq
dXN0IGEgcG9pbnRlci4KPiAKPiBJIGRvbid0IHRoaW5rIGl0J3MgYSBnb29kIGlkZWEgdG8gZXhw
b3NlIHRoZSBDIHR5cGUuIEJlc2lkZXMgdGhlIGZhY3QgdGhhdCBbMl0KPiBleHBsaWNpdGx5IHN0
YXRlcyBub3QgdG8gZG8gdGhpcywgZXhwb3J0aW5nIHRoaXMgdHlwZSBnaXZlcyB0aGUgZmFsc2Ug
aWRlYSB0aGF0Cj4gdGhpcyB0eXBlIGlzIHNvbWVob3cgcG9ydGFibGUuCgpBY2suCgo+PiBJdCBz
b3J0IG9mIGxvb2tzIGxpa2UgdGhpcyBpcyBhbiBlbnRpcmVseSBpbnRlcm5hbCB0aGluZyB0aGF0
IGxpYnhsCj4+IHVzZXMuwqAgSSB0aGluayB0byBiZWdpbiB3aXRoIHdlIGNhbiBqdXN0IGRlY2xh
cmUgdGhpcyBhcyBhbiBlbXB0eQo+PiBzdHJ1Y3QsIGFuZCBmaWd1cmUgb3V0IHdoYXQgdG8gcHV0
IGluIGl0IG9uY2UgaXQgYmVjb21lcyBtb3JlIGNsZWFyIGhvdwo+PiBpdCBuZWVkcyB0byBiZSB1
c2VkLgo+IAo+IE9rYXksIHdpbGwgZG8uCgpGV0lXIGNoZWNrZWQgd2l0aCBJYW4gYWZ0ZXIgSSB3
cm90ZSB0aGlzIG1haWwsIGFuZCBoZSBjb25maXJtZWQgdGhhdAp0aGF0IGZpZWxkIChgbGlua2Ag
aW4gYGxpYnhsX2V2ZW50YCkgd2FzIG9ubHkgbWVhbnQgdG8gYmUgdXNlZAppbnRlcm5hbGx5LCBh
bmQgaWRlYWxseSB3ZSB3b3VsZG4ndCBldmVuIGhhdmUgdGhhdCBhdmFpbGFibGUgaW4gdGhlIEdv
CnZlcnNpb24gb2YgdGhlIHN0cnVjdCAoc2luY2UgaXQncyBub3QgYWN0dWFsbHkgcGFydCBvZiB0
aGUgcHVibGljCmludGVyZmFjZSkuCgpVbmZvcnR1bmF0ZWx5IHdlIGNhbid0IGFjdHVhbGx5IGdl
dCByaWQgb2YgdGhlIGVsZW1lbnQgaXQgd2l0aG91dApzcGVjaWFsLWNhc2luZyBpdCAod2hpY2gg
SSBkb24ndCB0aGluayBpcyBhIGdvb2QgaWRlYSksIG9yIGFkZGluZyBhIG5ldwoiUFJJVkFURSgp
IiBhbm5vdGF0aW9uIHRvIHRoZSBJREwgb3Igc29tZXRoaW5nICh3aGljaCB3b3VsZCBiZSBuaWNl
IHRvCmhhdmUsIGJ1dCBub3Qgc29tZXRoaW5nIEkgZXhwZWN0IGFueW9uZSB0byBoYXZlIG11Y2gg
dGltZSB0byBkbykuICBGb3IKbm93LCBJIHRoaW5rIGRlZmluaW5nIGl0IGFzIGFuIGVtcHR5IHN0
cnVjdCB3aWxsIGJlIGdvb2QgZW5vdWdoLgoKR3JlYXQsIHRoYW5rcyEgIExvb2sgZm9yd2FyZCB0
byB0aGUgbmV4dCBpdGVyYXRpb24hCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
