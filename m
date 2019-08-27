Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D2C9EF51
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 17:48:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2det-00085b-J5; Tue, 27 Aug 2019 15:45:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ui3E=WX=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i2des-00085W-Cu
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 15:45:22 +0000
X-Inumbo-ID: ad67b252-c8e1-11e9-b95f-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad67b252-c8e1-11e9-b95f-bc764e2007e4;
 Tue, 27 Aug 2019 15:45:21 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7RFicEF161927;
 Tue, 27 Aug 2019 15:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding :
 subject : to : cc : from : message-id; s=corp-2019-08-05;
 bh=WyKHuYGTt7rCIUCLdvfoJZI7yBZI6xjd/yf0k3jt/DI=;
 b=cuBYRRREgbaAIYmAHTJC7fuBr+BonzLMXu6UeP1xmDO2192rMzEmnw6xqWGCAHN5ebUr
 8mntRfL3utGJ5KgO9LCtGGcx15XiEJcSiVMsfuDmKmce1eKqNi85NGjkp5bNtfusAjNj
 zQ7lfcaDYGH1AsWD6KAG2ImlJScbWr+mvEtx8y4I81EwLRygaJHncJUxSnucjZ9RJ76d
 pREVW6YS0w2mtPVJLZRNUf4ItLMdzC/y3V8hCvAnzXMvYe7yrdeRmMuQ8asxPD1SovOD
 zpeuNKPQrPjTJVtyAq0meQlnfh2vv7rK5qz1snilBJtGs0eIvtlv9K/1w10fWZxHHN6m LQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2un6qtrd61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 15:45:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7RFIUTU122992;
 Tue, 27 Aug 2019 15:45:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2un6q12y06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 15:45:17 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7RFjGPV006829;
 Tue, 27 Aug 2019 15:45:16 GMT
Received: from [IPv6:2607:fb90:ac4d:3671:8147:1de1:41fd:7ec6] (/172.58.229.14)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 27 Aug 2019 08:45:16 -0700
Date: Tue, 27 Aug 2019 11:45:11 -0400
User-Agent: K-9 Mail for Android
In-Reply-To: <20190827153839.21737-1-andrew.cooper3@citrix.com>
References: <20190827153839.21737-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Message-ID: <88453B9A-9BD3-4419-9A1C-6DC80076C94B@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9362
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908270156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9362
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908270157
Subject: Re: [Xen-devel] [PATCH] livepatch: Identify the object file
 create-diff-object dislikes
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gQXVndXN0IDI3LCAyMDE5IDExOjM4OjM5IEFNIEVEVCwgQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4uLi4gcmF0aGVyIHRoYW4gbGVhdmluZyB0aGUg
dXNlciB3aXRoIG5vIGhpbnQgYXMgdG8gd2hlcmUgdG8gZGVidWcKPm5leHQuCj4KPlNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4tLS0KPkND
OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CgpSZXZpZXdl
ZC1ieTogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgoKPkND
OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KPi0tLQo+IGxpdmVw
YXRjaC1idWlsZCB8IDIgKy0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPgo+ZGlmZiAtLWdpdCBhL2xpdmVwYXRjaC1idWlsZCBiL2xpdmVwYXRjaC1idWls
ZAo+aW5kZXggNzA2OGZhZi4uYjE5OGM5NyAxMDA3NTUKPi0tLSBhL2xpdmVwYXRjaC1idWlsZAo+
KysrIGIvbGl2ZXBhdGNoLWJ1aWxkCj5AQCAtMTQwLDcgKzE0MCw3IEBAIGZ1bmN0aW9uIGNyZWF0
ZV9wYXRjaCgpCj5kaWUgIm5vIGNvcmUgZmlsZSBmb3VuZCwgcnVuICd1bGltaXQgLWMgdW5saW1p
dGVkJyBhbmQgdHJ5IHRvIHJlY3JlYXRlIgo+ICAgICAgICAgZmkKPiAgICAgICAgIyBjcmVhdGUt
ZGlmZi1vYmplY3QgcmV0dXJucyAzIGlmIG5vIGZ1bmN0aW9uYWwgY2hhbmdlIGlzIGZvdW5kCj4t
ICAgICAgICBbWyAkcmMgLWVxIDAgXV0gfHwgW1sgJHJjIC1lcSAzIF1dIHx8IEVSUk9SPSQoZXhw
ciAkRVJST1IgIisiCj4xKQo+KyAgICAgICAgW1sgJHJjIC1lcSAwIF1dIHx8IFtbICRyYyAtZXEg
MyBdXSB8fCB7IEVSUk9SPSQoZXhwciAkRVJST1IKPiIrIiAxKTsgd2FybiAiY3JlYXRlLWRpZmYt
b2JqZWN0ICRpIHJjICRyYyI7IH0KPiAgICAgICAgIGlmIFtbICRyYyAtZXEgMCBdXTsgdGhlbgo+
ICAgICAgICAgICAgIENIQU5HRUQ9MQo+ICAgICAgICAgZmkKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
