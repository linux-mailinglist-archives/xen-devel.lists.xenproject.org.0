Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87316177DA3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 18:40:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9BTp-0000gk-S5; Tue, 03 Mar 2020 17:37:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8H3=4U=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1j9BTo-0000gf-TQ
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 17:37:16 +0000
X-Inumbo-ID: 9f7f799e-5d75-11ea-8adc-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f7f799e-5d75-11ea-8adc-bc764e2007e4;
 Tue, 03 Mar 2020 17:37:16 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023HN1O1005389;
 Tue, 3 Mar 2020 17:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=TigWHKuU0u8e8cBMH2aBQQB/e3/5kFEeKkleJ+pVwic=;
 b=GsFMh/Fay0vq5JL5EP78UFlmxGMxM1zg7/0m0mFqRWnZR8Yv8zXDEHO6MPmIGXqbFWIo
 t2V5WlHaXien2BS9ibonyge254FTEwkYOz/KPnVdmMvOoXBvxjtKMNE6MAgjsXwyBMSK
 J0nM8KtkXMwDuJl0MDr2NAnvcH6Cq3jUZZNHxGvcL+gBl3ojorGTrAqcwCrw38++1m9q
 P9/SDzHwIdwD7+9lHZCkHkELQSFfE3TJjqnYkjbSswEaUX8oB44h2Svsb/j+E9/NSH7m
 bED0X+F0K5maWzs3VvkdmPMlbk2spvFplDH68ZepPi9TWTgSlqFLKS2ehAac0wOvvxJw CA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2yghn34pa3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 17:37:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023Hb9oe018102;
 Tue, 3 Mar 2020 17:37:13 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2yg1em8ujh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 17:37:11 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 023HaX6a026231;
 Tue, 3 Mar 2020 17:36:33 GMT
Received: from dhcp-10-211-47-111.usdhcp.oraclecorp.com (/10.211.47.111)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Mar 2020 09:36:33 -0800
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20200303015859.18813-1-dongli.zhang@oracle.com>
 <2f175c30-b6b9-5f21-6cf3-2ee89e0c475e@xen.org>
