Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9F710AD59
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 11:14:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZuIY-0004JH-U6; Wed, 27 Nov 2019 10:11:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vK6a=ZT=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iZuIX-0004JC-Ke
 for xen-devel@lists.xen.org; Wed, 27 Nov 2019 10:11:49 +0000
X-Inumbo-ID: 52cbbd7e-10fe-11ea-a55d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52cbbd7e-10fe-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574849508;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rU0KGmNPs4LCQyEcWeeyJlzft2HOrmFjtwFLROvMJvg=;
 b=Dg/DqFzSqAnzOJC4a3DhKAjrfReDUhB+MRY3k4R8qBBX/PUIuqPCzVSl
 66UPMGh3tIOyP0Pf03d7D1KCdTfeFOqKmnyJuorAB2k30lu7ZmlCszBes
 8+5FXTnI+W0C5XeRQP4Y30jVb0fTbQFKkTTbr6GKO6qU+/F7iycTzDUFQ k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G8hz2cVpaHuznAtYfJppMlSknrZDSu+6EH7e9BZCVFNgyNtVEopVSpmzu1aOHt0z7OHub52uix
 Gw+lxt/VzDBTNIsP86xLZtSJh92zccuxT4L/SQgZWvydNEP5hnuejLkjT8T9ds61emaN74ue6T
 pG3Aw/DGnlvgfzk/TsED0QkOsjBkOUrsvxZ8MpyVTo/AS/Z33hV0h3W1IlUDutCNUToWouEmmx
 WsrpT41gluseJXMQu5+1zKoOAjOelyvFlzA/w3MZYG3eQS8edCDB9Ro988oa7KrCPfAhzfxA38
 aRU=
X-SBRS: 2.7
X-MesageID: 9254789
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,249,1571716800"; 
   d="scan'208";a="9254789"
To: Chao Gao <chao.gao@intel.com>
References: <20191126154153.12144-1-sergey.dyasli@citrix.com>
 <20191127031041.GA14015@gao-cwp>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <f8064135-0c0a-1bd0-dd12-95dfe597e956@citrix.com>
