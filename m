Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D87AD057
	for <lists+xen-devel@lfdr.de>; Sun,  8 Sep 2019 20:32:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i71vN-0005ZI-9J; Sun, 08 Sep 2019 18:28:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X39F=XD=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1i71vL-0005ZD-H3
 for xen-devel@lists.xenproject.org; Sun, 08 Sep 2019 18:28:31 +0000
X-Inumbo-ID: 73d77462-d266-11e9-ac05-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73d77462-d266-11e9-ac05-12813bfff9fa;
 Sun, 08 Sep 2019 18:28:29 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x88IOKn4001194;
 Sun, 8 Sep 2019 18:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=OlQJhhI3Rw85P0kimCh55K1Tmm4RmgUtpzuQYdYEmCE=;
 b=RxUfVa0G/B3LSMDUe64IPpe2UPB0muBTS1GyHJdpmn1PUPcufkH3G/AO6HDz0ZjbRTxO
 bwMSV5+92dMIdF02hIKov3jyt0XtNo5cCDQbBX1tuicJhkhZ2LJFU5xjSS7ypSs2DeKe
 cPk7db/NKwWrCzA3RJfEd8xadh1iFNxGg3I9Y+TCDmWsYX+E/RmLTis86kXJd/i8Xgx7
 pvy/a2JxNLtHSGaf44kxVIEXxf909aurTpRprIoTYcbH81GwtprNxTw8Zvl8XRYJM6lO
 xYdAxgsGGITbL5rGCxA31D8JiNL8U0g4TEFbnsTdHI/1Lq5KXRqPyxQawKSdKkTMqk3f jQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2uw1jk0k0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 08 Sep 2019 18:28:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x88IORoq018168;
 Sun, 8 Sep 2019 18:28:26 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2uv4d10axr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 08 Sep 2019 18:28:26 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x88ISOob001977;
 Sun, 8 Sep 2019 18:28:25 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 08 Sep 2019 11:28:24 -0700
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
Date: Sun, 8 Sep 2019 14:28:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9374
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909080202
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9374
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909080202
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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