From: dongli.zhang@oracle.com
Organization: Oracle Corporation
Message-ID: <4d2428a4-01f7-cf23-82e1-6a9bec2c6d19@oracle.com>
Date: Tue, 3 Mar 2020 09:36:32 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2f175c30-b6b9-5f21-6cf3-2ee89e0c475e@xen.org>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=3 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030117
Subject: Re: [Xen-devel] [PATCH 1/2] xenbus: req->body should be updated
 before req->state
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
Cc: jgross@suse.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joe.jin@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzLzMvMjAgMTo0MCBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDAz
LzAzLzIwMjAgMDE6NTgsIERvbmdsaSBaaGFuZyB3cm90ZToKPj4gVGhlIHJlcS0+Ym9keSBzaG91
bGQgYmUgdXBkYXRlZCBiZWZvcmUgcmVxLT5zdGF0ZSBpcyB1cGRhdGVkIGFuZCB0aGUKPj4gb3Jk
ZXIgc2hvdWxkIGJlIGd1YXJhbnRlZWQgYnkgYSBiYXJyaWVyLgo+Pgo+PiBPdGhlcndpc2UsIHJl
YWRfcmVwbHkoKSBtaWdodCByZXR1cm4gcmVxLT5ib2R5ID0gTlVMTC4KPj4KPj4gQmVsb3cgaXMg
c2FtcGxlIGNhbGxzdGFjayB3aGVuIHRoZSBpc3N1ZSBpcyByZXByb2R1Y2VkIG9uIHB1cnBvc2Ug
YnkKPj4gcmVvcmRlcmluZyB0aGUgdXBkYXRlcyBvZiByZXEtPmJvZHkgYW5kIHJlcS0+c3RhdGUg
YW5kIGFkZGluZyBkZWxheSBpbgo+PiBjb2RlIGJldHdlZW4gdXBkYXRlcyBvZiByZXEtPnN0YXRl
IGFuZCByZXEtPmJvZHkuCj4+Cj4+IFvCoMKgIDIyLjM1NjEwNV0gZ2VuZXJhbCBwcm90ZWN0aW9u
IGZhdWx0OiAwMDAwIFsjMV0gU01QIFBUSQo+PiBbwqDCoCAyMi4zNjExODVdIENQVTogMiBQSUQ6
IDUyIENvbW06IHhlbndhdGNoIE5vdCB0YWludGVkIDUuNS4weGVuKyAjNgo+PiBbwqDCoCAyMi4z
NjY3MjddIEhhcmR3YXJlIG5hbWU6IFhlbiBIVk0gZG9tVSwgQklPUyAuLi4KPj4gW8KgwqAgMjIu
MzcyMjQ1XSBSSVA6IDAwMTA6X3BhcnNlX2ludGVnZXJfZml4dXBfcmFkaXgrMHg2LzB4NjAKPj4g
Li4uIC4uLgo+PiBbwqDCoCAyMi4zOTIxNjNdIFJTUDogMDAxODpmZmZmYjJkNjQwMjNmZGYwIEVG
TEFHUzogMDAwMTAyNDYKPj4gW8KgwqAgMjIuMzk1OTMzXSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAg
UkJYOiA3NTc0NmU3NTYyNzU1ZjZkIFJDWDogMDAwMDAwMDAwMDAwMDAwMAo+PiBbwqDCoCAyMi40
MDA4NzFdIFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IGZmZmZiMmQ2NDAyM2ZkZmMgUkRJOiA3
NTc0NmU3NTYyNzU1ZjZkCj4+IFvCoMKgIDIyLjQwNTg3NF0gUkJQOiAwMDAwMDAwMDAwMDAwMDAw
IFIwODogMDAwMDAwMDAwMDAwMDFlOCBSMDk6IDAwMDAwMDAwMDBjZGNkY2QKPj4gW8KgwqAgMjIu
NDEwOTQ1XSBSMTA6IGZmZmZiMmQ2NDAyZmZlMDAgUjExOiBmZmZmOWQ5NTM5NWVhZWIwIFIxMjog
ZmZmZjlkOTUzNTkzNTAwMAo+PiBbwqDCoCAyMi40MTc2MTNdIFIxMzogZmZmZjlkOTUyNmQ0YTAw
MCBSMTQ6IGZmZmY5ZDk1MjZmNGYzNDAgUjE1OiBmZmZmOWQ5NTM3NjU0MDAwCj4+IFvCoMKgIDIy
LjQyMzcyNl0gRlM6wqAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmOWQ5NTNiYzgwMDAw
KDAwMDApCj4+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPj4gW8KgwqAgMjIuNDI5ODk4XSBDUzrC
oCAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwo+PiBbwqDCoCAy
Mi40MzQzNDJdIENSMjogMDAwMDAwYzQyMDZhOTAwMCBDUjM6IDAwMDAwMDAxZWEzZmMwMDIgQ1I0
OiAwMDAwMDAwMDAwMTYwNmUwCj4+IFvCoMKgIDIyLjQzOTY0NV0gRFIwOiAwMDAwMDAwMDAwMDAw
MDAwIERSMTogMDAwMDAwMDAwMDAwMDAwMCBEUjI6IDAwMDAwMDAwMDAwMDAwMDAKPj4gW8KgwqAg
MjIuNDQ0OTQxXSBEUjM6IDAwMDAwMDAwMDAwMDAwMDAgRFI2OiAwMDAwMDAwMGZmZmUwZmYwIERS
NzogMDAwMDAwMDAwMDAwMDQwMAo+PiBbwqDCoCAyMi40NTAzNDJdIENhbGwgVHJhY2U6Cj4+IFvC
oMKgIDIyLjQ1MjUwOV3CoCBzaW1wbGVfc3RydG91bGwrMHgyNy8weDcwCj4+IFvCoMKgIDIyLjQ1
NTU3Ml3CoCB4ZW5idXNfdHJhbnNhY3Rpb25fc3RhcnQrMHgzMS8weDUwCj4+IFvCoMKgIDIyLjQ1
OTEwNF3CoCBuZXRiYWNrX2NoYW5nZWQrMHg3NmMvMHhjYzEgW3hlbl9uZXRmcm9udF0KPj4gW8Kg
wqAgMjIuNDYzMjc5XcKgID8gZmluZF93YXRjaCsweDQwLzB4NDAKPj4gW8KgwqAgMjIuNDY2MTU2
XcKgIHhlbndhdGNoX3RocmVhZCsweGI0LzB4MTUwCj4+IFvCoMKgIDIyLjQ2OTMwOV3CoCA/IHdh
aXRfd29rZW4rMHg4MC8weDgwCj4+IFvCoMKgIDIyLjQ3MjE5OF3CoCBrdGhyZWFkKzB4MTBlLzB4
MTMwCj4+IFvCoMKgIDIyLjQ3NDkyNV3CoCA/IGt0aHJlYWRfcGFyaysweDgwLzB4ODAKPj4gW8Kg
wqAgMjIuNDc3OTQ2XcKgIHJldF9mcm9tX2ZvcmsrMHgzNS8weDQwCj4+IFvCoMKgIDIyLjQ4MDk2
OF0gTW9kdWxlcyBsaW5rZWQgaW46IHhlbl9rYmRmcm9udCB4ZW5fZmJmcm9udCgrKSB4ZW5fbmV0
ZnJvbnQKPj4geGVuX2Jsa2Zyb250Cj4+IFvCoMKgIDIyLjQ4Njc4M10gLS0tWyBlbmQgdHJhY2Ug
YTkyMjIwMzBhNzQ3YzNmNyBdLS0tCj4+IFvCoMKgIDIyLjQ5MDQyNF0gUklQOiAwMDEwOl9wYXJz
ZV9pbnRlZ2VyX2ZpeHVwX3JhZGl4KzB4Ni8weDYwCj4+Cj4+IFRoZSAid2hpbGUiIGlzIGNoYW5n
ZWQgdG8gImRvIHdoaWxlIiBzbyB0aGF0IHdhaXRfZXZlbnQoKSBpcyB1c2VkIGFzIGEKPj4gYmFy
cmllci4KPiAKPiBUaGUgY29ycmVjdCBiYXJyaWVyIGZvciByZWFkX3JlcGx5KCkgc2hvdWxkIGJl
IHZpcnRfcm1iKCkuIFdoaWxlIG9uIHg4NiwgdGhpcyBpcwo+IGVxdWl2YWxlbnQgdG8gYmFycmll
cigpLCBvbiBBcm0gdGhpcyB3aWxsIGJlIGEgZG1iKGlzaCkgdG8gcHJldmVudCB0aGUgcHJvY2Vz
c29yCj4gcmUtb3JkZXJpbmcgbWVtb3J5IGFjY2Vzcy4KPiAKPiBUaGVyZWZvcmUgdGhlIGJhcnJp
ZXIgaW4gdGVzdF9yZXBseSgpIChjYWxsZWQgYnkgd2FpdF9ldmVudCgpKSBpcyBub3QgZ29pbmcg
dG8KPiBiZSBzdWZmaWNpZW50IGZvciBBcm0uCgpTb3JyeSB0aGF0IEkganVzdCBlcnJvbmVvdXNs
eSB0aG91Z2h0IHdhaXRfZXZlbnQoKSB3b3VsZCBiZSB1c2VkIGFzIHJlYWQgYmFycmllci4KCkkg
d291bGQgY2hhbmdlIGJhcnJpZXIoKSB0byB2aXJ0X3JtYigpIGZvciByZWFkX3JlcGx5KCkgaW4g
djIuCgpUaGFuayB5b3UgdmVyeSBtdWNoIQoKRG9uZ2xpIFpoYW5nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
