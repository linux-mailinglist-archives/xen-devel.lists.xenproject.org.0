Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97DB157CD2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 14:52:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j19SF-0001m5-BP; Mon, 10 Feb 2020 13:50:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qaH/=36=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j19SD-0001m0-R2
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 13:50:25 +0000
X-Inumbo-ID: 49077ecf-4c0c-11ea-b4c3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49077ecf-4c0c-11ea-b4c3-12813bfff9fa;
 Mon, 10 Feb 2020 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581342624;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=8FMr2v71Fa8onRvpzbRbXLiDIrREl7MO3ilf3toLGP0=;
 b=Q2ou36oYpQNU1MqBSkkmYJyMi/iNs8kRKoj5SBbgz7z9RBNmSHEXmHQF
 FU017gNzYSo9wj/2fLOlL9E9lKSrf7XzoSme822ugm7TV2zC2Zv5Pstc5
 ASLhycYAnjnfc5SiEAi87VJn0L9+qjuVBqoasw4/cxGRcgpF07QbvJSgr c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Z4+WI/xxHUGE78LTUcAAbbi0Y20n85tpp7RyfGYuf6YKb0NFZzljl3f0rcJOw7wBvkR+8l/BSL
 jfsmw4/KQpQ6VmO1XqzDTzvUgFWc6T1kBtoWjunUT0A+g+B3q5wUTG5B4WlSBA1Lp1PMLSS1is
 AKsZ8F1ZDWg+or+mx+LgQf+37hYZSy61maOuGZw5CqU+zHPTf6sRzqx5yCnreX7mfxRWfe1BpF
 UVc7Bt8KjZpLF098INpF1nIv9cRARA9r1+QokGLbDEuTF+MGHXasGSUjWvxuDV0vKzb2+aWl2e
 2Oo=
X-SBRS: 2.7
X-MesageID: 12573367
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12573367"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
 <0d4b021c-04b4-11e6-aa48-ce0e72d60824@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <39df081a-cbbc-a0fd-6cca-ec474a0345dd@citrix.com>
Date: Mon, 10 Feb 2020 13:50:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0d4b021c-04b4-11e6-aa48-ce0e72d60824@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/3] AMD/IOMMU: fix off-by-one in
 amd_iommu_get_paging_mode() callers
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDIvMjAyMCAwOTo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gYW1kX2lvbW11X2dldF9w
YWdpbmdfbW9kZSgpIGV4cGVjdHMgYSBjb3VudCwgbm90IGEgIm1heGltdW0gcG9zc2libGUiCj4g
dmFsdWUuIFByaW9yIHRvIGI0ZjA0MjIzNmFlMCBkcm9wcGluZyB0aGUgcmVmZXJlbmNlLCB0aGUg
dXNlIG9mIG91ciBtaXMtCj4gbmFtZWQgIm1heF9wYWdlIiBpbiBhbWRfaW9tbXVfZG9tYWluX2lu
aXQoKSBtYXkgaGF2ZSBsZWFkIHRvIHN1Y2ggYQo+IG1pc3VuZGVyc3RhbmRpbmcuCj4KPiBBbHNv
IHJlcGxhY2UgYSBsaXRlcmFsIDQgYnkgYW4gZXhwcmVzc2lvbiB0eWluZyBpdCB0byBhIHdpZGVy
IHVzZQo+IGNvbnN0YW50LCBqdXN0IGxpa2UgYW1kX2lvbW11X3F1YXJhbnRpbmVfaW5pdCgpIGRv
ZXMuCj4KPiBGaXhlczogZWEzODg2NzgzMWRhICgieDg2IC8gaW9tbXU6IHNldCB1cCBhIHNjcmF0
Y2ggcGFnZSBpbiB0aGUgcXVhcmFudGluZSBkb21haW4iKQo+IEZpeGVzOiBiNGYwNDIyMzZhZTAg
KCJBTUQvSU9NTVU6IENlYXNlIHVzaW5nIGEgZHluYW1pYyBoZWlnaHQgZm9yIHRoZSBJT01NVSBw
YWdldGFibGVzIikKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4gLS0tCj4gTm90ZTogSSdtIG5vdCBhdCB0aGUgc2FtZSB0aW1lIGFkZGluZyBlcnJvciBj
aGVja2luZyBoZXJlLCBkZXNwaXRlCj4gICAgICAgYW1kX2lvbW11X2dldF9wYWdpbmdfbW9kZSgp
IHBvc3NpYmx5IHJldHVybmluZyBvbmUsIGFzIEkgdGhpbmsKPiAgICAgICB0aGF0J3MgYSBzdWZm
aWNpZW50bHkgb3J0aG9nb25hbCBhc3BlY3QuCgpJdCBpcyBlbnRpcmVseSBub24tb2J2aW91cyB3
aGF0IGFtZF9pb21tdV9nZXRfcGFnaW5nX21vZGUoKSB0YWtlcywgd2hpY2gKaXMgcHJlc3VtYWJs
eSB3aGF0IGhhcyBsZWQgdG8gdGhpcyBjb25mdXNpb24uCgpJdCBhbHNvIHNlZW1zIHNpbGx5IHRv
IGZvcmNlIGEgY2FsbCBpbnRvIGFub3RoZXIgdHJhbnNsYXRpb24gdW5pdCB3aGVuCjIvMyBvZiB0
aGUgY2FsbGVycyBjYW4gYmUgZXZhbHVhdGVkIGF0IGNvbXBpbGUgdGltZS4KCkhvdyBhYm91dCBy
ZS1pbXBsZW1lbnRpbmcgYW1kX2lvbW11X2dldF9wYWdpbmdfbW9kZSgpIGFzIGEgc3RhdGljIGlu
bGluZQooc2VlaW5nIGFzIGl0IGlzIGp1c3QgYmFzaWMgYXJpdGhtZXRpYyksIGFuZCBuYW1pbmcg
aXRzIHBhcmFtZXRlciBpbiBhCm1vcmUgdXNlZnVsLCBlLmcuIG1heF9mcmFtZXMgPwoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
