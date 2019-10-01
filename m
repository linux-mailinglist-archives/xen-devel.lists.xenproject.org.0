Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B616CC3ED3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 19:42:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFM5k-0002px-4C; Tue, 01 Oct 2019 17:37:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3N+/=X2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iFM5i-0002ps-UE
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 17:37:38 +0000
X-Inumbo-ID: 28af0a72-e472-11e9-97fb-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by localhost (Halon) with ESMTPS
 id 28af0a72-e472-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 17:37:37 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x91HY0jo097184;
 Tue, 1 Oct 2019 17:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=GRi32tn2XB/AepE2g/iJJPpxb7t/b1ZRobgj4f6uCX4=;
 b=hmOCIkH0m8mf2WDePl4BC+pHlHqCiFZ7ZmtSt648JYzj2lSdJuY0jQTzL3CylcC+r0+I
 GnPcSMd6xvyVe4oeoyNkaOkfnGlb/LJ8n+1aHYAe67PiYeGs9zmx6fLhEqGXt7aUGFno
 aYxRxCxE9W496mR4hZJWiCDYUGJmQ/zjjePZFQ/ajZY7muUHuR82oZ4GR2Y+DbZlZOoC
 d2LLRJQG4cKZO0fkFh6+uPBk9w/be1lttSz7Bz+JlhZ+fi8gIEUnLuoQJSqSRE9l4KI5
 d4mPYPR/55jg+axwMPaRtRK065Aioj9IiYCEZ29TGYgAJfBITDemt1v62FxEO4sPcifM rA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2v9xxuqr1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Oct 2019 17:37:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x91HXhd9182775;
 Tue, 1 Oct 2019 17:37:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2vbqd18d8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Oct 2019 17:37:30 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x91HbREV028665;
 Tue, 1 Oct 2019 17:37:28 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Oct 2019 10:37:27 -0700
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20191001150355.25365-1-jgross@suse.com>
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
Message-ID: <547479f7-bbb3-609c-fcc7-4e2e609823ae@oracle.com>
Date: Tue, 1 Oct 2019 13:37:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20191001150355.25365-1-jgross@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910010144
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910010144
Subject: Re: [Xen-devel] [PATCH] xen/xenbus: fix self-deadlock after killing
 user process
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 James Dingwall <james@dingwall.me.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMS8xOSAxMTowMyBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbiBjYXNlIGEgdXNl
ciBwcm9jZXNzIHVzaW5nIHhlbmJ1cyBoYXMgb3BlbiB0cmFuc2FjdGlvbnMgYW5kIGlzIGtpbGxl
ZAo+IGUuZy4gdmlhIGN0cmwtQyB0aGUgZm9sbG93aW5nIGNsZWFudXAgb2YgdGhlIGFsbG9jYXRl
ZCByZXNvdXJjZXMgbWlnaHQKPiByZXN1bHQgaW4gYSBkZWFkbG9jayBkdWUgdG8gdHJ5aW5nIHRv
IGVuZCBhIHRyYW5zYWN0aW9uIGluIHRoZSB4ZW5idXMKPiB3b3JrZXIgdGhyZWFkOgo+Cj4gWyAy
NTUxLjQ3NDcwNl0gSU5GTzogdGFzayB4ZW5idXM6MzcgYmxvY2tlZCBmb3IgbW9yZSB0aGFuIDEy
MCBzZWNvbmRzLgo+IFsgMjU1MS40OTIyMTVdICAgICAgIFRhaW50ZWQ6IFAgICAgICAgICAgIE9F
ICAgICA1LjAuMC0yOS1nZW5lcmljICM1Cj4gWyAyNTUxLjUxMDI2M10gImVjaG8gMCA+IC9wcm9j
L3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2VjcyIgZGlzYWJsZXMgdGhpcyBtZXNzYWdl
Lgo+IFsgMjU1MS41Mjg1ODVdIHhlbmJ1cyAgICAgICAgICBEICAgIDAgICAgMzcgICAgICAyIDB4
ODAwMDAwODAKPiBbIDI1NTEuNTI4NTkwXSBDYWxsIFRyYWNlOgo+IFsgMjU1MS41Mjg2MDNdICBf
X3NjaGVkdWxlKzB4MmMwLzB4ODcwCj4gWyAyNTUxLjUyODYwNl0gID8gX2NvbmRfcmVzY2hlZCsw
eDE5LzB4NDAKPiBbIDI1NTEuNTI4NjMyXSAgc2NoZWR1bGUrMHgyYy8weDcwCj4gWyAyNTUxLjUy
ODYzN10gIHhzX3RhbGt2KzB4MWVjLzB4MmIwCj4gWyAyNTUxLjUyODY0Ml0gID8gd2FpdF93b2tl
bisweDgwLzB4ODAKPiBbIDI1NTEuNTI4NjQ1XSAgeHNfc2luZ2xlKzB4NTMvMHg4MAo+IFsgMjU1
MS41Mjg2NDhdICB4ZW5idXNfdHJhbnNhY3Rpb25fZW5kKzB4M2IvMHg3MAo+IFsgMjU1MS41Mjg2
NTFdICB4ZW5idXNfZmlsZV9mcmVlKzB4NWEvMHgxNjAKPiBbIDI1NTEuNTI4NjU0XSAgeGVuYnVz
X2Rldl9xdWV1ZV9yZXBseSsweGM0LzB4MjIwCj4gWyAyNTUxLjUyODY1N10gIHhlbmJ1c190aHJl
YWQrMHg3ZGUvMHg4ODAKPiBbIDI1NTEuNTI4NjYwXSAgPyB3YWl0X3dva2VuKzB4ODAvMHg4MAo+
IFsgMjU1MS41Mjg2NjVdICBrdGhyZWFkKzB4MTIxLzB4MTQwCj4gWyAyNTUxLjUyODY2N10gID8g
eGJfcmVhZCsweDFkMC8weDFkMAo+IFsgMjU1MS41Mjg2NzBdICA/IGt0aHJlYWRfcGFyaysweDkw
LzB4OTAKPiBbIDI1NTEuNTI4NjczXSAgcmV0X2Zyb21fZm9yaysweDM1LzB4NDAKPgo+IEZpeCB0
aGlzIGJ5IGRvaW5nIHRoZSBjbGVhbnVwIHZpYSBhIHdvcmtxdWV1ZSBpbnN0ZWFkLgo+Cj4gUmVw
b3J0ZWQtYnk6IEphbWVzIERpbmd3YWxsIDxqYW1lc0BkaW5nd2FsbC5tZS51az4KPiBGaXhlczog
ZmQ4YWE5MDk1YTk1YyAoInhlbjogb3B0aW1pemUgeGVuYnVzIGRyaXZlciBmb3IgbXVsdGlwbGUg
Y29uY3VycmVudCB4ZW5zdG9yZSBhY2Nlc3NlcyIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwu
b3JnPiAjIDQuMTEKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xl
LmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
