Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96787AE817
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 12:28:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7dLC-0007as-Cf; Tue, 10 Sep 2019 10:25:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zTA9=XF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7dLB-0007am-CT
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 10:25:41 +0000
X-Inumbo-ID: 5641149e-d3b5-11e9-b299-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5641149e-d3b5-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568111141;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=JvXjrRQFjA5uEHna26rq3ZYbaRfL/buaA3DRv2Jg5ic=;
 b=K7HaJFLOjjC8H+434vCqKWqJaJv0wRylfYrZA/MeFiBLm9IKS97Yf5VA
 WIFXptaNPSzzjYVnJFMNScHV+BH6IJV93RXCREu3GPHB9hIwysftZVao/
 BaayST6MbGVnFxfMxGzftv171b3akz/0Xfp0aiFFcOJPTBAqMmtdXS5QE U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DwPr2dbaHhpzF0YwSLRaEXM/7QSnq892Gfjn98ctb8lwAQzvf2oFbKSKjFRN93BPRCNmR4FJCP
 ceZEAWU7zgPjl4vdmMvw82VHWVCPWKzBrvmogbg+NM67v7eLI6Cep6RyXYVuQ0ycSntod7NjFA
 zNuDGh8q7M3ADh9zZ+QcNE56jfsO7tpl1aSMEQMIe3m5gmpfzZDeFjZLUpzbgpvshcLJDGNpDT
 ja68JZyNIOtOUEAttEFK0QKZBt0Du+U/O5Z5bPodrpwoI4k9JQrlyO9loBisBNFzi8eKRowOGG
 bTM=
X-SBRS: 2.7
X-MesageID: 5366938
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5366938"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190909155124.19942-1-andrew.cooper3@citrix.com>
 <20190910092912.s2seglrzng22zhjm@Air-de-Roger>
 <3d8def41-e192-6d3a-066d-33d0585a66f7@citrix.com>
 <20190910095705.ck7kij2pxq7yfzco@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d515b7b7-6527-07ae-8af3-b24083de7d59@citrix.com>
