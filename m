Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A10ADE7B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 10:55:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL21L-000441-3q; Mon, 29 Apr 2019 08:52:19 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.108])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <daniel.kiper@oracle.com>) id 1hL21J-00043w-BI
 for xen-devel@lists.xensource.com; Mon, 29 Apr 2019 08:52:17 +0000
Received: from [46.226.52.196] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 23/B2-19699-04BB6CC5;
 Mon, 29 Apr 2019 08:52:16 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-15.tower-284.messagelabs.com: domain of oracle.com designates 
 156.151.31.86 as permitted sender) smtp.mailfrom=oracle.com; dkim=pass 
 (good signature) header.i=@oracle.com header.s=corp-2018-07-02; 
 dmarc=pass (p=none adkim=r aspf=r) header.from=oracle.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRWlGSWpSXmKPExsUyZ7p8mK7D7mM
 xBttDLe5Nec/uwOixvW8XewBjFGtmXlJ+RQJrxoSnkxkLOpUrzr4RamDcJd3FyMUhJLCCUeLF
 7KcsIA6LwE0WiQkvHrBBZF4xSrTM/8gKV/b4zg52COc1o8TMOWehyjYySkxb/IwJwulhlLjd+
 xJoGifQNFWJ5ocHWUFsNgEdiYtfHgK1c3CICChLPD+tBVLPLHCVSWJN421mkBphAVOJ7jstbC
 A2r4CTxML9X1kghq5ikVh29CRUQlDi5MwnYAuYBbQkbvx7yQQylFlAWmL5Pw4Qk1NAW2LnyXy
 QClEBFYnOpXPAqiUEQiVevDkEdrSEwAQmiR1rrrFjSgAdtL3tA+MERvFZSNbNQrJuFsK6BYzM
 qxgtkooy0zNKchMzc3QNDQx0DQ2NdA0tzXQNzYz1Eqt0k/RSS3XLU4tLdA31EsuL9Yorc5NzU
 vTyUks2MQLjLaXgyOIdjK+Wpx9ilORgUhLlXbrtaIwQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd
 77O4/FCAkWpaanVqRl5gAjHyYtwcGjJMJ7EiTNW1yQmFucmQ6ROsVoz/Gl/dFcZo45rc+AZN9
 GEPmw9fNcZiGWvPy8VClx3t8gbQIgbRmleXBDYYnqEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEO
 RiVh3v8gU3gy80rgdgPTD9BHIrzx88DOKklESEk1MKpx6n5acu3Ci2X6mUlmbq//H3podmX3P
 d4LF5Satqn8lUpgFQ6zdV2fzMdiIOn+4/lMA10203LHlQ5fDvQtTNzQqtPWrvdWU5CB+/gTSe
 9Y1dDTaurhd+U+tGi/FyrOWy79stnGbP/VZTLnKiUzNkwpWc5WEJvHO7XMJmybmADr6189zLP
 0lViKMxINtZiLihMBP/k6aU8DAAA=
X-Env-Sender: daniel.kiper@oracle.com
X-Msg-Ref: server-15.tower-284.messagelabs.com!1556527934!7658377!1
X-Originating-IP: [156.151.31.86]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: , UNPARSEABLE_RELAY
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17251 invoked from network); 29 Apr 2019 08:52:15 -0000
Received: from userp2130.oracle.com (HELO userp2130.oracle.com) (156.151.31.86)
 by server-15.tower-284.messagelabs.com with AES256-GCM-SHA384 encrypted SMTP;
 29 Apr 2019 08:52:15 -0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3T8iGMC022383;
 Mon, 29 Apr 2019 08:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=SVl/P3ZzSV2RdaruQFC59F43LH9VrF8ISHT5DBnTVDI=;
 b=mtozeoxdlR4y7yYJNw9o/xMCTRZn+geqozdgKqwVV+gYWKB5hct+1lnnH9l7OHurIjDY
 rMomHizLXo09vCJx0/qqrDDAEI+tFp+p+uVuYu52m7igmZTVVg4d3a/nFtT1qzquhM66
 kwFgsRr2XKdKHM7p641sw6o9uSZvLNhBzl6IDhFjkl9q1ok/9SjzvE/DRiXzdCZ0hU6b
 BE882w/8Va5iOYJb59wUW9irK0hSvEhLEK7WKMSPHsQoa4764lYgCrhvhtVaPW7UA/Zo
 eObsKdL4GCNGz+XAAGVmE0EkncM2CWa/zYCWDUXpX4pZ2JjjSV9f9GaTIcIWP6VZNWAN AA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2s5j5tss13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 08:51:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3T8ojLN158548;
 Mon, 29 Apr 2019 08:51:55 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2s4d49udhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 08:51:55 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3T8pqK3012977;
 Mon, 29 Apr 2019 08:51:52 GMT
