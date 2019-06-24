Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79E50CC1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 15:54:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfPMz-0002q4-9R; Mon, 24 Jun 2019 13:50:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OLIz=UX=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hfPMy-0002pz-0V
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 13:50:52 +0000
X-Inumbo-ID: 13a3a562-9687-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 13a3a562-9687-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 13:50:50 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5ODnCJ2183615;
 Mon, 24 Jun 2019 13:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=SW6Szazq/wB2nNLnJHycEJb7byHwJ55tmOD9zZh4JmM=;
 b=QmgF69El//eOOAYwiDMFA/pB2Cg6Ir69CC2fmdEAI9knXHbuIo2t5IhWYLRQ2NB4UrZa
 eQKByBNHGzfTyeIofHM6kf3PTPNqTpiR74BZYP1X5Lno4YoCOWdWuLiW3DGCqaXPUz0+
 E4bUyY1cC1m4dI7CVDedv26N7Rt+nx+B/R+TY80Z9tBX4JlpiNHHe3zLPOyjCAvUCbMc
 fxmxYblZMxYmroQkBAYl8yGzBTRh1sh8Esv22I7tWF+8u6vVHH7c3KZe31p5Cej5Md7y
 pDqlTYpZHPj5HvbMTs9IcRZPugKoEkTmf20FTU6kldV79+FckoRnWcW8L4LzkLYNeGwl hw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2t9brsxjhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 13:50:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5ODnNxj113546;
 Mon, 24 Jun 2019 13:50:38 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2tat7bn7mf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 13:50:38 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5ODoaqJ029412;
 Mon, 24 Jun 2019 13:50:37 GMT
Received: from [192.168.0.8] (/1.180.238.73)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Jun 2019 06:50:36 -0700
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
References: <1561294903-6166-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561294903-6166-3-git-send-email-zhenzhong.duan@oracle.com>
 <9e60cea2-a15f-b816-9049-f22be14c04b2@suse.com>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Organization: Oracle Corporation
