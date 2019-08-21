Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575EA98301
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 20:33:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0VOs-0007N1-DG; Wed, 21 Aug 2019 18:32:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1vq=WR=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i0VOq-0007MV-PC
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 18:32:00 +0000
X-Inumbo-ID: f531f1ab-c441-11e9-adc9-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f531f1ab-c441-11e9-adc9-12813bfff9fa;
 Wed, 21 Aug 2019 18:31:59 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LIIvud124539;
 Wed, 21 Aug 2019 18:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=JC6i0rNq7NXvU6GzuqqMXac3KR71O4xto8B4aPkHFx0=;
 b=Gk27OnutSVRveoF0kpKoso2fnszYRCb4jwAX8L5GiANK69K/7y2FoIvdSID1afLcvUk/
 6ul2lwmM+UqoiuNL+8FCGYboUzAp9tjmkyGANNAoeSsnxDy63SlffgDVdHZjuhkHB45w
 yd8RYHES57RtoGXPrqPJ/actyPN4zVFp7lEQrqQOC/iPpY4wqrG/SnR1SyhlVmQ3eemf
 oymDZdK7K/+eQsz7Y8nF3BPQh7TtWGw2992VKJpDB7wKCVTx4eGuI1FGhfeJD+8WeThA
 XSsJMWsHbVY3kRIy/iWDjctyJmp7q7CaHOkC+why1NMyKjJKUJ41ye1OiP83RY0R6xIx fw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2uea7qyksv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:31:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LIJARv153029;
 Wed, 21 Aug 2019 18:31:55 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2uh2q4uweb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:31:54 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7LIVsgM021548;
 Wed, 21 Aug 2019 18:31:54 GMT
Received: from dhcp-10-154-125-129.vpn.oracle.com (/10.154.125.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Aug 2019 11:31:53 -0700
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org,
 xen-devel@lists.xenproject.org
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-7-wipawel@amazon.de>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Organization: Oracle Corporation
Message-ID: <b2f3dd25-f3ad-25f3-9015-caba9642f76f@oracle.com>
Date: Wed, 21 Aug 2019 14:31:52 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190821081931.90887-7-wipawel@amazon.de>
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, wipawel@amazon.com,
 mpohlack@amazon.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8yMS8xOSA0OjE5IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBCeSBkZWZh
dWx0LCBpbiB0aGUgcXVpZXNjaW5nIHpvbmUsIGEgaG90cGF0Y2ggcGF5bG9hZCBpcyBhcHBsaWVk
IHdpdGgKPiBhcHBseV9wYXlsb2FkKCkgYW5kIHJldmVydGVkIHdpdGggcmV2ZXJ0X3BheWxvYWQo
KSBmdW5jdGlvbnMuIEJvdGggb2YKPiB0aGUgZnVuY3Rpb25zIHJlY2VpdmUgdGhlIHBheWxvYWQg
c3RydWN0IHBvaW50ZXIgYXMgYSBwYXJhbWV0ZXIuIFRoZQo+IGZ1bmN0aW9ucyBhcmUgYWxzbyBh
IHBsYWNlIHdoZXJlIHN0YW5kYXJkICdsb2FkJyBhbmQgJ3VubG9hZCcgbW9kdWxlCj4gaG9va3Mg
YXJlIGV4ZWN1dGVkLgo+IAo+IFRvIGluY3JlYXNlIGhvdHBhdGNoaW5nIHN5c3RlbSdzIGFnaWxp
dHkgYW5kIHByb3ZpZGUgbW9yZSBmbGV4aWFibGUKPiBsb25nLXRlcm0gaG90cGF0Y2ggc29sdXRp
b24sIGFsbG93IHRvIG92ZXJ3cml0ZSB0aGUgZGVmYXVsdCBhcHBseQo+IGFuZCByZXZlcnQgYWN0
aW9uIGZ1bmN0aW9ucyB3aXRoIGhvb2stbGlrZSBzdXBwbGllZCBhbHRlcm5hdGl2ZXMuCj4gVGhl
IGFsdGVybmF0aXZlIGZ1bmN0aW9ucyBhcmUgb3B0aW9uYWwgYW5kIHRoZSBkZWZhdWx0IGZ1bmN0
aW9ucyBhcmUKPiB1c2VkIGJ5IGRlZmF1bHQuCj4gCj4gU2luY2UgdGhlIGFsdGVybmF0aXZlIGZ1
bmN0aW9ucyBoYXZlIGRpcmVjdCBhY2Nlc3MgdG8gdGhlIGhvdHBhdGNoCj4gcGF5bG9hZCBzdHJ1
Y3R1cmUsIHRoZXkgY2FuIGJldHRlciBjb250cm9sIGNvbnRleHQgb2YgdGhlICdsb2FkJyBhbmQK
PiAndW5sb2FkJyBob29rcyBleGVjdXRpb24gYXMgd2VsbCBhcyBleGFjdCBpbnN0cnVjdGlvbnMg
cmVwbGFjZW1lbnQKPiB3b3JrZmxvd3MuIFRoZXkgY2FuIGJlIGFsc28gZWFzaWx5IGV4dGVuZGVk
IHRvIHN1cHBvcnQgZXh0cmEgZmVhdHVyZXMKPiBpbiB0aGUgZnV0dXJlLgo+IAo+IFRvIHNpbXBs
aWZ5IHRoZSBhbHRlcm5hdGl2ZSBmdW5jdGlvbiBnZW5lcmF0aW9uIG1vdmUgY29kZSByZXNwb25z
aWJsZQo+IGZvciBwYXlsb2FkIGFuZCBob3RwYXRjaCByZWdpb24gcmVnaXN0cmF0aW9uIG91dHNp
ZGUgb2YgdGhlIGZ1bmN0aW9uLgo+IFRoYXQgd2F5IGl0IGlzIGd1YXJhbnRlZWQgdGhhdCB0aGUg
cmVnaXN0cmF0aW9uIHN0ZXAgb2NjdXJzIGV2ZW4gZm9yCj4gbmV3bHkgc3VwcGxpZWQgZnVuY3Rp
b25zLgo+IAoKVGhpcyBsb2dpYyBsb29rcyBsZWdpdCwgYnV0IEkgd2FzIHdvbmRlcmluZyBpZiB5
b3Ugd291bGQgYmUgdXAgZm9yIGEgCndyaXRpbmcgYSBzbWFsbCB0ZXN0LWNhc2UocykgbGl2ZXBh
dGNoIHRoYXQgd291bGQgZXhlcmNpc2UgdGhlc2UgcGFydHMgCmp1c3QgdG8gbWFrZSBzdXJlIG5v
dGhpbmcgaW4gdGhlIGZ1dHVyZSB3b3VsZCBzY3JldyBpdCB1cD8KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
