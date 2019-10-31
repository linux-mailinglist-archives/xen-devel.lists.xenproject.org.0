Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA3FEB33C
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 15:55:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQBoN-0005L9-Vm; Thu, 31 Oct 2019 14:52:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VXij=YY=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1iQBoM-0005L4-96
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 14:52:30 +0000
X-Inumbo-ID: 0f38d71a-fbee-11e9-beca-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f38d71a-fbee-11e9-beca-bc764e2007e4;
 Thu, 31 Oct 2019 14:52:29 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9VEieJj177426;
 Thu, 31 Oct 2019 14:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=o5krB7Sd/VIGdEEZtHpiIRHHHruXS7PMuNlRTnp6es0=;
 b=dncPJDAu221Q/utOUVKPwk1bYlsO896r3z1BRZ+dVMmV/5DSxghF1j+Hs4HqRfta+9Du
 HXeN2ka/xoDPuhLOTIgXofhTzOjMN8paLX655HmHyD9g6hNu5kRDzmd63BK5RcnevexJ
 PrCDst8QNANAHTp3YIXhskS0Rpi2hN6O03VheQv4CKuSJZAlF/HnDFtBaeMIbszZcvS3
 29k6xrpU+lGhT4oCi62N66cl/7kPaeSnv7g4flyRi0yNAbfy9YpBtQkLeCdc1nfTqA2t
 CM8CuRJzaHIJOJGZxTf8pdwCmM83k7tikMUTsdoq/d7bttjH64E6VP5sshPpZS8wJNcD +Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2vxwhfut46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Oct 2019 14:52:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9VEimbY105533;
 Thu, 31 Oct 2019 14:52:26 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2vyqpe8suf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Oct 2019 14:52:26 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9VEqONt019485;
 Thu, 31 Oct 2019 14:52:24 GMT
