Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8402D1047E0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 02:10:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXavp-0000yL-JA; Thu, 21 Nov 2019 01:06:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6lIY=ZN=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1iXavo-0000yG-7X
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 01:06:48 +0000
X-Inumbo-ID: 304728f4-0bfb-11ea-a31e-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 304728f4-0bfb-11ea-a31e-12813bfff9fa;
 Thu, 21 Nov 2019 01:06:46 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAL0x5tn085619;
 Thu, 21 Nov 2019 01:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=nYTYe2hns2qFKaAxFdlErQQWQqnVekyAzY/OJha3Ny4=;
 b=SY10mCMeyqzRXnACFytmFYkWUuWIIkMpBJrH0SzqyiGsZXcBZljog3nAPthh9viytSM5
 oEYwsYABeFqpoSR3kXSsVYoPwtJk80BerJaCXVcVVMwb8t1C5WcMeNhTgXRk6ftoHKiw
 kwFo5fcdL6CdHpwlzha2dMbOQP6PJPRULRNMUvdjwHDE38jf6S92RcWC5A1asZUijmPe
 mL2FqyRrOe9vLHUWzW1tNUZ/zFmeWKR+ffSMl8b2NdHrZm141/ZTtY90I9EgXW5t+onc
 CLm0bqNaJpspc1QMZT9i8eDxZTnbYf7BSmeW72tOSOkgD4tvGzE4dakYnnvPN/wo99q7 MA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2wa9rqrxmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Nov 2019 01:06:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAL13a59084060;
 Thu, 21 Nov 2019 01:06:38 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2wd46xceqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Nov 2019 01:06:38 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAL16YCl021459;
 Thu, 21 Nov 2019 01:06:36 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 20 Nov 2019 17:06:34 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id DA63B6A011D; Wed, 20 Nov 2019 20:09:59 -0500 (EST)
Date: Wed, 20 Nov 2019 20:09:59 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
Message-ID: <20191121010959.GA10410@char.us.oracle.com>
References: <20191114130653.51185-1-wipawel@amazon.de>
 <20191120022543.GA383@char.us.oracle.com>
 <7F0CE196-9FE7-43B9-B311-6EA0647338A4@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7F0CE196-9FE7-43B9-B311-6EA0647338A4@amazon.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9447
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911210006
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9447
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911210006
Subject: Re: [Xen-devel] [PATCH v5 00/12] livepatch: new features and fixes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBZZXMsIHRoaXMgaHVuayBpcyBtaXNzaW5nIChzb21laG93IGl0IGRpZCBub3QgbWFrZSBpdCB0
byB0aGUgdjUgcGF0Y2hzZXQsIHNvcnJ5KToKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMv
eGNfbWlzYy5jIGIvdG9vbHMvbGlieGMveGNfbWlzYy5jCj4gaW5kZXggNzc0N2VhODNhYS4uMGIy
MWE2YWNhNCAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4Yy94Y19taXNjLmMKPiArKysgYi90b29s
cy9saWJ4Yy94Y19taXNjLmMKPiBAQCAtOTc2LDYgKzk3Niw3IEBAIHN0YXRpYyBpbnQgX3hjX2xp
dmVwYXRjaF9hY3Rpb24oeGNfaW50ZXJmYWNlICp4Y2gsCj4gICAgICBzeXNjdGwudS5saXZlcGF0
Y2gudS5hY3Rpb24uY21kID0gYWN0aW9uOwo+ICAgICAgc3lzY3RsLnUubGl2ZXBhdGNoLnUuYWN0
aW9uLnRpbWVvdXQgPSB0aW1lb3V0Owo+ICAgICAgc3lzY3RsLnUubGl2ZXBhdGNoLnUuYWN0aW9u
LmZsYWdzID0gZmxhZ3M7Cj4gKyAgICBzeXNjdGwudS5saXZlcGF0Y2gudS5hY3Rpb24ucGFkID0g
MDsKPiAKPiAgICAgIHN5c2N0bC51LmxpdmVwYXRjaC51LmFjdGlvbi5uYW1lID0gZGVmX25hbWU7
Cj4gICAgICBzZXRfeGVuX2d1ZXN0X2hhbmRsZShzeXNjdGwudS5saXZlcGF0Y2gudS5hY3Rpb24u
bmFtZS5uYW1lLCBuYW1lKTsKClRoYXQgZGlkIGl0ISBXaXRoIHRoYXQgSSBjYW4gdGVzdCB0aGUg
bGl2ZXBhdGNoZXMgb24gQVJNWzMyLDY0XS4KCkxldCBtZSBzcXVhc2ggdGhhdCBpbiAibGl2ZXBh
dGNoOiBBbGxvdyB0byBvdmVycmlkZSBpbnRlci1tb2R1bGVzIGJ1aWxkaWQgZGVwZW5kZW5jeSIK
ClNlZToKaHR0cHM6Ly9naXRodWIuY29tL2tvbnJhZHdpbGsveGVuLmdpdCAgI2xpdmVwYXRjaC5h
d3MudjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
