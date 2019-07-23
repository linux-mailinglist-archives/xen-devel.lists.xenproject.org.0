Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986A3713BA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 10:17:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hppvM-0006oj-Dh; Tue, 23 Jul 2019 08:13:28 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.44])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth.xen@gmail.com>) id 1hppvL-0006oe-G6
 for xen-devel@lists.xensource.com; Tue, 23 Jul 2019 08:13:27 +0000
Received: from [46.226.52.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.eu-west-1.aws.symcld.net id F1/2A-10831-6A1C63D5;
 Tue, 23 Jul 2019 08:13:26 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-15.tower-264.messagelabs.com: domain of gmail.com designates 
 209.85.128.67 as permitted sender) smtp.mailfrom=gmail.com; dkim=pass 
 (good signature) header.i=@gmail.com header.s=20161025; dmarc=pass 
 (p=none sp=quarantine adkim=r aspf=r) header.from=gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRWlGSWpSXmKPExsVyMbTBWXfZQbN
 Yg9UzmCzuTXnP7sDosb1vF3sAYxRrZl5SfkUCa8b+Zx3MBZf5Kw7N+8/ewHiep4uRi0NIYDqj
 xN8D79lAHBaBWawSk5c9YAVxJAS2sUq8/dHJ3MXICeSkSWxpesYCY58++5MVwq6TmPr3OCOIL
 SSgLnFv0W12iLHrmSSuHFoAlODgYBbQkNh6ORmkhlfAWOLqnvdgM4UFHCVubP8I1ssmoC2x6c
 YDsDinQKDE7H8HwGwWAVWJBz0NYDOZBSaxSKx6+A5sMTNQw7KFr5khhtpILLrwkQVi8XxWia4
 vfewgi0UENCXe7beCOFRRon/NIbYJjCKzEE6aheSkWUimLmBkXsVonlSUmZ5RkpuYmaNraGCg
 a2hopGtoaaxraqmXWKWbqJdaqlueWlyia6iXWF6sV1yZm5yTopeXWrKJERghKQUHrXcwvpz5R
 u8QoyQHk5Ior/10s1ghvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryH9gPlBItS01Mr0jJzgNEKk5
 bg4FES4b15ACjNW1yQmFucmQ6ROsVoyTHh5dxFzBxLNs4Dkh2/Fi1iFmLJy89LlRLn9QRpEAB
 pyCjNgxsHSyiXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz3gW5iiczrwRu6yugg5iADtqr
 AnZQSSJCSqqBSTRQ997KjQXnv06K+i4q+Udh/7TzgkuqLrv6Ob52PqTrFnFbL1E+bGOty4qpF
 VvknrvteV5s+WnuxTnyd5itRR0VJl1m2L9BYdPx0KNeyS7xt2/K+2m89byWZvxI5dMzU9Ee3U
 UMr55elwx+Ljr3c9LksK2hYYlTD0m4fkq8uG9F4Qq+i3Mtfr4OK97/q7NixtJ/ZQf9Mi+ISzt
 auXanm0cbsK6WCFvdfrcja8fUew0fkkvsL747/HvtPG5bFlfjPZGyE92F1nVlBkyzWMx+zVuM
 M174TQzX24Y7t5KeW16fcVPbXrx58WvRg4fmayakCWllJ73UrT0pJ9PY2fyK5dP2Tcx7exvr9
 KN+GwXtVmIpzkg01GIuKk4EAEblQ7SjAwAA
X-Env-Sender: lars.kurth.xen@gmail.com
X-Msg-Ref: server-15.tower-264.messagelabs.com!1563869605!138017!1
X-Originating-IP: [209.85.128.67]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32054 invoked from network); 23 Jul 2019 08:13:26 -0000
Received: from mail-wm1-f67.google.com (HELO mail-wm1-f67.google.com)
 (209.85.128.67)
 by server-15.tower-264.messagelabs.com with ECDHE-RSA-AES128-GCM-SHA256
 encrypted SMTP; 23 Jul 2019 08:13:26 -0000
