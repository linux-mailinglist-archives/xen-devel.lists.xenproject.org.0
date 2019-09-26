Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B6CBFAA7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 22:40:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDaVC-0006YW-5b; Thu, 26 Sep 2019 20:36:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CPVV=XV=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1iDaVB-0006YR-Cf
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 20:36:37 +0000
X-Inumbo-ID: 54eda522-e09d-11e9-9660-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by localhost (Halon) with ESMTPS
 id 54eda522-e09d-11e9-9660-12813bfff9fa;
 Thu, 26 Sep 2019 20:36:35 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8QKYQwU157142;
 Thu, 26 Sep 2019 20:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=VJHxUXWttcXW3V8gtYHe9pZzd28+YwJRO0GoGp/NNaU=;
 b=ncZLqn0o06TOgCFExGEZSh2+GvNP+Op22GAMtgHm+lNYsVNLvjO44Uc5GjkSHD0ebpf8
 KnQWTc34LC3GiS95jTidk6hjKiiK4/tuA91F7vrcQyeE5+dUhydLAIoJnh6YtFtki1XK
 rk4PgdjlqDrXmzE5Tj4dTHHufXO6nVWyI3kW7Wy67egQGxjFJOvaytg+Z6+HDXz0tvil
 +os4arRk0zfoVCm24gW1bberVSFs9IEeVMEoV9GYuE/7SNPC/LdumbT/hflFvxiykm+U
 NDR6Rfaf/x6WtFMrNsUVDJOw4BYf79gQaxE5A0ABmU7h5ALWlFEhv7RlFjuFzDB+sfuy hA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2v5btqe84p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Sep 2019 20:36:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8QKYO0D121401;
 Thu, 26 Sep 2019 20:34:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2v8yjx24ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Sep 2019 20:34:26 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8QKXhTS010412;
 Thu, 26 Sep 2019 20:33:43 GMT
