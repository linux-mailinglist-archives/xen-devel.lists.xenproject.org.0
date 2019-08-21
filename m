Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8371698306
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 20:34:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0VNq-0007E3-G0; Wed, 21 Aug 2019 18:30:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1vq=WR=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i0VNo-0007Dx-Uu
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 18:30:56 +0000
X-Inumbo-ID: d00d541e-c441-11e9-adc9-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d00d541e-c441-11e9-adc9-12813bfff9fa;
 Wed, 21 Aug 2019 18:30:55 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LIIv7a134043;
 Wed, 21 Aug 2019 18:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=FjK0wZ/RWKsx8aKpqjSmbBJ9BcXWJV2QLUY3efS3v+U=;
 b=k/djg4vpZ4tP1rhtXgmPcJfCvVVk9qg0FmSI8lanFHZ0nlAxVYU4EB3kCDtiUlXWn6IY
 kWD8wQEP5HBojmEANFkUMJkiIr18MBLWXwXFt4bHfYyEyqqoj0G3bBSYzHxMRB/FvwC6
 mHHQORIlAgKxcE4k+Niqfm+KHbrtf/dLO0e6m7Mq4rkNqpl4IlVyg9KDWRc9V2U0uD/9
 E8WZcOjTjpYLBcXRos74quwC6sD0MbxVbINUNkniPLnMVONMnilGHipEX1Pt34fKLlg6
 rEtxEHdXGXxQSHGi0SeziByokKyQHJ+pAbVtzvXsRlOZfJCV76L0I9ghkSxMUbStYIwd iw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2ue9hpqgww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:30:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LIJ7xD152878;
 Wed, 21 Aug 2019 18:30:48 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2uh2q4uvb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:30:47 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7LIUjV6020723;
 Wed, 21 Aug 2019 18:30:45 GMT
Received: from dhcp-10-154-125-129.vpn.oracle.com (/10.154.125.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Aug 2019 11:30:45 -0700
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org,
 xen-devel@lists.xenproject.org
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-11-wipawel@amazon.de>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Organization: Oracle Corporation
Message-ID: <eac23543-5784-4531-78ac-27c92fd5f366@oracle.com>
Date: Wed, 21 Aug 2019 14:30:43 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190821081931.90887-11-wipawel@amazon.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908210181
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210181
Subject: Re: [Xen-devel] [PATCH 10/14] livepatch: Add support for inline asm
 hotpatching expectations
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8yMS8xOSA0OjE5IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiAgIHR5cGVk
ZWYgZW51bSBsaXZlcGF0Y2hfZnVuY19zdGF0ZSB7Cj4gICAgICAgTElWRVBBVENIX0ZVTkNfTk9U
X0FQUExJRUQgPSAwLAo+ICAgICAgIExJVkVQQVRDSF9GVU5DX0FQUExJRUQgPSAxCj4gQEAgLTgz
OCwxMSArODUwLDEyIEBAIHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyB7Cj4gICAgICAgdWludDMyX3Qg
bmV3X3NpemU7Cj4gICAgICAgdWludDMyX3Qgb2xkX3NpemU7Cj4gICAgICAgdWludDhfdCB2ZXJz
aW9uOyAgICAgICAgLyogTVVTVCBiZSBMSVZFUEFUQ0hfUEFZTE9BRF9WRVJTSU9OLiAqLwo+IC0g
ICAgdWludDhfdCBvcGFxdWVbMzFdOwo+ICsgICAgdWludDhfdCBvcGFxdWVbTElWRVBBVENIX09Q
QVFVRV9TSVpFXTsKPiAgICNpZiBkZWZpbmVkIENPTkZJR19YODYKPiAgICAgICB1aW50OF90IGFw
cGxpZWQ7Cj4gICAgICAgdWludDhfdCBfcGFkWzddOwo+ICAgI2VuZGlmCj4gKyAgICBsaXZlcGF0
Y2hfZXhwZWN0YXRpb25fdCBleHBlY3Q7Cj4gICB9OwoKQWFhaCwgbm93IEkgdW5kZXJzdGFuZCB3
aHkgeW91IGRlY2lkZSB0byBjcmVhdGUgYSBuZXcgZmllbGQgX3BhZCBhbmQgCmFwcGxpZWQgZmll
bGQhCgpBbnkgcGFydGljdWxhciByZWFzb24gd2h5IHRoZSB2ZXJzaW9uIGNhbid0IGJlIDIgc2lu
Y2UgdGhpcyBjYW4gYmUgcGFydCAKb2YgdGhpcyBjaGFuZ2VzZXQ/IEFsc28geW91IHdvdWxkIG5l
ZWQgdG8gaGF2ZSBhIERvY3VtZW50YXRpb24gY2hhbmdlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
