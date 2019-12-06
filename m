Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A53381157FE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 20:53:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idJdf-0003FE-2I; Fri, 06 Dec 2019 19:51:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fkk7=Z4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1idJdd-0003F7-Ik
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 19:51:41 +0000
X-Inumbo-ID: d21a46e4-1861-11ea-b6f1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d21a46e4-1861-11ea-b6f1-bc764e2007e4;
 Fri, 06 Dec 2019 19:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575661901;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=UBiFjYyfpBR1Jcbh9D9yZm7/SL4hGvqBWXCLQHr+StY=;
 b=C1p+Vo/TpJl58HYm4PCSks0eF79srxM/Vl2pg8yt8BU815GaCjCXiZ+L
 aPw3c9qxGpj7d0cj6Ge5oG73oIFDUTvwcGU0VJzfmbTHp3pmoF8vzW4Nl
 0U8jj5j45CpMW5fGCPha/kaam3xZ/CSuPkjZIoRzQvb/uHDHs+tf574h0 Y=;
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
IronPort-SDR: ju9u2R2im16lkauXRyM4Crcf/3AuhKflXrJaO1tJfWHwgiNekGplenzGRDKpfHflBtUf952tjG
 qZ29h0NHxL2ML6LBU26kGG9XaNSQB5NSSmjdqIlc3qf2TUiHZrHafqeQxPc1v5I7VNI+TG+jbU
 6VIOrdr6ICa3EqKpTumfwfWnhvoMkRO4s0RmOx0unzDBgWZYa7rbPotkBvoP9D/6uX+okyyg+6
 m0H+P1jHve48zJBDERJYvsOFk4QnhNYZY3gq6gQVheOnb59OP/V9EdwvlgSgf//k5xAbphYs0U
 +VE=
X-SBRS: 2.7
X-MesageID: 9454762
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,285,1571716800"; 
   d="scan'208";a="9454762"
To: Jan Beulich <jbeulich@suse.com>
References: <57491ade-fa47-5e66-47ac-a5f79de84070@suse.com>
 <313f5f41-1572-aa0e-1112-d606ad5dee9c@suse.com>
 <355ec482-c6f7-4ec7-cefe-dbcc1bdf5f3f@citrix.com>
 <3f5f0679-758d-c1c9-0beb-681a7495c44c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d7ce8632-a47e-d437-b01e-1143f76ceeb3@citrix.com>
Date: Fri, 6 Dec 2019 19:51:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3f5f0679-758d-c1c9-0beb-681a7495c44c@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/3] x86: relax GDT check in
 arch_set_info_guest()
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

T24gMDYvMTIvMjAxOSAxMTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYuMTIuMjAxOSAx
MToyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDYvMTIvMjAxOSAxMDoxNCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBJdCBpcyB3cm9uZyBmb3IgdXMgdG8gY2hlY2sgZnJhbWVzIGJleW9u
ZCB0aGUgZ3Vlc3Qgc3BlY2lmaWVkIGxpbWl0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gSSBkb24ndCBjb21wbGV0ZWx5IGFncmVlLsKg
IFRoZSBjb2RlIGhhcyBiZWVuIGxpa2UgdGhpcyBzaW5jZSBpdCB3YXMKPj4gaW50cm9kdWNlZCwg
YW5kIGlzIHVzZWQgdG8gY2hlY2sgZGF0YSBmcm9tIHRoZSBkb21haW4gYnVpbGRlciAoaW5jCj4+
IG1pZ3JhdGlvbiksIGFuZCBmcm9tIHRoZSBndWVzdHMuCj4+Cj4+IEF0IHRoZSBtb21lbnQsIGV2
ZXJ5IGNhbGxlciBpcyByZXF1aXJlZCBub3QgdG8gcGFzcyBqdW5rIGluIHVudXNlZAo+PiBmcmFt
ZXMsIGFuZCBJIGRvbid0IHNlZSBhbiBpc3N1ZSB3aXRoIGtlZXBpbmcgdGhpcyBiZWhhdmlvdXIu
Cj4gS2VlcGluZyB0aGUgYmVoYXZpb3IgaXNuJ3QgZ29pbmcgdG8gYnJlYWsgYW55dGhpbmcsIHll
cywgYnV0IGl0Cj4gc2hvdWxkbid0IGhhdmUgYmVlbiB0aGlzIHdheSB0byBiZWdpbiB3aXRoLiBJ
IHNpbXBseSBkb24ndCBzZWUKPiB0aGUgdmFsdWUgb2YgdmFsaWRhdGluZyBkYXRhIHdlJ3JlIG5v
dCBjb25zdW1pbmcgYW55d2F5LiBQZXJoYXBzCj4gSSBjb3VsZCBzYXkgIm5vdCBoZWxwZnVsIiBv
ciAicG9pbnRsZXNzIiBpbnN0ZWFkIG9mICJ3cm9uZyIgLi4uCgpCdXQgaW4gb3RoZXIgY2FzZXMg
d2UgZ28gb3V0IG9mIG91ciB3YXkgdG8gY2hlY2sgcGFyYW1ldGVycyAoZXNwZWNpYWxseQpyZXNl
cnZlZCBmaWVsZHMpIGV2ZW4gd2hlbiB0aGV5IGFyZW4ndCBwcmVzZW50bHkgY29uc3VtZWQuCgpp
LmUuIHdoYXQgZG8gd2UgZ2FpbiAob3RoZXIgdGhhbiBtb3JlIGNvbXBsaWNhdGVkIGNvZGUpIGJ5
IHJlbGF4aW5nIGEKcmVzdHJpY3Rpb24gd2Uga25vdyBpcyBvYmV5ZWQgYnkgZXZlcnkgY2FsbGVy
PwoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
