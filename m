Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D18A8B695
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 13:25:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxUsG-0005OZ-7l; Tue, 13 Aug 2019 11:21:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rFE=WJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxUsE-0005OU-Tp
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:21:54 +0000
X-Inumbo-ID: 8cb0d4bd-bdbc-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8cb0d4bd-bdbc-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 11:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565695313;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=HRLmpzIDGuf4gNe27KG2ddqt1Lt+4vuAYRJOdRayjkQ=;
 b=asr3m5QHwivWPdbuaDGjqkIrwBVnhualJSX36EvXa8E+aOAOxdcFXZyr
 4fW2iQ/XYJVdA15YlN2CGI/LKwRzPCQkFwtKAEdyhXjKkLHnfHP4vUJVN
 0V4xf5wv9huJ8s/PPiZlS4yb8YfLH1WQQLfvjIPyle447hI63I0cuGQQ3 k=;
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
IronPort-SDR: pGeOVZysL0vvCd2SL4gD0ND7tHYtuFaWld55kzWbsHOsq70EJ2/7q81YdDhzVhzELJEPZ81Rme
 rPqNXIVXlkGOrQKkTcH2n0gSfTUwoI8+Sg6y7N7i53Xry2ImPrWi6OIBGLdDgkzSevbTBWYbyn
 yTuMb9cX0PBuPukN3k9HrCspTfpvoXMeY5ovXZ0wI30ndKs5mGJxBbaXjXWmbxe1WkRVVmOd8a
 EZu6YENTEsXJYhgpbVDEyo0r8IpPTWeSP/haRWUXCONlmFuv5OCQJafK9hMBlX2ZD0eegYe/Zy
 M9Y=
X-SBRS: 2.7
X-MesageID: 4209836
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4209836"
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
 <dbb536d7-7bfb-27fb-902e-0851434bda96@citrix.com>
 <a6f00518-f761-9362-6040-ee28c22cf334@eikelenboom.it>
 <070124d4-93b6-e0f5-ea69-bcac2b5da7e3@citrix.com>
 <d4fab4d9-f2d1-1c18-2582-1bd1283aa1cd@eikelenboom.it>
 <d0f9713d-0768-dca6-87b3-3d3d3d02207b@citrix.com>
 <90620f39-97bc-9528-0047-4b4584ca97b1@eikelenboom.it>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d8fc6365-525a-6495-e625-ecff2cf2e20e@citrix.com>
