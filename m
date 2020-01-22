Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F65145858
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 16:00:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHSE-0002Dv-0j; Wed, 22 Jan 2020 14:58:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zvfy=3L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iuHSD-0002Dq-5O
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:58:01 +0000
X-Inumbo-ID: 8fb6af78-3d27-11ea-b833-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fb6af78-3d27-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579705071;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZfuzzklZEQ0DxikLDQNc1WsHjfF+aXeF+qiiMi+JD/4=;
 b=PJJeHWwfBVqZzX10a+1xNdzbabd8v4KGLr0d9lJ5LHs9Z/Rzj4ZR+EU5
 wSg4mrmw3yPcALBcmJihpm3S4Ga65zb8OOxcPkPAJ+a6d5WHnPPIqxGOE
 xYJ3mLjGBXfAIfpiXmhoh1nxxKsOPp/FPzRFzLi6p0m5JEhOpEj6k75/t c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OvDAqE2uGn59R5jk7YcT1+SPsqyW9FlMJhKPNyl5ZrCHfGN/RvStEqxppwlofYyPAO2WqBYjaV
 Wax0Uf8U4XaKQs6J0G7G8XolcbPm/lbX1u9cltUHY5zqzI9QFKW6pgsJgZcRr+1zrcBasZLd7K
 SygN8PtuMQSo3J0jHZSuGvtOaH7+PYOA2pmvCbOh93DjbYJwf4jxtvPKYSo3Ut3IOsRTud5lyl
 J3HqIsYDUUKFmEEd4Os7pdLmp3Nb/eTCMn/eCGc/225PYgz4eWbtLZ8nmBRZ4Tagwqv1LMxVIj
 +pY=
X-SBRS: 2.7
X-MesageID: 11869725
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,350,1574139600"; d="scan'208";a="11869725"
To: Bobby Eshleman <bobbyeshleman@gmail.com>, <xen-devel@lists.xenproject.org>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
Date: Wed, 22 Jan 2020 14:57:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Bobby
 Eshleman <bobby.eshleman@starlab.io>, Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDEvMjAyMCAwMTo1OCwgQm9iYnkgRXNobGVtYW4gd3JvdGU6Cj4gSGV5IGV2ZXJ5Ym9k