Received: from tomti.i.net-space.pl (/10.175.189.51)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 29 Apr 2019 01:51:51 -0700
Date: Mon, 29 Apr 2019 10:51:47 +0200
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Steven Haigh <netwiz@crc.id.au>
Message-ID: <20190429085147.f7wx5mqzr3qnde26@tomti.i.net-space.pl>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <CACJDEmq4rp7C3EMD2j7+5yi5R_Na_6ejuZhH4aY2=d+g6dBNbQ@mail.gmail.com>
 <1499372357.22465.108.camel@fedoraproject.org>
 <60eb4374d39aa140f82d94dc4dbf40548be87be1.camel@fedoraproject.org>
 <CAO9z1z9S1FE49VJUbOVAy0XWOsfYrXVKgq541fd9eA4eYUsauA@mail.gmail.com>
 <CAP+TRyNpaQgrg6tFezDHjTHTji+0xN_WQ479-pRx4V6wrARLuw@mail.gmail.com>
 <20190426181856.GB19604@char.us.oracle.com>
 <1556419477.10194.1@crc.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556419477.10194.1@crc.id.au>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9241
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904290065
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9241
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904290065
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: Sumantro Mukherjee <sumukher@redhat.com>,
 For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Konrad Rzeszutek Wilk <konrad@kernel.org>,
 "Xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>,
 peter.jones@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29ycnkgZm9yIHRvcCBwb3N0aW5nLi4uCgpGWUksIEkgYW0gb24gdmFjYXRpb24gcmlnaHQgbm93
