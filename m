Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDBB117855
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 22:22:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieQQT-000369-4I; Mon, 09 Dec 2019 21:18:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LPDn=Z7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ieQQR-000364-E7
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 21:18:39 +0000
X-Inumbo-ID: 773a72f2-1ac9-11ea-887a-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 773a72f2-1ac9-11ea-887a-12813bfff9fa;
 Mon, 09 Dec 2019 21:18:38 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB9LEJTt099179;
 Mon, 9 Dec 2019 21:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=DcHo2qcfzMbQlUOHHHSb+VlsPwDr5lda2gZcp52PhOE=;
 b=j6Tb2U+ealnyosc4c714KslmFt3jbEt3DAhcv9T//5gCV1QRXwhsJkLrUa1Anbc7I3uX
 cvHGFHPs1PCwHF/QVkOK+dj0n68DoD4JKjuqxigScmCdkdGmmKsj8cc613fEACR4q73E
 dTd6bFJBVgqYiO0a7kcIm3GnnMC2ouWCtP41GcBWF94n0IH8Gz06/U7k0A66PizPLmve
 tFNmgnd2Sla5GF+Xur5UZNw/cF+TuPz9wFYCm+jSnXfcVGIV5gcvIyoQlq4WibRiAZPL
 ugcYOjQHvZ250UTq2DnSdImkWT/+3DNpWNdvu6brKG4/u5Z0+C3H08fZKCCYYejMahNk pQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2wr41q28yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Dec 2019 21:18:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB9LDike192068;
 Mon, 9 Dec 2019 21:18:34 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2wsv8amj78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Dec 2019 21:18:34 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xB9LHLtl022412;
 Mon, 9 Dec 2019 21:17:21 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Dec 2019 13:17:21 -0800
To: "Nuernberger, Stefan" <snu@amazon.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191206134804.4537-1-snu@amazon.com>
 <9917a357-12f6-107f-e08d-33e464036317@oracle.com>
 <1575655787.7257.42.camel@amazon.de>
 <4bc83b82-427f-2215-3161-5776867675a1@oracle.com>
 <1575915416.21160.49.camel@amazon.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <7e20daf7-e351-205d-183d-5861e0839c66@oracle.com>
Date: Mon, 9 Dec 2019 16:21:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <1575915416.21160.49.camel@amazon.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9466
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912090167
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9466
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912090167
Subject: Re: [Xen-devel] [PATCH] xen/pciback: Prevent NULL pointer
 dereference in quirks_show
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>, "Seidel,
 Conny" <consei@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Dannowski,
 Uwe" <uwed@amazon.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDEyLzkvMTkgMToxNiBQTSwgTnVlcm5iZXJnZXIsIFN0ZWZhbiB3cm90ZToKPiBPbiBGcmks
