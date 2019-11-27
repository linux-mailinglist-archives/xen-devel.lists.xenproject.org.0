Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2B010AE74
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:06:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZv6x-0000eg-Mn; Wed, 27 Nov 2019 11:03:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZv6w-0000eb-P4
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:03:54 +0000
X-Inumbo-ID: 910dafc8-1105-11ea-a3af-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 910dafc8-1105-11ea-a3af-12813bfff9fa;
 Wed, 27 Nov 2019 11:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574852620;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XSaBwoQTVtWAkd+MlxaK+FIAB8NkRGnc0MBnhJVGgFA=;
 b=WDea7e4jOPfddrninZW9dTH3ysk1Vbj/ASTX6ybC8aQRYti3oJU1auen
 1WkmqSQS3SObGCL1B6yQwMapw2IKF1Yzo5R+6rV9gZklOBLK9oK1TO6V5
 5a8wjuS1Rgmxs4JZDpgI0gZ8QGbGOviKyNvh5LFqMAmjwvnaJnQNUU/Bf g=;
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
IronPort-SDR: vGmWQubqrSqdoFV1B+W3ZAVkW+NIbX5SUeS0RVFBEKN56APgnr9mAchxyjB7UueDOFYh148IM0
 rsWUAmyi5YnEd8U4lYPKfE1CPwUTKKgVB0CKEV5ji9/zxJHrnSty+C8uvnanIIHc4ddrWMitre
 UonKijL31XERa3hANmvLCS9RTU2qcdhhsgkGGE7o7qaYWTs572VXrqjtRF+iGw5MoGW401vETo
 dY9qzQ4KcIvlhkIeyb2LJw2emQKaqB4fK5Y6Ud8ezLdeJjdGXRHwsPPwdGRfyNU7Ma/0Ep3oU5
 r0s=
X-SBRS: 2.7
X-MesageID: 8892905
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,249,1571716800"; 
   d="scan'208";a="8892905"
Date: Wed, 27 Nov 2019 12:03:32 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20191127110332.GN980@Air-de-Roger>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <14ccf9a0-ecb4-6e09-6461-99f989353f34@suse.com>
 <20191118140302.GL72134@Air-de-Roger>
 <3e543cfd-d81a-1a4b-0268-7b121ae23c23@suse.com>
 <20191118145554.GN72134@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D611FB5@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D611FB5@SHSMSX104.ccr.corp.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDI6MDc6MTZBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+
IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMTgsIDIwMTkgMTA6NTYgUE0KPiA+IAo+ID4gT24gTW9u
LCBOb3YgMTgsIDIwMTkgYXQgMDM6MTk6NTBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4g
PiA+IE9uIDE4LjExLjIwMTkgMTU6MDMsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+ID4gPiA+
IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDAxOjI2OjQ2UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4gPiA+PiBPbiAxOC4xMS4yMDE5IDExOjE2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6
Cj4gPiA+ID4+PiBAQCAtMTk1NCw0OCArMTk1MiwyOCBAQCBzdGF0aWMgdm9pZAo+ID4gX192bXhf
ZGVsaXZlcl9wb3N0ZWRfaW50ZXJydXB0KHN0cnVjdCB2Y3B1ICp2KQo+ID4gPiA+Pj4gICAgICAg
KiAyLiBUaGUgdGFyZ2V0IHZDUFUgaXMgdGhlIGN1cnJlbnQgdkNQVSBhbmQgd2UncmUgaW4gbm9u
LWludGVycnVwdAo+ID4gPiA+Pj4gICAgICAgKiBjb250ZXh0Lgo+ID4gPiA+Pj4gICAgICAgKi8K
PiA+ID4gPj4+IC0gICAgaWYgKCBydW5uaW5nICYmIChpbl9pcnEoKSB8fCAodiAhPSBjdXJyZW50
KSkgKQo+ID4gPiA+Pj4gLSAgICB7Cj4gPiA+ID4+PiArICAgIGlmICggdmNwdV9ydW5uYWJsZSh2
KSAmJiB2ICE9IGN1cnJlbnQgKQo+ID4gPiA+Pgo+ID4gPiA+PiBJJ20gYWZyYWlkIHlvdSBuZWVk
IHRvIGJlIG1vcmUgY2FyZWZ1bCB3aXRoIHRoZSBydW5uaW5nIHZzIHJ1bm5hYmxlCj4gPiA+ID4+
IGRpc3RpbmN0aW9uIGhlcmUuIFRoZSBjb21tZW50IGFib3ZlIGhlcmUgYmVjb21lcyBzdGFsZSB3
aXRoIHRoZQo+ID4gPiA+PiBjaGFuZ2UgKGFsc28gd3J0IHRoZSByZW1vdmFsIG9mIGluX2lycSgp
LCB3aGljaCBJJ20gYXQgbGVhc3QgdW5lYXN5Cj4gPiA+ID4+IGFib3V0KSwgYW5kIHRoZSBuZXcg
Y29tbWVudGFyeSBiZWxvdyBhbHNvIGxhcmdlbHkgc2F5cy9hc3N1bWVzCj4gPiA+ID4+ICJydW5u
aW5nIiwgbm90ICJydW5uYWJsZSIuCj4gPiA+ID4KPiA+ID4gPiBJJ3ZlIG1pc3NlZCB0byBmaXgg
dGhhdCBjb21tZW50LCB3aWxsIHRha2UgY2FyZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+ID4gPiA+
IE5vdGUgYWxzbyB0aGF0IHRoZSBjb21tZW50IGlzIHF1aXRlIHBvaW50bGVzcywgaXQgb25seSBz
dGF0ZXMgd2hhdCB0aGUKPiA+ID4gPiBjb2RlIGJlbG93IGlzIHN1cHBvc2VkIHRvIGRvLCBidXQg
ZG9lc24ndCBnaXZlIGFueSByZWFzb25pbmcgYXMgdG8gd2h5Cj4gPiA+ID4gaW5faXJxIGlzIHJl
bGV2YW50IGhlcmUuCj4gPiA+Cj4gPiA+IEl0J3MgbWFpbiAidmFsdWUiIGlzIHRvIHJlZmVyIHRv
IHZjcHVfa2ljaygpLCB3aGljaCBoYXMgLi4uCj4gPiA+Cj4gPiA+ID4gVEJIIEknbSBub3Qgc3Vy
ZSBvZiB0aGUgcG9pbnQgb2YgdGhlIGluX2lycSBjaGVjaywgSSBkb24ndCB0aGluayBpdCdzCj4g
PiA+ID4gcmVsZXZhbnQgZm9yIHRoZSBjb2RlIGhlcmUuCj4gPiA+Cj4gPiA+IC4uLiBhIHNpbWls
YXIgaW5faXJxKCkgY2hlY2suIFNhZGx5IHRoYXQgb25lLCB3aGlsZSBoYXZpbmcgYSBiaWdnZXIK
PiA+ID4gY29tbWVudCwgYWxzbyBkb2Vzbid0IGV4cGxhaW4gd2hhdCBpdCdzIG5lZWRlZCBmb3Iu
IEl0IGxvb2tzIGxpa2UgSQo+ID4gPiBzaG91bGQgcmVjYWxsIHRoZSByZWFzb24sIGJ1dCBJJ20g
c29ycnkgLSBJIGRvbid0IHJpZ2h0IG5vdy4KPiA+IAo+ID4gQnkgcmVhZGluZyB0aGUgbWVzc2Fn
ZSBvZiB0aGUgY29tbWl0IHRoYXQgaW50cm9kdWNlZCB0aGUgaW5faXJxIGNoZWNrCj4gPiBpbiB2
Y3B1X2tpY2s6Cj4gPiAKPiA+ICJUaGUgZHJhd2JhY2sgaXMgdGhhdCB7dm14LHN2bX1faW50cl9h
c3Npc3QoKSBub3cgcmFjZXMgbmV3IGV2ZW50Cj4gPiBub3RpZmljYXRpb25zIGRlbGl2ZXJlZCBi
eSBJUlEgb3IgSVBJLiBXZSBjbG9zZSBkb3duIHRoaXMgcmFjZSBieQo+ID4gaGF2aW5nIHZjcHVf
a2ljaygpIHNlbmQgYSBkdW1teSBzb2Z0aXJxIC0tIHRoaXMgZ2V0cyBwaWNrZWQgdXAgaW4KPiA+
IElSUS1zYWdlIGNvbnRleHQgYW5kIHdpbGwgY2F1c2UgcmV0cnkgb2YgKl9pbnRyX2Fzc2lzdCgp
LiBXZSBhdm9pZAo+ID4gZGVsaXZlcmluZyB0aGUgc29mdGlycSB3aGVyZSBwb3NzaWJsZSBieSBh
dm9pZGluZyBpdCB3aGVuIHdlIGFyZQo+ID4gcnVubmluZyBpbiB0aGUgbm9uLUlSUSBjb250ZXh0
IG9mIHRoZSBWQ1BVIHRvIGJlIGtpY2tlZC4iCj4gPiAKPiA+IEFGQUlDVCBpbiB0aGUgdmNwdV9r
aWNrIGNhc2UgdGhpcyBpcyBkb25lIGJlY2F1c2UgdGhlIHNvZnRpcnEgc2hvdWxkCj4gPiBvbmx5
IGJlIHJhaXNlZCB3aGVuIGluIElSUSBjb250ZXh0IGluIG9yZGVyIHRvIHRyaWdnZXIgdGhlIGNv
ZGUgaW4KPiA+IHZteF9kb192bWVudHJ5IHRvIHJldHJ5IHRoZSBjYWxsIHRvIHZteF9pbnRyX2Fz
c2lzdCAodGhpcyBpcyByZWxldmFudAo+ID4gaWYgdmNwdV9raWNrIGlzIGlzc3VlZCBmcm9tIGFu
IGlycSBoYW5kbGVyIGV4ZWN1dGVkIGFmdGVyCj4gPiB2bXhfaW50cl9hc3Npc3QgYW5kIGJlZm9y
ZSB0aGUgZGlzYWJsaW5nIGludGVycnVwdHMgaW4KPiA+IHZteF9kb192bWVudHJ5Lgo+ID4gCj4g
PiBJIHRoaW5rIHdlIG5lZWQgc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZjoKPiA+IAo+ID4g
aWYgKCB2LT5pc19ydW5uaW5nICYmIHYgIT0gY3VycmVudCApCj4gPiAgICAgc2VuZF9JUElfbWFz
ayhjcHVtYXNrX29mKHYtPnByb2Nlc3NvciksIHBvc3RlZF9pbnRyX3ZlY3Rvcik7Cj4gPiBlbHNl
IGlmICggdiA9PSBjdXJyZW50ICYmIGluX2lycSgpICYmICFzb2Z0aXJxX3BlbmRpbmcoc21wX3By
b2Nlc3Nvcl9pZCgpKSApCj4gPiAgICAgcmFpc2Vfc29mdGlycShWQ1BVX0tJQ0tfU09GVElSUSk7
Cj4gCj4gVGhlbiB3aGF0J3MgdGhlIGRpZmZlcmVuY2UgZnJvbSBvcmlnaW5hbCBsb2dpYz8KClRo
ZSBvcmlnaW5hbCBsb2dpYyBpczoKCmlmICggcnVubmluZyAmJiAoaW5faXJxKCkgfHwgKHYgIT0g
Y3VycmVudCkpICkKewogICAgICAgIHVuc2lnbmVkIGludCBjcHUgPSB2LT5wcm9jZXNzb3I7Cgog
ICAgICAgIGlmICggY3B1ICE9IHNtcF9wcm9jZXNzb3JfaWQoKSApCiAgICAgICAgICAgIHNlbmRf
SVBJX21hc2soY3B1bWFza19vZihjcHUpLCBwb3N0ZWRfaW50cl92ZWN0b3IpOwogICAgICAgIGVs
c2UgaWYgKCAhc29mdGlycV9wZW5kaW5nKGNwdSkgKQogICAgICAgICAgICByYWlzZV9zb2Z0aXJx
KFZDUFVfS0lDS19TT0ZUSVJRKTsKfQoKV2hpY2ggSSBmaW5kIG11Y2ggaGFyZGVyIHRvIHVuZGVy
c3RhbmQuIEZvciBleGFtcGxlIEknbSBub3Qgc3VyZSBvZgp3aGF0J3MgdGhlIGJlbmVmaXQgb2Yg
ZG9pbmcgdGhlIGNwdSAhPSBzbXBfcHJvY2Vzc29yX2lkKCkgY2hlY2sKaW5zdGVhZCBvZiBzaW1w
bHkgZG9pbmcgdiAhPSBjdXJyZW50IChsaWtlIGluIHRoZSBvdXRlciBpZiBjb25kaXRpb24pLgpN
eSBzdWdnZXN0aW9uIHJlbW92ZXMgb25lIGxldmVsIG9mIG5lc3RpbmcgYW5kIElNTyBtYWtlcyB0
aGUgY29uZGl0aW9uCmNsZWFyZXIsIGJ1dCBtYXliZSB0aGF0J3MganVzdCBteSB0YXN0ZS4KCkFs
c28gdGhlIG9yaWdpbmFsIGNvbW1lbnRzIGRvbid0IG1lbnRpb24gYXQgYWxsIHdoeSBhIHNvZnRp
cnEgc2hvdWxkCmJlIHJhaXNlZCBpZiB2ID09IGN1cnJlbnQgJiYgaW5faXJxLCBhbmQgaXQgdG9v
ayBtZSBzb21lIHRpbWUgdG8KZmlndXJlIG91dCB3aHkgdGhhdCdzIHJlcXVpcmVkLiBNeSBwcm9w
b3NlZCBjaGFuZ2UgY2xhcmlmaWVzIHdoeSB0aGlzCmlzIG5lZWRlZCwgYW5kIGFsc28gbWFrZXMg
aXQgbW9yZSBvYnZpb3VzIHRoYXQgdGhlIHNvZnRpcnEgd2lsbCBvbmx5CmJlIHJhaXNlZCB3aGVu
IGluIGlycSBjb250ZXh0LgoKQW55d2F5LCBJJ20gbm90IGdvaW5nIHRvIGluc2lzdCBhbmQgd2ls
bCBkcm9wIHRoZSBjaGFuZ2UgaWYgaXQncyBub3QKZGVlbWVkIHVzZWZ1bC4KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
