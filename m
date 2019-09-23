Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4680BBE7F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 00:33:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCWqA-00066t-1B; Mon, 23 Sep 2019 22:29:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6u+I=XS=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1iCWq9-00066o-5D
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 22:29:53 +0000
X-Inumbo-ID: a7710077-de51-11e9-9609-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by localhost (Halon) with ESMTPS
 id a7710077-de51-11e9-9609-12813bfff9fa;
 Mon, 23 Sep 2019 22:29:50 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8NMTm28128218;
 Mon, 23 Sep 2019 22:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=ahwSuokVPnjlTmWZ6TkYl+3TONAS9ZjD7Eb72jlU070=;
 b=Wos+UDHcXi79g/mFJ/75ffqE6oQi6P1miOE4tMl0IEtDtqtYl6EQ6UzK1oaGdqluEFCi
 9nSWhReayA+/5FMYRTuP8C+2AIFkTCXEJ1pNBJuKiOLR9i19Q/+5zb5oxk+SZ9V3fS6X
 2VNG9j1r4xaJVoRJN2W/1CFAiV9VY9Y+S8O/L946zwvmsu08JJopzR3nD4Q73/u5DiEE
 PxaWTNj+tBrYfYN+wLoQDQOcnDCmBnnt2W+3PUM2jLSPJM+f5wXQ1+8/ZeW3vOQN9EMV
 KqQqq5eKWwchtEholPAUfSy6DnjcXRlltwDKQAJRaCNl77cl3s9O5tAptyyBITFDPAu1 uA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2v5cgqstyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 22:29:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8NMRfV1086317;
 Mon, 23 Sep 2019 22:29:47 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2v6yvnsbmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 22:29:47 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8NMTjYV006735;
 Mon, 23 Sep 2019 22:29:46 GMT
Received: from [10.211.46.60] (/10.211.46.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 23 Sep 2019 15:29:45 -0700
To: Jan Beulich <jbeulich@suse.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <015923df-34c5-95e0-295f-84bd84c25884@suse.com>
 <081dab07-bf85-6477-a710-38f671ec20ba@oracle.com>
 <30e5e335-9c01-ef8c-3437-3d42fb31e8f0@suse.com>
 <8b94f6bb-defe-c8e4-de8a-1404ab209e5e@oracle.com>
 <b4f576d6-b98c-37fd-f5d6-1d79523006ac@suse.com>
 <bae64f76-ac83-1208-fd4f-9e763e3c1caf@oracle.com>
 <e75f5253-df1d-2d47-6724-df06d1a33448@suse.com>
 <8571e4db-d3dc-6a58-8711-2947c97f8953@oracle.com>
 <12a5fc3c-8ded-21f9-3cb6-ea7caa8d585a@suse.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <e19a7889-31a4-42bc-0b88-596e62ab7e8a@oracle.com>
Date: Mon, 23 Sep 2019 15:29:42 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <12a5fc3c-8ded-21f9-3cb6-ea7caa8d585a@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909230189
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909230189
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

T24gOS8yMC8xOSAxOjI4IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxOS4wOS4yMDE5IDIz
OjM4LCBKb2UgSmluIHdyb3RlOgo+PiBPbiA5LzE5LzE5IDM6MjQgQU0sIEphbiBCZXVsaWNoIHdy
b3RlOgo+Pj4gV2hhdCdzCj4+PiBzdGlsbCBtaXNzaW5nIGlzIHRoZSBmdXJ0aGVyIHVwZGF0aW5n
IG9mIHBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQKPj4+IChhcyBleHBsYWluZWQgYmVmb3Jl
LCBzdGlsbCB2aXNpYmxlIGluIGNvbnRleHQgYWJvdmUpLgo+Pj4KPj4KPj4gIDQyMgo+PiAgNDIz
ICAgICAgICAgZGVzdF92Y3B1X2lkID0gaHZtX2dpcnFfZGVzdF8yX3ZjcHVfaWQoZCwgZGVzdCwg
ZGVzdF9tb2RlKTsKPj4gIDQyNCAgICAgICAgIHBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQg
PSBkZXN0X3ZjcHVfaWQ7Cj4+Cj4+IGRlc3RfdmNwdV9pZCB1cGRhdGVkIGxhdGVyIGJ5IGFib3Zl
IGNvZGUsIGRvIEkgbWlzc2VkIHNvbWV0aGluZz8KPiAKPiBUaGlzIHBpZWNlIG9mIGNvZGUKPiAK
PiAgICAgICAgIGlmICggaW9tbXVfaW50cG9zdCApCj4gICAgICAgICB7Cj4gICAgICAgICAgICAg
aWYgKCBkZWxpdmVyeV9tb2RlID09IGRlc3RfTG93ZXN0UHJpbyApCj4gICAgICAgICAgICAgICAg
IHZjcHUgPSB2ZWN0b3JfaGFzaGluZ19kZXN0KGQsIGRlc3QsIGRlc3RfbW9kZSwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGlycV9kcGNpLT5nbXNpLmd2ZWMp
Owo+ICAgICAgICAgICAgIGlmICggdmNwdSApCj4gICAgICAgICAgICAgICAgIHBpcnFfZHBjaS0+
Z21zaS5wb3N0ZWQgPSB0cnVlOwo+ICAgICAgICAgfQo+IAo+IHVwZGF0ZXMgdGhlIHZDUFUgdG8g
YmUgZGVsaXZlcmVkIHRvLiBSaWdodCBub3csIHdoZW4gdGhlICJwb3N0ZWQiCj4gZmxhZyBpcyBz
ZXQsIHRoZSBkZXN0X3ZjcHVfaWQgZmllbGQgaXMgdW51c2VkIChhcyBmYXIgYXMgSSB3YXMKPiBh
YmxlIHRvIHRlbGwpLCBhbmQgaGVuY2UgZGlkbid0IG5lZWQgc2V0dGluZy4gVGhlIHdheSB5b3Ug
aW50ZW5kCj4gdG8gY2hhbmdlIHRoaW5ncywgeW91IHdhbnQgdG8gdXNlIHRoZSBmaWVsZCBhbHNv
IGluIHRoZSAicG9zdGVkIgo+IGNhc2UsIGFuZCBoZW5jZSB5b3UgYWxzbyBzaG91bGQgdXBkYXRl
IGl0IGluIHRoZSBjb2RlIHBhdGggYWJvdmUuCj4gCj4gQnV0IHBsZWFzZSBkb3VibGUgY2hlY2sg
YWxsIG9mIHRoaXMuCgpUaGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uCgpJIGRpZCBub3QgZm91
bmQgYW55IG90aGVyIHBvc3NpYmxlIGNvbmRpdGlvbnMgd2hpY2ggbWF5IGxlYWQgaW52YWxpZApz
ZXR0aW5nLCBzZWVtcyAoIGRlc3RfdmNwdV9pZCA+PTAgJiYgcGlycV9kcGNpLT5nbXNpLnBvc3Rl
ZCApIGlzIGVub3VnaD8KClRoYW5rcywKSm9lCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
