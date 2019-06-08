Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C1439B56
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jun 2019 07:54:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZUFf-000100-7e; Sat, 08 Jun 2019 05:50:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/yG=UH=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hZUFe-0000zv-5b
 for xen-devel@lists.xenproject.org; Sat, 08 Jun 2019 05:50:50 +0000
X-Inumbo-ID: 5d6e8733-89b1-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5d6e8733-89b1-11e9-8980-bc764e045a96;
 Sat, 08 Jun 2019 05:50:48 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x585muaV080604;
 Sat, 8 Jun 2019 05:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=eCGn2HgXow8RyOmSGWkBzbytLgwPE+mSpcit9XmqcJg=;
 b=BmUtVTTuGNNgNik7clvsfwJD2ob1DR+D3dt7g1RItTXOp/uLh9UDuVXORqfYGT/Mb+8m
 wVf3YV7wiSU91qLd+KdAZcTCnHm/NmxswWBOKz6lGa9gmTwrmlBojEuOLfzxEqt6JkgT
 o7HZDhbuA0AtdzUQtaCer/p3z1iqTyWBoMyaZdFJ4xCA5s+nuY1l51BuFbWLrDXHvvez
 qOxS4Qj4RmNLVN25ROOynKSXMsoaI98amoUmbtmoYd9uYucDX/dBv4EZ1EemIwUe+ge8
 8cPzp2NI/uXS3MNmJnpn86ezY8tHL9+sdriZ/CBNEV1UdwJaj1ZfvX0EoX+q9lu+Jtwq 7Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2t04et88eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Jun 2019 05:50:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x585o5db021097;
 Sat, 8 Jun 2019 05:50:45 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2t04u21jxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Jun 2019 05:50:44 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x585oh9P031110;
 Sat, 8 Jun 2019 05:50:43 GMT
Received: from [192.168.0.110] (/70.36.60.91)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 Jun 2019 22:50:43 -0700
To: Juergen Gross <jgross@suse.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <5649cfd1-24df-2196-2888-b00fc3ace7ad@suse.com>
 <ede6db03-121c-9ec6-f8eb-dbcc605977b4@oracle.com>
 <c73a6ec5-687e-d3ef-e5d7-5700d240b4ec@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <29e94cec-66ae-baf0-d189-f9487ce162a7@oracle.com>
