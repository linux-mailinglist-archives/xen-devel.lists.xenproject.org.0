Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B281261D4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 13:17:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihuhp-0002lB-SN; Thu, 19 Dec 2019 12:15:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNyU=2J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihuhn-0002l6-Vx
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 12:15:00 +0000
X-Inumbo-ID: 2bce3ca9-2259-11ea-9195-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2bce3ca9-2259-11ea-9195-12813bfff9fa;
 Thu, 19 Dec 2019 12:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576757698;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=UmkDWmoPNaGXixo1nOAummzTwM2IYIsBbMaIB2RErBI=;
 b=SZydV3xd5BOAcL2EjuWhHPmSkPsGZVmo+JOnzqZhU7fX3vK5vg21hr6p
 qBqXZjqAw+Ga8w0pX4LpTJf/17nXxWeuT3PhKZpfgMAg2oG+BucyC1Sdd
 Vm+h6PedZOLt1XcTVO3lLUi98IGXxA2YRF7CVQL8fNV8Lz+WjhrJBG4cy M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7sP4/Qu5/O6zACicP2pbCYADwu06uiOgfDYT1QOxhW9eoyJ9tdJ3/MccSrV9JMXSbFk7//0Gsq
 WxhiZEy0QQ/OSdSkpTaKc//3eySWOZKg4bb4JFyC52kDCxkbjp10Ig4AKSKMSO+a4KMSnm1tLn
 Nr04Z8kd8HMbY+ahvTE5klsjgsXt6d9/tvQt3kPLz3nplReFO536lkb/CFysKovLjsfImAx1ul
 3IyObCBNjLzyFxE7d30PAbOmd7zwCYnYBadOWL6EZhG56HNTgRQrQ/y6szv60Sqfy/UeKCBG/C
 jV4=
X-SBRS: 2.7
X-MesageID: 10516175
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,331,1571716800"; d="scan'208";a="10516175"
To: "Durrant, Paul" <pdurrant@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20191218160926.12538-1-pdurrant@amazon.com>
 <f72c26d5-ba96-5804-126a-865af62ceff1@citrix.com>
 <671333aff34f4e92bded1ad705264e02@EX13D32EUC003.ant.amazon.com>
 <0a4f237a-b744-50f8-7bd2-e53ddffea78e@citrix.com>
 <80696690f8874a4da7a6c2f724cc78b4@EX13D32EUC003.ant.amazon.com>
 <cc25d9e4-412f-a297-7f3c-8543d10cca59@citrix.com>
 <121745b60779415aab50d1364e6c6395@EX13D32EUC003.ant.amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e54ebe73-19df-a303-1050-9ffd08503c76@citrix.com>
Date: Thu, 19 Dec 2019 12:14:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <121745b60779415aab50d1364e6c6395@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/save: reserve HVM save record numbers
 that have been consumed...
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMTIvMjAxOSAxMTo0NSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KPj4gU2VudDogMTkgRGVjZW1iZXIgMjAxOSAxMTozMAo+PiBUbzogRHVycmFudCwg
UGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zwo+PiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kKPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIXSB4ODYvc2F2ZTogcmVzZXJ2ZSBIVk0gc2F2ZSBy
ZWNvcmQgbnVtYmVycwo+PiB0aGF0IGhhdmUgYmVlbiBjb25zdW1lZC4uLgo+Pgo+PiBPbiAxOS8x
Mi8yMDE5IDExOjA2LCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+Pj4+IEl0IGlzIG5vdCBmYWlyIG9y
IHJlYXNvbmFibGUgdG8gaW5jbHVkZSBleHRyYSBoZWFkcm9vbSBpbiBhICJvaCBkZWFyIHdlCj4+
Pj4gc2NyZXdlZCB1cCAtIHdpbGwgdGhlIGNvbW11bml0eSBiZSBraW5kIGVub3VnaCB0byBoZWxw
IHVzIHdvcmsgYXJvdW5kCj4+Pj4gb3VyIEFCSSBwcm9ibGVtcyIgc2NlbmFyaW8uCj4+Pj4KPj4+
IEkgd291bGQgaGF2ZSB0aG91Z2h0IGFsbCB0aGUgcGFpbiB5b3Ugd2VudCB0aHJvdWdoIHRvIGtl
ZXAgWGVuU2VydmVyCj4+IGdvaW5nIHdpdGggaXRzIG5vbi11cHN0cmVhbWVkIGh5cGVyY2FsbCBu
dW1iZXJzIHdvdWxkIGhhdmUgbWFkZSB5b3UgYQo+PiBsaXR0bGUgbW9yZSBzeW1wYXRoZXRpYyB0
byBkZWFsaW5nIHdpdGggcGFzdCBtaXN0YWtlcy4KPj4KPj4gSSBjb3VsZCBvYmplY3QgdG8gdGhl
IHByaW5jaXBsZSBvZiB0aGUgcGF0Y2gsIGlmIHlvdSdkIHByZWZlciA6KQo+Pgo+PiBJZiB5b3Ug
cmVjYWxsIGZvciB0aGUgbGVnYWN5IHdpbmRvdyBQViBkcml2ZXIgQUJJIGJyZWFrYWdlcywgSSBk
aWRuJ3QKPj4gYWN0dWFsbHkgcmVzZXJ2ZSBhbnkgbnVtYmVycyB1cHN0cmVhbSBpbiB0aGUgZW5k
LsKgIEFsbCBjb21wYXRpYmlsaXR5IHdhcwo+PiBoYW5kbGVkIGxvY2FsbHkuCj4gQW5kIEkgcmVt
ZW1iZXIgaG93IG5hc3R5IHRoZSBoYWNrcyB3ZXJlIDstKQoKTGlrZSBJJ20gZXZlciBnb2luZyB0
byBmb3JnZXQgdGhvc2UuLi4KCkZvciBhbnlvbmUgZWxzZSByZWFkaW5nIHRoaXMgdGhyZWFkIGFu
ZCBpcyBhIGxpdHRsZSBjb25mdXNlZCwKaHR0cHM6Ly9naXRodWIuY29tL3hlbnNlcnZlci94ZW4u
cGcvYmxvYi9YUy03LjEueC9tYXN0ZXIveGVuLWxlZ2FjeS13aW4teGVubWFwc3BhY2UtcXVpcmtz
LnBhdGNoCm91Z2h0IHRvIGNsZWFyIHNvbWUgdGhpbmdzIHVwLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
