Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F1C3992
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:56:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFKRs-0002EL-Pn; Tue, 01 Oct 2019 15:52:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=78uS=X2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFKRr-0002EG-B4
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:52:23 +0000
X-Inumbo-ID: 7186eeea-e463-11e9-9703-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 7186eeea-e463-11e9-9703-12813bfff9fa;
 Tue, 01 Oct 2019 15:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569945137;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nFDYgvNhXkZ9fBqBMQpyUIpQRjGOJPxYV/q+kSejqbQ=;
 b=UZ99/bVW+brwLpRaHzlAIKYKz39rOlJfeUdhB+ZjHFFkASgPXE9lT+oZ
 30vtaPg+o7U6oDGEUWopxuMYHPu8V+KPYky8+XWNXOnqedjxEeSZIajcd
 lYlaCmwcD/A2N31gTr6pgkUvFcZY0YWLo8SUh1Wxl528443r3T74iB2s1 o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Mc1Hjsm3ZfG2Y1ZSJ9dSBDr/mHUgv4KwYue5UvVSIb4MkO3OH/u5B5BX7rZ3WkvE+5HZmST3u7
 0SSdQcpUNchOl8QoWG+FvPuYLOfJXxMsVxG3AvIzopWGfIKTsxDzrw44crRxc6JojaDCH2v0RR
 uX/kx6Ec/a5cWB6GmBit6xCNn6nMhrK4741gOPjV+fdoEwy9EG9eXXLTWgU45XpDXjOW3/IdQO
 WjcqahjE4AHm8daCx93PIBzpC5l4icmJlnO7Aa8pljuAVJJ9RLCWWDaJ9NSnrqTK1Jkjjnx0lO
 cMo=
X-SBRS: 2.7
X-MesageID: 6673838
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6673838"
To: Jan Beulich <jbeulich@suse.com>
References: <20191001143207.15844-1-andrew.cooper3@citrix.com>
 <20191001143207.15844-2-andrew.cooper3@citrix.com>
 <b5101087-a0db-50bf-8276-78f38b859aff@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f8483c39-947c-1ef1-34b7-3927d55cbf42@citrix.com>
Date: Tue, 1 Oct 2019 16:52:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b5101087-a0db-50bf-8276-78f38b859aff@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_HARDEN_ARRAY
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMTAvMjAxOSAxNTo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDEuMTAuMjAxOSAx
NjozMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhlcmUgYXJlIGxlZ2l0aW1hdGUgY2lyY3Vt
c3RhbmNlIHdoZXJlIGFycmF5IGhhcmRlbmluZyBpcyBub3Qgd2FudGVkIG9yCj4+IG5lZWRlZC4g
IEFsbG93IGl0IHRvIGJlIHR1cm5lZCBvZmYuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiB3aXRoIG9uZSBtb3JlIHF1ZXN0aW9uIChJJ20gc29y
cnksIEkgbWVhbnQgdG8gYXNrIG9uIHYxIGJ1dCB0aGVuCj4gZm9yZ290KToKPgo+PiAtLS0gYS94
ZW4vY29tbW9uL0tjb25maWcKPj4gKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCj4+IEBAIC03Nyw2
ICs3NywzMCBAQCBjb25maWcgSEFTX0NIRUNLUE9MSUNZCj4+ICAJc3RyaW5nCj4+ICAJb3B0aW9u
IGVudj0iWEVOX0hBU19DSEVDS1BPTElDWSIKPj4gIAo+PiArbWVudSAiU3BlY3VsYXRpdmUgaGFy
ZGVuaW5nIgo+PiArCj4+ICtjb25maWcgU1BFQ1VMQVRJVkVfSEFSREVOX0FSUkFZCj4+ICsJYm9v
bCAiU3BlY3VsYXRpdmUgQXJyYXkgSGFyZGVuaW5nIgo+PiArCWRlZmF1bHQgeQo+IEFyZSB5b3Uv
d2UgY29udmluY2VkIGl0IGlzIGEgZ29vZCBpZGVhIHRvIGV4cG9zZSB0aGlzIHdpdGhvdXQgRVhQ
RVJUCj4gcXVhbGlmaWVyPyBJIGtub3cgeW91IGRpc2xpa2UgdGhhdCBlbnRpcmUgbW9kZWwsIGJ1
dCBvdXIgY29tbW9uCj4gZ3JvdW5kcyBzdGlsbCBhcmUgLSBhZmFpY3QgLSB0aGF0IHdlIGRvbid0
IHdhbnQgYSBwcm9saWZlcmF0aW9uIG9mCj4gKHNlY3VyaXR5KSBzdXBwb3J0ZWQgY29uZmlndXJh
dGlvbiB2YXJpYXRpb25zLgoKSXRzIG5vdCBFWFBFUlQgSSBkaXNsaWtlLsKgIEhhdmluZyBhIENP
TkZJR19FWFBFUlQganVzdCBsaWtlIExpbnV4IGhhcwp3b3VsZCBiZSBmaW5lLsKgIEl0cyB0aGUg
ZmFjdCB0aGF0IGl0IHdpbGwgc2lsZW50bHkgcmV2ZXJ0IGJlaGluZCB5b3VyCmJhY2sgaWYgYW4g
ZW52aXJvbm1lbnQgdmFyaWFibGUgaXMgbWlzc2luZyB3aGljaCBpcyB3aGF0IG1ha2VzIHRoZQpi
ZWhhdmlvdXIgdG94aWMgZm9yIHBlb3BsZSB0byB1c2UuCgpUaGF0IGFzaWRlLCBJIGRvbid0IHRo
aW5rIHRoaXMgd2FycmFudHMgZXhwZXJ0LsKgIEl0IGlzIGJlc3QtZWZmb3J0LW9ubHkKbWl0aWdh
dGlvbiwgd2hpY2ggb24gdGhlIGJhbGFuY2Ugb2YgcHJvYmFiaWxpdHkgaXMgbm90IGNvbXBsZXRl
LCB3aGljaApjYW4gc2FmZWx5IGJlIHR1cm5lZCBvZmYgYmFzZWQgb24gYSByaXNrIGFzc2Vzc21l
bnQgb2YgdGhlIHRhcmdldCBDUFUKYW5kIGVudmlyb25tZW50LgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
