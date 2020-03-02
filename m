Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C8F1759B6
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 12:47:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8jVt-0007rM-PC; Mon, 02 Mar 2020 11:45:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xgCB=4T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j8jVr-0007rH-RC
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 11:45:31 +0000
X-Inumbo-ID: 514a1298-5c7b-11ea-932e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 514a1298-5c7b-11ea-932e-bc764e2007e4;
 Mon, 02 Mar 2020 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583149531;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=JDUI9ABAKBeHlXThdb0xlzA02/wzSwoBRXPZ6XPUycY=;
 b=Bg+LE+0H0Ho5TOyjXmfTj2vdz2+xwyVtvnhCGLTKqqzUoST9wb8zG8P1
 kc3RbmRPG1ZLHs0KajXl5bv9kWRxHOBeqLTL72ipnTEqz5Y48tQr7fAOV
 b/JI2GJigvKqPuOZcBSYTLw6xtX+LpunWATvjDkk734BBprT1UrkEVhtS k=;
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
IronPort-SDR: /UQ6OYRMVtO9kmvooW/OGjac9JureUGwkTTY8AgBxz9fFgIAY+CAmv+AdTRVON+BQAXlfqY8Q7
 Hh09tGcjr9Z46D4ZMWgWaC8By4Rd5NgS+ATDwN1Mw2hkPBLGuHLuAYWpzJe8YhE3+VKVeT3Gz7
 dIwKjyLeFyao2z7FxN5Yecrhw2fIL6D5BcF14uUpAWLMSFDjt29MOQDLRnF/lqTvtgYmgJCQUn
 +4XuEthdsX0P8ru/zqh/p9I4WlSEbhuO6EBq2XKcxc3g2G2kT9kjyo0ZXxE83IvwuP9U+tuEZh
 sMM=
