Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC61B9F10C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 19:01:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2eo6-0006JU-99; Tue, 27 Aug 2019 16:58:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ui3E=WX=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i2eo3-0006JJ-SQ
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 16:58:55 +0000
X-Inumbo-ID: f4287f82-c8eb-11e9-b95f-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4287f82-c8eb-11e9-b95f-bc764e2007e4;
 Tue, 27 Aug 2019 16:58:55 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7RGtNsL038988;
 Tue, 27 Aug 2019 16:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding :
 subject : to : cc : from : message-id; s=corp-2019-08-05;
 bh=SEgXGw/6PCKrbo+yVgbjhsoAWx5t4cy9kzcWuCa5e4I=;
 b=Q/g1jlbMsK5cg8bAlUDwdAnlIPnh0pqMfQYkb7nNDloCCjO6xF7TSVjBVyMbTIy4eGXI
 WdUsG19Jg402FMglNZvgfexzF816NuMaQTSnScBcvHZpf5gj8sn0uuuTPPmp/dPSW3JL
 jNOHNSMJHuHXmKj20KTgqJ95Alo6XFsyHW49MwJ2dv239SVx3HwvAaodIXji3UjgB+sR
 Shnyz5qxM6Ylxx0gUQHrtJJXYEidQRSf6WcAoVmh6XBLt2gdSiIy+x43YWk6F4PY/Crr
 3ICH0JwIXmWu1bvL79BLOxoAAho/WEAY3jTxp2Pc0uEzGRRNLb1oGzLTuzsTJTBIR198 eQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2un8exr0tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 16:58:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7RGiJDL095853;
 Tue, 27 Aug 2019 16:58:44 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2umhu8yx1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 16:58:44 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7RGwgWb007832;
 Tue, 27 Aug 2019 16:58:43 GMT
Received: from [IPv6:2607:fb90:ac4d:3671:8147:1de1:41fd:7ec6] (/172.58.229.14)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 27 Aug 2019 09:58:42 -0700
Date: Tue, 27 Aug 2019 12:58:31 -0400
User-Agent: K-9 Mail for Android
In-Reply-To: <20190827084624.116917-6-wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
 <20190827084624.116917-6-wipawel@amazon.de>
MIME-Version: 1.0
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org,
 xen-devel@lists.xenproject.org
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Message-ID: <AC4BE922-88D7-47B9-9CEC-D9413B22AB61@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9362
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908270162
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9362
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908270162
Subject: Re: [Xen-devel] [PATCH v2 05/12] livepatch: Add support for
 apply|revert action replacement hooks
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gQXVndXN0IDI3LCAyMDE5IDQ6NDY6MTcgQU0gRURULCBQYXdlbCBXaWVjem9ya2lld2ljeiA8
d2lwYXdlbEBhbWF6b24uZGU+IHdyb3RlOgo+QnkgZGVmYXVsdCwgaW4gdGhlIHF1aWVzY2luZyB6
b25lLCBhIGhvdHBhdGNoIHBheWxvYWQgaXMgYXBwbGllZCB3aXRoCj5hcHBseV9wYXlsb2FkKCkg
YW5kIHJldmVydGVkIHdpdGggcmV2ZXJ0X3BheWxvYWQoKSBmdW5jdGlvbnMuIEJvdGggb2YKPnRo
ZSBmdW5jdGlvbnMgcmVjZWl2ZSB0aGUgcGF5bG9hZCBzdHJ1Y3QgcG9pbnRlciBhcyBhIHBhcmFt
ZXRlci4gVGhlCj5mdW5jdGlvbnMgYXJlIGFsc28gYSBwbGFjZSB3aGVyZSBzdGFuZGFyZCAnbG9h
ZCcgYW5kICd1bmxvYWQnIG1vZHVsZQo+aG9va3MgYXJlIGV4ZWN1dGVkLgo+Cj5UbyBpbmNyZWFz
ZSBob3RwYXRjaGluZyBzeXN0ZW0ncyBhZ2lsaXR5IGFuZCBwcm92aWRlIG1vcmUgZmxleGlhYmxl
Cj5sb25nLXRlcm0gaG90cGF0Y2ggc29sdXRpb24sIGFsbG93IHRvIG92ZXJ3cml0ZSB0aGUgZGVm
YXVsdCBhcHBseQo+YW5kIHJldmVydCBhY3Rpb24gZnVuY3Rpb25zIHdpdGggaG9vay1saWtlIHN1
cHBsaWVkIGFsdGVybmF0aXZlcy4KPlRoZSBhbHRlcm5hdGl2ZSBmdW5jdGlvbnMgYXJlIG9wdGlv
bmFsIGFuZCB0aGUgZGVmYXVsdCBmdW5jdGlvbnMgYXJlCj51c2VkIGJ5IGRlZmF1bHQuCgpJcyB0
aGVyZSBzZW5zZSBpbiBoYXZpbmcgdGhlIG9sZCBvbmVzIGFueW1vcmU/IFdlIGNvdWxkIGp1c3Qg
cmVtb3ZlIHRoZW0gYWx0b2dldGhlciBhbmQganVzdCB1c2UgdGhlIG5ldyBvbmVzIGluc3RlYWQg
ZnJvbSB0aGUgc3RhcnQ/CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
