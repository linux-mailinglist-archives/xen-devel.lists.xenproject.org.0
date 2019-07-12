Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178D4667F0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 09:45:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlqBk-0001if-I6; Fri, 12 Jul 2019 07:41:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vyeD=VJ=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hlqBi-0001ia-Ix
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 07:41:50 +0000
X-Inumbo-ID: 81a27ec1-a478-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 81a27ec1-a478-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 07:41:49 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6C7cwS0075741;
 Fri, 12 Jul 2019 07:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=Hqtemgq0/vKq7WKvzyTPGJ5M4ed+ytO/KDHOyeR5Kag=;
 b=VR8Wm8/0R14XVpIrQWlP302kEwRZZNDGHxUJeqJ32skhKnHoy8wtRjXWiRDe55dTwcOK
 4C3poH0LdwIf8mbbqchF6vboU0PYNQ5q7unlVMiToZoeDtEcm8z6BUjmyRs6ZXnjc5L1
 VkS7bVSdF0se7R9Bcds9ttf+0a2+aIONUo81jB2TwI6fGEQ/0Nd7j9ehAPPmx0MImekD
 1Tl9b41yuDg4PzX0MPktQM+/8QC6mI1XzsSZZpyXxkZVM05p0MKyNPrb8NgU8aBpoS8g
 pAPNx5nAiYcBKepZV5U3q40+TUbyPoAyBquU5nCspPFitCvGba5POLE4Hvbyeg+J0v0/ uA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2tjkkq40tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 07:41:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6C7bi5C079515;
 Fri, 12 Jul 2019 07:41:31 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2tn1j20jnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 07:41:30 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6C7fLMh020987;
 Fri, 12 Jul 2019 07:41:25 GMT
