Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7543D1572DC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 11:31:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j16IC-0006so-U2; Mon, 10 Feb 2020 10:27:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rnvo=36=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j16IB-0006sj-R4
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 10:27:51 +0000
X-Inumbo-ID: fd2ffcae-4bef-11ea-b4a6-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd2ffcae-4bef-11ea-b4a6-12813bfff9fa;
 Mon, 10 Feb 2020 10:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581330470;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=z3nIaCNVL/PKjuXLCp1EJt86bpqI1KAEWRlERldJxeA=;
 b=ZkIDw34V7/pNDlVd9pFd1/E79ultapC7+aryKus4+j7wS6y1W3pp80Fp
 1LbnprB8nrtw+s6oV+a0EkryD74nUjTYEa5B+NweVRwnwmv+cm6v1k03f
 VLBfUpduLcJhyGtTV5JzNE29uo9P7h/wcvxovTBoYAX2Yvx7k00Id0ZRj 4=;
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
IronPort-SDR: njhwqvOgCN8Nj7OqaWEEe25pWfPGRO+tVZqt+Gn8blK9dW5yjslu8PUXYjYEkyAS2CZFCV5fSj
 AJMSre9vqR8i0McGnfzfA0yCwjNfYvkbeiXjw3ApQWbI5q3vvLCIkun2TiS2StExGJ1mUAVMiq
 fZyT4CANnOwTEan5yNpGf5sLaAeTwyfb4WvsUb0zPvAd4UoY4tTQl24mKnvgBl4XxLG+9/OBMp
 aS+afeLfeX7X4e8zsXQNS474O+l2To7Z/ZJSZTXf2L0Sg0xsTXdSWt9RoQuM/DRixB5tofwtWr
 tSk=
X-SBRS: 2.7
X-MesageID: 12811587
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,424,1574139600"; d="scan'208";a="12811587"
Date: Mon, 10 Feb 2020 11:27:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200210102738.GG4679@Air-de-Roger>
References: <20200208151939.31691-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208151939.31691-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/pvh: Fix segment selector ABI
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBGZWIgMDgsIDIwMjAgYXQgMDM6MTk6MzlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgd3JpdHRlbiBBQkkgc3RhdGVzIHRoYXQgJWVzIHdpbGwgYmUgc2V0IHVwLCBi
dXQgbGlieGMgZG9lc24ndCBkbyBzby4gIEluCj4gcHJhY3RpY2UsIGl0IGJyZWFrcyBgcmVwIG1v
dnNgIGluc2lkZSBndWVzdHMgYmVmb3JlIHRoZXkgcmVsb2FkICVlcy4KPiAKPiBUaGUgd3JpdHRl
biBBQkkgZG9lc24ndCBtZW50aW9uICVzcywgYnV0IGxpYnhjIGRvZXMgc2V0IGl0IHVwLiAgSGF2
aW5nICVkcwo+IGRpZmZlcmVudCB0byAlc3MgaXMgb2Jub3hvdXMgdG8gd29yayB3aXRoLCBhcyBk
aWZmZXJlbnQgcmVnaXN0ZXJzIGhhdmUKPiBkaWZmZXJlbnQgaW1wbGljaXQgc2VnbWVudHMuCj4g
Cj4gTW9kaWZ5IHRoZSBzcGVjIHRvIHN0YXRlIHRoYXQgJXNzIGlzIHNldCB1cCBhcyBhIGZsYXQg
cmVhZC93cml0ZSBzZWdtZW50Lgo+IFRoaXMgYSkgbWF0Y2hlcyB0aGUgTXVsdGlib290IDEgc3Bl
YywgYikgbWF0Y2hlcyB3aGF0IGlzIHNldCB1cCBpbiBwcmFjdGljZSwKPiBhbmQgYykgaXMgdGhl
IG1vcmUgc2FuZSBiZWhhdmlvdXIgZm9yIGd1ZXN0cyB0byB1c2UuCgpGaXhlczogNjhlMTE4MzQx
MWIgKCdsaWJ4YzogaW50cm9kdWNlIGEgeGNfZG9tX2FyY2ggZm9yIGh2bS0zLjAteDg2XzMyIGd1
ZXN0cycpCgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpJIHdvdWxkIGFkZCBhIG5vdGUgdGhhdCB0aGlzIGFsc28gYWZmZWN0cyB0aGUgSFZN
IGluaXRpYWwgQ1BVIHN0YXRlCihhbGJlaXQgdGhhdCBpcyBub3QgcGFydCBvZiBhbiBBQkkpLgoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
