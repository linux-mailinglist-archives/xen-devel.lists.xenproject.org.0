Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 129E8112F53
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:01:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icX4A-0003KS-D3; Wed, 04 Dec 2019 15:59:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SJXd=Z2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1icX48-0003KH-LY
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 15:59:48 +0000
X-Inumbo-ID: 18509cf8-16af-11ea-8206-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18509cf8-16af-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 15:59:47 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB4FxX2N143700;
 Wed, 4 Dec 2019 15:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2019-08-05; bh=VSUEQGQCuMid63mPIKXU5uRFp0HH9JiBVKr5bMQrWdI=;
 b=Z2sV7YQuc475yeUqChe5GGMBhVgaEcUCC+0la30TiM+ubw/3ShCUuJrlybSW5JXHLiT5
 7UEctZI4JJKoCkW2CbZ9b5mv3vTm2s761Wlk18N9c3WkQDhPbCtv/kJoCkJZ5B379HYl
 bYA39L/nOxejm2csbMSgxJJsmsOpQXyqcRbxzG3wQqaM0Mg3QBQ9u9+SCmiU0D7X5aRb
 J5DDRabdSVIqCWW2gX06fOyBfp8mp+IaKUFtqeQGd+Ip3vcsL12d9LZmJrhxC1bebycM
 +Ajbh4YqHJe/sRZ9+7mhiFAiyhwzldqCf7H8wH1FokYxUZHa9tkSS5AtDcNGW9jAJumw hA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2wkgcqf9ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Dec 2019 15:59:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB4FxVwE108822;
 Wed, 4 Dec 2019 15:59:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2wp17e5tua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Dec 2019 15:59:39 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xB4Fx6Bn015564;
 Wed, 4 Dec 2019 15:59:06 GMT
Received: from [10.11.106.46] (/10.11.106.46)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 04 Dec 2019 07:59:06 -0800
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Boris Ostrovsky <BORIS.OSTROVSKY@ORACLE.COM>
In-Reply-To: <6992520f-c191-8282-d0f2-74713cfe0e54@amazon.com>
Date: Wed, 4 Dec 2019 10:59:04 -0500
Message-Id: <14C0E8CA-60F6-4903-8AC5-A7285F283A4E@ORACLE.COM>
References: <20191128093828.8462-1-pdurrant@amazon.com>
 <33cd176f-074f-9c3a-1ba6-7a1b40f604ed@suse.com>
 <b39e656f-47a2-0132-1dd4-e6a3a9c3607a@oracle.com>
 <6992520f-c191-8282-d0f2-74713cfe0e54@amazon.com>
To: Julien Grall <jgrall@amazon.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9461
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912040133
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9461
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912040133
Subject: Re: [Xen-devel] [PATCH v3] xen/x86: vpmu: Unmap per-vCPU PMU page
 when the domain is destroyed
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIERlYyA0LCAyMDE5LCBhdCAxMDo1NSBBTSwgSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1h
em9uLmNvbT4gd3JvdGU6Cj4gCj4gSGkgQm9yaXMsCj4gCj4gT24gMjgvMTEvMjAxOSAyMTo1MCwg
Qm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAxMS8yOC8xOSA1OjIzIEFNLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDI4LjExLjIwMTkgMTA6MzgsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+
IAo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jCj4+Pj4gKysrIGIveGVuL2FyY2gv
eDg2L2NwdS92cG11LmMKPj4+PiBAQCAtNTc2LDExICs1NzYsMzYgQEAgc3RhdGljIHZvaWQgdnBt
dV9hcmNoX2Rlc3Ryb3koc3RydWN0IHZjcHUgKnYpCj4+Pj4gICAgICAgICAgICAgdnBtdS0+YXJj
aF92cG11X29wcy0+YXJjaF92cG11X2Rlc3Ryb3kodik7Cj4+Pj4gICAgICB9Cj4+Pj4gKwo+Pj4+
ICsgICAgdnBtdV9yZXNldCh2cG11LCBWUE1VX0NPTlRFWFRfQUxMT0NBVEVEKTsKPj4+PiAgfQo+
Pj4gQm9yaXMsIHRvIGJlIG9uIHRoZSBzYWZlIHNpZGUgLSBhcmUgeW91IGluIGFncmVlbWVudCB3
aXRoIHRoaXMKPj4+IGNoYW5nZSwgbm93IHRoYXQgdGhlIHNldHRpbmcgb2YgdGhlIGZsYWcgaXMg
YmVpbmcgbGVmdCB1bnRvdWNoZWQ/Cj4+IFllcywgdGhpcyBpcyBmaW5lLgo+IAo+IENhbiB3ZSB0
YWtlIHRoaXMgYXMgYW4gQUNLPwoKClllcywgb2YgY291cnNlLgoKCi1ib3JpcwoKCj4gCj4+IChJ
IHByb2JhYmx5IHdvdWxkIGNsZWFyIGl0IGluIGFyY2hfdnBtdV9kZXN0cm95IG9wIHNpbmNlIGl0
IGlzIHNldCBpbgo+PiBhcmNoLXNwZWNpZmljIGNvZGUgYnV0IGVpdGhlciB3YXkgd29ya3MpCj4+
IC1ib3Jpcwo+IAo+IENoZWVycywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
