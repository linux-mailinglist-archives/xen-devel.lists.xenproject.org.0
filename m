Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1773417842A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 21:39:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9EH7-0007dP-9k; Tue, 03 Mar 2020 20:36:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8H3=4U=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1j9EH6-0007dI-0v
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 20:36:20 +0000
X-Inumbo-ID: a28ed274-5d8e-11ea-b7d4-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a28ed274-5d8e-11ea-b7d4-bc764e2007e4;
 Tue, 03 Mar 2020 20:36:18 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023KNq1T038916;
 Tue, 3 Mar 2020 20:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=gSPnYkp/gsBfpEV6Yjj6/q+Wa2a1CF7Q8zfIoEjeOPw=;
 b=ZFBuyQ+eCwWA5xgrbllDuccKRz6ZPMamZaeDKyOm4D316dF6puF5+p5FdMs+G8luuhCb
 flHya7lPzFFURhF0gtyGjxrAyrUZWfbKgU+fybEPDntRO8cX9ETVeYsDmlfUdAkfEDZL
 FR0wWm65LpNj+FFEFc5KI/eqA3M8ui2OeNCsNCYVXLHhD93Z9kgWjZxE1phlvpOfjip7
 DQR8fC/9yqvjhViVnN+OTjN+1tjNwV+sOv0XjlmsfZnzkh8rWjb6ezKoVszVzxgsT0mH
 RdJHpA6cc1/a7fuSVvnMBEQGpGOkaF8YlgLhummFCy1UL5OfKKUaTI8vMvmycJlaR2mJ 9g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2yffcuhwtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 20:36:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023KH1I4123203;
 Tue, 3 Mar 2020 20:36:16 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2yg1gy7cyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 20:36:15 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 023KaDvb009743;
 Tue, 3 Mar 2020 20:36:13 GMT
Received: from dhcp-10-211-47-111.usdhcp.oraclecorp.com (/10.211.47.111)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Mar 2020 12:36:12 -0800
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20200303184752.20821-1-dongli.zhang@oracle.com>
 <4ed129f9-ff23-f228-6833-77e37c2bb7b2@xen.org>
From: dongli.zhang@oracle.com
Organization: Oracle Corporation
Message-ID: <89e891be-2572-fdbf-d627-d1b71284e50d@oracle.com>
Date: Tue, 3 Mar 2020 12:36:11 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <4ed129f9-ff23-f228-6833-77e37c2bb7b2@xen.org>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=3 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=3 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030130
Subject: Re: [Xen-devel] [PATCH v2 1/2] xenbus: req->body should be updated
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

