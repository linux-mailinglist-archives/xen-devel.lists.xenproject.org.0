Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80D36831D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 07:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmtBd-0003je-AX; Mon, 15 Jul 2019 05:06:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wvxR=VM=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hmtBb-0003jZ-VQ
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 05:06:04 +0000
X-Inumbo-ID: 3d3e3815-a6be-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3d3e3815-a6be-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 05:06:01 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6F54etU079658;
 Mon, 15 Jul 2019 05:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=2l/EtsL/XoHbgXHMaLYFldByJTczF6kBDhxbYvtpLPM=;
 b=kBoG8XVv42nEqXSF2HoXapvC9IDjC1xkeDPzSWf6XbriQVP6kHFRX7xEX2dnL7tvyWr7
 QL/qzlu1Kad1UFxq05tQWuCry+jCi4YTzLHOX/OqgPhpOjMwNOaY/XEUWu+xHJNqtR/w
 LiXFCapfyb67oFcmgI8vBk/y7FzC24Uvs5Pfdzko1p0tGYVnTAcNq+YkAw79yocN/dfM
 9iIW/yZns16jWToOZM+zD6WhHIEPxUg6l6bqP3fwPGfoBW3vKrcAVl+Qy280ONL4rDFq
 QNZfq9c4gp8wpBBFnFGsCufqEh8vtDV4IRKZxKsD+bUHVir9AgWQoP93mJis3c2pJSG4 EA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2tq6qtca54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 05:05:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6F536LJ132940;
 Mon, 15 Jul 2019 05:05:26 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2tq6mm30un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 05:05:26 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6F55KrY025333;
 Mon, 15 Jul 2019 05:05:23 GMT
Received: from [192.168.0.8] (/116.136.20.190)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 14 Jul 2019 22:05:20 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org
References: <1562832921-20831-1-git-send-email-zhenzhong.duan@oracle.com>
 <ebf9657b-7d97-87a0-e32e-af8453ee7bba@citrix.com>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Organization: Oracle Corporation
