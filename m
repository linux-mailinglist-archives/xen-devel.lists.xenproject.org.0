Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377F67B3B3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 21:59:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsYFd-0002SC-U5; Tue, 30 Jul 2019 19:57:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z2LZ=V3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hsYFb-0002S6-Ve
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 19:57:36 +0000
X-Inumbo-ID: 45a66b9c-b304-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 45a66b9c-b304-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 19:57:34 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6UJsjZG001485;
 Tue, 30 Jul 2019 19:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=q3a4x4yMF21FwXKdkk1r+Un/1eIYu8QFSlUw4Wtql1s=;
 b=OnYhNHNSJ9oLP1qdIHkrZIb1JnF281ruQ82ogzXsDe9MCmS5r0bIAjxBwT4UfC2WSxT+
 B+ltjgJIkXX255mtn5e9GuQa+aVyoVpz0Wg9R8lfuK2fKKOzNAMe2m4z/69g4wxSRlj+
 DqQv8haLHwAtAS3OATHASm5dZZm7efbYTMgNRDauOkwIfinc5PPZOr3Yg/IAA90T9uUJ
 /yRlM8wluS1iOnPwz/EizEFT8SkZ2Emx0OeYwPBtkb7xagpIPDJAiD2bQ9RFpcCGOvxq
 Ra0YSdTD0+XsUiKylwl2A2MVU0C9BChtLkAMDNYzJoaorfz0z+tsavzZOg+NgXOkRmt2 rw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2u0e1trvkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jul 2019 19:57:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6UJqk15040897;
 Tue, 30 Jul 2019 19:57:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2u2jp4awp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jul 2019 19:57:07 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6UJv3cw001033;
 Tue, 30 Jul 2019 19:57:03 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 30 Jul 2019 12:57:02 -0700
To: Souptick Joarder <jrdr.linux@gmail.com>, jgross@suse.com,
 sstabellini@kernel.org, marmarek@invisiblethingslab.com
