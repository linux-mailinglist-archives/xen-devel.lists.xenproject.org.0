Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9103118A78
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 15:09:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iegB5-0002RF-5d; Tue, 10 Dec 2019 14:07:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SlXp=2A=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iegB4-0002R9-BW
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 14:07:50 +0000
X-Inumbo-ID: 71de5b24-1b56-11ea-895a-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71de5b24-1b56-11ea-895a-12813bfff9fa;
 Tue, 10 Dec 2019 14:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575986868;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=XMkoRzGOW/PvkD/GjoWoz4LVS5rN91yHae8mP8qXRq4=;
 b=VOCSNUNapFFq6rvfzhjS4+3bOCF461N0UUrAZRwFWzfG7scohTF9TGEH
 N4nv0CmfOYJpfEHeTMMzU75ahScZgG7HhJI+Ke2NOZdO3MUnONeNYuQf6
 Ocr/qNG0SOYrfWHhtYh0n/NLC9iOT/Ufqk+MV1Hk/VwK74wE+IrHfs680 E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qcn5feJcuvi0mGewfWWUQHpDKmP46/BxsXLzkoOK7wnC4gtk7IM4BxQqIZlLuB9CY2NUM7Lyg/
 m4okvMrKEavtDzTUVpgbF2sohyw0W32WvPhWeHtAhL7ZvExVLaGgLXq33mGQe5ZciZ+gmRObhw
 EO3fRfvMQqTniM7ubksLbaq2cSpNKcAT1bngBN94/wjFHCc3JrGhtlnnZl1c7dXWrCm5TWTVs8
 GINJ/bxtD8H7b9K0sA16UZSf5l6/gqWAH7x4Ru+lmm/cpNwPYFjV9u0L0hTr+vB/lBhlydGgK6
 kUw=
X-SBRS: 2.7
X-MesageID: 9459418
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,299,1571716800"; 
   d="scan'208";a="9459418"
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <1575417367-12822-1-git-send-email-igor.druzhinin@citrix.com>
 <1042aef4-c873-6cf9-c7b4-cca1214d61af@suse.com>
 <df136147-76f4-841c-9f3e-2700fb856405@suse.com>
 <74022d78-e4b4-11e2-95bc-7986fe2cb76e@citrix.com>
 <fc867c90-baf3-a678-ee02-ea46d5815e91@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <98660d1a-728d-efdd-35ba-498b4da6ff87@citrix.com>
Date: Tue, 10 Dec 2019 14:07:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fc867c90-baf3-a678-ee02-ea46d5815e91@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/AMD: unbreak CPU hotplug on AMD
 systems without RstrFpErrPtrs
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, wl@xen.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTIvMjAxOSAxMzo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTAuMTIuMjAxOSAx
MzozNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gRnVydGhlcm1vcmUsIHlvdSB3aWxsIG9ic2Vy
dmUgdGhhdCB0aGVyZSBpcyBhbiBhY3Rpb24gaXRlbSBvbiBtZSBmcm9tCj4+IHRoZSBjYWxsIHRv
IGNvbWUgdXAgd2l0aCBhIGxlc3MgYnJva2VuIGFsdGVybmF0aXZlIHdoaWNoIEknbSBnZW51aW5l
bHkKPj4gYXR0ZW1wdGluZyB0byBkby4KPiAKPiBUaGVyZSdzIG5vIGluZGljYXRpb24gdG93YXJk
cyB0aGlzIGluIHRoZSBtaW51dGVzLCBhZmFpY3MuIE9yIHdhaXQKPiAtIHRoZSBzYW1lIHRvcGlj
IGFwcGVhcnMgdHdpY2UgdGhlcmUgKGFzIGJvdGggNCBhbmQgNikuIEkgd2Fzbid0Cj4gZXZlbiBh
d2FyZSBvZiBzdWNoIGFuIGFjdGlvbiBpdGVtLiBJJ2xsIGJlIGhhcHB5IHRvIHJldmVydCBpZiB5
b3UKPiBpbmRpY2F0ZSBzbywgYW5kIGlmIGEgYmV0dGVyIGZpeCBpcyBnb2luZyB0byBzaG93IHVw
IGluIHRpbWUuCgpJIGRvbid0IHRoaW5rIHJldmVydGluZyB3b3VsZCBtYWtlIHNlbnNlIC0gdGhl
IHBhdGNoIGRvZXNuJ3QgYnJlYWsKYW55dGhpbmcsIGV2ZW4gbW9yZSAtIGl0IGFjdHVhbGx5IGZp
eGVzIHRoZSBwcm9ibGVtIHdlIG9ic2VydmVkLgpJZiB0aGVyZSBpcyBhbiBpbXByb3ZlbWVudCB0
byB0aGF0IGNvbWluZyAtIGl0IHNob3VsZCBiZSBqdXN0IGRvbmUKb24gdG9wIG9mIHRoaXMgYWxz
byBwb3RlbnRpYWxseSB0YWtpbmcgY2FyZSBvZiBvdGhlciBwbGFjZXMgaW4gdGhlIGNvZGUKdGhh
dCBtaWdodCBiZSBhZmZlY3RlZC4KCklnb3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
