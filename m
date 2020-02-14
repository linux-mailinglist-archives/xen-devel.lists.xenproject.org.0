Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A015D5F5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 11:43:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2YOI-0005eb-BX; Fri, 14 Feb 2020 10:40:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lgAG=4C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j2YOG-0005eS-Jz
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 10:40:08 +0000
X-Inumbo-ID: 5deae5ee-4f16-11ea-ba03-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5deae5ee-4f16-11ea-ba03-12813bfff9fa;
 Fri, 14 Feb 2020 10:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581676808;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3LeA0haWQdR/d4e+AkWqOT0eKbhNXF0xRBQkNOTj5kk=;
 b=KHnzGhdjsPr8UWZdMkWyw4eI7/JloNofv0hAYnCPuiwxJMMP/bsLxgZW
 nIlG1T3TVMbnTjAPzfJifJTKtpeGvnwno4ErI/scQOsqaquWcFbcDYdKH
 w7omw4NTeGJhRXZ2WxptHa7ET7s10Ku6AEd/tPxlu/Q+/IcGab7iw4fL+ g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZrMkPNnrOSKY91hY1rOOf+9Ko3TByjYJP2j/NkxEmB7laPjRNl/F4x6NojCxh/jGLflq1Dsh/L
 E9nb+IB8jkKNIUICD8u70NmOT2Q2EWZ1FP2zD/ADIk0iygdiNTCAeSU7QGRKoYY0Gvt0wWzv9U
 a9ed6reyRgPTLHZ3hVeVX6xQteF4AYWg/7xaDi2DPwvs/mo9zkQQzZHoDWdeA6EBVS6z8QnbiR
 noHQAmj/2i4+OKM7J7P6G/YsDI65J8Mq3h6kzMbTtylRThcUcacJ6k32SjLohMXdSjayi+wjrD
 QWw=
