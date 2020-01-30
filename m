Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E614DB7B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 14:25:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix9lT-00036j-RX; Thu, 30 Jan 2020 13:21:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QPsN=3T=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ix9lS-00036e-9R
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 13:21:46 +0000
X-Inumbo-ID: 75e3d214-4363-11ea-b211-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75e3d214-4363-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 13:21:45 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00UDI8of049337;
 Thu, 30 Jan 2020 13:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=W31goQWYLyXcvFQiJlj4psEb3n6g9b/pnVgzoe6eQlA=;
 b=GEHUV3QjrmjlMBQ9+D6sS6rUtiorvubNYqcKHnlHzLy8gnUxmVPAf9kUXMpaEgGPD9e1
 qCZ6HFatU6xJFOS3iwGOyPCoCEdf1BJgRrJmSrPVxDRmUN5p0Qoq/30w6IVcWhhl0vCd
 85CT3XGU0Kap9SgkgXZfTOAjAjPfnMR4CpLfeCi9VoDT3660xm1NPkOhL3oTu9BvlNYn
 WwcujZm46olyF6TSAZdxV4ZyWf6q1HNx8sZ4qOjIp0h8gseSZDBIt9EzfMf1PhmqZVX3
 1QNiEK5VVULxj+qzOJlZ8aNfh1ijGg20XXo4kVNW5pUM5m97/I3esWLfLCYZlLIRWQk4 sg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2xrd3uky8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2020 13:21:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00UDIMJh129716;
 Thu, 30 Jan 2020 13:21:38 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2xuheq0bkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2020 13:21:37 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00UDLZnA017636;
 Thu, 30 Jan 2020 13:21:36 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 Jan 2020 05:21:35 -0800
To: sjpark@amazon.com, jgross@suse.com, roger.pau@citrix.com, axboe@kernel.dk
References: <20200127081812.21216-1-sjpark@amazon.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <bf742e9a-6200-ed14-015e-17b865e8204e@oracle.com>
Date: Thu, 30 Jan 2020 08:21:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127081812.21216-1-sjpark@amazon.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9515
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001300096
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9515
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001300096
Subject: Re: [Xen-devel] [PATCH v14 0/5] xenbus/backend: Add memory pressure
 handler callback
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
Cc: konrad.wilk@oracle.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxLzI3LzIwIDM6MTggQU0sIHNqcGFya0BhbWF6b24uY29tIHdyb3RlOgo+IEZyb206IFNl
b25nSmFlIFBhcmsgPHNqcGFya0BhbWF6b24uZGU+Cj4KPiBHcmFudGluZyBwYWdlcyBjb25zdW1l
cyBiYWNrZW5kIHN5c3RlbSBtZW1vcnkuICBJbiBzeXN0ZW1zIGNvbmZpZ3VyZWQKPiB3aXRoIGlu
c3VmZmljaWVudCBzcGFyZSBtZW1vcnkgZm9yIHRob3NlIHBhZ2VzLCBpdCBjYW4gY2F1c2UgYSBt
ZW1vcnkKPiBwcmVzc3VyZSBzaXR1YXRpb24uICBIb3dldmVyLCBmaW5kaW5nIHRoZSBvcHRpbWFs
IGFtb3VudCBvZiB0aGUgc3BhcmUKPiBtZW1vcnkgaXMgY2hhbGxlbmdpbmcgZm9yIGxhcmdlIHN5
c3RlbXMgaGF2aW5nIGR5bmFtaWMgcmVzb3VyY2UKPiB1dGlsaXphdGlvbiBwYXR0ZXJucy4gIEFs
c28sIHN1Y2ggYSBzdGF0aWMgY29uZmlndXJhdGlvbiBtaWdodCBsYWNrCj4gZmxleGliaWxpdHku
Cj4KPiBUbyBtaXRpZ2F0ZSBzdWNoIHByb2JsZW1zLCB0aGlzIHBhdGNoc2V0IGFkZHMgYSBtZW1v
cnkgcmVjbGFpbSBjYWxsYmFjawo+IHRvICd4ZW5idXNfZHJpdmVyJyAocGF0Y2ggMSkgYW5kIHRo
ZW4gaW50cm9kdWNlIGEgbG9jayBmb3IgcmFjZQo+IGNvbmRpdGlvbiBhdm9pZGFuY2UgKHBhdGNo
IDIpLiAgQWZ0ZXIgdGhhdCwgcGF0Y2ggMyBhcHBsaWVzIHRoZSBjYWxsYmFjawo+IG1lY2hhbmlz
bSB0byBtaXRpZ2F0ZSB0aGUgcHJvYmxlbSBpbiAneGVuLWJsa2JhY2snLiAgVGhlIGZvdXJ0aCBh
bmQKPiBmaWZ0aCBwYXRjaGVzIGFyZSB0cml2aWFsIGNsZWFudXBzOyB0aG9zZSBmaXggbml0cyB3
ZSBmb3VuZCBkdXJpbmcgdGhlCj4gZGV2ZWxvcG1lbnQgb2YgdGhpcyBwYXRjaHNldC4KPgo+IE5v
dGUgdGhhdCB0aGlzIHBhdGNoIGhhcyBvbmx5IHRyaXZpYWwgY2hhbmdlcyBmcm9tIHYxMy4gIFBs
ZWFzZSByZWZlciB0bwo+IGJlbG93IHBhdGNoIGhpc3RvcnkgZm9yIHRoZSBjaGFuZ2VzLgo+CgoK
QXBwbGllZCB0byBmb3ItbGludXMtNS42LgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
