Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB9ABDCC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 18:34:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6H9E-0005KL-Aa; Fri, 06 Sep 2019 16:31:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6vzo=XB=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i6H9C-0005KC-Sq
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 16:31:42 +0000
X-Inumbo-ID: ce692c08-d0c3-11e9-abfa-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce692c08-d0c3-11e9-abfa-12813bfff9fa;
 Fri, 06 Sep 2019 16:31:41 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x86GSqnE182405;
 Fri, 6 Sep 2019 16:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=PSo5ASrY7yNZAPtAUdpGCcJLCG1ZjlfgZ740vOm9pcI=;
 b=egCeKi8Z2Z0VKvWRzYYZWZqm+K6KSHilkq1F4MzXa6XrP7RUB/5ZKVTY1CUc8qdcMB5z
 OLxrAhtefVjxGMEYHAReR9MB3E3Az9VFBYR7dO/hzE/nPQen11iL7X5lTkhdHiIwJV80
 4xYlNspRzIzms13/e7FFtbMc2z9zQX3TCAEaZvN99TiRJEVEWcYw3CEYs6WBp77RUc7E
 5XsfbPfe70IqopcfovkRJcoe8GcbNmYaxOKJ9ik1wDJrKgqKN/D+LScNUqFXecJfl5BQ
 imnHiPEmSEq4QhlZJP8W9klbHrRsZW0D9PHoCHjlt3ebZQ2vv9bz4/g3W6orxJrnGuYK 9g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2uutyag10g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Sep 2019 16:31:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x86GRrtN022914;
 Fri, 6 Sep 2019 16:31:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2uum4ha59t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Sep 2019 16:31:10 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x86GV6Dw031491;
 Fri, 6 Sep 2019 16:31:09 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 06 Sep 2019 09:31:06 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 2BB5A6A00C1; Fri,  6 Sep 2019 12:32:51 -0400 (EDT)
Date: Fri, 6 Sep 2019 12:32:51 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: xen-devel@lists.xenproject.org, jgross@suse.com
Message-ID: <20190906163251.GA2840@char.us.oracle.com>
References: <20190906074058.21782-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906074058.21782-1-jgross@suse.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9372
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=989
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909060175
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9372
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909060175
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: luwei.kang@intel.com, wl@xen.org, andrew.cooper3@citrix.com,
 marmarek@invisiblethingslab.com, olekstysh@gmail.com, paul.durrant@citrix.com,
 JBeulich@suse.com, puwen@hygon.cn, chao.gao@intel.com,
 Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA9PSBIeXBlcnZpc29yID09IAo+IAo+ICogIFBlci1jcHUgdGFza2xldAo+ICAgLSAgWEVOLTI4
Cj4gICAtICBLb25yYWQgUnplc3p1dGVrIFdpbGsKCkkgaGF2ZW4ndCBnb3R0ZW4gdG8gdGhlbSBz
aW5jZSB0aGUgcG9zdGluZyB0aHJlZSB5ZWFycyBhZ28/CgpJIGRvbid0IHRoaW5rIEkgd2lsbCBn
ZXQgdG8gdGhlbSBhbnl0aW1lIHNvb20gdG9vIDotKAoKV291bGQgbG92ZSBpZiBzb21lb25lIHRv
b2sgdGhlbSBvdmVyLi4KClAuUzoKaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVv
cGxlL2tvbnJhZHdpbGsveGVuLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy9wZXJjcHVfdGFz
a2xldC52NC44LnYyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
