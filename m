Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E8DB2442
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 18:41:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8oah-0000MN-SD; Fri, 13 Sep 2019 16:38:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OkM0=XI=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1i8oag-0000M4-Uk
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 16:38:35 +0000
X-Inumbo-ID: ed21c2fa-d644-11e9-95b5-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed21c2fa-d644-11e9-95b5-12813bfff9fa;
 Fri, 13 Sep 2019 16:38:34 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8DGcUeU116276;
 Fri, 13 Sep 2019 16:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=riXv269f7lKOjXrVM+EF/aPvve9NSmtEFDgBBGvKYE8=;
 b=R5ewpTb6MgTmK111QbqLe4vQB86UckYc3T5ihXWLoNfVKwXZ1rtlMU0OOmmq4+rADTbz
 gIEYLzucXb4+FgWW9nl1aVyrJRrAIZsPy3r/t+phQXP+08pQTuTS1BzbqLIrUMap4Cua
 hfznmYSTDzCq88dlKznhTI1w7iriOl4qYegjGlQyNBtapOXOxkUdeVaZEVJq5iwHcupR
 m24tAeUlraqmX6EaA36g/sv6Y/yiSrQ2CS6hWt6k3WbYuuySt6DL/sIzGfZ5+vUIG3HO
 A9FdAN+aHYE0Tma9Rejx2bkSZKvQzHaLTwGn9VsxRrXC4qZB95Zmhcer2Z/6cPMWyIm8 fw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2uytd35vph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 16:38:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8DGcK8N010481;
 Fri, 13 Sep 2019 16:38:32 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2uytdjh95v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 16:38:31 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8DGcVUE014244;
 Fri, 13 Sep 2019 16:38:31 GMT
