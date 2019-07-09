Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E15662F85
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 06:25:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkhd9-0004aV-6Z; Tue, 09 Jul 2019 04:21:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LmhJ=VG=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hkhd8-0004aM-4x
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 04:21:26 +0000
X-Inumbo-ID: f56d6ad6-a200-11e9-a5ef-0f4db97485b5
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f56d6ad6-a200-11e9-a5ef-0f4db97485b5;
 Tue, 09 Jul 2019 04:21:01 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x694JPS3045691;
 Tue, 9 Jul 2019 04:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=mrs5k2SPEkQusZrksvY+z398D7oJTAyXewMSp4Vy1wY=;
 b=qcJzybHFs+0AttndQUiS9GvEgUjJc1DZdfaxD5IhGkC5LKRzmFbJuMkBNzvHbw0xA7cU
 HSHxlVrcIcr7wHU37xY5aFhVbmHNc765zXQS5fO3YATrhj+iFp+TUBnoDUqUyQzXyaU3
 iQnHpCnaTVCznc46ufOOJ525Lz9zTKncjjKZ+cS6ucU28Hz0E196LcI/Ut/pnImAVU1E
 pyinQ9xn/779RH56wQ8KKpegj38ATS/byb1M+J3/aNsrw+t9gVRRhStBRbcinbEals1W
 r/5G4nppFJglHEMXFjNYRJzXYFj+TTgw6lYSp/gqNkAG5KC8JivGeUXDuQzNPOFhX4jb FA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2tjm9qhrem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Jul 2019 04:20:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x694IKpD006799;
 Tue, 9 Jul 2019 04:20:45 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2tjhpcuc6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Jul 2019 04:20:45 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x694KiPp008688;
 Tue, 9 Jul 2019 04:20:44 GMT
Received: from [10.191.31.108] (/10.191.31.108)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Jul 2019 21:20:43 -0700
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
References: <1562490908-17882-1-git-send-email-zhenzhong.duan@oracle.com>
 <1562490908-17882-5-git-send-email-zhenzhong.duan@oracle.com>
 <86b0dbb9-74a7-6883-e6d7-210bd35a6944@oracle.com>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Organization: Oracle Corporation
