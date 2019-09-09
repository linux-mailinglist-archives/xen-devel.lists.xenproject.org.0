Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F02DADF55
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 21:23:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7PCs-0001Hr-Td; Mon, 09 Sep 2019 19:20:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BAEK=XE=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1i7PCr-0001Hm-Gl
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 19:20:09 +0000
X-Inumbo-ID: d43c7464-d336-11e9-ac15-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d43c7464-d336-11e9-ac15-12813bfff9fa;
 Mon, 09 Sep 2019 19:20:07 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x89JE3sG155213;
 Mon, 9 Sep 2019 19:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=AcDjSHBDWwOtcp3x3N7e8mGZD/OTVsDCuVRfV66ErGQ=;
 b=DpRBrAcCilLpjs4HrrgpDgnFOuX+NsemburBaLrA0/j9eoseULxbL41H9jrMe9XtfRiw
 i2SVYFrwheiFM2SBepWzA+awOCQEzNAlSjVA9x5e+nk4FBHU1blf3oZXIIFHoa1mTiYQ
 HkQ4Zd9GWtPiIqN0N/nWJjH8J/YbT+vHqIlpT3XwTt2daRQ4nQnlKDR5kjUO14ICVMxg
 MS914nKU3QUfnOhqWM+4Mivry3pZ5GZtYE0iWyylLYDXsMJOduIzKER1pZT+qqH6KbRM
 wvj/+ZzItTIHANXLBkpkTUlLcbIVK7H5OjFT2PdqMWwE75xwGf0Yirkpqh00hpzMoEH9 XQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2uw1jxxhv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Sep 2019 19:20:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x89JIw6G110779;
 Mon, 9 Sep 2019 19:20:03 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2uwpjux706-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Sep 2019 19:20:03 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x89JK15x029447;
 Mon, 9 Sep 2019 19:20:01 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Sep 2019 12:20:01 -0700
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
 <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
 <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
 <4d3bf854-51de-99e4-9a40-a64c581bdd10@citrix.com>
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
Message-ID: <bc3da154-d451-02cf-6154-5e0dc721a6e6@oracle.com>
Date: Mon, 9 Sep 2019 15:19:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4d3bf854-51de-99e4-9a40-a64c581bdd10@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909090194
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909090194
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

