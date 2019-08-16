Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE42E8FEAB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 11:07:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyY9i-0006vu-JY; Fri, 16 Aug 2019 09:04:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CMUz=WM=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hyY9h-0006vp-N8
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 09:04:17 +0000
X-Inumbo-ID: d18885ac-c004-11e9-8bb2-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d18885ac-c004-11e9-8bb2-12813bfff9fa;
 Fri, 16 Aug 2019 09:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565946255;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Mn2miJPBjee7B+gEP8xi7yLr07zSiWiQKkh1YKPIoaE=;
 b=fiGwJXmfpeO0LfSkXW3t2HShqM9jc4ETknJvy3vv2uQCGf7XzIM3kNG2
 fc8Is0g+qZnbqyO1rgYVA5kNAgJ9CKelD4KWiKoVbbIahp/kV1OmSJRSu
 B+cDTfk06g5CW8AZBSSF3465BD+1HguxYUYs33t340ZN3wKwTwm6YMJDd U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: W5YFRNpSn1Eh+8i5Vr/Zks9u2ZVCLx+qmrltF8AuPZ4KlTloAJrxWrZ2kUDRhIo3AZkqHIOkKj
 PNRQd7byaQo7G8lSRuskWf8HvUVvQXWSgWO+5QUkCiYk4PB6WxPXuxe2i6q2fmRxyVaX82e3WK
 rQ1kZ9ZV/rEOSXf8rzP7SQ9EnCW2FL2K2LufLBz1TpMMwEPp5cebSgewpsOzdoW9d5PCw/9oy1
 xfAP50vpYFPPWrQIU5pVGdwulqchjF91w69RrlJNXIeyKHKW4vMu7kzOorVFmQUYg90Kd8IHgB
 jqc=
X-SBRS: 2.7
X-MesageID: 4342423
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,391,1559534400"; 
   d="scan'208";a="4342423"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190416120716.26269-1-wipawel@amazon.de>
 <20190807113219.71570-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <5600e083-3a00-efec-e245-4c13a38c56bc@citrix.com>
Date: Fri, 16 Aug 2019 10:04:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190807113219.71570-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 v2 1/6] common: Add
 is_standard_section() helper function
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC83LzE5IDEyOjMyIFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBEZXRlY3Qg
c3RhbmRhcmQgKGFsd2F5cyB0byBiZSBpbmNsdWRlZCkgc2VjdGlvbnMgdmlhIHRoZWlyIHNlY3Rp
b24KPiBoZWFkZXIgdHlwZS4gVGhlIHN0YW5kYXJkIHNlY3Rpb25zOiAiLnNoc3RydGFiIiwgIi5z
eW10YWIiLCAiLnN0cnRhYiIKPiBhcmUgZWl0aGVyIG9mIHR5cGUgU0hUX1NZTVRBQiBvciBTSFRf
U1RSVEFCLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2Vs
QGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxhbmRyYXBy
c0BhbWF6b24uY29tPgo+IFJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9u
LmRlPgo+IFJldmlld2VkLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4K
PiAtLS0KPiB2MjoKPiAqIEtlZXAgbGluZXMgdG8gODAgY2hhcnMKPiAtLS0KUmV2aWV3ZWQtYnk6
IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoKVGhhbmtzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