Received: from [10.211.46.60] (/10.211.46.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 26 Sep 2019 13:33:43 -0700
From: Joe Jin <joe.jin@oracle.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <20190913103335.ijzx6tuy4iwb5dt5@Air-de-Roger>
 <89c9c9b5-a99f-bfdb-c42c-df64e308a98e@oracle.com>
 <20190924154242.nwhetdvkgmkhjgph@Air-de-Roger>
Message-ID: <8a81e76c-b342-05b5-b592-c7e6912e6a9f@oracle.com>
Date: Thu, 26 Sep 2019 13:33:42 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190924154242.nwhetdvkgmkhjgph@Air-de-Roger>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9392
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909260159
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9392
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909260159
Subject: Re: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after
 msix vector been updated
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>, Jan Beulich <jbeulich@suse.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yNC8xOSA4OjQyIEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIEZyaSwgU2Vw
IDEzLCAyMDE5IGF0IDA5OjUwOjM0QU0gLTA3MDAsIEpvZSBKaW4gd3JvdGU6Cj4+IE9uIDkvMTMv
MTkgMzozMyBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFRodSwgU2VwIDEyLCAy
MDE5IGF0IDExOjAzOjE0QU0gLTA3MDAsIEpvZSBKaW4gd3JvdGU6Cj4+Pj4gV2l0aCBiZWxvdyB0
ZXN0Y2FzZSwgZ3Vlc3Qga2VybmVsIHJlcG9ydGVkICJObyBpcnEgaGFuZGxlciBmb3IgdmVjdG9y
IjoKPj4+PiAgIDEpLiBQYXNzdGhyb3VnaCBtbHggaWIgVkYgdG8gMiBwdmh2bSBndWVzdHMuCj4+
Pj4gICAyKS4gU3RhcnQgcmRzLXN0cmVzcyBiZXR3ZWVuIDIgZ3Vlc3RzLgo+Pj4+ICAgMykuIFNj
YWxlIGRvd24gMiBndWVzdHMgdmNwdSBmcm9tIDMyIHRvIDYgYXQgdGhlIHNhbWUgdGltZS4KPj4+
Pgo+Pj4+IFJlcGVhdCBhYm92ZSB0ZXN0IHNldmVyYWwgaXRlcmF0aW9uLCBndWVzdCBrZXJuZWwg
cmVwb3J0ZWQgIk5vIGlycSBoYW5kbGVyCj4+Pj4gZm9yIHZlY3RvciIsIGFuZCBJQiB0cmFmZmlj
IGRvd25lZCB0byB6ZXJvIHdoaWNoIGNhdXNlZCBieSBpbnRlcnJ1cHQgbG9zdC4KPj4+Pgo+Pj4+
IFdoZW4gdmNwdSBvZmZsaW5lLCBrZXJuZWwgZGlzYWJsZWQgbG9jYWwgSVJRLCBtaWdyYXRlIElS
USB0byBvdGhlciBjcHUsCj4+Pj4gdXBkYXRlIE1TSS1YIHRhYmxlLCBlbmFibGUgSVJRLiBJZiBh
bnkgbmV3IGludGVycnVwdCBhcnJpdmVkIGFmdGVyCj4+Pj4gbG9jYWwgSVJRIGRpc2FibGVkIGFs
c28gYmVmb3JlIE1TSS1YIHRhYmxlIGJlZW4gdXBkYXRlZCwgaW50ZXJydXB0IHN0aWxsIAo+Pj4+
IHVzZWQgb2xkIHZlY3RvciBhbmQgZGVzdCBjcHUgaW5mbywgYW5kIHdoZW4gbG9jYWwgSVJRIGVu
YWJsZWQgYWdhaW4sIAo+Pj4+IGludGVycnVwdCBiZWVuIHNlbnQgdG8gd3JvbmcgY3B1IGFuZCB2
ZWN0b3IuCj4+Pgo+Pj4gWWVzLCBidXQgdGhhdCdzIHNvbWV0aGluZyBMaW51eCBzaG91bGtkIGJl
IGFibGUgdG8gaGFuZGxlLCBhY2NvcmRpbmcKPj4+IHRvIHlvdXIgZGVzY3JpcHRpb24gdGhlcmUn
cyBhIHdpbmRvdyB3aGVyZSBpbnRlcnJ1cHRzIGNhbiBiZSBkZWxpdmVyZWQKPj4+IHRvIHRoZSBv
bGQgQ1BVLCBidXQgdGhhdCdzIHNvbWV0aGluZyBleHBlY3RlZC4KPj4KPj4gQWN0dWFsbHksIGtl
cm5lbCB3aWxsIGNoZWNrIEFQSUMgSVJSIHdoZW4gZG8gbWlncmF0aW9uLCBpZiBhbnkgcGVuZGlu
Zwo+PiBJUlEsIHdpbGwgcmV0cmlnZ2VyIElSUSB0byBuZXcgZGVzdGluYXRpb24sIGJ1dCBYZW4g
ZG9lcyBub3Qgc2V0IHRoZQo+PiBiaXQuCj4gCj4gUmlnaHQsIGJlY2F1c2UgdGhlIGludGVycnVw
dCBpcyBwZW5kaW5nIGluIHRoZSBQSVJSIHBvc3RlZCBkZXNjcmlwdG9yCj4gZmllbGQsIGl0IGhh
cyBub3QgeWV0IHJlYWNoZWQgdGhlIHZsYXBpYyBJUlIuCj4gCj4+Pgo+Pj4+Cj4+Pj4gTG9va3Mg
c3luYyBQSVIgdG8gSVJSIGFmdGVyIE1TSS1YIGJlZW4gdXBkYXRlZCBpcyBoZWxwIGZvciB0aGlz
IGlzc3VlLgo+Pj4KPj4+IEFGQUlDVCB0aGUgc3luYyB0aGF0IHlvdSBkbyBpcyBzdGlsbCB1c2lu
ZyB0aGUgb2xkIHZjcHUgaWQsIGFzCj4+PiBwaXJxX2RwY2ktPmdtc2kuZGVzdF92Y3B1X2lkIGdl
dHMgdXBkYXRlZCBhIGxpdHRsZSBiaXQgYmVsb3cuIEknbQo+Pj4gdW5zdXJlIGFib3V0IHdoeSBk
b2VzIHRoaXMgaGVscCwgSSB3b3VsZCBleHBlY3QgdGhlIHN5bmMgYmV0d2VlbiBwaXIKPj4+IGFu
ZCBpcnIgdG8gaGFwcGVuIGFueXdheSwgYW5kIGhlbmNlIEknbSBub3Qgc3VyZSB3aHkgaXMgdGhp
cyBoZWxwaW5nLgo+Pgo+PiBBcyBteSBhYm92ZSB1cGRhdGUsIElSUSByZXRyaWdnZXJlZCBieSBv
bGQgY3B1LCBzbyBYZW4gbmVlZCB0byBzZXQgSVJSCj4+IGZvciBvbGQgY3B1IGJ1dCBub3Qgb2Yg
bmV3Lgo+IAo+IEFGQUlDVCB5b3UgYXJlIGRyYWluaW5nIGFueSBwZW5kaW5nIGRhdGEgZnJvbSB0
aGUgcG9zdGVkIGludGVycnVwdAo+IFBJUlIgZmllbGQgaW50byB0aGUgSVJSIHZsYXBpYyBmaWVs
ZCwgc28gdGhhdCBubyBzdGFsZSBpbnRlcnJ1cHRzIGFyZQo+IGxlZnQgYmVoaW5kIGFmdGVyIHRo
ZSBNU0kgZmllbGRzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5IHRoZSBndWVzdC4gSQo+IHRoaW5rIHRo
aXMgaXMgY29ycmVjdCwgSSB3b25kZXIgaG93ZXZlciB3aGV0aGVyIHlvdSBhbHNvIG5lZWQgdG8K
PiB0cmlnZ2VyIGEgdmNwdSByZS1zY2hlZHVsaW5nIChwYXVzZS91bnBhdXNlIHRoZSB2cGN1KSwg
c28gdGhhdCBwZW5kaW5nCj4gaW50ZXJydXB0cyBpbiBJUlIgYXJlIGluamVjdGVkIGJ5IHZteF9p
bnRyX2Fzc2lzdC4KPiAKPiBBbHNvLCBJIHRoaW5rIHlvdSBzaG91bGQgZG8gdGhpcyBzeW5jaW5n
IGFmdGVyIHRoZSBwaV91cGRhdGVfaXJ0ZQo+IGNhbGwsIG9yIGVsc2UgdGhlcmUncyBzdGlsbCBh
IHdpbmRvdyAoYWxiZWl0IHNtYWxsKSB3aGVyZSB5b3UgY2FuCj4gc3RpbGwgZ2V0IHBvc3RlZCBp
bnRlcnJ1cHRzIGRlbGl2ZXJlZCB0byB0aGUgb2xkIHZjcHUuCgpJIGFncmVlIHdpdGggeW91IHRo
YXQgd2UgbmVlZCB0byB0YWtlIGNhcmUgb2YgdGhpcyBpc3N1ZSBhcyB3ZWxsLgoKSSBjcmVhdGVk
IGFuIGFkZGl0aW9uYWwgcGF0Y2ggYnV0IG5vdCB0ZXN0ZWQgeWV0IGZvciB0aGUgdGVzdCBlbnYg
d2FzCmJyb2tlbiwgcG9zdCBoZXJlIGZvciB5b3VyIGNvbW1lbnQgZmlyc3RseSwgSSdsbCB1cGRh
dGUgbGF0ZXIgb2YgdGVzdApyZXN1bHQgd2hlbiBteSB0ZXN0IGVudiBiYWNrOgoKZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9pby5jCmluZGV4IDNmNDNiOWQ1YTkuLjQ1OTYxMTBhMTcgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2lvLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYwpA
QCAtMjMsNiArMjMsNyBAQAogI2luY2x1ZGUgPHhlbi9pcnEuaD4KICNpbmNsdWRlIDxhc20vaHZt
L2lycS5oPgogI2luY2x1ZGUgPGFzbS9odm0vc3VwcG9ydC5oPgorI2luY2x1ZGUgPGFzbS9odm0v
dm14L3ZteC5oPgogI2luY2x1ZGUgPGFzbS9pb19hcGljLmg+CiAKIHN0YXRpYyBERUZJTkVfUEVS
X0NQVShzdHJ1Y3QgbGlzdF9oZWFkLCBkcGNpX2xpc3QpOwpAQCAtNDQzLDkgKzQ0NCwyMSBAQCBp
bnQgcHRfaXJxX2NyZWF0ZV9iaW5kKAogICAgICAgICAgICAgaHZtX21pZ3JhdGVfcGlycShwaXJx
X2RwY2ksIHZjcHUpOwogCiAgICAgICAgIC8qIFVzZSBpbnRlcnJ1cHQgcG9zdGluZyBpZiBpdCBp
cyBzdXBwb3J0ZWQuICovCi0gICAgICAgIGlmICggaW9tbXVfaW50cG9zdCApCi0gICAgICAgICAg
ICBwaV91cGRhdGVfaXJ0ZSh2Y3B1ID8gJnZjcHUtPmFyY2guaHZtLnZteC5waV9kZXNjIDogTlVM
TCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZm8sIHBpcnFfZHBjaS0+Z21zaS5ndmVj
KTsKKyAgICAgICAgaWYgKCBpb21tdV9pbnRwb3N0ICkgeworICAgICAgICAgICAgdW5zaWduZWQg
aW50IG5kc3QgPSBBUElDX0lOVkFMSURfREVTVDsKKyAgICAgICAgICAgIHN0cnVjdCBpcnFfZGVz
YyAqZGVzYzsKKworICAgICAgICAgICAgZGVzYyA9IHBpcnFfc3Bpbl9sb2NrX2lycV9kZXNjKGlu
Zm8sIE5VTEwpOworICAgICAgICAgICAgaWYgKCBpcnFfZGVzYyApIHsKKyAgICAgICAgICAgICAg
ICBuZHN0ID0gaXJxX2Rlc2MtPm1zaV9kZXNjLT5waV9kZXNjLT5uZHN0OworICAgICAgICAgICAg
ICAgIHNwaW5fdW5sb2NrX2lycSgmZGVzYy0+bG9jayk7CisgICAgICAgICAgICB9CisKKyAgICAg
ICAgICAgIGlmICggcGlfdXBkYXRlX2lydGUodmNwdSA/ICZ2Y3B1LT5hcmNoLmh2bS52bXgucGlf
ZGVzYyA6IE5VTEwsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmZvLCBw
aXJxX2RwY2ktPmdtc2kuZ3ZlYykgPT0gMAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICYm
IG5kc3QgIT0gQVBJQ19JTlZBTElEX0RFU1QgKQorICAgICAgICAgICAgICAgIHZsYXBpY19zeW5j
X3Bpcl90b19pcnIoZC0+dmNwdVtuZHN0XSk7CisgICAgICAgIH0KIAogICAgICAgICBpZiAoIHB0
X2lycV9iaW5kLT51Lm1zaS5nZmxhZ3MgJiBYRU5fRE9NQ1RMX1ZNU0lfWDg2X1VOTUFTS0VEICkK
ICAgICAgICAgewotLSAKMi4yMS4wIChBcHBsZSBHaXQtMTIyKQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
