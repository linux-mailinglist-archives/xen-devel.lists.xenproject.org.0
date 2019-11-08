Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E8CF4C35
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 13:56:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT3lY-0001Lw-7A; Fri, 08 Nov 2019 12:53:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U++q=ZA=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iT3lX-0001Lr-6S
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 12:53:27 +0000
X-Inumbo-ID: c0f92336-0226-11ea-9631-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0f92336-0226-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 12:53:26 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA8CnL0r161752;
 Fri, 8 Nov 2019 12:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=0ukG+qNUolT6jTLSQd6brM8auZXhJs3nqPYpJUiV9c4=;
 b=K4CxdzvT0OCCSJFEF9z3tUWjap6BZZwswfiN/LWm7Jn5OoIIa2/OpZHA3hujCFKiqd9Q
 fHVYXprYZpEmlvzaAOaB4tiYRKltW0OOevBQRoeeHBL0JsK+gqq7W2bePOHgTdR2L+9E
 samDKZJVElgizBgD+ee7v/PZ4k6YC/wmgw8d2oTKMp9/eALQcZTHqQxUxeQc6jBXbp2L
 yQ5U0vTnbc1Q/zrU2kEdTZFca7tRd17G3rKL/cOe05Tf2m8dbgo7oQzetqyiDuD8/1ye
 SSsR4f1iEa+Nl8zvSisJcHd47AP+t6UlfkqvX4sy3crzplYTQhRn89KRcUUjVMx05bcB nA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2w41w1d50m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Nov 2019 12:53:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA8CmilX046841;
 Fri, 8 Nov 2019 12:53:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2w41wcnwvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Nov 2019 12:53:01 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA8CqtW4025702;
 Fri, 8 Nov 2019 12:52:57 GMT
Received: from tomti.i.net-space.pl (/10.175.202.125)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 08 Nov 2019 04:52:55 -0800
Date: Fri, 8 Nov 2019 13:52:48 +0100
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Borislav Petkov <bp@alien8.de>
Message-ID: <20191108125248.drmm7xakn7t7oyul@tomti.i.net-space.pl>
References: <20191104151354.28145-1-daniel.kiper@oracle.com>
 <20191104151354.28145-3-daniel.kiper@oracle.com>
 <20191108100930.GA4503@zn.tnic>
 <20191108104702.vwfmvehbeuza4j5w@tomti.i.net-space.pl>
 <20191108110703.GB4503@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108110703.GB4503@zn.tnic>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9434
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=951
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911080127
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9434
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911080128
Subject: Re: [Xen-devel] [PATCH v5 2/3] x86/boot: Introduce the
 kernel_info.setup_type_max
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
Cc: jgross@suse.com, corbet@lwn.net, linux-efi@vger.kernel.org,
 tglx@linutronix.de, konrad.wilk@oracle.com, ard.biesheuvel@linaro.org,
 peterz@infradead.org, ross.philipson@oracle.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, eric.snowberg@oracle.com, mingo@redhat.com,
 dave.hansen@linux.intel.com, rdunlap@infradead.org, luto@kernel.org,
 hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 kanth.ghatraju@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTI6MDc6MDNQTSArMDEwMCwgQm9yaXNsYXYgUGV0a292
IHdyb3RlOgo+IE9uIEZyaSwgTm92IDA4LCAyMDE5IGF0IDExOjQ3OjAyQU0gKzAxMDAsIERhbmll
bCBLaXBlciB3cm90ZToKPiA+IFllYWgsIHlvdSBhcmUgcmlnaHQuIFdvdWxkIHlvdSBsaWtlIG1l
IHRvIHJlcG9zdCB3aG9sZSBwYXRjaCBzZXJpZXMgb3IKPiA+IGNvdWxkIHlvdSBmaXggaXQgYmVm
b3JlIGNvbW1pdHRpbmc/Cj4KPiBMZW1tZSBmaW5pc2ggbG9va2luZyBhdCBwYXRjaCAzIGZpcnN0
Lgo+Cj4gSWYgeW91IGhhdmUgdG8gcmVzZW5kLCBwbGVhc2UgcmVtb3ZlICJUaGlzIHBhdGNoIiBh
bmQgIldlIiBpbiB5b3VyIHRleHQuCgpPSywgZ290IHlvdXIgY29tbWVudHMuIEkgd2lsbCByZXBv
c3QgdGhlIHBhdGNoIHNlcmllcyBwcm9iYWJseSBvbiBUdWVzZGF5LgpJIGhvcGUgdGhhdCBpdCB3
aWxsIGxhbmQgaW4gNS41IHRoZW4uCgpEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
