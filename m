Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EDEA285B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 22:48:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3RJS-0008Uh-Ur; Thu, 29 Aug 2019 20:46:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9sCI=WZ=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i3RJR-0008UU-Bc
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 20:46:33 +0000
X-Inumbo-ID: 15637554-ca9e-11e9-b95f-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15637554-ca9e-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 20:46:32 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7TKiiPk132814;
 Thu, 29 Aug 2019 20:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=sOUEFLX8ACVRw4FrDthOBAr7GVLAoz1cWtcPEv+h+3k=;
 b=SFZsYSNwpHmbkiVYDAz3CVaVVw7TTtglg6nE0Cz7pCi5x2CTv6/XHX08GnIKt8lDqEv0
 QL/XZab5VQMrv6FyHUayY3E1BceS5LYK0hAOh4sEFaTfQJWcWJOwAxiThfBcmiBBlKn3
 hT4uOmgaLgxMtAWVKydKGUUhSjQQWBhrwkRzA9R8ISNbScfz/Ce2Bt1VE/0O7Nudo0pS
 JqxaMnu9+pr6lFic1G4xfGu7APEnHMF1oAkHzCOJobQl9wur77yYh/uB3GcqGHUNz1Q8
 NzMD0girLESIHcHMkcWdWU2S9V6Fgw4cBI5En+DQiMtN7GyVmUrv97LtupJK2+kT+WQ/ GA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2upp0rr0b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 20:46:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7TKiC2v116368;
 Thu, 29 Aug 2019 20:46:20 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2upkrfebnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 20:46:20 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7TKkIs7020834;
 Thu, 29 Aug 2019 20:46:18 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 29 Aug 2019 13:46:18 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 46AD26A013F; Thu, 29 Aug 2019 16:48:04 -0400 (EDT)
Date: Thu, 29 Aug 2019 16:48:04 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
Message-ID: <20190829204804.GA24575@char.us.oracle.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
 <20190827084624.116917-9-wipawel@amazon.de>
 <20190829155851.GA44799@konrads-mbp.lan>
 <A452587B-AE71-4848-81FD-8D3D2BCE4CEF@amazon.com>
 <20190829174912.GA22880@char.us.oracle.com>
 <1FA2BDAE-B2A3-41A3-BAF8-BAB61607610C@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1FA2BDAE-B2A3-41A3-BAF8-BAB61607610C@amazon.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9364
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908290208
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9364
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908290209
Subject: Re: [Xen-devel] [PATCH v2 08/12] livepatch: Add support for inline
 asm hotpatching expectations
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBBaCwgSSBmb3Jnb3QgYWJvdXQgZW5kaWFubmVzcyBvZiBjb3Vyc2UuLi4KPiBJIGFtIHNlbmRp
bmcgYW4gaW1wcm92ZWQgcGF0Y2guIEkgaG9wZSBpdCB3b3JrcyB0aGlzIHRpbWUgYXMgZXhwZWN0
ZWQuCgpXb3JrcyBuaWNlbHkhIChUZXN0ZWQgb25seSBvbiBBUk02NCwgaGFkbid0IHRyaWVkIEFS
TTMyIHlldCkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
