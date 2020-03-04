Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0660F1796C7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 18:34:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Xrc-0007EP-P3; Wed, 04 Mar 2020 17:31:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OYBR=4V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j9Xrb-0007EG-Jn
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 17:31:19 +0000
X-Inumbo-ID: f45c52d5-5e3d-11ea-a44f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f45c52d5-5e3d-11ea-a44f-12813bfff9fa;
 Wed, 04 Mar 2020 17:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583343078;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cGa5CuVa5DCMOHXm9TT5/bOva42InYxUza8AGUXaUeU=;
 b=YgALKzVXcwwS+m2px5RclWnSiBaZ2ni20NhjJxHSURiAQWJeEZrXfNke
 UiKIv2AzOuJcuSC5jd4pUUQTTAR2hhs2OWuXE0nWFoRR4xT/Pvzk61F7B
 P/UvBJQwE+LKSM68s0wxuu5/HiJ38wesB0WxuFdtYGmIEbbVKhuxpF6g2 Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qRS5hkbL2mW4NhxYZFVe1FRKRwt+4k+IPTXXCAcAHs1L9l+pEbB+sRPAPvqsGPrX1Jsx4ZU51d
 CTPMVEHRQCaLfadH9VYZSsVTmJb0WN9GrtZj1Uer34tcRaZ+CJOyhb8T9hCSxTBCkGDbRLV331
 KkqEbcpZzXNptznmIwXQCQG6ciXxRRH/ZtfgkgWvcfyCkL4hORnRw/4eABhavs5gEuayL0ciFU
 xBVWnVk9E4chl5bSZO30T93oyzOWLHcyQgbtb8PlIjChnribdFqZxrA9wKJMED5A4zGVJfsgnG
 q2I=
X-SBRS: 2.7
X-MesageID: 13392423
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,514,1574139600"; d="scan'208";a="13392423"
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20200303182447.15469-1-andrew.cooper3@citrix.com>
 <6d1760847aaf400fb4b88481f5bd2582@EX13D32EUC003.ant.amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c387de19-b521-1ff8-64c7-9d46f315b0e8@citrix.com>
