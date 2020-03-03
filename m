Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2425D1778D7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 15:28:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j98Vf-00073n-9K; Tue, 03 Mar 2020 14:26:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Zr+=4U=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1j98Ve-00073h-59
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 14:26:58 +0000
X-Inumbo-ID: 0997066e-5d5b-11ea-a17c-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0997066e-5d5b-11ea-a17c-12813bfff9fa;
 Tue, 03 Mar 2020 14:26:57 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023EO8Fo130406;
 Tue, 3 Mar 2020 14:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=mime-version :
 message-id : date : from : to : cc : subject : content-type :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=u0CSvYIlGeK5t0KmkiaayxKDJlF2qyRGJtxm9c3Nqac=;
 b=c8YZJMVucWEV/dKql+wLQeWGEYZISeM1w2b1GUL2UNETGzTD6t47fmwt5OB+8l0gjPZp
 P+6t0gZPAhNhZZidjct/S/i6sILa3sGMGVrotXlNFt5psKOF09uf/Cu7aXzdWxn6KvuE
 Xd3hdi+Wr+0kj/U4aVdzcjZaHWaY6CKfOe7YE9cefzSv+EhQ/Db7uAKcqiI7LbWF1RvK
 lydNAIk4AE0WRaFDo6wFycm5/iNWc4tYgCLD1SoBXdiimxpA2ejgTpmhakFQwH0QwYF2
 ZB1uH7xkQm6tZiz2+S8LbOSZN9TwdyYWh8Usk80t0Fv8ZU4vMnLrTkVd1DlzaP6R38WS cQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2yffwqqg4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 14:26:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023EMd23129818;
 Tue, 3 Mar 2020 14:24:52 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2yg1rm22sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 14:24:52 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 023EOnX8026082;
 Tue, 3 Mar 2020 14:24:50 GMT
Received: from char.us.oracle.com (/10.152.32.25) by default (Oracle Beehive
 Gateway v4.0) with ESMTP ; Tue, 03 Mar 2020 06:23:39 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000) id DAF776A0129;
 Tue,  3 Mar 2020 09:27:25 -0500 (EST)
MIME-Version: 1.0
Message-ID: <20200303142724.17665-1-konrad.wilk@oracle.com>
Date: Tue, 3 Mar 2020 06:27:24 -0800 (PST)
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
X-Mailer: git-send-email 2.13.6
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030110
Subject: [Xen-devel] [PATCH] MAINTAINERS: Remove myself from REST and Public
 interfaces
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
Cc: xen-devel@lists.xenproject.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

LmR1ZSB0byAtRU5PVElNRS4gQmVlbiBidXN5IHdpdGggbWFuYWdlbWVudCBhbmQgaGF2ZSBoYWQK
bm90IG11Y2ggY2hhbmNlIHRvIGRvIGFueXRoaW5nIGJlc2lkZXMgdGhhdC4KClNpZ25lZC1vZmYt
Ynk6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KLS0tCiBN
QUlOVEFJTkVSUyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggZThiN2JlNTM3ZC4uZjNmYTBj
NzM1MSAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTQwMCw3
ICs0MDAsNiBAQCBGOgl4ZW4vZHJpdmVycy9jcHVmcmVxLwogRjoJeGVuL2luY2x1ZGUvYWNwaS9j
cHVmcmVxLwogCiBQVUJMSUMgSS9PIElOVEVSRkFDRVMgQU5EIFBWIERSSVZFUlMgREVTSUdOUwot
TToJS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgogTToJSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgogUzoJU3VwcG9ydGVkCiBGOgl4ZW4vaW5jbHVk
ZS9wdWJsaWMvaW8vCkBAIC02MDMsNyArNjAyLDYgQEAgTToJR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPgogTToJSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+CiBNOglKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiBNOglKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPgotTToJS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2ls
a0BvcmFjbGUuY29tPgogTToJU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgogTToJV2VpIExpdSA8d2xAeGVuLm9yZz4KIEw6CXhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwotLSAKMi4xMy42CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
