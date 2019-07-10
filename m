Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D0C63F20
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 04:13:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl21s-000871-Is; Wed, 10 Jul 2019 02:08:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6BIL=VH=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hl21q-00086w-L7
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 02:08:18 +0000
X-Inumbo-ID: 94764865-a2b7-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 94764865-a2b7-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 02:08:17 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6A23nCD077973;
 Wed, 10 Jul 2019 02:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=QZA2CjZZ9LVdMkh8ePwHvOa51+zr25uBOZG1ruA7UzM=;
 b=TeV/n1nkz1ihzRJYIyUqMF2/o6WIoFfhDLIk+oW1cokz1Sp6RJ7B0lP201Sxk48DUhtT
 dXYE1Irsg9HFvPT7wmzcH5weWjYlKZanBCtKyttDm42XX9m+YdKy++qEca0asM7br+hW
 BdAR1v3mFhpiRyHeOczO6jccmqew3VDcCL8MvSMOYD2nwf0yS90S81Y4i96hFNJtf0pS
 SnxZNtZGpM3G1uRA0RHWsKa8GZV97FbVcNmUzlrY+zYL82WJeMVT/lwelyqeyK05avEL
 39J1gPFu4W8VyqoN/jE+V0WAU9CPsAiXzQ4D030pfsZWq4K7X+FNno7fKTNULpivAfXr nQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2tjk2tqdt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jul 2019 02:08:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6A27S8P104401;
 Wed, 10 Jul 2019 02:08:01 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2tmwgx7sxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jul 2019 02:08:01 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6A28035007870;
 Wed, 10 Jul 2019 02:08:00 GMT
Received: from [192.168.0.8] (/1.180.238.73)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 09 Jul 2019 19:07:59 -0700
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
References: <1562490908-17882-1-git-send-email-zhenzhong.duan@oracle.com>
 <1562490908-17882-5-git-send-email-zhenzhong.duan@oracle.com>
 <86b0dbb9-74a7-6883-e6d7-210bd35a6944@oracle.com>
 <6cbd7b78-3d8d-64ae-fd2e-82244dbe6a1e@oracle.com>
 <3d7db7c6-cea3-9dce-0519-a1c600b33273@oracle.com>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Organization: Oracle Corporation
Message-ID: <33876a98-9b6b-a1b9-e72f-352c3f95db89@oracle.com>
Date: Wed, 10 Jul 2019 10:07:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <3d7db7c6-cea3-9dce-0519-a1c600b33273@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9313
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907100024
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9313
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907100024
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