LiBJIHdpbGwgYmUgYmFjayBuZXh0IHdlZWsuIFNvLCBpZiBpdCBpcwpub3QgdXJnZW50IEkgd2ls
bCBleHBsYWluIGFsbCB0aGUgc3R1ZmYgYW5kIHVwZGF0ZSByZWxldmFudCBidWcgYXQgdGhlCmJl
Z2lubmluZyBvZiBuZXh0IHdlZWsuIFNvcnJ5IGZvciBkZWxheS4KCkRhbmllbAoKT24gU3VuLCBB
cHIgMjgsIDIwMTkgYXQgMTI6NDQ6MzdQTSArMTAwMCwgU3RldmVuIEhhaWdoIHdyb3RlOgo+IChh
bmQgc2VuZGluZyB0byB0aGUgbGlzdCB0aGlzIHRpbWUgZHVlIHRvIEdlYXJ5IGJlaW5nIHJhdGhl
ciBmZWF0dXJlbGVzcwo+IG1haWwgY2xpZW50KQo+Cj4gQXMgb25lIG9mIHRob3NlIGJlaW5nIGNh
dWdodCBieSByZWdyZXNzaW9ucyB1cGdyYWRpbmcgRjI5IHRvIEYzMCB1bmRlciBYZW4KPiBEb21V
J3MsIEkgdGhpbmsgdGhpcyBpcyBhIGJhZCBpZGVhLgo+Cj4gSXQgc2hvd3MgdGhhdCBpdCB3YXNu
J3QgdGVzdGVkLCBiZWNhdXNlIGl0IGRvZXNuJ3Qgd29yay4gVG8gbWUsIHRoaXMgZXhwb3Nlcwo+
IHdlYWtuZXNzZXMgaW4gdGhlIHRlc3RpbmcgYW5kIHRoZSBzb2x1dGlvbiBzaG91bGRuJ3QgYmUg
IlRoZSBjaGVjayBmYWlscywKPiByZW1vdmUgdGhlIGNoZWNrIi4KPgo+IE9uIFNhdCwgQXByIDI3
LCAyMDE5IGF0IDQ6MTggQU0sIEtvbnJhZCBSemVzenV0ZWsgV2lsawo+IDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPiB3cm90ZToKPiA+IE9uIEZyaSwgQXByIDI2LCAyMDE5IGF0IDEwOjIyOjEzUE0g
KzA1MzAsIFN1bWFudHJvIE11a2hlcmplZSB3cm90ZToKPiA+ID4gIFl1cCArMSBmcm9tIG15IHNp
ZGUgdG9vLiBYZW4gaXMgaGFyZGx5IHRlc3RlZCBzaW5jZSBhIGxvdCBvZiB0aW1lLgo+ID4KPiA+
IEhpIQo+ID4KPiA+IEFuZCB0aGF0IGlzIHRoYW5rcyB0byBvbmUgb2YgdGhlIEdSVUIyIGJ1Z3Mg
dGhhdCBuZWVkcyBzb21lIGxvdmUKPiA+IGZyb20gUGV0ZXIgSm9uZXMuCj4gPgo+ID4gQXMgd2l0
aG91dCB0aGF0IGJ1ZyBiZWluZyBmaXhlZCAtIGl0IGlzIHZlcnkgZGlmZmljdWx0IHRvIHRlc3Qg
aXQgLSBhcwo+ID4geW91IGNhbid0IGV2ZW4gbG9hZCBYZW4hCj4gPgo+ID4gSSd2ZSBhc2tlZCB0
aGUgdXBzdHJlYW0gR1JVQiBtYWludGFpbmVyIHRvIHNoZWVkIHNvbWUgbGlnaHQgb24gdGhlCj4g
PiBjb25mdXNpb24gYWJvdXQgbXVsdGlib290MiArIFNlY3VyZUJvb3QgLSBob3BlZnVsbHkgdGhh
dCB3aWxsIHJlc29sdmUKPiA+IHRoZSBxdWVzdGlvbi4KPiA+Cj4gPiBNeSB2b3RlIGlzIHRvIGhh
dmUgaXQgcmVtYWluIGFzIGlzLgo+ID4KPiA+IFRoYW5rIHlvdS4KPiA+ID4KPiA+ID4gIE9uIEZy
aSwgQXByIDI2LCAyMDE5IGF0IDEwOjA3IFBNIEdlb2ZmcmV5IE1hcnIgPGdtYXJyQHJlZGhhdC5j
b20+Cj4gPiA+IHdyb3RlOgo+ID4gPgo+ID4gPiAgPiBTaW5jZSBGMjQsIEkgaGF2ZW4ndCBzZWVu
IG9yIGhlYXJkIG9mIGFueW9uZSB3aG8gdXNlcyBYZW4gb3ZlciBLVk0KPiA+ID4gID4gYW55d2hl
cmUgb3RoZXIgdGhhbiB0aGlzIHRocmVhZC4uLiBJJ20gKzEgZm9yIG1ha2luZyB0aGlzIHRlc3Qg
YW4KPiA+ID4gID4gIk9wdGlvbmFsIiBvbmUuCj4gPiA+ICA+Cj4gPiA+ICA+IEdlb2ZmIE1hcnIK
PiA+ID4gID4gSVJDOiBjb3JlbW9kdWxlCj4gPiA+ICA+Cj4gPiA+ICA+Cj4gPiA+ICA+IE9uIEZy
aSwgQXByIDI2LCAyMDE5IGF0IDEwOjMzIEFNIEFkYW0gV2lsbGlhbXNvbiA8Cj4gPiA+ICA+IGFk
YW13aWxsQGZlZG9yYXByb2plY3Qub3JnPiB3cm90ZToKPiA+ID4gID4KPiA+ID4gID4+IE9uIFRo
dSwgMjAxNy0wNy0wNiBhdCAxMzoxOSAtMDcwMCwgQWRhbSBXaWxsaWFtc29uIHdyb3RlOgo+ID4g
PiAgPj4gPiBPbiBUaHUsIDIwMTctMDctMDYgYXQgMTU6NTkgLTA0MDAsIEtvbnJhZCBSemVzenV0
ZWsgV2lsayB3cm90ZToKPiA+ID4gID4+ID4gPiA+ID4gSSB3b3VsZCBwcmVmZXIgZm9yIGl0IHRv
IHJlbWFpbiBhcyBpdCBpcy4KPiA+ID4gID4+ID4gPiA+Cj4gPiA+ICA+PiA+ID4gPiBUaGlzIGlz
IG9ubHkgcHJhY3RpY2FsIGlmIGl0J3MgZ29pbmcgdG8gYmUgdGVzdGVkLCBhbmQKPiA+ID4gdGVz
dGVkCj4gPiA+ICA+PiByZWd1bGFybHkKPiA+ID4gID4+ID4gPiA+IC0gbm90ICpvbmx5KiBvbiB0
aGUgZmluYWwgcmVsZWFzZSBjYW5kaWRhdGUsIHJpZ2h0IGJlZm9yZQo+ID4gPiB3ZSBzaWduCj4g
PiA+ICA+PiBvZmYKPiA+ID4gID4+ID4gPiA+IG9uIHRoZSByZWxlYXNlLiBJdCBuZWVkcyB0byBi
ZSB0ZXN0ZWQgcmVndWxhcmx5IHRocm91Z2hvdXQKPiA+ID4gdGhlCj4gPiA+ICA+PiByZWxlYXNl
Cj4gPiA+ICA+PiA+ID4gPiBjeWNsZSwgb24gdGhlIGNvbXBvc2VzIHRoYXQgYXJlICJub21pbmF0
ZWQgZm9yIHRlc3RpbmciLgo+ID4gPiAgPj4gPiA+Cj4gPiA+ICA+PiA+ID4gUmlnaHQsIHdoaWNo
IGlzIHdoeSBJIGFtIGhhcHB5IHRoYXQgeW91IGhhdmUgcG9pbnRlZCBtZSB0bwo+ID4gPiB0aGUg
cmlnaHQKPiA+ID4gID4+ID4gPiBwbGFjZSBzbyBJIGNhbiBiZSB1cC10by1kYXRlLgo+ID4gPiAg
Pj4gPgo+ID4gPiAgPj4gPiBHcmVhdCwgdGhhbmtzLiBTbyBsZXQncyBsZWF2ZSBpdCBhcyBpdCBp
cyBmb3Igbm93LCBidXQgd2UnbGwKPiA+ID4ga2VlcCBhbgo+ID4gPiAgPj4gPiBleWUgb24gdGhp
cyBkdXJpbmcgRjI3IGN5Y2xlLiBJZiB3ZSBnZXQgdG8sIHNheSwgQmV0YSBhbmQKPiA+ID4gdGhl
cmUgYXJlIG5vCj4gPiA+ICA+PiA+IHJlc3VsdHMgZm9yIHRoZSB0ZXN0LCB0aGF0J3MgZ29ubmEg
YmUgYSBwcm9ibGVtLiBUaGFua3MhCj4gPiA+ICA+Pgo+ID4gPiAgPj4gU28sIGZvciBGZWRvcmEg
MzAsIHRoaXMgd2FzIG5vdCB0ZXN0ZWQgdGhyb3VnaG91dCB0aGUgd2hvbGUKPiA+ID4gY3ljbGUu
IEkKPiA+ID4gID4+IHRoaW5rIHdlIGNhbiBjb25zaWRlciB0aGUgcHJvcG9zYWwgdG8gcmVtb3Zl
IHRoZSBjcml0ZXJpb24gYWN0aXZlCj4gPiA+ICA+PiBhZ2Fpbi4KPiA+ID4gID4+IC0tCj4gPiA+
ICA+PiBBZGFtIFdpbGxpYW1zb24KPiA+ID4gID4+IEZlZG9yYSBRQSBDb21tdW5pdHkgTW9ua2V5
Cj4gPiA+ICA+PiBJUkM6IGFkYW13IHwgVHdpdHRlcjogQWRhbVdfRmVkb3JhIHwgWE1QUDogYWRh
bXcgQVQKPiA+ID4gaGFwcHlhc3Nhc3NpbiAuIG5ldAo+ID4gPiAgPj4gaHR0cDovL3d3dy5oYXBw
eWFzc2Fzc2luLm5ldAo+ID4gPiAgPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiA+ID4gID4+IHRlc3QgbWFpbGluZyBsaXN0IC0tIHRlc3RAbGlzdHMu
ZmVkb3JhcHJvamVjdC5vcmcKPiA+ID4gID4+IFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwg
dG8KPiA+ID4gdGVzdC1sZWF2ZUBsaXN0cy5mZWRvcmFwcm9qZWN0Lm9yZwo+ID4gPiAgPj4gRmVk
b3JhIENvZGUgb2YgQ29uZHVjdDoKPiA+ID4gaHR0cHM6Ly9nZXRmZWRvcmEub3JnL2NvZGUtb2Yt
Y29uZHVjdC5odG1sCj4gPiA+ICA+PiBMaXN0IEd1aWRlbGluZXM6Cj4gPiA+IGh0dHBzOi8vZmVk
b3JhcHJvamVjdC5vcmcvd2lraS9NYWlsaW5nX2xpc3RfZ3VpZGVsaW5lcwo+ID4gPiAgPj4gTGlz
dCBBcmNoaXZlczoKPiA+ID4gID4+IGh0dHBzOi8vbGlzdHMuZmVkb3JhcHJvamVjdC5vcmcvYXJj
aGl2ZXMvbGlzdC90ZXN0QGxpc3RzLmZlZG9yYXByb2plY3Qub3JnCj4gPiA+ICA+Pgo+ID4gPiAg
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiAg
PiB0ZXN0IG1haWxpbmcgbGlzdCAtLSB0ZXN0QGxpc3RzLmZlZG9yYXByb2plY3Qub3JnCj4gPiA+
ICA+IFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gdGVzdC1sZWF2ZUBsaXN0cy5mZWRv
cmFwcm9qZWN0Lm9yZwo+ID4gPiAgPiBGZWRvcmEgQ29kZSBvZiBDb25kdWN0OiBodHRwczovL2dl
dGZlZG9yYS5vcmcvY29kZS1vZi1jb25kdWN0Lmh0bWwKPiA+ID4gID4gTGlzdCBHdWlkZWxpbmVz
Ogo+ID4gPiBodHRwczovL2ZlZG9yYXByb2plY3Qub3JnL3dpa2kvTWFpbGluZ19saXN0X2d1aWRl
bGluZXMKPiA+ID4gID4gTGlzdCBBcmNoaXZlczoKPiA+ID4gID4gaHR0cHM6Ly9saXN0cy5mZWRv
cmFwcm9qZWN0Lm9yZy9hcmNoaXZlcy9saXN0L3Rlc3RAbGlzdHMuZmVkb3JhcHJvamVjdC5vcmcK
PiA+ID4gID4KPiA+ID4KPiA+ID4KPiA+ID4gIC0tCj4gPiA+ICAvL3N1bWFudHJvCj4gPiA+ICBG
ZWRvcmEgUUUKPiA+ID4gIFRSSUVEIEFORCBQRVJTT05BTExZIFRFU1RFRCwgRVJHTyBUUlVTVEVE
Cj4gPiA+IDxodHRwczovL3JlZGhhdC5jb20vdHJ1c3RlZD4KPiA+Cj4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gWGVuLWRldmVsIG1haWxpbmcg
bGlzdAo+ID4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gPiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