Received: from [10.211.46.60] (/10.211.46.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 13 Sep 2019 09:38:31 -0700
To: Jan Beulich <jbeulich@suse.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <015923df-34c5-95e0-295f-84bd84c25884@suse.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <081dab07-bf85-6477-a710-38f671ec20ba@oracle.com>
Date: Fri, 13 Sep 2019 09:38:30 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <015923df-34c5-95e0-295f-84bd84c25884@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9379
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909130168
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9379
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909130168
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
 Joao Martins <joao.m.martins@oracle.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKVGhhbmtzIGZvciB5b3VyIHJlcGx5LCBzZWUgbXkgcmVwbHkgaW4gbGluZSBwbGVh
c2UuCgpPbiA5LzEzLzE5IDEyOjE0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxMi4wOS4y
MDE5IDIwOjAzLCBKb2UgSmluIHdyb3RlOgo+PiBXaXRoIGJlbG93IHRlc3RjYXNlLCBndWVzdCBr
ZXJuZWwgcmVwb3J0ZWQgIk5vIGlycSBoYW5kbGVyIGZvciB2ZWN0b3IiOgo+PiAgIDEpLiBQYXNz
dGhyb3VnaCBtbHggaWIgVkYgdG8gMiBwdmh2bSBndWVzdHMuCj4+ICAgMikuIFN0YXJ0IHJkcy1z
dHJlc3MgYmV0d2VlbiAyIGd1ZXN0cy4KPj4gICAzKS4gU2NhbGUgZG93biAyIGd1ZXN0cyB2Y3B1
IGZyb20gMzIgdG8gNiBhdCB0aGUgc2FtZSB0aW1lLgo+Pgo+PiBSZXBlYXQgYWJvdmUgdGVzdCBz
ZXZlcmFsIGl0ZXJhdGlvbiwgZ3Vlc3Qga2VybmVsIHJlcG9ydGVkICJObyBpcnEgaGFuZGxlcgo+
PiBmb3IgdmVjdG9yIiwgYW5kIElCIHRyYWZmaWMgZG93bmVkIHRvIHplcm8gd2hpY2ggY2F1c2Vk
IGJ5IGludGVycnVwdCBsb3N0Lgo+Pgo+PiBXaGVuIHZjcHUgb2ZmbGluZSwga2VybmVsIGRpc2Fi
bGVkIGxvY2FsIElSUSwgbWlncmF0ZSBJUlEgdG8gb3RoZXIgY3B1LAo+PiB1cGRhdGUgTVNJLVgg
dGFibGUsIGVuYWJsZSBJUlEuIElmIGFueSBuZXcgaW50ZXJydXB0IGFycml2ZWQgYWZ0ZXIKPj4g
bG9jYWwgSVJRIGRpc2FibGVkIGFsc28gYmVmb3JlIE1TSS1YIHRhYmxlIGJlZW4gdXBkYXRlZCwg
aW50ZXJydXB0IHN0aWxsIAo+PiB1c2VkIG9sZCB2ZWN0b3IgYW5kIGRlc3QgY3B1IGluZm8sIGFu
ZCB3aGVuIGxvY2FsIElSUSBlbmFibGVkIGFnYWluLCAKPj4gaW50ZXJydXB0IGJlZW4gc2VudCB0
byB3cm9uZyBjcHUgYW5kIHZlY3Rvci4KPj4KPj4gTG9va3Mgc3luYyBQSVIgdG8gSVJSIGFmdGVy
IE1TSS1YIGJlZW4gdXBkYXRlZCBpcyBoZWxwIGZvciB0aGlzIGlzc3VlLgo+IAo+IEknbSBoYXZp
bmcgdHJvdWJsZSBtYWtpbmcgdGhlIGNvbm5lY3Rpb24sIHdoaWNoIHF1aXRlIHBvc3NpYmx5IHNp
bXBseQo+IG1lYW5zIHRoZSBkZXNjcmlwdGlvbiBuZWVkcyB0byBiZSBmdXJ0aGVyIGV4dGVuZGVk
OiBTeW5jLWluZyBQSVIgdG8KPiBJUlIgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBhIHZlY3RvciBj
aGFuZ2UuIEl0IHdvdWxkIGhlbHAgaWYgbm90aGluZwo+IGVsc2UgY2F1c2VkIHRoaXMgYml0bWFw
IHByb3BhZ2F0aW9uLCBhbmQgYW4gaW50ZXJydXB0IHdhcyBsb3N0IChyYXRoZXIKPiB0aGFuIGRl
bGl2ZXJlZCB0aHJvdWdoIHRoZSB3cm9uZyB2ZWN0b3IsIG9yIHRvIHRoZSB3cm9uZyBDUFUpLgo+
IEZ1cnRoZXJtb3JlIHdpdGggdmVjdG9yIGFuZCBkZXN0aW5hdGlvbiBiZWluZyBjb3VwbGVkLCBh
ZnRlciBhIENQVSBoYXMKPiBiZWVuIG9mZmxpbmVkIHRoaXMgd291bGQgZ2VuZXJhbGx5IG1lYW4K
PiAtIGlmIHRoZXJlIHdhcyBqdXN0IGEgc2luZ2xlIGRlc3RpbmF0aW9uIHBlcm1pdHRlZCwgbGFj
ayBvZiBkZWxpdmVyeQo+ICAgYWx0b2dldGhlciwKPiAtIGlmIHRoZXJlIHdlcmUgbXVsdGlwbGUg
ZGVzdGluYXRpb25zIHBlcm1pdHRlZCwgZGVsaXZlcnkgdG8gb25lIG9mCj4gICB0aGUgb3RoZXIg
Q1BVcywgYXQgd2hpY2ggcG9pbnQgdGhlIHZlY3RvciB3b3VsZCBzdGlsbCBiZSB2YWxpZC4KCldo
ZW4gY3B1IG9mZmxpbmUgb24gZ3Vlc3Qga2VybmVsLCBpdCBvbmx5IG1pZ3JhdGVzIElSUXMgd2hp
Y2ggYWZmaW5pdHkgc2V0CnRvIHRoZSBjcHUgb25seSwgaWYgbXVsdGlwbGUgZGVzdGluYXRpb25z
LCBrZXJuZWwgZG9lcyBub3QgZG8gbWlncmF0aW9uCndoaWNoIGluY2x1ZGVkIHVwZGF0ZSBtc2kt
eCB0YWJsZSB3aXRoIG5ldyBkZXN0aW5hdGlvbiBhbHNvIHZlY3Rvci4KCkFmdGVyIElSUSBtaWdy
YXRpb24sIGtlcm5lbCB3aWxsIGNoZWNrIGFsbCB2ZWN0b3IncyBJUlIsIGlmIEFQSUMgSVJSCmJl
ZW4gc2V0LCByZXRyaWdnZXIgdGhlIElSUSB0byBuZXcgZGVzdGluYXRpb24uIFRoaXMgaW50ZW5k
IHRvIGF2b2lkCnRvIGxvc3QgYW55IGludGVycnVwdC4KCkJ1dCBvbiBYZW4sIGFmdGVyIG1zaS14
IHRhYmxlIHVwZGF0ZWQsIGl0IG5ldmVyIHRyaWVkIHRvIGNoZWNrIGFuZCBub3RpZnkKZ3Vlc3Qg
a2VybmVsIHRoZXJlIHdhcyBwZW5kaW5nIElSUS4KCj4gCj4gQW4gaW50ZXJlc3RpbmcgYXNwZWN0
IHdvdWxkIGJlIG9uIHdoaWNoIENQVSB0aGUgbG9nIG1lc3NhZ2Ugd2FzCj4gb2JzZXJ2ZWQsIGFu
ZCBob3cgdGhpcyBjb3JyZWxhdGVzIHdpdGggdGhlIGRlc3RpbmF0aW9uIHNldHMgb2YgdGhlCj4g
Q1BVcyB0aGF0IGhhdmUgZ290IG9mZmxpbmVkLiBGcm9tIHRoZXJlIGl0IHdvdWxkIHRoZW4gZnVy
dGhlciBiZQo+IGludGVyZXN0aW5nIHRvIHVuZGVyc3RhbmQgd2h5IHRoZSBpbnRlcnJ1cHQgbWFk
ZSBpdCB0byB0aGF0IENQVSwKPiBzaW5jZSAtIGFzIHNhaWQgLSBkZXN0aW5hdGlvbiBhbmQgdmVj
dG9yIGdldCBjaGFuZ2VkIHRvZ2V0aGVyLCBhbmQKPiBoZW5jZSB3aXRoIHRoaW5ncyBnb2luZyB3
cm9uZyBpdCB3b3VsZCBiZSBvZiBpbnRlcmVzdCB0byBrbm93IHdoZXRoZXIKPiB0aGUgQ1BVIHJl
Y2VpdmluZyB0aGUgSVJRIGlzIHdpdGhpbiB0aGUgbmV3IGRlc3RpbmF0aW9uIHNldCwgb3Igc29t
ZQo+IChyYW5kb20/KSBvdGhlciBvbmUuCgppcnFfcmV0cmlnZ2VyKCkgYmVlbiBjYWxsZWQgYWZ0
ZXIga2VybmVsIHVwZGF0ZWQgdmVjdG9yLCBpcnFfcmV0cmlnZ2VyKCkKd2lsbCBzZW5kIHBlbmRp
bmcgSVJRKHMpIHRvIG5ldyBkZXN0aW5hdGlvbi4KCkhlcmUgYXJlIGtlcm5lbCBsb2cgd2hlbiBp
c3N1ZSBoYXBwZW5lZCwgZ3Vlc3Qga2VybmVsIGlzIDQuMSwgb24gNC4xNApndWVzdCwgaXQncyBh
bG1vc3Qgc2FtZSwgYnV0IG5vICIoaXJxIC0xKSIgZm9yIGtlcm5lbCBjaGFuZ2VzLCBJUlEKbWln
cmF0aW9ucyB3b3JrZmxvdyBhcmUgc2FtZShmaXh1cF9pcnFzKCkpOgoKU2VwIDEyIDIwOjI2OjQ2
IGxvY2FsaG9zdCBrZXJuZWw6IHNtcGJvb3Q6IENQVSAxNyBpcyBub3cgb2ZmbGluZQpTZXAgMTIg
MjA6MjY6NDYgbG9jYWxob3N0IGtlcm5lbDogc21wYm9vdDogQ1BVIDE4IGlzIG5vdyBvZmZsaW5l
ClNlcCAxMiAyMDoyNjo0NiBsb2NhbGhvc3Qga2VybmVsOiBzbXBib290OiBDUFUgMTkgaXMgbm93
IG9mZmxpbmUKU2VwIDEyIDIwOjI2OjQ3IGxvY2FsaG9zdCBrZXJuZWw6IEJyb2tlIGFmZmluaXR5
IGZvciBpcnEgMjUxClNlcCAxMiAyMDoyNjo0NyBsb2NhbGhvc3Qga2VybmVsOiBkb19JUlE6IDIw
LjE3OCBObyBpcnEgaGFuZGxlciBmb3IgdmVjdG9yIChpcnEgLTEpClNlcCAxMiAyMDoyNjo0NyBs
b2NhbGhvc3Qga2VybmVsOiBzbXBib290OiBDUFUgMjAgaXMgbm93IG9mZmxpbmUKU2VwIDEyIDIw
OjI2OjQ3IGxvY2FsaG9zdCBrZXJuZWw6IHNtcGJvb3Q6IENQVSAyMSBpcyBub3cgb2ZmbGluZQoK
RnJvbSBhYm92ZSwgeW91IGNhbiBzZWUgSVJRIHNlbnQgdG8gY3B1IDIwLCB3aGljaCBpcyBvZmZs
aW5pbmcuCgpJUlEgYXJyaXZlZCB0byB0aGUgY3B1IGltbWVkaWF0ZWx5IHdoZW4gSVJRIGVuYWJs
ZWQsIGFmdGVyIENQVSBvZmZsaW5lZCwKaXQgcHJpbnRzIGxvZyAic21wYm9vdDogQ1BVIDIwIGlz
IG5vdyBvZmZsaW5lIi4KCkNhbGwgcGF0aCBpbiBrZXJuZWwgYXMgYmVsb3c6CmNwdV9kb3duKCkK
ICB8LT4gY3B1X2Rvd25fbWFwc19sb2NrZWQoKQogIHwgICAgIF9jcHVfZG93bgogIHwgICAgICAg
fC0+IF9fc3RvcF9tYWNoaW5lCiAgfCAgICAgICAgICAgICB8LT4gc3RvcF9jcHVzKCkKICB8ICAg
ICAgICAgICAgICAgICAgIHwtPl9fc3RvcF9jcHVzKCkKICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgfC0gcXVldWVfc3RvcF9jcHVzX3dvcmsoKSAtLS0rCiAgfC0+IF9fY3B1X2RpZSgpICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAogICAgICAgICB8LT4gcHJfaW5mbygi
Q1BVICV1IGlzIG5vdyBvZmZsaW5lXG4iLCBjcHUpOyAgIHwKICAgICArLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCiAgICAgfAogICAgICsKbXVsdGlf
Y3B1X3N0b3AoKQogIHwtPiBsb2NhbF9zYXZlX2ZsYWdzCiAgfC0+IHRha2VfY3B1X2Rvd24oKQog
IHwgICAgICB8LT4gX19jcHVfZGlzYWJsZQogIHwgICAgICAgICAgICB8LT4gc21wX29wcy5jcHVf
ZGlzYWJsZSA9IHhlbl9jcHVfZGlzYWJsZQogIHwgICAgICAgICAgICAgICAgICB8LT4gY3B1X2Rp
c2FibGVfY29tbW9uCiAgfCAgICAgICAgICAgICAgICAgICAgICAgIHwtPiBmaXh1cF9pcnFzIDw9
PSBJUlEgbWlncmF0aW9uLgogIHwtPiBsb2NhbF9pcnFfcmVzdG9yZSgpCgo+IAo+PiBCVFcsIEkg
Y291bGQgbm90IHJlcHJvZHVjZWQgdGhpcyBpc3N1ZSBpZiBJIGRpc2FibGVkIGFwaWN2Lgo+IAo+
IFdoaWNoLCBJIGFncmVlLCBpcyBhIGZhaXIgaGludCBvZiBzb21ldGhpbmcgQVBJQy1WLXNwZWNp
ZmljIHRvIGJlCj4gYW1pc3MsIGJ1dCB3aGljaCAoZHVlIHRvIHRoZSB2YXN0bHkgZGlmZmVyZW50
IHRpbWluZykgaXNuJ3QgYQo+IHJlbGlhYmxlIGluZGljYXRvci4KClNlZW1zIGFwaWN2IGVuYWJs
ZWQvZGlzYWJsZWQsIGl0IG9uIGRpZmZlcmVudCBjb2RlIHBhdGguCj4gCj4+IC0tLSBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMKPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
aW8uYwo+PiBAQCAtNDEyLDYgKzQxMiw5IEBAIGludCBwdF9pcnFfY3JlYXRlX2JpbmQoCj4+ICAg
ICAgICAgICAgICAgICAgcGlycV9kcGNpLT5nbXNpLmd2ZWMgPSBwdF9pcnFfYmluZC0+dS5tc2ku
Z3ZlYzsKPj4gICAgICAgICAgICAgICAgICBwaXJxX2RwY2ktPmdtc2kuZ2ZsYWdzID0gZ2ZsYWdz
Owo+PiAgICAgICAgICAgICAgfQo+PiArCj4+ICsgICAgICAgICAgICBpZiAoIGh2bV9mdW5jcy5z
eW5jX3Bpcl90b19pcnIgKQo+PiArICAgICAgICAgICAgICAgIGh2bV9mdW5jcy5zeW5jX3Bpcl90
b19pcnIoZC0+dmNwdVtwaXJxX2RwY2ktPmdtc2kuZGVzdF92Y3B1X2lkXSk7Cj4gCj4gSWYgdGhl
IG5lZWQgZm9yIHRoaXMgY2hhbmdlIGNhbiBiZSBwcm9wZXJseSBleHBsYWluZWQsIHRoZW4gaXQK
PiBzdGlsbCB3YW50cyBjb252ZXJ0aW5nIHRvIGFsdGVybmF0aXZlX3ZjYWxsKCkgLSB0aGUgdGhl
IG90aGVyCj4gY2FsbGVyIG9mIHRoaXMgaG9vay4gT3IgcGVyaGFwcyBldmVuIGJldHRlciBtb3Zl
IHZsYXBpYy5jJ3MKPiB3cmFwcGVyIChzdWl0YWJseSByZW5hbWVkKSBpbnRvIGh2bS5oLCBhbmQg
dXNlIGl0IGhlcmUuCgpZZXMgSSBhZ3JlZSwgSSdtIG5vdCAxMDAlIHN1cmUsIHNvIEkgc2V0IGl0
IHRvIFJGQy4KCj4gCj4gQWRkaXRpb25hbGx5LCB0aGUgY29kZSBzZXR0aW5nIHBpcnFfZHBjaS0+
Z21zaS5kZXN0X3ZjcHVfaWQKPiAocmlnaHQgYWZ0ZXIgeW91ciBjb2RlIGluc2VydGlvbikgYWxs
b3dzIGZvciB0aGUgZmllbGQgdG8gYmUKPiBpbnZhbGlkLCB3aGljaCBJIHRoaW5rIHlvdSBuZWVk
IHRvIGd1YXJkIGFnYWluc3QuCgpJIHRoaW5rIHlvdSBtZWFucyBtdWx0aXBsZSBkZXN0aW5hdGlv
biwgdGhlbiBpdCdzIC0xPwoKPiAKPiBBbHNvLCBqdXN0IHRvIHJlbWluZCB5b3U6IFBsZWFzZSBm
b2xsb3cgcGF0Y2ggc3VibWlzc2lvbiBydWxlczoKPiBUaGV5IGdldCBzZW50IF90b18gdGhlIGxp
c3QsIHdpdGggbWFpbnRhaW5lcnMgZXRjIF9jY18tZWQuCgpHb3QgaXQsIHRoYW5rcywKSm9lCgo+
IAo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