T24gOS82LzE5IDc6MDAgUE0sIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+Cj4gT24gMDYvMDkvMjAx
OSAyMzozMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiA5LzMvMTkgODoyMCBQTSwgSWdv
ciBEcnV6aGluaW4gd3JvdGU6Cj4+PiBJZiBNQ0ZHIGFyZWEgaXMgbm90IHJlc2VydmVkIGluIEU4
MjAsIFhlbiBieSBkZWZhdWx0IHdpbGwgZGVmZXIgaXRzIHVzYWdlCj4+PiB1bnRpbCBEb20wIHJl
Z2lzdGVycyBpdCBleHBsaWNpdGx5IGFmdGVyIEFDUEkgcGFyc2VyIHJlY29nbml6ZXMgaXQgYXMK
Pj4+IGEgcmVzZXJ2ZWQgcmVzb3VyY2UgaW4gRFNEVC4gSGF2aW5nIGl0IHJlc2VydmVkIGluIEU4
MjAgaXMgbm90Cj4+PiBtYW5kYXRvcnkgYWNjb3JkaW5nIHRvICJQQ0kgRmlybXdhcmUgU3BlY2lm
aWNhdGlvbiwgcmV2IDMuMiIgKHBhci4gNC4xLjIpCj4+PiBhbmQgZmlybXdhcmUgaXMgZnJlZSB0
byBrZWVwIGEgaG9sZSBFODIwIGluIHRoYXQgcGxhY2UuIFhlbiBkb2Vzbid0IGtub3cKPj4+IHdo
YXQgZXhhY3RseSBpcyBpbnNpZGUgdGhpcyBob2xlIHNpbmNlIGl0IGxhY2tzIGZ1bGwgQUNQSSB2
aWV3IG9mIHRoZQo+Pj4gcGxhdGZvcm0gdGhlcmVmb3JlIGl0J3MgcG90ZW50aWFsbHkgaGFybWZ1
bCB0byBhY2Nlc3MgTUNGRyByZWdpb24KPj4+IHdpdGhvdXQgYWRkaXRpb25hbCBjaGVja3MgYXMg
c29tZSBtYWNoaW5lcyBhcmUga25vd24gdG8gcHJvdmlkZQo+Pj4gaW5jb25zaXN0ZW50IGluZm9y
bWF0aW9uIG9uIHRoZSBzaXplIG9mIHRoZSByZWdpb24uCj4+Pgo+Pj4gTm93IHhlbl9tY2ZnX2xh
dGUoKSBydW5zIGFmdGVyIGFjcGlfaW5pdCgpIHdoaWNoIGlzIHRvbyBsYXRlIGFzIHNvbWUgYmFz
aWMKPj4+IFBDSSBlbnVtZXJhdGlvbiBzdGFydHMgZXhhY3RseSB0aGVyZS4gVHJ5aW5nIHRvIHJl
Z2lzdGVyIGEgZGV2aWNlIHByaW9yCj4+PiB0byBNQ0ZHIHJlc2VydmF0aW9uIGNhdXNlcyBtdWx0
aXBsZSBwcm9ibGVtcyB3aXRoIFBDSWUgZXh0ZW5kZWQKPj4+IGNhcGFiaWxpdHkgaW5pdGlhbGl6
YXRpb25zIGluIFhlbiAoZS5nLiBTUi1JT1YgVkYgQkFSIHNpemluZykuIFRoZXJlIGFyZQo+Pj4g
bm8gY29udmVuaWVudCBob29rcyBmb3IgdXMgdG8gc3Vic2NyaWJlIHRvIHNvIHRyeSB0byByZWdp
c3RlciBNQ0ZHCj4+PiBhcmVhcyBlYXJsaWVyIHVwb24gdGhlIGZpcnN0IGludm9jYXRpb24gb2Yg
eGVuX2FkZF9kZXZpY2UoKS4gCj4+Cj4+IFdoZXJlIGlzIE1DRkcgcGFyc2VkPyBwY2lfYXJjaF9p
bml0KCk/Cj4gSXQgaGFwcGVucyB0d2ljZToKPiAxKSBmaXJzdCB0aW1lIGVhcmx5IG9uZSBpbiBw
Y2lfYXJjaF9pbml0KCkgdGhhdCBpcyBhcmNoX2luaXRjYWxsIC0gdGhhdAo+IHRpbWUgcGNpX21t
Y2ZnX2xpc3Qgd2lsbCBiZSBmcmVlZCBpbW1lZGlhdGVseSB0aGVyZSBiZWNhdXNlIE1DRkcgYXJl
YSBpcwo+IG5vdCByZXNlcnZlZCBpbiBFODIwOwo+IDIpIHNlY29uZCB0aW1lIGxhdGUgb25lIGlu
IGFjcGlfaW5pdCgpIHdoaWNoIGlzIHN1YnN5c3RlbV9pbml0Y2FsbCByaWdodAo+IGJlZm9yZSB3
aGVyZSBQQ0kgZW51bWVyYXRpb24gc3RhcnRzIC0gdGhpcyB0aW1lIEFDUEkgdGFibGVzIHdpbGwg
YmUKPiBjaGVja2VkIGZvciBhIHJlc2VydmVkIHJlc291cmNlIGFuZCBwY2lfbW1jZmdfbGlzdCB3
aWxsIGJlIGZpbmFsbHkKPiBwb3B1bGF0ZWQuCj4KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IG9uIGEg
c3lzdGVtIHRoYXQgZG9lc24ndCBoYXZlIE1DRkcgYXJlYSByZXNlcnZlZCBpbgo+IEU4MjAgcGNp
X21tY2ZnX2xpc3QgaXMgZW1wdHkgYmVmb3JlIGFjcGlfaW5pdCgpIGFuZCBvdXIgUENJIGhvb2tz
IGFyZQo+IGNhbGxlZCBpbiB0aGUgc2FtZSBwbGFjZS4gU28gTUNGRyBpcyBzdGlsbCBub3QgaW4g
dXNlIGJ5IFhlbiBhdCB0aGlzCj4gcG9pbnQgc2luY2Ugd2UgaGF2ZW4ndCByZWFjaGVkIG91ciB4
ZW5fbWNmZ19sYXRlKCkuCgoKV291bGQgaXQgYmUgcG9zc2libGUgZm9yIHVzIHRvIHBhcnNlIE1D
Rkcgb3Vyc2VsdmVzIGluIHBjaV94ZW5faW5pdCgpPyBJCnJlYWxpemUgdGhhdCB3ZSdkIGJlIGRv
aW5nIHRoaXMgdHdpY2UgKG9yIG1heWJlIGV2ZW4gdGhyZWUgdGltZXMgc2luY2UKYXBwYXJlbnRs
eSBib3RoIHBjaV9hcmNoX2luaXQoKcKgIGFuZCBhY3BpX2luaSgpIGRvIGl0KS4KCi1ib3JpcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
