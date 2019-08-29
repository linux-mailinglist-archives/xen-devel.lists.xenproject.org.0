Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C9DA273B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 21:24:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3PzP-00021u-4w; Thu, 29 Aug 2019 19:21:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9sCI=WZ=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i3PzN-00021j-Ph
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 19:21:45 +0000
X-Inumbo-ID: 3cfa022e-ca92-11e9-ae73-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cfa022e-ca92-11e9-ae73-12813bfff9fa;
 Thu, 29 Aug 2019 19:21:45 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7TJIfwx051520;
 Thu, 29 Aug 2019 19:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=aztKrwAoPRpKI6Aax7SzURjeSUHeZqMmG0mTNVbTd4w=;
 b=BioNyo22U4XhJMz8ZVJgHc7Rhhl+lvjaAZkDXt7etvF/WF4bJ2VOQDD2AQaJTxu2+XFP
 1JAZkFCLW+bHidvLHapMe2KT3NDD6NzVqJsjS6IV305eLozc0TQBWh3V02lbhMym7rRB
 4UqV8nkl/SejxklYynz83a3mBNyCSBgDRAWAgMPbli16diMh2ktuMfbwZKG7flMfbxtu
 gRYTuB47KvWGLsMGDD83pP4SbHBHJMFEl0OIKGUVjq03s5S35yQMxu1yEAke+yRpgsur
 knEvVfLeOdJtHiJFTkuyVl5zJil0Ry3QbXp6aG4hkveZ9X52SbY79UlvyNW/WC80CJMW 9g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2upm9m86qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 19:21:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7TJI68b188481;
 Thu, 29 Aug 2019 19:21:26 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2uphau7n2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 19:21:26 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7TJLOPw029664;
 Thu, 29 Aug 2019 19:21:24 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 29 Aug 2019 12:21:24 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 182C76A013F; Thu, 29 Aug 2019 15:23:10 -0400 (EDT)
