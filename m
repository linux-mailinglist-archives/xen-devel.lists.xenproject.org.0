Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0904103181
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 03:22:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXFZK-00049R-7B; Wed, 20 Nov 2019 02:18:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9J19=ZM=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iXFZI-00049M-R0
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 02:18:08 +0000
X-Inumbo-ID: fcb68260-0b3b-11ea-a306-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcb68260-0b3b-11ea-a306-12813bfff9fa;
 Wed, 20 Nov 2019 02:18:06 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAK24X2Z181187;
 Wed, 20 Nov 2019 02:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=9G5PYgfSL944ZXw/nmlGpJV4AlLW9xX6iVbMH4by4o0=;
 b=kuvxj/jCMp7q6sPG26J/YIw4BNUJsFsB3vQObcBX0SZKVg4dITdsmf+Y/5w29Rzlz+YJ
 ToJ9TCnavXWYDFMmY8kC+2UqL29HPUfWa2udL8Y4Uznn01SZUXCdNhmD8U1XvfIDrGkV
 dUobYLAZUvAn2ZigiISm/e5zDIV8xV7vSMqAkUYWonoZ+4OJmpmx6dkgAYoze0NRWocL
 GaOadZFQtB8kU1LjwK7eTh4x3XpKGz3iLknUDaBstwaR39gUWrS4IYHr3WI0Evu3Oy0b
 2ISokiURoLoVbM4tzhQDjtOjkjXjA6aYwOSMyUux6o5oZntMarGKsrq7gN5jFKFHh6s2 aw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2wa8httqx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 02:18:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAK24BTm059151;
 Wed, 20 Nov 2019 02:18:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2wcemcq090-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 02:18:03 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAK2I0kV007817;
 Wed, 20 Nov 2019 02:18:00 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 19 Nov 2019 18:18:00 -0800
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <d66b1da4-8096-9b77-1ca6-d6b9954b113c@suse.com>
 <09359c00-5769-0e0d-4af9-963897d3b498@suse.com>
 <40267a5b-8f1b-6463-72cd-f8f354c58bc4@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <6d70b8e0-7acd-d8ea-fa41-6866ae1ffef9@oracle.com>
Date: Tue, 19 Nov 2019 21:17:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <40267a5b-8f1b-6463-72cd-f8f354c58bc4@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9446
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911200019
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9446
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911200019
Subject: Re: [Xen-devel] Ping: [PATCH 0/2] x86/Xen/32: xen_iret_crit_fixup
 adjustments
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTkvMTkgMTI6NTAgUE0sIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAxMS8xOS8x
OSA3OjU4IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTEuMTEuMjAxOSAxNTozMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+PiBUaGUgZmlyc3QgcGF0Y2ggaGVyZSBmaXhlcyBhbm90aGVyIHJl
Z3Jlc3Npb24gZnJvbSAzYzg4YzY5MmMyODcKPj4+ICgieDg2L3N0YWNrZnJhbWUvMzI6IFByb3Zp
ZGUgY29uc2lzdGVudCBwdF9yZWdzIiksIGJlc2lkZXMgdGhlCj4+PiBvbmUgYWxyZWFkeSBhZGRy
ZXNzZWQgYnkKPj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAxOS0xMC9tc2cwMTk4OC5odG1sLgo+Pj4gVGhlIHNlY29uZCBwYXRjaCBpcyBh
IG1pbmltYWwgYml0IG9mIGNsZWFudXAgb24gdG9wLgo+Pj4KPj4+IDE6IG1ha2UgeGVuX2lyZXRf
Y3JpdF9maXh1cCBpbmRlcGVuZGVudCBvZiBmcmFtZSBsYXlvdXQKPj4+IDI6IHNpbXBsaWZ5IHhl
bl9pcmV0X2NyaXRfZml4dXAncyByaW5nIGNoZWNrCj4+IFNlZWluZyB0aGF0IHRoZSBvdGhlciBy
ZWdyZXNzaW9uIGZpeCBoYXMgYmVlbiB0YWtlbiBpbnRvIC10aXAsCj4+IHdoYXQgaXMgdGhlIHNp
dHVhdGlvbiBoZXJlPyBTaG91bGQgNS40IHJlYWxseSBzaGlwIHdpdGggdGhpcwo+PiBzdGlsbCB1
bmZpeGVkPwo+Cj4gSSBhbSBzdGlsbCB1bmFibGUgdG8gYm9vdCBhIDMyLWJpdCBndWVzdCB3aXRo
IHRob3NlIHBhdGNoZXMsIGNyYXNoaW5nIGluCj4gaW50M19leGNlcHRpb25fbm90aWZ5IHdpdGgg
cmVncy0+c3AgemVyby4KPgo+IFdoZW4gSSByZXZlcnQgdG8gM2M4OGM2OTJjMjg3IHRoZSBndWVz
dCBhY3R1YWxseSBib290cyBzbyBteSAoPykgcHJvYmxlbQo+IHdhcyBpbnRyb2R1Y2VkIHNvbWV3
aGVyZSBpbi1iZXR3ZWVuLgoKTmV2ZXJtaW5kIHRoaXMuIEkgZGlkbid0IHJlYWQgeW91ciBwYXRj
aGVzIGNvcnJlY3RseS4KCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
