Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC04177E7E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 19:35:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9CLg-0005xt-R9; Tue, 03 Mar 2020 18:32:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wYci=4U=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j9CLg-0005xn-0i
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 18:32:56 +0000
X-Inumbo-ID: 65dab8b8-5d7d-11ea-8efe-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65dab8b8-5d7d-11ea-8efe-bc764e2007e4;
 Tue, 03 Mar 2020 18:32:55 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id y3so5592835edj.13
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2020 10:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qfpDezwww7L9uf7TmZz7wLuYrk5SzVsB7AreqfK31e0=;
 b=tSyQFY631j5AjdNR3wVo6q06VrdQQf5Rzy/gA/3W+iwfgweuWsabuiO1YLkxwK3Mm7
 Q9wV/bDyKlauGZpizahbYAjDdVMhhM1nYfJdv9Np9AxcTo2FhCpQNCDmGkq9AV31WW4s
 Yo5sy4UdhaFZIzevaGG1Nuu22BwEBkIa/w/8Ax4dQUC5EKmoPF9pifNk0eVit2pwOEbo
 LebryoCYotYj7dm/feKKx6lEHfnN/sqn2xTm8nPM22iZcqN82o65AHUoGLQR3ollWhy6
 LXMgAi76WqB+gxrih1xTWleKal+SfamSFnsY0ucXV1/eHH8Bp1wnhjgRykMOVelgQxwA
 X1ZA==
X-Gm-Message-State: ANhLgQ07w5iN/xd2AmcZL86sUyeJU8n5Jy75ZMlPnDSy1O8cIRSlbY+3
 LqZHZuitE7dRZxImfpLoUCU=
X-Google-Smtp-Source: ADFU+vsYE5JInFpii/M+MXghNvc7wL/LQA9d9qMeUUb4B8TPDdzCE1J5GB0XGnj6f8ettrGQXBMEhQ==
X-Received: by 2002:a05:6402:30ba:: with SMTP id
 df26mr5335252edb.382.1583260374576; 
 Tue, 03 Mar 2020 10:32:54 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id j9sm755033ejb.36.2020.03.03.10.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 10:32:53 -0800 (PST)
To: dongli.zhang@oracle.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20200303015859.18813-1-dongli.zhang@oracle.com>
 <2f175c30-b6b9-5f21-6cf3-2ee89e0c475e@xen.org>
 <4d2428a4-01f7-cf23-82e1-6a9bec2c6d19@oracle.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d6c8b2aa-bc3a-3901-9b04-fd9d6d26b353@xen.org>
