Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5047AAA1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 16:11:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsSn3-0007Zx-Ix; Tue, 30 Jul 2019 14:07:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z2LZ=V3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hsSn2-0007Zo-JC
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 14:07:44 +0000
X-Inumbo-ID: 65e6a449-b2d3-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 65e6a449-b2d3-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 14:07:43 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6UDxCk7155283;
 Tue, 30 Jul 2019 14:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=Ce5xL37tcuEyMK1++l5PbIdXt1oAvxgj/4b7X50ueGQ=;
 b=a2laasGIQ9wUJlsQNTqZQq+U22np4QmwoE7caUUti16u4m/6ymp3Ka4V3CPa7qllTMw4
 bir31g27j/KpH2GPrcXH38RoIhTOk0HDrlgsBvU7TeWMcBTMoyASi/bBclgryavrMDyz
 Xuf95p8Nj0CZAMp4VjVVS+ISl1okDp0ch/Eav5kmrRaYBKADhpT2YbdqNpPb1YwH+miS
 ijm9ayYrezYiYdORudk3D2hw0BtDouPZzv8BaBlnQ4MsGPtGtczNJ/g+9DBP5YtNk/4g
 wwsqo2owbWkX2icI4BotFbeD0DkRvnD1skr1tLBiK/Em7EJ98VaIiEX1hUFdVKRyckyx Ow== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2u0ejpeq2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jul 2019 14:06:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6UDwCtO131102;
 Tue, 30 Jul 2019 14:06:01 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2u0xv876un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jul 2019 14:06:01 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6UE5sXI002501;
 Tue, 30 Jul 2019 14:05:54 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 30 Jul 2019 07:05:54 -0700
To: Souptick Joarder <jrdr.linux@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20190215024830.GA26477@jordon-HP-15-Notebook-PC>
 <20190728180611.GA20589@mail-itl>
 <CAFqt6zaMDnpB-RuapQAyYAub1t7oSdHH_pTD=f5k-s327ZvqMA@mail.gmail.com>
 <CAFqt6zY+07JBxAVfMqb+X78mXwFOj2VBh0nbR2tGnQOP9RrNkQ@mail.gmail.com>
 <20190729133642.GQ1250@mail-itl>
 <CAFqt6zZN+6r6wYJY+f15JAjj8dY+o30w_+EWH9Vy2kUXCKSBog@mail.gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <bf02becc-9db0-bb78-8efc-9e25cc115237@oracle.com>