Date: Wed, 4 Mar 2020 17:31:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6d1760847aaf400fb4b88481f5bd2582@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/cpuid: Untangle Invariant TSC handling
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDMvMjAyMCAwOTozMywgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEFuZHJldyBDb29wZXIKPj4gU2VudDogMDMg
TWFyY2ggMjAyMCAxODoyNQo+PiBUbzogWGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT47
Cj4+IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgSWFuIEphY2tz
b24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpCj4+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENIXSB4ODYvY3B1aWQ6
IFVudGFuZ2xlIEludmFyaWFudCBUU0MgaGFuZGxpbmcKPj4KPj4gSVRTQyBiZWluZyB2aXNpYmxl
IHRvIHRoZSBndWVzdCBpcyBjdXJyZW50bHkgaW1wbGljaXQgd2l0aCB0aGUgdG9vbHN0YWNrCj4+
IHVuY29uZGl0aW9uYWxseSBhc2tpbmcgZm9yIGl0LCBhbmQgWGVuIGNsaXBwaW5nIGl0IGJhc2Vk
IG9uIHRoZSB2VFNDIGFuZC9vcgo+PiBYRU5fRE9NQ1RMX2Rpc2FibGVfbWlncmF0ZSBzZXR0aW5n
cy4KPj4KPj4gVGhpcyBpcyBwcm9ibGVtYXRpYyBmb3Igc2V2ZXJhbCByZWFzb25zLgo+Pgo+PiBG
aXJzdCwgdGhlIGltcGxpY2l0IHZUU0MgYmVoYXZpb3VyIG1hbmlmZXN0cyBhcyBhIHJlYWwgYnVn
IG9uIG1pZ3JhdGlvbiB0byBhCj4+IGhvc3Qgd2l0aCBhIGRpZmZlcmVudCBmcmVxdWVuY3ksIHdp
dGggSVRTQyBidXQgd2l0aG91dCBUU0Mgc2NhbGluZwo+PiBjYXBhYmlsaXRpZXMsIHdoZXJlYnkg
dGhlIElUU0MgZmVhdHVyZSBiZWNvbWVzIGFkdmVydGlzZWQgdG8gdGhlIGd1ZXN0LiAgSVRTQwo+
PiB3aWxsIGRpc2FwcGVhciBhZ2FpbiBpZiB0aGUgZ3Vlc3QgbWlncmF0ZXMgdG8gc2VydmVyIHdp
dGggdGhlIHNhbWUgZnJlcXVlbmN5Cj4+IGFzIHRoZSBvcmlnaW5hbCwgb3IgdG8gb25lIHdpdGgg
VFNDIHNjYWxpbmcgc3VwcG9ydC4KPj4KPj4gU2Vjb25kbHksIGRpc2FsbG93aW5nIElUU0MgdW5s
ZXNzIHRoZSBndWVzdCBkb2Vzbid0IG1pZ3JhdGUgaXMgY29uY2VwdHVhbGx5Cj4+IHdyb25nLiAg
SXQgaXMgY29tbW9uIHRvIGhhdmUgbWlncmF0aW9uIHBvb2xzIG9mIGlkZW50aWNhbCBoYXJkd2Fy
ZSwgYXQgd2hpY2gKPj4gcG9pbnQgdGhlIFRTQyBmcmVxdWVuY3kgaXMgdGhlIHNhbWUsIGFuZCBt
b3JlIG1vZGVybiBoYXJkd2FyZSBoYXMgVFNDIHNjYWxpbmcKPj4gc3VwcG9ydCBhbnl3YXkuICBJ
biBib3RoIGNhc2VzLCBpdCBpcyBzYWZlIHRvIGFkdmVydGlzZSBJVFNDIGFuZCBtaWdyYXRlIHRo
ZQo+PiBndWVzdC4KPj4KPj4gUmVtb3ZlIGFsbCBpbXBsaWNpdCBsb2dpYyBsb2dpYyBpbiBYZW4s
IGFuZCBtYWtlIElUU0MgcGFydCBvZiB0aGUgbWF4IENQVUlECj4gT25lIHRvbyBtYW55ICdsb2dp
YydzIHRoZXJlLgoKT29wcy4KCj4KPj4gcG9saWNpZXMgZm9yIGd1ZXN0cy4gIFBsdW1iIGFuIGl0
c2MgcGFyYW1ldGVyIGludG8geGNfY3B1aWRfYXBwbHlfcG9saWN5KCkgYW5kCj4+IGhhdmUgbGli
eGxfX2NwdWlkX2xlZ2FjeSgpIGZpbGwgaW4gdGhlIHR3byBjYXNlcyB3aGVyZSBpdCBjYW4gcmVh
c29uYWJseQo+PiBleHBlY3QgSVRTQyB0byBiZSBzYWZlIGZvciB0aGUgZ3Vlc3QgdG8gc2VlLgo+
Pgo+PiBUaGlzIGlzIGEgYmVoYXZpb3VyIGNoYW5nZSBmb3IgVFNDX01PREVfTkFUSVZFLCB3aGVy
ZSB0aGUgSVRTQyB3aWxsIG5vdwo+PiByZWxpYWJseSBub3QgYXBwZWFyLCBhbmQgZm9yIHRoZSBj
YXNlIHdoZXJlIHRoZSB1c2VyIGV4cGxpY2l0bHkgcmVxdWVzdHMgSVRTQywKPj4gaW4gd2hpY2gg
Y2FzZSBpdCB3aWxsIGFwcGVhciBldmVuIGlmIHRoZSBndWVzdCBpc24ndCBtYXJrZWQgYXMgbm9t
aWdyYXRlLgo+Pgo+IERvZXMgdGhpcyBtZWFuIGEgZ3Vlc3QgdGhhdCB3b3VsZCBoYXZlIHNlZW4g
SVRTQyBvbiA0LjEzIG1heSBub3cgbm8gbG9uZ2VyIHNlZSBpdCBpbiA0LjE0IG9yIGlzIHRoZSBU
U0NfTU9ERV9OQVRJVkUgY2FzZSBqdXN0IHRoZSBvbmUgd2hlcmUgdGhlIGZlYXR1cmUgbWF5IGVy
cm9uZW91c2x5IGFwcGVhciBhZnRlciBtaWdyYXRpb24/CgpJbiBnZW5lcmFsLCBndWVzdHMgZG9u
J3QgZ2V0IHRvIHNlZSBJVFNDIGF0IGFsbCwgZXZlbiBiZWZvcmUgdGhpcwpjaGFuZ2UuwqAgVGhp
cyBpcyBzb21ldGhpbmcgd2hpY2ggbmVlZHMgd29ya2luZyBvbiwgYnV0IGl0IGlzIG9ubHkgYQp0
cmFjdGFibGUgcHJvYmxlbSBpbiBhIG11bHRpLWhvc3QgdG9vbHN0YWNrLgoKQWZ0ZXIgdGhpcyBj
aGFuZ2UsIHRoZSBUU0NfTU9ERV9OQVRJVkUgY2FzZSB3aWxsIG5vdyBub3Qgc2VlIGEKbWV0YXN0
YWJsZSBJVFNDIGZlYXR1cmUgZGVwZW5kaW5nIG9uIHRoZSBwcm9wZXJ0aWVzIG9mIHRoZSBob3N0
IGl0CmhhcHBlbnMgdG8gYmUgb24uwqAgSXQgd2lsbCBkZWZhdWx0IHRvIGNvbnNpc3RlbnRseSAw
LCB1bmxlc3Mgb3ZlcnJpZGRlbgpieSB0aGUgdG9vbHN0YWNrLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