References: <1564511696-4044-1-git-send-email-jrdr.linux@gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 mQINBFH8CgsBEAC0KiOi9siOvlXatK2xX99e/J3OvApoYWjieVQ9232Eb7GzCWrItCzP8FUV
 PQg8rMsSd0OzIvvjbEAvaWLlbs8wa3MtVLysHY/DfqRK9Zvr/RgrsYC6ukOB7igy2PGqZd+M
 MDnSmVzik0sPvB6xPV7QyFsykEgpnHbvdZAUy/vyys8xgT0PVYR5hyvhyf6VIfGuvqIsvJw5
 C8+P71CHI+U/IhsKrLrsiYHpAhQkw+Zvyeml6XSi5w4LXDbF+3oholKYCkPwxmGdK8MUIdkM
 d7iYdKqiP4W6FKQou/lC3jvOceGupEoDV9botSWEIIlKdtm6C4GfL45RD8V4B9iy24JHPlom
 woVWc0xBZboQguhauQqrBFooHO3roEeM1pxXjLUbDtH4t3SAI3gt4dpSyT3EvzhyNQVVIxj2
 FXnIChrYxR6S0ijSqUKO0cAduenhBrpYbz9qFcB/GyxD+ZWY7OgQKHUZMWapx5bHGQ8bUZz2
 SfjZwK+GETGhfkvNMf6zXbZkDq4kKB/ywaKvVPodS1Poa44+B9sxbUp1jMfFtlOJ3AYB0WDS
 Op3d7F2ry20CIf1Ifh0nIxkQPkTX7aX5rI92oZeu5u038dHUu/dO2EcuCjl1eDMGm5PLHDSP
 0QUw5xzk1Y8MG1JQ56PtqReO33inBXG63yTIikJmUXFTw6lLJwARAQABtDNCb3JpcyBPc3Ry
 b3Zza3kgKFdvcmspIDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT6JAjgEEwECACIFAlH8
 CgsCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEIredpCGysGyasEP/j5xApopUf4g
 9Fl3UxZuBx+oduuw3JHqgbGZ2siA3EA4bKwtKq8eT7ekpApn4c0HA8TWTDtgZtLSV5IdH+9z
 JimBDrhLkDI3Zsx2CafL4pMJvpUavhc5mEU8myp4dWCuIylHiWG65agvUeFZYK4P33fGqoaS
 VGx3tsQIAr7MsQxilMfRiTEoYH0WWthhE0YVQzV6kx4wj4yLGYPPBtFqnrapKKC8yFTpgjaK
 jImqWhU9CSUAXdNEs/oKVR1XlkDpMCFDl88vKAuJwugnixjbPFTVPyoC7+4Bm/FnL3iwlJVE
 qIGQRspt09r+datFzPqSbp5Fo/9m4JSvgtPp2X2+gIGgLPWp2ft1NXHHVWP19sPgEsEJXSr9
 tskM8ScxEkqAUuDs6+x/ISX8wa5Pvmo65drN+JWA8EqKOHQG6LUsUdJolFM2i4Z0k40BnFU/
 kjTARjrXW94LwokVy4x+ZYgImrnKWeKac6fMfMwH2aKpCQLlVxdO4qvJkv92SzZz4538az1T
 m+3ekJAimou89cXwXHCFb5WqJcyjDfdQF857vTn1z4qu7udYCuuV/4xDEhslUq1+GcNDjAhB
 nNYPzD+SvhWEsrjuXv+fDONdJtmLUpKs4Jtak3smGGhZsqpcNv8nQzUGDQZjuCSmDqW8vn2o
 hWwveNeRTkxh+2x1Qb3GT46uuQINBFH8CgsBEADGC/yx5ctcLQlB9hbq7KNqCDyZNoYu1HAB
 Hal3MuxPfoGKObEktawQPQaSTB5vNlDxKihezLnlT/PKjcXC2R1OjSDinlu5XNGc6mnky03q
 yymUPyiMtWhBBftezTRxWRslPaFWlg/h/Y1iDuOcklhpr7K1h1jRPCrf1yIoxbIpDbffnuyz
 kuto4AahRvBU4Js4sU7f/btU+h+e0AcLVzIhTVPIz7PM+Gk2LNzZ3/on4dnEc/qd+ZZFlOQ4
 KDN/hPqlwA/YJsKzAPX51L6Vv344pqTm6Z0f9M7YALB/11FO2nBB7zw7HAUYqJeHutCwxm7i
 BDNt0g9fhviNcJzagqJ1R7aPjtjBoYvKkbwNu5sWDpQ4idnsnck4YT6ctzN4I+6lfkU8zMzC
 gM2R4qqUXmxFIS4Bee+gnJi0Pc3KcBYBZsDK44FtM//5Cp9DrxRQOh19kNHBlxkmEb8kL/pw
 XIDcEq8MXzPBbxwHKJ3QRWRe5jPNpf8HCjnZz0XyJV0/4M1JvOua7IZftOttQ6KnM4m6WNIZ
 2ydg7dBhDa6iv1oKdL7wdp/rCulVWn8R7+3cRK95SnWiJ0qKDlMbIN8oGMhHdin8cSRYdmHK
 kTnvSGJNlkis5a+048o0C6jI3LozQYD/W9wq7MvgChgVQw1iEOB4u/3FXDEGulRVko6xCBU4
 SQARAQABiQIfBBgBAgAJBQJR/AoLAhsMAAoJEIredpCGysGyfvMQAIywR6jTqix6/fL0Ip8G
 jpt3uk//QNxGJE3ZkUNLX6N786vnEJvc1beCu6EwqD1ezG9fJKMl7F3SEgpYaiKEcHfoKGdh
 30B3Hsq44vOoxR6zxw2B/giADjhmWTP5tWQ9548N4VhIZMYQMQCkdqaueSL+8asp8tBNP+TJ
 PAIIANYvJaD8xA7sYUXGTzOXDh2THWSvmEWWmzok8er/u6ZKdS1YmZkUy8cfzrll/9hiGCTj
 u3qcaOM6i/m4hqtvsI1cOORMVwjJF4+IkC5ZBoeRs/xW5zIBdSUoC8L+OCyj5JETWTt40+lu
 qoqAF/AEGsNZTrwHJYu9rbHH260C0KYCNqmxDdcROUqIzJdzDKOrDmebkEVnxVeLJBIhYZUd
 t3Iq9hdjpU50TA6sQ3mZxzBdfRgg+vaj2DsJqI5Xla9QGKD+xNT6v14cZuIMZzO7w0DoojM4
 ByrabFsOQxGvE0w9Dch2BDSI2Xyk1zjPKxG1VNBQVx3flH37QDWpL2zlJikW29Ws86PHdthh
 Fm5PY8YtX576DchSP6qJC57/eAAe/9ztZdVAdesQwGb9hZHJc75B+VNm4xrh/PJO6c1THqdQ
 19WVJ+7rDx3PhVncGlbAOiiiE3NOFPJ1OQYxPKtpBUukAlOTnkKE6QcA4zckFepUkfmBV1wM
 Jg6OxFYd01z+a+oL
