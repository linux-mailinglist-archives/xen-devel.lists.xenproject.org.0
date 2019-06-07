Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A35B38EF9
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 17:26:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZGhy-00016L-Ez; Fri, 07 Jun 2019 15:23:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LfsP=UG=oracle.com=joao.m.martins@srs-us1.protection.inumbo.net>)
 id 1hZGhw-00016E-RD
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 15:23:08 +0000
X-Inumbo-ID: 25140678-8938-11e9-b7ae-cb8ce1f770a5
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25140678-8938-11e9-b7ae-cb8ce1f770a5;
 Fri, 07 Jun 2019 15:23:04 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x57FIgZJ065043;
 Fri, 7 Jun 2019 15:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=p/h/K8U+S9UnTSMqywSHyFTN/pAmAlatfrvFdGLk/l8=;
 b=ItLnYD6xsbm6K2ULW5f4F0sC4QrVHQxpoaLSaYag1a9WcwBzDVrv1WJpIB4Ecym8/DBd
 9Mt36Mnnsk1P/W7GgpPWdHzOWkZ+vmOpE6xPwAeI9kv6WLa5WqdaX/mzHfFHILcXnThl
 xAX494GEg/Ycoxzmdhw0nNWmnMzieaZcLQ0SGpNI0keHbImQbsnYCzoXWikb1mvtlvRQ
 dlmX+AIrMNnE51RAxOiEvP1jngbzE5rQnx97jIQCVxJRD9mL1FvDxZ1+wBPY1QloLVDk
 4nLPX5TZKHA2hWzYq24oeHCq1ioZExxgO9sJ2hn67F6iVBt+LPE0k0XdaVDEWm7snLIf cQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2sugstxwmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2019 15:23:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x57FM0vF160167;
 Fri, 7 Jun 2019 15:23:02 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2swngk2tcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2019 15:23:01 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x57FN0mk005625;
 Fri, 7 Jun 2019 15:23:00 GMT
Received: from [10.175.171.136] (/10.175.171.136)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 Jun 2019 08:23:00 -0700
To: Juergen Gross <jgross@suse.com>
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <5649cfd1-24df-2196-2888-b00fc3ace7ad@suse.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <ede6db03-121c-9ec6-f8eb-dbcc605977b4@oracle.com>
Date: Fri, 7 Jun 2019 16:22:56 +0100
MIME-Version: 1.0
In-Reply-To: <5649cfd1-24df-2196-2888-b00fc3ace7ad@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906070107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906070107
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
 linux-kernel@vger.kernel.org, Ankur Arora <ankur.a.arora@oracle.com>,
 pbonzini@redhat.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi83LzE5IDM6NTEgUE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDkuMDUuMTkgMTk6
MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+PiBIaSBhbGwsCj4+Cj4+IFRoaXMgaXMgYW4gUkZDIGZv
ciB4ZW5ob3N0IHN1cHBvcnQsIG91dGxpbmVkIGhlcmUgYnkgSnVlcmdlbiBoZXJlOgo+PiBodHRw
czovL2xrbWwub3JnL2xrbWwvMjAxOS80LzgvNjcuCj4gCj4gRmlyc3Q6IHRoYW5rcyBmb3IgYWxs
IHRoZSBlZmZvcnQgeW91J3ZlIHB1dCBpbnRvIHRoaXMgc2VyaWVzIQo+IAo+PiBUaGUgaGlnaCBs
ZXZlbCBpZGVhIGlzIHRvIHByb3ZpZGUgYW4gYWJzdHJhY3Rpb24gb2YgdGhlIFhlbgo+PiBjb21t
dW5pY2F0aW9uIGludGVyZmFjZSwgYXMgYSB4ZW5ob3N0X3QuCj4+Cj4+IHhlbmhvc3RfdCBleHBv
c2Ugb3BzIGZvciBjb21tdW5pY2F0aW9uIGJldHdlZW4gdGhlIGd1ZXN0IGFuZCBYZW4KPj4gKGh5
cGVyY2FsbCwgY3B1aWQsIHNoYXJlZF9pbmZvL3ZjcHVfaW5mbywgZXZ0Y2huLCBncmFudC10YWJs
ZSBhbmQgb24gdG9wCj4+IG9mIHRob3NlLCB4ZW5idXMsIGJhbGxvb25pbmcpLCBhbmQgdGhlc2Ug
Y2FuIGRpZmZlciBiYXNlZCBvbiB0aGUga2luZAo+PiBvZiB1bmRlcmx5aW5nIFhlbjogcmVndWxh
ciwgbG9jYWwsIGFuZCBuZXN0ZWQuCj4gCj4gSSdtIG5vdCBzdXJlIHdlIG5lZWQgdG8gYWJzdHJh
Y3QgYXdheSBoeXBlcmNhbGxzIGFuZCBjcHVpZC4gSSBiZWxpZXZlIGluCj4gY2FzZSBvZiBuZXN0
ZWQgWGVuIGFsbCBjb250YWN0cyB0byB0aGUgTDAgaHlwZXJ2aXNvciBzaG91bGQgYmUgZG9uZSB2
aWEKPiB0aGUgTDEgaHlwZXJ2aXNvci4gU28gd2UgbWlnaHQgbmVlZCB0byBpc3N1ZSBzb21lIGtp
bmQgb2YgcGFzc3Rocm91Z2gKPiBoeXBlcmNhbGwgd2hlbiBlLmcuIGdyYW50aW5nIGEgcGFnZSB0
byBMMCBkb20wLCBidXQgdGhpcyBzaG91bGQgYmUKPiBoYW5kbGVkIHZpYSB0aGUgZ3JhbnQgYWJz
dHJhY3Rpb24gKGV2ZW50cyBzaG91bGQgYmUgc2ltaWxhcikuCj4gCkp1c3QgdG8gYmUgY2xlYXI6
IEJ5ICJraW5kIG9mIHBhc3N0aHJvdWdoIGh5cGVyY2FsbCIgeW91IG1lYW4gKGUuZy4gZm9yIGV2
ZXJ5CmFjY2Vzcy9tb2RpZnkgb2YgZ3JhbnQgdGFibGUgZnJhbWVzKSB5b3Ugd291bGQgcHJveHkg
aHlwZXJjYWxsIHRvIEwwIFhlbiB2aWEgTDEgWGVuPwoKPiBTbyBJTU8gd2Ugc2hvdWxkIGRyb3Ag
cGF0Y2hlcyAyLTUuCj4gCj4+IChTaW5jZSB0aGlzIGFic3RyYWN0aW9uIGlzIGxhcmdlbHkgYWJv
dXQgZ3Vlc3QgLS0geGVuaG9zdCBjb21tdW5pY2F0aW9uLAo+PiBubyBvcHMgYXJlIG5lZWRlZCBm
b3IgdGltZXIsIGNsb2NrLCBzY2hlZCwgbWVtb3J5IChNTVUsIFAyTSksIFZDUFUgbWdtdC4KPj4g
ZXRjLikKPj4KPj4gWGVuaG9zdCB1c2UtY2FzZXM6Cj4+Cj4+IFJlZ3VsYXItWGVuOiB0aGUgc3Rh
bmRhcmQgWGVuIGludGVyZmFjZSBwcmVzZW50ZWQgdG8gYSBndWVzdCwKPj4gc3BlY2lmaWNhbGx5
IGZvciBjb211bmljYXRpb24gYmV0d2VlbiBMeC1ndWVzdCBhbmQgTHgtWGVuLgo+Pgo+PiBMb2Nh
bC1YZW46IGEgWGVuIGxpa2UgaW50ZXJmYWNlIHdoaWNoIHJ1bnMgaW4gdGhlIHNhbWUgYWRkcmVz
cyBzcGFjZSBhcwo+PiB0aGUgZ3Vlc3QgKGRvbTApLiBUaGlzLCBjYW4gYWN0IGFzIHRoZSBkZWZh
dWx0IHhlbmhvc3QuCj4+Cj4+IFRoZSBtYWpvciB3YXlzIGl0IGRpZmZlcnMgZnJvbSBhIHJlZ3Vs
YXIgWGVuIGludGVyZmFjZSBpcyBpbiBwcmVzZW50aW5nCj4+IGEgZGlmZmVyZW50IGh5cGVyY2Fs
bCBpbnRlcmZhY2UgKGNhbGwgaW5zdGVhZCBvZiBhIHN5c2NhbGwvdm1jYWxsKSwgYW5kCj4+IGlu
IGFuIGluYWJpbGl0eSB0byBkbyBncmFudC1tYXBwaW5nczogc2luY2UgbG9jYWwtWGVuIGV4aXN0
cyBpbiB0aGUgc2FtZQo+PiBhZGRyZXNzIHNwYWNlIGFzIFhlbiwgdGhlcmUncyBubyB3YXkgZm9y
IGl0IHRvIGNoZWFwbHkgY2hhbmdlIHRoZQo+PiBwaHlzaWNhbCBwYWdlIHRoYXQgYSBHRk4gbWFw
cyB0byAoYXNzdW1pbmcgbm8gUDJNIHRhYmxlcy4pCj4+Cj4+IE5lc3RlZC1YZW46IHRoaXMgY2hh
bm5lbCBpcyB0byBYZW4sIG9uZSBsZXZlbCByZW1vdmVkOiBmcm9tIEwxLWd1ZXN0IHRvCj4+IEww
LVhlbi4gVGhlIHVzZSBjYXNlIGlzIHRoYXQgd2Ugd2FudCBMMC1kb20wLWJhY2tlbmRzIHRvIHRh
bGsgdG8KPj4gTDEtZG9tMC1mcm9udGVuZCBkcml2ZXJzIHdoaWNoIGNhbiB0aGVuIHByZXNlbnQg
UFYgZGV2aWNlcyB3aGljaCBjYW4KPj4gaW4tdHVybiBiZSB1c2VkIGJ5IHRoZSBMMS1kb20wLWJh
Y2tlbmQgZHJpdmVycyBhcyByYXcgdW5kZXJseWluZyBkZXZpY2VzLgo+PiBUaGUgaW50ZXJmYWNl
cyB0aGVtc2VsdmVzLCBicm9hZGx5IHJlbWFpbiBzaW1pbGFyLgo+Pgo+PiBOb3RlOiBMMC1YZW4s
IEwxLVhlbiByZXByZXNlbnQgWGVuIHJ1bm5pbmcgYXQgdGhhdCBuZXN0aW5nIGxldmVsCj4+IGFu
ZCBMMC1ndWVzdCwgTDEtZ3Vlc3QgcmVwcmVzZW50IGd1ZXN0cyB0aGF0IGFyZSBjaGlsZHJlbiBv
ZiBYZW4KPj4gYXQgdGhhdCBuZXN0aW5nIGxldmVsLiBMeCwgcmVwcmVzZW50cyBhbnkgbGV2ZWwu
Cj4+Cj4+IFBhdGNoZXMgMS03LAo+PiAgICAieDg2L3hlbjogYWRkIHhlbmhvc3RfdCBpbnRlcmZh
Y2UiCj4+ICAgICJ4ODYveGVuOiBjcHVpZCBzdXBwb3J0IGluIHhlbmhvc3RfdCIKPj4gICAgIng4
Ni94ZW46IG1ha2UgaHlwZXJjYWxsX3BhZ2UgZ2VuZXJpYyIKPj4gICAgIng4Ni94ZW46IGh5cGVy
Y2FsbCBzdXBwb3J0IGZvciB4ZW5ob3N0X3QiCj4+ICAgICJ4ODYveGVuOiBhZGQgZmVhdHVyZSBz
dXBwb3J0IGluIHhlbmhvc3RfdCIKPj4gICAgIng4Ni94ZW46IGFkZCBzaGFyZWRfaW5mbyBzdXBw
b3J0IHRvIHhlbmhvc3RfdCIKPj4gICAgIng4Ni94ZW46IG1ha2UgdmNwdV9pbmZvIHBhcnQgb2Yg
eGVuaG9zdF90Igo+PiBhYnN0cmFjdCBvdXQgaW50ZXJmYWNlcyB0aGF0IHNldHVwIGh5cGVyY2Fs
bHMvY3B1aWQvc2hhcmVkX2luZm8vdmNwdV9pbmZvIGV0Yy4KPj4KPj4gUGF0Y2ggOCwgIng4Ni94
ZW46IGlycS91cGNhbGwgaGFuZGxpbmcgd2l0aCBtdWx0aXBsZSB4ZW5ob3N0cyIKPj4gc2V0cyB1
cCB0aGUgdXBjYWxsIGFuZCBwdl9pcnEgb3BzIGJhc2VkIG9uIHZjcHVfaW5mby4KPj4KPj4gUGF0
Y2ggOSwgInhlbi9ldnRjaG46IHN1cHBvcnQgZXZ0Y2huIGluIHhlbmhvc3RfdCIgYWRkcyB4ZW5o
b3N0IGJhc2VkCj4+IGV2dGNobiBzdXBwb3J0IGZvciBldnRjaG5fMmwuCj4+Cj4+IFBhdGNoZXMg
MTAgYW5kIDE2LCAieGVuL2JhbGxvb246IHN1cHBvcnQgYmFsbG9vbmluZyBpbiB4ZW5ob3N0X3Qi
IGFuZAo+PiAieGVuL2dyYW50LXRhYmxlOiBob3N0X2FkZHIgZml4dXAgaW4gbWFwcGluZyBvbiB4
ZW5ob3N0X3IwIgo+PiBpbXBsZW1lbnQgc3VwcG9ydCBmcm9tIEdOVFRBQk9QX21hcF9ncmFudF9y
ZWYgZm9yIHhlbmhvc3RzIG9mIHR5cGUKPj4geGVuaG9zdF9yMCAoeGVuaG9zdCBsb2NhbC4pCj4+
Cj4+IFBhdGNoIDEyLCAieGVuL3hlbmJ1czogc3VwcG9ydCB4ZW5idXMgZnJvbnRlbmQvYmFja2Vu
ZCB3aXRoIHhlbmhvc3RfdCIKPj4gbWFrZXMgeGVuYnVzIHNvIHRoYXQgYm90aCBpdHMgZnJvbnRl
bmQgYW5kIGJhY2tlbmQgY2FuIGJlIGJvb3RzdHJhcHBlZAo+PiBzZXBhcmF0ZWx5IHZpYSBzZXBh
cmF0ZSB4ZW5ob3N0cy4KPj4KPj4gUmVtYWluaW5nIHBhdGNoZXMsIDExLCAxMywgMTQsIDE1Ogo+
PiAgICAieGVuL2dyYW50LXRhYmxlOiBtYWtlIGdyYW50LXRhYmxlIHhlbmhvc3QgYXdhcmUiCj4+
ICAgICJkcml2ZXJzL3hlbjogZ250dGFiLCBldnRjaG4sIHhlbmJ1cyBBUEkgY2hhbmdlcyIKPj4g
ICAgInhlbi9ibGs6IGdudHRhYiwgZXZ0Y2huLCB4ZW5idXMgQVBJIGNoYW5nZXMiCj4+ICAgICJ4
ZW4vbmV0OiBnbnR0YWIsIGV2dGNobiwgeGVuYnVzIEFQSSBjaGFuZ2VzIgo+PiBhcmUgbW9zdGx5
IG1lY2hhbmljYWwgY2hhbmdlcyBmb3IgQVBJcyB0aGF0IG5vdyB0YWtlIHhlbmhvc3RfdCAqCj4+
IGFzIHBhcmFtZXRlci4KPj4KPj4gVGhlIGNvZGUgaXRzZWxmIGlzIFJGQyBxdWFsaXR5LCBhbmQg
aXMgbW9zdGx5IG1lYW50IHRvIGdldCBmZWVkYmFjayBiZWZvcmUKPj4gcHJvY2VlZGluZyBmdXJ0
aGVyLiBBbHNvIG5vdGUgdGhhdCB0aGUgRklGTyBsb2dpYyBhbmQgc29tZSBYZW4gZHJpdmVycwo+
PiAoaW5wdXQsIHBjaWJhY2ssIHNjc2kgZXRjKSBhcmUgbW9zdGx5IHVuY2hhbmdlZCwgc28gd2ls
bCBub3QgYnVpbGQuCj4+Cj4+Cj4+IFBsZWFzZSB0YWtlIGEgbG9vay4KPiAKPiAKPiBKdWVyZ2Vu
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
