Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988B4D00BB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 20:35:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHuGG-0003ML-UP; Tue, 08 Oct 2019 18:31:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5hjQ=YB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iHuGF-0003MG-RG
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 18:31:03 +0000
X-Inumbo-ID: c80f8ef2-e9f9-11e9-96dc-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c80f8ef2-e9f9-11e9-96dc-bc764e2007e4;
 Tue, 08 Oct 2019 18:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570559462;
 h=to:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=KN9hB+AhpTyyYxHDG9lqEmnb8aKJy1Rg1X4wGTA2Dyc=;
 b=CqM8XwSmNk1v4JCCMlHrg0dGqM7wMl4fNwKZk2DX+9yHl7Tj45zjIezk
 ZEc/mIwc/TjwB5XRA7qFihY/zrLfJl98qz04t8hAI17/iRMLJEB8tLiSr
 MZEHSFz3kxUZ1HFVo548UBAvFBaGSk+sIsDZk7L7S6b3Retuk7YXLUl0/ c=;
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
IronPort-SDR: clk3VX8QTbu1apPH57PD+KAR+vipLYhDbnI+R9CQZ34BySGCDkm/hlH/6xz291aUfJrx9VQyq4
 VmdTxAcZ2/sufXPZQaejSNMUks5zncueHtUmWHddOKbxCc+MXf9qj4OGjyt1f4ORF+VfPunynO
 hzs2sbx7iQy5MNJDc9bbwOtK1rjh/ue9AeivUKevmQ4V7eZX5EFOkjImzya4RJvjOI28KlR1Bs
 nrUwN7axH7r0qAMWdai66qb1NWo3hIe/OeMOzUiEc0wQdSF+u8oGODuCMj94TK5y+0qvNdwA+1
 zTk=
X-SBRS: 2.7
X-MesageID: 6929685
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,272,1566878400"; 
   d="scan'208";a="6929685"
To: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
 <roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <09d5e0bc-074e-90c5-f0a6-60e1be23d92f@citrix.com>
Date: Tue, 8 Oct 2019 19:30:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: [Xen-devel] HPET interrupt remapping during boot
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpJIGhhdmUgbm8gaWRlYSBpZiB0aGlzIGlzIGEgcmVncmVzc2lvbiBvciBub3QuwqAg
SSBzdXNwZWN0IGl0IG1pZ2h0IG5vdApiZSwgYW5kIGhhcyBhbHdheXMgYmVlbiBicm9rZW4uCgpF
aXRoZXIgd2F5LCBJJ20gc2VlaW5nIG9jY2FzaW9uYWwgc2luZ2xlIGludGVycnVwdCByZW1hcHBp
bmcgZXJyb3JzIHdoZW4KYm9vdGluZyBhIHJhbmdlIG9mIEludGVsIHN5c3RlbXMKCihYRU4pIHgy
QVBJQyBtb2RlIGlzIGFscmVhZHkgZW5hYmxlZCBieSBCSU9TLgooWEVOKSBVc2luZyBBUElDIGRy
aXZlciB4MmFwaWNfY2x1c3RlcgouLi4KKFhFTikgUGxhdGZvcm0gdGltZXIgaXMgMjMuOTk5TUh6
IEhQRVQKKFhFTikgRGV0ZWN0ZWQgMjE5NC45MjIgTUh6IHByb2Nlc3Nvci4KLi4uCihYRU4pIEhW
TTogSEFQIHBhZ2Ugc2l6ZXM6IDRrQiwgMk1CLCAxR0IKKFhFTikgYWx0IHRhYmxlIGZmZmY4MmQw
ODA0N2EwNzAgLT4gZmZmZjgyZDA4MDQ4NmM2YwooWEVOKSBbVlQtRF1JTlRSLVJFTUFQOiBSZXF1
ZXN0IGRldmljZSBbMDAwMDpmMDoxZi4wXSBmYXVsdCBpbmRleCAwLAppb21tdSByZWcgPSBmZmZm
ODJjMDAwNzJkMDAwCihYRU4pIFtWVC1EXUlOVFItUkVNQVA6IHJlYXNvbiAyMiAtIFByZXNlbnQg
ZmllbGQgaW4gdGhlIElSVEUgZW50cnkgaXMgY2xlYXIKKFhFTikgbWljcm9jb2RlOiBDUFUyIHVw
ZGF0ZWQgZnJvbSByZXZpc2lvbiAweDUwMDAwMjEgdG8gMHg1MDAwMDJiLCBkYXRlCj0gMjAxOS0w
OC0xMgoKRnJvbSBvdGhlciBkZWJ1Z2dpbmcsIEkga25vdyB0aGF0IHRoaXMgaGFwcGVucyBhZnRl
ciBDUFUgMSAod2hpY2ggaXMgYQpoeXBlcnRocmVhZCkgaGFzIHBhc3NlZCB0aHJvdWdoIHN0YXJ0
X3NlY29uZGFyeSgpLgoKZjA6MWYuMCBpcyBvbmUgb2YgdGhlIElPLUFQSUNzLCBhbmQgaWYgSSd2
ZSBjcm9zcyByZWZlcmVuY2VkIHRoZSBETUFSCmFuZCBBUElDIHRhYmxlcyBwcm9wZXJseSwgaXMg
dGhlIElPLUFQSUMgb24gdGhlIFBDSCwgbWFraW5nIHRoZQpwcm9ibGVtYXRpYyBJUlEgR1NJMC4K
ClRoaXMgc3VnZ2VzdHMgdGhhdCB3ZSBoYXZlIGFuIGVycm9yIHNldHRpbmcgdXAgdGhlIHRpbWVy
IElSUSAoYXMgdGhlCkhQRVQgaXNuJ3QgTVNJLWNhcGFibGUpLCBidXQgd2UgaGF2ZSBhbHJlYWR5
IGFsbGVnZWRseSB1c2VkIGl0CnN1Y2Nlc3NmdWxseSBlYXJsaWVyIG9uIGJvb3QuCgpJIGhhdmVu
J3QgaW52ZXN0aWdhdGVkIGZ1cnRoZXIgeWV0LCBidXQgaXQgaXMgYW4gaW50ZXJtaXR0ZW50IGlz
c3VlCihpLmUuIGRvZXNuJ3QgcmVwcm9kdWNlIG9uIGVhY2ggYm9vdCkuwqAgTXkgZ3V0IGZlZWxp
bmcgaXMgdGhhdCB3ZSBoYXZlCnNvbWV0aGluZyB3aGljaCBjb3JyZWN0cyBpdHNlbGYgYXMgYSBz
aWRlIGVmZmVjdCBvZiBhIGxhdGVyIGFjdGlvbi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
