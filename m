Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2DFB25B8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 21:08:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8qrp-0004tq-Pf; Fri, 13 Sep 2019 19:04:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nLpL=XI=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1i8qro-0004tl-DH
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 19:04:24 +0000
X-Inumbo-ID: 4bda193c-d659-11e9-95b9-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bda193c-d659-11e9-95b9-12813bfff9fa;
 Fri, 13 Sep 2019 19:04:23 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8DJ3caW064158;
 Fri, 13 Sep 2019 19:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=IoVVM/QGfUe47lDF2L+/IJZuAWT2B1IWHs+hgqsZpIo=;
 b=Y8VSQxyNfZFxgZtE0syNGsPeCFGb+GdnLfRff+CNX9hPk5re4Ki/hQ52OzFi17u2PXpX
 dkIGycnsTS5iXXrlltY+rwTtI3KEEPNzWUUD81LhGlDFQAfqr1vKn7LfZPMYGzeeednK
 P1SooVbrl1ruglJm5aJtx2OGEFsaNRY2WQO5GWfap649fVo1mV7xI3oguyTkWT1W3ent
 9Ukw9nw9zqtLLqUf/vvbpAPQovpfbtfcpyfyi0RVerbrSzlZI4MS84gdoW0C0skkkgyw
 Mkbt0jusZVSQFNNDok6eTVskykViOO59S5VDEVrTsV6mGMPjcTWgkYOKJtb2DQBMcX7x ag== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2uytd3pgud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 19:04:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8DJ3uYu001325;
 Fri, 13 Sep 2019 19:04:17 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2uytdjnyfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 19:04:13 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8DJ3Y8t025684;
 Fri, 13 Sep 2019 19:03:35 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 13 Sep 2019 12:03:34 -0700
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <1568313111-14726-1-git-send-email-igor.druzhinin@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <76c350ed-9753-ef02-3813-2bf53b783227@oracle.com>
Date: Fri, 13 Sep 2019 15:03:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1568313111-14726-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9379
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909130194
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9379
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909130194
Subject: Re: [Xen-devel] [PATCH v2] xen/pci: reserve MCFG areas earlier
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
Cc: jgross@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xMi8xOSAyOjMxIFBNLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPiBJZiBNQ0ZHIGFyZWEg
aXMgbm90IHJlc2VydmVkIGluIEU4MjAsIFhlbiBieSBkZWZhdWx0IHdpbGwgZGVmZXIgaXRzIHVz
YWdlCj4gdW50aWwgRG9tMCByZWdpc3RlcnMgaXQgZXhwbGljaXRseSBhZnRlciBBQ1BJIHBhcnNl
ciByZWNvZ25pemVzIGl0IGFzCj4gYSByZXNlcnZlZCByZXNvdXJjZSBpbiBEU0RULiBIYXZpbmcg
aXQgcmVzZXJ2ZWQgaW4gRTgyMCBpcyBub3QKPiBtYW5kYXRvcnkgYWNjb3JkaW5nIHRvICJQQ0kg
RmlybXdhcmUgU3BlY2lmaWNhdGlvbiwgcmV2IDMuMiIgKHBhci4gNC4xLjIpCj4gYW5kIGZpcm13
YXJlIGlzIGZyZWUgdG8ga2VlcCBhIGhvbGUgaW4gRTgyMCBpbiB0aGF0IHBsYWNlLiBYZW4gZG9l
c24ndCBrbm93Cj4gd2hhdCBleGFjdGx5IGlzIGluc2lkZSB0aGlzIGhvbGUgc2luY2UgaXQgbGFj
a3MgZnVsbCBBQ1BJIHZpZXcgb2YgdGhlCj4gcGxhdGZvcm0gdGhlcmVmb3JlIGl0J3MgcG90ZW50
aWFsbHkgaGFybWZ1bCB0byBhY2Nlc3MgTUNGRyByZWdpb24KPiB3aXRob3V0IGFkZGl0aW9uYWwg
Y2hlY2tzIGFzIHNvbWUgbWFjaGluZXMgYXJlIGtub3duIHRvIHByb3ZpZGUKPiBpbmNvbnNpc3Rl
bnQgaW5mb3JtYXRpb24gb24gdGhlIHNpemUgb2YgdGhlIHJlZ2lvbi4KPgo+IE5vdyB4ZW5fbWNm
Z19sYXRlKCkgcnVucyBhZnRlciBhY3BpX2luaXQoKSB3aGljaCBpcyB0b28gbGF0ZSBhcyBzb21l
IGJhc2ljCj4gUENJIGVudW1lcmF0aW9uIHN0YXJ0cyBleGFjdGx5IHRoZXJlIGFzIHdlbGwuIFRy
eWluZyB0byByZWdpc3RlciBhIGRldmljZQo+IHByaW9yIHRvIE1DRkcgcmVzZXJ2YXRpb24gY2F1
c2VzIG11bHRpcGxlIHByb2JsZW1zIHdpdGggUENJZSBleHRlbmRlZAo+IGNhcGFiaWxpdHkgaW5p
dGlhbGl6YXRpb25zIGluIFhlbiAoZS5nLiBTUi1JT1YgVkYgQkFSIHNpemluZykuIFRoZXJlIGFy
ZQo+IG5vIGNvbnZlbmllbnQgaG9va3MgZm9yIHVzIHRvIHN1YnNjcmliZSB0byBzbyByZWdpc3Rl
ciBNQ0ZHIGFyZWFzIGVhcmxpZXIKPiB1cG9uIHRoZSBmaXJzdCBpbnZvY2F0aW9uIG9mIHhlbl9h
ZGRfZGV2aWNlKCkuIEl0IHNob3VsZCBiZSBzYWZlIHRvIGRvIG9uY2UKPiBzaW5jZSBhbGwgdGhl
IGJvb3QgdGltZSBidXNlcyBtdXN0IGhhdmUgdGhlaXIgTUNGRyBhcmVhcyBpbiBNQ0ZHIHRhYmxl
Cj4gYWxyZWFkeSBhbmQgd2UgZG9uJ3Qgc3VwcG9ydCBQQ0kgYnVzIGhvdC1wbHVnLgo+Cj4gU2ln
bmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpS
ZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4K
CmFuZCBhcHBsaWVkIHRvIGZvci1saW51cy01LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