X-SBRS: 2.7
X-MesageID: 12448817
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,440,1574139600"; d="scan'208";a="12448817"
Date: Fri, 14 Feb 2020 11:40:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200214104000.GA4679@Air-de-Roger>
References: <1354b838-e30f-10dd-edbe-064fb159ef7e@suse.com>
 <0542d37e-8128-b94c-19ac-8506bf0d1b8a@xen.org>
 <58391072-5196-62e7-a09b-bc45993b50ef@suse.com>
 <4d6e9d92-d0cf-6f4e-0fe1-8cba69c72300@xen.org>
 <17344a8c-b5f5-ee48-a89d-8d5c0070e81f@suse.com>
 <910276d6-a55d-87d2-cb92-055c53b9898c@xen.org>
 <979c25c4-09c2-755e-51f9-ca644358b096@suse.com>
 <87208524-5c30-48cf-fe7a-e5d77a26414b@xen.org>
 <ea8e70a3-83d2-0491-115c-fbf18bd1d705@suse.com>
 <22c23ea7-e8ee-d09f-6702-888e364f76f0@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22c23ea7-e8ee-d09f-6702-888e364f76f0@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 2/3] bitmap: import bitmap_{set/clear}
 from Linux 5.5
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTAsIDIwMjAgYXQgMTI6NTQ6MDRQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDEwLzAyLzIwMjAgMTI6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4g
T24gMTAuMDIuMjAyMCAxMzoyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4g
Cj4gPiA+IE9uIDEwLzAyLzIwMjAgMTE6NTksIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+IE9u
IDEwLjAyLjIwMjAgMTI6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gPiA+IE9uIDEwLzAy
LzIwMjAgMTA6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiAxMC4wMi4yMDIw
IDEwOjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gUGxlYXNlIHN1Z2dlc3Qg
YSBuZXcgbmFtZSBmb3IgQklUX1dPUkQoKSBhbmQgd2UgY2FuIHJlcHVycG9zZSBpdC4gU28KPiA+
ID4gPiA+ID4gPiBmYXIsIEkgaGF2ZSBubyBpZGVhIGhvdyB0byByZW5hbWUgaXQuCj4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiBfQklUX1dPUkQoKSBpZiB5b3Uvd2Ugd2VyZSB0byBhY2NlcHQgdGhl
IG5hbWUgc3BhY2UgdmlvbGF0aW9uLCBvcgo+ID4gPiA+ID4gPiBCSVRNQVBfV09SRCgpPwo+ID4g
PiA+ID4gCj4gPiA+ID4gPiBCSVRNQVBfV09SRCgpIGlzIG1pc2xlYWRpbmcgYXMgYml0bWFwIGFy
ZSB1c2luZyB1bnNpZ25lZCBsb25nLiBTbyBteQo+ID4gPiA+ID4gcHJlZmVyZW5jZSBpcyBfQklU
X1dPUkQoKS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gQW5vdGhlciBhbHRlcm5hdGl2ZSB3b3VsZCBi
ZSBBVE9NSUNfV09SRCgpLgo+ID4gPiA+IAo+ID4gPiA+IEV4Y2VwdCB0aGF0IHRoZXJlIGFyZSBh
bHNvIG5vbi1hdG9taWMgYml0bWFwIG9wZXJhdGlvbnMsIEkgZG9uJ3QgcmVhbGx5Cj4gPiA+ID4g
Y2FyZSBhYm91dCB0aGUgbmFtZSBhcyBsb25nIGFzIGl0J3Mgbm90IEJJVF9XT1JEKCkgKG9yIGFu
eXRoaW5nIGVsc2UKPiA+ID4gPiB0aGF0J3MgbGlrZWx5IHRvIGNvbGxpZGUgd2l0aCBvdGhlciBz
dHVmZi4KPiA+ID4gCj4gPiA+IEkgYW0gYWZyYWlkIHdlIGFyZSBkaXNhZ3JlaW5nIG9uIHdoYXQg
aXMgY29sbGlkaW5nIHdpdGggd2hhdCBoZXJlLiBUaGUKPiA+ID4gbmFtaW5nIG9uIEFybSBoYXMg
YmVlbiBsaWtlIHRoYXQgZm9yIHRoZSBwYXN0IGZldyB5ZWFycy4gV2hpbGUgdGhpcyBtYXkKPiA+
ID4gbm90IGhhdmUgYmVlbiB0aGUgYmVzdCBjaG9pY2UsIHRoaXMgaXMgeW91ciBzdWdnZXN0aW9u
IGNvbGxpZGluZyB3aXRoCj4gPiA+IHdoYXQgaXMgZXhpc3RpbmcuCj4gPiAKPiA+IEl0IGlzIGEg
cGxhaW4gaW1wb3J0IGZyb20gTGludXggd2hpY2ggaGFzIHR1cm5lZCBvdXQgaW1wb3NzaWJsZQo+
ID4gYmVjYXVzZSBvZiB0aGUgY2hhbmdlIHRoYXQgd2FzIGRvbmUgYXQgc29tZSBwb2ludCB0byBB
cm0gY29kZQo+ID4gd2hpY2gsIEkgZ3Vlc3MsIGFsc28gb3JpZ2luYWxseSBjYW1lIGZyb20gTGlu
dXguIFRoZXJlJ3Mgbm8gbmV3Cj4gPiBuYW1pbmcgSSd2ZSBiZWVuIHN1Z2dlc3RpbmcgaGVyZSBh
dCBhbGwuCj4gCj4gV2UgbmV2ZXIgY2xhaW1lZCB3ZSB3b3VsZCBiZSBmdWxseSBjb21wYXRpYmxl
IHdpdGggTGludXggYW5kIEkgZG9uJ3QgdGhpbmsKPiB3ZSBjb3VsZCBldmVyeSBjbGFpbSBpdC4g
UGFydGljdWxhcmx5LCB0aGUgYml0b3Agb3BlcmF0aW9ucyBhcmUgZGlmZmVyZW50Cj4gZ2l2ZW4g
TGludXggYml0b3BzIGFyZSBiYXNlZCBvbiB1bnNpZ25lZCBsb25nLgo+IAo+IFRoZSBiaXRvcCBk
aWQgaW5kZWVkIGNhbWUgZnJvbSBMaW51eCBvcmlnaW5hbGx5LCBob3dldmVyIHdlIGhhZCB0byBh
ZGFwdAo+IHRoZW0gYmVjYXVzZSBMaW51eCBBcm12OCBiaXRvcCB3YXMgZXhwZWN0aW5nIDgtYnl0
ZSBhbGlnbmVkLiBUaGlzIGRvZXMgbm90Cj4gaG9sZCBvbiBYZW4uCj4gCj4gPiAKPiA+ID4gSSBh
bSBub3QgZW50aXJlbHkgZnVzc2VkIGFib3V0IHRoZSBuYW1lc3BhY2UgdmlvbGF0aW9uLCBhbHRo
b3VnaCBJIHRoaW5rCj4gPiA+IHRoZSBuYW1lIGlzIHBvdGVudGlhbGx5IG1pc2xlYWRpbmcuIFll
dCwgSSB3b3VsZCBiZSBoYXBweSB0byB1c2UKPiA+ID4gX0JJVF9XT1JEKCkgYXMgdGhpcyBpcyB0
aGUgYmVzdCBvZiBpdCBzbyBmYXIuCj4gPiA+IAo+ID4gPiBXaGlsZSB0aGlzIGlzIGNvZGUgZmFs
bHMgdW5kZXIgQXJtIG1haW50YWluZXJzaGlwLCBJIGFtIHN0aWxsIGhhcHB5IHRvCj4gPiA+IGNv
bnNpZGVyIG90aGVyIG5hbWluZy4gQnV0IGF0IHRoaXMgcG9pbnQsIHlvdSBzaG91bGQgYmUgdGhl
IG9uZSBzdWdnZXN0aW5nLgo+ID4gCj4gPiBCSVRfVU5JVCgpIG9yIEJJVE9QX1VOSVQoKSBvciBC
SVRPUF9XT1JEKCk/Cj4gCj4gQklUT1BfV09SRCgpLgoKU28gSSBhc3N1bWUgeW91IHdvdWxkIGxp
a2UgbWUgdG8gaW1wb3J0IGJpdG1hcF97c2V0L2NsZWFyfSBhbmQgdXNlIGl0CmluIHRoZSB4MkFQ
SUMgTVNSIHBhdGNoPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
