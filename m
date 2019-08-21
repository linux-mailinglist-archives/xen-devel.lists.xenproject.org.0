Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4C298296
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 20:19:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0V9l-0005Dq-SZ; Wed, 21 Aug 2019 18:16:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1vq=WR=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i0V9k-0005Dl-Dc
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 18:16:24 +0000
X-Inumbo-ID: c7d09056-c43f-11e9-adc9-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7d09056-c43f-11e9-adc9-12813bfff9fa;
 Wed, 21 Aug 2019 18:16:23 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LI4FwQ110412;
 Wed, 21 Aug 2019 18:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=NWy1oxr4+3e90Wc/fTQFcdZCf9Q6o95Wm2Xdqyavf+g=;
 b=cVHCHwIuIVt7PJygZTcNiF26KpB/PjQ9r2CVFuFeMdtmeIbXZ6gTDa36kzTm51z1z7Lq
 Ay/kLyfEnwydM9DUdZ7zHNvsV2X1+lYvuLvqqN4o2exYHm5LzUGFAxLEUv4GtIhyTi2h
 tmwV70BOj/fRtSIc75AW6hWColUQwHvqFZBGwgkPCPhtAFSRqx+V53YI5dJ+Q0X6U6gg
 dN24dmvhZK2gP4yExdlIAny2b9B2DfzIU9E2rxThdoSFtJv/FFPXYLHFRax4UEa6z9dP
 i8/BvLaNjFAoYJZY6whFhWnu0qyXEREeCwxnnG2IAm8iyah6Tr87qNbkrc/aF9XBLtSG uw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2uea7qygxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:16:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LI3ZS3027747;
 Wed, 21 Aug 2019 18:16:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2uh83nyrb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:16:12 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7LIGArh010997;
 Wed, 21 Aug 2019 18:16:10 GMT
Received: from dhcp-10-154-125-129.vpn.oracle.com (/10.154.125.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Aug 2019 11:16:10 -0700
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org,
 xen-devel@lists.xenproject.org
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-2-wipawel@amazon.de>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Organization: Oracle Corporation
Message-ID: <d8518cd8-1f51-5446-4f3a-e5907d1a2e17@oracle.com>
Date: Wed, 21 Aug 2019 14:16:08 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190821081931.90887-2-wipawel@amazon.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908210180
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210180
Subject: Re: [Xen-devel] [PATCH 01/14] livepatch: Always check hypervisor
 build ID upon hotpatch upload
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

T24gOC8yMS8xOSA0OjE5IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBUaGlzIGNo
YW5nZSBpcyBwYXJ0IG9mIGEgaW5kZXBlbmRhbnQgc3RhY2tlZCBob3RwYXRjaCBtb2R1bGVzCj4g
ZmVhdHVyZS4gVGhpcyBmZWF0dXJlIGFsbG93cyB0byBieXBhc3MgZGVwZW5kZW5jaWVzIGJldHdl
ZW4gbW9kdWxlcwo+IHVwb24gbG9hZGluZywgYnV0IHN0aWxsIHZlcmlmaWVzIFhlbiBidWlsZCBJ
RCBtYXRjaGluZy4KPiAKPiBJbiBvcmRlciB0byBwcmV2ZW50ICh1cClsb2FkaW5nIGFueSBob3Rw
YXRjaGVzIGJ1aWx0IGZvciBkaWZmZXJlbnQKPiBoeXBlcnZpc29yIHZlcnNpb24gYXMgaW5kaWNh
dGVkIGJ5IHRoZSBYZW4gQnVpbGQgSUQsIGFkZCBjaGVja2luZyBmb3IKPiB0aGUgcGF5bG9hZCdz
IHZzIFhlbidzIGJ1aWxkIGlkIG1hdGNoLgo+IAo+IFRvIGFjaGlldmUgdGhhdCBlbWJlZCBpbnRv
IGV2ZXJ5IGhvdHBhdGNoIGFub3RoZXIgc2VjdGlvbiB3aXRoIGEKPiBkZWRpY2F0ZWQgaHlwZXJ2
aXNvciBidWlsZCBpZCBpbiBpdC4gQWZ0ZXIgdGhlIHBheWxvYWQgaXMgbG9hZGVkIGFuZAo+IHRo
ZSAubGl2ZXBhdGNoLnhlbl9kZXBlbmRzIHNlY3Rpb24gYmVjb21lcyBhdmFpbGFibGUsIHBlcmZv
cm0gdGhlCj4gY2hlY2sgYW5kIHJlamVjdCB0aGUgcGF5bG9hZCBpZiB0aGVyZSBpcyBubyBtYXRj
aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6
b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5kcmFwcnNAYW1h
em9uLmNvbT4KPiBSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4K
PiBSZXZpZXdlZC1ieTogRXNsYW0gRWxuaWtldHkgPGVsbmlrZXR5QGFtYXpvbi5kZT4KPiBSZXZp
ZXdlZC1ieTogTWFydGluIFBvaGxhY2sgPG1wb2hsYWNrQGFtYXpvbi5kZT4KCj4gKyMgVGhpcyBv
bmUgYWx3YXlzIGZhaWxzIHVwb24gdXBsb2FkLCBiZWNhdXNlIGl0IGRlbGliZXJldGVseQoKSSB0
aGluayB0aGF0IGlzIHNwZWxsZWQgYSBiaXQgZGlmZmVyZW50IDotKQoKQnV0IGJlc2lkZXMgdGhh
dCBsb29rcyBwZXJmZWN0LiBSb3NzLCB5b3UgT2sgd2l0aCB0aGlzIG9uZSB0b28/CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