Date: Tue, 30 Jul 2019 10:05:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFqt6zZN+6r6wYJY+f15JAjj8dY+o30w_+EWH9Vy2kUXCKSBog@mail.gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9334
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1907300146
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9334
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1907300146
Subject: Re: [Xen-devel] [PATCH v4 8/9] xen/gntdev.c: Convert to use
 vm_map_pages()
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
Cc: Juergen Gross <jgross@suse.com>, Michal Hocko <mhocko@suse.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>, robin.murphy@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8zMC8xOSAyOjAzIEFNLCBTb3VwdGljayBKb2FyZGVyIHdyb3RlOgo+IE9uIE1vbiwgSnVs
IDI5LCAyMDE5IGF0IDc6MDYgUE0gTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpCj4gPG1hcm1h
cmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+PiBPbiBNb24sIEp1bCAyOSwgMjAx
OSBhdCAwMjowMjo1NFBNICswNTMwLCBTb3VwdGljayBKb2FyZGVyIHdyb3RlOgo+Pj4gT24gTW9u
LCBKdWwgMjksIDIwMTkgYXQgMTozNSBQTSBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdt
YWlsLmNvbT4gd3JvdGU6Cj4+Pj4gT24gU3VuLCBKdWwgMjgsIDIwMTkgYXQgMTE6MzYgUE0gTWFy
ZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpCj4+Pj4gPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xh
Yi5jb20+IHdyb3RlOgo+Pj4+PiBPbiBGcmksIEZlYiAxNSwgMjAxOSBhdCAwODoxODozMUFNICsw
NTMwLCBTb3VwdGljayBKb2FyZGVyIHdyb3RlOgo+Pj4+Pj4gQ29udmVydCB0byB1c2Ugdm1fbWFw
X3BhZ2VzKCkgdG8gbWFwIHJhbmdlIG9mIGtlcm5lbAo+Pj4+Pj4gbWVtb3J5IHRvIHVzZXIgdm1h
Lgo+Pj4+Pj4KPj4+Pj4+IG1hcC0+Y291bnQgaXMgcGFzc2VkIHRvIHZtX21hcF9wYWdlcygpIGFu
ZCBpbnRlcm5hbCBBUEkKPj4+Pj4+IHZlcmlmeSBtYXAtPmNvdW50IGFnYWluc3QgY291bnQgKCBj
b3VudCA9IHZtYV9wYWdlcyh2bWEpKQo+Pj4+Pj4gZm9yIHBhZ2UgYXJyYXkgYm91bmRhcnkgb3Zl
cnJ1biBjb25kaXRpb24uCj4+Pj4+IFRoaXMgY29tbWl0IGJyZWFrcyBnbnRkZXYgZHJpdmVyLiBJ
ZiB2bWEtPnZtX3Bnb2ZmID4gMCwgdm1fbWFwX3BhZ2VzCj4+Pj4+IHdpbGw6Cj4+Pj4+ICAtIHVz
ZSBtYXAtPnBhZ2VzIHN0YXJ0aW5nIGF0IHZtYS0+dm1fcGdvZmYgaW5zdGVhZCBvZiAwCj4+Pj4g
VGhlIGFjdHVhbCBjb2RlIGlnbm9yZXMgdm1hLT52bV9wZ29mZiA+IDAgc2NlbmFyaW8gYW5kIG1h
cHBlZAo+Pj4+IHRoZSBlbnRpcmUgbWFwLT5wYWdlc1tpXS4gV2h5IHRoZSBlbnRpcmUgbWFwLT5w
YWdlc1tpXSBuZWVkcyB0byBiZSBtYXBwZWQKPj4+PiBpZiB2bWEtPnZtX3Bnb2ZmID4gMCAoaW4g
b3JpZ2luYWwgY29kZSkgPwo+PiB2bWEtPnZtX3Bnb2ZmIGlzIHVzZWQgYXMgaW5kZXggcGFzc2Vk
IHRvIGdudGRldl9maW5kX21hcF9pbmRleC4gSXQncwo+PiBiYXNpY2FsbHkgKGFiKXVzaW5nIHRo
aXMgcGFyYW1ldGVyIGZvciAid2hpY2ggZ3JhbnQgcmVmZXJlbmNlIHRvIG1hcCIuCj4+Cj4+Pj4g
YXJlIHlvdSByZWZlcnJpbmcgdG8gc2V0IHZtYS0+dm1fcGdvZmYgPSAwIGlycmVzcGVjdGl2ZSBv
ZiB2YWx1ZSBwYXNzZWQKPj4+PiBmcm9tIHVzZXIgc3BhY2UgPyBJZiB5ZXMsIHVzaW5nIHZtX21h
cF9wYWdlc196ZXJvKCkgaXMgYW4gYWx0ZXJuYXRlCj4+Pj4gb3B0aW9uLgo+PiBZZXMsIHRoYXQg
c2hvdWxkIHdvcmsuCj4gSSBwcmVmZXIgdG8gdXNlIHZtX21hcF9wYWdlc196ZXJvKCkgdG8gcmVz
b2x2ZSBib3RoIHRoZSBpc3N1ZXMuIEFsdGVybmF0aXZlbHkKPiB0aGUgcGF0Y2ggY2FuIGJlIHJl
dmVydGVkIGFzIHlvdSBzdWdnZXN0ZWQuIExldCBtZSBrbm93IHlvdSBvcGluaW9uIGFuZCB3YWl0
Cj4gZm9yIGZlZWRiYWNrIGZyb20gb3RoZXJzLgo+Cj4gQm9yaXMsIHdvdWxkIHlvdSBsaWtlIHRv
IGdpdmUgYW55IGZlZWRiYWNrID8KCnZtX21hcF9wYWdlc196ZXJvKCkgbG9va3MgZ29vZCB0byBt
ZS4gTWFyZWssIGRvZXMgaXQgd29yayBmb3IgeW91PwoKLWJvcmlzCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
