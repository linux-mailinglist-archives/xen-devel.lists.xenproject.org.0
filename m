Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9273C899A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 15:28:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFecn-00033J-8i; Wed, 02 Oct 2019 13:25:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0IwX=X3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iFecl-00033E-ID
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 13:24:59 +0000
X-Inumbo-ID: 07e51830-e518-11e9-b588-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by localhost (Halon) with ESMTPS
 id 07e51830-e518-11e9-b588-bc764e2007e4;
 Wed, 02 Oct 2019 13:24:59 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x92DJZij033227;
 Wed, 2 Oct 2019 13:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=BBTNn8EElFEk9v9DuC7/VUtXgc26NqXIsNOXZvl0cdU=;
 b=PtUkEn2a0G9mhHMajE9vAzkKWA9fs0pz4G8t5HYg2QVVvEzlyGNTtgUD71l31bF9oM6U
 7lJNYyLnzJBhWlgios4vOwuRKUqZi68wFbfdeB1+8tBPjkGC3wcDUW9u+z1BYVj3/3Tc
 wZUS2JVOnZ+1pIZhxBuZReT9WvhKv2V4viI6Z0zBm7jveeW2dclRyoFcVSyom5TKwhvN
 iKmnrONZ8lD1WpCNFD96jn2T99VIORzSsTp0nMi4FoSXX7SOnM16e39i4NeBCBpswqD4
 5FFELoaRhPKfHH75XiuqyxOXePMU5b/tqLlk6dwOMzjWTrYW6YxODlgk2zcpxDH+EQ0h ew== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2v9xxuvx8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Oct 2019 13:24:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x92DNMut129772;
 Wed, 2 Oct 2019 13:24:53 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2vcg61a4np-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Oct 2019 13:24:53 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x92DOpTv025674;
 Wed, 2 Oct 2019 13:24:51 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 02 Oct 2019 06:24:51 -0700
To: Jan Beulich <jbeulich@suse.com>
References: <20191001151633.1659-1-boris.ostrovsky@oracle.com>
 <9b3f955c-ad76-601f-2b58-fa9dc4608c72@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <924f41b2-7779-9c56-9b71-56523756ecdc@oracle.com>
Date: Wed, 2 Oct 2019 09:24:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9b3f955c-ad76-601f-2b58-fa9dc4608c72@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910020128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910020128
Subject: Re: [Xen-devel] [PATCH] x86/xen: Return from panic notifier
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, james@dingwall.me.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMi8xOSAzOjQwIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwMS4xMC4yMDE5IDE3
OjE2LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IEN1cnJlbnRseSBleGVjdXRpb24gb2YgcGFu
aWMoKSBjb250aW51ZXMgdW50aWwgWGVuJ3MgcGFuaWMgbm90aWZpZXIKPj4gKHhlbl9wYW5pY19l
dmVudCgpKSBpcyBjYWxsZWQgYXQgd2hpY2ggcG9pbnQgd2UgbWFrZSBhIGh5cGVyY2FsbCB0aGF0
Cj4+IG5ldmVyIHJldHVybnMuCj4+Cj4+IFRoaXMgbWVhbnMgdGhhdCBhbnkgbm90aWZpZXIgdGhh
dCBpcyBzdXBwb3NlZCB0byBiZSBjYWxsZWQgbGF0ZXIgYXMKPj4gd2VsbCBhcyBzaWduaWZpY2Fu
dCBwYXJ0IG9mIHBhbmljKCkgY29kZSAoc3VjaCBhcyBwc3RvcmUgd3JpdGVzIGZyb20KPj4ga21z
Z19kdW1wKCkpIGlzIG5ldmVyIGV4ZWN1dGVkLgo+IEJhY2sgYXQgdGhlIHRpbWUgd2hlbiB0aGlz
IHdhcyBpbnRyb2R1Y2VkIGludG8gdGhlIFhlbm9MaW51eCB0cmVlLAo+IEkgdGhpbmsgdGhpcyBi
ZWhhdmlvciB3YXMgaW50ZW50aW9uYWwgZm9yIGF0IGxlYXN0IERvbVUtcy4gSSB3b25kZXIKPiB3
aGV0aGVyIHlvdSB3b3VsZG4ndCB3YW50IHlvdXIgY2hhbmdlIHRvIGZ1cnRoZXIgZGlzdGluZ3Vp
c2ggRG9tMAo+IGFuZCBEb21VIGJlaGF2aW9yLgoKRG8geW91IHJlbWVtYmVyIHdoYXQgdGhlIHJl
YXNvbiBmb3IgdGhhdCB3YXM/CgpJIHRoaW5rIGhhdmluZyBhYmlsaXR5IHRvIGNhbGwga21zZ19k
dW1wKCkgb24gYSBwYW5pYyBpcyBhIHVzZWZ1bCB0aGluZwp0byBoYXZlIGZvciBkb21VcyBhcyB3
ZWxsLiBCZXNpZGVzLCB0aGVyZSBtYXkgYmUgb3RoZXIgZnVuY3Rpb25hbGl0eQphZGRlZCBwb3N0
LW5vdGlmaWVycyBpbiBwYW5pYygpIGluIHRoZSBmdXR1cmUuIE9yIGFub3RoZXIgbm90aWZpZXIg
bWF5CmJlIHJlZ2lzdGVyZWQgbGF0ZXIgd2l0aCB0aGUgc2FtZSBsb3dlc3QgcHJpb3JpdHkuCgpJ
cyB0aGVyZSBhIGRvd25zaWRlIGluIGFsbG93aW5nIGRvbVVzIHRvIGZhbGwgdGhyb3VnaCBwYW5p
YygpIGFsbCB0aGUKd2F5IHRvIGVtZXJnZW5jeV9yZXN0YXJ0KCk/Cgo+Cj4+IFRoZXJlIGlzIG5v
IHJlYXNvbiBmb3IgeGVuX3BhbmljX2V2ZW50KCkgdG8gYmUgdGhpcyBsYXN0IHBvaW50IGluCj4+
IGV4ZWN1dGlvbiBzaW5jZSBwYW5pYygpJ3MgZW1lcmdlbmN5X3Jlc3RhcnQoKSB3aWxsIGNhbGwg
aW50bwo+PiB4ZW5fZW1lcmdlbmN5X3Jlc3RhcnQoKSBmcm9tIHdoZXJlIHdlIGNhbiBwZXJmb3Jt
IG91ciBoeXBlcmNhbGwuCj4gRGlkIHlvdSBjb25zaWRlciwgYXMgYW4gYWx0ZXJuYXRpdmUsIHRv
IGxvd2VyIHRoZSBub3RpZmllcidzCj4gcHJpb3JpdHk/CgpJIGRpZG4ndCBidXQgdGhhdCB3b3Vs
ZG4ndCBoZWxwIHdpdGggdGhlIG9yaWdpbmFsIHByb2JsZW0gdGhhdCBKYW1lcwpyZXBvcnRlZCAt
LS0gd2UnZCBzdGlsbCBub3QgZ2V0IHRvIGttc2dfZHVtcCgpIGNhbGwuCgoKLWJvcmlzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