Date: Tue, 3 Mar 2020 18:32:52 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4d2428a4-01f7-cf23-82e1-6a9bec2c6d19@oracle.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] xenbus: req->body should be updated
 before req->state
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
Cc: jgross@suse.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joe.jin@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8wMy8yMDIwIDE3OjM2LCBkb25nbGkuemhhbmdAb3JhY2xlLmNvbSB3cm90ZToK
PiAKPiAKPiBPbiAzLzMvMjAgMTo0MCBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4K
Pj4gT24gMDMvMDMvMjAyMCAwMTo1OCwgRG9uZ2xpIFpoYW5nIHdyb3RlOgo+Pj4gVGhlIHJlcS0+
Ym9keSBzaG91bGQgYmUgdXBkYXRlZCBiZWZvcmUgcmVxLT5zdGF0ZSBpcyB1cGRhdGVkIGFuZCB0
aGUKPj4+IG9yZGVyIHNob3VsZCBiZSBndWFyYW50ZWVkIGJ5IGEgYmFycmllci4KPj4+Cj4+PiBP
dGhlcndpc2UsIHJlYWRfcmVwbHkoKSBtaWdodCByZXR1cm4gcmVxLT5ib2R5ID0gTlVMTC4KPj4+
Cj4+PiBCZWxvdyBpcyBzYW1wbGUgY2FsbHN0YWNrIHdoZW4gdGhlIGlzc3VlIGlzIHJlcHJvZHVj
ZWQgb24gcHVycG9zZSBieQo+Pj4gcmVvcmRlcmluZyB0aGUgdXBkYXRlcyBvZiByZXEtPmJvZHkg
YW5kIHJlcS0+c3RhdGUgYW5kIGFkZGluZyBkZWxheSBpbgo+Pj4gY29kZSBiZXR3ZWVuIHVwZGF0
ZXMgb2YgcmVxLT5zdGF0ZSBhbmQgcmVxLT5ib2R5Lgo+Pj4KPj4+IFvCoMKgIDIyLjM1NjEwNV0g
Z2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0OiAwMDAwIFsjMV0gU01QIFBUSQo+Pj4gW8KgwqAgMjIu
MzYxMTg1XSBDUFU6IDIgUElEOiA1MiBDb21tOiB4ZW53YXRjaCBOb3QgdGFpbnRlZCA1LjUuMHhl
bisgIzYKPj4+IFvCoMKgIDIyLjM2NjcyN10gSGFyZHdhcmUgbmFtZTogWGVuIEhWTSBkb21VLCBC
SU9TIC4uLgo+Pj4gW8KgwqAgMjIuMzcyMjQ1XSBSSVA6IDAwMTA6X3BhcnNlX2ludGVnZXJfZml4
dXBfcmFkaXgrMHg2LzB4NjAKPj4+IC4uLiAuLi4KPj4+IFvCoMKgIDIyLjM5MjE2M10gUlNQOiAw
MDE4OmZmZmZiMmQ2NDAyM2ZkZjAgRUZMQUdTOiAwMDAxMDI0Ngo+Pj4gW8KgwqAgMjIuMzk1OTMz
XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiA3NTc0NmU3NTYyNzU1ZjZkIFJDWDogMDAwMDAw
MDAwMDAwMDAwMAo+Pj4gW8KgwqAgMjIuNDAwODcxXSBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJ
OiBmZmZmYjJkNjQwMjNmZGZjIFJESTogNzU3NDZlNzU2Mjc1NWY2ZAo+Pj4gW8KgwqAgMjIuNDA1
ODc0XSBSQlA6IDAwMDAwMDAwMDAwMDAwMDAgUjA4OiAwMDAwMDAwMDAwMDAwMWU4IFIwOTogMDAw
MDAwMDAwMGNkY2RjZAo+Pj4gW8KgwqAgMjIuNDEwOTQ1XSBSMTA6IGZmZmZiMmQ2NDAyZmZlMDAg
UjExOiBmZmZmOWQ5NTM5NWVhZWIwIFIxMjogZmZmZjlkOTUzNTkzNTAwMAo+Pj4gW8KgwqAgMjIu
NDE3NjEzXSBSMTM6IGZmZmY5ZDk1MjZkNGEwMDAgUjE0OiBmZmZmOWQ5NTI2ZjRmMzQwIFIxNTog
ZmZmZjlkOTUzNzY1NDAwMAo+Pj4gW8KgwqAgMjIuNDIzNzI2XSBGUzrCoCAwMDAwMDAwMDAwMDAw
MDAwKDAwMDApIEdTOmZmZmY5ZDk1M2JjODAwMDAoMDAwMCkKPj4+IGtubEdTOjAwMDAwMDAwMDAw
MDAwMDAKPj4+IFvCoMKgIDIyLjQyOTg5OF0gQ1M6wqAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBD
UjA6IDAwMDAwMDAwODAwNTAwMzMKPj4+IFvCoMKgIDIyLjQzNDM0Ml0gQ1IyOiAwMDAwMDBjNDIw
NmE5MDAwIENSMzogMDAwMDAwMDFlYTNmYzAwMiBDUjQ6IDAwMDAwMDAwMDAxNjA2ZTAKPj4+IFvC
oMKgIDIyLjQzOTY0NV0gRFIwOiAwMDAwMDAwMDAwMDAwMDAwIERSMTogMDAwMDAwMDAwMDAwMDAw
MCBEUjI6IDAwMDAwMDAwMDAwMDAwMDAKPj4+IFvCoMKgIDIyLjQ0NDk0MV0gRFIzOiAwMDAwMDAw
MDAwMDAwMDAwIERSNjogMDAwMDAwMDBmZmZlMGZmMCBEUjc6IDAwMDAwMDAwMDAwMDA0MDAKPj4+
IFvCoMKgIDIyLjQ1MDM0Ml0gQ2FsbCBUcmFjZToKPj4+IFvCoMKgIDIyLjQ1MjUwOV3CoCBzaW1w
bGVfc3RydG91bGwrMHgyNy8weDcwCj4+PiBbwqDCoCAyMi40NTU1NzJdwqAgeGVuYnVzX3RyYW5z
YWN0aW9uX3N0YXJ0KzB4MzEvMHg1MAo+Pj4gW8KgwqAgMjIuNDU5MTA0XcKgIG5ldGJhY2tfY2hh
bmdlZCsweDc2Yy8weGNjMSBbeGVuX25ldGZyb250XQo+Pj4gW8KgwqAgMjIuNDYzMjc5XcKgID8g
ZmluZF93YXRjaCsweDQwLzB4NDAKPj4+IFvCoMKgIDIyLjQ2NjE1Nl3CoCB4ZW53YXRjaF90aHJl
YWQrMHhiNC8weDE1MAo+Pj4gW8KgwqAgMjIuNDY5MzA5XcKgID8gd2FpdF93b2tlbisweDgwLzB4
ODAKPj4+IFvCoMKgIDIyLjQ3MjE5OF3CoCBrdGhyZWFkKzB4MTBlLzB4MTMwCj4+PiBbwqDCoCAy
Mi40NzQ5MjVdwqAgPyBrdGhyZWFkX3BhcmsrMHg4MC8weDgwCj4+PiBbwqDCoCAyMi40Nzc5NDZd
wqAgcmV0X2Zyb21fZm9yaysweDM1LzB4NDAKPj4+IFvCoMKgIDIyLjQ4MDk2OF0gTW9kdWxlcyBs
aW5rZWQgaW46IHhlbl9rYmRmcm9udCB4ZW5fZmJmcm9udCgrKSB4ZW5fbmV0ZnJvbnQKPj4+IHhl
bl9ibGtmcm9udAo+Pj4gW8KgwqAgMjIuNDg2NzgzXSAtLS1bIGVuZCB0cmFjZSBhOTIyMjAzMGE3
NDdjM2Y3IF0tLS0KPj4+IFvCoMKgIDIyLjQ5MDQyNF0gUklQOiAwMDEwOl9wYXJzZV9pbnRlZ2Vy
X2ZpeHVwX3JhZGl4KzB4Ni8weDYwCj4+Pgo+Pj4gVGhlICJ3aGlsZSIgaXMgY2hhbmdlZCB0byAi
ZG8gd2hpbGUiIHNvIHRoYXQgd2FpdF9ldmVudCgpIGlzIHVzZWQgYXMgYQo+Pj4gYmFycmllci4K
Pj4KPj4gVGhlIGNvcnJlY3QgYmFycmllciBmb3IgcmVhZF9yZXBseSgpIHNob3VsZCBiZSB2aXJ0
X3JtYigpLiBXaGlsZSBvbiB4ODYsIHRoaXMgaXMKPj4gZXF1aXZhbGVudCB0byBiYXJyaWVyKCks
IG9uIEFybSB0aGlzIHdpbGwgYmUgYSBkbWIoaXNoKSB0byBwcmV2ZW50IHRoZSBwcm9jZXNzb3IK
Pj4gcmUtb3JkZXJpbmcgbWVtb3J5IGFjY2Vzcy4KPj4KPj4gVGhlcmVmb3JlIHRoZSBiYXJyaWVy
IGluIHRlc3RfcmVwbHkoKSAoY2FsbGVkIGJ5IHdhaXRfZXZlbnQoKSkgaXMgbm90IGdvaW5nIHRv
Cj4+IGJlIHN1ZmZpY2llbnQgZm9yIEFybS4KPiAKPiBTb3JyeSB0aGF0IEkganVzdCBlcnJvbmVv
dXNseSB0aG91Z2h0IHdhaXRfZXZlbnQoKSB3b3VsZCBiZSB1c2VkIGFzIHJlYWQgYmFycmllci4K
Ckkgd2FzIGFsc28ga2luZCBvZiBleHBlY3Rpbmcgd2FpdF9ldmVudCgpIHRvIGNvbnRhaW4gYSBt
ZW1vcnkgYmFycmllci4gCkJ1dCBpdCBkb2VzIG5vdCBhdCBsZWFzdCBpZiBjb25kaXRpb24gaXMg
dmFsaWQgYmVmb3JlIHdhaXRpbmcuCgpDaGVlcnMsCgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
