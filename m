Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD723C4C5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 09:18:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hab12-00069s-17; Tue, 11 Jun 2019 07:16:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=akz1=UK=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hab10-00069l-Qg
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 07:16:18 +0000
X-Inumbo-ID: cb51dd70-8c18-11e9-b657-0f9cad474d58
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb51dd70-8c18-11e9-b657-0f9cad474d58;
 Tue, 11 Jun 2019 07:16:13 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5B79LwX072975;
 Tue, 11 Jun 2019 07:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=4IOleGg9Uqz+nvO8uAi9fsGvGzbhyPcIQNBeE0G8uJ0=;
 b=ECF63Yb5VFHZ2yOAtsms3a9Xbl/usPVbxgwIp6VVZs07OsLrsz9kMWwNFOyQVlgIoUtn
 mYAoAcbuC5zF3vcu1lp6HB4CCam84Wl4JbCaMQFhiV1AwjGNDanwthTNHhZ5bqtqbqOj
 HeFzCLb9JU+7UhrJ6y3/Iy+hTDDxs2dkerw1tno479xKgVW0A2H2Krmf21Jd7IAeNoJP
 lMnyK13hMJmPCB3cce4CtigZ34D727A050BeXr0CUySi3cpxDdxLZdQDvQNvdFIiqw9E
 LB8G/tjY37KxpM3hhV070P+Q2psR/vUDUlO1eTblO6of8wRJiij2EMqavSVm/XmOi1yv 7g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2t04etk6e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 07:16:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5B7FG03093675;
 Tue, 11 Jun 2019 07:16:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2t024u8dmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 07:16:10 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5B7G9hu010454;
 Tue, 11 Jun 2019 07:16:09 GMT
Received: from [192.168.0.110] (/70.36.60.91)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 11 Jun 2019 00:16:08 -0700
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-2-ankur.a.arora@oracle.com>
 <4b472ec7-73c2-f7ff-53d5-fc0ac436b62c@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <199b7183-1872-7342-4283-af2925e780c5@oracle.com>
