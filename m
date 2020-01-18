Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B75141923
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jan 2020 20:27:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isthi-0004Rk-RF; Sat, 18 Jan 2020 19:24:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0MUV=3H=gdata.de=peter.kurfer@srs-us1.protection.inumbo.net>)
 id 1istJi-00024x-Gk
 for xen-devel@lists.xenproject.org; Sat, 18 Jan 2020 18:59:30 +0000
X-Inumbo-ID: a678a14a-3a24-11ea-b78f-12813bfff9fa
Received: from mx1.gdata.de (unknown [212.23.151.203])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a678a14a-3a24-11ea-b78f-12813bfff9fa;
 Sat, 18 Jan 2020 18:59:28 +0000 (UTC)
Received: from ex3.gdata.de (unknown [10.210.7.10])
 by mx1.gdata.de (Postfix) with ESMTPS id 1063C8667E
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jan 2020 19:59:27 +0100 (CET)
Received: from ex2.gdata.de (10.10.12.94) by ex3.gdata.de (10.210.7.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1034.26; Sat, 18 Jan
 2020 19:59:26 +0100
Received: from ex1.gdata.de (10.10.12.93) by ex2.gdata.de (10.10.12.94) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1034.26; Sat, 18 Jan
 2020 19:59:26 +0100
Received: from ex1.gdata.de ([fe80::1d8:f0b4:e0a3:1e6d]) by ex1.gdata.de
 ([fe80::1d8:f0b4:e0a3:1e6d%2]) with mapi id 15.01.1034.033; Sat, 18 Jan 2020
 19:59:26 +0100
From: <Peter.Kurfer@gdata.de>
To: <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] Host freezing after "fixing" recursive fault
 starting in multicalls.c
Thread-Index: AQHVzjAx5BdseV0VZUmS6IDuwTZgCQ==
Date: Sat, 18 Jan 2020 18:59:26 +0000
Message-ID: <8e3c6908ce4b48689817b32c538fecf9@gdata.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.23.151.194]
x-g-data-mailsecurity-for-exchange-spamlevel: 0
x-g-data-mailsecurity-for-exchange-state: 0
x-g-data-mailsecurity-for-exchange-error: 0
x-g-data-mailsecurity-for-exchange-sender: 32
x-g-data-mailsecurity-for-exchange-server: b518cbf5-84a3-453a-a79a-947cf417bc69
x-g-data-mailsecurity-for-exchange-guid: D5C28D0D-0138-4B96-9949-D3B1ED96ADDF
x-g-data-mailsecurity-for-exchange-processedonrouted: True
MIME-Version: 1.0
X-G-Data-MailSecurity-for-Exchange-SpamLevel: 0
X-G-Data-MailSecurity-for-Exchange-State: 0
X-G-Data-MailSecurity-for-Exchange-Error: 0
X-G-Data-MailSecurity-for-Exchange-Sender: 32
X-G-Data-MailSecurity-for-Exchange-Server: b3e6f729-74a9-4eb6-bd95-c148e309eb1f
X-Mailman-Approved-At: Sat, 18 Jan 2020 19:24:17 +0000
Subject: [Xen-devel] Host freezing after "fixing" recursive fault starting
 in multicalls.c
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

