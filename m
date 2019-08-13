Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4008BA6C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 15:36:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxWtp-0004KJ-Pu; Tue, 13 Aug 2019 13:31:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rFE=WJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxWto-0004KE-0i
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 13:31:40 +0000
X-Inumbo-ID: ac7784ee-bdce-11e9-ad88-afd50e07a8be
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac7784ee-bdce-11e9-ad88-afd50e07a8be;
 Tue, 13 Aug 2019 13:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565703097;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=iB0VbwYyiQ1al+Wt3Zzqc/5fRpqkiWCbcJaPXyhcb8E=;
 b=E0GwpWTzA5H3wOVrcejWp4RCWJtrQpv3qvgIjIdOUVeLND1gSY/JkaR1
 d6X5v9PAXHwiTDA6xQIpHeDcT+IBFJwFJ6J2ejM1Kz4d1sIugkClM5Ghs
 7UsRPqsLGpngJQVZzpI5KGNKU2bDXY3jE9wyqgC8wbEyY4esYAfRbDqko A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PwK8g4KRck2nvMcFpBOPGPRw+9pISZp/HstEHlA5uob5oNVt46Yyu2bm6Ljw5CuWuWGkTHGZk3
 Ep/okDQpALGeP3oQ9fNv/Z7vAaf57Uo3WNRyt11OzF5Di6uftD6S8Kw/XxNBIueFuOT43nnYt+
 0mUb1qXTTWhJEX3j1qOe1unvs6XYmTHAs9DfvrIUu4kdf71INQsAeBkDtwn8a1GuRVIOzC8B0E
 gfTMTZgBAkOZ6Z1p2HC/fY+0stGwMVGq+fSFtbTwWQKeWnAGsp3ptUM5SioRmEBnm0gdFUM2Fa
 7JM=
X-SBRS: 2.7
X-MesageID: 4246660
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4246660"
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
 <dbb536d7-7bfb-27fb-902e-0851434bda96@citrix.com>
 <a6f00518-f761-9362-6040-ee28c22cf334@eikelenboom.it>
 <070124d4-93b6-e0f5-ea69-bcac2b5da7e3@citrix.com>
 <d4fab4d9-f2d1-1c18-2582-1bd1283aa1cd@eikelenboom.it>
 <d0f9713d-0768-dca6-87b3-3d3d3d02207b@citrix.com>
 <90620f39-97bc-9528-0047-4b4584ca97b1@eikelenboom.it>
 <d8fc6365-525a-6495-e625-ecff2cf2e20e@citrix.com>
 <7a93257f-4199-8cae-57d4-a14555795275@eikelenboom.it>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ffa3eda9-73ac-6fc0-f886-8baa1c0e7968@citrix.com>
Date: Tue, 13 Aug 2019 14:31:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7a93257f-4199-8cae-57d4-a14555795275@eikelenboom.it>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Xen-unstable staging build broken by pvshim patches.
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