Received: from [10.211.46.60] (/10.211.46.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 31 Oct 2019 07:52:24 -0700
To: Jan Beulich <jbeulich@suse.com>
References: <20191009125252.3112-1-roger.pau@citrix.com>
 <c42e0852-2eb5-63e8-f542-b4f5d4a1e0a8@oracle.com>
 <20191030082428.GW17494@Air-de-Roger>
 <7cd007b2-8980-bac3-cd5c-812dcf2c1c61@oracle.com>
 <20191030172313.GX17494@Air-de-Roger>
 <35c7a91d-1c46-e99e-5f9c-60d9e17721bf@oracle.com>
 <83625673-5e84-20ba-b7bf-e3e527eecbc0@suse.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <b61f1b50-c050-2482-527e-f7740058b5f9@oracle.com>
Date: Thu, 31 Oct 2019 07:52:23 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <83625673-5e84-20ba-b7bf-e3e527eecbc0@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9426
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910310152
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9426
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910310152
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMzEvMTkgMTowMSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMTAuMjAxOSAx
OTowMSwgSm9lIEppbiB3cm90ZToKPj4gT24gMTAvMzAvMTkgMTA6MjMgQU0sIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6Cj4+PiBPbiBXZWQsIE9jdCAzMCwgMjAxOSBhdCAwOTozODoxNkFNIC0wNzAw
LCBKb2UgSmluIHdyb3RlOgo+Pj4+IE9uIDEwLzMwLzE5IDE6MjQgQU0sIFJvZ2VyIFBhdSBNb25u
w6kgd3JvdGU6Cj4+Pj4+IENhbiB5b3UgdHJ5IHRvIGFkZCB0aGUgZm9sbG93aW5nIGRlYnVnIHBh
dGNoIG9uIHRvcCBvZiB0aGUgZXhpc3RpbmcKPj4+Pj4gb25lIGFuZCByZXBvcnQgdGhlIG91dHB1
dCB0aGF0IHlvdSBnZXQgb24gdGhlIFhlbiBjb25zb2xlPwo+Pj4+Cj4+Pj4gQXBwbGllZCBkZWJ1
ZyBwYXRjaCBhbmQgcnVuIHRoZSB0ZXN0IGFnYWluLCBub3Qgb2YgYW55IGxvZyBwcmludGVkLAo+
Pj4+IGF0dGFjaGVkIFhlbiBsb2cgb24gc2VyaWFsIGNvbnNvbGUsIHNlZW1zIHBpX3VwZGF0ZV9p
cnRlKCkgbm90IGJlZW4KPj4+PiBjYWxsZWQgZm9yIGlvbW11X2ludHBvc3Qgd2FzIGZhbHNlLgo+
Pj4KPj4+IEkgaGF2ZSB0byBhZG1pdCBJJ20gbG9zdCBhdCB0aGlzIHBvaW50LiBEb2VzIGl0IG1l
YW4gdGhlIG9yaWdpbmFsCj4+PiBpc3N1ZSBoYWQgbm90aGluZyB0byBkbyB3aXRoIHBvc3RlZCBp
bnRlcnJ1cHRzPwo+Pgo+PiBMb29rcyB3aGVuIGluamVjdCBpcnEgYnkgdmxhcGljX3NldF9pcnEo
KSwgaXQgY2hlY2tlZCBieQo+PiBodm1fZnVuY3MuZGVsaXZlcl9wb3N0ZWRfaW50ciByYXRoZXIg
dGhhbiBpb21tdV9pbnRwb3N0Ogo+Pgo+PiAgMTc2ICAgICBpZiAoIGh2bV9mdW5jcy5kZWxpdmVy
X3Bvc3RlZF9pbnRyICkKPj4gIDE3NyAgICAgICAgIGh2bV9mdW5jcy5kZWxpdmVyX3Bvc3RlZF9p
bnRyKHRhcmdldCwgdmVjKTsKPj4KPj4gQW5kIGRlbGl2ZXJfcG9zdGVkX2ludHIoKSB3b3VsZCBi
ZSB0aGVyZSwgd2hlbiB2bXggZW5hYmxlZDoKPj4KPj4gKFhFTikgSFZNOiBWTVggZW5hYmxlZAo+
PiAoWEVOKSBIVk06IEhhcmR3YXJlIEFzc2lzdGVkIFBhZ2luZyAoSEFQKSBkZXRlY3RlZAo+PiAo
WEVOKSBIVk06IEhBUCBwYWdlIHNpemVzOiA0a0IsIDJNQiwgMUdCCj4gCj4gSSBjYW4ndCBzZWUg
dGhlIGNvbm5lY3Rpb24uIHN0YXJ0X3ZteCgpIGhhcwo+IAo+ICAgICBpZiAoIGNwdV9oYXNfdm14
X3Bvc3RlZF9pbnRyX3Byb2Nlc3NpbmcgKQo+ICAgICB7Cj4gICAgICAgICBhbGxvY19kaXJlY3Rf
YXBpY192ZWN0b3IoJnBvc3RlZF9pbnRyX3ZlY3RvciwgcGlfbm90aWZpY2F0aW9uX2ludGVycnVw
dCk7Cj4gICAgICAgICBpZiAoIGlvbW11X2ludHBvc3QgKQo+ICAgICAgICAgICAgIGFsbG9jX2Rp
cmVjdF9hcGljX3ZlY3RvcigmcGlfd2FrZXVwX3ZlY3RvciwgcGlfd2FrZXVwX2ludGVycnVwdCk7
Cj4gCj4gICAgICAgICB2bXhfZnVuY3Rpb25fdGFibGUuZGVsaXZlcl9wb3N0ZWRfaW50ciA9IHZt
eF9kZWxpdmVyX3Bvc3RlZF9pbnRyOwo+ICAgICAgICAgdm14X2Z1bmN0aW9uX3RhYmxlLnN5bmNf
cGlyX3RvX2lyciAgICAgPSB2bXhfc3luY19waXJfdG9faXJyOwo+ICAgICAgICAgdm14X2Z1bmN0
aW9uX3RhYmxlLnRlc3RfcGlyICAgICAgICAgICAgPSB2bXhfdGVzdF9waXI7Cj4gICAgIH0KPiAK
PiBpLmUuIHRoZSBob29rIGlzIHByZXNlbnQgb25seSB3aGVuIHBvc3RlZCBpbnRlcnJ1cHRzIGFy
ZQo+IGF2YWlsYWJsZSBpbiBnZW5lcmFsLiBJLmUuIGFsc28gd2l0aCBqdXN0IENQVS1zaWRlIHBv
c3RlZAo+IGludGVycnVwdHMsIHllcywgd2hpY2ggZ2V0cyBjb25maXJtZWQgYnkgeW91ciAiYXBp
Y3Y9MCIKPiB0ZXN0LiBZZXQgd2l0aCBqdXN0IENQVS1zaWRlIHBvc3RlZCBpbnRlcnJ1cHRzIEkn
bQo+IHN0cnVnZ2xpbmcgYWdhaW4gdG8gdW5kZXJzdGFuZCB5b3VyIG9yaWdpbmFsIHByb2JsZW0K
PiBkZXNjcmlwdGlvbiwgYW5kIHRoZSBuZWVkIHRvIGZpZGRsZSB3aXRoIElPTU1VIHNpZGUgY29k
ZS4KClllcywgb24gbXkgdGVzdCBlbnYsIGNwdV9oYXNfdm14X3Bvc3RlZF9pbnRyX3Byb2Nlc3Np
bmcgPT0gdHJ1ZSAmJiBpb21tdV9pbnRwb3N0ID09IGZhbHNlLAp3aXRoIHRoaXMsIHBvc3RlZCBp
bnRlcnJ1cHRzIGJlZW4gZW5hYmxlZC4KClRoYW5rcywKSm9lCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