Date: Wed, 27 Nov 2019 10:11:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127031041.GA14015@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 for 4.13] x86/microcode: refuse to load
 the same revision ucode
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMTEvMjAxOSAwMzoxMCwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gVHVlLCBOb3YgMjYsIDIw
MTkgYXQgMDM6NDE6NTNQTSArMDAwMCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gQ3VycmVudGx5
IGlmIGEgdXNlciB0cmllcyB0byBsaXZlLWxvYWQgdGhlIHNhbWUgb3Igb2xkZXIgdWNvZGUgcmV2
aXNpb24KPj4gdGhhbiBDUFUgYWxyZWFkeSBoYXMsIGhlIHdpbGwgZ2V0IGEgc2luZ2xlIG1lc3Nh
Z2UgaW4gWGVuIGxvZyBsaWtlOgo+Pgo+PiAgICAoWEVOKSAxMjggY29yZXMgYXJlIHRvIHVwZGF0
ZSB0aGVpciBtaWNyb2NvZGUKPj4KPj4gTm8gYWN0dWFsIHVjb2RlIGxvYWRpbmcgd2lsbCBoYXBw
ZW4gYW5kIHRoaXMgc2l0dWF0aW9uIGNhbiBiZSBxdWl0ZQo+PiBjb25mdXNpbmcuIEZpeCB0aGlz
IGJ5IHN0YXJ0aW5nIHVjb2RlIHVwZGF0ZSBvbmx5IHdoZW4gdGhlIHByb3ZpZGVkCj4+IHVjb2Rl
IHJldmlzaW9uIGlzIGhpZ2hlciB0aGFuIHRoZSBjdXJyZW50bHkgY2FjaGVkIG9uZSAoaWYgYW55
KS4KPj4gVGhpcyBpcyBiYXNlZCBvbiB0aGUgcHJvcGVydHkgdGhhdCBpZiBtaWNyb2NvZGVfY2Fj
aGUgZXhpc3RzLCBhbGwgQ1BVcwo+PiBpbiB0aGUgc3lzdGVtIHNob3VsZCBoYXZlIGF0IGxlYXN0
IHRoYXQgdWNvZGUgcmV2aXNpb24uCj4+Cj4+IEFkZGl0aW9uYWxseSwgcHJpbnQgYSB1c2VyIGZy
aWVuZGx5IG1lc3NhZ2UgaWYgbm8gbWF0Y2hpbmcgb3IgbmV3ZXIKPj4gdWNvZGUgY2FuIGJlIGZv
dW5kIGluIHRoZSBwcm92aWRlZCBibG9iLiBUaGlzIGFsc28gcmVxdWlyZXMgaWdub3JpbmcKPj4g
LUVOT0RBVEEgaW4gQU1ELXNpZGUgY29kZSwgb3RoZXJ3aXNlIHRoZSBtZXNzYWdlIGdpdmVuIHRv
IHRoZSB1c2VyIGlzOgo+Pgo+PiAgICAoWEVOKSBQYXJzaW5nIG1pY3JvY29kZSBibG9iIGVycm9y
IC02MQo+Pgo+PiBXaGljaCBhY3R1YWxseSBtZWFucyB0aGF0IGEgdWNvZGUgYmxvYiB3YXMgcGFy
c2VkIGZpbmUsIGJ1dCBubyBtYXRjaGluZwo+PiB1Y29kZSB3YXMgZm91bmQuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPj4gLS0t
Cj4+IHYyIC0tPiB2MzoKPj4gLSBtb3ZlIHVjb2RlIGNvbXBhcmlzb24gdG8gZ2VuZXJpYyBjb2Rl
Cj4+IC0gaWdub3JlIC1FTk9EQVRBIGluIGEgZGlmZmVyZW50IGNvZGUgc2VjdGlvbgo+Pgo+PiB2
MSAtLT4gdjI6Cj4+IC0gY29tcGFyZSBwcm92aWRlZCB1Y29kZSB3aXRoIHRoZSBjdXJyZW50bHkg
Y2FjaGVkIG9uZQo+Pgo+PiBDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBD
QzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4gQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiBDQzogQ2hhbyBHYW8gPGNoYW8u
Z2FvQGludGVsLmNvbT4KPj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4g
LS0tCj4+IHhlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyAgICAgfCAxOSArKysrKysrKysrKysrKysr
KysrCj4+IHhlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMgfCAgNyArKysrKysrCj4+IDIgZmls
ZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L21pY3JvY29kZS5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4+IGluZGV4IDY1ZDFm
NDFlN2MuLjQ0ZWZjMmQ5YjMgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUu
Ywo+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKPj4gQEAgLTY0MCwxMCArNjQwLDI5
IEBAIGludCBtaWNyb2NvZGVfdXBkYXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY29uc3Rfdm9p
ZCkgYnVmLCB1bnNpZ25lZCBsb25nIGxlbikKPj4KPj4gICAgIGlmICggIXBhdGNoICkKPj4gICAg
IHsKPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJtaWNyb2NvZGU6IGNvdWxkbid0
IGZpbmQgYW55IG1hdGNoaW5nIHVjb2RlIGluICIKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJ0aGUgcHJvdmlkZWQgYmxvYiFcbiIpOwo+PiAgICAgICAgIHJldCA9IC1FTk9FTlQ7
Cj4+ICAgICAgICAgZ290byBwdXQ7Cj4+ICAgICB9Cj4+Cj4+ICsgICAgLyoKPj4gKyAgICAgKiBJ
ZiBtaWNyb2NvZGVfY2FjaGUgZXhpc3RzLCBhbGwgQ1BVcyBpbiB0aGUgc3lzdGVtIHNob3VsZCBo
YXZlIGF0IGxlYXN0Cj4+ICsgICAgICogdGhhdCB1Y29kZSByZXZpc2lvbi4KPj4gKyAgICAgKi8K
Pj4gKyAgICBzcGluX2xvY2soJm1pY3JvY29kZV9tdXRleCk7Cj4+ICsgICAgaWYgKCBtaWNyb2Nv
ZGVfY2FjaGUgJiYKPj4gKyAgICAgICAgIG1pY3JvY29kZV9vcHMtPmNvbXBhcmVfcGF0Y2gocGF0
Y2gsIG1pY3JvY29kZV9jYWNoZSkgIT0gTkVXX1VDT0RFICkKPj4gKyAgICB7Cj4+ICsgICAgICAg
IHNwaW5fdW5sb2NrKCZtaWNyb2NvZGVfbXV0ZXgpOwo+PiArICAgICAgICBwcmludGsoWEVOTE9H
X1dBUk5JTkcgIm1pY3JvY29kZTogY291bGRuJ3QgZmluZCBhbnkgbmV3ZXIgcmV2aXNpb24gIgo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImluIHRoZSBwcm92aWRlZCBibG9iIVxu
Iik7Cj4gCj4gVGhlIHBhdGNoIG5lZWRzIHRvIGJlIGZyZWVkLgoKVGhhbmtzIGZvciBub3RpY2lu
ZyB0aGlzIQoKLS0KU2VyZ2V5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
