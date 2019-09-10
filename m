Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F44AE21D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 03:51:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7VFy-0008Uj-80; Tue, 10 Sep 2019 01:47:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DAD5=XF=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1i7VFw-0008Ud-JD
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 01:47:44 +0000
X-Inumbo-ID: fb2d18fc-d36c-11e9-b299-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb2d18fc-d36c-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 01:47:43 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8A1i3uH060781;
 Tue, 10 Sep 2019 01:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=yazFdrcsdTkSLAhsJkPtZkMltlXsnozFho6m7Gw/B+Y=;
 b=aB7NElDCPJLMH5w894c1Vr01AnZQ3SwxD17AlrK/53rLl6wMl9JCXopSko1iibfbnpSa
 SePuqXbx7UhauOjRHIxIn8ak8i34ieRfsNGgKAIDk58htNJc7OoMZsTn9e2fE2H99qgY
 FPZyMhTChM1vAoyNmt+qddOC42o+6LBSADmoi9Q30o4HAhReAbTCpUywkY+5PWWa6G4Z
 jjImZSAH7QbOk7J0y+BFxEd/+Rw+w4jxwNJHrbz/PSPlWGkvPSTg7KxlIe6GX1DUTgkP
 G1R3cTtxErehSt1UUF3pjjQVFzJX5EsGIOfpp8pPsMo7/AcfFU3S5SurvthleUMP59I8 0A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2uw1jxyxcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 01:47:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8A1lRbZ052588;
 Tue, 10 Sep 2019 01:47:41 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2uwq9p6fe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 01:47:40 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8A1ldVb013403;
 Tue, 10 Sep 2019 01:47:40 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Sep 2019 18:47:39 -0700
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
 <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
 <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
 <4d3bf854-51de-99e4-9a40-a64c581bdd10@citrix.com>
 <bc3da154-d451-02cf-6154-5e0dc721a6e6@oracle.com>
 <c45b8786-5735-a95d-bc40-61372c326037@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <43e492ff-f967-7218-65c4-d16581fabea3@oracle.com>