Message-ID: <b9702975-dd2d-cf0b-e47f-a1c4361db18f@oracle.com>
Date: Mon, 15 Jul 2019 13:05:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ebf9657b-7d97-87a0-e32e-af8453ee7bba@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9318
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907150059
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9318
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907150059
Subject: Re: [Xen-devel] [PATCH v2] xen/pv: Fix a boot up hang revealed by
 int3 self test
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 srinivas.eeda@oracle.com, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIwMTkvNy8xMiAyMjowNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMS8wNy8yMDE5
IDAzOjE1LCBaaGVuemhvbmcgRHVhbiB3cm90ZToKPj4gQ29tbWl0IDc0NTdjMGRhMDI0YiAoIng4
Ni9hbHRlcm5hdGl2ZXM6IEFkZCBpbnQzX2VtdWxhdGVfY2FsbCgpCj4+IHNlbGZ0ZXN0IikgaXMg
dXNlZCB0byBlbnN1cmUgdGhlcmUgaXMgYSBnYXAgc2V0dXAgaW4gZXhjZXB0aW9uIHN0YWNrCj4+
IHdoaWNoIGNvdWxkIGJlIHVzZWQgZm9yIGluc2VydGluZyBjYWxsIHJldHVybiBhZGRyZXNzLgo+
Pgo+PiBUaGlzIGdhcCBpcyBtaXNzZWQgaW4gWEVOIFBWIGludDMgZXhjZXB0aW9uIGVudHJ5IHBh
dGgsIHRoZW4gYmVsb3cgcGFuaWMKPj4gdHJpZ2dlcmVkOgo+Pgo+PiBbICAgIDAuNzcyODc2XSBn
ZW5lcmFsIHByb3RlY3Rpb24gZmF1bHQ6IDAwMDAgWyMxXSBTTVAgTk9QVEkKPj4gWyAgICAwLjc3
Mjg4Nl0gQ1BVOiAwIFBJRDogMCBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNS4yLjArICMx
MQo+PiBbICAgIDAuNzcyODkzXSBSSVA6IGUwMzA6aW50M19tYWdpYysweDAvMHg3Cj4+IFsgICAg
MC43NzI5MDVdIFJTUDogMzUwNzpmZmZmZmZmZjgyMjAzZTk4IEVGTEFHUzogMDAwMDAyNDYKPj4g
WyAgICAwLjc3MzMzNF0gQ2FsbCBUcmFjZToKPj4gWyAgICAwLjc3MzMzNF0gIGFsdGVybmF0aXZl
X2luc3RydWN0aW9ucysweDNkLzB4MTJlCj4+IFsgICAgMC43NzMzMzRdICBjaGVja19idWdzKzB4
N2M5LzB4ODg3Cj4+IFsgICAgMC43NzMzMzRdICA/IF9fZ2V0X2xvY2tlZF9wdGUrMHgxNzgvMHgx
ZjAKPj4gWyAgICAwLjc3MzMzNF0gIHN0YXJ0X2tlcm5lbCsweDRmZi8weDUzNQo+PiBbICAgIDAu
NzczMzM0XSAgPyBzZXRfaW5pdF9hcmcrMHg1NS8weDU1Cj4+IFsgICAgMC43NzMzMzRdICB4ZW5f
c3RhcnRfa2VybmVsKzB4NTcxLzB4NTdhCj4+Cj4+IEFzIHhlbmludDMgYW5kIGludDMgZW50cnkg
Y29kZSBhcmUgc2FtZSBleGNlcHQgeGVuaW50MyBkb2Vzbid0IGdlbmVyYXRlCj4+IGEgZ2FwLCB3
ZSBjYW4gZml4IGl0IGJ5IHVzaW5nIGludDMgYW5kIGRyb3AgdXNlbGVzcyB4ZW5pbnQzLgo+IEZv
ciA2NGJpdCBQViBndWVzdHMsIFhlbidzIEFCSSBlbnRlcnMgdGhlIGtlcm5lbCB3aXRoIHVzaW5n
IFNZU1JFVCwgd2l0aAo+ICVyY3gvJXIxMSBvbiB0aGUgc3RhY2suCj4KPiBUbyBjb252ZXJ0IGJh
Y2sgdG8gIm5vcm1hbCIgbG9va2luZyBleGNlcHRpb25zLCB0aGUgeGVuIHRodW5rcyBkbyBgcG9w
Cj4gJXJjeDsgcG9wICVyMTE7IGptcCBkb18qYC4uLgpJIHdpbGwgYWRkIHRoaXMgdG8gY29tbWl0
IG1lc3NhZ2UuCj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlMgYi9h
cmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TCj4+IGluZGV4IDBlYTQ4MzEuLjM1YTY2ZmMgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlMKPj4gKysrIGIvYXJjaC94ODYvZW50
cnkvZW50cnlfNjQuUwo+PiBAQCAtMTE3Niw3ICsxMTc2LDYgQEAgaWR0ZW50cnkgc3RhY2tfc2Vn
bWVudAkJZG9fc3RhY2tfc2VnbWVudAloYXNfZXJyb3JfY29kZT0xCj4+ICAgI2lmZGVmIENPTkZJ
R19YRU5fUFYKPj4gICBpZHRlbnRyeSB4ZW5ubWkJCQlkb19ubWkJCQloYXNfZXJyb3JfY29kZT0w
Cj4+ICAgaWR0ZW50cnkgeGVuZGVidWcJCWRvX2RlYnVnCQloYXNfZXJyb3JfY29kZT0wCj4+IC1p
ZHRlbnRyeSB4ZW5pbnQzCQlkb19pbnQzCQkJaGFzX2Vycm9yX2NvZGU9MAo+PiAgICNlbmRpZgo+
IFdoYXQgaXMgY29uZnVzaW5nIGlzIHdoeSB0aGVyZSBhcmUgMyBleHRyYSBtYWdpYyB2ZXJzaW9u
cyBoZXJlLsKgIEF0IGEKPiBndWVzcywgSSdkIHNheSBzb21ldGhpbmcgdG8gZG8gd2l0aCBJU1Qg
c2V0dGluZ3MgKGdpdmVuIHRoZSB2ZWN0b3JzKSwKPiBidXQgSSBkb24ndCBzZWUgd2h5ICNEQi8j
QlAgd291bGQgbmVlZCB0byBiZSBkaWZmZXJlbnQgaW4gdGhlIGZpcnN0Cj4gcGxhY2UuwqAgKE5N
SSBzdXJlLCBidXQgdGhhdCBpcyBtb3JlIHRvIGRvIHdpdGggdGhlIGNyYXp5IGhvb3BzIG5lZWRp
bmcKPiB0byBiZSBqdW1wZWQgdGhyb3VnaCB0byBrZWVwIG5hdGl2ZSBmdW5jdGlvbmluZyBzYWZl
bHkuKQoKeGVuaW50MyB3aWxsIGJlIHJlbW92ZWQgaW4gdGhpcyBwYXRjaCBzYWZlbHkgYXMgaXQg
ZG9uJ3QgdXNlIElTVCBub3cuCgpCdXQgZGVidWcgYW5kIG5taSBuZWVkIHBhcmFub2lkX2VudHJ5
IHdoaWNoIHdpbGwgcmVhZCBNU1JfR1NfQkFTRSB0byAKZGV0ZXJtaW5lCgppZiBzd2FwZ3MgaXMg
bmVlZGVkLiBJIGd1ZXNzIFBWIGd1ZXN0aW5nIHJ1bm5pbmcgaW4gcmluZzMgd2lsbCAjR1Agd2l0
aCAKc3dhcGdzPwoKClpoZW56aG9uZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
