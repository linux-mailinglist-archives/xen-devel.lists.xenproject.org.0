Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1944D2E16
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:47:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIacM-0002Jz-Q4; Thu, 10 Oct 2019 15:44:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ljdo=YD=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iIacL-0002Jr-ND
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:44:41 +0000
X-Inumbo-ID: df31bc6e-eb74-11e9-bbab-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df31bc6e-eb74-11e9-bbab-bc764e2007e4;
 Thu, 10 Oct 2019 15:44:41 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9AFiUnx108538;
 Thu, 10 Oct 2019 15:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=hKvsK5haDqgcUQ6t4EiaELqFEwQ3OsCoGxtzxGjCFb4=;
 b=kSG+3TcPugpAic8oFQyM40Zalb3zPH01qf46PPf85dzJRiA77s7VixQ1UW6rKMQSdFAV
 h6lKLyhwpE5DpJMyxrr4ZsbLGTF+UCiVOiT86RAQB66e9similQFiMACwLd5L8DHdwHi
 RjtDamStPKEqOGuSkUV3rgsYpYBxGfJdCa+moJNgVACmz/3c2f79tYKLTipQDHEGyypM
 T2PG0o3NOG6pJAtnz1Uyaabq+uKi44DF+o7Le9dpaCCgovwm79R5MyrZh1B0n3+6b7Pl
 TBxndbRRO3iedZgdi5gFtqRLAYNSpfLiHBy4BV4+bLox1E8syD8haI/zLAPQKDzHVblS jQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2vek4qv0pj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 15:44:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9AFhZiC060223;
 Thu, 10 Oct 2019 15:44:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2vh8k33g1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 15:44:34 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9AFiVnQ002522;
 Thu, 10 Oct 2019 15:44:31 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Oct 2019 08:44:31 -0700
To: Rob Herring <robh@kernel.org>
References: <20191008194155.4810-1-robh@kernel.org>
 <fd2f61bb-1ff8-f90b-9514-e662db2ff19f@epam.com>
 <362d1eac-e352-d8de-1b6f-586acc0007ce@oracle.com>
 <CAL_Jsq+OajTgKoV2gWQCfGbE32LNp23tjgOpTTLcwLx19jBU9A@mail.gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <6660fec3-df3b-2f38-ae28-4fce8e3c9d99@oracle.com>
Date: Thu, 10 Oct 2019 11:44:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+OajTgKoV2gWQCfGbE32LNp23tjgOpTTLcwLx19jBU9A@mail.gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910100145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910100145
Subject: Re: [Xen-devel] [PATCH v2] xen: Stop abusing DT of_dma_configure API
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTAvMTkgMTE6MzIgQU0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFRodSwgT2N0IDEw
LCAyMDE5IGF0IDk6MDAgQU0gQm9yaXMgT3N0cm92c2t5Cj4gPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPiB3cm90ZToKPj4gT24gMTAvOS8xOSA3OjQyIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToKPj4+IE9uIDEwLzgvMTkgMTA6NDEgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+
Pj4+IEFzIHRoZSByZW1vdmVkIGNvbW1lbnRzIHNheSwgdGhlc2UgYXJlbid0IERUIGJhc2VkIGRl
dmljZXMuCj4+Pj4gb2ZfZG1hX2NvbmZpZ3VyZSgpIGlzIGdvaW5nIHRvIHN0b3AgYWxsb3dpbmcg
YSBOVUxMIERUIG5vZGUgYW5kIGNhbGxpbmcKPj4+PiBpdCB3aWxsIG5vIGxvbmdlciB3b3JrLgo+
Pj4+Cj4+Pj4gVGhlIGNvbW1lbnQgaXMgYWxzbyBub3cgb3V0IG9mIGRhdGUgYXMgb2YgY29tbWl0
IDlhYjkxZTdjNWM1MSAoImFybTY0Ogo+Pj4+IGRlZmF1bHQgdG8gdGhlIGRpcmVjdCBtYXBwaW5n
IGluIGdldF9hcmNoX2RtYV9vcHMiKS4gRGlyZWN0IG1hcHBpbmcKPj4+PiBpcyBub3cgdGhlIGRl
ZmF1bHQgcmF0aGVyIHRoYW4gZG1hX2R1bW15X29wcy4KPj4+Pgo+Pj4+IEFjY29yZGluZyB0byBT
dGVmYW5vIGFuZCBPbGVrc2FuZHIsIHRoZSBvbmx5IG90aGVyIHBhcnQgbmVlZGVkIGlzCj4+Pj4g
c2V0dGluZyB0aGUgRE1BIG1hc2tzIGFuZCB0aGVyZSdzIG5vIHJlYXNvbiB0byByZXN0cmljdCB0
aGUgbWFza3MgdG8KPj4+PiAzMi1iaXRzLiBTbyBzZXQgdGhlIG1hc2tzIHRvIDY0IGJpdHMuCj4+
Pj4KPj4+PiBDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPj4+PiBDYzog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+PiBDYzogTmljb2xhcyBTYWVu
eiBKdWxpZW5uZSA8bnNhZW56anVsaWVubmVAc3VzZS5kZT4KPj4+PiBDYzogT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4+IENjOiBC
b3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+Pj4+IENjOiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4+PiBDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+Cj4+Pj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+PiBBY2tlZC1ieTogT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+
Pgo+PiBJcyB0aGlzIGdvaW5nIHRvIGdvIHZpYSBkcm0gdHJlZSBvciBzaG91bGQgSSBwaWNrIGl0
IHVwIGZvciBYZW4gdHJlZT8KPiBQbGVhc2UgYXBwbHkgdG8gdGhlIFhlbiB0cmVlLgoKT2suIEZU
UiwKClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUu
Y29tPgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