T24gOS84LzE5IDc6MzcgUE0sIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IE9uIDA5LzA5LzIwMTkg
MDA6MzAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gOS84LzE5IDU6MTEgUE0sIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gT24gMDgvMDkvMjAxOSAxOToyOCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+Pj4+IE9uIDkvNi8xOSA3OjAwIFBNLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4+
Pj4gT24gMDYvMDkvMjAxOSAyMzozMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4+Pj4gV2hl
cmUgaXMgTUNGRyBwYXJzZWQ/IHBjaV9hcmNoX2luaXQoKT8KPj4+Pj4+PiBJdCBoYXBwZW5zIHR3
aWNlOgo+Pj4+PiAxKSBmaXJzdCB0aW1lIGVhcmx5IG9uZSBpbiBwY2lfYXJjaF9pbml0KCkgdGhh
dCBpcyBhcmNoX2luaXRjYWxsIC0gdGhhdAo+Pj4+PiB0aW1lIHBjaV9tbWNmZ19saXN0IHdpbGwg
YmUgZnJlZWQgaW1tZWRpYXRlbHkgdGhlcmUgYmVjYXVzZSBNQ0ZHIGFyZWEgaXMKPj4+Pj4gbm90
IHJlc2VydmVkIGluIEU4MjA7Cj4+Pj4+IDIpIHNlY29uZCB0aW1lIGxhdGUgb25lIGluIGFjcGlf
aW5pdCgpIHdoaWNoIGlzIHN1YnN5c3RlbV9pbml0Y2FsbCByaWdodAo+Pj4+PiBiZWZvcmUgd2hl
cmUgUENJIGVudW1lcmF0aW9uIHN0YXJ0cyAtIHRoaXMgdGltZSBBQ1BJIHRhYmxlcyB3aWxsIGJl
Cj4+Pj4+IGNoZWNrZWQgZm9yIGEgcmVzZXJ2ZWQgcmVzb3VyY2UgYW5kIHBjaV9tbWNmZ19saXN0
IHdpbGwgYmUgZmluYWxseQo+Pj4+PiBwb3B1bGF0ZWQuCj4+Pj4+Cj4+Pj4+IFRoZSBwcm9ibGVt
IGlzIHRoYXQgb24gYSBzeXN0ZW0gdGhhdCBkb2Vzbid0IGhhdmUgTUNGRyBhcmVhIHJlc2VydmVk
IGluCj4+Pj4+IEU4MjAgcGNpX21tY2ZnX2xpc3QgaXMgZW1wdHkgYmVmb3JlIGFjcGlfaW5pdCgp
IGFuZCBvdXIgUENJIGhvb2tzIGFyZQo+Pj4+PiBjYWxsZWQgaW4gdGhlIHNhbWUgcGxhY2UuIFNv
IE1DRkcgaXMgc3RpbGwgbm90IGluIHVzZSBieSBYZW4gYXQgdGhpcwo+Pj4+PiBwb2ludCBzaW5j
ZSB3ZSBoYXZlbid0IHJlYWNoZWQgb3VyIHhlbl9tY2ZnX2xhdGUoKS4KPj4+PiBXb3VsZCBpdCBi
ZSBwb3NzaWJsZSBmb3IgdXMgdG8gcGFyc2UgTUNGRyBvdXJzZWx2ZXMgaW4gcGNpX3hlbl9pbml0
KCk/IEkKPj4+PiByZWFsaXplIHRoYXQgd2UnZCBiZSBkb2luZyB0aGlzIHR3aWNlIChvciBtYXli
ZSBldmVuIHRocmVlIHRpbWVzIHNpbmNlCj4+Pj4gYXBwYXJlbnRseSBib3RoIHBjaV9hcmNoX2lu
aXQoKcKgIGFuZCBhY3BpX2luaSgpIGRvIGl0KS4KPj4+Pgo+Pj4gSSBkb24ndCB0aGluZSBpdCBt
YWtlcyBzZW5zZToKPj4+IGEpIGl0IG5lZWRzIHRvIGJlIGRvbmUgYWZ0ZXIgQUNQSSBpcyBpbml0
aWFsaXplZCBzaW5jZSB3ZSBuZWVkIHRvIHBhcnNlCj4+PiBpdCB0byBmaWd1cmUgb3V0IHRoZSBl
eGFjdCByZXNlcnZlZCByZWdpb24gLSB0aGF0J3Mgd2h5IGl0J3MgY3VycmVudGx5Cj4+PiBkb25l
IGluIGFjcGlfaW5pdCgpIChzZWUgY29tbWl0IG1lc3NhZ2UgZm9yIHRoZSByZWFzb25zIHdoeSkK
Pj4gSG1tLi4uIFdlIHNob3VsZCBiZSBhYmxlIHRvIHBhcnNlIEFDUEkgdGFibGVzIGJ5IHRoZSB0
aW1lCj4+IHBjaV9hcmNoX2luaXQoKSBpcyBjYWxsZWQuIEluIGZhY3QsIGlmIHlvdSBsb29rIGF0
Cj4+IHBjaV9tbWNmZ19lYXJseV9pbml0KCkgeW91IHdpbGwgc2VlIHRoYXQgaXQgZG9lcyBqdXN0
IHRoYXQuCj4+Cj4gVGhlIHBvaW50IGlzIG5vdCB0byBwYXJzZSBNQ0ZHIGFmdGVyIGFjcGlfaW5p
dCBidXQgdG8gcGFyc2UgRFNEVCBmb3IKPiByZXNlcnZlZCByZXNvdXJjZSB3aGljaCBjb3VsZCBi
ZSBkb25lIG9ubHkgYWZ0ZXIgQUNQSSBpbml0aWFsaXphdGlvbi4KCk9LLCBJIHRoaW5rIEkgdW5k
ZXJzdGFuZCBub3cgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBkbyAtLS0geW91IGFyZQplc3NlbnRp
YWxseSB0cnlpbmcgdG8gYWNjb3VudCBmb3IgdGhlIHJhbmdlIGluc2VydGVkIGJ5CnNldHVwX21j
ZmdfbWFwKCksIHJpZ2h0PwoKVGhlIG90aGVyIHF1ZXN0aW9uIEkgaGF2ZSBpcyB3aHkgeW91IHRo
aW5rIGl0J3Mgd29ydGgga2VlcGluZwp4ZW5fbWNmZ19sYXRlKCkgYXMgYSBsYXRlIGluaXRjYWxs
LiBIb3cgY291bGQgTUNGRyBpbmZvIGJlIHVwZGF0ZWQKYmV0d2VlbiBhY3BpX2luaXQoKSBhbmQg
bGF0ZV9pbml0Y2FsbHMgYmVpbmcgcnVuPyBJJ2QgdGhpbmsgaXQgY2FuIG9ubHkKaGFwcGVuIHdo
ZW4gYSBuZXcgZGV2aWNlIGlzIGhvdHBsdWdnZWQuCgotYm9yaXMKCj4KPj4+IGIpIGdpdmVuIChh
KSB3ZSBjYW5ub3QgZG8gaXQgb3Vyc2VsdmVzIGJlZm9yZSBhY3BpX2luaXQgYW5kIGFmdGVyIGlz
IHRvbwo+Pj4gbGF0ZSBhcyB3ZSdyZSBhbHJlYWR5IHBhc3QgQUNQSSBQQ0kgZW51bWVyYXRpb24K
Pj4+IGMpIHdlJ2QgaGF2ZSB0byBkbyBpdCBpbiB0aGUgc2FtZSBwbGFjZSBJIGNhbGwgeGVuX21j
ZmdfbGF0ZSgpIGFuZCBpdCdkCj4+PiBiZSBjb2RlIGR1cGxpY2F0aW9uIG9mIHdoYXQncyBhbHJl
YWR5IGRvbmUgYnkgdGhlIGV4aXN0aW5nIGNvZGUuCj4+Cj4+IElmIHdlIG1hbmFnZSB0byBwYXJz
ZSBNQ0ZHIG91cnNlbHZlcyBlYXJseSB0aGVuIG1heWJlIHdlIHdvbid0IG5vdCBuZWVkCj4+IHhl
bl9tY2ZnX2xhdGUoKT8gV2UgY2FuIGNhbGwgUEhZU0RFVk9QX3BjaV9tbWNmZ19yZXNlcnZlZCBy
aWdodCBhd2F5Lgo+IEFnYWluLCB0aGlzIGNhbm5vdCBiZSBkb25lIHVudGlsZSBhY3BpX2luaXQg
ZmluaXNoZXMgYmFzaWMgc2V0dXAgdG8KPiBwYXJzZSBEU0RULgo+Cj4gSWdvcgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
