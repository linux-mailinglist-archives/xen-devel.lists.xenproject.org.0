Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFE1EC8AE
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 19:55:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQc2h-0001DZ-1k; Fri, 01 Nov 2019 18:53:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UOAp=YZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iQc2f-0001DU-Ck
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 18:53:01 +0000
X-Inumbo-ID: d1e1c39b-fcd8-11e9-956b-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1e1c39b-fcd8-11e9-956b-12813bfff9fa;
 Fri, 01 Nov 2019 18:52:59 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA1InEpr152995;
 Fri, 1 Nov 2019 18:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=WbdIr6uQ+VKrss9bMwmXr7ubweaCRh3wB5tK3WfLLi4=;
 b=k9JHO9yeOJzG+d7ALungYLcLK4/5wv4Ib72cdP0vWXPA7n7pKCM04hi97sMD18E/pTJa
 LwNY1BTYNbI42csECE+SGfYQ+dNmLTbv9xxPA7VpdvuOYUOGrjBmJ0DAuI8Wm6YEiO9F
 eoz4NwU/13pmHrzOpjMUKUHGeG1gTL5UPqkIYGbX/Hyg/TgLpABx48ffttnl2RNkqfj6
 GOn+R3QodocGZZZ0XZD+zr0i7klfcoFiZhCBR7vKetMJ0RJY9qBkuun/lxalRdM49qt8
 veUjsB2ANBFyLFdIXngijO7iiuJ2H8w/deN4BIbGIXi41sjSWQS6Hg1jZRwQe2MBkwBC AQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2vxwhg3fxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Nov 2019 18:52:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA1Iminu114420;
 Fri, 1 Nov 2019 18:52:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2w0qdwtd52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Nov 2019 18:52:39 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA1Iqanl023242;
 Fri, 1 Nov 2019 18:52:37 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 01 Nov 2019 11:52:36 -0700
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-10-jgg@ziepe.ca>
 <0355257f-6a3a-cdcd-d206-aec3df97dded@oracle.com>
 <20191101174824.GP22766@mellanox.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <14f96c2e-ee04-5b1a-fc32-2db1487df399@oracle.com>
