Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 537E5ABBF4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 17:13:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6FtR-0005S6-Ao; Fri, 06 Sep 2019 15:11:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6FtP-0005RQ-28
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 15:11:19 +0000
X-Inumbo-ID: 866865aa-d0b8-11e9-978d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 866865aa-d0b8-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567782657;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vFj9d7b2/A+K7rjm9Mi+IiOEQ097I0rJYOOtnHXeNdI=;
 b=axsUAsBKiCj/wH8HDuay1FgXVrE2g9Z6DIOLkXolRp4uMsTCihOkQH2G
 1vfQBv9eywkinL2hH6tg1aR4P5aVFB4mTClHHmGlRc61l7IYO21f5zO4R
 FHORvznm8X5P2Dd9ED8qJSuOoXxY4+/1PmfjAGytFu9vRZm4Gx506mNh5 s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YaFjOTFewSqWOatgbSwRL7DW6WK3jT/74mXx39r35K9ZZ5H+YEYJzdfprw8E5Ra6VvNb3wzbFa
 HHHFdMaj65pDxMVh6DZa1LsoybbvBIRDVchNd/dwWDpymx/xatE3kApF1EHAVNaO3yKyZRQFM7
 6cj/dcZMBSMfn4FCW+Qo30ZrI7/0ETE3VDKVCbJM68CLo2Z8x/c6UEqX1dgLPbxmr+sVuSk7Bw
 65MKeazoNOtGegvWN+k+Ve6kFYAihCZfaLBZlQTITLUOp3Ac2vjfWrtWcriORyfq0E65YIQ0/E
 e1w=
X-SBRS: 2.7
X-MesageID: 5427858
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5427858"
Date: Fri, 6 Sep 2019 17:10:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
Message-ID: <20190906151046.r7cremzaqw73btu3@Air-de-Roger>
References: <cover.1567620587.git.lars.kurth@citrix.com>
 <bce250afe71018f1a62f1b34866833588670a1f9.1567620587.git.lars.kurth@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bce250afe71018f1a62f1b34866833588670a1f9.1567620587.git.lars.kurth@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] Xen Project Code of Conduct
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
Cc: xen-api@lists.xenproject.org, minios-devel@lists.xenproject.org,
 committers@xenproject.org, mirageos-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, win-pv-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDc6MTI6MThQTSArMDEwMCwgTGFycyBLdXJ0aCB3cm90
ZToKWy4uLl0KPiArIyMgQ29uZHVjdCBUZWFtIG1lbWJlcnMKPiArQ29uZHVjdCBUZWFtIG1lbWJl
cnMgYXJlIHByb2plY3QgbGVhZGVyc2hpcCB0ZWFtIG1lbWJlcnMgZnJvbSBhbnkKPiArc3ViLXBy
b2plY3QuIFRoZSBjdXJyZW50IGxpc3Qgb2YgQ29uZHVjdCBUZWFtIG1lbWJlcnMgaXM6Cj4gKyog
TGFycyBLdXJ0aCA8bGFycyBkb3Qga3VydGggYXQgeGVucHJvamVjdCBkb3Qgb3JnPgo+ICsqIEdl
b3JnZSBEdW5sYXAgPGdlb3JnZSBkb3QgZHVubGFwIGF0IGNpdHJpeCBkb3QgY29tPgo+ICsqIElh
biBKYWNrc29uIDxpYW4gZG90IGphY2tzb24gYXQgY2l0cml4IGRvdCBjb20+Cj4gKwo+ICtDb25k
dWN0IFRlYW0gbWVtYmVycyBhcmUgY2hhbmdlZCBieSBwcm9wb3NpbmcgYSBjaGFuZ2UgdG8gdGhp
cyBkb2N1bWVudCwKPiArcG9zdGVkIG9uIGFsbCBzdWItcHJvamVjdCBsaXN0cywgZm9sbG93ZWQg
YnkgYSBmb3JtYWwgZ2xvYmFsIHZvdGUgYXMgb3V0bGluZWQgW2hlcmVdOiBodHRwczovL3hlbnBy
b2plY3Qub3JnL2RldmVsb3BlcnMvZ292ZXJuYW5jZS8jcHJvamVjdC1kZWNpc2lvbnMKCkNvdWxk
IHlvdSBicmVhayB0aGUgYWJvdmUgbGluZSB0byBtYXRjaCB0aGUgZXhpc3RpbmcgbGluZSBsZW5n
dGggb2YKdGhlIGRvY3VtZW50PwoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
