Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA7B63847
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 16:57:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkrVD-0001Kj-4f; Tue, 09 Jul 2019 14:53:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=noDR=VG=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hkrVC-0001Ke-1R
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 14:53:54 +0000
X-Inumbo-ID: 5dd513c2-a259-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5dd513c2-a259-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 14:53:52 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x69ErbLG066765;
 Tue, 9 Jul 2019 14:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=u55sha/1Wgkn8aGbxvOPN/fuopn0d6ARjtboy0So9i0=;
 b=V1eweIgJlQ2Lhcu1e9WwB8ndvlKozvldRfq9xXxgHZIO4WDxoVqmqE/Xbmm0r/mceFE1
 qcPiCH13J70nj8E9p8Sfa17w9LQ3oapH6z5kUODUXbOY05YWVOwZ9xk2JNx342KKlUsY
 HFGWHu75LHWxFhk0cI+nLQxWcf1uq5CoB8abnnz7kQO8MT8T+oIOCQCdsNLyeQV9A4FW
 yHNtEIQkkWtXNc+gOcgQhUOTvTJJRgFi6/lh/+gI2wvr8QZt5PAJGKY4M09eUsOp4WKf
 dF/3iJmGEvQZo/MJn1zyhgns0JBKUTAJK0a1B4sXWSHpEchO9Xdh8QHvc60u7VjHwl0f IA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2tjkkpmtsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Jul 2019 14:53:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x69Eqg6V182230;
 Tue, 9 Jul 2019 14:53:35 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2tjgru5c97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Jul 2019 14:53:35 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x69ErSTw018106;
 Tue, 9 Jul 2019 14:53:28 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 09 Jul 2019 07:53:27 -0700
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1562490908-17882-1-git-send-email-zhenzhong.duan@oracle.com>
 <1562490908-17882-5-git-send-email-zhenzhong.duan@oracle.com>
 <86b0dbb9-74a7-6883-e6d7-210bd35a6944@oracle.com>
 <6cbd7b78-3d8d-64ae-fd2e-82244dbe6a1e@oracle.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <3d7db7c6-cea3-9dce-0519-a1c600b33273@oracle.com>
Date: Tue, 9 Jul 2019 10:54:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6cbd7b78-3d8d-64ae-fd2e-82244dbe6a1e@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9313
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907090178
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9313
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907090179
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

