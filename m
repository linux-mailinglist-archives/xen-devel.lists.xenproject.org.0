Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303BED6567
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:42:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1V2-0002XG-Cs; Mon, 14 Oct 2019 14:39:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m6VQ=YH=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1iK1V0-0002XB-VJ
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:39:03 +0000
X-Inumbo-ID: 5c241fd4-ee90-11e9-937f-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c241fd4-ee90-11e9-937f-12813bfff9fa;
 Mon, 14 Oct 2019 14:39:01 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9EEIl5D079966;
 Mon, 14 Oct 2019 14:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=BGovGbx8vh2SBxEvujAnKuXLHtkJdht1375fUSLo2N0=;
 b=BwZgRk59IbZ9v5QDDTAn39ZYdPwhciaIVicidHiR4m8BtINEUVmewEB+k0xIuFrq/moD
 I1fojKAWUGZ7fKl1Birnord1B/EMEQ1dSOvcYd0R+LjbyJkG1peNuYvxIs4eQCjwzxiT
 5MXdmgtMhpZvi297KSxTkFtHzgcHvXE+9H9FGbWcePFj+zX59MyJ9OxbXeIDSKjyPnDU
 Ypw9YAoIN3c9/t3GLUYQeRy8o5cDcLwcwoYcDTBmJhqzx5PFxKgdp7ZduZ3LlOlKcoxN
 7P8zGGyF9rOHlXhSdLtwVOShajR0knnXjoW6ccgTy573Gw1haaVrgAwdbRSEqV16NXJa bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2vk68u9ck5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Oct 2019 14:38:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9EEMuhF049691;
 Mon, 14 Oct 2019 14:36:57 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2vkry6dbup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Oct 2019 14:36:57 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9EEatRG027250;
 Mon, 14 Oct 2019 14:36:55 GMT
Received: from [10.211.46.60] (/10.211.46.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 14 Oct 2019 14:36:55 +0000
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <20191009125252.3112-1-roger.pau@citrix.com>
 <8bd07732-9cd2-aa9b-3662-8da5fbabcaf4@suse.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <45817959-1dc0-6e7d-1edb-50110d092fd7@oracle.com>
Date: Mon, 14 Oct 2019 07:36:54 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8bd07732-9cd2-aa9b-3662-8da5fbabcaf4@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9409
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=995
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910140134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9409
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910140134
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvOS8xOSA2OjM1IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwOS4xMC4yMDE5IDE0
OjUyLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+IFdoZW4gdXNpbmcgcG9zdGVkIGludGVycnVw
dHMgYW5kIHRoZSBndWVzdCBtaWdyYXRlcyBNU0kgZnJvbSB2Q1BVcyBYZW4KPj4gbmVlZHMgdG8g
Zmx1c2ggYW55IHBlbmRpbmcgUElSUiB2ZWN0b3JzIG9uIHRoZSBwcmV2aW91cyB2Q1BVLCBvciBl
bHNlCj4+IHRob3NlIHZlY3RvcnMgY291bGQgZ2V0IHdyb25nbHkgaW5qZWN0ZWQgYXQgYSBsYXRl
ciBwb2ludCB3aGVuIHRoZSBNU0kKPj4gZmllbGRzIGFyZSBhbHJlYWR5IHVwZGF0ZWQuCj4+Cj4+
IFJlbmFtZSBzeW5jX3Bpcl90b19pcnIgdG8gdmxhcGljX3N5bmNfcGlyX3RvX2lyciBhbmQgZXhw
b3J0IGl0IHNvIGl0Cj4+IGNhbiBiZSBjYWxsZWQgd2hlbiB1cGRhdGluZyB0aGUgcG9zdGVkIGlu
dGVycnVwdCBkZXNjcmlwdG9yIGZpZWxkIGluCj4+IHBpX3VwZGF0ZV9pcnRlLiBXaGlsZSB0aGVy
ZSBhbHNvIHJlbW92ZSB0aGUgdW5sb2NrX291dCBmcm9tCj4+IHBpX3VwZGF0ZV9pcnRlLCBpdCdz
IHVzZWQgaW4gYSBzaW5nbGUgZ290byBhbmQgcmVtb3ZpbmcgaXQgbWFrZXMgdGhlCj4+IGZ1bmN0
aW9uIHNtYWxsZXIuCj4+Cj4+IE5vdGUgdGhhdCBQSVJSIGlzIHN5bmNlZCB0byBJUlIgYm90aCBp
biBwdF9pcnFfZGVzdHJveV9iaW5kIGFuZAo+PiBwdF9pcnFfY3JlYXRlX2JpbmQgd2hlbiB0aGUg
aW50ZXJydXB0IGRlbGl2ZXJ5IGRhdGEgaXMgYmVpbmcgdXBkYXRlZC4KPj4KPj4gQWxzbyBzdG9y
ZSB0aGUgdkNQVSBJRCBpbiBtdWx0aS1kZXN0aW5hdGlvbiBtb2RlIHdoZW4gdXNpbmcgcG9zdGVk
Cj4+IGludGVycnVwdHMgYW5kIHRoZSBpbnRlcnJ1cHQgaXMgYm91bmQgdG8gYSBzaW5nbGUgdkNQ
VSBpbiBvcmRlciBmb3IKPj4gcG9zdGVkIGludGVycnVwdHMgdG8gYmUgdXNlZC4KPj4KPj4gV2hp
bGUgdGhlcmUgZ3VhcmQgcGlfdXBkYXRlX2lydGUgd2l0aCBDT05GSUdfSFZNIHNpbmNlIGl0J3Mg
b25seSB1c2VkCj4+IHdpdGggSFZNIGd1ZXN0cy4KPj4KPj4gUmVwb3J0ZWQtYnk6IEpvZSBKaW4g
PGpvZS5qaW5Ab3JhY2xlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiAKPiBMaWtlIGZvciB0aGUgb3RoZXIgcGF0Y2ggSSdkIHByZWZlciB0
byB3YWl0IGEgbGl0dGxlIHdpdGggY29tbWl0dGluZwo+IChldmVuIGlmIHRoZSBWVC1kIGFjayBh
cHBlYXJlZCBxdWlja2x5KSB1bnRpbCBob3BlZnVsbHkgYSBUZXN0ZWQtYnkKPiBjb3VsZCBiZSBw
cm92aWRlZC4KCk15IHRlc3QgZW52IGhhcyBub3QgYmVlbiBmaXhlZCB5ZXQsIG5vdCBzdXJlIHdo
ZW4gaXQgY2FuIGJlIGZpeGVkLCBvbmNlCml0IGF2YWlsYWJsZSBJJ2xsIHRlc3QgaXQuCgpUaGFu
a3MsCkpvZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
