Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA62B479E6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 08:13:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hckph-0000zP-Hz; Mon, 17 Jun 2019 06:09:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L/9J=UQ=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hckpf-0000zK-BS
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 06:09:31 +0000
X-Inumbo-ID: 779d28e7-90c6-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 779d28e7-90c6-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 06:09:30 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5H64Lsi130933;
 Mon, 17 Jun 2019 06:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=grdh29BU5yPRUROUC1gK19xRI+enCyZKgEFK2tTBSUk=;
 b=r55Olug45CBi7UUK63b+i0uGwVL2OZxoTNQDJNqyv5qxve3Nv3Sjvv8XFA1+ev5CFjym
 8/iFWQtWiDQEWGZ9HVExOIZhW4Di9BT4MXx4Wr3e0zMZ8qskkatJgRIdZwQPgwfe3WAf
 dkRVSdtEF17G38I35GrioUvENz9ewK19+O3gQiNAaTfZFayOw6hvsCrQ2tsc64E3jz0e
 /OYhraHsoetNaAhLf7xpIJiW3nMHgmvWYVfXrTQfZZjibIMbVapybEP623SR2G1oPB+k
 zGP6twlX1njC0FciqjV+u3dy9gPQswM1W/aatT2j8ujVE2zEM7psbNFDXZoABXnOYsqj Zg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2t4r3tcgv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 06:09:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5H695oe117917;
 Mon, 17 Jun 2019 06:09:28 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2t5h5sybe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 06:09:27 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5H69QdH022783;
 Mon, 17 Jun 2019 06:09:26 GMT
Received: from [192.168.0.110] (/70.36.60.91)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 16 Jun 2019 23:09:26 -0700
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-10-ankur.a.arora@oracle.com>
 <c91abc40-03e3-2ebd-a878-b251a97869db@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <be7c4638-6677-9ed1-7d68-539898b90b2a@oracle.com>
Date: Sun, 16 Jun 2019 23:09:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c91abc40-03e3-2ebd-a878-b251a97869db@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9290
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9290
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170057
Subject: Re: [Xen-devel] [RFC PATCH 09/16] xen/evtchn: support evtchn in
 xenhost_t
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wNi0xNCA1OjA0IGEubS4sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDkuMDUu
MTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+PiBMYXJnZWx5IG1lY2hhbmljYWwgcGF0Y2gg
dGhhdCBhZGRzIGEgbmV3IHBhcmFtLCB4ZW5ob3N0X3QgKiB0byB0aGUKPj4gZXZ0Y2huIGludGVy
ZmFjZXMuIFRoZSBldnRjaG4gcG9ydCBpbnN0ZWFkIG9mIGJlaW5nIGRvbWFpbiB1bmlxdWUsIGlz
Cj4+IG5vdyBzY29wZWQgdG8geGVuaG9zdF90Lgo+Pgo+PiBBcyBwYXJ0IG9mIHVwY2FsbCBoYW5k
bGluZyB3ZSBub3cgbG9vayBhdCBhbGwgdGhlIHhlbmhvc3RzIGFuZCwgZm9yCj4+IGV2dGNobl8y
bCwgdGhlIHhlbmhvc3QncyBzaGFyZWRfaW5mbyBhbmQgdmNwdV9pbmZvLiBPdGhlciB0aGFuIHRo
aXMKPj4gZXZlbnQgaGFuZGxpbmcgaXMgbGFyZ2xleSB1bmNoYW5nZWQuCj4+Cj4+IE5vdGUgdGhh
dCB0aGUgSVBJLCB0aW1lciwgVklSUSwgRlVOQ1RJT04sIFBNVSBldGMgdmVjdG9ycyByZW1haW4K
Pj4gYXR0YWNoZWQgdG8geGhfZGVmYXVsdC4gT25seSBpbnRlcmRvbWFpbiBldnRjaG5zIGFyZSBh
bGxvd2FibGUgYXMKPj4geGhfcmVtb3RlLgo+IAo+IEknZCBkbyBvbmx5IHRoZSBpbnRlcmZhY2Ug
Y2hhbmdlcyBmb3Igbm93IChpbmNsdWRpbmcgZXZ0Y2huIEZJRk8pLgpMb29raW5nIGF0IHRoaXMg
cGF0Y2ggYWdhaW4sIGl0IHNlZW1zIHRvIG1lIHRoYXQgaXQgd291bGQgYmUgYmVzdCB0bwpsaW1p
dCB0aGUgaW50ZXJmYWNlIGNoYW5nZSAodG8gdGFrZSB0aGUgeGVuaG9zdF90ICogcGFyYW1ldGVy
KSBvbmx5IHRvCmJpbmRfaW50ZXJkb21haW5fKi4gVGhhdCBhbHNvIGhhcHBpbHkgbGltaXRzIHRo
ZSBjaGFuZ2UgdG8gdGhlIGRyaXZlcnMvCnN1YnRyZWUuCgo+IAo+IFRoZSBtYWluIGRpZmZlcmVu
Y2Ugd2lsbCBiZSBob3cgdG8gY2FsbCB0aGUgaHlwZXJ2aXNvciBmb3Igc2VuZGluZyBhbgo+IGV2
ZW50IChlaXRoZXIgZGlyZWN0IG9yIHZpYSBhIHBhc3N0aHJvdWdoLWh5cGVyY2FsbCkuClllYWgs
IHRob3VnaCwgdGhpcyB3b3VsZCBkZXBlbmQgb24gaG93IHRoZSBldnRjaG5zIGFyZSBtYXBwZWQg
KGlmIGl0J3MKdGhlIEwxLVhlbiB3aGljaCBpcyByZXNwb25zaWJsZSBmb3IgbWFwcGluZyB0aGUg
ZXZ0Y2huIG9uIGJlaGFsZiBvZiB0aGUgCkwwLVhlbiwgdGhlbiBub3RpZnlfcmVtb3RlX3ZpYV9l
dnRjaG4oKSBjb3VsZCBqdXN0IHN0YXkgdGhlIHNhbWUuKQpTdGlsbCwgSSdsbCBhZGQgYSBzZW5k
IGludGVyZmFjZSAocGVyaGFwcyBqdXN0IGFuIGlubGluZSBmdW5jdGlvbikgdG8KdGhlIHhlbmhv
c3QgaW50ZXJmYWNlIGZvciB0aGlzLgoKQW5rdXIKCj4gCj4gCj4gSnVlcmdlbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
