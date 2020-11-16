Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FD32B3DFD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 08:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27698.56308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keZML-0001uY-Rg; Mon, 16 Nov 2020 07:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27698.56308; Mon, 16 Nov 2020 07:55:33 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keZML-0001u9-O6; Mon, 16 Nov 2020 07:55:33 +0000
Received: by outflank-mailman (input) for mailman id 27698;
 Mon, 16 Nov 2020 07:55:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wln0=EW=amazon.de=prvs=582b22291=doebel@srs-us1.protection.inumbo.net>)
 id 1keZMK-0001u4-CQ
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 07:55:32 +0000
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3e45775-304f-4107-8941-68cd361080d7;
 Mon, 16 Nov 2020 07:55:31 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 16 Nov 2020 07:55:25 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id EE3DEA1C33; Mon, 16 Nov 2020 07:54:03 +0000 (UTC)
Received: from [192.168.17.158] (10.43.161.102) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 16 Nov 2020 07:53:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Wln0=EW=amazon.de=prvs=582b22291=doebel@srs-us1.protection.inumbo.net>)
	id 1keZMK-0001u4-CQ
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 07:55:32 +0000
X-Inumbo-ID: a3e45775-304f-4107-8941-68cd361080d7
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a3e45775-304f-4107-8941-68cd361080d7;
	Mon, 16 Nov 2020 07:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1605513332; x=1637049332;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=0uRl8Bn0fpAQz51+UvQbi9sbmnJDYAMYaVvazEEREk4=;
  b=ozIUTAE07dESwZY0JPrtMNbjvzI0l9JJT/DxTu+/VQk8iyOcazQlCYP9
   gMYiOm3Thy3IYkuGz48M9itbLMUXEPQXn4UyaA7iEn7TFuqELAWodfaYV
   TJh0QtEeWmDPMc9ZnwksaoFSj8Q5iRs7ws4aPmNIJ82aArTBGhKYOnYfU
   0=;
X-IronPort-AV: E=Sophos;i="5.77,481,1596499200"; 
   d="scan'208";a="66613059"
Subject: Re: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 16 Nov 2020 07:55:25 +0000
Received: from EX13D03EUC002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS id EE3DEA1C33;
	Mon, 16 Nov 2020 07:54:03 +0000 (UTC)
Received: from [192.168.17.158] (10.43.161.102) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 16 Nov 2020 07:53:59 +0000
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "jgross@suse.com" <jgross@suse.com>,
	"Andrew Cooper" <Andrew.Cooper3@citrix.com>
CC: "wl@xen.org" <wl@xen.org>, Christian Lindig <christian.lindig@citrix.com>,
	"jgrall@amazon.co.uk" <jgrall@amazon.co.uk>, "elnikety@amazon.de"
	<elnikety@amazon.de>, "iwj@xenproject.org" <iwj@xenproject.org>
References: <20201113141823.58712-1-doebel@amazon.de>
 <5ac379ad-33fd-2973-dfdb-9e06ea539809@suse.com>
 <0e6b09fe-ffc4-195f-1b6c-67abc0cff92c@amazon.de>
 <c1352a2a-112a-966f-7410-b917cabe1d91@citrix.com>
 <39f0b457514c3b6bcc7419d9eaf5770a5c073333.camel@citrix.com>