IDIwMTktMTItMDYgYXQgMTU6MTUgLTA1MDAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24g
MTIvNi8xOSAxOjA5IFBNLCBOdWVybmJlcmdlciwgU3RlZmFuIHdyb3RlOgo+Pj4gT24gRnJpLCAy
MDE5LTEyLTA2IGF0IDEwOjExIC0wNTAwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+Pj4gT24g
MTIvNi8xOSA4OjQ4IEFNLCBTdGVmYW4gTnVlcm5iZXJnZXIgd3JvdGU6Cj4+Pj4+IEZyb206IFV3
ZSBEYW5ub3dza2kgPHV3ZWRAYW1hem9uLmRlPgo+Pj4+PiAgIAo+Pj4+PiAgwqAJCWxpc3RfZm9y
X2VhY2hfZW50cnkoY2ZnX2VudHJ5LCAmZGV2X2RhdGEtCj4+Pj4+PiBjb25maWdfZmllbGRzLCBs
aXN0KSB7Cj4+Pj4gQ291bGRuJ3QgeW91IGhhdmUgdGhlIHNhbWUgcmFjZSBoZXJlPwo+Pj4gTm90
IHF1aXRlIHRoZSBzYW1lLCBidXQgaXQgbWlnaHQgbm90IGJlIGVudGlyZWx5IHNhZmUgeWV0LiBU
aGUKPj4+ICdxdWlya3Nfc2hvdycgdGFrZXMgdGhlICdkZXZpY2VfaWRzX2xvY2snIGFuZCByYWNl
cyB3aXRoIHVuYmluZCAvCj4+PiAncGNpc3R1Yl9kZXZpY2VfcmVsZWFzZScgIndoaWNoIHRha2Vz
IGRldmljZV9sb2NrIG11dGV4Ii4gU28gdGhpcwo+Pj4gbWlnaHQKPj4+IG5vdyBiZSBhIFVBRiBy
ZWFkIGFjY2VzcyBpbnN0ZWFkIG9mIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLgo+PiBZZXMs
IHRoYXQncyB3aGF0IEkgbWVhbnQgKGFsdGhvdWdoIEkgZG9uJ3Qgc2VlIG11Y2ggZGlmZmVyZW5j
ZSBpbgo+PiB0aGlzCj4+IGNvbnRleHQpLgo+IFdlbGwsIHRoZSBOVUxMIHB0ciBhY2Nlc3MgY2F1
c2VzIGFuIGluc3RhbnQga2VybmVsIHBhbmljIHdoZXJlYXMgd2UKPiBoYXZlIG5vdCBhdHRyaWJ1
dGVkIGNyYXNoZXMgdG8gdGhlIHBvc3NpYmxlIFVBRiByZWFkIHVudGlsIG5vdy4KPgo+Pj4gIMKg
V2UgaGF2ZQo+Pj4gbm90IG9ic2VydmVkIGFkdmVyc2FyaWFsIGVmZmVjdHMgaW4gb3VyIHRlc3Rp
bmcgKGNvbXBhcmVkIHRvIHRoZQo+Pj4gb2J2aW91cyBpc3N1ZXMgd2l0aCBOVUxMIHBvaW50ZXIp
IGJ1dCB0aGF0J3Mgbm90IGEgZ3VhcmFudGVlIG9mCj4+PiBjb3Vyc2UuCj4+Pgo+Pj4gU28gc2hv
dWxkIHF1aXJrc19zaG93IGFjdHVhbGx5IGJlIHByb3RlY3RlZCBieSBwY2lzdHViX2RldmljZXNf
bG9jawo+Pj4gaW5zdGVhZCBhcyBhcmUgb3RoZXIgZnVuY3Rpb25zIHRoYXQgYWNjZXNzIGRldl9k
YXRhPyBEb2VzIGl0IG5lZWQKPj4+IGJvdGgKPj4+IGxvY2tzIGluIHRoYXQgY2FzZT8KPj4gZGV2
aWNlX2lkc19sb2NrIHByb3RlY3RzIGRldmljZV9pZHMgbGlzdCwgd2hpY2ggaXMgbm90IHdoYXQg
eW91IGFyZQo+PiB0cnlpbmcgdG8gYWNjZXNzLCBzbyB0aGF0IGRvZXNuJ3QgbG9vayBsaWtlIHJp
Z2h0IGxvY2sgdG8gaG9sZC4gQW5kCj4+IEFGQUlDVCBwY2lzdHViX2RldmljZXNfbG9jayBpcyBu
b3QgaGVsZCB3aGVuIGRldmljZSBkYXRhIGlzIGNsZWFyZWQKPj4gaW4KPj4gcGNpc3R1Yl9kZXZp
Y2VfcmVsZWFzZSgpICh3aGljaCBJIHRoaW5rIGlzIHdoZXJlIHdlIGFyZSByYWNpbmcpLgo+IElu
ZGVlZC4gVGhlIHhlbl9wY2lia19xdWlya3MgbGlzdCBkb2VzIG5vdCBoYXZlIGEgc2VwYXJhdGUg
bG9jayB0bwo+IHByb3RlY3QgaXQuIEl0J3MgZWl0aGVyIG1vZGlmaWVkIHVuZGVyICdwY2lzdHVi
X2RldmljZXNfbG9jaycsIGZyb20KPiBwY2lzdHViX3JlbW92ZSgpLCBvciBpdGVyYXRlZCBvdmVy
IHdpdGggdGhlICdkZXZpY2VfaWRzX2xvY2snIGhlbGQgaW4KPiBxdWlya3Nfc2hvdygpLiBBbHNv
IHRoZSBxdWlya3MgbGlzdCBpcyBhbWVuZGVkIGZyb20KPiAgwqAgcGNpc3R1Yl9pbml0X2Rldmlj
ZSgpCj4gIMKgIMKgIC0+IHhlbl9wY2lia19jb25maWdfaW5pdF9kZXYoKQo+ICDCoCDCoCDCoCAt
PiB4ZW5fcGNpYmtfY29uZmlnX3F1aXJrc19pbml0KCkKPiB3aXRob3V0IGhvbGRpbmcgYW55IGxv
Y2sgYXQgYWxsLiBJbiBmYWN0IHRoZQo+IHBjaXN0dWJfaW5pdF9kZXZpY2VzX2xhdGUoKSBhbmQg
cGNpc3R1Yl9zZWl6ZSgpIGZ1bmN0aW9ucyBkZWxpYmVyYXRlbHkKPiByZWxlYXNlIHRoZSBwY2lz
dHViX2RldmljZXNfbG9jayBiZWZvcmUgY2FsbGluZyBwY2lzdHViX2luaXRfZGV2aWNlKCkuCj4g
VGhpcyBsb29rcyBicm9rZW4uCgoKSW5kZWVkLgoKCj4KPiBUaGUgcmFjZSBpcyBiZXR3ZWVuCj4g
IMKgIHBjaXN0dWJfcmVtb3ZlKCkKPiAgwqAgwqAgLT4gcGNpc3R1Yl9kZXZpY2VfcHV0KCkKPiAg
wqAgwqAgwqAgLT4gcGNpc3R1Yl9kZXZpY2VfcmVsZWFzZSgpCj4gb24gb25lIHNpZGUgYW5kIHRo
ZSBxdWlya3Nfc2hvdygpIG9uIHRoZSBvdGhlciBzaWRlLiBUaGUgcHJvYmxlbWF0aWMKPiBxdWly
ayBpcyBmcmVlZCBmcm9tIHRoZSB4ZW5fcGNpYmtfcXVpcmtzIGxpc3QgaW4gcGNpc3R1Yl9yZW1v
dmUoKSBlYXJseQo+IG9uIHVuZGVyIHBjaXN0dWJfZGV2aWNlc19sb2NrIGJlZm9yZSB0aGUgYXNz
b2NpYXRlZCBkZXZfZGF0YSBpcyBmcmVlZAo+IGV2ZW50dWFsbHkuIFNvIHN3aXRjaGluZyBmcm9t
IGRldmljZV9pZHNfbG9jayB0byBwY2lzdHViX2RldmljZXNfbG9jawo+IGluIHF1aXJrc19zaG93
KCkgY291bGQgYmUgc3VmZmljaWVudCB0byBhbHdheXMgaGF2ZSB2YWxpZCBkZXZfZGF0YSBmb3IK
PiBhbGwgcXVpcmtzIGluIHRoZSBsaXN0LgoKClllcywgdGhhdCBzaG91bGQgZG8gaXQuIChJIG1p
c3NlZCB4ZW5fcGNpYmtfY29uZmlnX3F1aXJrX3JlbGVhc2UoKSBjYWxsLCAKd2hpY2ggaXMgd2h5
IEkgd2Fzbid0IHN1cmUgcGNpc3R1Yl9kZXZpY2VzX2xvY2sgaXMgaGVsZCB3aGVyZSBuZWNlc3Nh
cnkpLgoKCj4KPiBUaGVyZSBpcyBhbHNvIHBjaXN0dWJfcHV0X3BjaV9kZXYoKSBwb3NzaWJseSBp
biB0aGUgcmFjZSwgY2FsbGVkIGZyb20KPiB4ZW5fcGNpYmtfcmVtb3ZlX2RldmljZSgpLCBvciB4
ZW5fcGNpYmtfeGVuYnVzX3JlbW92ZSgpLCBvcgo+IHBjaXN0dWJfcmVtb3ZlKCkuIFRoZSBwY2lz
dHViX3JlbW92ZSgpIGNhbGwgc2l0ZSBpcyBzYWZlIHdoZW4gd2Ugc3dpdGNoCj4gdG8gcGNpc3R1
Yl9kZXZpY2VzX2xvY2sgKHNhbWUgcmVhc29uaW5nIGFzIGFib3ZlKS4gRm9yIHRoZSBvdGhlcnMg
SQo+IGN1cnJlbnRseSBkbyBub3Qgc2VlIHdoZW4gdGhlIHF1aXJrcyBhcmUgZXZlciBmcmVlZD8K
CgpJIHdvbmRlciB3aGV0aGVyIHdlIHNob3VsZCBjYWxsIHhlbl9wY2lia19jb25maWdfcXVpcmtf
cmVsZWFzZSgpIGZyb20gCnBjaXN0dWJfZGV2aWNlX3JlbGVhc2UoKSB1bmRlciBwY2lzdHViX2Rl
dmljZXNfbG9jay4KCgotYm9yaXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
