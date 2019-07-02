Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6CC5D5FD
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 20:15:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiNHS-0002y5-Hf; Tue, 02 Jul 2019 18:13:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5+mQ=U7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hiNHQ-0002y0-TP
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 18:13:24 +0000
X-Inumbo-ID: 14393261-9cf5-11e9-8980-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 14393261-9cf5-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 18:13:23 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x62I8YYb015804;
 Tue, 2 Jul 2019 18:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=5CEyrD7VI0BP1vAy4DAWpPN5Iqyg+UU28Otfzl1fVyA=;
 b=DwCXEyNeeuz8TfjQs93puUKKo7uGcm+qhodLX0OrH9LDFHpNZLt1wgmylnz0H6AWjdnQ
 ZxLqp/4p5+Thb8lfYfgsGsmUkPTw/E86GjteeED/9aBQvU3dHhD9jjAVQMTG932Xe2Xi
 Zzwbsud+bTTGobJbHkO3fpt6GiH6KM8e7kT8pJl8LXIVmSdcVksII5i0TupwoIybGyTk
 jmlJAXrFJ3Vic7lQTANhusQWsc92ZUwQ3L2XkJ5HTJHpQaUn9qr9pU2AvpR4JbQQf3CD
 JH4UghkpEeuJV1Q1VqfH+ThcbUt8SAwsd/FcHsY9b29MPCll24RiStgUzrkc4SQeQnDR JA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2te61pw9ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 18:13:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x62I87en115880;
 Tue, 2 Jul 2019 18:13:08 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2tebbjwrgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 18:13:08 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x62ID6Nk018866;
 Tue, 2 Jul 2019 18:13:07 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jul 2019 11:13:06 -0700
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1561958399-28906-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561958399-28906-6-git-send-email-zhenzhong.duan@oracle.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <603e1c8a-408b-360d-9a84-6d91b5f1db1b@oracle.com>
Date: Tue, 2 Jul 2019 14:13:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1561958399-28906-6-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9306
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907020200
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9306
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907020200
Subject: Re: [Xen-devel] [PATCH v4 5/5] xen: Add 'xen_nopv' parameter back
 for backward compatibility
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
Cc: jgross@suse.com, sstabellini@kernel.org, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xLzE5IDE6MTkgQU0sIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+IE1hcCAneGVuX25vcHYn
IHRvICdub3B2JyBhbmQgbWFyayAneGVuX25vcHYnIG9ic29sZXRlIGluCj4ga2VybmVsLXBhcmFt
ZXRlcnMudHh0CgpJIGFtIG5vdCBzdXJlIHdlIHdhbnQgcGF0Y2ggIzMsIHdoeSBub3QgZG8gZXZl
cnl0aGluZyBpbiBhIHNpbmdsZSBwYXRjaD8KCgo+Cj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25n
IER1YW4gPHpoZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+Cj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBDYzogSW5nbyBN
b2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+Cj4gQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44
LmRlPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJz
LnR4dCB8IDYgKysrKysrCj4gIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgICAgICAgICAg
ICAgICAgICAgIHwgNyArKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFt
ZXRlcnMudHh0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50
eHQKPiBpbmRleCBkNWMzZGNjLi4zNGViMzIzIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24v
YWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiBAQCAtNTI2NCw2ICs1MjY0LDEyIEBA
Cj4gIAkJCWltcHJvdmUgdGltZXIgcmVzb2x1dGlvbiBhdCB0aGUgZXhwZW5zZSBvZiBwcm9jZXNz
aW5nCj4gIAkJCW1vcmUgdGltZXIgaW50ZXJydXB0cy4KPiAgCj4gKwl4ZW5fbm9wdglbWDg2XQo+
ICsJCQlEaXNhYmxlcyB0aGUgUFYgb3B0aW1pemF0aW9ucyBmb3JjaW5nIHRoZSBIVk0gZ3Vlc3Qg
dG8KPiArCQkJcnVuIGFzIGdlbmVyaWMgSFZNIGd1ZXN0IHdpdGggbm8gUFYgZHJpdmVycy4KPiAr
CQkJVGhpcyBvcHRpb24gaXMgb2Jzb2xldGVkIGJ5IHRoZSAibm9wdiIgb3B0aW9uLCB3aGljaAo+
ICsJCQloYXMgZXF1aXZhbGVudCBlZmZlY3QgZm9yIFhFTiBwbGF0Zm9ybS4KPiArCj4gIAlub3B2
PQkJW1g4NixYRU4sS1ZNLEhZUEVSX1YsVk1XQVJFXQo+ICAJCQlEaXNhYmxlcyB0aGUgUFYgb3B0
aW1pemF0aW9ucyBmb3JjaW5nIHRoZSBndWVzdCB0byBydW4KPiAgCQkJYXMgZ2VuZXJpYyBndWVz
dCB3aXRoIG5vIFBWIGRyaXZlcnMuIEN1cnJlbnRseSBzdXBwb3J0Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5j
Cj4gaW5kZXggMzQwZGZmOC4uNWNkZDYwOCAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni94ZW4vZW5s
aWdodGVuX2h2bS5jCj4gKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYwo+IEBAIC0y
MTEsNiArMjExLDEzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCB4ZW5faHZtX2d1ZXN0X2luaXQodm9p
ZCkKPiAgI2VuZGlmCj4gIH0KPiAgCj4gK3N0YXRpYyBfX2luaXQgaW50IHhlbl9wYXJzZV9ub3B2
KGNoYXIgKmFyZykKPiArewo+ICsJbm9wdiA9IHRydWU7Cgpwcl9ub3RpY2UoIlwieGVuX25vcHZc
IiBpcyBkZXByZWNhdGVkLCBwbGVhc2UgdXNlIFwibm9wdlwiIGluc3RlYWRcbiIpOwoKCi1ib3Jp
cwoKPiArCXJldHVybiAwOwo+ICt9Cj4gK2Vhcmx5X3BhcmFtKCJ4ZW5fbm9wdiIsIHhlbl9wYXJz
ZV9ub3B2KTsKPiArCj4gIGJvb2wgX19pbml0IHhlbl9odm1fbmVlZF9sYXBpYyh2b2lkKQo+ICB7
Cj4gIAlpZiAoeGVuX3B2X2RvbWFpbigpKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