Date: Tue, 10 Sep 2019 11:25:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910095705.ck7kij2pxq7yfzco@Air-de-Roger>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/cpuid: Fix handling of the
 CPUID.7[0].eax levelling MSR
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
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDkvMjAxOSAxMDo1NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIFNl
cCAxMCwgMjAxOSBhdCAxMDozNToyNkFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBP
biAxMC8wOS8yMDE5IDEwOjI5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4gT24gTW9uLCBT
ZXAgMDksIDIwMTkgYXQgMDQ6NTE6MjRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+
PiA3YTAgaXMgYW4gaW50ZWdlciBmaWVsZCwgbm90IGEgbWFzayAtIHRha2luZyB0aGUgbG9naWNh
bCBhbmQgb2YgdGhlIGhhcmR3YXJlCj4+Pj4gYW5kIHBvbGljeSB2YWx1ZXMgcmVzdWx0cyBpbiBu
b25zZW5zZS4gIEluc3RlYWQsIHRha2UgdGhlIHBvbGljeSB2YWx1ZQo+Pj4+IGRpcmVjdGx5Lgo+
Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KPj4+PiAtLS0KPj4+PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29t
Pgo+Pj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+Pj4+IENDOiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+Pgo+Pj4+IEV2ZW4gUm9tZSBoYXJkd2FyZSBoYXMg
N1swXS5lYXggc3RpbGwgYXMgMCwgYW5kIHRoZXJlIGlzIG5vIHNlbnNpYmxlIHJlYXNvbiB0bwo+
Pj4+IHNldCBtYXhfc3VibGVhZiBoaWdoZXIgYXQgdGhpcyBwb2ludCwgc28gdGhpcyBpcyBvbmx5
IGEgbGF0ZW50IGJ1ZyBmb3Igbm93Lgo+Pj4+IC0tLQo+Pj4+ICB4ZW4vYXJjaC94ODYvZG9tY3Rs
LmMgfCAxMyArKysrKysrKystLS0tCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Rv
bWN0bC5jIGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4+Pj4gaW5kZXggMWU5OGZjODAwOS4uMzVh
ZDhjYjUxYyAxMDA2NDQKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPj4+PiArKysg
Yi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPj4+PiBAQCAtMjE4LDExICsyMTgsMTYgQEAgc3RhdGlj
IGludCB1cGRhdGVfZG9tYWluX2NwdWlkX2luZm8oc3RydWN0IGRvbWFpbiAqZCwKPj4+PiAgICAg
ICAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSAmJiAoKGxldmVsbGluZ19jYXBzICYgTENBUF83YWIw
KSA9PSBMQ0FQXzdhYjApICkKPj4+PiAgICAgICAgICB7Cj4+Pj4gICAgICAgICAgICAgIHVpbnQ2
NF90IG1hc2sgPSBjcHVpZG1hc2tfZGVmYXVsdHMuXzdhYjA7Cj4+Pj4gLSAgICAgICAgICAgIHVp
bnQzMl90IGVheCA9IGN0bC0+ZWF4Owo+Pj4+IC0gICAgICAgICAgICB1aW50MzJfdCBlYnggPSBw
LT5mZWF0Ll83YjA7Cj4+Pj4gIAo+Pj4+IC0gICAgICAgICAgICBpZiAoIGJvb3RfY3B1X2RhdGEu
eDg2X3ZlbmRvciAmIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04pICkKPj4+PiAt
ICAgICAgICAgICAgICAgIG1hc2sgJj0gKCh1aW50NjRfdCllYXggPDwgMzIpIHwgZWJ4Owo+Pj4+
ICsgICAgICAgICAgICAvKgo+Pj4+ICsgICAgICAgICAgICAgKiBMZWFmIDdbMF0uZWF4IGlzIG1h
eF9zdWJsZWFmLCBub3QgYSBmZWF0dXJlIG1hc2suICBUYWtlIGl0Cj4+Pj4gKyAgICAgICAgICAg
ICAqIHdob2xlc2FsZSBmcm9tIHRoZSBwb2xpY3ksIGJ1dCBjbGFtcCB0aGUgZmVhdHVyZXMgaW4g
N1swXS5lYngKPj4+PiArICAgICAgICAgICAgICogcGVyIHVzdWFsLgo+Pj4+ICsgICAgICAgICAg
ICAgKi8KPj4+PiArICAgICAgICAgICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgJgo+
Pj4+ICsgICAgICAgICAgICAgICAgIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04p
ICkKPj4+PiArICAgICAgICAgICAgICAgIG1hc2sgPSAoKCh1aW50NjRfdClwLT5mZWF0Lm1heF9z
dWJsZWFmIDw8IDMyKSB8Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICgodWludDMyX3Qp
bWFzayB8IHAtPmZlYXQuXzdiMCkpOwo+Pj4gV2h5IGRvIHlvdSBzZXQgdGhlIGhpZ2ggYml0cyBv
ZiB0aGUgbWFzayAoNjM6MzApIHdpdGggdGhlIG1heCBzdWJsZWFmPwo+PiA2MzozMgo+Pgo+Pj4g
QWNjb3JkaW5nIHRvIHRoZSBkb2N1bWVudCBJIGhhdmUgYml0cyA2MzozMCBhcmUgcmVzZXJ2ZWQs
IGFuZCB0aGF0Cj4+PiBzZWVtcyB0byBtYXRjaCB0aGUgZXhwZWN0ZWQgQ1BVSUQgcmV0dXJuIHZh
bHVlLCB0aGF0IGxpc3RzIENQVUlECj4+PiBGbjAwMDBfMDAwN19FQVhfeDAgY29udGVudCBhcyBy
ZXNlcnZlZC4KPj4gWWVzLCBidXQgcmVzZXJ2ZWQgZG9lc24ndCBtZWFuICJ3aWxsICNHUCIuwqAg
QXMgSSBzYWlkIG9uIElSQywgdGhpcyBNU1IKPj4gKmlzKiB0aGUgdmFsdWUgd2hpY2ggZ2V0cyBm
b3J3YXJkZWQgaW50byBhIENQVUlEIGludm9jYXRpb24sIGFuZCBzZXR0aW5nCj4+IG1heF9zdWJs
ZWFmIHRvIDB4ZGVhZCBkb2VzIHdvcmsgZmluZS4KPj4KPj4gVGhlIHBvaW50IGhlcmUgaXMgdGhh
dCBpbiB0aGUgZnV0dXJlLCBvbiBoYXJkd2FyZSBjYXBhYmxlIG9mCj4+IG1heF9zdWJsZWFmPTIg
YW5kIGJlaW5nIGxldmVsbGVkIHRvIG1heF9zdWJsZWFmPTEsIHRoZSB2YWx1ZSBvYnNlcnZlZCBp
bgo+PiBDUFVJRCBzaG91bGQgYmUgMSwgbm90IDAuCj4gT2gsIGFuZCB0aGF0J3MgZnJvbSBJbnRl
bCBzcGVjaWZpY2F0aW9uIHdoaWNoIGRvZXMgaW5kZWVkIGxpc3QKPiBGbjAwMDBfMDAwN19FQVhf
eDAgYXMgcmV0dXJuaW5nIHRoZSBtYXggc3ViLWxlYWYsIGFuZCB0aGUgZXhwZWN0YXRpb24KPiBp
cyB0aGF0IEFNRCB3aWxsIGZvbGxvdyBzdWl0LgoKVGhlIEFNRCBDUFVJRCBkb2N1bWVudGF0aW9u
IGRvZXMgaWRlbnRpZnkgQ1BVSUQgN1swXS5lYXggYXMKbWF4X3N1YmxlYWYuwqAgSXQganVzdCBp
c24ndCBjcm9zcyByZWZlcmVuY2VkIHZlcnkgd2VsbCB3aXRoIHRoZSBNU1IuCgo+Cj4+IFRoZSBs
YXR0ZXIgaXMgd2hhdCB0aGUgY3VycmVudCBsb2dpYyBkb2VzLCBhbmQgaXMgYnJva2VuLsKgIFRo
ZSBDUFVJRAo+PiBkZXJpdmF0aW9uIGxvZ2ljIHdpbGwgZW5zdXJlIHRoYXQgcG9saWN5IG1heF9z
dWJsZWFmIDw9IGhhcmR3YXJlCj4+IG1heF9zdWJsZWFmLgo+IFJldmlld2VkLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2lydHJpeC5jb20+CgpUaGFua3MsCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
