Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBBE173703
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:15:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7eVY-0007jD-72; Fri, 28 Feb 2020 12:12:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yuXw=4Q=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1j7eVW-0007j6-J8
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:12:42 +0000
X-Inumbo-ID: 9e71fc52-5a23-11ea-b7e8-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e71fc52-5a23-11ea-b7e8-bc764e2007e4;
 Fri, 28 Feb 2020 12:12:42 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01SC3aqk175144;
 Fri, 28 Feb 2020 12:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=qBTbjDuK/DecDiWjAC8epNtei5Artb3J6+FXVk9rbIA=;
 b=X8ghppaJn4fbkx+g4mWA3w1zfbSE4R6fqsK/gkf20XMXXpmCErcg7ki4Wy+RQ8Ws0y6O
 IN1u0KC+eEW8VQzZh4QTDDLowMG9n/IzPgnwmKy31XCa5xmZcUScpHh69wqHe/W4EJak
 xkSqHdePftIglQMoCz8T/O4yhLZVrSrdrmkMqaUXmt63LA/MUhbXEloLHkq18mkvgxma
 KcROLtvZHaCgmj0C/Zo2QwyRyLP2wfDR/8jMoyzv7oYmcxXukQ9d+FjDBuI0tvo+AlMu
 wQJ9tk93SE1ZmHboIkbF/JpUG1L72ypZ3z8Yg2t83MFgpFkIoUbijDro5g3X8nCu9SXG 4g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2ydcsnthp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 12:12:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01SC2C1t110240;
 Fri, 28 Feb 2020 12:12:29 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2ydj4qkxvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 12:12:28 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01SCCR4d001086;
 Fri, 28 Feb 2020 12:12:27 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 28 Feb 2020 04:12:27 -0800
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20200226212612.GA4663@embeddedor>
 <77d23b72-e16b-e63a-7700-3afe6c77d327@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <94f38b5e-c850-5fff-1540-fb1a530a5a51@oracle.com>
Date: Fri, 28 Feb 2020 07:13:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <77d23b72-e16b-e63a-7700-3afe6c77d327@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9544
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002280102
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9544
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002280102
Subject: Re: [Xen-devel] [PATCH] xen: Replace zero-length array with
 flexible-array member
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyLzI3LzIwIDQ6MzEgQU0sIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMjYuMDIuMjAg
MjI6MjYsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4+IFRoZSBjdXJyZW50IGNvZGViYXNl
IG1ha2VzIHVzZSBvZiB0aGUgemVyby1sZW5ndGggYXJyYXkgbGFuZ3VhZ2UKPj4gZXh0ZW5zaW9u
IHRvIHRoZSBDOTAgc3RhbmRhcmQsIGJ1dCB0aGUgcHJlZmVycmVkIG1lY2hhbmlzbSB0byBkZWNs
YXJlCj4+IHZhcmlhYmxlLWxlbmd0aCB0eXBlcyBzdWNoIGFzIHRoZXNlIG9uZXMgaXMgYSBmbGV4
aWJsZSBhcnJheQo+PiBtZW1iZXJbMV1bMl0sCj4+IGludHJvZHVjZWQgaW4gQzk5Ogo+Pgo+PiBz
dHJ1Y3QgZm9vIHsKPj4gwqDCoMKgwqDCoMKgwqDCoCBpbnQgc3R1ZmY7Cj4+IMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGJvbyBhcnJheVtdOwo+PiB9Owo+Pgo+PiBCeSBtYWtpbmcgdXNlIG9mIHRo
ZSBtZWNoYW5pc20gYWJvdmUsIHdlIHdpbGwgZ2V0IGEgY29tcGlsZXIgd2FybmluZwo+PiBpbiBj
YXNlIHRoZSBmbGV4aWJsZSBhcnJheSBkb2VzIG5vdCBvY2N1ciBsYXN0IGluIHRoZSBzdHJ1Y3R1
cmUsIHdoaWNoCj4+IHdpbGwgaGVscCB1cyBwcmV2ZW50IHNvbWUga2luZCBvZiB1bmRlZmluZWQg
YmVoYXZpb3IgYnVncyBmcm9tIGJlaW5nCj4+IGluYWR2ZXJ0ZW50bHkgaW50cm9kdWNlZFszXSB0
byB0aGUgY29kZWJhc2UgZnJvbSBub3cgb24uCj4+Cj4+IEFsc28sIG5vdGljZSB0aGF0LCBkeW5h
bWljIG1lbW9yeSBhbGxvY2F0aW9ucyB3b24ndCBiZSBhZmZlY3RlZCBieQo+PiB0aGlzIGNoYW5n
ZToKPj4KPj4gIkZsZXhpYmxlIGFycmF5IG1lbWJlcnMgaGF2ZSBpbmNvbXBsZXRlIHR5cGUsIGFu
ZCBzbyB0aGUgc2l6ZW9mIG9wZXJhdG9yCj4+IG1heSBub3QgYmUgYXBwbGllZC4gQXMgYSBxdWly
ayBvZiB0aGUgb3JpZ2luYWwgaW1wbGVtZW50YXRpb24gb2YKPj4gemVyby1sZW5ndGggYXJyYXlz
LCBzaXplb2YgZXZhbHVhdGVzIHRvIHplcm8uIlsxXQo+Pgo+PiBUaGlzIGlzc3VlIHdhcyBmb3Vu
ZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGUuCj4+Cj4+IFsxXSBodHRwczovL2djYy5nbnUu
b3JnL29ubGluZWRvY3MvZ2NjL1plcm8tTGVuZ3RoLmh0bWwKPj4gWzJdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy8yMQo+PiBbM10gY29tbWl0IDc2NDk3NzMyOTMyZiAoImN4
Z2IzL2wydDogRml4IHVuZGVmaW5lZCBiZWhhdmlvdXIiKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBH
dXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+Cj4gUmV2aWV3ZWQt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpBcHBsaWVkIHRvIGZvci1saW51
cy01LjYuCgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
