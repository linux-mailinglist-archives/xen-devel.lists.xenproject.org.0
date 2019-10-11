Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6227CD4494
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 17:41:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIwvZ-0005wj-1F; Fri, 11 Oct 2019 15:34:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qGFj=YE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iIwvX-0005wd-Ji
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 15:33:59 +0000
X-Inumbo-ID: 8a954eaa-ec3c-11e9-933c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a954eaa-ec3c-11e9-933c-12813bfff9fa;
 Fri, 11 Oct 2019 15:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570808038;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MXaxub1/JZiCjfyH6CPt6qEXPhRDBVlwfkq9K4SLS6w=;
 b=afEu8JJX3r3CbtE7rmuAgmpelQHdLkSy4AmXu4RPZzeQF4Az0j74CNjv
 rYAEkzLQweqrpROtoCpkji2JWwgl712c8hF+Cxu+/b5Kach/hVR/7awRu
 APFs/D+yBRjjypuv194lWF+kfu7hqNBKhLGEXfhD2YxoCYIa/wA09yujD s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TViYBX8r9IhHZKSnQURpkjVvk6wFzKb9L+hYNolCjBzvC2fDHQL+UrCMbAWAC6/JXRnTNuuLSK
 ntNEx0qmgODP58SmLhHzcwX+qhruenwaosguLtiCcrODebm5hdCdtwOe2dhRroWHt/XZvIIzZT
 Po2NWfAJ/b6oMl1vhCYqD9SDuVzeKalFFMpT9jDiWmjCPs6Zf0mHe9EoqSwnbb8ypmf1xGJW59
 x9PL26vGRYd5de9K4Pc79mGtS8doeANdufpcLOtaQpupu4huTZtTGoRYRJ1JkSkRzhpzz0O9Xp
 4uA=
X-SBRS: 2.7
X-MesageID: 7044172
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="7044172"
Date: Fri, 11 Oct 2019 17:33:50 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191011153350.GM1389@Air-de-Roger.citrite.net>
References: <20191011150253.29457-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011150253.29457-1-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/VT-d: Drop unhelpful
 information in diagnostics
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDQ6MDI6NTNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgdmlydHVhbCBhZGRyZXNzIG9mIHRoZSBiYXNlIG9mIHRoZSBJT01NVSdzIHJl
Z3N0ZXJzIGlzIG5vdCB1c2VmdWwgZm9yCj4gZGlhZ25vc3RpYyBwdXJwb3NlcywgYW5kIGlzIHF1
aXRlIHZvbHVtaW5vdXMuICBUaGUgUENJIGNvb3JkaW5hdGVzIGlzIGJ5IGZhcgo+IHRoZSBtb3N0
IHVzZWZ1bCBwaWVjZSBvZiBpZGVudGlmeWluZyBpbmZvcm1hdGlvbi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IEND
OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBK
dW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4gQ0M6IEtldmluIFRpYW4gPGtl
dmluLnRpYW5AaW50ZWwuY29tPgo+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Cj4gCj4gU3Vycm91bmRpbmcgcHJpbnRrKClzIGFsc28gaWRlbnRpZnkgdGhlIElPTU1VIGJ5IFhl
bidzIGludGVybmFsIElELCBidXQgdGhhdAo+IGlzIGFsc28gcHJldHR5IHVzZWxlc3MgaW5mb3Jt
YXRpb24gd2hlbiBkaWFnbm9zaW5nIHByb2JsZW1zLgo+IAo+IFJGQyBmb3ItNC4xMy4gIFRoaXMg
aXMgYSBuaWNlIHRvIGhhdmUgc3R5bGlzdGljIGltcHJvdmVtZW50LgoKSSBkb24ndCB0aGluayB0
aGUgcmVnaXN0ZXIgaXMgdXNlZnVsIGZvciBkZWJ1Z2dpbmcsIGF0IGxlYXN0IEkgaGF2ZQpuZXZl
ciB1c2VkIGl0IG15c2VsZiwgc286CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