Received: from [10.191.17.234] (/10.191.17.234)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 12 Jul 2019 00:41:21 -0700
To: linux-kernel@vger.kernel.org
References: <1562820438-30328-1-git-send-email-zhenzhong.duan@oracle.com>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Organization: Oracle Corporation
Message-ID: <fa73ab45-235d-b338-ddd1-1628ed70d801@oracle.com>
Date: Fri, 12 Jul 2019 15:41:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1562820438-30328-1-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907120079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907120079
Subject: Re: [Xen-devel] [PATCH] xen/pv: Fix a boot up hang triggered by
 int3 self test
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 srinivas.eeda@oracle.com, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29ycnkgZm9yIHRoZSBub2lzZSwgaXQgbG9va3MgZGVzY3JpcHRpb24gaXMgd3JvbmcuCgpUaGlz
IGlzIG5vdCBhIGRvdWJsZSBwb3AsIGJ1dCB4ZW4gcHYgdGFraW5nIHRoZSBwYXRoCgp3aXRoIGNy
ZWF0ZV9nYXA9MCwgSSdsbCBzZW5kIGEgdjIuCgpaaGVuemhvbmcKCk9uIDIwMTkvNy8xMSAxMjo0
NywgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4gQ29tbWl0IDc0NTdjMGRhMDI0YiAoIng4Ni9hbHRl
cm5hdGl2ZXM6IEFkZCBpbnQzX2VtdWxhdGVfY2FsbCgpCj4gc2VsZnRlc3QiKSByZXZlYWxzIGEg
YnVnIGluIFhFTiBQViBpbnQzIGFzc2VtYmxlIGNvZGUuIFRoZXJlIGlzCj4gYSBkb3VibGUgcG9w
IG9mIHJlZ2lzdGVyIFIxMSBhbmQgUkNYIGN1cnJ1cHRpbmcgdGhlIGV4Y2VwdGlvbgo+IGZyYW1l
LCBvbmUgaW4geGVuX2ludDMgYW5kIHRoZSBvdGhlciBpbiB4ZW5feGVuaW50My4KPgo+IFdlIHNl
ZSBiZWxvdyBoYW5nIGF0IGJvb3R1cDoKPgo+IGdlbmVyYWwgcHJvdGVjdGlvbiBmYXVsdDogMDAw
MCBbIzFdIFNNUCBOT1BUSQo+IENQVTogMCBQSUQ6IDAgQ29tbTogc3dhcHBlci8wIE5vdCB0YWlu
dGVkIDUuMi4wKyAjNgo+IFJJUDogZTAzMDppbnQzX21hZ2ljKzB4MC8weDcKPiBDYWxsIFRyYWNl
Ogo+ICAgYWx0ZXJuYXRpdmVfaW5zdHJ1Y3Rpb25zKzB4M2QvMHgxMmUKPiAgIGNoZWNrX2J1Z3Mr
MHg3YzkvMHg4ODcKPiAgID9fX2dldF9sb2NrZWRfcHRlKzB4MTc4LzB4MWYwCj4gICBzdGFydF9r
ZXJuZWwrMHg0ZmYvMHg1MzUKPiAgID9zZXRfaW5pdF9hcmcrMHg1NS8weDU1Cj4gICB4ZW5fc3Rh
cnRfa2VybmVsKzB4NTcxLzB4NTdhCj4KPiBGaXggaXQgYnkgcmVtb3ZpbmcgeGVuX3hlbmludDMu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5Ab3JhY2xl
LmNvbT4KPiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4K
PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IENjOiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IFBldGVyIFppamxzdHJhIDxwZXRl
cnpAaW5mcmFkZWFkLm9yZz4KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXgu
ZGU+Cj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgo+IENjOiBCb3Jpc2xhdiBQ
ZXRrb3YgPGJwQGFsaWVuOC5kZT4KPiAtLS0KPiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3RyYXBz
LmggfCAyICstCj4gICBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgIHwgMiArLQo+ICAgYXJj
aC94ODYveGVuL3hlbi1hc21fNjQuUyAgICB8IDEgLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5j
bHVkZS9hc20vdHJhcHMuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RyYXBzLmgKPiBpbmRleCA3
ZDZmM2YzLi5mMmJkMjg0IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RyYXBz
LmgKPiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90cmFwcy5oCj4gQEAgLTQwLDcgKzQwLDcg
QEAKPiAgIGFzbWxpbmthZ2Ugdm9pZCB4ZW5fZGl2aWRlX2Vycm9yKHZvaWQpOwo+ICAgYXNtbGlu
a2FnZSB2b2lkIHhlbl94ZW5ubWkodm9pZCk7Cj4gICBhc21saW5rYWdlIHZvaWQgeGVuX3hlbmRl
YnVnKHZvaWQpOwo+IC1hc21saW5rYWdlIHZvaWQgeGVuX3hlbmludDModm9pZCk7Cj4gK2FzbWxp
bmthZ2Ugdm9pZCB4ZW5faW50Myh2b2lkKTsKPiAgIGFzbWxpbmthZ2Ugdm9pZCB4ZW5fb3ZlcmZs
b3codm9pZCk7Cj4gICBhc21saW5rYWdlIHZvaWQgeGVuX2JvdW5kcyh2b2lkKTsKPiAgIGFzbWxp
bmthZ2Ugdm9pZCB4ZW5faW52YWxpZF9vcCh2b2lkKTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
eGVuL2VubGlnaHRlbl9wdi5jIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCj4gaW5kZXgg
NDcyMmJhMi4uMjEzOGQ2OSAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2
LmMKPiArKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPiBAQCAtNTk2LDcgKzU5Niw3
IEBAIHN0cnVjdCB0cmFwX2FycmF5X2VudHJ5IHsKPiAgIAo+ICAgc3RhdGljIHN0cnVjdCB0cmFw
X2FycmF5X2VudHJ5IHRyYXBfYXJyYXlbXSA9IHsKPiAgIAl7IGRlYnVnLCAgICAgICAgICAgICAg
ICAgICAgICAgeGVuX3hlbmRlYnVnLCAgICAgICAgICAgICAgICAgICAgdHJ1ZSB9LAo+IC0JeyBp
bnQzLCAgICAgICAgICAgICAgICAgICAgICAgIHhlbl94ZW5pbnQzLCAgICAgICAgICAgICAgICAg
ICAgIHRydWUgfSwKPiArCXsgaW50MywgICAgICAgICAgICAgICAgICAgICAgICB4ZW5faW50Mywg
ICAgICAgICAgICAgICAgICAgICAgICB0cnVlIH0sCj4gICAJeyBkb3VibGVfZmF1bHQsICAgICAg
ICAgICAgICAgIHhlbl9kb3VibGVfZmF1bHQsICAgICAgICAgICAgICAgIHRydWUgfSwKPiAgICNp
ZmRlZiBDT05GSUdfWDg2X01DRQo+ICAgCXsgbWFjaGluZV9jaGVjaywgICAgICAgICAgICAgICB4
ZW5fbWFjaGluZV9jaGVjaywgICAgICAgICAgICAgICB0cnVlIH0sCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L3hlbi94ZW4tYXNtXzY0LlMgYi9hcmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TCj4gaW5k
ZXggMWU5ZWYwYi4uZWJmNjEwYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni94ZW4veGVuLWFzbV82
NC5TCj4gKysrIGIvYXJjaC94ODYveGVuL3hlbi1hc21fNjQuUwo+IEBAIC0zMiw3ICszMiw2IEBA
IHhlbl9wdl90cmFwIGRpdmlkZV9lcnJvcgo+ICAgeGVuX3B2X3RyYXAgZGVidWcKPiAgIHhlbl9w
dl90cmFwIHhlbmRlYnVnCj4gICB4ZW5fcHZfdHJhcCBpbnQzCj4gLXhlbl9wdl90cmFwIHhlbmlu
dDMKPiAgIHhlbl9wdl90cmFwIHhlbm5taQo+ICAgeGVuX3B2X3RyYXAgb3ZlcmZsb3cKPiAgIHhl
bl9wdl90cmFwIGJvdW5kcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