Message-ID: <a99b3c56-589d-e3b7-5337-0ea94ee83c34@oracle.com>
Date: Tue, 30 Jul 2019 15:56:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564511696-4044-1-git-send-email-jrdr.linux@gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9334
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1907300202
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9334
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1907300202
Subject: Re: [Xen-devel] [PATCH] xen/gntdev.c: Replace vm_map_pages() with
 vm_map_pages_zero()
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 willy@infradead.org, linux@armlinux.org.uk, linux-mm@kvack.org,
 stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8zMC8xOSAyOjM0IFBNLCBTb3VwdGljayBKb2FyZGVyIHdyb3RlOgo+ICdjb21taXQgZGY5
YmRlMDE1YTcyICgieGVuL2dudGRldi5jOiBjb252ZXJ0IHRvIHVzZSB2bV9tYXBfcGFnZXMoKSIp
Jwo+IGJyZWFrcyBnbnRkZXYgZHJpdmVyLiBJZiB2bWEtPnZtX3Bnb2ZmID4gMCwgdm1fbWFwX3Bh
Z2VzKCkKPiB3aWxsOgo+ICAtIHVzZSBtYXAtPnBhZ2VzIHN0YXJ0aW5nIGF0IHZtYS0+dm1fcGdv
ZmYgaW5zdGVhZCBvZiAwCj4gIC0gdmVyaWZ5IG1hcC0+Y291bnQgYWdhaW5zdCB2bWFfcGFnZXMo
KSt2bWEtPnZtX3Bnb2ZmIGluc3RlYWQgb2YganVzdAo+ICAgIHZtYV9wYWdlcygpLgo+Cj4gSW4g
cHJhY3RpY2UsIHRoaXMgYnJlYWtzIHVzaW5nIGEgc2luZ2xlIGdudGRldiBGRCBmb3IgbWFwcGlu
ZyBtdWx0aXBsZQo+IGdyYW50cy4KPgo+IHJlbGV2YW50IHN0cmFjZSBvdXRwdXQ6Cj4gW3BpZCAg
IDg1N10gaW9jdGwoNywgSU9DVExfR05UREVWX01BUF9HUkFOVF9SRUYsIDB4N2ZmZDM0MDdiNmQw
KSA9IDAKPiBbcGlkICAgODU3XSBtbWFwKE5VTEwsIDQwOTYsIFBST1RfUkVBRHxQUk9UX1dSSVRF
LCBNQVBfU0hBUkVELCA3LCAwKSA9Cj4gMHg3NzdmMTIxMWIwMDAKPiBbcGlkICAgODU3XSBpb2N0
bCg3LCBJT0NUTF9HTlRERVZfU0VUX1VOTUFQX05PVElGWSwgMHg3ZmZkMzQwN2I3MTApID0gMAo+
IFtwaWQgICA4NTddIGlvY3RsKDcsIElPQ1RMX0dOVERFVl9NQVBfR1JBTlRfUkVGLCAweDdmZmQz
NDA3YjZkMCkgPSAwCj4gW3BpZCAgIDg1N10gbW1hcChOVUxMLCA0MDk2LCBQUk9UX1JFQUR8UFJP
VF9XUklURSwgTUFQX1NIQVJFRCwgNywKPiAweDEwMDApID0gLTEgRU5YSU8gKE5vIHN1Y2ggZGV2
aWNlIG9yIGFkZHJlc3MpCj4KPiBkZXRhaWxzIGhlcmU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL1F1
YmVzT1MvcXViZXMtaXNzdWVzL2lzc3Vlcy81MTk5Cj4KPiBUaGUgcmVhc29uIGlzIC0+ICggY29w
eWluZyBNYXJlaydzIHdvcmQgZnJvbSBkaXNjdXNzaW9uKQo+Cj4gdm1hLT52bV9wZ29mZiBpcyB1
c2VkIGFzIGluZGV4IHBhc3NlZCB0byBnbnRkZXZfZmluZF9tYXBfaW5kZXguIEl0J3MKPiBiYXNp
Y2FsbHkgdXNpbmcgdGhpcyBwYXJhbWV0ZXIgZm9yICJ3aGljaCBncmFudCByZWZlcmVuY2UgdG8g
bWFwIi4KPiBtYXAgc3RydWN0IHJldHVybmVkIGJ5IGdudGRldl9maW5kX21hcF9pbmRleCgpIGRl
c2NyaWJlcyBqdXN0IHRoZSBwYWdlcwo+IHRvIGJlIG1hcHBlZC4gU3BlY2lmaWNhbGx5IG1hcC0+
cGFnZXNbMF0gc2hvdWxkIGJlIG1hcHBlZCBhdAo+IHZtYS0+dm1fc3RhcnQsIG5vdCB2bWEtPnZt
X3N0YXJ0K3ZtYS0+dm1fcGdvZmYqUEFHRV9TSVpFLgo+Cj4gV2hlbiB0cnlpbmcgdG8gbWFwIGdy
YW50IHdpdGggaW5kZXggKGFrYSB2bWEtPnZtX3Bnb2ZmKSA+IDEsCj4gX192bV9tYXBfcGFnZXMo
KSB3aWxsIHJlZnVzZSB0byBtYXAgaXQgYmVjYXVzZSBpdCB3aWxsIGV4cGVjdCBtYXAtPmNvdW50
Cj4gdG8gYmUgYXQgbGVhc3Qgdm1hX3BhZ2VzKHZtYSkrdm1hLT52bV9wZ29mZiwgd2hpbGUgaXQg
aXMgZXhhY3RseQo+IHZtYV9wYWdlcyh2bWEpLgo+Cj4gQ29udmVydGluZyB2bV9tYXBfcGFnZXMo
KSB0byB1c2Ugdm1fbWFwX3BhZ2VzX3plcm8oKSB3aWxsIGZpeCB0aGUKPiBwcm9ibGVtLgo+Cj4g
TWFyZWsgaGFzIHRlc3RlZCBhbmQgY29uZmlybWVkIHRoZSBzYW1lLgoKQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcgIyB2NS4yKwpGaXhlczogZGY5YmRlMDE1YTcyICgieGVuL2dudGRldi5jOiBj
b252ZXJ0IHRvIHVzZSB2bV9tYXBfcGFnZXMoKSIpCgo+IFJlcG9ydGVkLWJ5OiBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Cj4gVGVz
dGVkLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRo
aW5nc2xhYi5jb20+CgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb20+CgoKPiAtLS0KPiAgZHJpdmVycy94ZW4vZ250ZGV2LmMgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMveGVuL2dudGRldi5jIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKPiBpbmRl
eCA0YzMzOWM3Li5hNDQ2YTcyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL2dudGRldi5jCj4g
KysrIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKPiBAQCAtMTE0Myw3ICsxMTQzLDcgQEAgc3RhdGlj
IGludCBnbnRkZXZfbW1hcChzdHJ1Y3QgZmlsZSAqZmxpcCwgc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpCj4gIAkJZ290byBvdXRfcHV0X21hcDsKPiAgCj4gIAlpZiAoIXVzZV9wdGVtb2QpIHsK
PiAtCQllcnIgPSB2bV9tYXBfcGFnZXModm1hLCBtYXAtPnBhZ2VzLCBtYXAtPmNvdW50KTsKPiAr
CQllcnIgPSB2bV9tYXBfcGFnZXNfemVybyh2bWEsIG1hcC0+cGFnZXMsIG1hcC0+Y291bnQpOwo+
ICAJCWlmIChlcnIpCj4gIAkJCWdvdG8gb3V0X3B1dF9tYXA7Cj4gIAl9IGVsc2UgewoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
