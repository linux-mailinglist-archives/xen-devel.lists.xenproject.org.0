Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A910ECAA
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 16:53:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibnxs-0007Tb-Gv; Mon, 02 Dec 2019 15:50:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WbKg=ZY=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1ibnxr-0007TW-8h
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 15:50:19 +0000
X-Inumbo-ID: 701e3aca-151b-11ea-a40a-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 701e3aca-151b-11ea-a40a-12813bfff9fa;
 Mon, 02 Dec 2019 15:50:18 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB2FkBxd132166;
 Mon, 2 Dec 2019 15:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=WTw6MI2amZFrPSgBp7s9mBurgK8k9zgQQ8s9mN3znWY=;
 b=T0GEs2tFno9s7ZnDrTQjg6Db/Bx4TSfmRdInltxNvngR8ntUgifuSbWCeaIO+eA5hQ9/
 ph16RLXGhLMGlkZ5eKOERqj+pTdCrosLo4uxCBTT3B/BBPuKcGLrEV/5gPBLTJXSTHN0
 PVmAxQ8g6AdqTYIhmWLlIlnbMDjoKLgwKed9KnaOwdrYCM6/M2/JYWVe49W0ibr7snRG
 1y9Lrj9UWo++a8s8aGQZfLMCpt/1Z9Sz7J6Hwtsj6vBFyBS30Ko84xJfQC9sZ2Ambf7o
 hJTJQD435eb1I9gBbwUz85H1Ss30h6e7cTNxKogwbWuGDEIeM7z8hfsHI4+/+XVbswdm Ow== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2wkh2r0tny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Dec 2019 15:50:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB2FjWLN186378;
 Mon, 2 Dec 2019 15:50:14 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2wm2jw3rrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Dec 2019 15:50:12 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xB2Fo8Yq010259;
 Mon, 2 Dec 2019 15:50:08 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 02 Dec 2019 07:50:08 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 9B27A6A00F1; Mon,  2 Dec 2019 10:53:32 -0500 (EST)
Date: Mon, 2 Dec 2019 10:53:32 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20191202155332.GA17893@char.us.oracle.com>
References: <20191127160108.12490-1-roger.pau@citrix.com>
 <38400e64-4ace-77a9-6b95-58f1754ca690@suse.com>
 <9154ab98-8bb7-d8c7-5310-61c865040ed4@citrix.com>
 <55667545-7298-e4ef-8022-ca3c05009719@suse.com>
 <aac11d8f-7945-1126-e5f8-9cacaef69614@suse.com>
 <5d59c68c-6246-9ece-a786-a9d0647b34b9@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d59c68c-6246-9ece-a786-a9d0647b34b9@citrix.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9459
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912020140
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9459
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912020140
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IEkgcGxhbiB0byByZWxlYXNlIGFjayB0aGUgcGF0Y2ggaW4gY2FzZSB0aGUgbWlzc2luZyBt
YWludGFpbmVyJ3MgYWNrcwo+ID4gYXJlIG5vdCBjb21pbmcgaW4gdG9vIGxhdGUuCj4gCj4gSSB0
aGluayBBbmR5J3Mgb2JqZWN0aW9uIHdhcyB0aGF0IHRoZXJlIGhhcyBiZWVuIHplcm8gdGVzdGlu
ZyBvZgo+IGxpdmVwYXRjaGluZyBvbiBnY2MuICBNYXliZSB3ZSBjYW4gZmluZCBzb21lb25lIHRv
IGRvIGEgc21va2UtdGVzdC4KCkFzIGluIGludGVncmF0ZSBsaXZlcGF0Y2gtYnVpbGQgdG9vbHMg
aW4gb3NzdGVzdCBzbW9rZS10ZXN0cz8KQmVjYXVzZSB0aGUgbGl2ZXBhdGNoIHRlc3QgY2FzZXMg
YXJlIGluIG9zc3Rlc3QsIHVubGVzcyBzb21ldGhpbmcgd2VudCBhd3J5PwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
