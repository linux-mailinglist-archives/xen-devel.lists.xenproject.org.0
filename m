Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2CFEB3B1
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:14:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQC7o-0000Vi-GV; Thu, 31 Oct 2019 15:12:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VXij=YY=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1iQC7n-0000VN-6Z
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:12:35 +0000
X-Inumbo-ID: cf473eaa-fbf0-11e9-beca-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf473eaa-fbf0-11e9-beca-bc764e2007e4;
 Thu, 31 Oct 2019 15:12:10 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9VFBZRo007983;
 Thu, 31 Oct 2019 15:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=0lQV5eCG2rswWYL4QOA9weTdx7/MH/X+xkBv+YKCQsU=;
 b=ISygQ+rYcunLcuEGYduuu04LK0JAllUCmykygUlnVPTSDctyIVFbtVfwzra5SKxHEcyN
 R7C9XSW1AJkxx+V/p3H4T0cg0ZziXf6uyWE4mZnY1lIV6c0W9CMvqkMbLoOBly+q+PcL
 QESMkz3wHpH4u+DyhYsgHO6sHZLdtQMJMra6eTncfiyc7flC1pRqzVuJ7B5dAMTvWIYW
 eNVQS0B5IPRzzqIlqQb0jXkbPXvcdX+dE25cdHAcAV9SfhT0vQKnekEoaxTz3k4MQ7aM
 V5n85tddTvy5vp/G/8g193fkmnE/JvWb/Isjw96pMrEX6nMzFc0sVVMNFogYJtwPyR74 ew== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2vxwhfuxr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Oct 2019 15:12:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9VFBpZk190714;
 Thu, 31 Oct 2019 15:12:05 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2vyqpe9yhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Oct 2019 15:12:05 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9VFBuY4002077;
 Thu, 31 Oct 2019 15:11:56 GMT