T24gMTMvMDgvMjAxOSAxMjo1MSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IE9uIDEzLzA4
LzIwMTkgMTM6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDA5LzA4LzIwMTkgMDA6Mjgs
IFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4+IE9uIDA5LzA4LzIwMTkgMDA6NDQsIEFuZHJl
dyBDb29wZXIgd3JvdGU6Cj4+Pj4gT24gMDgvMDgvMjAxOSAyMzozNCwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+Pj4+PiBPbiAwOC8wOC8yMDE5IDIzOjE0LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+Pj4gT24gMDgvMDgvMjAxOSAyMjoxNiwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+
Pj4+Pj4+IE9uIDA4LzA4LzIwMTkgMjM6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+Pj4+
IE9uIDA4LzA4LzIwMTkgMjE6NTksIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4+Pj4+Pj4+
IEhpIEFuZHJldywKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJdCBzZWVtcyB0aGUgcHZzaGltIHBhdGNo
ZXMgaW4geGVuLXVuc3RhYmxlIHN0YWdpbmcgYnJlYWsgdGhlIGJ1aWxkIG9uIG15IG1hY2hpbmUu
Cj4+Pj4+Pj4+PiBJIGNsb25lZCBhIGZyZXNoIHRyZWUgdG8gYmUgc3VyZSwgaGF2ZW4ndCBjaGVj
a2VkIHdoaWNoIG9mIHRoZSB0d28gY29tbWl0cyBjYXVzZXMgaXQ6Cj4+Pj4+Pj4+PiAwNjBmNGVl
ZTBmYjQwOGIzMTY1NDg3NzVhYjkyMWUxNmI3YWNkMGUwIG9yIDMyYjFkNjI4ODdkMDFmODVmMGMx
ZDJlMDEwM2Y2OWY3NGUxZjZmYTMKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiAtLQo+Pj4+Pj4+Pj4gU2Fu
ZGVyCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBbIC1kIC8vdXNyL2xv
Y2FsL2xpYi94ZW4vYm9vdCBdIHx8IC91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmly
bXdhcmUvLi4vLi4vdG9vbHMvY3Jvc3MtaW5zdGFsbCAtZCAtbTA3NTUgLXAgLy91c3IvbG9jYWwv
bGliL3hlbi9ib290Cj4+Pj4+Pj4+PiBbIC1kIC8vdXNyL2xvY2FsL2xpYi9kZWJ1Zy91c3IvbG9j
YWwvbGliL3hlbi9ib290IF0gfHwgL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scy9maXJt
d2FyZS8uLi8uLi90b29scy9jcm9zcy1pbnN0YWxsIC1kIC1tMDc1NSAtcCAvL3Vzci9sb2NhbC9s
aWIvZGVidWcvdXNyL2xvY2FsL2xpYi94ZW4vYm9vdAo+Pj4+Pj4+Pj4gWyAhIC1lIGh2bWxvYWRl
ci9odm1sb2FkZXIgXSB8fCAvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzL2Zpcm13YXJl
Ly4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLW0wNjQ0IC1wIGh2bWxvYWRlci9odm1sb2FkZXIg
Ly91c3IvbG9jYWwvbGliL3hlbi9ib290Cj4+Pj4+Pj4+PiAvdXNyL3NyYy9uZXcveGVuLXVuc3Rh
YmxlL3Rvb2xzL2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLW0wNjQ0IC1wIHNl
YWJpb3MtZGlyL291dC9iaW9zLmJpbiAvL3Vzci9sb2NhbC9saWIveGVuL2Jvb3Qvc2VhYmlvcy5i
aW4KPj4+Pj4+Pj4+IC91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4v
Li4vdG9vbHMvY3Jvc3MtaW5zdGFsbCAtbTA2NDQgLXAgeGVuLWRpci94ZW4tc2hpbSAvL3Vzci9s
b2NhbC9saWIveGVuL2Jvb3QveGVuLXNoaW0KPj4+Pj4+Pj4+IGluc3RhbGw6IGNhbm5vdCBzdGF0
ICd4ZW4tZGlyL3hlbi1zaGltJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+Pj4+Pj4+Pj4g
bWFrZVs0XTogKioqIFtNYWtlZmlsZTo1MjogaW5zdGFsbF0gRXJyb3IgMQo+Pj4+Pj4+Pj4gbWFr
ZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMv
ZmlybXdhcmUnCj4+Pj4+Pj4+PiBtYWtlWzNdOiAqKiogWy91c3Ivc3JjL25ldy94ZW4tdW5zdGFi
bGUvdG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6MjM3OiBzdWJkaXItaW5zdGFsbC1maXJtd2FyZV0g
RXJyb3IgMgo+Pj4+Pj4+Pj4gbWFrZVszXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL25l
dy94ZW4tdW5zdGFibGUvdG9vbHMnCj4+Pj4+Pj4+PiBtYWtlWzJdOiAqKiogWy91c3Ivc3JjL25l
dy94ZW4tdW5zdGFibGUvdG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6MjMyOiBzdWJkaXJzLWluc3Rh
bGxdIEVycm9yIDIKPj4+Pj4+Pj4+IG1ha2VbMl06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3Ny
Yy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzJwo+Pj4+Pj4+Pj4gbWFrZVsxXTogKioqIFtNYWtlZmls
ZTo3MzogaW5zdGFsbF0gRXJyb3IgMgo+Pj4+Pj4+Pj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3Rv
cnkgJy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMnCj4+Pj4+Pj4+PiBtYWtlOiAqKiog
W01ha2VmaWxlOjEzMTogaW5zdGFsbC10b29sc10gRXJyb3IgMgo+Pj4+Pj4+PiBUaGF0J3Mgd2Vp
cmQuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IERvIHlvdSBoYXZlIHRoZSBmdWxsIGxvZz/CoCBUaGUgcmVh
bCBmYWlsdXJlIHdhcyBzb21ld2hlcmUgZWFybGllciB3aGVyZQo+Pj4+Pj4+PiB4ZW4tc2hpbSBk
aWRuJ3QgZ2V0IHN0YXJ0ZWQuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IH5BbmRyZXcKPj4+Pj4+Pj4KPj4+
Pj4+PiBIbW0gaWYgZm9yZ290IGFuZCB0aHVzIGZvcmdvdCB0byBtZW50aW9uIG15IGJ1aWxkIHNj
cmlwdCBkaXNhYmxlcyBzb21lIHN0dWZmOgo+Pj4+Pj4+IC4vY29uZmlndXJlIC0tZGlzYWJsZS1x
ZW11LXRyYWRpdGlvbmFsIC0tZGlzYWJsZS1zdHViZG9tIC0tZGlzYWJsZS1kb2NzIC0tZGlzYWJs
ZS1yb21iaW9zCj4+Pj4+Pj4KPj4+Pj4+PiBDb3VsZCBiZSB0aGF0IG9uZSBvZiB0aG9zZSBkb2Vz
bid0IHdvcmsgYW55bW9yZS4KPj4+Pj4+IFRoZSBvbmx5IGludGVyZXN0aW5nIG9uZSB3b3VsZCBi
ZSAtLWRpc2FibGUtcm9tYmlvcywgd2hpY2ggZG9lcyBtYWtlCj4+Pj4+PiBjaGFuZ2VzIGluIHRo
aXMgYXJlYSBvZiB0aGUgYnVpbGQsIGJ1dCBldmVyeXRoaW5nIEkgY2hhbmdlZCB3YXMgaW5zaWRl
Cj4+Pj4+PiB0aGUgeGVuLWRpci8gZGlyZWN0b3J5IHNvIHNob3VsZG4ndCBpbnRlcmFjdC4+Cj4+
Pj4+PiB+QW5kcmV3Cj4+Pj4+Pgo+Pj4+PiBJdCBpbmRlZWQgc2VlbXMgdG8gYmUgc29tZSBpbnRl
cmFjdGlvbiB3aXRoIC0tZGlzYWJsZS1yb21iaW9zLCB3aXRoIGp1c3QKPj4+Pj4gYSBwbGFpbiAu
L2NvbmZpZ3VyZSBpdCBidWlsZHMgZmluZS4KPj4+Pj4gTG9ncyB3aGVuIGJ1aWxkaW5nIHdpdGgg
LS1kaXNhYmxlLXJvbWJpb3MgYXJlIGF0dGFjaGVkLgo+Pj4+IFJpZ2h0LsKgIFNvIHRoZSBidWls
ZCBpdHNlbGYgd29ya3MsIGJ1dCB0aGUgc3Vic2VxdWVudCBgbWFrZSBpbnN0YWxsYCBmYWlscy4K
Pj4+Pgo+Pj4+IEFuZCB0byBjb25maXJtLCBhIGJ1aWxkIG9mIDhkNTRhNmFkZiAodGhlIHBhcmVu
dCBvZiBteSBmaXJzdCBzaGltCj4+Pj4gY29tbWl0KSB3b3JrcyBlbnRpcmVseSBmaW5lPwo+Pj4+
Cj4+Pj4gfkFuZHJldwo+Pj4+Cj4+PiBKdXN0IHJlY2hlY2tlZCwgYW5kIHllcyB0aGF0IGJ1aWxk
cyBhbmQgaW5zdGFsbHMgZmluZSAod2l0aCAtLWRpc2FibGUtcm9tYmlvcykuCj4+IFdoaWNoIGJh
c2UgZGlzdHJvIGFyZSB5b3UgdXNpbmc/wqAgSSdtIHVuYWJsZSB0byByZXByb2R1Y2UgYW55IGJ1
aWxkCj4+IGZhaWx1cmVzIGxvY2FsbHkuCj4+Cj4+IH5BbmRyZXcKPj4KPiBEZWJpYW4gMTAgLyBC
dXN0ZXIuCgpEbyB5b3UgaGF2ZSB5b3VyIGZ1bGwgYnVpbGQgc2NyaXB0IGF2YWlsYWJsZSwgYW5k
IGlzIGl0IGJ1aWx0IGZ1bGx5IGZyb20KY2xlYW4/CgpIb3cgYmVlZnkgaXMgeW91ciBidWlsZCBt
YWNoaW5lP8KgIEZyb20gdGhlIGxvZ3MgaXQgaXMgY2xlYXJseSBhIHBhcmFsbGVsCmJ1aWxkIGJ1
dCBJIGRvbid0IHNlZSBhbiBleHBsaWNpdCAtaiBpbiB0aGUgbG9ncy4KCkkgc3RpbGwgY2FudCBy
ZXByb2R1Y2UgdGhpcywgZXZlbiBpbiBhIGJ1c3RlciBjb250YWluZXIuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
