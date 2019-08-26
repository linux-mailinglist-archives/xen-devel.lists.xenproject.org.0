Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA99D1AE
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 16:32:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2FzT-00088T-1e; Mon, 26 Aug 2019 14:29:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zXIZ=WW=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i2FzR-00088O-Jv
 for xen-devel@lists.xen.org; Mon, 26 Aug 2019 14:29:01 +0000
X-Inumbo-ID: d80f994a-c80d-11e9-b95f-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d80f994a-c80d-11e9-b95f-bc764e2007e4;
 Mon, 26 Aug 2019 14:29:00 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7QEFDPE180652;
 Mon, 26 Aug 2019 14:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to : content-transfer-encoding; s=corp-2019-08-05;
 bh=4K+w2eYlUTvMuxmSv5Xcto9N7rRiBbrQTuoqI7GjY7Q=;
 b=DbORogug8RZT/paQ5sfHKKw2HK1blS4ghgdSEk3B0nBJL/b6rh7N/ffkZ3FL6hbFgb8Z
 QGFBZaJlOqF/B/1a56+MCFUFnTQVoVtIWtb1aYIw88aT4KFp8kOihWo8oEfT8CN9+UeF
 ayYS8q0x3uYJKeCPt6tw+vU+ozqQCEctKL1UMxXReQ+nSLDjS2diR/kOcOP7I556gU04
 43z5vkilQ4BKhd7QjUIArOVsrj3v/hldvSSXEP75SzFF4krO3pCP2BV0L86BrJE288+X
 2k+P1hB5bhyDDeD1hY464f6DAgh1reuOwhzS+11S8K7s8LXCIjXKPo0255EqGTVs2HsW 5g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2ujwvq9ffm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 14:28:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7QES0JB031657;
 Mon, 26 Aug 2019 14:28:55 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2ujw6uxatm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 14:28:55 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7QESrKV002528;
 Mon, 26 Aug 2019 14:28:53 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 26 Aug 2019 07:28:53 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id ABDE96A00D6; Mon, 26 Aug 2019 10:30:41 -0400 (EDT)
Date: Mon, 26 Aug 2019 10:30:41 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
Message-ID: <20190826143041.GA776@char.us.oracle.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-7-wipawel@amazon.de>
 <b2f3dd25-f3ad-25f3-9015-caba9642f76f@oracle.com>
 <A902CEC6-0910-476F-9175-859B67D37959@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A902CEC6-0910-476F-9175-859B67D37959@amazon.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9361
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908260156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9361
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908260155
Subject: Re: [Xen-devel] [PATCH 06/14] livepatch: Add support for
 apply|revert action replacement hooks
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
Cc: "Pohlack, Martin" <mpohlack@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBZZXMsIEkgY291bGQgZG8gdGhhdC4gQnV0LCBJIHdvdWxkIGxpa2UgdG8gZGlzY3VzcyAoZ2V0
IGd1aWRlbGluZXMgYWJvdXQpIHRoZSBleHBlY3RlZCB0ZXN0IGNvdmVyYWdlLgo+IFdpdGggdGhp
cyBzb3J0IG9mIGNoYW5nZXMsIHRoZXJlIGlzIGFuIHVubGltaXRlZCBzZXQgb2YgdGVzdC1jYXNl
cyB0byBiZSBjcmVhdGVkLiBTbywgSSB3b3VsZCBsaWtlIHRvIGZvY3VzIG9uIGEgZmV3IG1vc3Qg
aW1wb3J0YW50Lgo+IEkgYW0gbWlzc2luZyBrbm93bGVkZ2UgaG93IHRoZXNlIHRlc3QgY2FzZXMg
YXJlIHN1cHBvc2VkIHRvIGJlIHVzZWTigKYgaGVuY2UgdGhlIGFzay4KCkkgaGFkIGluIG1pbmQg
dHdvIGxpdmVwYXRjaGVzIHdpdGggYSBkZXBlbmRlbmN5IG9uIGVhY2ggb3RoZXIgdGhhdCB3b3Vs
ZCB1dGlsaXplCmRpZmZlcmVudCBjYWxsYmFjayBtZWNoYW5pc20uIAoKU2F5IHRoZSBmaXJzdCBv
bmUganVzdCBtb2RpZmllcyB4ZW5fZXh0cmFfZnVuY3Rpb24gdG8gcHJpbnQgYmFzZWQgb24gYSBz
dHJpbmcgdmFyaWFibGUuCkFwcGx5aW5nIGl0IHdvdWxkIGNoYW5nZSBleHRyYSB2ZXJzaW9uIHRv
IHNheSAnRklSU1RfTElWRVBBVENIJyBvciBzdWNoLgoKVGhlIHNlY29uZCBvbmUgaGFzIGFuIGFw
cGx5IGFuZCByZXZlcnQgY2FsbGJhY2sgdGhhdCBtb2RpZmllcyB0aGUgeGVuX2V4dHJhX2Z1bmN0
aW9uIHRvIHByaW50IHNheQonU0VDT05EX0xJVkVQQVRDSCcgYW5kIGFsc28gJ1NFQ09ORF9SRVZF
UlRFRCcgd2hlbiByZXZlcnRlZD8KClNvIHlvdSB3b3VsZCBoYXZlOgoKeGVuLWxpdmVwYXRjaCBh
cHBseSB4ZW5fZmlyc3QKeGwgdmVyc2lvbiB8Z3JlcCBleHRyYV92ZXJzaW9uCltzaG91bGQgaGF2
ZSBGSVJTVF9MSVZFUEFUQ0hdCnhlbi1saXZlcGF0Y2ggYXBwbHkgeGVuX3NlY29uZAp4bCB2ZXJz
aW9uIHxncmVwIGV4dHJhX3ZlcnNpb24KW3Nob3VsZCBoYXZlIFNFQ09ORF9MSVZFUEFUQ0hdCnhl
bi1saXZlcGF0Y2ggcmV2ZXJ0IHhlbl9zZWNvbmQKeGwgdmVyc2lvbiB8Z3JlcCBleHRyYV92ZXJz
aW9uCltzaG91bGQgaGF2ZSBTRUNPTkRfUkVWRVJURURdCgpvciBzdWNoPwoKSnVzdCB3YW50IHRv
IG1ha2Ugc3VyZSB0aGF0IHRoZSBjb2RlIHRoYXQgaXMgZG9pbmcgdGhlIHZhcmlvdXMgY29tYmlu
YXRpb25zCm9mIGNhbGxiYWNrcyBpcyBiZWhhdmluZyBjb3JyZWN0bHkuIE5hdHVyYWxseSBkb2lu
ZyBhbGwgb2YgdGhlbSB3b3VsZCBiZSByYXRoZXIKZGlmZmljdWx0LCBzbyBJIHdvdWxkIHJhdGhl
ciB0ZXN0IHRoZSBtb3N0IGNvbW1vbiB1c2UtY2FzZS4KCkhvcGUgdGhpcyBoZWxwcz8KPiAKPiBC
ZXN0IFJlZ2FyZHMsCj4gUGF3ZWwgV2llY3pvcmtpZXdpY3oKPiAKPiAKPiAKPiBBbWF6b24gRGV2
ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSAo+IEtyYXVzZW5zdHIuIDM4Cj4gMTAxMTcgQmVy
bGluCj4gR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJy
aWNoCj4gRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJC
IDE0OTE3MyBCCj4gU2l0ejogQmVybGluCj4gVXN0LUlEOiBERSAyODkgMjM3IDg3OQo+IAo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
