Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C562B646E5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 15:23:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlCWF-0005Cm-9Y; Wed, 10 Jul 2019 13:20:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GAsh=VH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hlCWD-0005Ch-OU
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 13:20:21 +0000
X-Inumbo-ID: 77108d4b-a315-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 77108d4b-a315-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 13:20:20 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6ADInaE107782;
 Wed, 10 Jul 2019 13:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=/5yLM4mbjzRmIXEHs2SJpsLnDoPmJ/wHA+9zC34Et+A=;
 b=44QOVwEm79DAncWafsxnHgQ4xniDJlHQMOsEiknXsA7lyLpqB7KM2/dWkubOaTVPDAc9
 IDm3SwNOrJtBwffuEY29Vs2VbyiFaMLSZ5BnDazCpwuliRyaqykaTT6N4CBXkJf1KRIG
 HNNMG2Bn9OKjYnxr8tvxthTRPWW0iCEC8A8XIGCwbfceBkM9qrqES3XtyQ49WE8EkstY
 ow7sw18v7F5Wzh8B/FD2o8HsHgFsqVwIQ2Uu9dohWBbNlEPpTY/LJSdnYXA6pY1VArko
 zjwKYMVTP+P/Q/U67OmDnOm+3CoEaMkRKs73qbGBfRm4Cx6Qu8y/vaf7AiU4TbVyx31Y tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2tjkkpt3jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jul 2019 13:20:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6ADIEJx030597;
 Wed, 10 Jul 2019 13:20:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2tnc8suxcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jul 2019 13:20:07 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6ADK6dQ000835;
 Wed, 10 Jul 2019 13:20:06 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 10 Jul 2019 06:20:05 -0700
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1562490908-17882-1-git-send-email-zhenzhong.duan@oracle.com>
 <1562490908-17882-5-git-send-email-zhenzhong.duan@oracle.com>
 <86b0dbb9-74a7-6883-e6d7-210bd35a6944@oracle.com>
 <6cbd7b78-3d8d-64ae-fd2e-82244dbe6a1e@oracle.com>
 <3d7db7c6-cea3-9dce-0519-a1c600b33273@oracle.com>
 <33876a98-9b6b-a1b9-e72f-352c3f95db89@oracle.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <71b06655-79d2-97ae-cb6d-e0e606c8237f@oracle.com>