From: Bjoern Doebel <doebel@amazon.de>
Message-ID: <73515688-5db2-c81b-48fb-6c5dda4a34b1@amazon.de>
Date: Mon, 16 Nov 2020 08:53:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <39f0b457514c3b6bcc7419d9eaf5770a5c073333.camel@citrix.com>
Content-Language: en-GB
X-Originating-IP: [10.43.161.102]
X-ClientProxiedBy: EX13P01UWA002.ant.amazon.com (10.43.160.46) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDEzLjExLjIwIDE4OjIzLCBFZHdpbiBUb3JvayB3cm90ZToKPiBDQVVUSU9OOiBUaGlzIGVt
YWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhl
IHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+Cj4KPgo+IE9uIEZyaSwgMjAy
MC0xMS0xMyBhdCAxNzoxMyArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTMvMTEv
MjAyMCAxNjo1NiwgQmpvZXJuIERvZWJlbCB3cm90ZToKPj4+IE9uIDEzLjExLjIwIDE2OjM2LCBK
w7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+IE9uIDEzLjExLjIwIDE1OjE4LCBCam9lcm4gRG9lYmVs
IHdyb3RlOgo+Pj4+PiBSaWdodCBub3cgd2UgZG8gbm90IGhhdmUgYSBtZWNoYW5pc20gdG8gZGV0
ZXJtaW5lIHRoZSB2ZXJzaW9uCj4+Pj4+IG9mIHRoZQo+Pj4+PiBjdXJyZW50bHkgcnVubmluZyB4
ZW5zdG9yZWQgYXQgcnVudGltZS4gQXMgeGVuc3RvcmVkIHJ1bnMKPj4+Pj4gdGhyb3VnaG91dAo+
Pj4+PiB0aGUKPj4+Pj4gbGlmZXRpbWUgb2YgYSBYZW4gaG9zdCwgdGhpcyBtYXkgbGVhZCB0byBw
cm9ibGVtcyB3aGVuIG5ld2VyCj4+Pj4+IHVzZXIgc3BhY2UKPj4+Pj4gYnVpbGRzIGFyZSBzdGFn
ZWQuIFRoZW4sIHRoZSBydW5uaW5nIHhlbnN0b3JlZCB3aWxsIG5vIGxvbmdlcgo+Pj4+PiBtYXRj
aCB0aGUKPj4+Pj4gdmVyc2lvbiBvZiB0aGUgaW5zdGFsbGVkIHhlbnN0b3JlZC4KPj4+Pj4KPj4+
Pj4gVG8gYWxsb3cgdXNlcnMgdG8gYWx3YXlzIGlkZW50aWZ5IHRoZSBydW5uaW5nIHZlcnNpb24g
b2YKPj4+Pj4geGVuc3RvcmVkLCBhZGQKPj4+Pj4gYSBsaW5rZXItZ2VuZXJhdGVkIHVuaXF1ZSBi
dWlsZCBJRCB0byBldmVyeSB4ZW5zdG9yZWQgYnVpbGQuCj4+Pj4+IEFkZAo+Pj4+PiBmdW5jdGlv
bmFsaXR5IHRvIGxvZyB0aGlzIGJ1aWxkIElEIGludG8gYSBmaWxlIHVwb24gc2VydmljZQo+Pj4+
PiBzdGFydHVwLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2Vi
ZWxAYW1hem9uLmRlPgo+Pj4+PiBSZXZpZXdlZC1ieTogTWFydGluIE1hemVpbiA8YW1hemVpbkBh
bWF6b24uZGU+Cj4+Pj4+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpv
bi5jby51az4KPj4+PiBObyBzdXBwb3J0IGZvciBveGVuc3RvcmVkIG9yIHhlbnN0b3JlLXN0dWJk
b20/Cj4+PiBZb3VyIHN1Z2dlc3Rpb24gZnVydGhlciBkb3duIHdpbGwgYXBwYXJlbnRseSBoZWxw
IGZvciBzdHViZG9tLiBJIGRvCj4+PiBub3Qgc3BlYWsgb2NhbWwgYXQgYWxsIC0gaG93IGRvIHdl
IGFkZHJlc3MgdGhpcz8KPj4gQ0MnaW5nIEVkd2luIGFuZCBDaHJpc3RpYW4gd2hvIGhhdmUgZG9u
ZSB0aGUgYnVsayBvZiB0aGUgb3hlbnN0b3JlZAo+PiByZWNlbnRseS4KPj4KPj4gSXQgc291bmRz
IGxpa2UgaXQgbWlnaHQgbm90IGJlIHBvc3NpYmxlIHJpZ2h0IG5vdywgYnV0IHdvdWxkIGJlCj4+
IHBvc3NpYmxlCj4+IHdpdGggYSBmdXR1cmUgcGxhbiB0byBzd2l0Y2ggdGhlIE9jYW1sIGJ1aWxk
IHN5c3RlbSBvdmVyIHRvIGR1bmUgKHRoZQo+PiBuZXcvcHJlZmVycmVkIE9jYW1sIHVwc3RyZWFt
IHRvb2xjaGFpbikuCj4gU2VlIGhlcmUgd2hhdCBpcyBwb3NzaWJsZSB3aXRoIER1bmU6Cj4gaHR0
cHM6Ly9kdW5lLnJlYWR0aGVkb2NzLmlvL2VuL3N0YWJsZS9kdW5lLWxpYnMuaHRtbCNidWlsZC1p
bmZvCj4KPiBXb3VsZCB0aGUgb3V0cHV0IG9mICdnaXQgZGVzY3JpYmUgLS1hbHdheXMgLS1kaXJ0
eScgKHBlcmhhcHMgY29tYmluZWQKPiB3aXRoIGEgYnVpbGQgZGF0ZSkgc2VydmUgYXMgYSB1c2Vm
dWwgYnVpbGQgSUQ/CgpUaGUgcG9pbnQgb2YgdGhlIGJ1aWxkIElEIGlzIHRvIHZlcmlmeSBzb21l
dGhpbmcgbGlrZSAKImJpbmFyeS1lcXVpdmFsZW5jZSIgb2YgdHdvIGJ1aWxkcy4KCiogYSBnaXQg
aGFzaCBpcyBub3Qgc3VmZmljaWVudCBiZWNhdXNlIGRpZmZlcmVudCBnaXQgaGFzaGVzIG1heSBy
ZXN1bHQgCmluIHRoZSBzYW1lIGJpbmFyeSB0byBiZSBjcmVhdGVkIChpLmUuLCBpZiB0aGVyZSBp
cyBubyBjb2RlIGNoYW5nZSBpbiAKdGhlIHRhcmdldCBiaW5hcnkgaW4gYmV0d2VlbiB0aG9zZSB0
d28gYnVpbGRzKQoKKiBhIHRpbWUgc3RhbXAgaXMgY291bnRlci1wcm9kdWN0aXZlLCBiZWNhdXNl
IHRoZW4geW91J2QgaGF2ZSB0byAKcmVjcmVhdGUgdGhpcyB0aW1lc3RhbXAgZXZlcnkgdGltZSB5
b3Ugd2FudCB0byByZS1jcmVhdGUgYSBidWlsZAoKR05VIGxkJ3MgLS1idWlsZC1pZCBjbGFpbXMg
dG8gcGVyZm9ybSBhIGNoZWNrc3VtbWluZyBvZiB0aGUgIm5vcm1hdGl2ZSAKcGFydHMgb2YgdGhl
IG91dHB1dCBjb250ZW50cyIuIFdoYXRldmVyIHRoYXQgbWVhbnMuIDspCgo+Cj4+IElmIGl0IGRv
ZXMgZW5kIHVwIGJlaW5nIGFuIFhTX0NPTlRST0wgc3ViLW9wLCB3ZSBjYW4gaW1wbGVtZW50IGl0
IGF0Cj4+IGEKPj4gZnV0dXJlIHBvaW50IHdoZW4gd2UgY2FuIHVzZWZ1bGx5IGFuc3dlciB0aGUg
cXVlc3Rpb24uCj4gV291bGRuJ3QgdXNpbmcgcmVhZGVsZiBvbiAvcHJvYy88cGlkPi9leGUgZ2l2
ZSB5b3UgdGhlIHJ1bm5pbmcgYnVpbGRpZD8KPgo+IHJlYWRlbGYgLWEgL3Vzci9zYmluL294ZW5z
dG9yZWQgL3Byb2MvJChwaWRvZiBveGVuc3RvcmVkKS9leGUgfCBncmVwCj4gJ0J1aWxkIElEJwo+
ICAgICAgQnVpbGQgSUQ6IGJkZDUzMDRjODk4NGVkMjI1NzBkNTEzMDhhZTg3MTdkMDNmZTYwYWUK
PiAgICAgIEJ1aWxkIElEOiBiZGQ1MzA0Yzg5ODRlZDIyNTcwZDUxMzA4YWU4NzE3ZDAzZmU2MGFl
Cj4KPiByZWFkZWxmIC1hIC91c3Ivc2Jpbi9veGVuc3RvcmVkIC9wcm9jLyQocGlkb2Ygb3hlbnN0
b3JlZCkvZXhlIHwgZ3JlcAo+ICdCdWlsZCBJRCcKPiAgICAgIEJ1aWxkIElEOiBiNDRmZjk5YjIx
NmRiNzUyNmUzZWU3ODQxMDY4ZDU4NGNjOWMyYjk1Cj4gICAgICBCdWlsZCBJRDogYmRkNTMwNGM4
OTg0ZWQyMjU3MGQ1MTMwOGFlODcxN2QwM2ZlNjBhZQo+Cj4KPiBXaGVuIHlvdSdyZSBpbnNpZGUg
YSBzdHViZG9tIGl0IGlzIHByb2JhYmx5IG5vdCBzbyBlYXN5IHRob3VnaC4KCkludGVyZXN0aW5n
LiBJIGhhZCBub3QgY29uc2lkZXJlZCB0aGF0IGJlY2F1c2UgYWZ0ZXIgdXBncmFkaW5nIHhlbnN0
b3JlZCAKdG8gYSBkaWZmZXJlbnQgdmVyc2lvbiwgdGhlIHJ1bm5pbmcgeGVuc3RvcmVkJ3MgL3By
b2MvJFBJRC9leGUgc2hvd3MgYXMKCiMgbHMgLWwgL3Byb2MvJChwZ3JlcCB4ZW5zdG9yZWQpL2V4
ZQpscnd4cnd4cnd4IDEgcm9vdCByb290IDAgTm92wqAgOSAxNDowNiAvcHJvYy8zNTI4L2V4ZSAt
PiAKL3Vzci9zYmluL3hlbnN0b3JlZCAoZGVsZXRlZCkKCkJ1dCB5b3UgYXJlIHJpZ2h0LCBvbmUg
Y2FuIHN0aWxsIHJlYWQgdGhhdCBwcm9jZnMgZmlsZS4gTmljZSEKCgpCam9lcm4KCgoKCgpBbWF6
b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBC
ZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBX
ZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIg
MTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