Date: Tue, 11 Jun 2019 00:16:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4b472ec7-73c2-f7ff-53d5-fc0ac436b62c@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906110050
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906110050
Subject: Re: [Xen-devel] [RFC PATCH 01/16] x86/xen: add xenhost_t interface
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wNi0wNyA4OjA0IGEubS4sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDkuMDUu
MTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+PiBBZGQgeGVuaG9zdF90IHdoaWNoIHdpbGwg
c2VydmUgYXMgYW4gYWJzdHJhY3Rpb24gb3ZlciBYZW4gaW50ZXJmYWNlcy4KPj4gSXQgY28tZXhp
c3RzIHdpdGggdGhlIFBWL0hWTS9QVkggYWJzdHJhY3Rpb25zICh4ODZfaW5pdCwgaHlwZXJ2aXNv
cl94ODYsCj4+IHB2X29wcyBldGMpIGFuZCBpcyBtZWFudCB0byBjYXB0dXJlIG1lY2hhbmlzbXMg
Zm9yIGNvbW11bmljYXRpb24gd2l0aAo+PiBYZW4gc28gd2UgY291bGQgaGF2ZSBkaWZmZXJlbnQg
dHlwZXMgb2YgdW5kZXJseWluZyBYZW46IHJlZ3VsYXIsIGxvY2FsLAo+PiBhbmQgbmVzdGVkLgo+
Pgo+PiBBbHNvIGFkZCB4ZW5ob3N0X3JlZ2lzdGVyKCkgYW5kIHN0dWIgcmVnaXN0cmF0aW9uIGlu
IHRoZSB2YXJpb3VzIGd1ZXN0Cj4+IHR5cGVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmt1ciBB
cm9yYSA8YW5rdXIuYS5hcm9yYUBvcmFjbGUuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC94ODYveGVu
L01ha2VmaWxlwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+PiDCoCBhcmNoL3g4Ni94ZW4vZW5saWdo
dGVuX2h2bS5jIHwgMTMgKysrKysKPj4gwqAgYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jwqAg
fCAxNiArKysrKysKPj4gwqAgYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdmguYyB8IDEyICsrKysr
Cj4+IMKgIGFyY2gveDg2L3hlbi94ZW5ob3N0LmPCoMKgwqDCoMKgwqAgfCA3NSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4+IMKgIGluY2x1ZGUveGVuL3hlbi5owqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMyArKwo+PiDCoCBpbmNsdWRlL3hlbi94ZW5ob3N0LmjCoMKgwqDCoMKgwqDC
oCB8IDk1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCA3IGZpbGVz
IGNoYW5nZWQsIDIxNSBpbnNlcnRpb25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L3g4Ni94ZW4veGVuaG9zdC5jCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3hlbi94
ZW5ob3N0LmgKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9NYWtlZmlsZSBiL2FyY2gv
eDg2L3hlbi9NYWtlZmlsZQo+PiBpbmRleCAwODRkZTc3YTEwOWUuLjU2NGI0ZGRkYmMxNSAxMDA2
NDQKPj4gLS0tIGEvYXJjaC94ODYveGVuL01ha2VmaWxlCj4+ICsrKyBiL2FyY2gveDg2L3hlbi9N
YWtlZmlsZQo+PiBAQCAtMTgsNiArMTgsNyBAQCBvYmotecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCArPSBtbXUubwo+PiDCoCBvYmotecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCArPSB0aW1lLm8KPj4gwqAgb2JqLXnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKz0g
Z3JhbnQtdGFibGUubwo+PiDCoCBvYmotecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAr
PSBzdXNwZW5kLm8KPj4gK29iai15wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IHhl
bmhvc3Qubwo+PiDCoCBvYmotJChDT05GSUdfWEVOX1BWSFZNKcKgwqDCoMKgwqDCoMKgICs9IGVu
bGlnaHRlbl9odm0ubwo+PiDCoCBvYmotJChDT05GSUdfWEVOX1BWSFZNKcKgwqDCoMKgwqDCoMKg
ICs9IG1tdV9odm0ubwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0u
YyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKPj4gaW5kZXggMGU3NTY0MmQ0MmEzLi4x
MDA0NTJmNGY0NGMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMK
Pj4gKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYwo+PiBAQCAtNSw2ICs1LDcgQEAK
Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L2tleGVjLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9tZW1i
bG9jay5oPgo+PiArI2luY2x1ZGUgPHhlbi94ZW5ob3N0Lmg+Cj4+IMKgICNpbmNsdWRlIDx4ZW4v
ZmVhdHVyZXMuaD4KPj4gwqAgI2luY2x1ZGUgPHhlbi9ldmVudHMuaD4KPj4gwqAgI2luY2x1ZGUg
PHhlbi9pbnRlcmZhY2UvbWVtb3J5Lmg+Cj4+IEBAIC04Miw2ICs4MywxMiBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgeGVuX2h2bV9pbml0X21lbV9tYXBwaW5nKHZvaWQpCj4+IMKgwqDCoMKgwqAgeGVu
X3ZjcHVfaW5mb19yZXNldCgwKTsKPj4gwqAgfQo+PiAreGVuaG9zdF9vcHNfdCB4aF9odm1fb3Bz
ID0gewo+PiArfTsKPj4gKwo+PiAreGVuaG9zdF9vcHNfdCB4aF9odm1fbmVzdGVkX29wcyA9IHsK
Pj4gK307Cj4+ICsKPj4gwqAgc3RhdGljIHZvaWQgX19pbml0IGluaXRfaHZtX3B2X2luZm8odm9p
ZCkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIGludCBtYWpvciwgbWlub3I7Cj4+IEBAIC0xNzksNiAr
MTg2LDEyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCB4ZW5faHZtX2d1ZXN0X2luaXQodm9pZCkKPj4g
wqAgewo+PiDCoMKgwqDCoMKgIGlmICh4ZW5fcHZfZG9tYWluKCkpCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm47Cj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogV2UgbmVlZCBvbmx5IHhl
bmhvc3RfcjEgZm9yIEhWTSBndWVzdHMgc2luY2UgdGhleSBjYW5ub3QgYmUKPj4gK8KgwqDCoMKg
ICogZHJpdmVyIGRvbWFpbiAoPykgb3IgZG9tMC4KPiAKPiBJIHRoaW5rIGV2ZW4gSFZNIGd1ZXN0
cyBjb3VsZCAoaW4gdGhlb3J5KSBiZSBkcml2ZXIgZG9tYWlucy4KPiAKPj4gK8KgwqDCoMKgICov
Cj4+ICvCoMKgwqAgaWYgKCF4ZW5fcHZoX2RvbWFpbigpKQo+PiArwqDCoMKgwqDCoMKgwqAgeGVu
aG9zdF9yZWdpc3Rlcih4ZW5ob3N0X3IxLCAmeGhfaHZtX29wcyk7Cj4+IMKgwqDCoMKgwqAgaW5p
dF9odm1fcHZfaW5mbygpOwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9w
di5jIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCj4+IGluZGV4IGM1NGE0OTNlMTM5YS4u
YmI2ZTgxMWMxNTI1IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMK
Pj4gKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCj4+IEBAIC0zNiw2ICszNiw3IEBA
Cj4+IMKgICNpbmNsdWRlIDx4ZW4veGVuLmg+Cj4+IMKgICNpbmNsdWRlIDx4ZW4vZXZlbnRzLmg+
Cj4+ICsjaW5jbHVkZSA8eGVuL3hlbmhvc3QuaD4KPj4gwqAgI2luY2x1ZGUgPHhlbi9pbnRlcmZh
Y2UveGVuLmg+Cj4+IMKgICNpbmNsdWRlIDx4ZW4vaW50ZXJmYWNlL3ZlcnNpb24uaD4KPj4gwqAg
I2luY2x1ZGUgPHhlbi9pbnRlcmZhY2UvcGh5c2Rldi5oPgo+PiBAQCAtMTE4OCw2ICsxMTg5LDEy
IEBAIHN0YXRpYyB2b2lkIF9faW5pdCAKPj4geGVuX2RvbTBfc2V0X2xlZ2FjeV9mZWF0dXJlcyh2
b2lkKQo+PiDCoMKgwqDCoMKgIHg4Nl9wbGF0Zm9ybS5sZWdhY3kucnRjID0gMTsKPj4gwqAgfQo+
PiAreGVuaG9zdF9vcHNfdCB4aF9wdl9vcHMgPSB7Cj4+ICt9Owo+PiArCj4+ICt4ZW5ob3N0X29w
c190IHhoX3B2X25lc3RlZF9vcHMgPSB7Cj4+ICt9Owo+PiArCj4+IMKgIC8qIEZpcnN0IEMgZnVu
Y3Rpb24gdG8gYmUgY2FsbGVkIG9uIFhlbiBib290ICovCj4+IMKgIGFzbWxpbmthZ2UgX192aXNp
YmxlIHZvaWQgX19pbml0IHhlbl9zdGFydF9rZXJuZWwodm9pZCkKPj4gwqAgewo+PiBAQCAtMTE5
OCw2ICsxMjA1LDE1IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgX19pbml0IAo+PiB4ZW5f
c3RhcnRfa2VybmVsKHZvaWQpCj4+IMKgwqDCoMKgwqAgaWYgKCF4ZW5fc3RhcnRfaW5mbykKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gK8KgwqDCoCB4ZW5ob3N0X3JlZ2lzdGVyKHhl
bmhvc3RfcjEsICZ4aF9wdl9vcHMpOwo+PiArCj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICog
RGV0ZWN0IGluIHNvbWUgaW1wbGVtZW50YXRpb24gZGVmaW5lZCBtYW5uZXIgd2hldGhlciB0aGlz
IGlzCj4+ICvCoMKgwqDCoCAqIG5lc3RlZCBvciBub3QuCj4+ICvCoMKgwqDCoCAqLwo+PiArwqDC
oMKgIGlmICh4ZW5fZHJpdmVyX2RvbWFpbigpICYmIHhlbl9uZXN0ZWQoKSkKPj4gK8KgwqDCoMKg
wqDCoMKgIHhlbmhvc3RfcmVnaXN0ZXIoeGVuaG9zdF9yMiwgJnhoX3B2X25lc3RlZF9vcHMpOwo+
IAo+IEkgZG9uJ3QgdGhpbmsgYSBkcml2ZXIgZG9tYWluIG90aGVyIHRoYW4gZG9tMCAia25vd3Mi
IHRoaXMgaW4gdGhlCj4gYmVnaW5uaW5nLiBJdCB3aWxsIG5lZWQgdG8gcmVnaXN0ZXIgeGVuaG9z
dF9yMgpSaWdodC4gTm8gcG9pbnQgaW4gbmVlZGxlc3NseSByZWdpc3RyYXRpbmcgYXMgeGVuaG9z
dF9yMiB3aXRob3V0Cm5lZWRpbmcgdG8gaGFuZGxlIGFueSB4ZW5ob3N0X3IyIGRldmljZXMuCgo+
ICBpbiBjYXNlIGl0IGxlYXJucyBhYm91dCBhIHB2IGRldmljZSBmcm9tIEwwIGh5cGVydmlzb3Iu
CldoYXQncyB0aGUgbWVjaGFuaXNtIHlvdSBhcmUgdGhpbmtpbmcgb2YsIGZvciB0aGlzPwpJJ20g
Z3Vlc3NpbmcgdGhpcyBQViBkZXZpY2Ugbm90aWZpY2F0aW9uIGNvdWxkIGFycml2ZSBhdCBhbgph
cmJpdHJhcnkgcG9pbnQgaW4gdGltZSBhZnRlciB0aGUgc3lzdGVtIGhhcyBib290ZWQuCgpUaGUg
ZWFybGllciByZWFzb24gZm9yIG15IGFzc3VtcHRpb24gdGhhdCB0aGUgZHJpdmVyLWRvbWFpbgp3
b3VsZCAia25vdyIgdGhpcyBhdCBib290LCB3YXMgYmVjYXVzZSBpdCBzZWVtZWQgdG8gbWUKdGhh
dCB3ZSB3b3VsZCBuZWVkIHRvIHNldHVwIGh5cGVyY2FsbC9zaGFyZWRfaW5mby92Y3B1X2luZm8u
CgpHaXZlbiB0aGF0IHdlIGRvbid0IG5lZWQgY3B1aWQvaHlwZXJjYWxsL3NoYXJlZF9pbmZvLCB0
aGUgcmVtYWluaW5nCmZldyBsb29rIGxpa2UgdGhleSBjb3VsZCBiZSBtYWRlIGR5bmFtaWNhbGx5
IGNhbGxhYmxlIHdpdGggYSBiaXQKb2YgcmVmYWN0b3Jpbmc6Ci0gdmNwdV9pbmZvOiB0aGUgcmVn
aXN0cmF0aW9uIGxvZ2ljICh4ZW5fdmNwdV9zZXR1cCgpIGFuZCBmcmllbmRzKQogICBzZWVtcyBz
dHJhaWdodC1mb3J3YXJkbHkgYWRhcHRhYmxlIHRvIGJlIGNhbGxlZCBkeW5hbWljYWxseSBmb3IK
ICAgeGVuaG9zdF9yMi4gUGxhY2VzIHdoZXJlIHdlIHRvdWNoIHRoZSB2Y3B1X2luZm8gYml0cyAo
eGVuX2lycV9vcHMpCiAgIGFsc28gc2VlbSBmaW5lLgotIGV2dGNobjogeGVuaG9zdF9yMiBzaG91
bGQgb25seSBuZWVkIGludGVyZG9tYWluIGV2dGNobnMsIHNvCiAgIHNob3VsZCBiZSBlYXN5IHRv
IGRlZmVyIHRvIHVudGlsIHdlIGdldCBhIHhlbmhvc3RfcjIgZGV2aWNlLgotIGdyYW50LXRhYmxl
L3hlbmJ1czogdGhlIHhlbmhvc3RfcjIgbG9naWMgKGluIHRoZSBjdXJyZW50IHBhdGNoc2V0KQog
ICBleHBlY3RzIHRvIGJlIGluaXRlZCBhdCBjb3JlX2luaXRjYWxsIGFuZCBwb3N0Y29yZV9pbml0
Y2FsbAogICByZXNwZWN0aXZlbHkuIEFnYWluLCBkb2Vzbid0Cgo+IAo+PiArCj4+IMKgwqDCoMKg
wqAgeGVuX2RvbWFpbl90eXBlID0gWEVOX1BWX0RPTUFJTjsKPj4gwqDCoMKgwqDCoCB4ZW5fc3Rh
cnRfZmxhZ3MgPSB4ZW5fc3RhcnRfaW5mby0+ZmxhZ3M7Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4
Ni94ZW4vZW5saWdodGVuX3B2aC5jIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdmguYwo+PiBp
bmRleCAzNWI3NTk5ZDJkMGIuLjgyNmMyOTZkMjdhMyAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYv
eGVuL2VubGlnaHRlbl9wdmguYwo+PiArKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2aC5j
Cj4+IEBAIC04LDYgKzgsNyBAQAo+PiDCoCAjaW5jbHVkZSA8YXNtL2U4MjAvYXBpLmg+Cj4+IMKg
ICNpbmNsdWRlIDx4ZW4veGVuLmg+Cj4+ICsjaW5jbHVkZSA8eGVuL3hlbmhvc3QuaD4KPj4gwqAg
I2luY2x1ZGUgPGFzbS94ZW4vaW50ZXJmYWNlLmg+Cj4+IMKgICNpbmNsdWRlIDxhc20veGVuL2h5
cGVyY2FsbC5oPgo+PiBAQCAtMjEsMTEgKzIyLDIyIEBACj4+IMKgwqAgKi8KPj4gwqAgYm9vbCB4
ZW5fcHZoIF9fYXR0cmlidXRlX18oKHNlY3Rpb24oIi5kYXRhIikpKSA9IDA7Cj4+ICtleHRlcm4g
eGVuaG9zdF9vcHNfdCB4aF9odm1fb3BzLCB4aF9odm1fbmVzdGVkX29wczsKPj4gKwo+PiDCoCB2
b2lkIF9faW5pdCB4ZW5fcHZoX2luaXQodm9pZCkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHUzMiBt
c3I7Cj4+IMKgwqDCoMKgwqAgdTY0IHBmbjsKPj4gK8KgwqDCoCB4ZW5ob3N0X3JlZ2lzdGVyKHhl
bmhvc3RfcjEsICZ4aF9odm1fb3BzKTsKPj4gKwo+PiArwqDCoMKgIC8qCj4+ICvCoMKgwqDCoCAq
IERldGVjdCBpbiBzb21lIGltcGxlbWVudGF0aW9uIGRlZmluZWQgbWFubmVyIHdoZXRoZXIgdGhp
cyBpcwo+PiArwqDCoMKgwqAgKiBuZXN0ZWQgb3Igbm90Lgo+PiArwqDCoMKgwqAgKi8KPj4gK8Kg
wqDCoCBpZiAoeGVuX2RyaXZlcl9kb21haW4oKSAmJiB4ZW5fbmVzdGVkKCkpCj4+ICvCoMKgwqDC
oMKgwqDCoCB4ZW5ob3N0X3JlZ2lzdGVyKHhlbmhvc3RfcjIsICZ4aF9odm1fbmVzdGVkX29wcyk7
Cj4+ICsKPj4gwqDCoMKgwqDCoCB4ZW5fcHZoID0gMTsKPj4gwqDCoMKgwqDCoCB4ZW5fc3RhcnRf
ZmxhZ3MgPSBwdmhfc3RhcnRfaW5mby5mbGFnczsKPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hl
bi94ZW5ob3N0LmMgYi9hcmNoL3g4Ni94ZW4veGVuaG9zdC5jCj4+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uY2E5MGFjZDc2ODdlCj4+IC0tLSAvZGV2L251bGwK
Pj4gKysrIGIvYXJjaC94ODYveGVuL3hlbmhvc3QuYwo+PiBAQCAtMCwwICsxLDc1IEBACj4+ICsj
aW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9idWcuaD4KPj4gKyNp
bmNsdWRlIDx4ZW4veGVuLmg+Cj4+ICsjaW5jbHVkZSA8eGVuL3hlbmhvc3QuaD4KPj4gKwo+PiAr
eGVuaG9zdF90IHhlbmhvc3RzWzJdOwo+PiArLyoKPj4gKyAqIHhoX2RlZmF1bHQ6IGludGVyZmFj
ZSB0byB0aGUgcmVndWxhciBoeXBlcnZpc29yLiB4ZW5ob3N0X3R5cGUgaXMgCj4+IHhlbmhvc3Rf
cjAKPj4gKyAqIG9yIHhlbmhvc3RfcjEuCj4+ICsgKgo+PiArICogeGhfcmVtb3RlOiBpbnRlcmZh
Y2UgdG8gcmVtb3RlIGh5cGVydmlzb3IuIE5lZWRlZCBmb3IgUFYgZHJpdmVyIAo+PiBzdXBwb3J0
IG9uCj4+ICsgKiBMMS1kb20wL2RyaXZlci1kb21haW4gZm9yIG5lc3RlZCBYZW4uIHhlbmhvc3Rf
dHlwZSBpcyB4ZW5ob3N0X3IyLgo+PiArICovCj4+ICt4ZW5ob3N0X3QgKnhoX2RlZmF1bHQgPSAo
eGVuaG9zdF90ICopICZ4ZW5ob3N0c1swXTsKPj4gK3hlbmhvc3RfdCAqeGhfcmVtb3RlID0gKHhl
bmhvc3RfdCAqKSAmeGVuaG9zdHNbMV07Cj4+ICsKPj4gKy8qCj4+ICsgKiBFeHBvcnRlZCBmb3Ig
dXNlIG9mIGZvcl9lYWNoX3hlbmhvc3QoKS4KPj4gKyAqLwo+PiArRVhQT1JUX1NZTUJPTF9HUEwo
eGVuaG9zdHMpOwo+PiArCj4+ICsvKgo+PiArICogU29tZSBwbGFjZXMgcmVmZXIgZGlyZWN0bHkg
dG8gYSBzcGVjaWZpYyB0eXBlIG9mIHhlbmhvc3QuCj4+ICsgKiBUaGlzIG1pZ2h0IGJlIGJldHRl
ciBhcyBhIG1hY3JvIHRob3VnaC4KPj4gKyAqLwo+PiArRVhQT1JUX1NZTUJPTF9HUEwoeGhfZGVm
YXVsdCk7Cj4+ICtFWFBPUlRfU1lNQk9MX0dQTCh4aF9yZW1vdGUpOwo+PiArCj4+ICt2b2lkIHhl
bmhvc3RfcmVnaXN0ZXIoZW51bSB4ZW5ob3N0X3R5cGUgdHlwZSwgeGVuaG9zdF9vcHNfdCAqb3Bz
KQo+PiArewo+PiArwqDCoMKgIHN3aXRjaCAodHlwZSkgewo+PiArwqDCoMKgwqDCoMKgwqAgY2Fz
ZSB4ZW5ob3N0X3IwOgo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSB4ZW5ob3N0X3IxOgo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBCVUdfT04oeGhfZGVmYXVsdC0+dHlwZSAhPSB4ZW5ob3N0X2lu
dmFsaWQpOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhoX2RlZmF1bHQtPnR5cGUg
PSB0eXBlOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4aF9kZWZhdWx0LT5vcHMgPSBvcHM7
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKgwqDCoMKgwqAgY2Fz
ZSB4ZW5ob3N0X3IyOgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCVUdfT04oeGhfcmVtb3Rl
LT50eXBlICE9IHhlbmhvc3RfaW52YWxpZCk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLyoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFdlIHNob3VsZCBoYXZlIGEgZGVm
YXVsdCB4ZW5ob3N0IGJ5IHRoZQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdGltZSB4
aF9yZW1vdGUgaXMgcmVnaXN0ZXJlZC4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCVUdfT04oIXhoX2RlZmF1bHQpOwo+PiArCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhoX3JlbW90ZS0+dHlwZSA9IHR5cGU7Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHhoX3JlbW90ZS0+b3BzID0gb3BzOwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoMKgwqDCoMKgIGRlZmF1bHQ6Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEJVRygpOwo+PiArwqDCoMKgIH0KPj4gK30KPj4gKwo+PiArLyoKPj4gKyAq
IF9feGVuaG9zdF91bnJlZ2lzdGVyOiBleHBlY3RlZCB0byBiZSBjYWxsZWQgb25seSBpZiB0aGVy
ZSdzIGFuCj4+ICsgKiBlcnJvciBlYXJseSBpbiB0aGUgaW5pdC4KPj4gKyAqLwo+PiArdm9pZCBf
X3hlbmhvc3RfdW5yZWdpc3RlcihlbnVtIHhlbmhvc3RfdHlwZSB0eXBlKQo+PiArewo+PiArwqDC
oMKgIHN3aXRjaCAodHlwZSkgewo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSB4ZW5ob3N0X3IwOgo+
PiArwqDCoMKgwqDCoMKgwqAgY2FzZSB4ZW5ob3N0X3IxOgo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB4aF9kZWZhdWx0LT50eXBlID0geGVuaG9zdF9pbnZhbGlkOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB4aF9kZWZhdWx0LT5vcHMgPSBOVUxMOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBicmVhazsKPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgeGVuaG9zdF9yMjoKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgeGhfcmVtb3RlLT50eXBlID0geGVuaG9zdF9pbnZhbGlkOwo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4aF9yZW1vdGUtPm9wcyA9IE5VTEw7Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgQlVHKCk7Cj4+ICvCoMKgwqAgfQo+PiArfQo+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS94ZW4veGVuLmggYi9pbmNsdWRlL3hlbi94ZW4uaAo+PiBpbmRleCAwZTIx
NTY3ODZhZDIuLjU0MGRiODQ1OTUzNiAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS94ZW4veGVuLmgK
Pj4gKysrIGIvaW5jbHVkZS94ZW4veGVuLmgKPj4gQEAgLTQyLDYgKzQyLDkgQEAgZXh0ZXJuIHN0
cnVjdCBodm1fc3RhcnRfaW5mbyBwdmhfc3RhcnRfaW5mbzsKPj4gwqAgI2RlZmluZSB4ZW5faW5p
dGlhbF9kb21haW4oKcKgwqDCoCAoMCkKPj4gwqAgI2VuZGlmwqDCoMKgIC8qIENPTkZJR19YRU5f
RE9NMCAqLwo+PiArI2RlZmluZSB4ZW5fZHJpdmVyX2RvbWFpbigpwqDCoMKgIHhlbl9pbml0aWFs
X2RvbWFpbigpCj4+ICsjZGVmaW5lIHhlbl9uZXN0ZWQoKcKgwqDCoCAwCj4+ICsKPj4gwqAgc3Ry
dWN0IGJpb192ZWM7Cj4+IMKgIGJvb2wgeGVuX2Jpb3ZlY19waHlzX21lcmdlYWJsZShjb25zdCBz
dHJ1Y3QgYmlvX3ZlYyAqdmVjMSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBi
aW9fdmVjICp2ZWMyKTsKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL3hlbmhvc3QuaCBiL2lu
Y2x1ZGUveGVuL3hlbmhvc3QuaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLmE1OGU4ODNmMTQ0ZQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2luY2x1ZGUv
eGVuL3hlbmhvc3QuaAo+PiBAQCAtMCwwICsxLDk1IEBACj4+ICsjaWZuZGVmIF9fWEVOSE9TVF9I
Cj4+ICsjZGVmaW5lIF9fWEVOSE9TVF9ICj4+ICsKPj4gKy8qCj4+ICsgKiBYZW5ob3N0IGFic3Ry
YWN0cyBvdXQgdGhlIFhlbiBpbnRlcmZhY2UuIEl0IGNvLWV4aXN0cyB3aXRoIHRoZSAKPj4gUFYv
SFZNL1BWSAo+PiArICogYWJzdHJhY3Rpb25zICh4ODZfaW5pdCwgaHlwZXJ2aXNvcl94ODYsIHB2
X29wcyBldGMpIGFuZCBpcyBtZWFudCB0bwo+PiArICogZXhwb3NlIG9wcyBmb3IgY29tbXVuaWNh
dGlvbiBiZXR3ZWVuIHRoZSBndWVzdCBhbmQgWGVuIChoeXBlcmNhbGwsIAo+PiBjcHVpZCwKPj4g
KyAqIHNoYXJlZF9pbmZvL3ZjcHVfaW5mbywgZXZ0Y2huLCBncmFudC10YWJsZSBhbmQgb24gdG9w
IG9mIHRob3NlLCAKPj4geGVuYnVzLCBiYWxsb29uaW5nKSwKPj4gKyAqIHNvIHRoZXNlIGNvdWxk
IGRpZmZlciBiYXNlZCBvbiB0aGUga2luZCBvZiB1bmRlcmx5aW5nIFhlbjogCj4+IHJlZ3VsYXIs
IGxvY2FsLAo+PiArICogYW5kIG5lc3RlZC4KPj4gKyAqCj4+ICsgKiBBbnkgY2FsbC1zaXRlcyB3
aGljaCBpbml0aWF0ZSBjb21tdW5pY2F0aW9uIHdpdGggdGhlIGh5cGVydmlzb3IgdGFrZQo+PiAr
ICogeGVuaG9zdF90ICogYXMgYSBwYXJhbWV0ZXIgYW5kIHVzZSB0aGUgYXBwcm9wcmlhdGUgeGVu
aG9zdCBpbnRlcmZhY2UuCj4+ICsgKgo+PiArICogTm90ZSwgdGhhdCB0aGUgaW5pdCBmb3IgdGhl
IG5lc3RlZCB4ZW5ob3N0IChpbiB0aGUgbmVzdGVkIGRvbTAgY2FzZSwKPj4gKyAqIHRoZXJlIGFy
ZSB0d28pIGhhcHBlbnMgZm9yIGVhY2ggb3BlcmF0aW9uIGFsb25nc2lkZSB0aGUgZGVmYXVsdCAK
Pj4geGVuaG9zdAo+PiArICogKHdoaWNoIHJlbWFpbnMgc2ltaWxhciB0byB0aGUgb25lIG5vdykg
YW5kIGlzIG5vdCBkZWZlcnJlZCBmb3IgbGF0ZXIuCj4+ICsgKiBUaGlzIGFsbG93cyB1cyB0byBw
aWdneS1iYWNrIG9uIHRoZSBub24tdHJpdmlhbCBzZXF1ZW5jaW5nLCAKPj4gaW50ZXItbG9ja2lu
Zwo+PiArICogbG9naWMgaW4gdGhlIGluaXQgb2YgdGhlIGRlZmF1bHQgeGVuaG9zdC4KPj4gKyAq
Lwo+PiArCj4+ICsvKgo+PiArICogeGVuaG9zdF90eXBlOiBzcGVjaWZpZXMgdGhlIGNvbnRyb2xs
aW5nIFhlbiBpbnRlcmZhY2UuIFRoZSBub3RhdGlvbiwKPj4gKyAqIHhlbmhvc3RfcjAsIHhlbmhv
c3RfcjEsIHhlbmhvc3RfcjIgaXMgbWVhbnQgdG8gaW52b2tlIGh5cGVydmlzb3IgCj4+IGRpc3Rh
bmNlCj4+ICsgKiBmcm9tIHRoZSBndWVzdC4KPiAKPiBUaGlzIG5hbWluZyBtYWtlcyBpdCBoYXJk
IHRvIGNvcnJlbGF0ZSB0aGUgZGlmZmVyZW50IHRoaW5nczogSW4gdGhlCj4gbmVzdGVkIGNhc2Ug
eGVuaG9zdF9yMiBtZWFucyBMMCBoeXBlcnZpc29yLCBzYW1lIGFzIGluIHRoZSBub24tbmVzdGVk
Cj4gY2FzZSB4ZW5ob3N0X3IxIGRvZXMuCkFncmVlZC4KCj4gCj4gV2hhdCBhYm91dDogeGVuaG9z
dF9sb2NhbCAoaW5zdGVhZCB4ZW5ob3N0X3IwKSwgeGVuaG9zdF9kaXJlY3QgKGluc3RlYWQKPiB4
ZW5ob3N0X3IxKSBhbmQgeGVuaG9zdF9uZXN0ZWQgKGluc3RlYWQgeGVuaG9zdF9yMikuIE9yIHlv
dSB1c2UgYW4KPiBpbnRlZ2VyIHRvIGRlbm90ZSB0aGUgZGlzdGFuY2UgZW5hYmxpbmcgZXZlbiBk
ZWVwZXIgbmVzdGluZyBsZXZlbHMgKGF0Cj4gbGVhc3QgaW4gdGhlb3J5KS4KVGhlc2UgYXJlIGNs
ZWFyZXIuIFdpbGwgY2hhbmdlLgoKPiAKPj4gKyAqCj4+ICsgKiBOb3RlIHRoYXQgdGhlIGRpc3Rh
bmNlIGlzIHJlbGF0aXZlLCBhbmQgc28gZG9lcyBub3QgaWRlbnRpZnkgYSAKPj4gc3BlY2lmaWMK
Pj4gKyAqIGh5cGVydmlzb3IsIGp1c3QgdGhlIHJvbGUgcGxheWVkIGJ5IHRoZSBpbnRlcmZhY2U6
IHNvLCBpbnN0YW5jZSAKPj4gZm9yIEwwLWd1ZXN0Cj4+ICsgKiB4ZW5ob3N0X3IxIHdvdWxkIGJl
IEwwLVhlbiBhbmQgZm9yIGFuIEwxLWd1ZXN0LCBMMS1YZW4uCj4+ICsgKi8KPj4gK2VudW0geGVu
aG9zdF90eXBlIHsKPj4gK8KgwqDCoCB4ZW5ob3N0X2ludmFsaWQgPSAwLAo+PiArwqDCoMKgIC8q
Cj4+ICvCoMKgwqDCoCAqIHhlbmhvc3RfcjE6IHRoZSBndWVzdCdzIGZyb250ZW5kIG9yIGJhY2tl
bmQgZHJpdmVycyB0YWxraW5nCj4+ICvCoMKgwqDCoCAqIHRvIGEgaHlwZXJ2aXNvciBvbmUgbGV2
ZWwgcmVtb3ZlZC4KPj4gK8KgwqDCoMKgICogVGhpcyBpcyB0aGUgb3JkaW5hcnksIG5vbi1uZXN0
ZWQgY29uZmlndXJhdGlvbiBhcyB3ZWxsIGFzIGZvciB0aGUKPj4gK8KgwqDCoMKgICogdHlwaWNh
bCBuZXN0ZWQgZnJvbnRlbmRzIGFuZCBiYWNrZW5kcy4KPj4gK8KgwqDCoMKgICoKPj4gK8KgwqDC
oMKgICogVGhlIGNvcnJlc3BvbmRpbmcgeGVuaG9zdF90IHdvdWxkIGNvbnRpbnVlIHRvIHVzZSB0
aGUgY3VycmVudAo+PiArwqDCoMKgwqAgKiBpbnRlcmZhY2VzLCB2aWEgYSByZWRpcmVjdGlvbiBs
YXllci4KPj4gK8KgwqDCoMKgICovCj4+ICvCoMKgwqAgeGVuaG9zdF9yMSwKPj4gKwo+PiArwqDC
oMKgIC8qCj4+ICvCoMKgwqDCoCAqIHhlbmhvc3RfcjI6IGZyb250ZW5kIGRyaXZlcnMgY29tbXVu
aWNhdGluZyB3aXRoIGEgaHlwZXJ2aXNvciB0d28KPj4gK8KgwqDCoMKgICogbGV2ZWxzIHJlbW92
ZWQ6IHNvIEwxLWRvbTAtZnJvbnRlbmRzIGNvbW11bmljYXRpbmcgd2l0aCBMMC1YZW4uCj4+ICvC
oMKgwqDCoCAqCj4+ICvCoMKgwqDCoCAqIFRoaXMgaXMgdGhlIG5lc3RlZC1YZW4gY29uZmlndXJh
dGlvbjogTDEtZG9tMC1mcm9udGVuZCBkcml2ZXJzIAo+PiBjYW4KPj4gK8KgwqDCoMKgICogbm93
IHRhbGsgdG8gTDAtZG9tMC1iYWNrZW5kIGRyaXZlcnMgdmlhIGEgc2VwYXJhdGUgeGVuaG9zdF90
Lgo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCB4ZW5ob3N0X3IyLAo+PiArCj4+ICvCoMKgwqAg
LyoKPj4gK8KgwqDCoMKgICogTG9jYWwvQ28tbG9jYXRlZCBjYXNlOiBiYWNrZW5kIGRyaXZlcnMg
bm93IHJ1biBpbiB0aGUgc2FtZSAKPj4gYWRkcmVzcwo+PiArwqDCoMKgwqAgKiBzcGFjZSBhcyB0
aGUgaHlwZXJ2aXNvci4gVGhlIGRyaXZlciBtb2RlbCByZW1haW5zIHNhbWUgYXMKPj4gK8KgwqDC
oMKgICogeGVuaG9zdF9yMSwgYnV0IHdpdGggc2xpZ2h0bHkgZGlmZmVyZW50IGludGVyZmFjZXMu
Cj4+ICvCoMKgwqDCoCAqCj4+ICvCoMKgwqDCoCAqIEFueSBmcm9udGVuZCBndWVzdHMgb2YgdGhp
cyBoeXBlcnZpc29yIHdpbGwgY29udGludWUgdG8gYmUKPj4gK8KgwqDCoMKgICogeGVuaG9zdF9y
MS4KPj4gK8KgwqDCoMKgICovCj4+ICvCoMKgwqAgeGVuaG9zdF9yMCwKPj4gK307Cj4+ICsKPj4g
K3N0cnVjdCB4ZW5ob3N0X29wczsKPj4gKwo+PiArdHlwZWRlZiBzdHJ1Y3Qgewo+PiArwqDCoMKg
IGVudW0geGVuaG9zdF90eXBlIHR5cGU7Cj4+ICsKPj4gK8KgwqDCoCBzdHJ1Y3QgeGVuaG9zdF9v
cHMgKm9wczsKPj4gK30geGVuaG9zdF90Owo+PiArCj4+ICt0eXBlZGVmIHN0cnVjdCB4ZW5ob3N0
X29wcyB7Cj4+ICt9IHhlbmhvc3Rfb3BzX3Q7Cj4+ICsKPj4gK2V4dGVybiB4ZW5ob3N0X3QgKnho
X2RlZmF1bHQsICp4aF9yZW1vdGU7Cj4+ICtleHRlcm4geGVuaG9zdF90IHhlbmhvc3RzWzJdOwo+
IAo+IFVzZSBhIG1heCBuZXN0aW5nIGxldmVsIGRlZmluZSBoZXJlIGFuZCAuLi4KPiAKPj4gKwo+
PiArLyoKPj4gKyAqIHhlbmhvc3RfcmVnaXN0ZXIoKTogaXMgY2FsbGVkIGVhcmx5IGluIHRoZSBn
dWVzdCdzIHhlbi1pbml0LCBhZnRlciAKPj4gaXQgZGV0ZWN0cwo+PiArICogaW4gc29tZSBpbXBs
ZW1lbnRhdGlvbiBkZWZpbmVkIG1hbm5lciB3aGF0IGtpbmQgb2YgdW5kZXJseWluZyAKPj4geGVu
aG9zdCBvcgo+PiArICogeGVuaG9zdHMgZXhpc3QuCj4+ICsgKiBTcGVjaWZpZXMgdGhlIHR5cGUg
b2YgeGVuaG9zdCBiZWluZyByZWdpc3RlcmVkIGFuZCB0aGUgb3BzIGZvciB0aGF0Lgo+PiArICov
Cj4+ICt2b2lkIHhlbmhvc3RfcmVnaXN0ZXIoZW51bSB4ZW5ob3N0X3R5cGUgdHlwZSwgeGVuaG9z
dF9vcHNfdCAqb3BzKTsKPj4gK3ZvaWQgX194ZW5ob3N0X3VucmVnaXN0ZXIoZW51bSB4ZW5ob3N0
X3R5cGUgdHlwZSk7Cj4+ICsKPj4gKwo+PiArLyoKPj4gKyAqIENvbnZvbHV0ZWQgaW50ZXJmYWNl
IHNvIHdlIGNhbiBkbyB0aGlzIHdpdGhvdXQgYWRkaW5nIGEgbG9vcCBjb3VudGVyLgo+PiArICov
Cj4+ICsjZGVmaW5lIGZvcl9lYWNoX3hlbmhvc3QoeGgpIFwKPj4gK8KgwqDCoCBmb3IgKCh4aCkg
PSAoeGVuaG9zdF90ICoqKSAmeGVuaG9zdHNbMF07wqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDCoMKg
ICgoKHhoKSAtICh4ZW5ob3N0X3QgKiopJnhlbmhvc3RzKSA8IDIpICYmICgqeGgpLT50eXBlICE9
IAo+PiB4ZW5ob3N0X2ludmFsaWQ7ICh4aCkrKykKPiAKPiAuLi4gaGVyZSwgdG9vLgpTdXJlLgoK
QW5rdXIKCj4gCj4+ICsKPj4gKyNlbmRpZiAvKiBfX1hFTkhPU1RfSCAqLwo+Pgo+IAo+IAo+IEp1
ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
