Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D8798271
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 20:13:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0V44-0004dD-Eo; Wed, 21 Aug 2019 18:10:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1vq=WR=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i0V43-0004d7-8k
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 18:10:31 +0000
X-Inumbo-ID: f5da661c-c43e-11e9-8980-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5da661c-c43e-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 18:10:30 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LI4G7Q110486;
 Wed, 21 Aug 2019 18:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=0MdwSmcm/Zw5czFcgvroXtgoKF/yC2xg2qI/ANWUb8E=;
 b=YyM1CsdFiDAai/NX4lV9cEwAJ6TyieSEb5hP/pApnpXttaTlgsPvAx6yOmcRO8Dn04n/
 KiGycyZUEf6+zivfPqX3/SB+TMeYJNiTjL2h3vTqsE5v9PAsn6xaaivivps40snaouZl
 AIQrHDVvC+U5sH2yaHK1cWaPSWxUz235GFy10/sV4lQa1lpuQ1JB12TCtWzb4YWiBc43
 3ZXvpjhPPW2zfZ7Ggc601uIWVKq0BhzfcaDnkiiMaOoopHUW0wr5yH6wGTtPYlnL3Uyn
 mNPe8pSXvXJY5P2i1vfYO76zypSHTxS5Xt3VTay5679UhUwDeYUf1yWNHhZkfd3PhVnr EQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2uea7qyfqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:10:27 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LI3X72110736;
 Wed, 21 Aug 2019 18:10:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2uh2q4u98c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:10:27 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7LIAQUe019163;
 Wed, 21 Aug 2019 18:10:26 GMT
Received: from dhcp-10-154-125-129.vpn.oracle.com (/10.154.125.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Aug 2019 11:10:26 -0700
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org
References: <20190814083846.89163-1-wipawel@amazon.de>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Organization: Oracle Corporation
Message-ID: <36a4622c-e00c-073c-8521-649cb8984148@oracle.com>
Date: Wed, 21 Aug 2019 14:10:25 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190814083846.89163-1-wipawel@amazon.de>
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
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210180
Subject: Re: [Xen-devel] [livepatch-hooks-2 PATCH 3/4] livepatch: Add
 support for apply|revert action replacement hooks
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
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNC8xOSA0OjM4IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBCeSBkZWZh
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
b25zLgo+IAoKWW91IE1VU1QgYWxzbyBpbmNsdWRlIHRoZSB0ZXN0LWNhc2VzIGZvciB0aGlzIG5l
dyBmdW5jdGlvbmFsaXR5LgoKUGxlYXNlIGFkZCB0aGVtLCB5b3Uga25vdyB3aGVyZSB0aGV5IGFy
ZSByaWdodD8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
