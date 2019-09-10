Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4183AF289
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 23:22:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7nYX-0008Jb-HK; Tue, 10 Sep 2019 21:20:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DAD5=XF=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1i7nYV-0008JT-VS
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 21:20:08 +0000
X-Inumbo-ID: c21d0294-d410-11e9-ac21-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c21d0294-d410-11e9-ac21-12813bfff9fa;
 Tue, 10 Sep 2019 21:20:05 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ALDvKr145582;
 Tue, 10 Sep 2019 21:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=fdebqBOvcqPAlLiTq0SIFl+VD3fUB4pXg0l91CdBhTc=;
 b=hAhbaJBAJcyqaTNZmaHVUH++hh95iH3UlDgZnAZ9TC8vAyTvrCDXlgrSgT/u1764DBXO
 s+zB7WpWufVRb6RXMpF1zHXGk2zDQtveMhoXee6YtsV2l1ZiFQzIMwRIUcBcy4AfIW3a
 y/vOWqgRcdhkmS1qtXxb768mYXYFw4ThShLWzRal1l2A5U6M7ziNJjTIVBeLAUVdPm5B
 7o60pdYfSr6FreG8K2IdA/XPsVJR/5v6I+F+fTwSehgezLJOaNUhuzjayY3AprEi38jZ
 mWoeRia5ybWDnMqP/ysXGeZLTxvaPbu3WUPATJhQVOIpKDS/OJaK+ETkbSqDf0xyq3uC sg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2uw1jke58v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 21:19:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ALDmCb184572;
 Tue, 10 Sep 2019 21:19:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2uxk0sh7tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 21:19:58 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8ALJuw2031843;
 Tue, 10 Sep 2019 21:19:57 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Sep 2019 14:19:56 -0700
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
 <df64cd80-d92e-27ad-b1bc-e58184379e50@oracle.com>
 <d281baaf-a6d7-306e-63aa-b84552ac3ea5@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <9ac1f34b-ea2a-3818-4cbd-a22a9a475dd4@oracle.com>
Date: Tue, 10 Sep 2019 17:19:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d281baaf-a6d7-306e-63aa-b84552ac3ea5@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9376
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909100203
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9376
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909100203
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

