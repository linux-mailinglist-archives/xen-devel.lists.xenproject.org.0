Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B905247A10
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 08:30:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcl8N-0002ag-JD; Mon, 17 Jun 2019 06:28:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L/9J=UQ=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hcl8L-0002a4-Rl
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 06:28:49 +0000
X-Inumbo-ID: 2a018810-90c9-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2a018810-90c9-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 06:28:48 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5H6Sksk151126;
 Mon, 17 Jun 2019 06:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=w6Yoz+9IqeNomaLoN+e6oc9dQxJ2P3sRhOKehviO6xI=;
 b=Db/FPfaBlkjGZQqmj2lh5JmB69aSmUZK3gMINtRgEwmzzFC+bPyKofTCIqqENk/kzzc7
 2tv9kCh6CY1LQn0r2iX0s5HN2GXXVcd52vCjbbw28+MoAQgsoHPetYYmpLkX92A2R3Lr
 oOCQXDXsrrzrCOQYW2K0CnFee+xwTp3ZTgsiLvmqAU/0AO7boHIfNsYGhFLdMmzYK3v6
 7ThC/ONBzkZZDvvH43aI41o2ze/FrIsy4PLeT5ZKIY+mtV6tmy8rG2vgv2hx28Z1mcbR
 cMuCRfYuDJ0r+emJITNGmyIt5W+Q+rI4Svc2W1RJwMHDylTo1pW1nGSREDuUngWBNxip gQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2t4r3tckww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 06:28:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5H6SQ3I083288;
 Mon, 17 Jun 2019 06:28:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2t5mgb6brv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 06:28:45 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5H6Shnv008545;
 Mon, 17 Jun 2019 06:28:43 GMT
Received: from [192.168.0.110] (/70.36.60.91)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 16 Jun 2019 23:28:43 -0700
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-8-ankur.a.arora@oracle.com>
 <9f1323f4-06ae-93a5-c9b0-3b84ee549fa6@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <b1bb28b0-1974-6641-f044-bcddfbf0b628@oracle.com>
Date: Sun, 16 Jun 2019 23:28:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9f1323f4-06ae-93a5-c9b0-3b84ee549fa6@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9290
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170060
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9290
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170060
Subject: Re: [Xen-devel] [RFC PATCH 07/16] x86/xen: make vcpu_info part of
 xenhost_t
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wNi0xNCA0OjUzIGEubS4sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDkuMDUu
MTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+PiBBYnN0cmFjdCBvdXQgeGVuX3ZjcHVfaWQg
cHJvYmluZyB2aWEgKCpwcm9iZV92Y3B1X2lkKSgpLiBPbmNlIHRoYXQgaXMKPj4gYXZhaWxhYixl
IHRoZSB2Y3B1X2luZm8gcmVnaXN0cmF0aW9uIGhhcHBlbnMgdmlhIHRoZSBWQ1BVT1AgaHlwZXJj
YWxsLgo+Pgo+PiBOb3RlIHRoYXQgZm9yIHRoZSBuZXN0ZWQgY2FzZSwgdGhlcmUgYXJlIHR3byB2
Y3B1X2lkcywgYW5kIHR3byB2Y3B1X2luZm8KPj4gYXJlYXMsIG9uZSBlYWNoIGZvciB0aGUgZGVm
YXVsdCB4ZW5ob3N0IGFuZCB0aGUgcmVtb3RlIHhlbmhvc3QuCj4+IFRoZSB2Y3B1X2luZm8gaXMg
dXNlZCB2aWEgcHZfaXJxX29wcywgYW5kIGV2dGNobiBzaWduYWxpbmcuCj4+Cj4+IFRoZSBvdGhl
ciBWQ1BVT1AgaHlwZXJjYWxscyBhcmUgdXNlZCBmb3IgbWFuYWdlbWVudCAoYW5kIHNjaGVkdWxp
bmcpCj4+IHdoaWNoIGlzIGV4cGVjdGVkIHRvIGJlIGRvbmUgcHVyZWx5IGluIHRoZSBkZWZhdWx0
IGh5cGVydmlzb3IuCj4+IEhvd2V2ZXIsIHNjaGVkdWxpbmcgb2YgTDEtZ3Vlc3QgZG9lcyBpbXBs
eSBMMC1YZW4tdmNwdV9pbmZvIHN3aXRjaGluZywKPj4gd2hpY2ggbWlnaHQgbWVhbiB0aGF0IHRo
ZSByZW1vdGUgaHlwZXJ2aXNvciBuZWVkcyBzb21lIHZpc2liaWxpdHkKPj4gaW50byByZWxhdGVk
IGV2ZW50cy9oeXBlcmNhbGxzIGluIHRoZSBkZWZhdWx0IGh5cGVydmlzb3IuCj4gCj4gQW5vdGhl
ciBjYW5kaWRhdGUgZm9yIGRyb3BwaW5nIGR1ZSB0byBsYXllcmluZyB2aW9sYXRpb24sIEkgZ3Vl
c3MuClllYWgsIGEgbW9yZSBuYXJyb3dseSB0YWlsb3JlZCBpbnRlcmZhY2UsIHdoZXJlIHBlcmhh
cHMgdGhlIEwxLVhlbgptYXBzIGV2ZW50cyBmb3IgTDAtWGVuIG1ha2VzIHNlbnNlLgpBbHNvLCBq
dXN0IHJlYWxpemVkIHRoYXQgZ2l2ZW4gdGhhdCBMMC1YZW4gaGFzIG5vIGNvbnRyb2wgb3Zlcgpz
Y2hlZHVsaW5nIG9mIEwxLVhlbidzIGd1ZXN0cyAoc29tZSBvZiB3aGljaCBpdCBtaWdodCB3YW50
IHRvCnNlbmQgZXZlbnRzIHRvKSwgaXQgbWFrZXMgc2Vuc2UgZm9yIEwxLVhlbiB0byBoYXZlIHNv
bWUgc3RhdGUKZm9yIGd1ZXN0IGV2dGNobnMgd2hpY2ggcGVydGFpbiB0byBMMC1YZW4uCgoKQW5r
dXIKCj4gCj4gCj4gSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
