Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF6210C9EE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 14:56:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaKFO-0002ck-Sh; Thu, 28 Nov 2019 13:54:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ucib=ZU=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iaKFN-0002cc-PS
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 13:54:17 +0000
X-Inumbo-ID: 915382aa-11e6-11ea-a3d2-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 915382aa-11e6-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574949257;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=JDKjJH+2AZTOdhky699snJlLf9aWnsfsaZ7HyoIr9aQ=;
 b=eTi7ObViOzsqYvnxpleBUiu2s+GKb8n2r/IhC/rVYjvuVk54o2/FfryF
 yLivaJk7eRABGimbi4E4MmSM5zkHLDS7lol+tW4BPo/O+hmLXJft2LLAd
 8pLVq/NjdVhC4v+ug/tLhdClLZASm6DePQ4G5hyyd7/h/lKkuSld7xoTp w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Mi3M4lk77lJq9dSu8tY7nHqp987I8nR1eMv+pVNasVRirkIqiND4rj1IwIuq8RmhRdRoPbm0aJ
 K3PIovwbFyiIXKTTEaDnv8PjCIYUSSdfhDEYOhPdzyQTQRibNcNLrhODGirpW6qgHF2yiiaopn
 IZ2oRt6Ktw8DwUOtm2q6JpMhY81VPTKLDPELs57O1YCPv4qh9H+Q71QzY1NAUH9yk5LRQ1lZCU
 7Q3hj/7xP+Cm1SPM6cV62UVgo4NasBOwVlc+MTLLMryTqKY5rE5LtuFrbwbYswN43/89GsDcL9
 MAU=
X-SBRS: 2.7
X-MesageID: 9502495
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="9502495"
To: Jan Beulich <jbeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
 <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
 <8149ffd4-3b6f-df12-3de5-8e64419e3b78@suse.com>
 <0abb0ca5-82b9-7d59-00c0-5a9e0ddfb572@citrix.com>
 <b5ab956e-36af-a07d-8698-79bf61eb514c@citrix.com>
 <89e137c0-b8ca-436d-b425-705df3506c2c@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <8407b785-8b2c-2f94-cab6-a9ceed502b18@citrix.com>
