Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B830678
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 04:05:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWWsi-0008Kz-JP; Fri, 31 May 2019 02:02:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/r8X=T7=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1hWWsg-0008Ku-R2
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 02:02:54 +0000
X-Inumbo-ID: 314006a4-8348-11e9-bc91-df870329cc7e
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 314006a4-8348-11e9-bc91-df870329cc7e;
 Fri, 31 May 2019 02:02:50 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4V1xA9N115851;
 Fri, 31 May 2019 02:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=rwKPrHhAqsnF3IC8rHR9oGZY6hOFmYqa6o4xSYJTwto=;
 b=F8ZHY1944PxCs9qrrjyGPSNDbAGdH8FOwppLPtyqnugsq4CC7V+CGolotza4GNK3YRRg
 o69LUya5vuTfaqLTR46D0NjxFNst7S7iBd3zJg1Fr7SUfszGMPZe1VnTq9TJNi/ySouJ
 LQGrG2oQjsklnk0rIGz0RXt4/j2KkaCPCAyKe6T4BVds67JdATMwzTLyClnaSHndRYJi
 5A9C5koUDbsOe4/oIbnCIzIwyQApC83w2Z3aSBZO0L9zU7j/Nd8QwllSr0oOif7LfrTb
 IH5JuYpnqM/OuicnZf7wvPF158psgS2CBtpsajqN8CfDPH15VFYXEKFImXGRCc3n1n4X 1w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2spw4tugjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2019 02:02:38 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4V2201q103943;
 Fri, 31 May 2019 02:02:37 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2srbdyas48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2019 02:02:37 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4V22aIX027037;
 Fri, 31 May 2019 02:02:36 GMT
Received: from dhcp-10-159-147-224.vpn.oracle.com (/10.159.147.224)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 May 2019 19:02:36 -0700
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
References: <1559229415.24330.2.camel@codethink.co.uk>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Organization: Oracle Corporation
Message-ID: <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
Date: Thu, 30 May 2019 19:02:34 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1559229415.24330.2.camel@codethink.co.uk>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9273
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905310010
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9273
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905310010
Subject: Re: [Xen-devel] [stable] xen/pciback: Don't disable PCI_COMMAND on
 PCI device reset.
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
Cc: Prarit Bhargava <prarit@redhat.com>, Juergen Gross <jgross@suse.com>,
 stable <stable@vger.kernel.org>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8zMC8xOSA4OjE2IEFNLCBCZW4gSHV0Y2hpbmdzIHdyb3RlOgo+IEknbSBsb29raW5nIGF0
IENWRS0yMDE1LTg1NTMgd2hpY2ggaXMgZml4ZWQgYnk6Cj4gCj4gY29tbWl0IDc2ODFmMzFlYzlj
ZGFjYWI0ZmQxMDU3MGJlOTI0ZjJjZWY2NjY5YmEKPiBBdXRob3I6IEtvbnJhZCBSemVzenV0ZWsg
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBEYXRlOsKgwqDCoFdlZCBGZWIgMTMgMTg6
MjE6MzEgMjAxOSAtMDUwMAo+IAo+ICDCoMKgwqDCoHhlbi9wY2liYWNrOiBEb24ndCBkaXNhYmxl
IFBDSV9DT01NQU5EIG9uIFBDSSBkZXZpY2UgcmVzZXQuCj4gCj4gSSdtIGF3YXJlIHRoYXQgdGhp
cyBjaGFuZ2UgaXMgaW5jb21wYXRpYmxlIHdpdGggcWVtdSA8IDIuNSwgYnV0IHRoYXQncwo+IG5v
dyBxdWl0ZSBvbGQuICBEbyB5b3UgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gYXBwbHkgdGhpcyBj
aGFuZ2UgdG8KPiBzb21lIHN0YWJsZSBicmFuY2hlcz8KPiAKPiBCZW4uCj4gCgpIZXkgQmVuLAoK
PHNocnVncz4gTXkgb3BpbmlvbiBpcyB0byBkcm9wIGl0LCBidXQgaWYgSnVlcmdlbiB0aGlua3Mg
aXQgbWFrZXMgc2Vuc2UgCnRvIGJhY2twb3J0IEkgYW0gbm90IGdvaW5nIHRvIGFyZ3VlLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
