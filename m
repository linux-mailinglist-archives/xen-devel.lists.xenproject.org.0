Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E0B2469
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 18:53:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8omP-0001nW-2Y; Fri, 13 Sep 2019 16:50:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OkM0=XI=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1i8omN-0001nR-Im
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 16:50:39 +0000
X-Inumbo-ID: 9d3d859c-d646-11e9-95b6-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d3d859c-d646-11e9-95b6-12813bfff9fa;
 Fri, 13 Sep 2019 16:50:38 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8DGmTx4090393;
 Fri, 13 Sep 2019 16:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=Oso5kJTt6ULQk8EGi29snFw65H9UZuHgtP+WiUj0lRg=;
 b=iRSYdtDXfKlHPJOIRHo4miILCnwo+yu+Bi4R0cpp5+edH8ru3+96659NBTP5yMaTC/St
 GeoQ43iGe/2y33dcZmFe9fxLQimro1TSPfyTAvVuof6AV7D33fTzlj1jnkP1iZRBIsf6
 1iqNRM2+W+DEg5f/FimSlna14+e3lauG76miX56i5H1pGcO/L7YY5BBJubGWRbmN8MRV
 tI3mR/dYPoKT6XS3JM0baDyz7+iG12OgMiXPqRwDd9MlrHKWUsgMSEhA5hISqa9W1K9N
 dR4nRpqRR3+wH7LQlYGwYMlUZyUm2CD2AyuUeLQF7Ma3BNLFb+WpNiBY0JeHiTNlLLoE zQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2uytd35yw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 16:50:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8DGm2Wf132933;
 Fri, 13 Sep 2019 16:50:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2uytdn0d5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 16:50:36 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8DGoZwu020221;
 Fri, 13 Sep 2019 16:50:35 GMT