Date: Thu, 28 Nov 2019 13:54:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <89e137c0-b8ca-436d-b425-705df3506c2c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjgvMTkgMTo0OSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjguMTEuMjAxOSAx
MzoxNSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gQXBwbHlpbmcgdGhlIHBhdGNoIGRpZG4ndCBl
bmQgdXAgd2VsbCBmb3IgbXkgdGVzdCBMUCAoZnJvbSBhbm90aGVyIHRocmVhZCk6Cj4+Cj4+IFBl
cmZvcm0gZnVsbCBpbml0aWFsIGJ1aWxkIHdpdGggOCBDUFUocykuLi4KPj4gUmVhZGluZyBzcGVj
aWFsIHNlY3Rpb24gZGF0YQo+PiBBcHBseSBwYXRjaCBhbmQgYnVpbGQgd2l0aCA4IENQVShzKS4u
Lgo+PiBVbmFwcGx5IHBhdGNoIGFuZCBidWlsZCB3aXRoIDggQ1BVKHMpLi4uCj4+IEV4dHJhY3Rp
bmcgbmV3IGFuZCBtb2RpZmllZCBFTEYgc2VjdGlvbnMuLi4KPj4gUHJvY2Vzc2luZyB4ZW4vYXJj
aC94ODYvbW0vc2hhZG93L2d1ZXN0XzIubwo+PiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni9tbS9z
aGFkb3cvZ3Vlc3RfNC5vCj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L21tL3NoYWRvdy9ndWVz
dF8zLm8KPj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvbW0vZ3Vlc3Rfd2Fsa18zLm8KPj4gUHJv
Y2Vzc2luZyB4ZW4vYXJjaC94ODYvbW0vaGFwL2d1ZXN0X3dhbGtfM2xldmVsLm8KPj4gUHJvY2Vz
c2luZyB4ZW4vYXJjaC94ODYvbW0vaGFwL2d1ZXN0X3dhbGtfNGxldmVsLm8KPj4gUHJvY2Vzc2lu
ZyB4ZW4vYXJjaC94ODYvbW0vaGFwL2d1ZXN0X3dhbGtfMmxldmVsLm8KPj4gUHJvY2Vzc2luZyB4
ZW4vYXJjaC94ODYvbW0vZ3Vlc3Rfd2Fsa18yLm8KPj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYv
bW0vZ3Vlc3Rfd2Fsa180Lm8KPj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvZWZpL2VmaS9jaGVj
ay5vCj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L3B2L2dwcl9zd2l0Y2gubwo+PiBQcm9jZXNz
aW5nIHhlbi9hcmNoL3g4Ni9pbmRpcmVjdC10aHVuay5vCj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gv
eDg2L2Jvb3QvaGVhZC5vCj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L3g4Nl82NC9rZXhlY19y
ZWxvYy5vCj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L3g4Nl82NC9jb21wYXQvZW50cnkubwo+
PiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkubwo+PiBQcm9jZXNzaW5nIHhl
bi9hcmNoL3g4Ni9odm0vdm14L2VudHJ5Lm8KPj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvaHZt
L3N2bS9lbnRyeS5vCj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L21udC9tZWRpYS9naXQvdXBz
dHJlYW0veGVuL3hlbi9tbnQvbWVkaWEvZ2l0L3Vwc3RyZWFtL3hlbi94ZW4vLnhlbi5lZmkuMHMu
bwo+PiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni9tbnQvbWVkaWEvZ2l0L3Vwc3RyZWFtL3hlbi94
ZW4vbW50L21lZGlhL2dpdC91cHN0cmVhbS94ZW4veGVuLy54ZW4uZWZpLjByLm8KPj4gUHJvY2Vz
c2luZyB4ZW4vYXJjaC94ODYvbW50L21lZGlhL2dpdC91cHN0cmVhbS94ZW4veGVuL21udC9tZWRp
YS9naXQvdXBzdHJlYW0veGVuL3hlbi8ueGVuLmVmaS4xcy5vCj4+IFByb2Nlc3NpbmcgeGVuL2Fy
Y2gveDg2L21udC9tZWRpYS9naXQvdXBzdHJlYW0veGVuL3hlbi9tbnQvbWVkaWEvZ2l0L3Vwc3Ry
ZWFtL3hlbi94ZW4vLnhlbi5lZmkuMXIubwo+PiBFUlJPUjogbm8gZnVuY3Rpb25hbCBjaGFuZ2Vz
IGZvdW5kLgo+Pgo+PiBTbyB0aGlzIGxvb2tzIGxpa2UgYSByZWdyZXNzaW9uLgo+IAo+IFRoYW5r
cyBmb3IgZG9pbmcgdGhlIHRlc3RpbmcuIEJ1dCB3aGF0IGFtIEkgdG8gY29uY2x1ZGUgZnJvbQo+
IHRoZSBhYm92ZT8gSSBjYW4ndCBldmVuIHRlbGwgd2h5ICJubyBmdW5jdGlvbmFsIGNoYW5nZXMg
Zm91bmQiCj4gaXMgYW4gZXJyb3IuCj4gCgpJdCdzIGR1ZSB0byB0aGUgd2F5IGxpdmVwYXRjaC1i
dWlsZCB0b29sIGludGVycG9zZXMgb24gdGhlIGJ1aWxkIHRvIGNhcHR1cmUKY2hhbmdlZCBvYmpl
Y3QgZmlsZXMgZm9yIGxhdGVyIGNvbXBhcmlzb24uICBOb3cgdGhhdCBvYmpjb3B5IHdyaXRlcyBv
dXQgdGhlCnByb3BlciBvYmplY3QgZmlsZXMgcmF0aGVyIHRoYW4gZ2NjICh3aGljaCBqdXN0IHdy
aXRlcyBhIHRlbXBvcmFyeSBvbmUpLCB0aGUKbGl2ZXBhdGNoLWJ1aWxkIHRvb2wgbmVlZHMgc29t
ZSBhZGp1c3RtZW50IG90aGVyd2lzZSBpdCBkb2Vzbid0IGNhcHR1cmUgYW55CmNoYW5nZWQgZmls
ZXMuIEknbSB3b3JraW5nIG9uIGEgcGF0Y2guCgpUaGFua3MsCi0tIApSb3NzIExhZ2Vyd2FsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
