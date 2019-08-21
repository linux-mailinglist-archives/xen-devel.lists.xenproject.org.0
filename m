Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD6A98342
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 20:41:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0VVJ-0007tx-5A; Wed, 21 Aug 2019 18:38:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1vq=WR=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i0VVH-0007tn-2s
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 18:38:39 +0000
X-Inumbo-ID: e2d0b13b-c442-11e9-adc9-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2d0b13b-c442-11e9-adc9-12813bfff9fa;
 Wed, 21 Aug 2019 18:38:38 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LIY38a148564;
 Wed, 21 Aug 2019 18:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=BKmUncKC9bJHjLZgiXtJ/ARiAmfYwS5s6bdyJgeonhk=;
 b=EyvlggABEaZdDNTg2p1PhVba/NNZJ4KGfQFhBqksM89ZfubOVDUOe8S0tS6keEG9pAIU
 TQr3UJI15/9dOMT76amRujGva/wJxa9e9vh2lSqqNVzMltgINV3wpOdSVKeW7kmE4hb8
 ABun2MK8rcrS2DH/APFtwF2T3ApZx5B6ox9wW3hLIQ49lzPyNIJelQQou5osygonstxN
 ewz8oAcehAw29Q0v228jUMtLbFX/Wot4khki7458YUfP2TVKPpLcC6N6fBUQgzF/xB76
 PhwZQxh6pu1cXbX8kIcxZcFh2IGXFaOoYglmKGKXYwjF1UbWgztJXHJP7SMycv9n1Z98 5w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2ue9hpqjkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:38:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LIYYBO026707;
 Wed, 21 Aug 2019 18:38:29 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2ugj7q7bdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:38:29 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7LIcQ1X026874;
 Wed, 21 Aug 2019 18:38:26 GMT
Received: from dhcp-10-154-125-129.vpn.oracle.com (/10.154.125.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Aug 2019 11:38:26 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>
References: <20190815112708.11474-1-wipawel@amazon.de>
 <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
 <3E431F27-7D89-4CE8-8FBA-86A38EBA580F@xenproject.org>
 <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
 <664a5f94-bf16-42b1-ff99-e3cee5170563@arm.com>
 <CFEA0BB3-F344-4672-A731-19F0D80DAF46@amazon.com>
 <bd7a904d-83dd-2499-28ea-0adb294587c8@citrix.com>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Organization: Oracle Corporation
Message-ID: <1f8cbfdd-6428-79bd-176d-189a87bf4829@oracle.com>
Date: Wed, 21 Aug 2019 14:38:24 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <bd7a904d-83dd-2499-28ea-0adb294587c8@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=4
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908210182
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210182
Subject: Re: [Xen-devel] [PATCH lp-metadata 2/3] livepatch: Handle arbitrary
 size names with the list operation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNS8xOSAxMjoyOSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNS8wOC8yMDE5
IDE2OjQyLCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4+IFRoYW5rcyBKdWxpZW4uIEkg
d2lsbCBkbyB0aGF0IG5leHQgdGltZSAodW5sZXNzIHlvdSBndXlzIHdhbnQgbWUgdG8KPj4gcmUt
c2VuZCBhbGwgdGhpcyA7LSkpLgo+Pgo+PiBCVFcsIEkgYWxzbyBwdXNoZWQgbXkgY2hhbmdlcyBv
bnRvIHRoZSB4ZW5iaXRzIHNlcnZlcjoKPj4gaHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcv
Z2l0d2ViLz9wPXBlb3BsZS93aXBhd2VsL2xpdmVwYXRjaC1idWlsZC10b29sczthPXN1bW1hcnkK
Pj4gaHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0d2ViLz9wPXBlb3BsZS93aXBhd2Vs
L3hlbjthPXN1bW1hcnkKPj4KPj4gSSBob3BlIHRoYXQgbWFrZXMgbmF2aWdhdGlvbiBhbmQgZGVh
bGluZyB3aXRoIHRoZSBzd2FybSBvZiBwYXRjaGVzIGEKPj4gYml0IGVhc2llci4KPiAKPiBQbGVh
c2UgKHJlKXNlbmQgdHdvIHBhdGNoIHNlcmllcywgb25lIGZvciBYZW4gYW5kIG9uZSBmb3IgYnVp
bGQgdG9vbHMuCj4gRXZlbiBmb3IgaGUgc3Vic2V0IHlvdSBwb3N0ZWQgYmVmb3JlLCBJIGNhbid0
IGZpZ3VyZSBvdXQgd2hldGhlciB0aGV5J3JlCj4gb2sgdG8gcHVzaCBzdHJhaWdodCBhd2F5LCBv
ciBuZWVkIG1vcmUgcmV2aWV3LsKgIFRoaXMgd2lsbCBiZSBmYXIgZWFzaWVyCj4gdG8gZG8gaW4g
b25lIHNpbmdsZSBnbyAocGVyIHJlcG8pLgoKVGhleSBsb29rIHByZXR0eSBnb29kLiBKdXN0IG5l
ZWQgc29tZSBleHRyYSB0ZXN0LWNhc2VzLgoKQW5kIEkgd2lsbCBuZWVkIHRvIHVwZGF0ZSB0aGUg
dHMtbGl2ZXBhdGNoIHRlc3QtY2FzZSB0byB0YWtlIGFkdmFudGFnZSAKb2YgdGhlbS4KCj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