eSwKPgo+IFRoaXMgaXMgYW4gUkZDIHBhdGNoc2V0IGZvciB0aGUgdmVyeSBiZWdpbm5pbmdzIG9m
IGFkZGluZyBSSVNDLVYgc3VwcG9ydAo+IHRvIFhlbi4gIFRoaXMgUkZDIGlzIHJlYWxseSBqdXN0
IHRvIHN0YXJ0IGEgZGlhbG9ndWUgYWJvdXQgc3VwcG9ydGluZwo+IFJJU0MtViBhbmQgYWxpZ24g
d2l0aCB0aGUgWGVuIHByb2plY3QgYW5kIGNvbW11bml0eSBiZWZvcmUgZ29pbmcKPiBmdXJ0aGVy
LiAgRm9yIHRoYXQgcmVhc29uLCBpdCBpcyB2ZXJ5IHJvdWdoIGFuZCB2ZXJ5IGluY29tcGxldGUu
IAo+Cj4gTXkgbmFtZSBpcyBCb2JieSBFc2hsZW1hbiwgSSdtIGEgc29mdHdhcmUgZW5naW5lZXIg
YXQKPiBTdGFyIExhYiAvIFdpbmQgUml2ZXIgb24gdGhlIEFSTSB0ZWFtLCBtb3N0bHkgaGF2aW5n
IHdvcmtlZCBpbiB0aGUgTGludXgKPiBrZXJuZWwuICBJJ3ZlIGFsc28gYmVlbiBpbnZvbHZlZCBh
IGdvb2QgYW1vdW50IHdpdGggWGVuIG9uIEFSTSBoZXJlLAo+IG1vc3RseSBkZWFsaW5nIHdpdGgg
dG9vbGluZywgZGVwbG95bWVudCwgYW5kIHRlc3RpbmcuICBBIGxvdCBvZiB0aGlzCj4gcGF0Y2hz
ZXQgaXMgaGVhdmlseSBpbnNwaXJlZCBieSB0aGUgWGVuL0FSTSBzb3VyY2UgY29kZSAocGFydGlj
dWxhcmx5Cj4gdGhlIGVhcmx5IHNldHVwIHVwIGNvZGUpLgo+Cj4gQ3VycmVudGx5LCB0aGlzIHBh
dGNoc2V0IHJlYWxseSBvbmx5IHNldHMgdXAgdmlydHVhbCBtZW1vcnkgZm9yIFhlbiBhbmQKPiBp
bml0aWFsaXplcyBVQVJUIHRvIGVuYWJsZSBwcmludCBvdXRwdXQuICBOb25lIG9mIFJJU0MtVidz
Cj4gdmlydHVhbGl6YXRpb24gc3VwcG9ydCBoYXMgYmVlbiBpbXBsZW1lbnRlZCB5ZXQsIGFsdGhv
dWdoIHRoYXQgaXMgdGhlCj4gbmV4dCByb2FkIHRvIHN0YXJ0IGdvaW5nIGRvd24uICBNYW55IGZ1
bmN0aW9ucyBvbmx5IGNvbnRhaW4gZHVtbXkKPiBpbXBsZW1lbnRhdGlvbnMuICBNYW55IHNob3J0
Y3V0cyBoYXZlIGJlZW4gdGFrZW4gYW5kIFRPRE8ncyBoYXZlIGJlZW4KPiBsZWZ0IGFjY29yZGlu
Z2x5LiAgSXQgaXMgdmVyeSwgdmVyeSByb3VnaC4gIEJlIGZvcmV3YXJuZWQ6IHlvdSBhcmUgcXVp
dGUKPiBsaWtlbHkgdG8gc2VlIHNvbWUgdW5nYWlubHkgY29kZSBoZXJlIChkZXNwaXRlIG15IGVm
Zm9ydHMgdG8gY2xlYW4gaXQgdXAKPiBiZWZvcmUgc2VuZGluZyB0aGlzIHBhdGNoc2V0IG91dCku
ICBNeSBpbnRlbnQgd2l0aCB0aGlzIFJGQyBpcyB0byBhbGlnbgo+IGVhcmx5IGFuZCBnYXVnZSBp
bnRlcmVzdCwgYXMgb3Bwb3NlZCB0byBwcmVzZW50aW5nIGEgdG90YWxseSBjb21wbGV0ZQo+IHBh
dGNoc2V0Lgo+Cj4gQmVjYXVzZSB0aGUgQVJNIGFuZCBSSVNDLVYgdXNlIGNhc2VzIHdpbGwgbGlr
ZWx5IGJlYXIgcmVzZW1ibGFuY2UsIHRoZQo+IFJJU0MtViBwb3J0IHNob3VsZCBwcm9iYWJseSBy
ZXNwZWN0IHRoZSBkZXNpZ24gY29uc2lkZXJhdGlvbnMgdGhhdCBoYXZlCj4gYmVlbiBsYWlkIG91
dCBhbmQgcmVzcGVjdGVkIGJ5IFhlbiBvbiBBUk0gZm9yIGRvbTBsZXNzLCBzYWZldHkKPiBjZXJ0
aWZpY2F0aW9uLCBldGMuLi4gIE15IGluY2xpbmF0aW9uIGhhcyBiZWVuIHRvIGluaXRpYWxseSB0
YXJnZXQgb3IKPiBwcmlvcml0aXplIGRvbTBsZXNzICh3aXRob3V0IGV4Y2x1ZGluZyBkb20wZnVs
bCkgYW5kIHVzZSB0aGUgQVJNCj4gZG9tMGxlc3MgaW1wbGVtZW50YXRpb24gYXMgYSBtb2RlbCB0
byBmb2xsb3cuICBJJ2QgbG92ZSBmZWVkYmFjayBvbiB0aGlzCj4gcG9pbnQgYW5kIG9uIGhvdyB0
aGUgWGVuIHByb2plY3QgbWlnaHQgZW52aXNpb24gYSBSSVNDLVYgaW1wbGVtZW50YXRpb24uCj4K
PiBUaGlzIHBhdGNoc2V0IGhhcyBfc29tZV8gY29kZSBmb3IgZnV0dXJlIHN1cHBvcnQgZm9yIDMy
LWJpdCwgYnV0Cj4gY3VycmVudGx5IG15IGZvY3VzIGlzIG9uIDY0LWJpdC4KPgo+IEFnYWluLCB0
aGlzIGlzIGEgdmVyeSwgdmVyeSByb3VnaCBhbmQgdG90YWxseSBpbmNvbXBsZXRlIHBhdGNoc2V0
LiAgTXkKPiBnb2FsIGhlcmUgaXMganVzdCB0byBnYXVnZSBjb21tdW5pdHkgaW50ZXJlc3QsIGJl
Z2luIGRpc2N1c3Npbmcgd2hhdCBYZW4KPiBvbiBSSVNDLVYgbWF5IGxvb2sgbGlrZSwgcmVjZWl2
ZSBmZWVkYmFjaywgYW5kIHNlZSBpZiBJJ20gaGVhZGluZyBpbiB0aGUKPiByaWdodCBkaXJlY3Rp
b24uCj4KPiBNeSBiaWcgcXVlc3Rpb25zIGFyZToKPiAJRG9lcyB0aGUgWGVuIHByb2plY3QgaGF2
ZSBpbnRlcmVzdCBpbiBSSVNDLVY/CgpUaGVyZSBpcyB2ZXJ5IGxhcmdlIGRvd25zdHJlYW0gaW50
ZXJlc3QgaW4gUklTQy1WLsKgIFNvIGEgZGVmaW5pdGUgeWVzLgoKPiAJV2hhdCBjYW4gYmUgZG9u
ZSB0byBtYWtlIHRoZSBSSVNDLVYgcG9ydCBhcyB1cHN0cmVhbWFibGUgYXMKPiAJCXBvc3NpYmxl
Pwo+IAlBbnkgbWFqb3IgcGl0ZmFsbHM/Cj4KPiBJdCB3b3VsZCBiZSBncmVhdCB0byBoZWFyIGFs
bCBvZiB5b3VyIGZlZWRiYWNrLgoKQm90aCBSSVNDLVYgYW5kIFBvd2VyOSBhcmUgZnJlcXVlbnRs
eSByZXF1ZXN0ZWQgdGhpbmdzLCBhbmQgYm90aCBzdWZmZXIKZnJvbSB0aGUgZmFjdCB0aGF0LCB3
aGlsZSB3ZSBhcyBhIGNvbW11bml0eSB3b3VsZCBsaWtlIHRoZW0sIHRoZQp1cHN0cmVhbSBpbnRl
cnNlY3Rpb24gb2YgInBlb3BsZSB3aG8ga25vdyBYZW4iIGFuZCAicGVvcGxlIHdobyBrbm93CmVu
b3VnaCBhcmNoICRYIHRvIGRvIGFuIGluaXRpYWwgcG9ydCIgaXMgMC4KClRoaXMgc2VyaWVzIGNs
ZWFybHkgZGVtb25zdHJhdGVzIGEgY2hhbmdlIGluIHRoZSBzdGF0dXMgcXVvLCBhbmQgSSB0aGlu
awphIGxvdCBvZiBwZW9wbGUgd2lsbCBiZSBoYXBweS4KClRvIGdldCBSSVNDLVYgdG8gYmVpbmcg
ZnVsbHkgc3VwcG9ydGVkLCB3ZSB3aWxsIHVsdGltYXRlbHkgbmVlZCB0byBnZXQKaGFyZHdhcmUg
aW50byB0aGUgQ0kgc3lzdGVtLCBhbmQgYW4gZWFzeSB3YXkgZm9yIGRldmVsb3BlcnMgdG8gdGVz
dApjaGFuZ2VzLsKgIERvIHlvdSBoYXZlIGFueSB0aG91Z2h0cyBvbiBwcm9kdWN0aW9uIFJJU0Mt
ViBoYXJkd2FyZQooaWRlYWxseSBzZXJ2ZXIgZm9ybSBmYWN0b3IpIGZvciB0aGUgQ0kgc3lzdGVt
LCBhbmQvb3IgZGV2IGJvYXJkcyB3aGljaAptaWdodCBiZSBhdmFpbGFibGUgZmFpcmx5IGNoZWFw
bHk/CgpIb3cgbXVjaCB0aW1lIGRvIHlvdSBoYXZlIHRvIHB1dCB0b3dhcmRzIHRoZSBwb3J0P8Kg
IElzIHRoaXMgc29tZXRoaW5nIGluCnlvdXIgZnJlZSB0aW1lLCBvciBzb21ldGhpbmcgeW91IGFy
ZSBkb2luZyBhcyBwYXJ0IG9mIHdvcms/wqAgVWx0aW1hdGVseSwKd2UgYXJlIGdvaW5nIHRvIG5l
ZWQgdG8gaW5jcmVhc2UgdGhlIGxldmVsIG9mIFJJU0MtViBrbm93bGVkZ2UgaW4gdGhlCmNvbW11
bml0eSB0byBtYWludGFpbiB0aGluZ3MgaW4gdGhlIGZ1dHVyZS4KCk90aGVyIHRoYW4gdGhhdCwg
dmVyeSBSRkMgc2VyaWVzIGFyZSBlbnRpcmVseSBmaW5lLsKgIEEgZ29vZCBmaXJzdCBzdGVwCndv
dWxkIGJlIHNpbXBseSB0byBnZXQgdGhlIGJ1aWxkIHdvcmtpbmcsIGFuZCBnZXQgc29tZSBraW5k
IG9mCmNyb3NzLWNvbXBpbGUgYnVpbGQgaW4gQ0ksIHRvIG1ha2Ugc3VyZSB0aGF0IHdlIGRvbid0
IGNsb2JiZXIgdGhlIFJJU0MtVgpidWlsZCB3aXRoIGNvbW1vbiBvciBvdGhlci1hcmNoIGNoYW5n
ZXMuCgpJIGhvcGUgdGhpcyBoZWxwcy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
