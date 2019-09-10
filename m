Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCBEAF0B5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 19:52:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7kFe-0007kp-Kg; Tue, 10 Sep 2019 17:48:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DAD5=XF=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1i7kFd-0007kk-51
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 17:48:25 +0000
X-Inumbo-ID: 2f04edb8-d3f3-11e9-ac20-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f04edb8-d3f3-11e9-ac20-12813bfff9fa;
 Tue, 10 Sep 2019 17:48:23 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8AHdYwX157279;
 Tue, 10 Sep 2019 17:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=cO4mIuv4/NshJ0bwX5tqD/8OFGeqAT1pBm22YBSrTQ4=;
 b=kRDXONDDGwjsho+0/0pFy6JC+Rw8nzdhZz9/wJLNFU187qBQR8GXQAZvDkHMQNpbXFng
 DqSyPUjaTzlzc9zbnyGGDBiB2vVF0pXG2Z57Fo9L5pPMnf/VKoQq1aQ4a3I5WuHWENpJ
 n0KymjWB39AV8URdQvn6wGHvL/83EOgJsmy5/B2V+osfXlM09bY7QnbrjUhqOKAOK3/X
 SMQatqZKa/LPZJG103xsDb0fuJ8gciRdpQnKt6XndYMENSOru7M2ZcYi37siqwoK1W+0
 gl6MNXxoD7eh6I5Crhyg3izZgiDP7RatkV8nqYDiioKTg26wNDczXFaXnxbGVovz/NUP hw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2uw1jkd36p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 17:48:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8AHheAV006059;
 Tue, 10 Sep 2019 17:48:20 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2uwpjw4g6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 17:48:20 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8AHmJ0k000816;
 Tue, 10 Sep 2019 17:48:19 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Sep 2019 10:48:19 -0700
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
 <43e492ff-f967-7218-65c4-d16581fabea3@oracle.com>
 <416ff4b7-3186-f61a-75fa-bcfc968f8117@citrix.com>
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
Message-ID: <df64cd80-d92e-27ad-b1bc-e58184379e50@oracle.com>
Date: Tue, 10 Sep 2019 13:48:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <416ff4b7-3186-f61a-75fa-bcfc968f8117@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9376
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909100171
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9376
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909100171
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

