Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6718E13D02D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 23:37:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irrDY-0003Mp-12; Wed, 15 Jan 2020 22:32:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ki6m=3E=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1irrDW-0003MG-GZ
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 22:32:50 +0000
X-Inumbo-ID: f57c1000-37e6-11ea-8647-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f57c1000-37e6-11ea-8647-12813bfff9fa;
 Wed, 15 Jan 2020 22:32:49 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FMNTgE079402;
 Wed, 15 Jan 2020 22:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=bDGmmKR62/rJKWPi34OdOSl+RPEPQlXQTRCeFzErCqM=;
 b=MfKsFjnbwldOfD5DDxHQsHKZ6DKZnu+MD748kT200mUWlMIsHinIqSLG9IFdcGQPYMW+
 gWz8F+ntGj08/KuMHKE2fqe18uCplprZSeDMEd0GwMr/KPuo4qC4kZrfN7XUCNOqNqcQ
 IcAcYVNHMynsLY8lNK0XFDgnHUNLlAbNQLVx0EUKWaY2IJM9l4tKJ3LBzjwGasoBcIk6
 2UTMzJE6emrOgXrm1D+nQb1Qc7p4+/DxTSWpKRPuMIez1f5SOLbnQko6nkKEbdjzgwF/
 BjaM23LV+mQMBwlQkcT1Xi1KvibdYGu1Xi2ZbHwmQJvXRinZepIOChJQ18RzpJq67NlX ag== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2xf73ty2ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jan 2020 22:32:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FMNZgZ178613;
 Wed, 15 Jan 2020 22:32:37 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2xj61kh35t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jan 2020 22:32:37 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00FMWZ3d020744;
 Wed, 15 Jan 2020 22:32:36 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 15 Jan 2020 14:32:34 -0800
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20200115014643.12749-1-marmarek@invisiblethingslab.com>
 <20200115164815.GO11756@Air-de-Roger>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <393ff73f-802c-9f1c-b739-4476388b6c98@oracle.com>
Date: Wed, 15 Jan 2020 17:32:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200115164815.GO11756@Air-de-Roger>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001150168
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001150168
Subject: Re: [Xen-devel] [PATCH v4] xen-pciback: optionally allow interrupt
 enable flag writes
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
 YueHaibing <yuehaibing@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Simon Gaiser <simon@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxLzE1LzIwIDExOjQ4IEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFdlZCwg
