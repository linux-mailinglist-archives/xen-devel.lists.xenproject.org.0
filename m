Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7819117CFDD
	for <lists+xen-devel@lfdr.de>; Sat,  7 Mar 2020 20:46:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAfKj-0003lw-Mc; Sat, 07 Mar 2020 19:42:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x55F=4Y=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jAfKh-0003lr-Ve
 for xen-devel@lists.xenproject.org; Sat, 07 Mar 2020 19:42:00 +0000
X-Inumbo-ID: b52d55c0-60ab-11ea-aa69-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b52d55c0-60ab-11ea-aa69-12813bfff9fa;
 Sat, 07 Mar 2020 19:41:58 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 027JeDht052378;
 Sat, 7 Mar 2020 19:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Gco4zpX77QENpnAf0FH8U/HTthlZKiexOOsjBR2Zhv0=;
 b=wH3cRoytj5ulOq8EkBTN8Q6fSBdVbUBAyw36JCE9XBjfdkUsplqFm+E2h6DXZ3NAX9ta
 aS2fkpwQB2crFaoIVGVyoGEHygEpAAdyCWN1Ktduvqhgbz6CQMRVj4hvVAJ564toj/hu
 yTHLKNihhgHesj/6PSKi0MqBEk0K7fSz0ottbnU2lp8P8HMtqitn5pIawAyOaa5FENuL
 OYR/iXaefC/r8olIbrLT8InzK7Hn4HwHYWqMpq65lv18E7S4tjHtlh9iP43VSPeXmN35
 v8l55v/E3TAkK6AGjthCReoKKR+4acRtNxTOLEuatAUy1JfKJbbWZync1XRkwYYIJNQm 5A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2ym48shfqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 Mar 2020 19:41:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 027Jb5IC189059;
 Sat, 7 Mar 2020 19:41:53 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2ym3e7ya17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 Mar 2020 19:41:53 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 027Jfp1x003314;
 Sat, 7 Mar 2020 19:41:51 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 07 Mar 2020 11:41:51 -0800
To: Yan Yankovskyi <yyankovskyi@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <20200307134322.GA27756@kbp1-lhp-F74019>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <d190793c-fe6b-263e-7793-ccd73f9ccad4@oracle.com>
Date: Sat, 7 Mar 2020 14:41:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200307134322.GA27756@kbp1-lhp-F74019>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9553
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 malwarescore=0
 suspectscore=2 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003070144
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9553
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0
 mlxlogscore=999 suspectscore=2 priorityscore=1501 lowpriorityscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003070144
