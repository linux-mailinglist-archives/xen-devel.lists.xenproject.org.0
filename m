Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 820BA13C960
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 17:32:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irlXa-0004Re-Qt; Wed, 15 Jan 2020 16:29:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aRIg=3E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1irlXY-0004RX-W0
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 16:29:09 +0000
X-Inumbo-ID: 25b0d09a-37b4-11ea-85a3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25b0d09a-37b4-11ea-85a3-12813bfff9fa;
 Wed, 15 Jan 2020 16:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579105746;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=x0XTADSfCJ9vgYvPMCLIbqsYgDPEYUhRnap7gX9IcYg=;
 b=FkYZK4CBNl9Sfk0gUM1rL5pHjhXj5ttrc6BgHOQa6hguH/s1mPyW+cO3
 8ZM3829xuZwdcVKPOxgrJtE9gke33ZleuxZ5XlGz24d7eg3HClMdA+JMS
 EZqzHELxpvPevyWdYib/itX09FZOTdM3YV0AMip8cIZcgkF1ScbF7Ol6x o=;
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
IronPort-SDR: hKvOlV/PGCJAIDmyk1XL4l68W+Su51BPL6Fx6QYAukM2jcHFRMJvJiIX1kByzkYisSZIkYZAgz
 +sKjgSzmzqTY/GrtUUBAKrvmT6qNaNdeu5M+XCeu1lGHhsuVImnvrHeLtaWzZxoj7BVhe83W5X
 XPjD9o5GO9e07cAfz/HMlgS6NrKoxLUDrxtOrIHedyNjc3QSRxhilW8DrDTdSdusSD67Tmpk8k
 +on+CbqPlDJKF6aWeU4JR5d7lTzLPxxXXExSPl7DyOgeznGhTvV80IoVeHOCTAByPO1jbVGAEp
 13k=
X-SBRS: 2.7
X-MesageID: 11122037
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,323,1574139600"; d="scan'208";a="11122037"
To: Jan Beulich <jbeulich@suse.com>
References: <39b51904-37d8-f0c0-2ad3-6a0dd7df59d7@suse.com>
 <b68451ec-6594-d4a4-1227-fa3026608122@citrix.com>
 <0d70e32d-b1ff-8b3e-e6f6-dee52734534f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ba696fe6-fb33-d1dd-c2df-02348f202961@citrix.com>
Date: Wed, 15 Jan 2020 16:29:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0d70e32d-b1ff-8b3e-e6f6-dee52734534f@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86: refine link time stub area related
 assertion
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDEvMjAyMCAxNjoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTUuMDEuMjAyMCAx
NTozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTUvMDEvMjAyMCAxMDoyNiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBXaGlsZSBpdCBoYXMgYmVlbiBtZSB0byBpbnRyb2R1Y2UgdGhpcywg
dGhlIHVzZSBvZiB8IHRoZXJlIGhhcyBiZWNvbWUKPj4+IChhbmQgcGVyaGFwcyB3YXMgZnJvbSB0
aGUgdmVyeSBiZWdpbm5pbmcpIG1pc2xlYWRpbmcuIFJhdGhlciB0aGFuCj4+PiBhdm9pZGluZyB0
aGUgcmlnaHQgc2lkZSBvZiBpdCB3aGVuIGxpbmtpbmcgdGhlIHhlbi5lZmkgaW50ZXJtZWRpYXRl
IGZpbGUKPj4+IGF0IGEgZGlmZmVyZW50IGJhc2UgYWRkcmVzcywgbWFrZSB0aGUgZXhwcmVzc2lv
biBjb3BlIHdpdGggdGhhdCBjYXNlLAo+Pj4gdGh1cyB2ZXJpZnlpbmcgcGxhY2VtZW50IG9uIGV2
ZXJ5IHN0ZXAuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+PiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gYXMgdGhpcyBpcyBzaW1wbHkgYQo+PiByZWFycmFuZ2luZywgYnV0Li4uCj4+Cj4+PiAt
LS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4+PiArKysgYi94ZW4vYXJjaC94ODYveGVuLmxk
cy5TCj4+PiBAQCAtMzUxLDggKzM1MSw4IEBAIFNFQ1RJT05TCj4+PiAgICAuY29tbWVudCAwIDog
eyAqKC5jb21tZW50KSB9Cj4+PiAgfQo+Pj4gIAo+Pj4gLUFTU0VSVChfX2ltYWdlX2Jhc2VfXyA+
IFhFTl9WSVJUX1NUQVJUIHwKPj4+IC0gICAgICAgX18yTV9yd2RhdGFfZW5kIDw9IFhFTl9WSVJU
X0VORCAtIE5SX0NQVVMgKiBQQUdFX1NJWkUsCj4+PiArQVNTRVJUKF9fMk1fcndkYXRhX2VuZCA8
PSBYRU5fVklSVF9FTkQgLSBYRU5fVklSVF9TVEFSVCArIF9fWEVOX1ZJUlRfU1RBUlQgLQo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgTlJfQ1BVUyAqIFBBR0VfU0laRSwKPj4gLi4uIGRv
ZXNuJ3QgdGhpcyB3YW50IGEgc3R1YnNfcGVyX3BhZ2UgdGVybT/CoCBXZSBkb24ndCBoYXZlIDRr
IHBlciBjcHUuCj4gR29vZCBwb2ludCAtIGxldCBtZSBzZWUgaWYgSSBjYW4gZml4IHRoaXMgYXQg
dGhpcyBzYW1lIG9jY2FzaW9uLgo+IEkgZ3Vlc3Mgd2hlbiBpbnRyb2R1Y2luZyB0aGVzZSBwYWdl
cyBJIGhhZCBvbmUgcGVyIENQVSBpbml0aWFsbHksCj4gYW5kIHRoZW4gZm9yZ290IHRvIHVwZGF0
ZSB0aGUgYXNzZXJ0aW9uIGhlcmUgKGl0IGJlaW5nIHRvbyBzdHJpY3QKPiBvZiBjb3Vyc2UgaXMg
YmV0dGVyIHRoYW4gaXQgYmVpbmcgdG9vIGxheCkuCgpXaXRoIHNvbWUgc3VpdGFibGUgdGVybSwg
ZmVlbCBmcmVlIHRvIHVwIG15IEEtYnkgdG8gUi1ieS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
