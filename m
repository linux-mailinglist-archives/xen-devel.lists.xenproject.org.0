Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD7DFC739
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 14:21:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVF1F-00014n-I1; Thu, 14 Nov 2019 13:18:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwvT=ZG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iVF1D-00014i-4D
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 13:18:39 +0000
X-Inumbo-ID: 446bb314-06e1-11ea-a24d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 446bb314-06e1-11ea-a24d-12813bfff9fa;
 Thu, 14 Nov 2019 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573737518;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tgiasJCQdFEzxnGSLK6eMNBgKXu8r8F0btDzjXtFzQo=;
 b=aAKG+o7VobX+zZdfjdcGwHehmBV47QmgJdJAe11Nb7+TgYPv77aMjraB
 1gnnuu4bobBvi2dDiznDEXk4Ooo5y8qPuf9HyTBptjR4a2HHEn8Ok3Ufb
 L3DoHjLRpBlTAO04qSzfcZx/kbog1wWIWTEP2FvGfwS45C2y7NiQ+C7Nu 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PHn37e6xGx3DcBU/v9fv/B+n7e7GFA7xgoAo/IOUv8cmlU8A9pwUMJQT+2PXpd9PEgMmebU+Db
 q775XwMOJg129pzCT1s+HcYpgtqDXENAfk8DpysRVS78Sfos2YJMWXhn3ddF0GqjhHAAuGjxgB
 +0d3Ydg7vnTIhe67UxdJmotV15VEWXWNZ2niM6MVMFI4WoNA2DBeuUfzE4EZFYZTJnVyBVyltw
 c2edoNpsTvaDaS5dD746qT77xrlPU0/o1ZfqCdzcIf9pk5ltPuw5Q4PT7Mf01v32KXe5FZU5HB
 GjI=
X-SBRS: 2.7
X-MesageID: 8858054
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,304,1569297600"; 
   d="scan'208";a="8858054"
Date: Thu, 14 Nov 2019 14:15:43 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191114131543.GD72134@Air-de-Roger>
References: <20191113155940.81837-1-roger.pau@citrix.com>
 <20191113155940.81837-2-roger.pau@citrix.com>
 <d011e557-e65f-8362-91e7-aa0c6df029c3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d011e557-e65f-8362-91e7-aa0c6df029c3@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 v4 1/3] vmx: add ASSERT to prevent
 syncing PIR to IRR...
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
Cc: Juergen Gross <jgross@suse.com>, Kevin
 Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMDE6MjU6NTRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTMuMTEuMjAxOSAxNjo1OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0v
dm14L3ZteC5jCj4gPiBAQCAtMjA1NCw2ICsyMDU0LDE3IEBAIHN0YXRpYyB2b2lkIHZteF9zeW5j
X3Bpcl90b19pcnIoc3RydWN0IHZjcHUgKnYpCj4gPiAgICAgIHVuc2lnbmVkIGludCBncm91cCwg
aTsKPiA+ICAgICAgREVDTEFSRV9CSVRNQVAocGVuZGluZ19pbnRyLCBOUl9WRUNUT1JTKTsKPiA+
ICAKPiA+ICsgICAgaWYgKCB2ICE9IGN1cnJlbnQgJiYgdi0+aXNfcnVubmluZyApCj4gCj4gSWly
YyBpdCB3YXMgc3VnZ2VzdGVkIHRvIHVzZSB2Y3B1X3J1bm5hYmxlKCkgaGVyZS4gSXMgdGhlcmUg
YSByZWFzb24KPiB5b3UgdXNlZCB0aGUgbGVzcyByZWxpYWJsZSAobW9yZSBwcm9uZSB0byByYWNl
cykgLT5pc19ydW5uaW5nPwoKTXkgbWlzdGFrZSwgSSBkb24ndCB0aGluayB0aGVyZSdzIGFueSBy
ZWFzb24gdG8gcHJlZmVyIGlzX3J1bm5pbmcgb3Zlcgp2Y3B1X3J1bmFibGUgaW4gdGhpcyBjYXNl
LiBJIGNhbiByZXNlbmQgd2l0aCB0aGlzIGZpeGVkLCBidXQgSSB3aWxsCndhaXQgZm9yIGNvbW1l
bnRzIG9uIHRoZSBvdGhlciBwYXRjaGVzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