Date: Wed, 10 Jul 2019 09:21:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <33876a98-9b6b-a1b9-e72f-352c3f95db89@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9313
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907100156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9313
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907100156
Subject: Re: [Xen-devel] [PATCH v6 4/4] x86/xen: Add "nopv" support for HVM
 guest
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
Cc: jgross@suse.com, sstabellini@kernel.org, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy85LzE5IDEwOjA3IFBNLCBaaGVuemhvbmcgRHVhbiB3cm90ZToKPiBPbiAyMDE5LzcvOSAy
Mjo1NCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiA3LzkvMTkgMTI6MjAgQU0sIFpoZW56
aG9uZyBEdWFuIHdyb3RlOgo+Pj4gLWNvbnN0IF9faW5pdGNvbnN0IHN0cnVjdCBoeXBlcnZpc29y
X3g4NiB4ODZfaHlwZXJfeGVuX2h2bSA9IHsKPj4+ICtzdGF0aWMgdWludDMyX3QgX19pbml0IHhl
bl9wbGF0Zm9ybV9odm0odm9pZCkKPj4+ICt7Cj4+PiArwqDCoMKgwqDCoMKgIHVpbnQzMl90IHhl
bl9kb21haW4gPSB4ZW5fY3B1aWRfYmFzZSgpOwo+Pj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgeDg2
X2h5cGVyX2luaXQgKmggPSAmeDg2X2h5cGVyX3hlbl9odm0uaW5pdDsKPj4+ICsKPj4+ICvCoMKg
wqDCoMKgwqAgaWYgKHhlbl9wdl9kb21haW4oKSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAwOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoCBpZiAoeGVuX3B2aF9kb21h
aW4oKSAmJiBub3B2KSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBHdWVz
dCBib290aW5nIHZpYSB0aGUgWGVuLVBWSCBib290IGVudHJ5IGdvZXMKPj4+IGhlcmUgKi8KPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX2luZm8oIlwibm9wdlwiIHBhcmFtZXRl
ciBpcyBpZ25vcmVkIGluIFBWSAo+Pj4gZ3Vlc3RcbiIpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbm9wdiA9IGZhbHNlOwo+Pj4gK8KgwqDCoMKgwqDCoCB9IGVsc2UgaWYgKG5v
cHYgJiYgeGVuX2RvbWFpbikgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBHdWVzdCBib290aW5nIHZpYSBu
b3JtYWwgYm9vdCBlbnRyeSAobGlrZSB2aWEKPj4+IGdydWIyKSBnb2VzCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogaGVyZS4KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFVzZSBpbnRl
cmZhY2UgZnVuY3Rpb25zIGZvciBiYXJlIGhhcmR3YXJlIGlmIG5vcHYsCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogeGVuX2h2bV9ndWVzdF9sYXRlX2luaXQgaXMgYW4gZXhj
ZXB0aW9uIGFzIHdlCj4+PiBuZWVkIHRvCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogZGV0ZWN0IFBWSCBhbmQgcGFuaWMgdGhlcmUuCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICovCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1jcHko
aCwgKHZvaWQgKikmeDg2X2luaXQuaHlwZXIsCj4+PiBzaXplb2YoeDg2X2luaXQuaHlwZXIpKTsK
Pj4KPj4gQW5kIHRoaXMgd29ya2VkPyBJJ2QgdGhpbmsgaXQgd291bGQgZmFpbCBzaW5jZSBoIHBv
aW50cyB0byBSTyBzZWN0aW9uLgo+IFllcywgSSBoYXZlIGJlbG93IGNoYW5nZXMgaW4gdGhlIHBh
dGNoLgo+Cj4gLWNvbnN0IF9faW5pdGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlw
ZXJfeGVuX2h2bSA9IHsKPiArc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5faHZt
IF9faW5pdGRhdGEgPSB7CgoKQnV0IGh5cGVydmlzb3JzW10gc3RheXNfX2luaXRjb25zdCBzbyB0
aGF0IEkgdGhvdWdodCBjb3VsZCBiZSBhIHByb2JsZW0uCkJ1dCBhcHBhcmVudGx5IGl0J3Mgbm90
LgoKPgo+Pgo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5KCZ4ODZf
aHlwZXJfeGVuX2h2bS5ydW50aW1lLCAodm9pZAo+Pj4gKikmeDg2X3BsYXRmb3JtLmh5cGVyLAo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2YoeDg2
X3BsYXRmb3JtLmh5cGVyKSk7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoLT5n
dWVzdF9sYXRlX2luaXQgPSB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdDsKPj4KPj4gVG8gbWUgdGhp
cyBzdGlsbCBkb2Vzbid0IGxvb2sgcmlnaHQgLS0tIHlvdSBhcmUgbWFraW5nIGFzc3VtcHRpb25z
IGFib3V0Cj4+IHg4Nl9wbGF0Zm9ybS94ODZfaW5pdC5oeXBlciBhbmQgSSBkb24ndCB0aGluayB5
b3UgY2FuIGFzc3VtZSB0aGV5IGhhdmUKPj4gbm90IGJlZW4gc2V0IHRvIHBvaW50IHRvIGFub3Ro
ZXIgaHlwZXJ2aXNvciwgZm9yIGV4YW1wbGUuCj4KPiBZb3UgbWVhbiBjb3B5X2FycmF5KCkgY2Fs
bHMgaW4gaW5pdF9oeXBlcnZpc29yX3BsYXRmb3JtKCk/IEJ1dCB0aGF0Cj4gaGFwcGVucyBhZnRl
cgo+Cj4gZGV0ZWN0X2h5cGVydmlzb3JfdmVuZG9yKCkgc2hvb3NlIG91dCB0aGUgcHJlZmVyZWQg
aHlwZXJ2aXNvci4gSW4KPiBkZXRlY3Qgc3RhZ2UsCj4KPiB4ODZfcGxhdGZvcm0veDg2X2luaXQu
aHlwZXIgaGFzIGRlZmF1bHQgdmFsdWUgZm9yIGJhcmUgaGFyZHdhcmUsIG9yIEkKPiBtaXNzZWQg
c29tZXRoaW5nPwoKClJpZ2h0LiBNeSBwb2ludCB0aG91Z2ggaXMgdGhhdCB0aGlzIG9yZGVyaW5n
IGlzIG9wYXF1ZSB0bwpoeXBlcnZpc29yLXNwZWNpZmljIGNvZGUgYW5kIGNhbiBjaGFuZ2UuIFRo
ZSBzYW1lIGlzIHRydWUgYWJvdXQgbWFraW5nCmFzc3VtcHRpb25zIGFib3V0IHg4Nl9wbGF0Zm9y
bS94ODZfaW5pdC5oeXBlciB2YWx1ZXMuCgotYm9yaXMKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
