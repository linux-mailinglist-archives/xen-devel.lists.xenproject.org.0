Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BE610EDA4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 18:01:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibp1N-0004fk-6A; Mon, 02 Dec 2019 16:58:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WbKg=ZY=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1ibp1L-0004fe-FO
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 16:57:59 +0000
X-Inumbo-ID: e453f1e2-1524-11ea-b155-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e453f1e2-1524-11ea-b155-bc764e2007e4;
 Mon, 02 Dec 2019 16:57:58 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB2GsAnW005399;
 Mon, 2 Dec 2019 16:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=ZKgKnV2DyoPB5H6pdnl/4iwRJjR4yKVxy7QZ36aT4AQ=;
 b=OU09TY4KkXO8ru+Lh/Ow8+mMZuIQwbajqFPXwlhQn/+mGn5b8WBZvPWllUDEy+2G3hMU
 XL14CC2mFaQFlqIRg9hf0f15fsx+0qC4kjgkXBCwdSNVspL0KLctb+4H/pCw8k3OFEwa
 q9L1WrIxXGzTLPBWv6Al0dRgsBpOTaKP5CJUAu8+jr52U4R+rHD3jUyqrpSPdh6o8x0R
 60EF1he+wm/gm6My3VVl2EGueEfRhk8ShbqY8L3VO73yiHddlrtIVTTOgWXsUBWyagkZ
 x9xD8Xfsn8StH3xg8w45KOn2rV6q2x/ffrJOiISoNfcrV2/rroDObGc7KaCvzoJ2GvxS aQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2wkgcq1cbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Dec 2019 16:57:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB2GsTtT061129;
 Mon, 2 Dec 2019 16:57:53 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2wm1xp1nve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Dec 2019 16:57:53 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xB2Gvpvd023375;
 Mon, 2 Dec 2019 16:57:51 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 02 Dec 2019 08:57:50 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 3AC276A00F1; Mon,  2 Dec 2019 12:01:20 -0500 (EST)
Date: Mon, 2 Dec 2019 12:01:19 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191202170119.GA18997@char.us.oracle.com>
References: <20191127160108.12490-1-roger.pau@citrix.com>
 <38400e64-4ace-77a9-6b95-58f1754ca690@suse.com>
 <9154ab98-8bb7-d8c7-5310-61c865040ed4@citrix.com>
 <55667545-7298-e4ef-8022-ca3c05009719@suse.com>
 <aac11d8f-7945-1126-e5f8-9cacaef69614@suse.com>
 <5d59c68c-6246-9ece-a786-a9d0647b34b9@citrix.com>
 <20191202155332.GA17893@char.us.oracle.com>
 <db8386cf-1309-b24a-59a8-e0bd96f3749d@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db8386cf-1309-b24a-59a8-e0bd96f3749d@citrix.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9459
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912020145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9459
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912020145
Subject: Re: [Xen-devel] [PATCH for-4.13] clang: do not enable live-patching
 support
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMDM6NTU6MDRQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwMi8xMi8yMDE5IDE1OjUzLCBLb25yYWQgUnplc3p1dGVrIFdpbGsgd3JvdGU6
Cj4gPj4+IEkgcGxhbiB0byByZWxlYXNlIGFjayB0aGUgcGF0Y2ggaW4gY2FzZSB0aGUgbWlzc2lu
ZyBtYWludGFpbmVyJ3MgYWNrcwo+ID4+PiBhcmUgbm90IGNvbWluZyBpbiB0b28gbGF0ZS4KPiA+
PiBJIHRoaW5rIEFuZHkncyBvYmplY3Rpb24gd2FzIHRoYXQgdGhlcmUgaGFzIGJlZW4gemVybyB0
ZXN0aW5nIG9mCj4gPj4gbGl2ZXBhdGNoaW5nIG9uIGdjYy4gIE1heWJlIHdlIGNhbiBmaW5kIHNv
bWVvbmUgdG8gZG8gYSBzbW9rZS10ZXN0Lgo+ID4gQXMgaW4gaW50ZWdyYXRlIGxpdmVwYXRjaC1i
dWlsZCB0b29scyBpbiBvc3N0ZXN0IHNtb2tlLXRlc3RzPwo+ID4gQmVjYXVzZSB0aGUgbGl2ZXBh
dGNoIHRlc3QgY2FzZXMgYXJlIGluIG9zc3Rlc3QsIHVubGVzcyBzb21ldGhpbmcgd2VudCBhd3J5
Pwo+IAo+IFRoZSBzdW0gdG90YWwgb2YgbGl2ZXBhdGNoIHRlc3RpbmcgaW4gT1NTVGVzdCBpcyB1
c2luZyB0aGUgaGFuZC1jb2RlZAo+IEVMRiBvYmplY3RzIGZyb20gdGhlIHRlc3RzLyBkaXJlY3Rv
cnkuCj4gCj4gVGhpcyBpcyBwZXJoYXBzIG9rIGZvciB0aGUgYmFzaWMgbWVjaGFuaXNtLCBidXQg
aXRzIG5vdCByZXByZXNlbnRhdGl2ZQo+IG9mIGFjdHVhbGx5IGJ1aWxkaW5nIHJlYWwgbGl2ZXBh
dGNoZXMgdXNpbmcgbGl2ZXBhdGNoIGJ1aWxkIHRvb2xzLgoKVHJ1ZS4gQnV0IGl0IHRlc3RzIHRo
ZSBfaHlwZXJ2aXNvcl8gbGl2ZXBhdGNoIGNvZGUuCgpJIGFtIHRoaW5raW5nIHRoYXQgdGhpcyBk
aXNjdXNzaW9uIGFib3V0ICJvaCwgYnV0IGxpdmVwYXRjaC1idWlsZCB0b29scyBkb24ndCB3b3Jr
IGIvYyIKaXMgd2VsbCA8c2hydWc+IHN1Y2tzIGJ1dCBzaG91bGQgbmV2ZXIgYmxvY2sgYW4gcmVs
ZWFzZSBhcyB0aGUgY29yZQpsaXZlcGF0Y2ggZnVuY3Rpb25hbGl0eSBpcyBPSy4KCklycmVzcGVj
dGl2ZSBvZiB0aGF0IHRoZSB0ZXN0aW5nIG9mIGxpdmVwYXRjaC1idWlsZCB0b29scyBzaG91bGQg
YmUgaW4gb3NzdGVzdCwKZ3JhbnRlZCBub2JvZHkgaGFzIHRha2VuIGEgc3RlcCBpbiB0aGlzIC0g
YnV0IGlzIHNvbWVib2R5IHNpZ25pbmcgdXAgZm9yIGl0PwpbSSBjYW4ndCwgLUVOT1RJTUVdCj4g
Cj4gfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