SGksCgpJIHdhcyBhZHZpc2VkIHRvIGJ1bXAgdGhpcyBhbHNvIHRvIHRoZSBkZXZlbCBtYWlsaW5n
IGxpc3QsIGJlY2F1c2UgdGhlIG1lbnRpb25lZCBlcnJvciBtZXNzYWdlIHdhcyBhcHBhcmVudGx5
IGFkZGVkIGluIEtlcm5lbCA0LjIwIChhbmQgdXB3YXJkcykgYW5kIHRoaXMga2VybmVsIHZlcnNp
b27CoCBpcyBub3QgYnJvYWRseSBhZG9wdGVkIGFscmVhZHkgYW5kIHRoZXJlZm9yZSBpdCBpcyB1
bmxpa2VseSB0aGF0IGFub3RoZXIgdXNlciBlbmNvdW50ZXJlZCBhIHNtaWxpYXIgcHJvYmxlbSBh
bHJsZWFkeS4gCgpPcmlnaW5hbCBtZXNzYWdlIChzZWUgYWxzbyBoZXJlOiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLXVzZXJzLzIwMjAtMDEvbXNnMDAwMTMu
aHRtbCApCgpJJ20gcnVubmluZyBYZW4gNC4xMS4yIG9uIEZlZG9yYSAzMCB3aXRoIEtlcm5lbCB2
ZXJzaW9ucyA1LjQuNyBhbmQgNS40LjEwIG9uIG11bHRpcGxlIEhQIHNlcnZlcnMuCgpUaGUgd29y
a2Zsb3cgSSdtIHRyeWluZyB0byBhY2hpZXZlIGxvb2tzIGxpa2UgdGhlIGZvbGxvd2luZzoKCi0g
YSBWTSBpcyByZXN1bWVkIGZyb20gYSBzbmFwc2hvdCB3aXRoIGEgUHl0aG9uIHNjcmlwdCB1c2lu
ZyB0aGUgbGlidmlydCBBUEkKLSBpdCBpcyBydW5uaW5nIGZvciBhIGZldyBtaW51dGVzLAotIGl0
IGdldHMgcGF1c2VkIGFuZCBmaW5hbGx5IGRlc3Ryb3llZCBmb3IgdGVzdGluZyBwdXJwb3NlcwoK
QXQgc29tZSBwb2ludCAtIGl0IGRvZXNuJ3Qgc2VlbSB0byBiZSBkZXRlcm1pbmlzdGljIGJlY2F1
c2Ugc29tZXRpbWVzIGl0ICBoYXBwZW5zIGRpcmVjdGx5IGFmdGVyIHRoZSBib290IGFuZCBzb21l
dGltZXMgYWZ0ZXIgbXVsdGlwbGUgaG91cnMgLSBhICBodWdlIHN0YWNrdHJhY2Ugc3RhcnRpbmcg
d2l0aCBhbiBlcnJvciBpbiBgYXJjaC94ODYveGVuL211bHRpY2FsbHMuY2AgIGNhbiBiZSBmb3Vu
ZCBpbiB0aGUga2VybmVsIGxvZ3Mgd2hpY2ggZW5kcyB3aXRoIHRoZSBtZXNzYWdlICdGaXhpbmcg
cmVjdXJzaXZlIGZhdWx0IGJ1dCByZWJvb3QgaXMgbmVlZGVkIScuCgpBZnRlciBzb21lIHRpbWUg
dGhlIHN5c3RlbSBjb21wbGV0ZWx5IGZyZWV6ZXMgYW5kIG5lZWRzIHRvIGJlIGhhcmQgIHJlc2V0
dGVkIGJlY2F1c2UgaXQgaXMgbm90IHBvc3NpYmxlIGFueSBtb3JlIHRvIGxvZ2luIHZpYSBTU0gu
ClRoZSBmcmVlemUgaXMgYWxzbyBub3QgZGV0ZXJtaW5pc3RpYyBidXQgdGhlcmUgYXJlIG5vIG90
aGVyIGNyaXRpY2FsIGVycm9ycyBpbiB0aGUgbG9ncywgc28gaXQgc2VlbXMgc29tZWhvdyB0byBi
ZSByZWxhdGVkLgoKQmVjYXVzZSB0aGUgZnVsbCBzdGFja3RyYWNlIGhhcyByb3VuZCBhYm91dCAz
NzAgbGluZXMgSSBhdHRhY2hlZCBpdCBhcyBhIEdpdEh1YiBHaXN0OgoKaHR0cHM6Ly9naXN0Lmdp
dGh1Yi5jb20vYmFlejkwLzEzNWMzOTg1Y2JiNmZkNGI0MjA0MjY5ZmIzODQyMjFhCgpJJ20gYSBs
aXR0bGUgY29uZnVzZWQgYXMgdG8gd2hhdCBlbHNlIHRvIHRyeSBhbmQgSSBoYXZlIG5vIGlkZWEg
d2hhdCB0aGUgcHJvYmxlbSBtaWdodCBiZS4KCkFueSBoaW50cy9pZGVhcy9wcm9wb3NhbHM/CgpL
aW5kIHJlZ2FyZHMgYW5kIHRoYW5rcyBpbiBhZHZhbmNlIAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