T24gOS8xMC8xOSA1OjQ2IEFNLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPiBPbiAxMC8wOS8yMDE5
IDAyOjQ3LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDkvOS8xOSA1OjQ4IFBNLCBJZ29y
IERydXpoaW5pbiB3cm90ZToKPj4+IE9uIDA5LzA5LzIwMTkgMjA6MTksIEJvcmlzIE9zdHJvdnNr
eSB3cm90ZToKPj4+PiBPbiA5LzgvMTkgNzozNyBQTSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+
Pj4+IE9uIDA5LzA5LzIwMTkgMDA6MzAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4+Pj4+IE9u
IDkvOC8xOSA1OjExIFBNLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4+Pj4+PiBPbiAwOC8wOS8y
MDE5IDE5OjI4LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+Pj4+Pj4+IFdvdWxkIGl0IGJlIHBv
c3NpYmxlIGZvciB1cyB0byBwYXJzZSBNQ0ZHIG91cnNlbHZlcyBpbiBwY2lfeGVuX2luaXQoKT8g
SQo+Pj4+Pj4+PiByZWFsaXplIHRoYXQgd2UnZCBiZSBkb2luZyB0aGlzIHR3aWNlIChvciBtYXli
ZSBldmVuIHRocmVlIHRpbWVzIHNpbmNlCj4+Pj4+Pj4+IGFwcGFyZW50bHkgYm90aCBwY2lfYXJj
aF9pbml0KCnCoCBhbmQgYWNwaV9pbmkoKSBkbyBpdCkuCj4+Pj4+Pj4+Cj4+Pj4+Pj4gSSBkb24n
dCB0aGluZSBpdCBtYWtlcyBzZW5zZToKPj4+Pj4+PiBhKSBpdCBuZWVkcyB0byBiZSBkb25lIGFm
dGVyIEFDUEkgaXMgaW5pdGlhbGl6ZWQgc2luY2Ugd2UgbmVlZCB0byBwYXJzZQo+Pj4+Pj4+IGl0
IHRvIGZpZ3VyZSBvdXQgdGhlIGV4YWN0IHJlc2VydmVkIHJlZ2lvbiAtIHRoYXQncyB3aHkgaXQn
cyBjdXJyZW50bHkKPj4+Pj4+PiBkb25lIGluIGFjcGlfaW5pdCgpIChzZWUgY29tbWl0IG1lc3Nh
Z2UgZm9yIHRoZSByZWFzb25zIHdoeSkKPj4+Pj4+IEhtbS4uLiBXZSBzaG91bGQgYmUgYWJsZSB0
byBwYXJzZSBBQ1BJIHRhYmxlcyBieSB0aGUgdGltZQo+Pj4+Pj4gcGNpX2FyY2hfaW5pdCgpIGlz
IGNhbGxlZC4gSW4gZmFjdCwgaWYgeW91IGxvb2sgYXQKPj4+Pj4+IHBjaV9tbWNmZ19lYXJseV9p
bml0KCkgeW91IHdpbGwgc2VlIHRoYXQgaXQgZG9lcyBqdXN0IHRoYXQuCj4+Pj4+Pgo+Pj4+PiBU
aGUgcG9pbnQgaXMgbm90IHRvIHBhcnNlIE1DRkcgYWZ0ZXIgYWNwaV9pbml0IGJ1dCB0byBwYXJz
ZSBEU0RUIGZvcgo+Pj4+PiByZXNlcnZlZCByZXNvdXJjZSB3aGljaCBjb3VsZCBiZSBkb25lIG9u
bHkgYWZ0ZXIgQUNQSSBpbml0aWFsaXphdGlvbi4KPj4+PiBPSywgSSB0aGluayBJIHVuZGVyc3Rh
bmQgbm93IHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gZG8gLS0tIHlvdSBhcmUKPj4+PiBlc3NlbnRp
YWxseSB0cnlpbmcgdG8gYWNjb3VudCBmb3IgdGhlIHJhbmdlIGluc2VydGVkIGJ5Cj4+Pj4gc2V0
dXBfbWNmZ19tYXAoKSwgcmlnaHQ/Cj4+Pj4KPj4+IEFjdHVhbGx5LCBwY2lfbW1jZmdfbGF0ZV9p
bml0KCkgdGhhdCdzIGNhbGxlZCBvdXQgb2YgYWNwaV9pbml0KCkgLQo+Pj4gdGhhdCdzIHdoZXJl
IE1DRkcgYXJlYXMgYXJlIHByb3Blcmx5IHNpemVkLiAKPj4gcGNpX21tY2ZnX2xhdGVfaW5pdCgp
IHJlYWRzIHRoZSAoc3RhdGljKSBNQ0ZHLCB3aGljaCBkb2Vzbid0IG5lZWQgRFNEVCBwYXJzaW5n
LCBkb2VzIGl0PyBzZXR1cF9tY2ZnX21hcCgpIE9UT0ggZG9lcyBuZWVkIGl0IGFzIGl0IHVzZXMg
ZGF0YSBmcm9tIF9DQkEgKG9yIGlzIGl0IF9DUlM/KSwgYW5kIEkgdGhpbmsgdGhhdCdzIHdoeSB3
ZSBjYW4ndCBwYXJzZSBNQ0ZHIHByaW9yIHRvIGFjcGlfaW5pdCgpLiBTbyB3aGF0IEkgc2FpZCBh
Ym92ZSBpbmRlZWQgd29uJ3Qgd29yay4KPj4KPiBObywgaXQgdXNlcyBpc19hY3BpX3Jlc2VydmVk
KCkgKGl0J3MgY2FsbGVkIGluZGlyZWN0bHkgc28gbWlnaHQgYmUgd2VsbAo+IGhpZGRlbikgdG8g
cGFyc2UgRFNEVCB0byBmaW5kIGEgcmVzZXJ2ZWQgcmVzb3VyY2UgaW4gaXQgYW5kIHNpemUgTUNG
Rwo+IGFyZWEgYWNjb3JkaW5nbHkuIAoKClJpZ2h0LCBJIHNlZSBpdC4gVGhhbmtzIGZvciB0aGUg
ZXhwbGFuYXRpb24uCgoKPiBzZXR1cF9tY2ZnX21hcCgpIGlzIGNhbGxlZCBmb3IgZXZlcnkgcm9v
dCBidXMKPiBkaXNjb3ZlcmVkIGFuZCBpbmRlZWQgdHJpZXMgdG8gZXZhbHVhdGUgX0NCQSBidXQg
YXQgdGhpcyBwb2ludAo+IHBjaV9tbWNmZ19sYXRlX2luaXQoKSBoYXMgYWxyZWFkeSBmaW5pc2hl
ZCBNQ0ZHIHJlZ2lzdHJhdGlvbiBmb3IgZXZlcnkKPiBjb2xkLXBsdWdnZWQgYnVzICh3aGljaCBp
bmZvcm1hdGlvbiBpcyBkZXNjcmliZWQgaW4gTUNGRyB0YWJsZSkgc28gdGhvc2UKPiBjYWxscyBh
cmUgZHVtbXkuCj4KPj4+IHNldHVwX21jZmdfbWFwKCkgaXMgbW9zdGx5Cj4+PiBmb3IgYnVzIGhv
dHBsdWcgd2hlcmUgTUNGRyBhcmVhIGlzIGRpc2NvdmVyZWQgYnkgZXZhbHVhdGluZyBfQ0JBIG1l
dGhvZDsKPj4+IGZvciBjb2xkLXBsdWdnZWQgYnVzZXMgaXQganVzdCBjb25maXJtcyB0aGF0IE1D
RkcgYXJlYSBpcyBhbHJlYWR5Cj4+PiByZWdpc3RlcmVkIGJlY2F1c2UgaXQgaXMgbWFuZGF0ZWQg
Zm9yIHRoZW0gdG8gYmUgaW4gTUNGRyB0YWJsZSBhdCBib290IHRpbWUuCj4+Pgo+Pj4+IFRoZSBv
dGhlciBxdWVzdGlvbiBJIGhhdmUgaXMgd2h5IHlvdSB0aGluayBpdCdzIHdvcnRoIGtlZXBpbmcK
Pj4+PiB4ZW5fbWNmZ19sYXRlKCkgYXMgYSBsYXRlIGluaXRjYWxsLiBIb3cgY291bGQgTUNGRyBp
bmZvIGJlIHVwZGF0ZWQKPj4+PiBiZXR3ZWVuIGFjcGlfaW5pdCgpIGFuZCBsYXRlX2luaXRjYWxs
cyBiZWluZyBydW4/IEknZCB0aGluayBpdCBjYW4gb25seQo+Pj4+IGhhcHBlbiB3aGVuIGEgbmV3
IGRldmljZSBpcyBob3RwbHVnZ2VkLgo+Pj4+Cj4+PiBJdCB3YXMgYSBwcmVjYXV0aW9uIGFnYWlu
c3Qgc2V0dXBfbWNmZ19tYXAoKSBjYWxscyB0aGF0IG1pZ2h0IGFkZCBuZXcKPj4+IGFyZWFzIHRo
YXQgYXJlIG5vdCBpbiBNQ0ZHIHRhYmxlIGJ1dCBmb3Igc29tZSByZWFzb24gaGF2ZSBfQ0JBIG1l
dGhvZC4KPj4+IEl0J3Mgb2J2aW91c2x5IGEgImZpcm13YXJlIGlzIGJyb2tlbiIgc2NlbmFyaW8g
c28gSSBkb24ndCBoYXZlIHN0cm9uZwo+Pj4gZmVlbGluZ3MgdG8ga2VlcCBpdCBoZXJlLiBXaWxs
IHByZWZlciB0byByZW1vdmUgaW4gdjIgaWYgeW91IHdhbnQuCj4+IElzbid0IHNldHVwX21jZmdf
bWFwKCkgY2FsbGVkIGJlZm9yZSB0aGUgZmlyc3QgeGVuX2FkZF9kZXZpY2UoKSB3aGljaCBpcyB3
aGVyZSB5b3UgYXJlIGNhbGxpbmcgeGVuX21jZmdfbGF0ZSgpPwo+Pgo+IHNldHVwX21jZmdfbWFw
KCkgY2FsbHMgYXJlIGRvbmUgaW4gb3JkZXIgb2Ygcm9vdCBidXMgZGlzY292ZXJ5IHdoaWNoCj4g
aGFwcGVucyAqYWZ0ZXIqIHRoZSBwcmV2aW91cyByb290IGJ1cyBoYXMgYmVlbiBlbnVtZXJhdGVk
LiBTbyB0aGUgb3JkZXIKPiBpczogY2FsbCBzZXR1cF9tY2ZnX21hcCgpIGZvciByb290IGJ1cyAw
LCBmaW5kIHRoYXQKPiBwY2lfbW1jZmdfbGF0ZV9pbml0KCkgaGFzIGZpbmlzaGVkIE1DRkcgYXJl
YSByZWdpc3RyYXRpb24sIHBlcmZvcm0gUENJCj4gZW51bWVyYXRpb24gb2YgYnVzIDAsIGNhbGwg
eGVuX2FkZF9kZXZpY2UoKSBmb3IgZXZlcnkgZGV2aWNlIHRoZXJlLCBjYWxsCj4gc2V0dXBfbWNm
Z19tYXAoKSBmb3Igcm9vdCBidXMgWCwgZXRjLgoKQWgsIHllcy4gTXVsdGlwbGUgYnVzc2VzLgoK
SWYgdGhhdCdzIHRoZSBjYXNlIHRoZW4gd2h5IGRvbid0IHdlIG5lZWQgdG8gY2FsbCB4ZW5fbWNm
Z19sYXRlKCkgZm9yCnRoZSBmaXJzdCBkZXZpY2Ugb24gZWFjaCBidXM/CgotYm9yaXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