Subject: Re: [Xen-devel] [PATCH v2] xen: Use evtchn_type_t as a type for
 event channels
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzLzcvMjAgODo0MyBBTSwgWWFuIFlhbmtvdnNreWkgd3JvdGU6Cj4gTWFrZSBldmVudCBj
aGFubmVsIGZ1bmN0aW9ucyBwYXNzIGV2ZW50IGNoYW5uZWwgcG9ydCB1c2luZwo+IGV2dGNobl9w
b3J0X3QgdHlwZS4gSXQgZWxpbWluYXRlcyBzaWduZWQgPC0+IHVuc2lnbmVkIGNvbnZlcnNpb24u
Cj4KCgo+ICBzdGF0aWMgaW50IGZpbmRfdmlycSh1bnNpZ25lZCBpbnQgdmlycSwgdW5zaWduZWQg
aW50IGNwdSkKPiAgewo+ICAJc3RydWN0IGV2dGNobl9zdGF0dXMgc3RhdHVzOwo+IC0JaW50IHBv
cnQsIHJjID0gLUVOT0VOVDsKPiArCWV2dGNobl9wb3J0X3QgcG9ydDsKPiArCWludCByYyA9IC1F
Tk9FTlQ7Cj4gIAo+ICAJbWVtc2V0KCZzdGF0dXMsIDAsIHNpemVvZihzdGF0dXMpKTsKPiAgCWZv
ciAocG9ydCA9IDA7IHBvcnQgPCB4ZW5fZXZ0Y2huX21heF9jaGFubmVscygpOyBwb3J0KyspIHsK
PiBAQCAtOTYyLDcgKzk2Myw4IEBAIEVYUE9SVF9TWU1CT0xfR1BMKHhlbl9ldnRjaG5fbnJfY2hh
bm5lbHMpOwo+ICBpbnQgYmluZF92aXJxX3RvX2lycSh1bnNpZ25lZCBpbnQgdmlycSwgdW5zaWdu
ZWQgaW50IGNwdSwgYm9vbCBwZXJjcHUpCj4gIHsKPiAgCXN0cnVjdCBldnRjaG5fYmluZF92aXJx
IGJpbmRfdmlycTsKPiAtCWludCBldnRjaG4sIGlycSwgcmV0Owo+ICsJZXZ0Y2huX3BvcnRfdCBl
dnRjaG4gPSB4ZW5fZXZ0Y2huX21heF9jaGFubmVscygpOwo+ICsJaW50IGlycSwgcmV0Owo+ICAK
PiAgCW11dGV4X2xvY2soJmlycV9tYXBwaW5nX3VwZGF0ZV9sb2NrKTsKPiAgCj4gQEAgLTk5MCw3
ICs5OTIsNiBAQCBpbnQgYmluZF92aXJxX3RvX2lycSh1bnNpZ25lZCBpbnQgdmlycSwgdW5zaWdu
ZWQgaW50IGNwdSwgYm9vbCBwZXJjcHUpCj4gIAkJCWlmIChyZXQgPT0gLUVFWElTVCkKPiAgCQkJ
CXJldCA9IGZpbmRfdmlycSh2aXJxLCBjcHUpOwo+ICAJCQlCVUdfT04ocmV0IDwgMCk7Cj4gLQkJ
CWV2dGNobiA9IHJldDsKCgpUaGlzIGxvb2tzIHN1c3BpY2lvdXMuIFdoYXQgd291bGQgeW91IGJl
IHBhc3NpbmcgdG8KeGVuX2lycV9pbmZvX3ZpcnFfc2V0dXAoKSBiZWxvdz8KCkkgYWxzbyB0aGlu
ayB0aGF0LCBnaXZlbiB0aGF0IHRoaXMgcGF0Y2ggaXMgdHJ5aW5nIHRvIGdldCB0eXBlcyBpbgpv
cmRlciwgZmluZF92aXJxKCkgd2lsbCBuZWVkIG1vcmUgY2hhbmdlczogaXQgaXMgc3VwcG9zZWQg
dG8gcmV0dXJuCmV2dGNobl9wb3J0X3QuIEJ1dCB0aGVuIGl0IGFsc28gd2FudHMgdG8gcmV0dXJu
IGEgKHNpZ25lZCkgZXJyb3IuCgo+ICAJCX0KPiAgCj4gIAkJcmV0ID0geGVuX2lycV9pbmZvX3Zp
cnFfc2V0dXAoY3B1LCBpcnEsIGV2dGNobiwgdmlycSk7Cj4gQEAgLTEwMTksNyArMTAyMCw3IEBA
IHN0YXRpYyB2b2lkIHVuYmluZF9mcm9tX2lycSh1bnNpZ25lZCBpbnQgaXJxKQo+ICAJbXV0ZXhf
dW5sb2NrKCZpcnFfbWFwcGluZ191cGRhdGVfbG9jayk7Cj4gIH0KPiAgCgoKCj4gLS0tIGEvZHJp
dmVycy94ZW4veGVuYnVzL3hlbmJ1c19jbGllbnQuYwo+ICsrKyBiL2RyaXZlcnMveGVuL3hlbmJ1
cy94ZW5idXNfY2xpZW50LmMKPiBAQCAtMzkxLDcgKzM5MSw3IEBAIEVYUE9SVF9TWU1CT0xfR1BM
KHhlbmJ1c19ncmFudF9yaW5nKTsKPiAgICogZXJyb3IsIHRoZSBkZXZpY2Ugd2lsbCBzd2l0Y2gg
dG8gWGVuYnVzU3RhdGVDbG9zaW5nLCBhbmQgdGhlIGVycm9yIHdpbGwgYmUKPiAgICogc2F2ZWQg
aW4gdGhlIHN0b3JlLgo+ICAgKi8KPiAtaW50IHhlbmJ1c19hbGxvY19ldnRjaG4oc3RydWN0IHhl
bmJ1c19kZXZpY2UgKmRldiwgaW50ICpwb3J0KQo+ICtpbnQgeGVuYnVzX2FsbG9jX2V2dGNobihz
dHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2LCBldnRjaG5fcG9ydF90ICpwb3J0KQoKUmlnaHQuIEJ1
dCB0aGVuIHdoeSBpcyB0aGUgZGVjbGFyYXRpb24gaW4gaW5jbHVkZS94ZW4veGVuYnVzLmggKGF0
IHRoZQp2ZXJ5IGVuZCBvZiB0aGUgcGF0Y2gpIGRpZmZlcmVudD8KCj4gIHsKPiAgCXN0cnVjdCBl
dnRjaG5fYWxsb2NfdW5ib3VuZCBhbGxvY191bmJvdW5kOwo+ICAJaW50IGVycjsKPiBAQCAtNDE0
LDcgKzQxNCw3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKHhlbmJ1c19hbGxvY19ldnRjaG4pOwo+ICAv
KioKPiAgICogRnJlZSBhbiBleGlzdGluZyBldmVudCBjaGFubmVsLiBSZXR1cm5zIDAgb24gc3Vj
Y2VzcyBvciAtZXJybm8gb24gZXJyb3IuCj4gICAqLwo+IC1pbnQgeGVuYnVzX2ZyZWVfZXZ0Y2hu
KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsIGludCBwb3J0KQo+ICtpbnQgeGVuYnVzX2ZyZWVf
ZXZ0Y2huKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsIGV2dGNobl9wb3J0X3QgcG9ydCkKCkhl
cmUgdG9vLgoKPiAgewo+ICAJc3RydWN0IGV2dGNobl9jbG9zZSBjbG9zZTsKPiAgCWludCBlcnI7
Cj4gQEAgLTQyMyw3ICs0MjMsNyBAQCBpbnQgeGVuYnVzX2ZyZWVfZXZ0Y2huKHN0cnVjdCB4ZW5i
dXNfZGV2aWNlICpkZXYsIGludCBwb3J0KQoKQW5kIHdoeSBub3QgaGVyZSwgZXNwZWNpYWxseSBz
aW5jZSB5b3UgdXBkYXRlZCBmb3JtYXQ/Cgo+ICAKPiAgCWVyciA9IEhZUEVSVklTT1JfZXZlbnRf
Y2hhbm5lbF9vcChFVlRDSE5PUF9jbG9zZSwgJmNsb3NlKTsKPiAgCWlmIChlcnIpCj4gLQkJeGVu
YnVzX2Rldl9lcnJvcihkZXYsIGVyciwgImZyZWVpbmcgZXZlbnQgY2hhbm5lbCAlZCIsIHBvcnQp
Owo+ICsJCXhlbmJ1c19kZXZfZXJyb3IoZGV2LCBlcnIsICJmcmVlaW5nIGV2ZW50IGNoYW5uZWwg
JXUiLCBwb3J0KTsKPiAgCj4gIAlyZXR1cm4gZXJyOwo+ICB9CgoKCj4gIAo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL3hlbi9pbnRlcmZhY2UvZXZlbnRfY2hhbm5lbC5oIGIvaW5jbHVkZS94ZW4vaW50
ZXJmYWNlL2V2ZW50X2NoYW5uZWwuaAo+IGluZGV4IDQ1NjUwYzlhMDZkNS4uY2Y4MGUzMzhmYmIw
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUveGVuL2ludGVyZmFjZS9ldmVudF9jaGFubmVsLmgKPiAr
KysgYi9pbmNsdWRlL3hlbi9pbnRlcmZhY2UvZXZlbnRfY2hhbm5lbC5oCj4gQEAgLTIyMCw3ICsy
MjAsNyBAQCBzdHJ1Y3QgZXZ0Y2huX2V4cGFuZF9hcnJheSB7Cj4gICNkZWZpbmUgRVZUQ0hOT1Bf
c2V0X3ByaW9yaXR5ICAgIDEzCj4gIHN0cnVjdCBldnRjaG5fc2V0X3ByaW9yaXR5IHsKPiAgCS8q
IElOIHBhcmFtZXRlcnMuICovCj4gLQl1aW50MzJfdCBwb3J0Owo+ICsJZXZ0Y2huX3BvcnRfdCBw
b3J0OwoKVGhpcyBkZWZpbml0aW9uIGNvbWVzIGZyb20gWGVuIHNvIEkgdGhpbmsgaXQgbmVlZHMg
dG8gYmUgZml4ZWQgdGhlcmUgZmlyc3QuCgo+ICAJdWludDMyX3QgcHJpb3JpdHk7Cj4gIH07Cj4g
IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94ZW5idXMuaCBiL2luY2x1ZGUveGVuL3hlbmJ1
cy5oCj4gaW5kZXggODlhODg5NTg1YmEwLi40ZjM1MjE2MDY0YmEgMTAwNjQ0Cj4gLS0tIGEvaW5j
bHVkZS94ZW4veGVuYnVzLmgKPiArKysgYi9pbmNsdWRlL3hlbi94ZW5idXMuaAo+IEBAIC0yMTgs
OCArMjE4LDggQEAgaW50IHhlbmJ1c191bm1hcF9yaW5nKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpk
ZXYsCj4gIAkJICAgICAgZ3JhbnRfaGFuZGxlX3QgKmhhbmRsZXMsIHVuc2lnbmVkIGludCBucl9o
YW5kbGVzLAo+ICAJCSAgICAgIHVuc2lnbmVkIGxvbmcgKnZhZGRycyk7Cj4gIAo+IC1pbnQgeGVu
YnVzX2FsbG9jX2V2dGNobihzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2LCBpbnQgKnBvcnQpOwo+
IC1pbnQgeGVuYnVzX2ZyZWVfZXZ0Y2huKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsIGludCBw
b3J0KTsKPiAraW50IHhlbmJ1c19hbGxvY19ldnRjaG4oc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRl
diwgdW5zaWduZWQgaW50ICpwb3J0KTsKPiAraW50IHhlbmJ1c19mcmVlX2V2dGNobihzdHJ1Y3Qg
eGVuYnVzX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcG9ydCk7CgpUaGVzZS4KCgotYm9yaXMK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
