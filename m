Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DE914ACFD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 01:11:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwERH-0004tR-Py; Tue, 28 Jan 2020 00:09:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XXmC=3R=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iwERG-0004tM-VK
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 00:09:06 +0000
X-Inumbo-ID: 65b4b1ae-4162-11ea-b45d-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65b4b1ae-4162-11ea-b45d-bc764e2007e4;
 Tue, 28 Jan 2020 00:09:06 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00S08GXX031390;
 Tue, 28 Jan 2020 00:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=nFP6tD0gr6OjQbraBo9JTMDRKCB5Yv89xXEgOTD5l60=;
 b=TEiP2rI+tVscYTAl1EA7g9qk0fxdz2o3+m0TKLt/soyZ6GldGlRcsV7prXxMcUm5sXnx
 bGZ2wlB6EA8xzOBFCcnuSJ4b+DQlhN917lX7aAf6XWj5Q/BgSl97O8VUXB51oZpE6HXp
 m3jHMLQv+SsPYBfN8/tpd9O0Qs8jUcbFiFRpOB48QfBpZ/xvVUbusfGTZrVAADdLYG88
 kPvI9ZM+JPPdLnXhCIMfW0XkKF/eQvDh6wcjt3+8tXmbIfAVyCEk43m4Lkzlv6QS0kEu
 /G0RngFnR04NZAlbV5A5bKJL/rCxa1ELgdywU1+5KRxeOPuy/lIcA58KBEQY4qERucR6 nA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2xrdmqavcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jan 2020 00:08:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00S08rf3059225;
 Tue, 28 Jan 2020 00:08:58 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2xry6w7ecs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jan 2020 00:08:53 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00S08IOm012605;
 Tue, 28 Jan 2020 00:08:18 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 27 Jan 2020 16:08:18 -0800
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <alpine.DEB.2.20.2001271510110.7272@whs-18.cs.helsinki.fi>
 <c7acac38-e598-feec-e9c1-7c1599aba8cf@suse.com>
 <20200127213722.GC2995@mail-itl>
 <a486de72-c3bf-2d32-c86c-0e38d9d87f0a@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <517e2a5d-a43b-177e-1afd-119d84634af2@oracle.com>
Date: Mon, 27 Jan 2020 19:08:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a486de72-c3bf-2d32-c86c-0e38d9d87f0a@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=927
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001270188
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=990 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001270188
Subject: Re: [Xen-devel] Linux 5.5 fails to boot in VM
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>,
 Jason Gunthorpe <jgg@mellanox.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KFNvcnJ5LCB3aXRoIHByb3BlciBhZGRyZXNzaW5nIG5vdykKCk9uIDEvMjcvMjAgNjoyOSBQTSwg
