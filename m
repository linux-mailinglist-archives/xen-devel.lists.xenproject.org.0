Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D251031B4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 03:42:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXFu6-00063M-Fe; Wed, 20 Nov 2019 02:39:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9J19=ZM=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iXFu5-00063H-Bx
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 02:39:37 +0000
X-Inumbo-ID: fdc05a66-0b3e-11ea-9631-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdc05a66-0b3e-11ea-9631-bc764e2007e4;
 Wed, 20 Nov 2019 02:39:36 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAK2d8TZ007296;
 Wed, 20 Nov 2019 02:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=vkxAajpmJKWNvP2J+E8iawWh4/OVA4qkQqxYXhvuqY4=;
 b=cUnDAuRnVyMZ+x1R4JRvdTWs84La8b6mokop73uH9kB9KH+Kt/1OXxOuIcAGNVhHgDTf
 9EolK/RZdRgwWAgW1ULwei9drZEhA71trcz092RuuMtbmImAUnz/dOJI+8WKDUImLn9n
 pGTfU2kJCPSu7yxY0dBxKOSW7yB+1iCyy5se7dyY14zcJ/INKpf1f+oazkl0XqjI+x+i
 wOXKmhnnCX3/xW/O07s4VXDqWMjINqxJo81HCGOUtNEaCqgWIA2fN8jeHq//QEQ98LgV
 bsN6t4D0yJTZ9zAusXm7rENRMZNocZq8g65/TP9XHhzEm8hwKU6Qf4FrYGujok7ILOZn Sw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2wa8httspq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 02:39:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAK2X4jH148405;
 Wed, 20 Nov 2019 02:39:33 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2wbxm5a554-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 02:39:33 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAK2dWfT021200;
 Wed, 20 Nov 2019 02:39:32 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 19 Nov 2019 18:39:32 -0800
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <d66b1da4-8096-9b77-1ca6-d6b9954b113c@suse.com>
 <09359c00-5769-0e0d-4af9-963897d3b498@suse.com>
 <40267a5b-8f1b-6463-72cd-f8f354c58bc4@oracle.com>
 <6d70b8e0-7acd-d8ea-fa41-6866ae1ffef9@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <b308b5ab-7b25-414a-6153-8c4f70b1c6a1@oracle.com>
Date: Tue, 19 Nov 2019 21:39:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <6d70b8e0-7acd-d8ea-fa41-6866ae1ffef9@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9446
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911200022
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9446
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911200023
Subject: Re: [Xen-devel] Ping: [PATCH 0/2] x86/Xen/32: xen_iret_crit_fixup
 adjustments
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTkvMTkgOToxNyBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDExLzE5LzE5
IDEyOjUwIFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDExLzE5LzE5IDc6NTggQU0s
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTEuMTEuMjAxOSAxNTozMCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+Pj4gVGhlIGZpcnN0IHBhdGNoIGhlcmUgZml4ZXMgYW5vdGhlciByZWdyZXNzaW9u
IGZyb20gM2M4OGM2OTJjMjg3Cj4+Pj4gKCJ4ODYvc3RhY2tmcmFtZS8zMjogUHJvdmlkZSBjb25z
aXN0ZW50IHB0X3JlZ3MiKSwgYmVzaWRlcyB0aGUKPj4+PiBvbmUgYWxyZWFkeSBhZGRyZXNzZWQg
YnkKPj4+PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRl
dmVsLzIwMTktMTAvbXNnMDE5ODguaHRtbC4KPj4+PiBUaGUgc2Vjb25kIHBhdGNoIGlzIGEgbWlu
aW1hbCBiaXQgb2YgY2xlYW51cCBvbiB0b3AuCj4+Pj4KPj4+PiAxOiBtYWtlIHhlbl9pcmV0X2Ny
aXRfZml4dXAgaW5kZXBlbmRlbnQgb2YgZnJhbWUgbGF5b3V0Cj4+Pj4gMjogc2ltcGxpZnkgeGVu
X2lyZXRfY3JpdF9maXh1cCdzIHJpbmcgY2hlY2sKPj4+IFNlZWluZyB0aGF0IHRoZSBvdGhlciBy
ZWdyZXNzaW9uIGZpeCBoYXMgYmVlbiB0YWtlbiBpbnRvIC10aXAsCj4+PiB3aGF0IGlzIHRoZSBz
aXR1YXRpb24gaGVyZT8gU2hvdWxkIDUuNCByZWFsbHkgc2hpcCB3aXRoIHRoaXMKPj4+IHN0aWxs
IHVuZml4ZWQ/Cj4+IEkgYW0gc3RpbGwgdW5hYmxlIHRvIGJvb3QgYSAzMi1iaXQgZ3Vlc3Qgd2l0
aCB0aG9zZSBwYXRjaGVzLCBjcmFzaGluZyBpbgo+PiBpbnQzX2V4Y2VwdGlvbl9ub3RpZnkgd2l0
aCByZWdzLT5zcCB6ZXJvLgo+Pgo+PiBXaGVuIEkgcmV2ZXJ0IHRvIDNjODhjNjkyYzI4NyB0aGUg
Z3Vlc3QgYWN0dWFsbHkgYm9vdHMgc28gbXkgKD8pIHByb2JsZW0KPj4gd2FzIGludHJvZHVjZWQg
c29tZXdoZXJlIGluLWJldHdlZW4uCj4gTmV2ZXJtaW5kIHRoaXMuIEkgZGlkbid0IHJlYWQgeW91
ciBwYXRjaGVzIGNvcnJlY3RseS4KCkJUVywgSSdkIHJhdGhlciB0aGlzIG5vdCBnbyBpbnRvIDUu
NCB0aGlzIGxhdGUuIDNjODhjNjkyYzI4NyBoYXMgYmVlbgp0aGVyZSBzaW5jZSA1LjIgYW5kIG5v
b25lIGNvbXBsYWluZWQuCgotYm9yaXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
