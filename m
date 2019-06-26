Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C85FB564FE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 11:01:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg3k7-0007LF-La; Wed, 26 Jun 2019 08:57:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qEDO=UZ=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hg3k6-0007LA-F8
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 08:57:26 +0000
X-Inumbo-ID: 6ab41074-97f0-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6ab41074-97f0-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 08:57:25 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5Q8rcil116343;
 Wed, 26 Jun 2019 08:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=YaPgtF90EswJlH1fU2fyf0Fw+Nizkl5Lc5ZtnhAjuMo=;
 b=tUt4+K4OZiE1xDn+pzxpnbMMxlWPd0j/vqTiql26fy29EPe8ATgpA6ym01r3a5DhOb9r
 SdOvCqRM9JmpLvDo1w+uLC0CoUk9VR37S/FBNpejn3haiwftEDXi5o9p5A+QqnP5tmBN
 JzWWFG70odwuvcMIhvKEFQRVmMqw5F5ZFTOqFzEYoYDJb30//yWHyJoPjIgP2TWhLJv5
 wKFDfFa9cG3FBAo/SRDrRPGLOd+Azlgc5d7cVDHPZRgx1xwfFMB+9tWXb3aP4is1s9wy
 WSjxe4DAFO4uZQqTDogHQpjPp6t7N41yd8vK1FlxK+PRZm53AEbSNKc6YcJP0bMtTcZF +w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2t9c9ps0wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 08:56:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5Q8tVIC005650;
 Wed, 26 Jun 2019 08:56:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2t9acck9x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 08:56:59 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5Q8upCn025439;
 Wed, 26 Jun 2019 08:56:51 GMT
Received: from [10.191.16.53] (/10.191.16.53)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 26 Jun 2019 01:56:51 -0700
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
References: <1561377779-28036-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561377779-28036-6-git-send-email-zhenzhong.duan@oracle.com>
 <99a28880-c2bf-e328-ee52-afc782af3b74@suse.com>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Organization: Oracle Corporation