SmFuIDE1LCAyMDIwIGF0IDAyOjQ2OjI5QU0gKzAxMDAsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7Ny
ZWNraSB3cm90ZToKPj4gUUVNVSBydW5uaW5nIGluIGEgc3R1YmRvbSBuZWVkcyB0byBiZSBhYmxl
IHRvIHNldCBJTlRYX0RJU0FCTEUsIGFuZCB0aGUKPj4gTVNJKC1YKSBlbmFibGUgZmxhZ3MgaW4g
dGhlIFBDSSBjb25maWcgc3BhY2UuIFRoaXMgYWRkcyBhbiBhdHRyaWJ1dGUKPj4gJ2FsbG93X2lu
dGVycnVwdF9jb250cm9sJyB3aGljaCB3aGVuIHNldCBmb3IgYSBQQ0kgZGV2aWNlIGFsbG93cyB3
cml0ZXMKPj4gdG8gdGhpcyBmbGFnKHMpLiBUaGUgdG9vbHN0YWNrIHdpbGwgbmVlZCB0byBzZXQg
dGhpcyBmb3Igc3R1YmRvbXMuCj4+IFdoZW4gZW5hYmxlZCwgZ3Vlc3QgKHN0dWJkb21haW4pIHdp
bGwgYmUgYWxsb3dlZCB0byBzZXQgcmVsZXZhbnQgZW5hYmxlCj4+IGZsYWdzLCBidXQgb25seSBv
bmUgYXQgYSB0aW1lIC0gaS5lLiBpdCByZWZ1c2VzIHRvIGVuYWJsZSBtb3JlIHRoYW4gb25lCj4+
IG9mIElOVHgsIE1TSSwgTVNJLVggYXQgYSB0aW1lLgo+Pgo+PiBUaGlzIGZ1bmN0aW9uYWxpdHkg
aXMgbmVlZGVkIG9ubHkgZm9yIGNvbmZpZyBzcGFjZSBhY2Nlc3MgZG9uZSBieSBkZXZpY2UKPj4g
bW9kZWwgKHN0dWJkb21haW4pIHNlcnZpbmcgYSBIVk0gd2l0aCB0aGUgYWN0dWFsIFBDSSBkZXZp
Y2UuIEl0IGlzIG5vdAo+PiBuZWNlc3NhcnkgYW5kIHVuc2FmZSB0byBlbmFibGUgZGlyZWN0IGFj
Y2VzcyB0byB0aG9zZSBiaXRzIGZvciBQViBkb21haW4KPj4gd2l0aCB0aGUgZGV2aWNlIGF0dGFj
aGVkLiBGb3IgUFYgZG9tYWlucywgdGhlcmUgYXJlIHNlcGFyYXRlIHByb3RvY29sCj4+IG1lc3Nh
Z2VzIChYRU5fUENJX09QX3tlbmFibGUsZGlzYWJsZX1fe21zaSxtc2l4fSkgZm9yIHRoaXMgcHVy
cG9zZS4KPj4gVGhvc2Ugb3BzIGluIGFkZGl0aW9uIHRvIHNldHRpbmcgZW5hYmxlIGJpdHMsIGFs
c28gY29uZmlndXJlIE1TSSgtWCkgaW4KPj4gZG9tMCBrZXJuZWwgLSB3aGljaCBpcyB1bmRlc2ly
YWJsZSBmb3IgUENJIHBhc3N0aHJvdWdoIHRvIEhWTSBndWVzdHMuCj4+Cj4+IFRoaXMgc2hvdWxk
IG5vdCBpbnRyb2R1Y2UgYW55IG5ldyBzZWN1cml0eSBpc3N1ZXMgc2luY2UgYSBtYWxpY2lvdXMK
Pj4gZ3Vlc3QgKG9yIHN0dWJkb20pIGNhbiBhbHJlYWR5IGdlbmVyYXRlIE1TSXMgdGhyb3VnaCBv
dGhlciB3YXlzLCBzZWUKPj4gWzFdIHBhZ2UgOC4gQWRkaXRpb25hbGx5LCB3aGVuIHFlbXUgcnVu
cyBpbiBkb20wLCBpdCBhbHJlYWR5IGhhdmUgZGlyZWN0Cj4+IGFjY2VzcyB0byB0aG9zZSBiaXRz
Lgo+Pgo+PiBUaGlzIGlzIHRoZSBzZWNvbmQgaXRlcmF0aW9uIG9mIHRoaXMgZmVhdHVyZS4gRmly
c3Qgd2FzIHByb3Bvc2VkIGFzIGEKPj4gZGlyZWN0IFhlbiBpbnRlcmZhY2UgdGhyb3VnaCBhIG5l
dyBoeXBlcmNhbGwsIGJ1dCB1bHRpbWF0ZWx5IGl0IHdhcwo+PiByZWplY3RlZCBieSB0aGUgbWFp
bnRhaW5lciwgYmVjYXVzZSBvZiBtaXhpbmcgcGNpYmFjayBhbmQgaHlwZXJjYWxscyBmb3IKPj4g
UENJIGNvbmZpZyBzcGFjZSBhY2Nlc3MgaXNuJ3QgYSBnb29kIGRlc2lnbi4gRnVsbCBkaXNjdXNz
aW9uIGF0IFsyXS4KPj4KPj4gWzFdOiBodHRwczovL2ludmlzaWJsZXRoaW5nc2xhYi5jb20vcmVz
b3VyY2VzLzIwMTEvU29mdHdhcmUlMjBBdHRhY2tzJTIwb24lMjBJbnRlbCUyMFZULWQucGRmCj4+
IFsyXTogaHR0cHM6Ly94ZW4ubWFya21haWwub3JnL3RocmVhZC9zbXBncHdzNHVtZHppenplCj4+
Cj4+IFtwYXJ0IG9mIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgc3lzZnMgaGFuZGxpbmddCj4+IFNp
Z25lZC1vZmYtYnk6IFNpbW9uIEdhaXNlciA8c2ltb25AaW52aXNpYmxldGhpbmdzbGFiLmNvbT4K
Pj4gW3RoZSByZXN0XQo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gU29tZSBtaW5vciBuaXRzIGJl
bG93LCBidXQgTEdUTToKPgo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPgo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVz
dGluZy9zeXNmcy1kcml2ZXItcGNpYmFjayBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lz
ZnMtZHJpdmVyLXBjaWJhY2sKPj4gaW5kZXggNmE3MzNiZmEzN2U2Li41NjZhMTFmMmMxMmYgMTAw
NjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLXBjaWJh
Y2sKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1kcml2ZXItcGNpYmFj
awo+PiBAQCAtMTEsMyArMTEsMTYgQEAgRGVzY3JpcHRpb246Cj4+ICAgICAgICAgICAgICAgICAg
ICNlY2hvIDAwOjE5LjAtRTA6MjpGRiA+IC9zeXMvYnVzL3BjaS9kcml2ZXJzL3BjaWJhY2svcXVp
cmtzCj4+ICAgICAgICAgICAgICAgICAgIHdpbGwgYWxsb3cgdGhlIGd1ZXN0IHRvIHJlYWQgYW5k
IHdyaXRlIHRvIHRoZSBjb25maWd1cmF0aW9uCj4+ICAgICAgICAgICAgICAgICAgIHJlZ2lzdGVy
IDB4MEUuCj4+ICsKPj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2J1cy9wY2kvZHJpdmVycy9wY2li
YWNrL2FsbG93X2ludGVycnVwdF9jb250cm9sCj4+ICtEYXRlOiAgICAgICAgICAgSmFuIDIwMjAK
Pj4gK0tlcm5lbFZlcnNpb246ICA1LjUKCjUuNgoKSSBjYW4gZml4IHRoaXMgYW5kIHRoZSB0aGlu
Z3MgdGhhdCBSb2dlciBtZW50aW9uZWQgd2hpbGUgY29tbWl0dGluZyBpZiAKTWFyZWsgaXMgT0sg
d2l0aCB0aGF0LgoKLWJvcmlzCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