Date: Mon, 9 Sep 2019 21:47:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c45b8786-5735-a95d-bc40-61372c326037@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909100015
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909100014
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: jgross@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS85LzE5IDU6NDggUE0sIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IE9uIDA5LzA5LzIwMTkg
MjA6MTksIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gOS84LzE5IDc6MzcgUE0sIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gT24gMDkvMDkvMjAxOSAwMDozMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+Pj4+IE9uIDkvOC8xOSA1OjExIFBNLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4+
Pj4gT24gMDgvMDkvMjAxOSAxOToyOCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4+Pj4gT24g
OS82LzE5IDc6MDAgUE0sIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+Pj4+Pj4+IE9uIDA2LzA5LzIw
MTkgMjM6MzAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4+Pj4+Pj4gV2hlcmUgaXMgTUNGRyBw
YXJzZWQ/IHBjaV9hcmNoX2luaXQoKT8KPj4+Pj4+Pj4+IEl0IGhhcHBlbnMgdHdpY2U6Cj4+Pj4+
Pj4gMSkgZmlyc3QgdGltZSBlYXJseSBvbmUgaW4gcGNpX2FyY2hfaW5pdCgpIHRoYXQgaXMgYXJj
aF9pbml0Y2FsbCAtIHRoYXQKPj4+Pj4+PiB0aW1lIHBjaV9tbWNmZ19saXN0IHdpbGwgYmUgZnJl
ZWQgaW1tZWRpYXRlbHkgdGhlcmUgYmVjYXVzZSBNQ0ZHIGFyZWEgaXMKPj4+Pj4+PiBub3QgcmVz
ZXJ2ZWQgaW4gRTgyMDsKPj4+Pj4+PiAyKSBzZWNvbmQgdGltZSBsYXRlIG9uZSBpbiBhY3BpX2lu
aXQoKSB3aGljaCBpcyBzdWJzeXN0ZW1faW5pdGNhbGwgcmlnaHQKPj4+Pj4+PiBiZWZvcmUgd2hl
cmUgUENJIGVudW1lcmF0aW9uIHN0YXJ0cyAtIHRoaXMgdGltZSBBQ1BJIHRhYmxlcyB3aWxsIGJl
Cj4+Pj4+Pj4gY2hlY2tlZCBmb3IgYSByZXNlcnZlZCByZXNvdXJjZSBhbmQgcGNpX21tY2ZnX2xp
c3Qgd2lsbCBiZSBmaW5hbGx5Cj4+Pj4+Pj4gcG9wdWxhdGVkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhl
IHByb2JsZW0gaXMgdGhhdCBvbiBhIHN5c3RlbSB0aGF0IGRvZXNuJ3QgaGF2ZSBNQ0ZHIGFyZWEg
cmVzZXJ2ZWQgaW4KPj4+Pj4+PiBFODIwIHBjaV9tbWNmZ19saXN0IGlzIGVtcHR5IGJlZm9yZSBh
Y3BpX2luaXQoKSBhbmQgb3VyIFBDSSBob29rcyBhcmUKPj4+Pj4+PiBjYWxsZWQgaW4gdGhlIHNh
bWUgcGxhY2UuIFNvIE1DRkcgaXMgc3RpbGwgbm90IGluIHVzZSBieSBYZW4gYXQgdGhpcwo+Pj4+
Pj4+IHBvaW50IHNpbmNlIHdlIGhhdmVuJ3QgcmVhY2hlZCBvdXIgeGVuX21jZmdfbGF0ZSgpLgo+
Pj4+Pj4gV291bGQgaXQgYmUgcG9zc2libGUgZm9yIHVzIHRvIHBhcnNlIE1DRkcgb3Vyc2VsdmVz
IGluIHBjaV94ZW5faW5pdCgpPyBJCj4+Pj4+PiByZWFsaXplIHRoYXQgd2UnZCBiZSBkb2luZyB0
aGlzIHR3aWNlIChvciBtYXliZSBldmVuIHRocmVlIHRpbWVzIHNpbmNlCj4+Pj4+PiBhcHBhcmVu
dGx5IGJvdGggcGNpX2FyY2hfaW5pdCgpwqAgYW5kIGFjcGlfaW5pKCkgZG8gaXQpLgo+Pj4+Pj4K
Pj4+Pj4gSSBkb24ndCB0aGluZSBpdCBtYWtlcyBzZW5zZToKPj4+Pj4gYSkgaXQgbmVlZHMgdG8g
YmUgZG9uZSBhZnRlciBBQ1BJIGlzIGluaXRpYWxpemVkIHNpbmNlIHdlIG5lZWQgdG8gcGFyc2UK
Pj4+Pj4gaXQgdG8gZmlndXJlIG91dCB0aGUgZXhhY3QgcmVzZXJ2ZWQgcmVnaW9uIC0gdGhhdCdz
IHdoeSBpdCdzIGN1cnJlbnRseQo+Pj4+PiBkb25lIGluIGFjcGlfaW5pdCgpIChzZWUgY29tbWl0
IG1lc3NhZ2UgZm9yIHRoZSByZWFzb25zIHdoeSkKPj4+PiBIbW0uLi4gV2Ugc2hvdWxkIGJlIGFi
bGUgdG8gcGFyc2UgQUNQSSB0YWJsZXMgYnkgdGhlIHRpbWUKPj4+PiBwY2lfYXJjaF9pbml0KCkg
aXMgY2FsbGVkLiBJbiBmYWN0LCBpZiB5b3UgbG9vayBhdAo+Pj4+IHBjaV9tbWNmZ19lYXJseV9p
bml0KCkgeW91IHdpbGwgc2VlIHRoYXQgaXQgZG9lcyBqdXN0IHRoYXQuCj4+Pj4KPj4+IFRoZSBw
b2ludCBpcyBub3QgdG8gcGFyc2UgTUNGRyBhZnRlciBhY3BpX2luaXQgYnV0IHRvIHBhcnNlIERT
RFQgZm9yCj4+PiByZXNlcnZlZCByZXNvdXJjZSB3aGljaCBjb3VsZCBiZSBkb25lIG9ubHkgYWZ0
ZXIgQUNQSSBpbml0aWFsaXphdGlvbi4KPj4gT0ssIEkgdGhpbmsgSSB1bmRlcnN0YW5kIG5vdyB3
aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGRvIC0tLSB5b3UgYXJlCj4+IGVzc2VudGlhbGx5IHRyeWlu
ZyB0byBhY2NvdW50IGZvciB0aGUgcmFuZ2UgaW5zZXJ0ZWQgYnkKPj4gc2V0dXBfbWNmZ19tYXAo
KSwgcmlnaHQ/Cj4+Cj4gQWN0dWFsbHksIHBjaV9tbWNmZ19sYXRlX2luaXQoKSB0aGF0J3MgY2Fs
bGVkIG91dCBvZiBhY3BpX2luaXQoKSAtCj4gdGhhdCdzIHdoZXJlIE1DRkcgYXJlYXMgYXJlIHBy
b3Blcmx5IHNpemVkLiAKCnBjaV9tbWNmZ19sYXRlX2luaXQoKSByZWFkcyB0aGUgKHN0YXRpYykg
TUNGRywgd2hpY2ggZG9lc24ndCBuZWVkIERTRFQgcGFyc2luZywgZG9lcyBpdD8gc2V0dXBfbWNm
Z19tYXAoKSBPVE9IIGRvZXMgbmVlZCBpdCBhcyBpdCB1c2VzIGRhdGEgZnJvbSBfQ0JBIChvciBp
cyBpdCBfQ1JTPyksIGFuZCBJIHRoaW5rIHRoYXQncyB3aHkgd2UgY2FuJ3QgcGFyc2UgTUNGRyBw
cmlvciB0byBhY3BpX2luaXQoKS4gU28gd2hhdCBJIHNhaWQgYWJvdmUgaW5kZWVkIHdvbid0IHdv
cmsuCgo+IHNldHVwX21jZmdfbWFwKCkgaXMgbW9zdGx5Cj4gZm9yIGJ1cyBob3RwbHVnIHdoZXJl
IE1DRkcgYXJlYSBpcyBkaXNjb3ZlcmVkIGJ5IGV2YWx1YXRpbmcgX0NCQSBtZXRob2Q7Cj4gZm9y
IGNvbGQtcGx1Z2dlZCBidXNlcyBpdCBqdXN0IGNvbmZpcm1zIHRoYXQgTUNGRyBhcmVhIGlzIGFs
cmVhZHkKPiByZWdpc3RlcmVkIGJlY2F1c2UgaXQgaXMgbWFuZGF0ZWQgZm9yIHRoZW0gdG8gYmUg
aW4gTUNGRyB0YWJsZSBhdCBib290IHRpbWUuCj4KPj4gVGhlIG90aGVyIHF1ZXN0aW9uIEkgaGF2
ZSBpcyB3aHkgeW91IHRoaW5rIGl0J3Mgd29ydGgga2VlcGluZwo+PiB4ZW5fbWNmZ19sYXRlKCkg
YXMgYSBsYXRlIGluaXRjYWxsLiBIb3cgY291bGQgTUNGRyBpbmZvIGJlIHVwZGF0ZWQKPj4gYmV0
d2VlbiBhY3BpX2luaXQoKSBhbmQgbGF0ZV9pbml0Y2FsbHMgYmVpbmcgcnVuPyBJJ2QgdGhpbmsg
aXQgY2FuIG9ubHkKPj4gaGFwcGVuIHdoZW4gYSBuZXcgZGV2aWNlIGlzIGhvdHBsdWdnZWQuCj4+
Cj4gSXQgd2FzIGEgcHJlY2F1dGlvbiBhZ2FpbnN0IHNldHVwX21jZmdfbWFwKCkgY2FsbHMgdGhh
dCBtaWdodCBhZGQgbmV3Cj4gYXJlYXMgdGhhdCBhcmUgbm90IGluIE1DRkcgdGFibGUgYnV0IGZv
ciBzb21lIHJlYXNvbiBoYXZlIF9DQkEgbWV0aG9kLgo+IEl0J3Mgb2J2aW91c2x5IGEgImZpcm13
YXJlIGlzIGJyb2tlbiIgc2NlbmFyaW8gc28gSSBkb24ndCBoYXZlIHN0cm9uZwo+IGZlZWxpbmdz
IHRvIGtlZXAgaXQgaGVyZS4gV2lsbCBwcmVmZXIgdG8gcmVtb3ZlIGluIHYyIGlmIHlvdSB3YW50
LgoKSXNuJ3Qgc2V0dXBfbWNmZ19tYXAoKSBjYWxsZWQgYmVmb3JlIHRoZSBmaXJzdCB4ZW5fYWRk
X2RldmljZSgpIHdoaWNoIGlzIHdoZXJlIHlvdSBhcmUgY2FsbGluZyB4ZW5fbWNmZ19sYXRlKCk/
CgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