Qm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Cj4KPiBPbiAxLzI3LzIwIDQ6MzcgUE0sIE1hcmVrIE1h
cmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPj4KPj4+PiBMb2FkaW5nIExpbnV4IDUuNS4wLWFj
Y2VjbjMwIC4uLgo+Pj4+Cj4+Pj4gLls1OzIySCAgICAgIFsgaW5pdHJkLmltZy01LjUuMC1hY2Mg
IDE2LjUyTWlCICAxMDAlICAxMC4yM01pQi9zIF0uWzU7MUhTZXR0aW5nIHVwIHN3YXBzcGFjZSB2
ZXJzaW9uIDEsIHNpemUgPSAxMDczNzM3NzI4IGJ5dGVzCj4+Pj4gL2Rldi94dmRhMzogY2xlYW4s
IDg1MjExOC8xMjk0ODk2IGZpbGVzLCAzMDc2Nzg1LzUxOTA5MDcgYmxvY2tzCj4+Pj4gWyAgICAy
LjczMDkzMV0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAw
MDAwMDAwMDAwMDAwM2IwCj4+Pj4gWyAgICAyLjczMDk1OV0gI1BGOiBzdXBlcnZpc29yIHJlYWQg
YWNjZXNzIGluIGtlcm5lbCBtb2RlCj4+Pj4gWyAgICAyLjczMDk2Nl0gI1BGOiBlcnJvcl9jb2Rl
KDB4MDAwMCkgLSBub3QtcHJlc2VudCBwYWdlCj4+Pj4gWyAgICAyLjczMDk3M10gUEdEIDAgUDRE
IDAKPj4+PiBbICAgIDIuNzMwOTc4XSBPb3BzOiAwMDAwIFsjMV0gU01QIFBUSQo+Pj4+IFsgICAg
Mi43MzA5ODVdIENQVTogMSBQSUQ6IDQwMiBDb21tOiBxdWJlc2RiLWRhZW1vbiBUYWludGVkOiBH
ICAgICAgICAgICBPICAgICAgNS41LjAtYWNjZWNuMzAgIzMxCj4+Pj4gWyAgICAyLjczMTAwMF0g
UklQOiAwMDEwOm1tdV9pbnRlcnZhbF9yZWFkX2JlZ2luKzB4MjQvMHhjMAo+Cj4KPgo+Cj4gVGhp
cyBsb29rcyBsaWtlIGl0IGNvdWxkIHdlbGwgYmUKPiBkM2VlYjFkNzdjNWQwYWY5ZGY0NDJkYjYz
NzIyOTI4MjM4MzEwYTg2LiBDYW4geW91IHJldmVydCBpdCBhbmQgc2VlIGlmCj4gaXQgbWFrZXMg
YSBkaWZmZXJlbmNlPwo+Cj4gKCtKYXNvbikKPgo+IC1ib3Jpcwo+Cj4KPgo+Cj4+Pj4gWyAgICAy
LjczMTAwOF0gQ29kZTogZTkgNTEgNjYgZTEgZmYgOTAgMGYgMWYgNDQgMDAgMDAgNDEgNTQgNDkg
ODkgZmMgNTUgNTMgNDggODMgZWMgMzAgNjUgNDggOGIgMDQgMjUgMjggMDAgMDAgMDAgNDggODkg
NDQgMjQgMjggMzEgYzAgNDggOGIgNDcgMzggPDQ4PiA4YiBhOCBiMCAwMyAwMCAwMCA0OCA4ZCA1
ZCAwYyA0OCA4OSBkZiBlOCA0OSAyNyA2ZiAwMCA0ZCA4YiA2NAo+Pj4+IFsgICAgMi43MzEwMzBd
IFJTUDogMDAxODpmZmZmOTg3MzAwMWU3ZDIwIEVGTEFHUzogMDAwMTAyNDYKPj4+PiBbICAgIDIu
NzMxMDM3XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiBmZmZmOGE0ZTk0NzEyNTAwIFJDWDog
MDAwMDAwMDAwMDAwMDAwMAoKCgpJIGFtIHByZXR0eSBzdXJlIGl0IGlzLgoKUkFYPTAgbW9zdCBs
aWtlbHkgbWVhbnMgdGhhdCBtYXAtPm5vdGlmaWVyIGlzIE5VTEwgKGFzc3VtaW5nIHlvdXIKY29t
cGlsZXIgZ2VuZXJhdGVzIGNvZGUgc2ltaWxhciB0byBtaW5lKS4KCkkgYmVsaWV2ZSB5b3UgYXQg
bGVhc3QgbmVlZAoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9nbnRkZXYuYyBiL2RyaXZlcnMv
eGVuL2dudGRldi5jCmluZGV4IDRmYzgzZTNmLi5kMzVjZjBiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3hlbi9nbnRkZXYuYworKysgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYwpAQCAtMTAxNiw3ICsxMDE2
LDggQEAgc3RhdGljIGludCBnbnRkZXZfbW1hcChzdHJ1Y3QgZmlsZSAqZmxpcCwgc3RydWN0CnZt
X2FyZWFfc3RydWN0ICp2bWEpCsKgwqDCoMKgwqDCoMKgwqAgKiBhbmQgd2UgYXJlIGhvbGRpbmcg
aXQgbm93LCB0aGVyZSBpcyBubyBuZWVkIGZvciB0aGUKbm90aWZpZXJfcmFuZ2UKwqDCoMKgwqDC
oMKgwqDCoCAqIGxvY2tpbmcgcGF0dGVybi4KwqDCoMKgwqDCoMKgwqDCoCAqLwotwqDCoMKgwqDC
oMKgIG1tdV9pbnRlcnZhbF9yZWFkX2JlZ2luKCZtYXAtPm5vdGlmaWVyKTsKK8KgwqDCoMKgwqDC
oCBpZiAodXNlX3B0ZW1vZCkKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW11X2ludGVy
dmFsX3JlYWRfYmVnaW4oJm1hcC0+bm90aWZpZXIpOwrCoArCoMKgwqDCoMKgwqDCoCBpZiAodXNl
X3B0ZW1vZCkgewrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwLT5wYWdlc192bV9z
dGFydCA9IHZtYS0+dm1fc3RhcnQ7CgoKYW5kIG1heWJlIG1vcmUuwqAgR2l2ZSB0aGF0IGEgdHJ5
LgoKCi1ib3JpcwoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
