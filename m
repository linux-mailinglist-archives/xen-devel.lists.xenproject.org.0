Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B193C0AD6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 20:11:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDugN-0005WM-9k; Fri, 27 Sep 2019 18:09:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NVnc=XW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iDugL-0005W8-Rs
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 18:09:29 +0000
X-Inumbo-ID: f23dd2de-e151-11e9-9681-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by localhost (Halon) with ESMTPS
 id f23dd2de-e151-11e9-9681-12813bfff9fa;
 Fri, 27 Sep 2019 18:09:28 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8RI3vbZ034222;
 Fri, 27 Sep 2019 18:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=66fBkBYQWtbNzqwPRUfRrd/Ga/PxoZ8IFJsSfwiFGIE=;
 b=GJt/3W25QjNaFf/Ni0qtvqAT9KEuUKJkG4IBlmxcf0Zr2psFpTyshpwCJBIvtqGih+7G
 hGqCfx66MI9TK/qWDD+KK0dJNtR+d/6Hx+NZOFn78HACEIW6j/zzHy4Zu1VpfHk9wlrd
 qRhJHg3tULspdRjO98WLXNGDfJdxudeVyNvU7Xc6b//Yk9BCrDhEy6j4uQ8UHSu6vod9
 T1L+gO4Dx0EHMbwVvnDn8Z1b3ZEStl2tbycV2AOcsplBtYaqUGgad3nR61ea786ztmBS
 +RBYRSEwd/91uE6AjnoXyK3bZIe9OCzpAkJAJAOVjIdBksxbStCkXaIOMc6fMuAqZB3L fw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2v5cgrks97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 18:09:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8RI3cV2085618;
 Fri, 27 Sep 2019 18:09:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2v8yk0k25p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 18:09:19 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8RI9GBR031079;
 Fri, 27 Sep 2019 18:09:16 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 27 Sep 2019 11:09:16 -0700
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20190927154628.8480-1-david@redhat.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <4d6a1f9b-15ff-6594-44e0-bc262e9347f7@oracle.com>
Date: Fri, 27 Sep 2019 14:08:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190927154628.8480-1-david@redhat.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9393
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909270150
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9393
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909270150
Subject: Re: [Xen-devel] [PATCH v1] xen/balloon: Set pages PageOffline() in
 balloon_add_region()
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
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 stable@vger.kernel.org, linux-mm@kvack.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yNy8xOSAxMTo0NiBBTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gV2UgYXJlIG1p
c3NpbmcgYSBfX1NldFBhZ2VPZmZsaW5lKCksIHdoaWNoIGlzIHdoeSB3ZSBjYW4gZ2V0Cj4gIVBh
Z2VPZmZsaW5lKCkgcGFnZXMgb250byB0aGUgYmFsbG9vbiBsaXN0LCB3aGVyZQo+IGFsbG9jX3hl
bmJhbGxvb25lZF9wYWdlcygpIHdpbGwgY29tcGxhaW46Cj4KPiBwYWdlOmZmZmZlYTAwMDNlN2Zm
YzAgcmVmY291bnQ6MSBtYXBjb3VudDowIG1hcHBpbmc6MDAwMDAwMDAwMDAwMDAwMCBpbmRleDow
eDAKPiBmbGFnczogMHhmZmZmZTAwMDAxMDAwKHJlc2VydmVkKQo+IHJhdzogMDAwZmZmZmUwMDAw
MTAwMCBkZWFkMDAwMDAwMDAwMTAwIGRlYWQwMDAwMDAwMDAyMDAgMDAwMDAwMDAwMDAwMDAwMAo+
IHJhdzogMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAxZmZmZmZmZmYg
MDAwMDAwMDAwMDAwMDAwMAo+IHBhZ2UgZHVtcGVkIGJlY2F1c2U6IFZNX0JVR19PTl9QQUdFKCFQ
YWdlT2ZmbGluZShwYWdlKSkKPiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0K
PiBrZXJuZWwgQlVHIGF0IGluY2x1ZGUvbGludXgvcGFnZS1mbGFncy5oOjc0NCEKPiBpbnZhbGlk
IG9wY29kZTogMDAwMCBbIzFdIFNNUCBOT1BUSQo+Cj4gUmVwb3J0ZWQtYnk6IE1hcmVrIE1hcmN6
eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiBUZXN0
ZWQtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhp
bmdzbGFiLmNvbT4KPiBGaXhlczogNzdjNGFkZjZhNmRmICgieGVuL2JhbGxvb246IG1hcmsgaW5m
bGF0ZWQgcGFnZXMgUEdfb2ZmbGluZSIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2
NS4xKwo+IENjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+
IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxk
ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy94ZW4vYmFsbG9vbi5j
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL2JhbGxvb24uYyBiL2RyaXZlcnMveGVuL2JhbGxvb24uYwo+IGluZGV4IDA1
YjFmN2U5NDhlZi4uMjlmNjI1NjM2M2RiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL2JhbGxv
b24uYwo+ICsrKyBiL2RyaXZlcnMveGVuL2JhbGxvb24uYwo+IEBAIC02ODcsNiArNjg3LDcgQEAg
c3RhdGljIHZvaWQgX19pbml0IGJhbGxvb25fYWRkX3JlZ2lvbih1bnNpZ25lZCBsb25nIHN0YXJ0
X3BmbiwKPiAgCQkvKiB0b3RhbHJhbV9wYWdlcyBhbmQgdG90YWxoaWdoX3BhZ2VzIGRvIG5vdAo+
ICAJCSAgIGluY2x1ZGUgdGhlIGJvb3QtdGltZSBiYWxsb29uIGV4dGVuc2lvbiwgc28KPiAgCQkg
ICBkb24ndCBzdWJ0cmFjdCBmcm9tIGl0LiAqLwo+ICsJCV9fU2V0UGFnZU9mZmxpbmUocGFnZSk7
Cj4gIAkJX19iYWxsb29uX2FwcGVuZChwYWdlKTsKCgpHaXZlbiB0aGF0IHdoZW4gYSBwYWdlIGlz
IGFwcGVuZGVkIHRvIGJhbGxvb24gbGlzdCBuZWVkIHRvIGJlIG1hcmtlZApvZmZsaW5lIGFuZCwg
Y29udmVyc2VseSwgd2hlbiBhIHBhZ2UgaXMgcmV0cmlldmVkIHRoZSBiaXQgc2hvdWxkIGJlCmNs
ZWFyZWQgSSB3b25kZXIgd2hldGhlciBpdCdzIGJldHRlciB0byBtb3ZlIFNldC9DbGVhclBhZ2VP
ZmZsaW5lIHRvCmJhbGxvb25fYXBwZW5kL3JldHJpZXZlKCkuCgotYm9yaXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