Date: Fri, 1 Nov 2019 14:51:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20191101174824.GP22766@mellanox.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9428
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911010171
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9428
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911010171
Subject: Re: [Xen-devel] [PATCH v2 09/15] xen/gntdev: use
 mmu_range_notifier_insert
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMS8xOSAxOjQ4IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gV2VkLCBPY3Qg
MzAsIDIwMTkgYXQgMTI6NTU6MzdQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBP
biAxMC8yOC8xOSA0OjEwIFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+PiBGcm9tOiBKYXNv
biBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4+Pgo+Pj4gZ250ZGV2IHNpbXBseSB3YW50
cyB0byBtb25pdG9yIGEgc3BlY2lmaWMgVk1BIGZvciBhbnkgbm90aWZpZXIgZXZlbnRzLAo+Pj4g
dGhpcyBjYW4gYmUgZG9uZSBzdHJhaWdodGZvcndhcmRseSB1c2luZyBtbXVfcmFuZ2Vfbm90aWZp
ZXJfaW5zZXJ0KCkgb3Zlcgo+Pj4gdGhlIFZNQSdzIFZBIHJhbmdlLgo+Pj4KPj4+IFRoZSBub3Rp
ZmllciBzaG91bGQgYmUgYXR0YWNoZWQgdW50aWwgdGhlIG9yaWdpbmFsIFZNQSBpcyBkZXN0cm95
ZWQuCj4+Pgo+Pj4gSXQgaXMgdW5jbGVhciBpZiBhbnkgb2YgdGhpcyBpcyBldmVuIHNhbmUsIGJ1
dCBhdCBsZWFzdCBhIGxvdCBvZiBkdXBsaWNhdGUKPj4+IGNvZGUgaXMgcmVtb3ZlZC4KPj4gSSBk
aWRuJ3QgaGF2ZSBhIGNoYW5jZSB0byBsb29rIGF0IHRoZSBwYXRjaCBpdHNlbGYgeWV0IGJ1dCBh
cyBhIGhlYWRzLXVwCj4+IC0tLSBpdCBjcmFzaGVzIGRvbTAuCj4gVGhhbmtzIEJvcmlzLiBJIHNw
ZW50IGEgYml0IG9mIHRpbWUgYW5kIGdvdCBhIFZNIHJ1bm5pbmcgd2l0aCBhIHhlbgo+IDQuOSBo
eXBlcnZpc29yIGFuZCBhIGtlcm5lbCB3aXRoIHRoaXMgcGF0Y2ggc2VyaWVzLiBJdCBhIHVidW50
dSBiaW9uaWMKPiBWTSB3aXRoIHRoZSBkaXN0cm8ncyB4ZW4gc3R1ZmYuCj4KPiBDYW4geW91IGdp
dmUgc29tZSBndWlkYW5jZSBob3cgeW91IG1hZGUgaXQgY3Jhc2g/IAoKSXQgY3Jhc2hlcyB0cnlp
bmcgdG8gZGVyZWZlcmVuY2UgbXJuLT5vcHMtPmludmFsaWRhdGUgaW4KbW5faXRyZWVfaW52YWxp
ZGF0ZSgpIHdoZW4gYSBndWVzdCBleGl0cy4KCkkgZG9uJ3QgdGhpbmsgeW91J3ZlIGluaXRpYWxp
emVkIG5vdGlmaWVyIG9wcy4gSSBkb24ndCBzZWUgeW91IHVzaW5nCmdudGRldl9tbXVfb3BzIGFu
eXdoZXJlLgoKLWJvcmlzCgoKPiBJIHNlZSB0aGUgVk0KPiBhdXRvbG9hZGVkIGdudGRldjoKPgo+
IE1vZHVsZSAgICAgICAgICAgICAgICAgIFNpemUgIFVzZWQgYnkKPiB4ZW5fZ250ZGV2ICAgICAg
ICAgICAgIDI0NTc2ICAyCj4geGVuX2V2dGNobiAgICAgICAgICAgICAxNjM4NCAgMQo+IHhlbmZz
ICAgICAgICAgICAgICAgICAgMTYzODQgIDEKPiB4ZW5fcHJpdmNtZCAgICAgICAgICAgIDI0NTc2
ICAxNiB4ZW5mcwo+Cj4gQW5kIGxzb2Ygc2F5cyBzZXZlcmFsIHhlbiBwcm9jZXNzZXMgaGF2ZSB0
aGUgY2hhcmRldiBvcGVuOgo+Cj4geGVuc3RvcmVkICA4MTkgICAgICAgICAgICAgICAgIHJvb3Qg
ICAxM3UgICAgICBDSFIgICAgICAgICAgICAgIDEwLDUzICAgICAgMHQwICAgICAgMTk1OTUgL2Rl
di94ZW4vZ250ZGV2Cj4geGVuY29uc29sICA4NTcgICAgICAgICAgICAgICAgIHJvb3QgICAgOHUg
ICAgICBDSFIgICAgICAgICAgICAgIDEwLDUzICAgICAgMHQwICAgICAgMTk1OTUgL2Rldi94ZW4v
Z250ZGV2Cj4geGVuY29uc29sICA4NTcgODYwICAgICAgICAgICAgIHJvb3QgICAgOHUgICAgICBD
SFIgICAgICAgICAgICAgIDEwLDUzICAgICAgMHQwICAgICAgMTk1OTUgL2Rldi94ZW4vZ250ZGV2
Cj4KPiBCdXQgbm8gY3Jhc2hpbmcuLgo+Cj4gSG93ZXZlciwgSSB3YXNuJ3QgYWJsZSB0byBnZXQg
bXkgdXN1YWwgZGVidWcga2VybmVsIC5jb25maWcgdG8gYm9vdAo+IHdpdGggdGhlIHhlbiBoeXBl
cnZpc29yLCBpdCBjcmFzaGVzIG9uIGVhcmx5IGJvb3Qgd2l0aDoKPgo+IChYRU4pIERvbTAgaGFz
IG1heGltdW0gOCBWQ1BVcwo+IChYRU4pIFNjcnViYmluZyBGcmVlIFJBTSBvbiAxIG5vZGVzIHVz
aW5nIDggQ1BVcwo+IChYRU4pIC5kb25lLgo+IChYRU4pIEluaXRpYWwgbG93IG1lbW9yeSB2aXJx
IHRocmVzaG9sZCBzZXQgYXQgMHgxMDAwIHBhZ2VzLgo+IChYRU4pIFN0ZC4gTG9nbGV2ZWw6IEFs
bAo+IChYRU4pIEd1ZXN0IExvZ2xldmVsOiBBbGwKPiAoWEVOKSAqKiogU2VyaWFsIGlucHV0IC0+
IERPTTAgKHR5cGUgJ0NUUkwtYScgdGhyZWUgdGltZXMgdG8gc3dpdGNoIGlucHV0IHRvIFhlbikK
PiAoWEVOKSBGcmVlZCA0NjhrQiBpbml0IG1lbW9yeQo+IChYRU4pIGQwdjAgVW5oYW5kbGVkIHBh
Z2UgZmF1bHQgZmF1bHQvdHJhcCBbIzE0LCBlYz0wMDAyXQo+IChYRU4pIFBhZ2V0YWJsZSB3YWxr
IGZyb20gZmZmZmZiZmZmMDQ4MGZiZToKPiAoWEVOKSAgTDRbMHgxZjddID0gMDAwMDAwMDAwMDAw
MDAwMCBmZmZmZmZmZmZmZmZmZmZmCj4gKFhFTikgZG9tYWluX2NyYXNoX3N5bmMgY2FsbGVkIGZy
b20gZW50cnkuUzogZmF1bHQgYXQgZmZmZjgyZDA4MDM0OGEwNiBlbnRyeS5vI2NyZWF0ZV9ib3Vu
Y2VfZnJhbWUrMHgxMzUvMHgxNWYKPiAoWEVOKSBEb21haW4gMCAodmNwdSMwKSBjcmFzaGVkIG9u
IGNwdSMwOgo+IChYRU4pIC0tLS1bIFhlbi00LjkuMiAgeDg2XzY0ICBkZWJ1Zz1uICAgTm90IHRh
aW50ZWQgXS0tLS0KPiAoWEVOKSBDUFU6ICAgIDAKPiAoWEVOKSBSSVA6ICAgIGUwMzM6WzxmZmZm
ZmZmZjgyYjlmNzMxPl0KPiAoWEVOKSBSRkxBR1M6IDAwMDAwMDAwMDAwMDAyOTYgICBFTTogMSAg
IENPTlRFWFQ6IHB2IGd1ZXN0IChkMHYwKQo+IChYRU4pIHJheDogZmZmZmZiZmZmMDQ4MGZiZSAg
IHJieDogMDAwMDAwMDAwMDAwMDAwMCAgIHJjeDogMDAwMDAwMDBjMDAwMDEwMQo+IChYRU4pIHJk
eDogMDAwMDAwMDBmZmZmZmZmZiAgIHJzaTogZmZmZmZmZmY4NDAyNjAwMCAgIHJkaTogZmZmZmZm
ZmY4MmNiNGEyMAo+IChYRU4pIHJicDogZmZmZmZmZmY4MjQwN2ZmOCAgIHJzcDogZmZmZmZmZmY4
MjQwN2RhMCAgIHI4OiAgMDAwMDAwMDAwMDAwMDAwMAo+IChYRU4pIHI5OiAgMDAwMDAwMDAwMDAw
MDAwMCAgIHIxMDogMDAwMDAwMDAwMDAwMDAwMCAgIHIxMTogMDAwMDAwMDAwMDAwMDAwMAo+IChY
RU4pIHIxMjogMDAwMDAwMDAwMDAwMDAwMCAgIHIxMzogMWZmZmZmZmZmMDQ4MGZiZSAgIHIxNDog
MDAwMDAwMDAwMDAwMDAwMAo+IChYRU4pIHIxNTogMDAwMDAwMDAwMDAwMDAwMCAgIGNyMDogMDAw
MDAwMDA4MDA1MDAzYiAgIGNyNDogMDAwMDAwMDAwMDM1MDZlMAo+IChYRU4pIGNyMzogMDAwMDAw
MDAzNDAyNzAwMCAgIGNyMjogZmZmZmZiZmZmMDQ4MGZiZQo+IChYRU4pIGZzYjogMDAwMDAwMDAw
MDAwMDAwMCAgIGdzYjogZmZmZmZmZmY4MmI2MTAwMCAgIGdzczogMDAwMDAwMDAwMDAwMDAwMAo+
IChYRU4pIGRzOiAwMDAwICAgZXM6IDAwMDAgICBmczogMDAwMCAgIGdzOiAwMDAwICAgc3M6IGUw
MmIgICBjczogZTAzMwo+Cj4gV2hpY2ggaXMgc3VyZWx5IHNvbWUgLmNvbmZpZyBpc3N1ZSwgYnV0
IEkgZGlkbid0IGZpZ3VyZSBvdXQgd2hhdC4KPgo+IEphc29uCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