Received: by mail-wm1-f67.google.com with SMTP id a15so37545513wmj.5
 for <xen-devel@lists.xensource.com>; Tue, 23 Jul 2019 01:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NBnJ++lS/5iEVUaiQIhno7k5iYJn/kvtXz3dtRF/JKs=;
 b=AyCG8wLLeFqS9B6gffkA3Y/es1V3ghflmm845gh0buu7QUSPaqzm2efvBIJG7h8Quy
 5t/LnEwcgQCZF8o8OVIMtCTQjetmRQZfg/9uY8gReBJiIcdeai2h8PQsuMga0MB/kk40
 90zGdMri3rW3i07YCLhM9l2k3DthVofWGmnqCv+N9Xwf/iuidR1+T+iKcrHPjFGtX9OS
 seYFwCTwl1/6lAXxl8JVgDasY/YItIlWkuY58A5VuYN7nRVPil9UTlqp0LDOt8TcJu4H
 wE3mbBqHb80YOeUS1zefYzSPKZuBKrZKGOGh8du2RTik2fctsk10odr86eLnYI/u75W9
 RJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NBnJ++lS/5iEVUaiQIhno7k5iYJn/kvtXz3dtRF/JKs=;
 b=sRXXXj5SDUhW1JJ63lzSxUzvXzZ1u4exOgIo57IxE1BJ2YoEt+us1BjVa32OYIlnsm
 PegnE2BJGrImAJ5OIjrt0ih9Dn1juEau+dBeKU+iXxug8GcvFsEJfK6nYOq1VMof+iBH
 5naWc7xfhBoNGMcboAoGMt/cJH+K4kH5I/GjYMBKJa9EwVQWk+cRxIp0LiEisOQOWvXT
 KwYPLRJngPZlkPPE9BhOW2xzaJVqwoK17e1v+XjVy3Hv2uY9Rkgx6MNojDM6bmh3X1gR
 peiScXx+kSw3xE6cP/7+ucwaYiZEXxAjdOOv3VmqGxE2tyd0wn3wf6o73jewEZ+93rXn
 8iDQ==
X-Gm-Message-State: APjAAAWd5p/rE1pRnFWMaqoBCmwBOcAVZMLa4CCjmNmpZ+JnWQ+VJ8+A
 KFMbeFrCq7II8ng4Yms7bsI=
X-Google-Smtp-Source: APXvYqxJqcUixb0t2sdBtnhaPyti4ZB+lf2Fgq/fM3DBgKDugVjDV6ssWlHr0L8yqOokFte8YnzVYQ==
X-Received: by 2002:a1c:7e90:: with SMTP id
 z138mr65516764wmc.128.1563869604940; 
 Tue, 23 Jul 2019 01:13:24 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:1c5d:5b81:fba:d38c?
 ([2a02:c7f:ac18:da00:1c5d:5b81:fba:d38c])
 by smtp.gmail.com with ESMTPSA id v65sm47227992wme.31.2019.07.23.01.13.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 01:13:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
From: Lars Kurth <lars.kurth.xen@gmail.com>
In-Reply-To: <CALeDE9ML4uTBKbrvW3=F2Js=h6ZLO_CJ5e4a5zH3_LR-VjQq7w@mail.gmail.com>
Date: Tue, 23 Jul 2019 09:13:22 +0100
Message-Id: <F5C84D53-236D-484D-A097-6FFC6C9EF52E@gmail.com>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
 <c230c496979d149d2663528defd7a15d52f7ce6a.camel@infradead.org>
 <CALeDE9Mn_Zd+gCrGHSCkQ8utJ4Hv0G=T=120++yZpRQF5F1sKA@mail.gmail.com>
 <87b8a119fbbd27dd706362e4e57e810cd88d0351.camel@fedoraproject.org>
 <e296b35081171fa5f6d64e53e9fbb91e0b9e7d77.camel@infradead.org>
 <CALeDE9ML4uTBKbrvW3=F2Js=h6ZLO_CJ5e4a5zH3_LR-VjQq7w@mail.gmail.com>
To: Peter Robinson <pbrobinson@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
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
Cc: Adam Williamson <adamwill@fedoraproject.org>,
 For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xensource.com,
 Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDEyIEp1bCAyMDE5LCBhdCAxMzoyNCwgUGV0ZXIgUm9iaW5zb24gPHBicm9iaW5zb25A