T24gNy85LzE5IDEyOjIwIEFNLCBaaGVuemhvbmcgRHVhbiB3cm90ZToKPgo+IC1jb25zdCBfX2lu
aXRjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5cGVyX3hlbl9odm0gPSB7Cj4gK3N0
YXRpYyB1aW50MzJfdCBfX2luaXQgeGVuX3BsYXRmb3JtX2h2bSh2b2lkKQo+ICt7Cj4gK8KgwqDC
oMKgwqDCoCB1aW50MzJfdCB4ZW5fZG9tYWluID0geGVuX2NwdWlkX2Jhc2UoKTsKPiArwqDCoMKg
wqDCoMKgIHN0cnVjdCB4ODZfaHlwZXJfaW5pdCAqaCA9ICZ4ODZfaHlwZXJfeGVuX2h2bS5pbml0
Owo+ICsKPiArwqDCoMKgwqDCoMKgIGlmICh4ZW5fcHZfZG9tYWluKCkpCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4gKwo+ICvCoMKgwqDCoMKgwqAgaWYgKHhlbl9w
dmhfZG9tYWluKCkgJiYgbm9wdikgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8q
IEd1ZXN0IGJvb3RpbmcgdmlhIHRoZSBYZW4tUFZIIGJvb3QgZW50cnkgZ29lcyBoZXJlICovCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfaW5mbygiXCJub3B2XCIgcGFyYW1ldGVy
IGlzIGlnbm9yZWQgaW4gUFZIIGd1ZXN0XG4iKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBub3B2ID0gZmFsc2U7Cj4gK8KgwqDCoMKgwqDCoCB9IGVsc2UgaWYgKG5vcHYgJiYgeGVu
X2RvbWFpbikgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIEd1ZXN0IGJvb3RpbmcgdmlhIG5vcm1hbCBib290IGVu
dHJ5IChsaWtlIHZpYQo+IGdydWIyKSBnb2VzCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIGhlcmUuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFVzZSBpbnRlcmZhY2UgZnVuY3Rpb25zIGZvciBi
YXJlIGhhcmR3YXJlIGlmIG5vcHYsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IHhlbl9odm1fZ3Vlc3RfbGF0ZV9pbml0IGlzIGFuIGV4Y2VwdGlvbiBhcyB3ZSBuZWVkIHRvCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGRldGVjdCBQVkggYW5kIHBhbmljIHRo
ZXJlLgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtZW1jcHkoaCwgKHZvaWQgKikmeDg2X2luaXQuaHlwZXIsCj4gc2l6
ZW9mKHg4Nl9pbml0Lmh5cGVyKSk7CgoKQW5kIHRoaXMgd29ya2VkPyBJJ2QgdGhpbmsgaXQgd291
bGQgZmFpbCBzaW5jZSBoIHBvaW50cyB0byBSTyBzZWN0aW9uLgoKCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbWVtY3B5KCZ4ODZfaHlwZXJfeGVuX2h2bS5ydW50aW1lLCAodm9pZAo+
ICopJng4Nl9wbGF0Zm9ybS5oeXBlciwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNpemVvZih4ODZfcGxhdGZvcm0uaHlwZXIpKTsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBoLT5ndWVzdF9sYXRlX2luaXQgPSB4ZW5faHZtX2d1ZXN0X2xhdGVf
aW5pdDsKCgpUbyBtZSB0aGlzIHN0aWxsIGRvZXNuJ3QgbG9vayByaWdodCAtLS0geW91IGFyZSBt
YWtpbmcgYXNzdW1wdGlvbnMgYWJvdXQKeDg2X3BsYXRmb3JtL3g4Nl9pbml0Lmh5cGVyIGFuZCBJ
IGRvbid0IHRoaW5rIHlvdSBjYW4gYXNzdW1lIHRoZXkgaGF2ZQpub3QgYmVlbiBzZXQgdG8gcG9p
bnQgdG8gYW5vdGhlciBoeXBlcnZpc29yLCBmb3IgZXhhbXBsZS4KCldvdWxkIG1vZGlmeWluZyBh
bGwgeDg2X2h5cGVyX3hlbl9odm0ncyBvcHMgKGV4Y2VwdCwgSSBndWVzcywKeGVuX2h2bV9ndWVz
dF9sYXRlX2luaXQoKSkgdG8gaW1tZWRpYXRlbHkgcmV0dXJuIGlmIG5vcHYgaXMgc2V0IHdvcms/
CgpBbHNvIHF1ZXN0aW9uIGZvciBKdWVyZ2VuIC0tLSBpcyB0aGVyZSBhbnl0aGluZyBwZXJoYXBz
IGluIHplcm9wYWdlIHRoYXQKaW5kaWNhdGVzIHdlIGFyZSBib290aW5nIFBWSCBndWVzdCBmcm9t
IGdydWI/CgotYm9yaXMKCgo+ICvCoMKgwqDCoMKgwqAgfQo+ICvCoMKgwqDCoMKgwqAgcmV0dXJu
IHhlbl9kb21haW47Cj4gK30KPiArCj4gK3N0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJf
eGVuX2h2bSBfX2luaXRkYXRhID0gewo+IMKgwqDCoMKgwqDCoMKgIC5uYW1lwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gIlhlbiBIVk0iLAo+IMKgwqDCoMKgwqDCoMKgIC5k
ZXRlY3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9IHhlbl9wbGF0Zm9ybV9odm0s
Cj4gwqDCoMKgwqDCoMKgwqAgLnR5cGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPSBYODZfSFlQRVJfWEVOX0hWTSwKPiBAQCAtMjY4LDQgKzI5Miw1IEBAIHN0YXRpYyBfX2lu
aXQgdm9pZCB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdCh2b2lkKQo+IMKgwqDCoMKgwqDCoMKgIC5p
bml0LmluaXRfbWVtX21hcHBpbmfCoCA9IHhlbl9odm1faW5pdF9tZW1fbWFwcGluZywKPiDCoMKg
wqDCoMKgwqDCoCAuaW5pdC5ndWVzdF9sYXRlX2luaXTCoMKgID0geGVuX2h2bV9ndWVzdF9sYXRl
X2luaXQsCj4gwqDCoMKgwqDCoMKgwqAgLnJ1bnRpbWUucGluX3ZjcHXCoMKgwqDCoMKgwqAgPSB4
ZW5fcGluX3ZjcHUsCj4gK8KgwqDCoMKgwqDCoCAuaWdub3JlX25vcHbCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgID0gdHJ1ZSwKPiDCoH07Cj4KPgo+IFRoYW5rcwo+Cj4gWmhlbnpob25nCj4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