Date: Thu, 29 Aug 2019 15:23:10 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190829192310.GA23856@char.us.oracle.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827084624.116917-1-wipawel@amazon.de>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9364
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908290192
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9364
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908290192
Subject: Re: [Xen-devel] [PATCH v2 00/12] livepatch: new features and fixes
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
Cc: Tim Deegan <tim@xen.org>, wipawel@amazon.com,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 xen-devel@lists.xen.org, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBQYXdlbCBXaWVjem9ya2lld2ljeiAoMTIpOgo+ICAgWzFdIGxpdmVwYXRjaDogQWx3YXlzIGNo
ZWNrIGh5cGVydmlzb3IgYnVpbGQgSUQgdXBvbiBob3RwYXRjaCB1cGxvYWQKPiAgIFsyXSBsaXZl
cGF0Y2g6IEFsbG93IHRvIG92ZXJyaWRlIGludGVyLW1vZHVsZXMgYnVpbGRpZCBkZXBlbmRlbmN5
Cj4gICBbM10gbGl2ZXBhdGNoOiBFeHBvcnQgcGF5bG9hZCBzdHJ1Y3R1cmUgdmlhIGxpdmVwYXRj
aF9wYXlsb2FkLmgKPiAgIFs0XSBsaXZlcGF0Y2g6IEltcGxlbWVudCBwcmUtfHBvc3QtIGFwcGx5
fHJldmVydCBob29rcwo+ICAgWzVdIGxpdmVwYXRjaDogQWRkIHN1cHBvcnQgZm9yIGFwcGx5fHJl
dmVydCBhY3Rpb24gcmVwbGFjZW1lbnQgaG9va3MKPiAgIFs2XSBsaXZlcGF0Y2g6IERvIG5vdCBl
bmZvcmNlIEVMRl9MSVZFUEFUQ0hfRlVOQyBzZWN0aW9uIHByZXNlbmNlCj4gICBbN10gbGl2ZXBh
dGNoOiBBZGQgcGVyLWZ1bmN0aW9uIGFwcGxpZWQvcmV2ZXJ0ZWQgc3RhdGUgdHJhY2tpbmcgbWFy
a2VyCgpJJ3ZlIGFkZGVkIHRoZSB0ZXN0LWNhc2VzIHRvIHRoZSBsaXR0bGUgdG9vbCBJIHVzZSAo
aW5jbHVkaW5nIHRoZSBkaWZmKQpodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW50
ZXN0dG9vbHMvYm9vdHN0cmFwLmdpdDthPWJsb2I7Zj1yb290X2ltYWdlL2RlYnVnc3BhY2UvbGl2
ZXBhdGNoX3Rlc3QucGw7aD0zN2ZiNjY4YTUzY2ExZTdhMDg0YmZjNDQxN2Y5MGU4YWUwNzhmN2U1
O2hiPUhFQUQKCgo+ICAgWzhdIGxpdmVwYXRjaDogQWRkIHN1cHBvcnQgZm9yIGlubGluZSBhc20g
aG90cGF0Y2hpbmcgZXhwZWN0YXRpb25zCgouLmJ1dCBkaWRuJ3QgZXhwYW5kIG9uICM4IGFzIGl0
IHN0aWxsIG5lZWRzIGEgYml0IG9mIGhlbHAgb24gQVJNLi4KCklycmVzcGVjdGl2ZSBvZiB0aGF0
OgoKYSkgIE5lZWQgdG8gdXBkYXRlIHRoZSBkb2NzIHRvIGFsdGVyIHRoZSB0ZXh0IHdoZXJlIGl0
IHNheXMgdGhhdCB0aGUKZW50cmllcyBhcmUgOCBieXRlcyBsb25nIC0gYXMgb24gQVJNMzIgdGhl
eSBhcmUgNCBieXRlcy4KCmIpIFVwZGF0ZSB0aGUgZG9jcyB0byBzYXkgaXQgaXMgc3BlYyAyLCBu
b3QgMS4KCmMpIEFsc28gbmVlZCBPSyBvciBBY2tlZC1ieSBmcm9tIEp1bGllIG9uIEFSTS4KCkkg
Y2FuIGRvIGEpIGFuZCBiKSB3aGVuIHYzIGlzIHBvc3RlZCBvciB3aGVuIHRoZSBmaXhlcyBmb3Ig
dG8gcGF0Y2ggIzggYXJlCmFsbCBnb29kIGFuZCBjYW4gc3F1YXNoIHRoZW0gaW4uIChBbmQgd2ls
bCBhbHNvIHVwZGF0ZSB0aGUgdGVzdC1jYXNlIHRvCmluY2x1ZGUgdGhlIGNvZGUgY2hhbmdlIGZv
ciB0aGUgYXNtIGxpdmVwYXRjaCkuCgpkaWZmIC0tZ2l0IGEvcm9vdF9pbWFnZS9kZWJ1Z3NwYWNl
L2xpdmVwYXRjaF90ZXN0LnBsIGIvcm9vdF9pbWFnZS9kZWJ1Z3NwYWNlL2xpdmVwYXRjaF90ZXN0
LnBsCmluZGV4IDM3ZmI2NjguLmE5NmM5ZmMgMTAwNzU1Ci0tLSBhL3Jvb3RfaW1hZ2UvZGVidWdz
cGFjZS9saXZlcGF0Y2hfdGVzdC5wbAorKysgYi9yb290X2ltYWdlL2RlYnVnc3BhY2UvbGl2ZXBh
dGNoX3Rlc3QucGwKQEAgLTksNyArOSwxNCBAQCB1c2UgRmlsZTo6VGVtcCBxdyh0ZW1wZmlsZSk7
CiBteSBAbGl2ZXBhdGNoX2ZpbGVzID0gcXcoeGVuX2hlbGxvX3dvcmxkLmxpdmVwYXRjaAogCQkJ
IHhlbl9yZXBsYWNlX3dvcmxkLmxpdmVwYXRjaAogICAgICAgICAgICAgICAgICAgICAgICAgIHhl
bl9ieWVfd29ybGQubGl2ZXBhdGNoCi0JCQkgeGVuX25vcC5saXZlcGF0Y2gpOworCQkJIHhlbl9u
b3AubGl2ZXBhdGNoCisJCQkgeGVuX25vX3hlbl9idWlsZGlkLmxpdmVwYXRjaAorCQkJIHhlbl9w
cmVwb3N0X2hvb2tzX2ZhaWwubGl2ZXBhdGNoCisJCQkgeGVuX3ByZXBvc3RfaG9va3MubGl2ZXBh
dGNoCisJCQkgeGVuX2FjdGlvbl9ob29rcy5saXZlcGF0Y2gKKwkJCSB4ZW5fYWN0aW9uX2hvb2tz
X21hcmtlci5saXZlcGF0Y2gKKwkJCSB4ZW5fYWN0aW9uX2hvb2tzX25vYXBwbHkubGl2ZXBhdGNo
CisJCQkgeGVuX2FjdGlvbl9ob29rc19ub3JldmVydC5saXZlcGF0Y2gpOwogCiBteSAkbGl2ZXBh
dGNoX2Rpcj0iL3Vzci9saWIvZGVidWcvbGl2ZXBhdGNoIjsKIG15ICR4ZW5fZXh0cmFfaW5mbzsK
QEAgLTExMSw2ICsxMTgsMjUgQEAgbXkgQGxpdmVwYXRjaF90ZXN0cyA9ICgKICAgICB7IEMgPT4g
Inhlbi1saXZlcGF0Y2ggdW5sb2FkIHhlbl9ub3AiLCByYyA9PiAyNTYgfSwKICAgICB7IEMgPT4g
Inhlbi1saXZlcGF0Y2ggcmV2ZXJ0IHhlbl9ub3AiIH0sCiAgICAgeyBDID0+ICJ4ZW4tbGl2ZXBh
dGNoIHVubG9hZCB4ZW5fbm9wIiB9LAorICAgIHsgQyA9PiAieGVuLWxpdmVwYXRjaCBsb2FkIHhl
bl9ub194ZW5fYnVpbGRpZC5saXZlcGF0Y2giLCByYyA9PiAyNTYgfSwKKyAgICB7IEMgPT4gInhl
bi1saXZlcGF0Y2ggbG9hZCB4ZW5fcHJlcG9zdF9ob29rc19mYWlsLmxpdmVwYXRjaCIsIHJjID0+
IDI1NiB9LAorICAgIHsgQyA9PiAieGVuLWxpdmVwYXRjaCBsb2FkIHhlbl9wcmVwb3N0X2hvb2tz
LmxpdmVwYXRjaCIgfSwKKyAgICAjIEZpcnN0IHJldmVydCBmYWlscworICAgIHsgQyA9PiAieGVu
LWxpdmVwYXRjaCByZXZlcnQgeGVuX3ByZXBvc3RfaG9va3MiLCByYyA9PiAyNTYgfSwKKyAgICB7
IEMgPT4gInhlbi1saXZlcGF0Y2ggcmV2ZXJ0IHhlbl9wcmVwb3N0X2hvb2tzIiB9LAorICAgIHsg
QyA9PiAieGVuLWxpdmVwYXRjaCB1bmxvYWQgeGVuX3ByZXBvc3RfaG9va3MiIH0sCisgICAgeyBD
ID0+ICJ4ZW4tbGl2ZXBhdGNoIGxvYWQgeGVuX2FjdGlvbl9ob29rcy5saXZlcGF0Y2giIH0sCisg
ICAgeyBDID0+ICJ4ZW4tbGl2ZXBhdGNoIHJldmVydCB4ZW5fYWN0aW9uX2hvb2tzIiB9LAorICAg
IHsgQyA9PiAieGVuLWxpdmVwYXRjaCB1bmxvYWQgeGVuX2FjdGlvbl9ob29rcyIgfSwKKyAgICB7
IEMgPT4gInhlbi1saXZlcGF0Y2ggbG9hZCB4ZW5fYWN0aW9uX2hvb2tzX21hcmtlci5saXZlcGF0
Y2giIH0sCisgICAgeyBDID0+ICJ4ZW4tbGl2ZXBhdGNoIHJldmVydCB4ZW5fYWN0aW9uX2hvb2tz
X21hcmtlciIgfSwKKyAgICB7IEMgPT4gInhlbi1saXZlcGF0Y2ggdW5sb2FkIHhlbl9hY3Rpb25f
aG9va3NfbWFya2VyIiB9LAorICAgIHsgQyA9PiAieGVuLWxpdmVwYXRjaCBsb2FkIHhlbl9hY3Rp
b25faG9va3Nfbm9hcHBseS5saXZlcGF0Y2giIH0sCisgICAgeyBDID0+ICJ4ZW4tbGl2ZXBhdGNo
IHJldmVydCB4ZW5fYWN0aW9uX2hvb2tzX25vYXBwbHkiIH0sCisgICAgeyBDID0+ICJ4ZW4tbGl2
ZXBhdGNoIHVubG9hZCB4ZW5fYWN0aW9uX2hvb2tzX25vYXBwbHkiIH0sCisgICAgeyBDID0+ICJ4
ZW4tbGl2ZXBhdGNoIGxvYWQgeGVuX2FjdGlvbl9ob29rc19ub3JldmVydC5saXZlcGF0Y2giIH0s
CisgICAgeyBDID0+ICJ4ZW4tbGl2ZXBhdGNoIHJldmVydCB4ZW5fYWN0aW9uX2hvb2tzX25vcmV2
ZXJ0IiB9LAorICAgIHsgQyA9PiAieGVuLWxpdmVwYXRjaCB1bmxvYWQgeGVuX2FjdGlvbl9ob29r
c19ub3JldmVydCIgfSwKICAgICApOwogCiAjIENvcGllZCBmcm9tIGh0dHBzOi8vc3RhY2tvdmVy
Zmxvdy5jb20vcXVlc3Rpb25zLzExNTE0OTQ3L2NhcHR1cmUtdGhlLW91dHB1dC1vZi1wZXJsLXN5
c3RlbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