Date: Fri, 7 Jun 2019 22:50:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c73a6ec5-687e-d3ef-e5d7-5700d240b4ec@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9281
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906080044
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9281
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906080045
Subject: Re: [Xen-devel] [RFC PATCH 00/16] xenhost support
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
Cc: sstabellini@kernel.org, konrad.wilk@oracle.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 pbonzini@redhat.com, boris.ostrovsky@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wNi0wNyA5OjIxIGEubS4sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDcuMDYu
MTkgMTc6MjIsIEpvYW8gTWFydGlucyB3cm90ZToKPj4gT24gNi83LzE5IDM6NTEgUE0sIEp1ZXJn
ZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBPbiAwOS4wNS4xOSAxOToyNSwgQW5rdXIgQXJvcmEgd3JvdGU6
Cj4+Pj4gSGkgYWxsLAo+Pj4+Cj4+Pj4gVGhpcyBpcyBhbiBSRkMgZm9yIHhlbmhvc3Qgc3VwcG9y
dCwgb3V0bGluZWQgaGVyZSBieSBKdWVyZ2VuIGhlcmU6Cj4+Pj4gaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMTkvNC84LzY3Lgo+Pj4KPj4+IEZpcnN0OiB0aGFua3MgZm9yIGFsbCB0aGUgZWZmb3J0
IHlvdSd2ZSBwdXQgaW50byB0aGlzIHNlcmllcyEKPj4+Cj4+Pj4gVGhlIGhpZ2ggbGV2ZWwgaWRl
YSBpcyB0byBwcm92aWRlIGFuIGFic3RyYWN0aW9uIG9mIHRoZSBYZW4KPj4+PiBjb21tdW5pY2F0
aW9uIGludGVyZmFjZSwgYXMgYSB4ZW5ob3N0X3QuCj4+Pj4KPj4+PiB4ZW5ob3N0X3QgZXhwb3Nl
IG9wcyBmb3IgY29tbXVuaWNhdGlvbiBiZXR3ZWVuIHRoZSBndWVzdCBhbmQgWGVuCj4+Pj4gKGh5
cGVyY2FsbCwgY3B1aWQsIHNoYXJlZF9pbmZvL3ZjcHVfaW5mbywgZXZ0Y2huLCBncmFudC10YWJs
ZSBhbmQgb24gCj4+Pj4gdG9wCj4+Pj4gb2YgdGhvc2UsIHhlbmJ1cywgYmFsbG9vbmluZyksIGFu
ZCB0aGVzZSBjYW4gZGlmZmVyIGJhc2VkIG9uIHRoZSBraW5kCj4+Pj4gb2YgdW5kZXJseWluZyBY
ZW46IHJlZ3VsYXIsIGxvY2FsLCBhbmQgbmVzdGVkLgo+Pj4KPj4+IEknbSBub3Qgc3VyZSB3ZSBu
ZWVkIHRvIGFic3RyYWN0IGF3YXkgaHlwZXJjYWxscyBhbmQgY3B1aWQuIEkgYmVsaWV2ZSBpbgo+
Pj4gY2FzZSBvZiBuZXN0ZWQgWGVuIGFsbCBjb250YWN0cyB0byB0aGUgTDAgaHlwZXJ2aXNvciBz
aG91bGQgYmUgZG9uZSB2aWEKPj4+IHRoZSBMMSBoeXBlcnZpc29yLiBTbyB3ZSBtaWdodCBuZWVk
IHRvIGlzc3VlIHNvbWUga2luZCBvZiBwYXNzdGhyb3VnaAo+Pj4gaHlwZXJjYWxsIHdoZW4gZS5n
LiBncmFudGluZyBhIHBhZ2UgdG8gTDAgZG9tMCwgYnV0IHRoaXMgc2hvdWxkIGJlCj4+PiBoYW5k
bGVkIHZpYSB0aGUgZ3JhbnQgYWJzdHJhY3Rpb24gKGV2ZW50cyBzaG91bGQgYmUgc2ltaWxhciku
Cj4+Pgo+PiBKdXN0IHRvIGJlIGNsZWFyOiBCeSAia2luZCBvZiBwYXNzdGhyb3VnaCBoeXBlcmNh
bGwiIHlvdSBtZWFuIChlLmcuIAo+PiBmb3IgZXZlcnkKPj4gYWNjZXNzL21vZGlmeSBvZiBncmFu
dCB0YWJsZSBmcmFtZXMpIHlvdSB3b3VsZCBwcm94eSBoeXBlcmNhbGwgdG8gTDAgCj4+IFhlbiB2
aWEgTDEgWGVuPwo+IAo+IEl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIHNwYXJlIHNvbWUgaHlwZXJj
YWxscyBieSBkaXJlY3RseSB3cml0aW5nIHRvCj4gZ3JhbnQgZnJhbWVzIG1hcHBlZCBpbnRvIEwx
IGRvbTAsIGJ1dCBpbiBnZW5lcmFsIHlvdSBhcmUgcmlnaHQuCldvdWxkbid0IHdlIHN0aWxsIG5l
ZWQgbWFwL3VubWFwX2dyYW50X3JlZj8KQUZBSUNTLCBib3RoIHRoZSB4ZW5ob3N0X2RpcmVjdCBh
bmQgdGhlIHhlbmhvc3RfaW5kaXJlY3QgY2FzZXMgc2hvdWxkIGJlCnZlcnkgc2ltaWxhciAoYXBh
cnQgZnJvbSB0aGUgbmVlZCB0byBwcm94eSBpbiB0aGUgaW5kaXJlY3QgY2FzZS4pCgpBbmt1cgoK
PiAKPiAKPiBKdWVyZ2VuCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