Message-ID: <cf315d9a-7027-aa8c-1cac-9be9b734811c@oracle.com>
Date: Mon, 24 Jun 2019 21:50:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <9e60cea2-a15f-b816-9049-f22be14c04b2@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906240113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906240113
Subject: Re: [Xen-devel] [PATCH 3/6] x86: Add nopv parameter to disable PV
 extensions
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
Cc: sstabellini@kernel.org, mingo@kernel.org, bp@alien8.de, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIwMTkvNi8yNCAyMToxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyMy4wNi4xOSAx
NTowMSwgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4+IEluIHZpcnR1YWxpemF0aW9uIGVudmlyb25t
ZW50LCBQViBleHRlbnNpb25zIChkcml2ZXJzLCBpbnRlcnJ1cHRzLAo+PiB0aW1lcnMsIGV0Yykg
YXJlIGVuYWJsZWQgaW4gdGhlIG1ham9yaXR5IG9mIHVzZSBjYXNlcyB3aGljaCBpcyB0aGUKPj4g
YmVzdCBvcHRpb24uCj4+Cj4+IEhvd2V2ZXIsIGluIHNvbWUgY2FzZXMgKGtleGVjIG5vdCBmdWxs
eSB3b3JraW5nLCBiZW5jaG1hcmtpbmcpCj4+IHdlIHdhbnQgdG8gZGlzYWJsZSBQViBleHRlbnNp
b25zLiBBcyBzdWNoIGludHJvZHVjZSB0aGUKPj4gJ25vcHYnIHBhcmFtZXRlciB0aGF0IHdpbGwg
ZG8gaXQuCj4+Cj4+IFRoZXJlIGlzIGFscmVhZHkgJ3hlbl9ub3B2JyBwYXJhbWV0ZXIgZm9yIFhF
TiBwbGF0Zm9ybSBidXQgbm90IGZvcgo+PiBvdGhlcnMuICd4ZW5fbm9wdicgY2FuIHRoZW4gYmUg
cmVtb3ZlZCB3aXRoIHRoaXMgY2hhbmdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcg
RHVhbiA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+PiAtLS0KPj4gwqAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJu
ZWwtcGFyYW1ldGVycy50eHQgfMKgIDQgKysrKwo+PiDCoCBhcmNoL3g4Ni9rZXJuZWwvY3B1L2h5
cGVydmlzb3IuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDExICsrKysrKysrKysr
Cj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgCj4+IGIv
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPj4gaW5kZXgg
MTM4ZjY2Ni4uYjM1MmYzNiAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlk
ZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlk
ZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPj4gQEAgLTUyNjgsNiArNTI2OCwxMCBAQAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbXByb3ZlIHRpbWVyIHJlc29sdXRpb24gYXQgdGhlIGV4
cGVuc2Ugb2YgcHJvY2Vzc2luZwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtb3JlIHRp
bWVyIGludGVycnVwdHMuCj4+IMKgICvCoMKgwqAgbm9wdj3CoMKgwqDCoMKgwqDCoCBbWDg2XQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEaXNhYmxlcyB0aGUgUFYgb3B0aW1pemF0aW9ucyBm
b3JjaW5nIHRoZSBndWVzdCB0byBydW4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXMgZ2Vu
ZXJpYyBndWVzdCB3aXRoIG5vIFBWIGRyaXZlcnMuCj4+ICsKPj4gwqDCoMKgwqDCoCB4aXJjMnBz
X2NzPcKgwqDCoCBbTkVULFBDTUNJQV0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRm9y
bWF0Ogo+PiA8aXJxPiw8aXJxX21hc2s+LDxpbz4sPGZ1bGxfZHVwbGV4Piw8ZG9fc291bmQ+LDxs
b2NrdXBfaGFjaz5bLDxpcnEyPlssPGlycTM+Wyw8aXJxND5dXV0KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jIAo+PiBiL2FyY2gveDg2L2tlcm5lbC9jcHUv
aHlwZXJ2aXNvci5jCj4+IGluZGV4IDQ3OWNhNDcuLjRmMmM4NzUgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jCj4+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9j
cHUvaHlwZXJ2aXNvci5jCj4+IEBAIC04NSwxMCArODUsMjEgQEAgc3RhdGljIHZvaWQgX19pbml0
IGNvcHlfYXJyYXkoY29uc3Qgdm9pZCAqc3JjLCAKPj4gdm9pZCAqdGFyZ2V0LCB1bnNpZ25lZCBp
bnQgc2l6ZSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdG9baV0gPSBmcm9tW2ldOwo+
PiDCoCB9Cj4+IMKgICtzdGF0aWMgYm9vbCBub3B2Owo+PiArc3RhdGljIF9faW5pdCBpbnQgeGVu
X3BhcnNlX25vcHYoY2hhciAqYXJnKQo+PiArewo+PiArwqDCoMKgIG5vcHYgPSB0cnVlOwo+PiAr
wqDCoMKgIHJldHVybiAwOwo+PiArfQo+PiArZWFybHlfcGFyYW0oIm5vcHYiLCB4ZW5fcGFyc2Vf
bm9wdik7Cj4+ICsKPj4gwqAgdm9pZCBfX2luaXQgaW5pdF9oeXBlcnZpc29yX3BsYXRmb3JtKHZv
aWQpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgKmg7
Cj4+IMKgICvCoMKgwqAgaWYgKG5vcHYpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+ICsK
Pgo+IE9oLCB0aGlzIGlzIG5vIGdvb2QgaWRlYS4KPgo+IFRoZXJlIGFyZSBndWVzdCB0eXBlcyB3
aGljaCBqdXN0IHdvbid0IHdvcmsgd2l0aG91dCBwdiBpbnRlcmZhY2VzLCBsaWtlCj4gWGVuIFBW
IGFuZCBYZW4gUFZILiBMZXR0aW5nIHRoZW0gZmFpbCBkdWUgdG8ganVzdCBhIHdyb25nIGNvbW1h
bmQgbGluZQo+IHBhcmFtZXRlciBpcyBub3QgbmljZSwgZXNwZWNpYWxseSBhcyB0aGUgZmFpbHVy
ZSBtaWdodCBiZSB2ZXJ5IGhhcmQgdG8KPiB0cmFjayBkb3duIHRvIHRoZSBpc3N1ZSBmb3IgdGhl
IHVzZXIuClllcywgdGhhbmtzIGZvciBjYXRjaGluZy4KPgo+IEkgZ3Vlc3MgeW91IGNvdWxkIGFk
ZCBhICJpZ25vcmVfbm9wdiIgbWVtYmVyIHRvIHN0cnVjdCBoeXBlcnZpc29yX3g4Ngo+IHNldCB0
byB0cnVlIGZvciB0aGUgbWVudGlvbmVkIGd1ZXN0IHR5cGVzIGFuZCBjYWxsIHRoZSBkZXRlY3Qg
ZnVuY3Rpb25zCj4gb25seSBpZiBub3B2IGlzIGZhbHNlIG9yIGlnbm9yZV9ub3B2IGlzIHRydWUu
CgpJIHRoaW5rIHlvdXIgc3VnZ2VzdGlvbiBpcyBnb29kLCBJJ2xsIHJld29yayBpdCBiYXNlZCBv
biB5b3VyIHN1Z2dlc3Rpb24uCgpUaGFua3MKClpoZW56aG9uZwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