T24gOS8xMC8xOSA0OjM2IFBNLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPiBPbiAxMC8wOS8yMDE5
IDE4OjQ4LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDkvMTAvMTkgNTo0NiBBTSwgSWdv
ciBEcnV6aGluaW4gd3JvdGU6Cj4+PiBPbiAxMC8wOS8yMDE5IDAyOjQ3LCBCb3JpcyBPc3Ryb3Zz
a3kgd3JvdGU6Cj4+Pj4gT24gOS85LzE5IDU6NDggUE0sIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+
Pj4+PiBPbiAwOS8wOS8yMDE5IDIwOjE5LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+Pj4+Cj4+
Pj4+PiBUaGUgb3RoZXIgcXVlc3Rpb24gSSBoYXZlIGlzIHdoeSB5b3UgdGhpbmsgaXQncyB3b3J0
aCBrZWVwaW5nCj4+Pj4+PiB4ZW5fbWNmZ19sYXRlKCkgYXMgYSBsYXRlIGluaXRjYWxsLiBIb3cg
Y291bGQgTUNGRyBpbmZvIGJlIHVwZGF0ZWQKPj4+Pj4+IGJldHdlZW4gYWNwaV9pbml0KCkgYW5k
IGxhdGVfaW5pdGNhbGxzIGJlaW5nIHJ1bj8gSSdkIHRoaW5rIGl0IGNhbiBvbmx5Cj4+Pj4+PiBo
YXBwZW4gd2hlbiBhIG5ldyBkZXZpY2UgaXMgaG90cGx1Z2dlZC4KPj4+Pj4+Cj4+Pj4+IEl0IHdh
cyBhIHByZWNhdXRpb24gYWdhaW5zdCBzZXR1cF9tY2ZnX21hcCgpIGNhbGxzIHRoYXQgbWlnaHQg
YWRkIG5ldwo+Pj4+PiBhcmVhcyB0aGF0IGFyZSBub3QgaW4gTUNGRyB0YWJsZSBidXQgZm9yIHNv
bWUgcmVhc29uIGhhdmUgX0NCQSBtZXRob2QuCj4+Pj4+IEl0J3Mgb2J2aW91c2x5IGEgImZpcm13
YXJlIGlzIGJyb2tlbiIgc2NlbmFyaW8gc28gSSBkb24ndCBoYXZlIHN0cm9uZwo+Pj4+PiBmZWVs
aW5ncyB0byBrZWVwIGl0IGhlcmUuIFdpbGwgcHJlZmVyIHRvIHJlbW92ZSBpbiB2MiBpZiB5b3Ug
d2FudC4KPj4+PiBJc24ndCBzZXR1cF9tY2ZnX21hcCgpIGNhbGxlZCBiZWZvcmUgdGhlIGZpcnN0
IHhlbl9hZGRfZGV2aWNlKCkgd2hpY2ggaXMgd2hlcmUgeW91IGFyZSBjYWxsaW5nIHhlbl9tY2Zn
X2xhdGUoKT8KPj4+Pgo+Pj4gc2V0dXBfbWNmZ19tYXAoKSBjYWxscyBhcmUgZG9uZSBpbiBvcmRl
ciBvZiByb290IGJ1cyBkaXNjb3Zlcnkgd2hpY2gKPj4+IGhhcHBlbnMgKmFmdGVyKiB0aGUgcHJl
dmlvdXMgcm9vdCBidXMgaGFzIGJlZW4gZW51bWVyYXRlZC4gU28gdGhlIG9yZGVyCj4+PiBpczog
Y2FsbCBzZXR1cF9tY2ZnX21hcCgpIGZvciByb290IGJ1cyAwLCBmaW5kIHRoYXQKPj4+IHBjaV9t
bWNmZ19sYXRlX2luaXQoKSBoYXMgZmluaXNoZWQgTUNGRyBhcmVhIHJlZ2lzdHJhdGlvbiwgcGVy
Zm9ybSBQQ0kKPj4+IGVudW1lcmF0aW9uIG9mIGJ1cyAwLCBjYWxsIHhlbl9hZGRfZGV2aWNlKCkg
Zm9yIGV2ZXJ5IGRldmljZSB0aGVyZSwgY2FsbAo+Pj4gc2V0dXBfbWNmZ19tYXAoKSBmb3Igcm9v
dCBidXMgWCwgZXRjLgo+PiBBaCwgeWVzLiBNdWx0aXBsZSBidXNzZXMuCj4+Cj4+IElmIHRoYXQn
cyB0aGUgY2FzZSB0aGVuIHdoeSBkb24ndCB3ZSBuZWVkIHRvIGNhbGwgeGVuX21jZmdfbGF0ZSgp
IGZvcgo+PiB0aGUgZmlyc3QgZGV2aWNlIG9uIGVhY2ggYnVzPwo+Pgo+IElkZWFsbHksIHllcyAt
IHdlJ2QgbGlrZSB0byBjYWxsIGl0IGZvciBldmVyeSBidXMgZGlzY292ZXJlZC4gQnV0IGJvb3QK
PiB0aW1lIGJ1c2VzIGFyZSBhbHJlYWR5IGluIE1DRkcgKG90aGVyd2lzZSBzeXN0ZW0gYm9vdCBt
aWdodCBub3Qgc2ltcGx5Cj4gd29yayBhcyBKYW4gcG9pbnRlZCBvdXQpIHNvIGl0J3Mgbm90IHN0
cmljdGx5IHJlcXVpcmVkLiBUaGUgb25seSBjYXNlIGlzCj4gYSBwb3RlbnRpYWwgUENJIGJ1cyBo
b3QtcGx1ZyBidXQgSSdtIG5vdCBzdXJlIGl0IGFjdHVhbGx5IHdvcmtzIGluCj4gcHJhY3RpY2Ug
YW5kIHdlIGNlcnRhaW5seSBkaWRuJ3Qgc3VwcG9ydCBpdCBiZWZvcmUuIEl0IG1pZ2h0IGJlIHNv
bHZlZAo+IHRoZW9yZXRpY2FsbHkgYnkgc3Vic2NyaWJpbmcgdG8gYWNwaV9idXNfdHlwZSB0aGF0
IGlzIGF2YWlsYWJsZSBhZnRlcgo+IGFjcGlfaW5pdCgpLgoKT0suIFRoZW4gKkkgdGhpbmsqIHdl
IGNhbiBkcm9wIGxhdGVfaW5pdGNhbGwoKSBidXQgSSB3b3VsZCByZWFsbHkgbGlrZQp0byBoZWFy
IHdoZW4gb3RoZXJzIHRoaW5rLgoKLWJvcmlzCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