X-SBRS: 2.7
X-MesageID: 13441728
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,507,1574139600"; d="scan'208";a="13441728"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
References: <f189462f-702f-0726-9b3c-c6fd1fec8407@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <4bd191eb-0c72-2a26-28a4-815ba32b5f7f@citrix.com>
Date: Mon, 2 Mar 2020 11:45:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f189462f-702f-0726-9b3c-c6fd1fec8407@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] PVH dom0 construction timeout
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
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDIvMjAyMCAyMTowOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJdCB0dXJucyBvdXQg
dGhhdCBQVkggZG9tMCBjb25zdHJ1Y3Rpb24gZG9lc24ndCB3b3JrIHNvIHdlbGwgb24gYQo+IDIt
c29ja2V0IFJvbWUgc3lzdGVtLi4uCgpXaXRoIHRoZSBzb2Z0aXJxIGZpeCBpbiBwbGFjZSwgaGVy
ZSBhcmUgdGhlIGRpZmZlcmVuY2VzIGluIGNvbnN0cnVjdGlvbgpiZXR3ZWVuIFBWIGFuZCBQVkgg
YWxvbmcgd2l0aCB0aW1lc3RhbXBzLgoKKFhFTikgW8KgwqAgMzAuODU2MTc4XSBOWCAoRXhlY3V0
ZSBEaXNhYmxlKSBwcm90ZWN0aW9uIGFjdGl2ZQooWEVOKSBbwqDCoCAzMC45MDYxNTVdICoqKiBC
dWlsZGluZyBhIFBWIERvbTAgKioqCihYRU4pIFvCoMKgIDMxLjE1Mzg1M10gRUxGOiBwaGRyOiBw
YWRkcj0weDEwMDAwMDAgbWVtc3o9MHhlZWYwMDAKCihYRU4pIFvCoMKgIDI3LjU4ODA4MV0gTlgg
KEV4ZWN1dGUgRGlzYWJsZSkgcHJvdGVjdGlvbiBhY3RpdmUKKFhFTikgW8KgwqAgMjcuNjMzMDgx
XSAqKiogQnVpbGRpbmcgYSBQVkggRG9tMCAqKioKKFhFTikgW8KgwqAgMzMuNTI0MzQ1XSBEb20w
IG1lbW9yeSBhbGxvY2F0aW9uIHN0YXRzOgooWEVOKSBbwqDCoCAzMy41Njg2OTddIG9yZGVywqAg
MCBhbGxvY2F0aW9uczogMgooWEVOKSBbwqDCoCAzMy42MTIzNDFdIG9yZGVywqAgMSBhbGxvY2F0
aW9uczogMQooWEVOKSBbwqDCoCAzMy42NTU1NDRdIG9yZGVywqAgMiBhbGxvY2F0aW9uczogNQoo
WEVOKSBbwqDCoCAzMy42OTgzNDRdIG9yZGVywqAgMyBhbGxvY2F0aW9uczogNQooWEVOKSBbwqDC
oCAzMy43NDA2NTBdIG9yZGVywqAgNCBhbGxvY2F0aW9uczogMgooWEVOKSBbwqDCoCAzMy43ODI3
MzZdIG9yZGVywqAgNSBhbGxvY2F0aW9uczogNQooWEVOKSBbwqDCoCAzMy44MjQyOTVdIG9yZGVy
wqAgNiBhbGxvY2F0aW9uczogNAooWEVOKSBbwqDCoCAzMy44NjU0MjNdIG9yZGVywqAgNyBhbGxv
Y2F0aW9uczogNAooWEVOKSBbwqDCoCAzMy45MDYyMzddIG9yZGVywqAgOCBhbGxvY2F0aW9uczog
NAooWEVOKSBbwqDCoCAzMy45NDY1NjBdIG9yZGVywqAgOSBhbGxvY2F0aW9uczogNAooWEVOKSBb
wqDCoCAzMy45ODY0NjVdIG9yZGVyIDEwIGFsbG9jYXRpb25zOiA0CihYRU4pIFvCoMKgIDM0LjAy
NTkyNV0gb3JkZXIgMTEgYWxsb2NhdGlvbnM6IDYKKFhFTikgW8KgwqAgMzQuMDY1MDg5XSBvcmRl
ciAxMiBhbGxvY2F0aW9uczogNQooWEVOKSBbwqDCoCAzNC4xMDM3NTBdIG9yZGVyIDEzIGFsbG9j
YXRpb25zOiA1CihYRU4pIFvCoMKgIDM0LjE0MjIyMV0gb3JkZXIgMTQgYWxsb2NhdGlvbnM6IDMK
KFhFTikgW8KgwqAgMzQuMTgwMDY0XSBvcmRlciAxNSBhbGxvY2F0aW9uczogMgooWEVOKSBbwqDC
oCAzNC4yMTc1NTddIG9yZGVyIDE2IGFsbG9jYXRpb25zOiAzCihYRU4pIFvCoMKgIDM0LjI1NTEw
NV0gb3JkZXIgMTcgYWxsb2NhdGlvbnM6IDMKKFhFTikgW8KgwqAgMzQuMjkyNjEwXSBvcmRlciAx
OCBhbGxvY2F0aW9uczogNQooWEVOKSBbwqDCoCAzNC41MzkwMDJdIFVuYWJsZSB0byBjb3B5IGlu
aXRyZCB0byBndWVzdAooWEVOKSBbwqDCoCAzNC41NzY3MzJdIEZhaWxlZCB0byBsb2FkIERvbTAg
a2VybmVsCihYRU4pIFvCoMKgIDM0LjYxODU1NF0KKFhFTikgW8KgwqAgMzQuNjU2OTA1XSAqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihYRU4pIFvCoMKgIDM0LjY5ODg1
MV0gUGFuaWMgb24gQ1BVIDA6CihYRU4pIFvCoMKgIDM0LjczNzY0MF0gQ291bGQgbm90IHNldCB1
cCBET00wIGd1ZXN0IE9TCihYRU4pIFvCoMKgIDM0Ljc3NzkzOV0gKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKgoKaS5lLiBQVkggZG9lc24ndCBldmVuIGNvbXBsZXRlIGNv
cnJlY3RseSwgYW5kIHRha2VzIDYgc2Vjb25kcyBhcyBvcHBvc2VkCnRvIFBWJ3MgMC4ycwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