CgpPbiAzLzMvMjAgMTE6MzcgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAw
My8wMy8yMDIwIDE4OjQ3LCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4+IFRoZSByZXEtPmJvZHkgc2hv
dWxkIGJlIHVwZGF0ZWQgYmVmb3JlIHJlcS0+c3RhdGUgaXMgdXBkYXRlZCBhbmQgdGhlCj4+IG9y
ZGVyIHNob3VsZCBiZSBndWFyYW50ZWVkIGJ5IGEgYmFycmllci4KPj4KPj4gT3RoZXJ3aXNlLCBy
ZWFkX3JlcGx5KCkgbWlnaHQgcmV0dXJuIHJlcS0+Ym9keSA9IE5VTEwuCj4+Cj4+IEJlbG93IGlz
IHNhbXBsZSBjYWxsc3RhY2sgd2hlbiB0aGUgaXNzdWUgaXMgcmVwcm9kdWNlZCBvbiBwdXJwb3Nl
IGJ5Cj4+IHJlb3JkZXJpbmcgdGhlIHVwZGF0ZXMgb2YgcmVxLT5ib2R5IGFuZCByZXEtPnN0YXRl
IGFuZCBhZGRpbmcgZGVsYXkgaW4KPj4gY29kZSBiZXR3ZWVuIHVwZGF0ZXMgb2YgcmVxLT5zdGF0
ZSBhbmQgcmVxLT5ib2R5Lgo+Pgo+PiBbwqDCoCAyMi4zNTYxMDVdIGdlbmVyYWwgcHJvdGVjdGlv
biBmYXVsdDogMDAwMCBbIzFdIFNNUCBQVEkKPj4gW8KgwqAgMjIuMzYxMTg1XSBDUFU6IDIgUElE
OiA1MiBDb21tOiB4ZW53YXRjaCBOb3QgdGFpbnRlZCA1LjUuMHhlbisgIzYKPj4gW8KgwqAgMjIu
MzY2NzI3XSBIYXJkd2FyZSBuYW1lOiBYZW4gSFZNIGRvbVUsIEJJT1MgLi4uCj4+IFvCoMKgIDIy
LjM3MjI0NV0gUklQOiAwMDEwOl9wYXJzZV9pbnRlZ2VyX2ZpeHVwX3JhZGl4KzB4Ni8weDYwCj4+
IC4uLiAuLi4KPj4gW8KgwqAgMjIuMzkyMTYzXSBSU1A6IDAwMTg6ZmZmZmIyZDY0MDIzZmRmMCBF
RkxBR1M6IDAwMDEwMjQ2Cj4+IFvCoMKgIDIyLjM5NTkzM10gUkFYOiAwMDAwMDAwMDAwMDAwMDAw
IFJCWDogNzU3NDZlNzU2Mjc1NWY2ZCBSQ1g6IDAwMDAwMDAwMDAwMDAwMDAKPj4gW8KgwqAgMjIu
NDAwODcxXSBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiBmZmZmYjJkNjQwMjNmZGZjIFJESTog
NzU3NDZlNzU2Mjc1NWY2ZAo+PiBbwqDCoCAyMi40MDU4NzRdIFJCUDogMDAwMDAwMDAwMDAwMDAw
MCBSMDg6IDAwMDAwMDAwMDAwMDAxZTggUjA5OiAwMDAwMDAwMDAwY2RjZGNkCj4+IFvCoMKgIDIy
LjQxMDk0NV0gUjEwOiBmZmZmYjJkNjQwMmZmZTAwIFIxMTogZmZmZjlkOTUzOTVlYWViMCBSMTI6
IGZmZmY5ZDk1MzU5MzUwMDAKPj4gW8KgwqAgMjIuNDE3NjEzXSBSMTM6IGZmZmY5ZDk1MjZkNGEw
MDAgUjE0OiBmZmZmOWQ5NTI2ZjRmMzQwIFIxNTogZmZmZjlkOTUzNzY1NDAwMAo+PiBbwqDCoCAy
Mi40MjM3MjZdIEZTOsKgIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjlkOTUzYmM4MDAw
MCgwMDAwKQo+PiBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCj4+IFvCoMKgIDIyLjQyOTg5OF0gQ1M6
wqAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPj4gW8KgwqAg
MjIuNDM0MzQyXSBDUjI6IDAwMDAwMGM0MjA2YTkwMDAgQ1IzOiAwMDAwMDAwMWVhM2ZjMDAyIENS
NDogMDAwMDAwMDAwMDE2MDZlMAo+PiBbwqDCoCAyMi40Mzk2NDVdIERSMDogMDAwMDAwMDAwMDAw
MDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOiAwMDAwMDAwMDAwMDAwMDAwCj4+IFvCoMKg
IDIyLjQ0NDk0MV0gRFIzOiAwMDAwMDAwMDAwMDAwMDAwIERSNjogMDAwMDAwMDBmZmZlMGZmMCBE
Ujc6IDAwMDAwMDAwMDAwMDA0MDAKPj4gW8KgwqAgMjIuNDUwMzQyXSBDYWxsIFRyYWNlOgo+PiBb
wqDCoCAyMi40NTI1MDldwqAgc2ltcGxlX3N0cnRvdWxsKzB4MjcvMHg3MAo+PiBbwqDCoCAyMi40
NTU1NzJdwqAgeGVuYnVzX3RyYW5zYWN0aW9uX3N0YXJ0KzB4MzEvMHg1MAo+PiBbwqDCoCAyMi40
NTkxMDRdwqAgbmV0YmFja19jaGFuZ2VkKzB4NzZjLzB4Y2MxIFt4ZW5fbmV0ZnJvbnRdCj4+IFvC
oMKgIDIyLjQ2MzI3OV3CoCA/IGZpbmRfd2F0Y2grMHg0MC8weDQwCj4+IFvCoMKgIDIyLjQ2NjE1
Nl3CoCB4ZW53YXRjaF90aHJlYWQrMHhiNC8weDE1MAo+PiBbwqDCoCAyMi40NjkzMDldwqAgPyB3
YWl0X3dva2VuKzB4ODAvMHg4MAo+PiBbwqDCoCAyMi40NzIxOThdwqAga3RocmVhZCsweDEwZS8w
eDEzMAo+PiBbwqDCoCAyMi40NzQ5MjVdwqAgPyBrdGhyZWFkX3BhcmsrMHg4MC8weDgwCj4+IFvC
oMKgIDIyLjQ3Nzk0Nl3CoCByZXRfZnJvbV9mb3JrKzB4MzUvMHg0MAo+PiBbwqDCoCAyMi40ODA5
NjhdIE1vZHVsZXMgbGlua2VkIGluOiB4ZW5fa2JkZnJvbnQgeGVuX2ZiZnJvbnQoKykgeGVuX25l
dGZyb250Cj4+IHhlbl9ibGtmcm9udAo+PiBbwqDCoCAyMi40ODY3ODNdIC0tLVsgZW5kIHRyYWNl
IGE5MjIyMDMwYTc0N2MzZjcgXS0tLQo+PiBbwqDCoCAyMi40OTA0MjRdIFJJUDogMDAxMDpfcGFy
c2VfaW50ZWdlcl9maXh1cF9yYWRpeCsweDYvMHg2MAo+Pgo+PiBUaGUgYmFycmllcigpIGluIHRl
c3RfcmVwbHkoKSBpcyBjaGFuZ2VkIHRvIHZpcnRfcm1iKCkuIFRoZSAid2hpbGUiIGlzCj4+IGNo
YW5nZWQgdG8gImRvIHdoaWxlIiBzbyB0aGF0IHRlc3RfcmVwbHkoKSBpcyB1c2VkIGFzIGEgcmVh
ZCBtZW1vcnkKPj4gYmFycmllci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRG9uZ2xpIFpoYW5nIDxk
b25nbGkuemhhbmdAb3JhY2xlLmNvbT4KPj4gLS0tCj4+IENoYW5nZWQgc2luY2UgdjE6Cj4+IMKg
wqAgLSBjaGFuZ2UgImJhcnJpZXIoKSIgdG8gInZpcnRfcm1iKCkiIGluIHRlc3RfcmVwbHkoKQo+
Pgo+PiDCoCBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NvbW1zLmMgfMKgIDIgKysKPj4gwqAg
ZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194cy5jwqDCoMKgIHwgMTEgKysrKysrKy0tLS0KPj4g
wqAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NvbW1zLmMKPj4gYi9kcml2
ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NvbW1zLmMKPj4gaW5kZXggZDIzOWZjM2M1ZTNkLi44NTJl
ZDE2MWZjMmEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfY29tbXMu
Ywo+PiArKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NvbW1zLmMKPj4gQEAgLTMxMyw2
ICszMTMsOCBAQCBzdGF0aWMgaW50IHByb2Nlc3NfbXNnKHZvaWQpCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJlcS0+bXNnLnR5cGUgPSBzdGF0ZS5tc2cudHlwZTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmVxLT5tc2cubGVuID0gc3RhdGUubXNnLmxlbjsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVxLT5ib2R5ID0gc3RhdGUuYm9keTsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLyogd3JpdGUgYm9keSwgdGhlbiB1cGRhdGUgc3RhdGUgKi8KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdmlydF93bWIoKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVxLT5zdGF0ZSA9IHhiX3JlcV9zdGF0ZV9nb3RfcmVwbHk7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlcS0+Y2IocmVxKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxz
ZQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194cy5jIGIvZHJpdmVy
cy94ZW4veGVuYnVzL3hlbmJ1c194cy5jCj4+IGluZGV4IGRkYzE4ZGE2MTgzNC4uMWUxNGMyMTE4
ODYxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3hzLmMKPj4gKysr
IGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194cy5jCj4+IEBAIC0xOTQsMTUgKzE5NCwxOCBA
QCBzdGF0aWMgYm9vbCB0ZXN0X3JlcGx5KHN0cnVjdCB4Yl9yZXFfZGF0YSAqcmVxKQo+PiDCoMKg
wqDCoMKgIGlmIChyZXEtPnN0YXRlID09IHhiX3JlcV9zdGF0ZV9nb3RfcmVwbHkgfHwgIXhlbmJ1
c19vaygpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+IMKgIC3CoMKgwqAg
LyogTWFrZSBzdXJlIHRvIHJlcmVhZCByZXEtPnN0YXRlIGVhY2ggdGltZS4gKi8KPj4gLcKgwqDC
oCBiYXJyaWVyKCk7Cj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogcmVhZCByZXEtPnN0YXRl
IGJlZm9yZSBvdGhlciBmaWVsZHMgb2Ygc3RydWN0IHhiX3JlcV9kYXRhCj4+ICvCoMKgwqDCoCAq
IGluIHRoZSBjYWxsZXIgb2YgdGVzdF9yZXBseSgpLCBlLmcuLCByZWFkX3JlcGx5KCkKPj4gK8Kg
wqDCoMKgICovCj4+ICvCoMKgwqAgdmlydF9ybWIoKTsKPiAKPiBMb29raW5nIGF0IHRoZSBjb2Rl
IGFnYWluLCBJIGFtIGFmcmFpZCB0aGUgYmFycmllciBvbmx5IGhhcHBlbiBpbiB0aGUgZmFsc2UK
PiBjYXNlLiBTaG91bGQgbm90IHRoZSBuZXcgYmFycmllciBhZGRlZCBpbiB0aGUgJ3RydWUnIGNh
c2U/CgpJIHdvdWxkIGxlYXZlIHRoZSBvcmlnaW5hbCAiYmFycmllcigpIiBpbiB0aGUgJ2ZhbHNl
JyBjYXNlIGFuZCBhZGQgdGhlIG5ldwpiYXJyaWVyIG9ubHkgaW4gdGhlICd0cnVlJyBjYXNlLgoK
VGhhbmsgeW91IHZlcnkgbXVjaCEKCkRvbmdsaSBaaGFuZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