Message-ID: <f5478215-0e1a-8a2a-19ec-378ac5849936@oracle.com>
Date: Wed, 26 Jun 2019 16:56:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <99a28880-c2bf-e328-ee52-afc782af3b74@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906260109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260109
Subject: Re: [Xen-devel] [PATCH v2 5/7] x86/xen: nopv parameter support for
 HVM guest
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
Cc: sstabellini@kernel.org, peterz@infradead.org, mingo@kernel.org,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 srinivas.eeda@oracle.com, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIwMTkvNi8yNSAyMDozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyNC4wNi4xOSAx
NDowMiwgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4+IFBWSCBndWVzdCBuZWVkcyBQViBleHRlbnRp
b25zIHRvIHdvcmssIHNvIG5vcHYgcGFyYW1ldGVyIGlzIGlnbm9yZWQKPj4gZm9yIFBWSCBidXQg
bm90IGZvciBIVk0gZ3Vlc3QuCj4+Cj4+IEluIG9yZGVyIGZvciBub3B2IHBhcmFtZXRlciB0byB0
YWtlIGVmZmVjdCBmb3IgSFZNIGd1ZXN0LCB3ZSBuZWVkIHRvCj4+IGRpc3Rpbmd1aXNoIGJldHdl
ZW4gUFZIIGFuZCBIVk0gZ3Vlc3QgZWFybHkgaW4gaHlwZXJ2aXNvciBkZXRlY3Rpb24KPj4gY29k
ZS4gQnkgbW92aW5nIHRoZSBkZXRlY3Rpb24gb2YgUFZIIGluIHhlbl9wbGF0Zm9ybV9odm0oKSwK
Pj4geGVuX3B2aF9kb21haW4oKSBjb3VsZCBiZSB1c2VkIGZvciB0aGF0IHB1cnBvc2UuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29t
Pgo+PiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPj4g
Q2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gQ2M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGds
eEBsaW51dHJvbml4LmRlPgo+PiBDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+Cj4+
IENjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4KPj4gQ2M6IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwo+PiAtLS0KPj4gwqAgYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0u
YyB8IDE4ICsrKysrKysrKysrKy0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9l
bmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCj4+IGluZGV4IDdm
Y2I0ZWEuLjI2OTM5ZTcgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZt
LmMKPj4gKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYwo+PiBAQCAtMjUsNiArMjUs
NyBAQAo+PiDCoCAjaW5jbHVkZSAibW11LmgiCj4+IMKgICNpbmNsdWRlICJzbXAuaCIKPj4gwqAg
K2V4dGVybiBib29sIG5vcHY7Cj4+IMKgIHN0YXRpYyB1bnNpZ25lZCBsb25nIHNoYXJlZF9pbmZv
X3BmbjsKPj4gwqAgwqAgdm9pZCB4ZW5faHZtX2luaXRfc2hhcmVkX2luZm8odm9pZCkKPj4gQEAg
LTIyNiwyMCArMjI3LDI0IEBAIHN0YXRpYyB1aW50MzJfdCBfX2luaXQgeGVuX3BsYXRmb3JtX2h2
bSh2b2lkKQo+PiDCoMKgwqDCoMKgIGlmICh4ZW5fcHZfZG9tYWluKCkpCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gMDsKPj4gwqAgKyNpZmRlZiBDT05GSUdfWEVOX1BWSAo+PiArwqDCoMKg
IC8qIFRlc3QgZm9yIFBWSCBkb21haW4gKFBWSCBib290IHBhdGggdGFrZW4gb3ZlcnJpZGVzIEFD
UEkgCj4+IGZsYWdzKS4gKi8KPj4gK8KgwqDCoCBpZiAoIXg4Nl9wbGF0Zm9ybS5sZWdhY3kucnRj
ICYmIHg4Nl9wbGF0Zm9ybS5sZWdhY3kubm9fdmdhKQo+PiArwqDCoMKgwqDCoMKgwqAgeGVuX3B2
aCA9IHRydWU7Cj4KPiBTb3JyeSwgdGhpcyB3b24ndCB3b3JrLCBhcyBBQ1BJIHRhYmxlcyBhcmUg
c2Nhbm5lZCBvbmx5IHNvbWUgdGltZSBsYXRlci4KSG1tLCByaWdodC4gVGhhbmtzIGZvciBwb2lu
dCBvdXQuCj4KPiBZb3UgY2FuIHRlc3QgZm9yIHhlbl9wdmggYmVpbmcgdHJ1ZSBoZXJlIChmb3Ig
dGhlIGNhc2Ugd2hlcmUgdGhlIGd1ZXN0Cj4gaGFzIGJlZW4gYm9vdGVkIHZpYSB0aGUgWGVuLVBW
SCBib290IGVudHJ5KSBhbmQgaGFuZGxlIHRoYXQgY2FzZSwgYnV0Cj4gdGhlIGNhc2Ugb2YgYSBQ
VkggZ3Vlc3Qgc3RhcnRlZCB2aWEgdGhlIG5vcm1hbCBib290IGVudHJ5IChsaWtlIHZpYQo+IGdy
dWIyKSBhbmQgbm9wdiBzcGVjaWZpZWQgaXMgZGlmZmljdWx0LiBUaGUgb25seSBpZGVhIEkgaGF2
ZSByaWdodCBub3cKPiB3b3VsZCBiZSB0byB1c2UgYW5vdGhlciBzdHJ1Y3QgaHlwZXJ2aXNvcl94
ODYgZm9yIHRoYXQgY2FzZSB3aGljaCB3aWxsCj4gb25seSBiZSB1c2VkIGZvciBYZW4gSFZNL1BW
SCBfYW5kXyBub3B2IHNwZWNpZmllZC4gSXQgc2hvdWxkIGJlIGEgY29weQo+IG9mIHRoZSBiYXJl
IG1ldGFsIHZhcmlhbnQsIGJ1dCBhIHNwZWNpYWwgZ3Vlc3RfbGF0ZV9pbml0IG1lbWJlciBpc3N1
aW5nCj4gYSBiaWcgZmF0IHdhcm5pbmcgaW4gY2FzZSBQVkggaXMgYmVpbmcgZGV0ZWN0ZWQuCgpB
ZnRlciB0aGF0IHdhcm5pbmcsIEkgZ3Vlc3MgUFZIIHdpbGwgcnVuIGludG8gaGFuZyBmaW5hbGx5
PyBJZiBpdCdzIAp0cnVlLCBCVUcoKSBpcyBiZXR0ZXI/CgpBZGRpbmcgYW5vdGhlciBoeXBlcnZp
c29yX3g4NiBpcyBhIGJpdCByZWR1bmRhbnQsIEkgdGhpbmsgb2YgYmVsb3cgY2hhbmdlLgoKSSds
bCB0ZXN0IGl0IHRvbW9ycm93LiBCdXQgYXBwcmVjaWF0ZSB5b3VyIHN1Z2dlc3Rpb24gd2hldGhl
ciBpdCdzIApmZWFzaWJsZS4gVGhhbmtzCgotLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2
bS5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKQEAgLTI1LDYgKzI1LDcgQEAK
IMKgI2luY2x1ZGUgIm1tdS5oIgogwqAjaW5jbHVkZSAic21wLmgiCgorZXh0ZXJuIGJvb2wgbm9w
djsKIMKgc3RhdGljIHVuc2lnbmVkIGxvbmcgc2hhcmVkX2luZm9fcGZuOwoKIMKgdm9pZCB4ZW5f
aHZtX2luaXRfc2hhcmVkX2luZm8odm9pZCkKQEAgLTIyMSwxMSArMjIyLDM3IEBAIGJvb2wgX19p
bml0IHhlbl9odm1fbmVlZF9sYXBpYyh2b2lkKQogwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7
CiDCoH0KCitzdGF0aWMgX19pbml0IHZvaWQgeGVuX2h2bV9ub3B2X2d1ZXN0X2xhdGVfaW5pdCh2
b2lkKQoreworI2lmZGVmIENPTkZJR19YRU5fUFZICivCoMKgwqDCoMKgwqAgaWYgKHg4Nl9wbGF0
Zm9ybS5sZWdhY3kucnRjIHx8ICF4ODZfcGxhdGZvcm0ubGVnYWN5Lm5vX3ZnYSkKK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOworCivCoMKgwqDCoMKgwqAgLyogUFZIIGRldGVj
dGVkLiAqLworwqDCoMKgwqDCoMKgIHhlbl9wdmggPSB0cnVlOworCivCoMKgwqDCoMKgwqAgcHJp
bnRrKEtFUk5fQ1JJVCAibm9wdiBwYXJhbWV0ZXIgaXNuJ3Qgc3VwcG9ydGVkIGluIFBWSCBndWVz
dFxuIik7CivCoMKgwqDCoMKgwqAgQlVHKCk7CisjZW5kaWYKK30KKworCiDCoHN0YXRpYyB1aW50
MzJfdCBfX2luaXQgeGVuX3BsYXRmb3JtX2h2bSh2b2lkKQogwqB7CiDCoMKgwqDCoMKgwqDCoCBp
ZiAoeGVuX3B2X2RvbWFpbigpKQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAwOwoKK8KgwqDCoMKgwqDCoCBpZiAoeGVuX3B2aF9kb21haW4oKSAmJiBub3B2KQorwqDCoMKg
wqDCoMKgIHsKK8KgwqDCoMKgwqDCoCAvKiBndWVzdCBib290aW5nIHZpYSB0aGUgWGVuLVBWSCBi
b290IGVudHJ5IGdvZXMgaGVyZSAqLworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmlu
dGsoS0VSTl9JTkZPICJub3B2IHBhcmFtZXRlciBpcyBpZ25vcmVkIGluIFBWSCAKZ3Vlc3RcbiIp
OworwqDCoMKgwqDCoMKgIH0KK8KgwqDCoMKgwqDCoCBlbHNlIGlmIChub3B2KQorwqDCoMKgwqDC
oMKgIHsKK8KgwqDCoMKgwqDCoCAvKiBndWVzdCBib290aW5nIHZpYSBub3JtYWwgYm9vdCBlbnRy
eSAobGlrZSB2aWEgZ3J1YjIpIGdvZXMgaGVyZSAqLworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB4ODZfaW5pdC5oeXBlci5ndWVzdF9sYXRlX2luaXQgPSAKeGVuX2h2bV9ub3B2X2d1ZXN0
X2xhdGVfaW5pdDsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7CivCoMKg
wqDCoMKgwqAgfQogwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHhlbl9jcHVpZF9iYXNlKCk7CiDCoH0K
CkBAIC0yNTgsNCArMjg1LDUgQEAgc3RhdGljIF9faW5pdCB2b2lkIHhlbl9odm1fZ3Vlc3RfbGF0
ZV9pbml0KHZvaWQpCiDCoMKgwqDCoMKgwqDCoCAuaW5pdC5pbml0X21lbV9tYXBwaW5nwqAgPSB4
ZW5faHZtX2luaXRfbWVtX21hcHBpbmcsCiDCoMKgwqDCoMKgwqDCoCAuaW5pdC5ndWVzdF9sYXRl
X2luaXTCoMKgID0geGVuX2h2bV9ndWVzdF9sYXRlX2luaXQsCiDCoMKgwqDCoMKgwqDCoCAucnVu
dGltZS5waW5fdmNwdcKgwqDCoMKgwqDCoCA9IHhlbl9waW5fdmNwdSwKK8KgwqDCoMKgwqDCoCAu
aWdub3JlX25vcHbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gdHJ1ZSwKIMKgfTsKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