T24gMjAxOS83LzkgMjI6NTQsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiA3LzkvMTkgMTI6
MjAgQU0sIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+PiAtY29uc3QgX19pbml0Y29uc3Qgc3RydWN0
IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5faHZtID0gewo+PiArc3RhdGljIHVpbnQzMl90
IF9faW5pdCB4ZW5fcGxhdGZvcm1faHZtKHZvaWQpCj4+ICt7Cj4+ICvCoMKgwqDCoMKgwqAgdWlu
dDMyX3QgeGVuX2RvbWFpbiA9IHhlbl9jcHVpZF9iYXNlKCk7Cj4+ICvCoMKgwqDCoMKgwqAgc3Ry
dWN0IHg4Nl9oeXBlcl9pbml0ICpoID0gJng4Nl9oeXBlcl94ZW5faHZtLmluaXQ7Cj4+ICsKPj4g
K8KgwqDCoMKgwqDCoCBpZiAoeGVuX3B2X2RvbWFpbigpKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gKwo+PiArwqDCoMKgwqDCoMKgIGlmICh4ZW5fcHZoX2Rv
bWFpbigpICYmIG5vcHYpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogR3Vl
c3QgYm9vdGluZyB2aWEgdGhlIFhlbi1QVkggYm9vdCBlbnRyeSBnb2VzIGhlcmUgKi8KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfaW5mbygiXCJub3B2XCIgcGFyYW1ldGVyIGlz
IGlnbm9yZWQgaW4gUFZIIGd1ZXN0XG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbm9wdiA9IGZhbHNlOwo+PiArwqDCoMKgwqDCoMKgIH0gZWxzZSBpZiAobm9wdiAmJiB4ZW5f
ZG9tYWluKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBHdWVzdCBib290aW5nIHZpYSBub3JtYWwgYm9vdCBl
bnRyeSAobGlrZSB2aWEKPj4gZ3J1YjIpIGdvZXMKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqIGhlcmUuCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKgo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogVXNlIGludGVyZmFjZSBmdW5jdGlvbnMg
Zm9yIGJhcmUgaGFyZHdhcmUgaWYgbm9wdiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIHhlbl9odm1fZ3Vlc3RfbGF0ZV9pbml0IGlzIGFuIGV4Y2VwdGlvbiBhcyB3ZSBuZWVk
IHRvCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBkZXRlY3QgUFZIIGFuZCBw
YW5pYyB0aGVyZS4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1jcHkoaCwgKHZvaWQgKikmeDg2X2luaXQuaHlw
ZXIsCj4+IHNpemVvZih4ODZfaW5pdC5oeXBlcikpOwo+Cj4gQW5kIHRoaXMgd29ya2VkPyBJJ2Qg
dGhpbmsgaXQgd291bGQgZmFpbCBzaW5jZSBoIHBvaW50cyB0byBSTyBzZWN0aW9uLgpZZXMsIEkg
aGF2ZSBiZWxvdyBjaGFuZ2VzIGluIHRoZSBwYXRjaC4KCi1jb25zdCBfX2luaXRjb25zdCBzdHJ1
Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5cGVyX3hlbl9odm0gPSB7CitzdHJ1Y3QgaHlwZXJ2aXNv
cl94ODYgeDg2X2h5cGVyX3hlbl9odm0gX19pbml0ZGF0YSA9IHsKCj4KPgo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1jcHkoJng4Nl9oeXBlcl94ZW5faHZtLnJ1bnRpbWUsICh2
b2lkCj4+ICopJng4Nl9wbGF0Zm9ybS5oeXBlciwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2YoeDg2X3BsYXRmb3JtLmh5cGVyKSk7Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGgtPmd1ZXN0X2xhdGVfaW5pdCA9IHhlbl9odm1fZ3Vl
c3RfbGF0ZV9pbml0Owo+Cj4gVG8gbWUgdGhpcyBzdGlsbCBkb2Vzbid0IGxvb2sgcmlnaHQgLS0t
IHlvdSBhcmUgbWFraW5nIGFzc3VtcHRpb25zIGFib3V0Cj4geDg2X3BsYXRmb3JtL3g4Nl9pbml0
Lmh5cGVyIGFuZCBJIGRvbid0IHRoaW5rIHlvdSBjYW4gYXNzdW1lIHRoZXkgaGF2ZQo+IG5vdCBi
ZWVuIHNldCB0byBwb2ludCB0byBhbm90aGVyIGh5cGVydmlzb3IsIGZvciBleGFtcGxlLgoKWW91
IG1lYW4gY29weV9hcnJheSgpIGNhbGxzIGluIGluaXRfaHlwZXJ2aXNvcl9wbGF0Zm9ybSgpPyBC
dXQgdGhhdCAKaGFwcGVucyBhZnRlcgoKZGV0ZWN0X2h5cGVydmlzb3JfdmVuZG9yKCkgc2hvb3Nl
IG91dCB0aGUgcHJlZmVyZWQgaHlwZXJ2aXNvci4gSW4gZGV0ZWN0IApzdGFnZSwKCng4Nl9wbGF0
Zm9ybS94ODZfaW5pdC5oeXBlciBoYXMgZGVmYXVsdCB2YWx1ZSBmb3IgYmFyZSBoYXJkd2FyZSwg
b3IgSSAKbWlzc2VkIHNvbWV0aGluZz8KCkp1c3QgcmVhbGl6ZWQgSSBjYW4gdXNlIG1lbXNldCB0
byB6ZXJvIGluc3RlYWQgb2YgbWVtY3B5IHdoaWNoIGxvb2tzIAptb3JlIHJhdGlvbmFsLgoKPgo+
IFdvdWxkIG1vZGlmeWluZyBhbGwgeDg2X2h5cGVyX3hlbl9odm0ncyBvcHMgKGV4Y2VwdCwgSSBn
dWVzcywKPiB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdCgpKSB0byBpbW1lZGlhdGVseSByZXR1cm4g
aWYgbm9wdiBpcyBzZXQgd29yaz8KCkkgdGhpbmsgc28swqAgTGV0IG1lIHRyeSBpdC4KClpoZW56
aG9uZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