Received: from [10.211.46.60] (/10.211.46.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 31 Oct 2019 08:11:56 -0700
To: Jan Beulich <jbeulich@suse.com>
References: <20191009125252.3112-1-roger.pau@citrix.com>
 <c42e0852-2eb5-63e8-f542-b4f5d4a1e0a8@oracle.com>
 <20191030082428.GW17494@Air-de-Roger>
 <7cd007b2-8980-bac3-cd5c-812dcf2c1c61@oracle.com>
 <20191030172313.GX17494@Air-de-Roger>
 <35c7a91d-1c46-e99e-5f9c-60d9e17721bf@oracle.com>
 <83625673-5e84-20ba-b7bf-e3e527eecbc0@suse.com>
 <b61f1b50-c050-2482-527e-f7740058b5f9@oracle.com>
 <2179120f-063c-7dfc-2a25-8403163bf04b@suse.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <be5c8598-7f5c-c12a-4c45-7c377575afe5@oracle.com>
Date: Thu, 31 Oct 2019 08:11:55 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2179120f-063c-7dfc-2a25-8403163bf04b@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9426
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910310154
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9426
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910310154
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMzEvMTkgNzo1NiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzEuMTAuMjAxOSAx
NTo1MiwgSm9lIEppbiB3cm90ZToKPj4gT24gMTAvMzEvMTkgMTowMSBBTSwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+PiBPbiAzMC4xMC4yMDE5IDE5OjAxLCBKb2UgSmluIHdyb3RlOgo+Pj4+IE9uIDEw
LzMwLzE5IDEwOjIzIEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIE9j
dCAzMCwgMjAxOSBhdCAwOTozODoxNkFNIC0wNzAwLCBKb2UgSmluIHdyb3RlOgo+Pj4+Pj4gT24g
MTAvMzAvMTkgMToyNCBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+Pj4+PiBDYW4geW91
IHRyeSB0byBhZGQgdGhlIGZvbGxvd2luZyBkZWJ1ZyBwYXRjaCBvbiB0b3Agb2YgdGhlIGV4aXN0
aW5nCj4+Pj4+Pj4gb25lIGFuZCByZXBvcnQgdGhlIG91dHB1dCB0aGF0IHlvdSBnZXQgb24gdGhl
IFhlbiBjb25zb2xlPwo+Pj4+Pj4KPj4+Pj4+IEFwcGxpZWQgZGVidWcgcGF0Y2ggYW5kIHJ1biB0
aGUgdGVzdCBhZ2Fpbiwgbm90IG9mIGFueSBsb2cgcHJpbnRlZCwKPj4+Pj4+IGF0dGFjaGVkIFhl
biBsb2cgb24gc2VyaWFsIGNvbnNvbGUsIHNlZW1zIHBpX3VwZGF0ZV9pcnRlKCkgbm90IGJlZW4K
Pj4+Pj4+IGNhbGxlZCBmb3IgaW9tbXVfaW50cG9zdCB3YXMgZmFsc2UuCj4+Pj4+Cj4+Pj4+IEkg
aGF2ZSB0byBhZG1pdCBJJ20gbG9zdCBhdCB0aGlzIHBvaW50LiBEb2VzIGl0IG1lYW4gdGhlIG9y
aWdpbmFsCj4+Pj4+IGlzc3VlIGhhZCBub3RoaW5nIHRvIGRvIHdpdGggcG9zdGVkIGludGVycnVw
dHM/Cj4+Pj4KPj4+PiBMb29rcyB3aGVuIGluamVjdCBpcnEgYnkgdmxhcGljX3NldF9pcnEoKSwg
aXQgY2hlY2tlZCBieQo+Pj4+IGh2bV9mdW5jcy5kZWxpdmVyX3Bvc3RlZF9pbnRyIHJhdGhlciB0
aGFuIGlvbW11X2ludHBvc3Q6Cj4+Pj4KPj4+PiAgMTc2ICAgICBpZiAoIGh2bV9mdW5jcy5kZWxp
dmVyX3Bvc3RlZF9pbnRyICkKPj4+PiAgMTc3ICAgICAgICAgaHZtX2Z1bmNzLmRlbGl2ZXJfcG9z
dGVkX2ludHIodGFyZ2V0LCB2ZWMpOwo+Pj4+Cj4+Pj4gQW5kIGRlbGl2ZXJfcG9zdGVkX2ludHIo
KSB3b3VsZCBiZSB0aGVyZSwgd2hlbiB2bXggZW5hYmxlZDoKPj4+Pgo+Pj4+IChYRU4pIEhWTTog
Vk1YIGVuYWJsZWQKPj4+PiAoWEVOKSBIVk06IEhhcmR3YXJlIEFzc2lzdGVkIFBhZ2luZyAoSEFQ
KSBkZXRlY3RlZAo+Pj4+IChYRU4pIEhWTTogSEFQIHBhZ2Ugc2l6ZXM6IDRrQiwgMk1CLCAxR0IK
Pj4+Cj4+PiBJIGNhbid0IHNlZSB0aGUgY29ubmVjdGlvbi4gc3RhcnRfdm14KCkgaGFzCj4+Pgo+
Pj4gICAgIGlmICggY3B1X2hhc192bXhfcG9zdGVkX2ludHJfcHJvY2Vzc2luZyApCj4+PiAgICAg
ewo+Pj4gICAgICAgICBhbGxvY19kaXJlY3RfYXBpY192ZWN0b3IoJnBvc3RlZF9pbnRyX3ZlY3Rv
ciwgcGlfbm90aWZpY2F0aW9uX2ludGVycnVwdCk7Cj4+PiAgICAgICAgIGlmICggaW9tbXVfaW50
cG9zdCApCj4+PiAgICAgICAgICAgICBhbGxvY19kaXJlY3RfYXBpY192ZWN0b3IoJnBpX3dha2V1
cF92ZWN0b3IsIHBpX3dha2V1cF9pbnRlcnJ1cHQpOwo+Pj4KPj4+ICAgICAgICAgdm14X2Z1bmN0
aW9uX3RhYmxlLmRlbGl2ZXJfcG9zdGVkX2ludHIgPSB2bXhfZGVsaXZlcl9wb3N0ZWRfaW50cjsK
Pj4+ICAgICAgICAgdm14X2Z1bmN0aW9uX3RhYmxlLnN5bmNfcGlyX3RvX2lyciAgICAgPSB2bXhf
c3luY19waXJfdG9faXJyOwo+Pj4gICAgICAgICB2bXhfZnVuY3Rpb25fdGFibGUudGVzdF9waXIg
ICAgICAgICAgICA9IHZteF90ZXN0X3BpcjsKPj4+ICAgICB9Cj4+Pgo+Pj4gaS5lLiB0aGUgaG9v
ayBpcyBwcmVzZW50IG9ubHkgd2hlbiBwb3N0ZWQgaW50ZXJydXB0cyBhcmUKPj4+IGF2YWlsYWJs
ZSBpbiBnZW5lcmFsLiBJLmUuIGFsc28gd2l0aCBqdXN0IENQVS1zaWRlIHBvc3RlZAo+Pj4gaW50
ZXJydXB0cywgeWVzLCB3aGljaCBnZXRzIGNvbmZpcm1lZCBieSB5b3VyICJhcGljdj0wIgo+Pj4g
dGVzdC4gWWV0IHdpdGgganVzdCBDUFUtc2lkZSBwb3N0ZWQgaW50ZXJydXB0cyBJJ20KPj4+IHN0
cnVnZ2xpbmcgYWdhaW4gdG8gdW5kZXJzdGFuZCB5b3VyIG9yaWdpbmFsIHByb2JsZW0KPj4+IGRl
c2NyaXB0aW9uLCBhbmQgdGhlIG5lZWQgdG8gZmlkZGxlIHdpdGggSU9NTVUgc2lkZSBjb2RlLgo+
Pgo+PiBZZXMsIG9uIG15IHRlc3QgZW52LCBjcHVfaGFzX3ZteF9wb3N0ZWRfaW50cl9wcm9jZXNz
aW5nID09IHRydWUgJiYgaW9tbXVfaW50cG9zdCA9PSBmYWxzZSwKPj4gd2l0aCB0aGlzLCBwb3N0
ZWQgaW50ZXJydXB0cyBiZWVuIGVuYWJsZWQuCj4gCj4gQW5kIHdoYXQncyB0aGUgdGhlb3J5IHRo
ZW4gYWdhaW4gZm9yIG5lZWRpbmcgdG8gbW9kaWZ5IElPTU1VCj4gY29kZSBpbiB0aGlzIGNhc2U/
CgpJZGVhIGlzIHdoZW4gZGV2IG1zaXggdmVjdG9yIGJlZW4gdXBkYXRlZCwgd2UgbmVlZCB0byBs
ZXQgdmNwdSBrbm93IHRvIGF2b2lkCnRvIGxvc3QgaW50ZXJydXB0LiBOb3Qgc3VyZSB3ZSBjYW4g
ZG8gdGhpcyBvciBvdGhlciBwYXRoPwoKVGhhbmtzLApKb2UKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