Z21haWwuY29tPiB3cm90ZToKPiAKPiBPbiBGcmksIEp1bCAxMiwgMjAxOSBhdCA1OjUwIEFNIERh
dmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4+IAo+PiAKPj4+IElJ
UkMsIHdoYXQgd2UgaGF2ZSByaWdodCBub3cgaXMgYSBzb21ld2hhdCB2YWd1ZSBzZXR1cCB3aGVy
ZSB3ZSBqdXN0Cj4+PiBoYXZlICdsb2NhbCcsICdlYzInIGFuZCAnb3BlbnN0YWNrJyBjb2x1bW5z
LiBUaGUgaW5zdHJ1Y3Rpb25zIGZvcgo+Pj4gIkFtYXpvbiBXZWIgU2VydmljZXMiIGp1c3Qgc2F5
ICJMYXVuY2ggYW4gaW5zdGFuY2Ugd2l0aCB0aGUgQU1JIHVuZGVyCj4+PiB0ZXN0Ii4gU28gd2Ug
Y291bGQgcHJvYmFibHkgc3RhbmQgdG8gdGlnaHRlbiB0aGF0IHVwIGEgYml0LCBhbmQgZGVmaW5l
Cj4+PiBzcGVjaWZpYyBpbnN0YW5jZSB0eXBlKHMpIHRoYXQgd2Ugd2FudCB0byB0ZXN0L2Jsb2Nr
IG9uLgo+PiAKPj4gSSB0aGluayB3ZSBjYW4gZGVmaW5lIGEgc2V0IG9mIGluc3RhbmNlIHR5cGVz
IHRoYXQgd291bGQgY292ZXIgd2hhdCBpdAo+PiBtYWtlcyBzZW5zZSB0byB0ZXN0LiBEbyB3ZSBz
dGlsbCBjYXJlIGFib3V0IGFjdHVhbCBQViBndWVzdHMgb3Igb25seQo+PiBIVk0/IEkgdGhpbmsg
aXQgbWFrZXMgc2Vuc2UgdG8gdGVzdCBndWVzdHMgd2l0aCBYZW4gbmV0YmFjayBhbmQgYmxrYmFj
awo+PiByYXRoZXIgdGhhbiBvbmx5IEVOQSBhbmQgTlZNZSwgYnV0IEZlZG9yYSBwcm9iYWJseSB3
YW50cyB0byB0ZXN0IHRoZQo+PiBsYXR0ZXIgdHdvICphbnl3YXkqLgo+PiAKPj4gRG8gd2Ugd2Fu
dCB0byBkbyB0aGlzIGJ5IG1ha2luZyBzdXJlIHlvdSBoYXZlIGZyZWUgY3JlZGl0cyB0byBydW4g
dGhlCj4+IGFwcHJvcHJpYXRlIHRlc3RzIGRpcmVjdGx5Li4uIG9yIGlzIGl0IGJldHRlciBhbGwg
cm91bmQgZm9yIHVzIHRvIGp1c3QKPj4gZG8gdGhpcyBvbiBuaWdodGx5IGJ1aWxkcyBmb3Igb3Vy
c2VsdmVzPwo+PiAKPj4gVGhlIGxhdHRlciBicmluZ3MgbWUgdG8gYSBxdWVzdGlvbiB0aGF0J3Mg
YmVlbiBidWdnaW5nIG1lIGZvciBhIHdoaWxlIOKAlAo+PiBob3cgaW4gJERFSVRZJ3MgbmFtZSAq
ZG8qIEkgbGF1bmNoIHRoZSBsYXRlc3Qgb2ZmaWNpYWwgRmVkb3JhIEFNSQo+PiBhbnl3YXk/IEkg
Y2FuJ3QgZmluZCBpdCB0aHJvdWdoIHRoZSBub3JtYWwgR1VJIGxhdW5jaCBwcm9jZXNzIGFuZCBo
YXZlCj4+IHRvIGdvIHRvIGdldGZlZG9yYS5vcmcgYW5kIGNsaWNrIGFyb3VuZCBmb3IgYSB3aGls
ZSBiZWNhdXNlIEkgZmluZCB0aGUKPj4gc3BlY2lmaWMgQU1JIElEIGZvciB0aGUgdGhhdCByZWdp
b24sIGFuZCB0aGVuIG1hbnVhbGx5IGVudGVyIHRoYXQgdG8KPj4gbGF1bmNoIHRoZSBpbnN0YW5j
ZS4gQ2FuJ3Qgd2UgZml4IHRoYXQgc28gSSBjYW4ganVzdCBzZWxlY3QgJ0ZlZG9yYSAzMCcKPj4g
d2l0aCBhIHNpbmdsZSBjbGljaz8gV2hvc2UgaGVhZHMgZG8gSSBoYXZlIHRvIGJhc2ggdG9nZXRo
ZXIgdG8gbWFrZQo+PiB0aGF0IHdvcms/Cj4gCj4gU28gdGhlIGVhc2llc3Qgd2F5IHRvIGRvIHRo
aXMgaXMgYnkgZ29pbmcgdG8gbGluayBbMV0gYW5kIHNlbGVjdCB0aGUKPiBjbG91ZCBpbWFnZSAi
Y2xpY2sgdG8gbGF1bmNoIiBpdCBnaXZlcyB5b3UgYSBsaXN0IG9mIEFXUyByZWdpb25zIGFuZAo+
IHRha2VzIHlvdSBkaXJlY3QgdG8gdGhlIEFXUyBkaWFsb2dzIHRvIHJ1biB0aGVtLgo+IAo+IFsx
XSBodHRwczovL2FsdC5mZWRvcmFwcm9qZWN0Lm9yZy9jbG91ZC8KCkRhdmlkLCBQZXRlciwKdGhh
bmtzIGZvciBoZWxwaW5nIHJlc29sdmUgdGhpcyBpc3N1ZS4gSXQgc2VlbXMgdG8gbWUgdGhhdCB0
ZXN0aW5nIGFnYWluc3QgRUMyIFhlbiBpbnN0YW5jZXMgc2hvdWxkIGluZGVlZCBjb3ZlciB3aGF0
IG1vc3QgdXNlcnMgbmVlZApMYXJzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