Received: from [10.211.46.60] (/10.211.46.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 13 Sep 2019 09:50:35 -0700
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <20190913103335.ijzx6tuy4iwb5dt5@Air-de-Roger>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <89c9c9b5-a99f-bfdb-c42c-df64e308a98e@oracle.com>
Date: Fri, 13 Sep 2019 09:50:34 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913103335.ijzx6tuy4iwb5dt5@Air-de-Roger>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9379
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=900
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909130170
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9379
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=968 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909130170
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
 Joao Martins <joao.m.martins@oracle.com>, Jan Beulich <jbeulich@suse.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xMy8xOSAzOjMzIEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFRodSwgU2Vw
IDEyLCAyMDE5IGF0IDExOjAzOjE0QU0gLTA3MDAsIEpvZSBKaW4gd3JvdGU6Cj4+IFdpdGggYmVs
b3cgdGVzdGNhc2UsIGd1ZXN0IGtlcm5lbCByZXBvcnRlZCAiTm8gaXJxIGhhbmRsZXIgZm9yIHZl
Y3RvciI6Cj4+ICAgMSkuIFBhc3N0aHJvdWdoIG1seCBpYiBWRiB0byAyIHB2aHZtIGd1ZXN0cy4K
Pj4gICAyKS4gU3RhcnQgcmRzLXN0cmVzcyBiZXR3ZWVuIDIgZ3Vlc3RzLgo+PiAgIDMpLiBTY2Fs
ZSBkb3duIDIgZ3Vlc3RzIHZjcHUgZnJvbSAzMiB0byA2IGF0IHRoZSBzYW1lIHRpbWUuCj4+Cj4+
IFJlcGVhdCBhYm92ZSB0ZXN0IHNldmVyYWwgaXRlcmF0aW9uLCBndWVzdCBrZXJuZWwgcmVwb3J0
ZWQgIk5vIGlycSBoYW5kbGVyCj4+IGZvciB2ZWN0b3IiLCBhbmQgSUIgdHJhZmZpYyBkb3duZWQg
dG8gemVybyB3aGljaCBjYXVzZWQgYnkgaW50ZXJydXB0IGxvc3QuCj4+Cj4+IFdoZW4gdmNwdSBv
ZmZsaW5lLCBrZXJuZWwgZGlzYWJsZWQgbG9jYWwgSVJRLCBtaWdyYXRlIElSUSB0byBvdGhlciBj
cHUsCj4+IHVwZGF0ZSBNU0ktWCB0YWJsZSwgZW5hYmxlIElSUS4gSWYgYW55IG5ldyBpbnRlcnJ1
cHQgYXJyaXZlZCBhZnRlcgo+PiBsb2NhbCBJUlEgZGlzYWJsZWQgYWxzbyBiZWZvcmUgTVNJLVgg
dGFibGUgYmVlbiB1cGRhdGVkLCBpbnRlcnJ1cHQgc3RpbGwgCj4+IHVzZWQgb2xkIHZlY3RvciBh
bmQgZGVzdCBjcHUgaW5mbywgYW5kIHdoZW4gbG9jYWwgSVJRIGVuYWJsZWQgYWdhaW4sIAo+PiBp
bnRlcnJ1cHQgYmVlbiBzZW50IHRvIHdyb25nIGNwdSBhbmQgdmVjdG9yLgo+IAo+IFllcywgYnV0
IHRoYXQncyBzb21ldGhpbmcgTGludXggc2hvdWxrZCBiZSBhYmxlIHRvIGhhbmRsZSwgYWNjb3Jk
aW5nCj4gdG8geW91ciBkZXNjcmlwdGlvbiB0aGVyZSdzIGEgd2luZG93IHdoZXJlIGludGVycnVw
dHMgY2FuIGJlIGRlbGl2ZXJlZAo+IHRvIHRoZSBvbGQgQ1BVLCBidXQgdGhhdCdzIHNvbWV0aGlu
ZyBleHBlY3RlZC4KCkFjdHVhbGx5LCBrZXJuZWwgd2lsbCBjaGVjayBBUElDIElSUiB3aGVuIGRv
IG1pZ3JhdGlvbiwgaWYgYW55IHBlbmRpbmcKSVJRLCB3aWxsIHJldHJpZ2dlciBJUlEgdG8gbmV3
IGRlc3RpbmF0aW9uLCBidXQgWGVuIGRvZXMgbm90IHNldCB0aGUKYml0LgoKPiAKPj4KPj4gTG9v
a3Mgc3luYyBQSVIgdG8gSVJSIGFmdGVyIE1TSS1YIGJlZW4gdXBkYXRlZCBpcyBoZWxwIGZvciB0
aGlzIGlzc3VlLgo+IAo+IEFGQUlDVCB0aGUgc3luYyB0aGF0IHlvdSBkbyBpcyBzdGlsbCB1c2lu
ZyB0aGUgb2xkIHZjcHUgaWQsIGFzCj4gcGlycV9kcGNpLT5nbXNpLmRlc3RfdmNwdV9pZCBnZXRz
IHVwZGF0ZWQgYSBsaXR0bGUgYml0IGJlbG93LiBJJ20KPiB1bnN1cmUgYWJvdXQgd2h5IGRvZXMg
dGhpcyBoZWxwLCBJIHdvdWxkIGV4cGVjdCB0aGUgc3luYyBiZXR3ZWVuIHBpcgo+IGFuZCBpcnIg
dG8gaGFwcGVuIGFueXdheSwgYW5kIGhlbmNlIEknbSBub3Qgc3VyZSB3aHkgaXMgdGhpcyBoZWxw
aW5nLgoKQXMgbXkgYWJvdmUgdXBkYXRlLCBJUlEgcmV0cmlnZ2VyZWQgYnkgb2xkIGNwdSwgc28g
WGVuIG5lZWQgdG8gc2V0IElSUgpmb3Igb2xkIGNwdSBidXQgbm90IG9mIG5ldy4KClRoYW5rcywK
Sm9lCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
