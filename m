Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FD13AA1C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 14:06:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irLr7-0000to-Bn; Tue, 14 Jan 2020 13:03:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cZ5I=3D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1irLr5-0000tg-SJ
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 13:03:35 +0000
X-Inumbo-ID: 40a1b1d0-36ce-11ea-ac27-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40a1b1d0-36ce-11ea-ac27-bc764e2007e4;
 Tue, 14 Jan 2020 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579007007;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=17tR8c4064jwcF+T4FgK/tAjfocO7o//r5tMwI8V89k=;
 b=RMboI3LAwYX8htaRnG83bnAj+ZcJ/mz83IgnQAsPYIbvPhnmIINvhPcp
 9M+fBH9bkNl+7RaDSr1w4SpiD8saeRDdHD/Hvr2U4AhG3L/eLicz0EWbR
 bdvhg8hNvKS+VkNHkDR7wVj0J4a/Py4AbksBehS6BCPDUShTBhz6YHxH8 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ooK6xIUZVeQSUHD2g0QLD9v+4B/5UTshUAi7RPtiHUCiX8AQLH2IXA0GdKkKT7Og+le+QvUrde
 PB0x1Kz2sd64as7rwf9eUh7w+RWzoaPI0Fht3ClmS6GlVihQ5nw5M5kIXbnQK6N6NQOTWkxH7Y
 Rwh73hYLfFkY5RTPhFXRQscWfvTV6D7Q37izOPOOHaye8j3QK0RuURt+0sjm4896cGIQJhxQ9O
 e4uyTPs4l75oc6NCgYzPK7gB0LIjaNZUrW/TQ0QWmU6VHCFAkJ2wEJOS6nyV97wI+B+9Vicptq
 CGo=
X-SBRS: 2.7
X-MesageID: 11049738
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,432,1571716800"; d="scan'208";a="11049738"
To: xen-devel <xen-devel@lists.xenproject.org>
References: <20200113175020.32730-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <dd48a305-cafb-e5a3-a7a2-f4a0f1345a3b@citrix.com>
Date: Tue, 14 Jan 2020 13:03:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200113175020.32730-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 0/4] x86: Remove 16M total-size restriction
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

T24gMTMvMDEvMjAyMCAxNzo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJdCB0dXJucyBvdXQg
dGhhdCB0aGUgbm90ZSBpbiBjL3MgYThkMjdhNTRjYzljYwo+Cj4gICBGaW5hbGx5LCBsZWF2ZSBh
IGxpbmtlciBhc3NlcnQgY292ZXJpbmcgdGhlIGZhY3QgdGhhdCBwbGVudHkgb2YgY29kZSBibGlu
ZGx5Cj4gICBhc3N1bWVzIHRoYXQgWGVuIGlzIGxlc3MgdGhhdCAxNk0uICBUaGlzIHdhbnRzIGZp
eGluZyBpbiBkdWUgY291cnNlLgo+Cj4gd2FzIGVhc2llciB0byBhZGRyZXNzIHRoYW4gSSBoYWQg
b3JpZ2luYWxseSBhbnRpY2lwYXRlZC4gIFRoaXMgc2VyaWVzIGRvZXMgc28uCj4KPiBUaGUgZW5k
IHJlc3VsdCBjYW4gYmUgdGVzdGVkIGJ5IHRyeWluZyB0byBib290IHdpdGg6Cj4KPiAgIGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gICBp
bmRleCA3NTk4MjdhMTlhLi5mYTgzYTlhMjhmIDEwMDY0NAo+ICAgLS0tIGEveGVuL2FyY2gveDg2
L3NldHVwLmMKPiAgICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gICBAQCAtNTIsNiArNTIs
OCBAQAo+ICAgICNpbmNsdWRlIDxhc20vc3BlY19jdHJsLmg+Cj4gICAgI2luY2x1ZGUgPGFzbS9n
dWVzdC5oPgo+Cj4gICArc3RhdGljIHVpbnQ4X3QgX191c2VkIGJpZ19kYXRhW01CKDE2KV0gPSB7
IDQyLCB9Owo+ICAgKwo+ICAgIC8qIG9wdF9ub3NtcDogSWYgdHJ1ZSwgc2Vjb25kYXJ5IHByb2Nl
c3NvcnMgYXJlIGlnbm9yZWQuICovCj4gICAgc3RhdGljIGJvb2wgX19pbml0ZGF0YSBvcHRfbm9z
bXA7Cj4gICAgYm9vbGVhbl9wYXJhbSgibm9zbXAiLCBvcHRfbm9zbXApOwo+Cj4gQmVmb3JlIHRo
aXMgc2VyaWVzLCBYZW4gd2lsbCB0cmlwbGUgZmF1bHQgaW4gb25lIG9mIHNldmVyYWwgcGxhY2Vz
IChmaXJzdCBhbmQKPiBtb3N0IG9idmlvdXNseSwgX19oaWdoX3N0YXJ0IG9uIHRoZSBmaXJzdCBz
dGFjayBhY2Nlc3MsIGFzIGNwdTBfc3RhY2tbXSBpcwo+IHZlcnkgbmVhciB0aGUgZW5kIG9mIFhl
bidzIGxpbmtlZCBpbWFnZSkuCgpJdCB0dXJucyBvdXQgdGhpcyBpcyBpbmNvbXBsZXRlLsKgIEkn
dmUgZm91bmQgYW5vdGhlciBoYXJkY29kZWQgMTZNCmludGVydHdpbmVkIHdpdGggdGhlIHRyYW1w
b2xpbmUgcmVsb2NhdGlvbiBsb2dpYy4KClRoZSBjb2RlIHByZXNlbnRlZCBoZXJlIGlzIGZpbmUg
YW5kIHJlYWR5IGZvciBzdWJtaXNzaW9uLCB3aXRoIHRoZQpleGNlcHRpb24gb2YgdGhlIGh1bmsg
aW4gdGhlIGZpbmFsIHBhdGNoIHdoaWNoIGRyb3BzIHRoZSBsaW5rZXIgYXNzZXJ0aW9uLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