Message-ID: <6cbd7b78-3d8d-64ae-fd2e-82244dbe6a1e@oracle.com>
Date: Tue, 9 Jul 2019 12:20:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <86b0dbb9-74a7-6883-e6d7-210bd35a6944@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9312
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907090050
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9312
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907090050
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIwMTkvNy84IDIxOjQ2LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gT24gNy83LzE5IDU6
MTUgQU0sIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+PiAgIAo+PiArc3RhdGljIHVpbnQzMl90IF9f
aW5pdCB4ZW5fcGxhdGZvcm1faHZtKHZvaWQpCj4+ICt7Cj4+ICsJaWYgKHhlbl9wdl9kb21haW4o
KSkKPj4gKwkJcmV0dXJuIDA7Cj4+ICsKPj4gKwlpZiAoeGVuX3B2aF9kb21haW4oKSAmJiBub3B2
KSB7Cj4+ICsJCS8qIEd1ZXN0IGJvb3RpbmcgdmlhIHRoZSBYZW4tUFZIIGJvb3QgZW50cnkgZ29l
cyBoZXJlICovCj4+ICsJCXByX2luZm8oIlwibm9wdlwiIHBhcmFtZXRlciBpcyBpZ25vcmVkIGlu
IFBWSCBndWVzdFxuIik7Cj4+ICsJCW5vcHYgPSBmYWxzZTsKPj4gKwl9IGVsc2UgaWYgKG5vcHYp
IHsKPj4gKwkJLyoKPj4gKwkJICogR3Vlc3QgYm9vdGluZyB2aWEgbm9ybWFsIGJvb3QgZW50cnkg
KGxpa2UgdmlhIGdydWIyKSBnb2VzCj4+ICsJCSAqIGhlcmUuCj4+ICsJCSAqLwo+PiArCQl4ODZf
aW5pdC5oeXBlci5ndWVzdF9sYXRlX2luaXQgPSB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdDsKPj4g
KwkJcmV0dXJuIDA7Cj4gQWZ0ZXIgc3RhcmluZyBhdCB0aGlzIHNvbWUgbW9yZSBJIGRvbid0IHRo
aW5rIHdlIGNhbiBkbyB0aGlzLgo+IEh5cGVydmlzb3Itc3BlY2lmaWMgY29kZSBzaG91bGQgbm90
IG11Y2sgd2l0aCB3aXRoIHg4Nl9pbml0Lmh5cGVyLCBpdCdzCj4gbGF5ZXJpbmcgdmlvbGF0aW9u
LiBUaGF0J3Mgd2hhdCBpbml0X2h5cGVydmlzb3JfcGxhdGZvcm0oKSBpcyBmb3IuCk9rLCBJIHNl
ZS4KPgo+IFNvIHdlIG1heSBoYXZlIHRvIGNyZWF0ZSBhbm90aGVyIGh5cGVydmlzb3JfeDg2IG9w
cyBzdHJ1Y3R1cmUgZm9yIFhlbgo+IG5vcHYgKHdoaWNoIEkgZG9uJ3QgZmluZCB2ZXJ5IGFwcGVh
bGluZyBUQkgpLiBPciB1cGRhdGUKPiB4ODZfaHlwZXJfeGVuX2h2bSBhbmQgcmV0dXJuIHhlbl9j
cHVpZF9iYXNlKCkgaW5zdGVhZCBvZiB6ZXJvIChidXQgdGhlbgo+IHlvdSdkIG5lZWQgdG8gdXBk
YXRlIGFsbCB0aGVzZSBzdHJ1Y3RzIGZyb20gX19pbml0Y29uc3QgdG8gX2luaXQgb3Igc29tZQo+
IHN1Y2gpLiBPciBzb21ldGhpbmcgZWxzZS4KCkkgY2hvb3NlIHRoZSBzZWNvbmQuIEkgbWFkZSBi
ZWxvdyBjaGFuZ2VzLCBub3QgY2xlYXIgaWYgaXQncyBhbHNvIGEgCmxheWVyaW5nIHZpb2xhdGlv
bgoKYXMgdXNlIHg4Nl9pbml0Lmh5cGVyIGFzIHNvdXJjZSBmb3IgbWVtY3B5LiBJIGNob29zZSBt
ZW1jcHkgaW5zdGVhZCBvZiAKdXBkYXRpbmcKCmZ1bmN0aW9ucyBwb2ludGVycyBvbmUtYnktb25l
IGJlY2F1c2UgaWYgeDg2X2h5cGVyX2luaXQgaW50ZXJmYWNlIApmdW5jdGlvbnMgZXh0ZW5kcwoK
aW4gdGhlIGZ1dHVyZSB3ZSBuZWVkIG5vIGNoYW5nZXMuIExldCBtZSBrbm93IGlmIHlvdSBwcmVm
ZXIgdXBkYXRpbmcgCnBvaW50ZXJzIGRpcmVjdGx5LgoKVGhpcyBpc24ndCBhIGZvcm1hbCBwYXRj
aCBmb3IgcmV2aWV3LCBqdXN0IHdhbnQgdG8gZ2V0IGFuc3dlciBvZiBhYm92ZSAKcXVlc3Rpb24u
CgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYyBiL2FyY2gveDg2L3hl
bi9lbmxpZ2h0ZW5faHZtLmMKCmluZGV4IDE3NTZjZjcuLjg0MTY2NDBkIDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5f
aHZtLmMKQEAgLTIzMSwxNCArMjMxLDYgQEAgYm9vbCBfX2luaXQgeGVuX2h2bV9uZWVkX2xhcGlj
KHZvaWQpCiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKIMKgfQoKLXN0YXRpYyB1aW50MzJf
dCBfX2luaXQgeGVuX3BsYXRmb3JtX2h2bSh2b2lkKQotewotwqDCoMKgwqDCoMKgIGlmICh4ZW5f
cHZfZG9tYWluKCkpCi3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwotCi3C
oMKgwqDCoMKgwqAgcmV0dXJuIHhlbl9jcHVpZF9iYXNlKCk7Ci19Ci0KIMKgc3RhdGljIF9faW5p
dCB2b2lkIHhlbl9odm1fZ3Vlc3RfbGF0ZV9pbml0KHZvaWQpCiDCoHsKIMKgI2lmZGVmIENPTkZJ
R19YRU5fUFZICkBAIC0yNTAsNiArMjQyLDkgQEAgc3RhdGljIF9faW5pdCB2b2lkIHhlbl9odm1f
Z3Vlc3RfbGF0ZV9pbml0KHZvaWQpCiDCoMKgwqDCoMKgwqDCoCAvKiBQVkggZGV0ZWN0ZWQuICov
CiDCoMKgwqDCoMKgwqDCoCB4ZW5fcHZoID0gdHJ1ZTsKCivCoMKgwqDCoMKgwqAgaWYgKG5vcHYp
CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhbmljKCJcIm5vcHZcIiBhbmQgXCJ4ZW5f
bm9wdlwiIHBhcmFtZXRlcnMgYXJlIAp1bnN1cHBvcnRlZCBpbiBQVkggZ3Vlc3QuIik7CisKIMKg
wqDCoMKgwqDCoMKgIC8qIE1ha2Ugc3VyZSB3ZSBkb24ndCBmYWxsIGJhY2sgdG8gKGRlZmF1bHQp
IEFDUElfSVJRX01PREVMX1BJQy4gKi8KIMKgwqDCoMKgwqDCoMKgIGlmICghbnJfaW9hcGljcyAm
JiBhY3BpX2lycV9tb2RlbCA9PSBBQ1BJX0lSUV9NT0RFTF9QSUMpCiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYWNwaV9pcnFfbW9kZWwgPSBBQ1BJX0lSUV9NT0RFTF9QTEFURk9STTsK
QEAgLTI1OSw3ICsyNTQsMzYgQEAgc3RhdGljIF9faW5pdCB2b2lkIHhlbl9odm1fZ3Vlc3RfbGF0
ZV9pbml0KHZvaWQpCiDCoCNlbmRpZgogwqB9CgotY29uc3QgX19pbml0Y29uc3Qgc3RydWN0IGh5
cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5faHZtID0geworc3RhdGljIHVpbnQzMl90IF9faW5p
dCB4ZW5fcGxhdGZvcm1faHZtKHZvaWQpCit7CivCoMKgwqDCoMKgwqAgdWludDMyX3QgeGVuX2Rv
bWFpbiA9IHhlbl9jcHVpZF9iYXNlKCk7CivCoMKgwqDCoMKgwqAgc3RydWN0IHg4Nl9oeXBlcl9p
bml0ICpoID0gJng4Nl9oeXBlcl94ZW5faHZtLmluaXQ7CisKK8KgwqDCoMKgwqDCoCBpZiAoeGVu
X3B2X2RvbWFpbigpKQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKKwor
wqDCoMKgwqDCoMKgIGlmICh4ZW5fcHZoX2RvbWFpbigpICYmIG5vcHYpIHsKK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogR3Vlc3QgYm9vdGluZyB2aWEgdGhlIFhlbi1QVkggYm9vdCBl
bnRyeSBnb2VzIGhlcmUgKi8KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfaW5mbygi
XCJub3B2XCIgcGFyYW1ldGVyIGlzIGlnbm9yZWQgaW4gUFZIIGd1ZXN0XG4iKTsKK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9wdiA9IGZhbHNlOworwqDCoMKgwqDCoMKgIH0gZWxzZSBp
ZiAobm9wdiAmJiB4ZW5fZG9tYWluKSB7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8q
CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBHdWVzdCBib290aW5nIHZpYSBub3Jt
YWwgYm9vdCBlbnRyeSAobGlrZSB2aWEgZ3J1YjIpIGdvZXMKK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIGhlcmUuCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKgorwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogVXNlIGludGVyZmFjZSBmdW5jdGlvbnMgZm9y
IGJhcmUgaGFyZHdhcmUgaWYgbm9wdiwKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IHhlbl9odm1fZ3Vlc3RfbGF0ZV9pbml0IGlzIGFuIGV4Y2VwdGlvbiBhcyB3ZSBuZWVkIHRvCivC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBkZXRlY3QgUFZIIGFuZCBwYW5pYyB0aGVy
ZS4KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLworwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBtZW1jcHkoaCwgKHZvaWQgKikmeDg2X2luaXQuaHlwZXIsIHNpemVvZih4ODZf
aW5pdC5oeXBlcikpOworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1jcHkoJng4Nl9o
eXBlcl94ZW5faHZtLnJ1bnRpbWUsICh2b2lkIAoqKSZ4ODZfcGxhdGZvcm0uaHlwZXIsCivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZW9mKHg4Nl9wbGF0Zm9y
bS5oeXBlcikpOworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoLT5ndWVzdF9sYXRlX2lu
aXQgPSB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdDsKK8KgwqDCoMKgwqDCoCB9CivCoMKgwqDCoMKg
wqAgcmV0dXJuIHhlbl9kb21haW47Cit9CisKK3N0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlw
ZXJfeGVuX2h2bSBfX2luaXRkYXRhID0gewogwqDCoMKgwqDCoMKgwqAgLm5hbWXCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAiWGVuIEhWTSIsCiDCoMKgwqDCoMKgwqDCoCAu
ZGV0ZWN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSB4ZW5fcGxhdGZvcm1faHZt
LAogwqDCoMKgwqDCoMKgwqAgLnR5cGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPSBYODZfSFlQRVJfWEVOX0hWTSwKQEAgLTI2OCw0ICsyOTIsNSBAQCBzdGF0aWMgX19pbml0
IHZvaWQgeGVuX2h2bV9ndWVzdF9sYXRlX2luaXQodm9pZCkKIMKgwqDCoMKgwqDCoMKgIC5pbml0
LmluaXRfbWVtX21hcHBpbmfCoCA9IHhlbl9odm1faW5pdF9tZW1fbWFwcGluZywKIMKgwqDCoMKg
wqDCoMKgIC5pbml0Lmd1ZXN0X2xhdGVfaW5pdMKgwqAgPSB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5p
dCwKIMKgwqDCoMKgwqDCoMKgIC5ydW50aW1lLnBpbl92Y3B1wqDCoMKgwqDCoMKgID0geGVuX3Bp
bl92Y3B1LAorwqDCoMKgwqDCoMKgIC5pZ25vcmVfbm9wdsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PSB0cnVlLAogwqB9OwoKClRoYW5rcwoKWmhlbnpob25nCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
