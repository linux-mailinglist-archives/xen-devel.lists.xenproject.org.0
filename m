Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113F4171431
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 10:35:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7FXj-00077T-72; Thu, 27 Feb 2020 09:33:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7FXh-00077I-GI
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 09:33:17 +0000
X-Inumbo-ID: 2ec337f2-5944-11ea-9c17-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ec337f2-5944-11ea-9c17-bc764e2007e4;
 Thu, 27 Feb 2020 09:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582795996;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OL8D/tXZmKaK7GfBZ9OYqPmSFRJyFeKMc6y4JbffNt4=;
 b=Ype0vqw8OEDIOCqRv5bpeu4/QtK+GFg2JstAfkNa/OhZ55hGWgTBTT1U
 WnBLM2ZTzEzI/F9bgfT9iDsZM8SXHiczXQ5WZ1fj3Nyyd9bl+B6oYxTZw
 DC97/HKc34VOC0ONw60uPbemZdBAuWVW4u/D/gMN1vjHY9Hc4ATahCl3I E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FAsS37UnYAxP5Hgn8ggHu8CEk8R9ZbqmpCvSEWTyV/4ytbjXtRCYY2R87XQgfjyVzj9gQG6DsZ
 CRpZI0Yfrj0ixlF30yTOyYaSUz/l/9Fk8+TSher7ZC+yB8gYJV2mCVPxmZJwUpBQcFPSjtrhlS
 7QTuxLD/+n/a2lAFKRh16+KVnulbDqWjdiKKw/3wXNducGTLqBIiLcb1OtDVWFKwJsY0GwIk3K
 fu6wX4QfBLTqwLoBhstYxJuPfnHMIZdWWT7x4t3f9+7lOehu6n79djhq6zuV2UlK4vM3u4Zohs
 o0Y=
X-SBRS: 2.7
X-MesageID: 13522341
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,491,1574139600"; d="scan'208";a="13522341"
To: Jan Beulich <jbeulich@suse.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-2-andrew.cooper3@citrix.com>
 <f25da974-6fe3-5b0e-4ca1-a937b61d9b22@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <69658bb9-e4e2-dda7-d341-caea6846e794@citrix.com>
Date: Thu, 27 Feb 2020 09:33:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f25da974-6fe3-5b0e-4ca1-a937b61d9b22@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 01/10] x86/sysctl: Don't return cpu policy
 data for compiled-out support (2)
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDIvMjAyMCAwNzozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMDIuMjAyMCAy
MToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gSnVzdCBhcyB3aXRoIGMvcyA5NmRjNzdiNGIx
IGZvciBYRU5fU1lTQ1RMX2dldF9jcHVfcG9saWN5LAo+PiBYRU5fU1lTQ1RMX2dldF9jcHVfZmVh
dHVyZXNldCBuZWVkcyB0byBiZWNvbWUgY29uZGl0aW9uYWwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPgo+IEFsYmVpdCBJJ2Qgc2F5ICJ3YW50
Iiwgbm90ICJuZWVkcyIgaW4gdGhlIGRlc2NyaXB0aW9uLgoKSXQgb2NjdXJzIHRvIG1lIHRoYXQg
WEVOX1NZU0NUTF9nZXRfY3B1X2ZlYXR1cmVzZXQgaXMgc3RyaWN0bHkgYSBzdWJzZXQKb2YgWEVO
X1NZU0NUTF9nZXRfY3B1X3BvbGljeSwgYW5kIHRoYXQgbm93IEkndmUgYWRqdXN0ZWQgdGhlIHRv
b2xzdGFjawpvbnRvIGdldF9jcHVfcG9saWN5LCB0aGUgc29sZSByZW1haW5pbmcgdXNlciBpcyB4
ZW4tY3B1aWQuCgpnZXRfY3B1X3BvbGljeSBhbHJlYWR5IGhhcyBzZXBhcmF0ZSBkZWZhdWx0IGFu
ZCBtYXggaW5kaWNlcywgd2hlcmVhcwpnZXRfY3B1X2ZlYXR1cmVzZXQgd2FzIHdyaXR0ZW4gYmVm
b3JlIHRoZSBuZWVkIGZvciB0aGlzIGhhcyBiZWNvbWUgb2J2aW91cy4KClRoaXMgbGVhZHMgdG8g
YW4gYXN5bW1ldHJ5IGluIHhlbi1jcHVpZCwgd2hlcmUgdGhlIC1wIChwb2xpY3kpIG9wdGlvbgpw
cm92aWRlcyB0d28gbW9yZSBzZXRzIG9mIGluZm9ybWF0aW9uIHRoYW4gdGhlIGZlYXR1cmVzZXQg
bGlzdGluZy4KCkluc3RlYWQsIEkgdGhpbmsgSSdkIGxpa2UgdG8gZHJvcCBYRU5fU1lTQ1RMX2dl
dF9jcHVfZmVhdHVyZXNldCBhbmQKdXBkYXRlIHRoZSBzb2xlIHVzZXIgdG8gdGhlIG1vcmUgY29t
cGxldGUgaW50ZXJmYWNlLgoKVGhvdWdodHM/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
