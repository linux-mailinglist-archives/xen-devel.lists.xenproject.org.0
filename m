Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED510107EBC
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 15:14:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYW8G-0004qY-U8; Sat, 23 Nov 2019 14:11:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UH0S=ZP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iYW8F-0004qS-0E
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 14:11:27 +0000
X-Inumbo-ID: 2289eeb6-0dfb-11ea-a37a-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2289eeb6-0dfb-11ea-a37a-12813bfff9fa;
 Sat, 23 Nov 2019 14:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574518286;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pa4/m7KnZP9HlgS2IzSHk8JevwKkEMNb591BUEd5zKI=;
 b=G7pzB9cvWWOht5O7YIRJcUTlTPNyFJCoqXL2XjWffhPzWMzWR0PQNtGX
 Rs3rzEKUm6xKKA+vROnN3FT+LQ8FPpnGjAwgkvOMQL7pX9Y6JTDB7gMsy
 OlFOwu5ejLGz5dotSEbbBZMa/O6IO7+/Ev1vF55UeR3wY8ad4u+ff8StT 0=;
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
IronPort-SDR: T6B9Kn6RBYu2AvOX7UGT0nkAO5puisAsVK6d6f0fbieUl71kxC/ivYtFYQSxQgy31z5Qv1Xtlm
 4yNQcP55I1THIJAKFulrnZkl+Hc04cKa67yUym12l94PKiT16BEVLd8b+aLvdZZGzxi5HcKQ+s
 ucBWnJQmocE9LJ6mYp6/21ou5S+Tt/owdort4qj+AdXd3ByD3/fhre0p2Qh7AnjcXzEIqpWDBQ
 vpGX/vIjnNcwIElckVJx4p5qWWB06BktMw0T7H4IzitsrngOS0ouSciqL0bcVzGBJXSOGspZYD
 jwg=
X-SBRS: 2.7
X-MesageID: 8866970
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,233,1571716800"; 
   d="scan'208";a="8866970"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20191122175400.4001-1-andrew.cooper3@citrix.com>
 <a1fb12bd-6b4a-03d2-1684-b3c965ea7ec5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ef5849ac-ff11-5507-7321-ebab5602b209@citrix.com>
Date: Sat, 23 Nov 2019 14:11:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a1fb12bd-6b4a-03d2-1684-b3c965ea7ec5@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vvmx: Fix livelock with
 XSA-304 fix
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMTEvMjAxOSAwNTo1NiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMi4xMS4xOSAx
ODo1NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gSXQgdHVybnMgb3V0IHRoYXQgdGhlIFhTQS0z
MDQgLyBDVkUtMjAxOC0xMjIwNyBmaXggb2YgZGlzYWJsaW5nCj4+IGV4ZWN1dGFibGUKPj4gc3Vw
ZXJwYWdlcyBkb2Vzbid0IHdvcmsgd2VsbCB3aXRoIHRoZSBuZXN0ZWQgcDJtIGNvZGUuCj4+Cj4+
IE5lc3RlZCB2aXJ0IGlzIGV4cGVyaW1lbnRhbCBhbmQgbm90IHNlY3VyaXR5IHN1cHBvcnRlZCwg
YnV0IGlzIHVzZWZ1bAo+PiBmb3IKPj4gZGV2ZWxvcG1lbnQgcHVycG9zZXMuwqAgSW4gb3JkZXIg
dG8gbm90IHJlZ3Jlc3MgdGhlIHN0YXR1cyBxdW8sCj4+IGRpc2FibGUgdGhlCj4+IFhTQS0zMDQg
d29ya2Fyb3VuZCB1bnRpbCB0aGUgbmVzdGVkIHAybSBjb2RlIGNhbiBiZSBpbXByb3ZlZC4KPj4K
Pj4gSW50cm9kdWNlIGEgcGVyLWRvbWFpbiBleGVjX3NwIGNvbnRyb2wgYW5kIHNldCBpdCBiYXNl
ZCBvbiB0aGUgY3VycmVudAo+PiBvcHRfZXB0X2V4ZWNfc3Agc2V0dGluZy7CoCBUYWtlIHRoZSBv
cHBvdHVuaXR5IHRvIG9taXQgYSBQVkggaGFyZHdhcmUKPj4gZG9tYWluCj4+IGZyb20gdGhlIHBl
cmZvcm1hbmNlIGhpdCwgYmVjYXVzZSBpdCBpcyBhbHJlYWR5IHBlcm1pdHRlZCB0byBEb1MgdGhl
Cj4+IHN5c3RlbSBpbgo+PiBzdWNoIHdheXMgYXMgaXNzdWluZyBhIHJlYm9vdC4KPj4KPj4gV2hl
biBuZXN0ZWQgdmlydCBpcyBlbmFibGVkIG9uIGEgZG9tYWluLCBmb3JjZSBpdCB0byB1c2luZyBl
eGVjdXRhYmxlCj4+IHN1cGVycGFnZXMgYW5kIHJlYnVpbGQgdGhlIHAybS4KPj4KPj4gSGF2aW5n
IHRoZSBzZXR0aW5nIHBlci1kb21haW4gaW52b2x2ZXMgcmVhcnJhbmdpbmcgdGhlIGludGVybmFs
cyBvZgo+PiBwYXJzZV9lcHRfcGFyYW1fcnVudGltZSgpIGJ1dCBpdCBzdGlsbCByZXRhaW5zIHRo
ZSBzYW1lIG92ZXJhbGwKPj4gc2VtYW50aWNzIC0KPj4gZm9yIGVhY2ggYXBwbGljYWJsZSBkb21h
aW4gd2hvc2Ugc2V0dGluZyBuZWVkcyB0byBjaGFuZ2UsIHJlYnVpbGQgdGhlCj4+IHAybS4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPgo+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
ClRoYW5rcy7CoCBJJ3ZlIHB1c2hlZCB0aGlzIHRvIHN0YWdpbmcgdG8gaG9wZWZ1bGx5IHVuYmxv
Y2sgT1NTVGVzdCBmb3IKUkMzLsKgIEFueSBmdXJ0aGVyIGRlbHRhIHRvIHRoaXMgcGF0Y2ggY2Fu
IGJlIGRvbmUgaW5jcmVtZW50YWxseS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