Date: Tue, 13 Aug 2019 12:21:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <90620f39-97bc-9528-0047-4b4584ca97b1@eikelenboom.it>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [SUSPECTED SPAM]Xen-unstable staging build broken
 by pvshim patches.
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDgvMjAxOSAwMDoyOCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IE9uIDA5LzA4
LzIwMTkgMDA6NDQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDA4LzA4LzIwMTkgMjM6MzQs
IFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4+IE9uIDA4LzA4LzIwMTkgMjM6MTQsIEFuZHJl
dyBDb29wZXIgd3JvdGU6Cj4+Pj4gT24gMDgvMDgvMjAxOSAyMjoxNiwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+Pj4+PiBPbiAwOC8wOC8yMDE5IDIzOjA1LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+Pj4gT24gMDgvMDgvMjAxOSAyMTo1OSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+
Pj4+Pj4+IEhpIEFuZHJldywKPj4+Pj4+Pgo+Pj4+Pj4+IEl0IHNlZW1zIHRoZSBwdnNoaW0gcGF0
Y2hlcyBpbiB4ZW4tdW5zdGFibGUgc3RhZ2luZyBicmVhayB0aGUgYnVpbGQgb24gbXkgbWFjaGlu
ZS4KPj4+Pj4+PiBJIGNsb25lZCBhIGZyZXNoIHRyZWUgdG8gYmUgc3VyZSwgaGF2ZW4ndCBjaGVj
a2VkIHdoaWNoIG9mIHRoZSB0d28gY29tbWl0cyBjYXVzZXMgaXQ6Cj4+Pj4+Pj4gMDYwZjRlZWUw
ZmI0MDhiMzE2NTQ4Nzc1YWI5MjFlMTZiN2FjZDBlMCBvciAzMmIxZDYyODg3ZDAxZjg1ZjBjMWQy
ZTAxMDNmNjlmNzRlMWY2ZmEzCj4+Pj4+Pj4KPj4+Pj4+PiAtLQo+Pj4+Pj4+IFNhbmRlcgo+Pj4+
Pj4+Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IFsgLWQgLy91c3IvbG9jYWwvbGliL3hlbi9ib290
IF0gfHwgL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scy9maXJtd2FyZS8uLi8uLi90b29s
cy9jcm9zcy1pbnN0YWxsIC1kIC1tMDc1NSAtcCAvL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QKPj4+
Pj4+PiBbIC1kIC8vdXNyL2xvY2FsL2xpYi9kZWJ1Zy91c3IvbG9jYWwvbGliL3hlbi9ib290IF0g
fHwgL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scy9maXJtd2FyZS8uLi8uLi90b29scy9j
cm9zcy1pbnN0YWxsIC1kIC1tMDc1NSAtcCAvL3Vzci9sb2NhbC9saWIvZGVidWcvdXNyL2xvY2Fs
L2xpYi94ZW4vYm9vdAo+Pj4+Pj4+IFsgISAtZSBodm1sb2FkZXIvaHZtbG9hZGVyIF0gfHwgL3Vz
ci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scy9maXJtd2FyZS8uLi8uLi90b29scy9jcm9zcy1p
bnN0YWxsIC1tMDY0NCAtcCBodm1sb2FkZXIvaHZtbG9hZGVyIC8vdXNyL2xvY2FsL2xpYi94ZW4v
Ym9vdAo+Pj4+Pj4+IC91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4v
Li4vdG9vbHMvY3Jvc3MtaW5zdGFsbCAtbTA2NDQgLXAgc2VhYmlvcy1kaXIvb3V0L2Jpb3MuYmlu
IC8vdXNyL2xvY2FsL2xpYi94ZW4vYm9vdC9zZWFiaW9zLmJpbgo+Pj4+Pj4+IC91c3Ivc3JjL25l
dy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4vLi4vdG9vbHMvY3Jvc3MtaW5zdGFsbCAt
bTA2NDQgLXAgeGVuLWRpci94ZW4tc2hpbSAvL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QveGVuLXNo
aW0KPj4+Pj4+PiBpbnN0YWxsOiBjYW5ub3Qgc3RhdCAneGVuLWRpci94ZW4tc2hpbSc6IE5vIHN1
Y2ggZmlsZSBvciBkaXJlY3RvcnkKPj4+Pj4+PiBtYWtlWzRdOiAqKiogW01ha2VmaWxlOjUyOiBp
bnN0YWxsXSBFcnJvciAxCj4+Pj4+Pj4gbWFrZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Iv
c3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUnCj4+Pj4+Pj4gbWFrZVszXTogKioq
IFsvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzLy4uL3Rvb2xzL1J1bGVzLm1rOjIzNzog
c3ViZGlyLWluc3RhbGwtZmlybXdhcmVdIEVycm9yIDIKPj4+Pj4+PiBtYWtlWzNdOiBMZWF2aW5n
IGRpcmVjdG9yeSAnL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scycKPj4+Pj4+PiBtYWtl
WzJdOiAqKiogWy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvLi4vdG9vbHMvUnVsZXMu
bWs6MjMyOiBzdWJkaXJzLWluc3RhbGxdIEVycm9yIDIKPj4+Pj4+PiBtYWtlWzJdOiBMZWF2aW5n
IGRpcmVjdG9yeSAnL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scycKPj4+Pj4+PiBtYWtl
WzFdOiAqKiogW01ha2VmaWxlOjczOiBpbnN0YWxsXSBFcnJvciAyCj4+Pj4+Pj4gbWFrZVsxXTog
TGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMnCj4+Pj4+
Pj4gbWFrZTogKioqIFtNYWtlZmlsZToxMzE6IGluc3RhbGwtdG9vbHNdIEVycm9yIDIKPj4+Pj4+
IFRoYXQncyB3ZWlyZC4KPj4+Pj4+Cj4+Pj4+PiBEbyB5b3UgaGF2ZSB0aGUgZnVsbCBsb2c/wqAg
VGhlIHJlYWwgZmFpbHVyZSB3YXMgc29tZXdoZXJlIGVhcmxpZXIgd2hlcmUKPj4+Pj4+IHhlbi1z
aGltIGRpZG4ndCBnZXQgc3RhcnRlZC4KPj4+Pj4+Cj4+Pj4+PiB+QW5kcmV3Cj4+Pj4+Pgo+Pj4+
PiBIbW0gaWYgZm9yZ290IGFuZCB0aHVzIGZvcmdvdCB0byBtZW50aW9uIG15IGJ1aWxkIHNjcmlw
dCBkaXNhYmxlcyBzb21lIHN0dWZmOgo+Pj4+PiAuL2NvbmZpZ3VyZSAtLWRpc2FibGUtcWVtdS10
cmFkaXRpb25hbCAtLWRpc2FibGUtc3R1YmRvbSAtLWRpc2FibGUtZG9jcyAtLWRpc2FibGUtcm9t
Ymlvcwo+Pj4+Pgo+Pj4+PiBDb3VsZCBiZSB0aGF0IG9uZSBvZiB0aG9zZSBkb2Vzbid0IHdvcmsg
YW55bW9yZS4KPj4+PiBUaGUgb25seSBpbnRlcmVzdGluZyBvbmUgd291bGQgYmUgLS1kaXNhYmxl
LXJvbWJpb3MsIHdoaWNoIGRvZXMgbWFrZQo+Pj4+IGNoYW5nZXMgaW4gdGhpcyBhcmVhIG9mIHRo
ZSBidWlsZCwgYnV0IGV2ZXJ5dGhpbmcgSSBjaGFuZ2VkIHdhcyBpbnNpZGUKPj4+PiB0aGUgeGVu
LWRpci8gZGlyZWN0b3J5IHNvIHNob3VsZG4ndCBpbnRlcmFjdC4+Cj4+Pj4gfkFuZHJldwo+Pj4+
Cj4+PiBJdCBpbmRlZWQgc2VlbXMgdG8gYmUgc29tZSBpbnRlcmFjdGlvbiB3aXRoIC0tZGlzYWJs
ZS1yb21iaW9zLCB3aXRoIGp1c3QKPj4+IGEgcGxhaW4gLi9jb25maWd1cmUgaXQgYnVpbGRzIGZp
bmUuCj4+PiBMb2dzIHdoZW4gYnVpbGRpbmcgd2l0aCAtLWRpc2FibGUtcm9tYmlvcyBhcmUgYXR0
YWNoZWQuCj4+IFJpZ2h0LsKgIFNvIHRoZSBidWlsZCBpdHNlbGYgd29ya3MsIGJ1dCB0aGUgc3Vi
c2VxdWVudCBgbWFrZSBpbnN0YWxsYCBmYWlscy4KPj4KPj4gQW5kIHRvIGNvbmZpcm0sIGEgYnVp
bGQgb2YgOGQ1NGE2YWRmICh0aGUgcGFyZW50IG9mIG15IGZpcnN0IHNoaW0KPj4gY29tbWl0KSB3
b3JrcyBlbnRpcmVseSBmaW5lPwo+Pgo+PiB+QW5kcmV3Cj4+Cj4gSnVzdCByZWNoZWNrZWQsIGFu
ZCB5ZXMgdGhhdCBidWlsZHMgYW5kIGluc3RhbGxzIGZpbmUgKHdpdGggLS1kaXNhYmxlLXJvbWJp
b3MpLgoKV2hpY2ggYmFzZSBkaXN0cm8gYXJlIHlvdSB1c2luZz/CoCBJJ20gdW5hYmxlIHRvIHJl
cHJvZHVjZSBhbnkgYnVpbGQKZmFpbHVyZXMgbG9jYWxseS4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
