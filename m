Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA381F506
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 15:07:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQtZt-0003CS-Em; Wed, 15 May 2019 13:04:13 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.172])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <m.a.young@durham.ac.uk>) id 1hQtZs-0003BS-1o
 for xen-devel@lists.xensource.com; Wed, 15 May 2019 13:04:12 +0000
Received: from [46.226.53.52] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-c.eu-west-1.aws.symcld.net id 5A/37-09106-A4E0CDC5;
 Wed, 15 May 2019 13:04:10 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-9.tower-304.messagelabs.com: domain of durham.ac.uk designates 
 129.234.7.138 as permitted sender) smtp.mailfrom=durham.ac.uk; dkim=none 
 (message not signed); dmarc=none (no record) header.from=durham.ac.uk
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsXS+Iq9S9eL706
 MQd8dVYt7U96zOzB6bO/bxR7AGMWamZeUX5HAmnHu5TXWgj3MFW82T2ZsYHzJ1MXIxSEksJZR
 4tyUXnYI5zOjxM0bGxm7GDmBnAKJ3b+3skIkJjJKvF6xmh0kwSKgLbFt/kMmEJtNQENi+aU2M
 FtEQEvi5LM7bCA2s8A0Jom1S2xAbGEBV4ne45PBejkFnCV+TH0KtoBXwFFi65ElUMucJA5P2M
 YKYosK6Ei8OrWGGaJGUOLkzCcsEDO1JB7+ugVmSwjYSezoaGSHsLUltvRdZZnAKDgLScssJC0
 LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrpGhkAsYm5XmKVbrJeaqlueWpxia6hXmJ5sV5xZW5y
 TopeXmrJJkZgCKcUnPq+g3HJivRDjJIcTEqivL8P3Y4R4kvKT6nMSCzOiC8qzUktPsSowcEhs
 Hnt6guMUix5+XmpShK8Zrx3YoQEi1LTUyvSMnOAUQZTKsHBoyTCOxskzVtckJhbnJkOkTrFqM
 sx4/6zucxCYDOkxHnf8wAVCYAUZZTmwY2ARfwlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK
 86iCreDLzSuA2vQI6ggnoCMvMWyBHlCQipKQaGKeUaLy59F4vPl/lVKjSv43S+qsfHvm70Pvr
 BZ5M1eO33r/qtc++Z/b3aIJ5hY3Zhl8sGea6R/klSsT/nmhSufLKy0Jnztee37LXb/SHcj7X0
 PyvGH3LrKeqyTo4YZPOLMuE9pO7F21Vlt74LOl5xuuLH3Qz+dO4OOIn7+BKjjgd88O22+X7JC
 WW4oxEQy3mouJEALtIqJ3zAgAA
X-Env-Sender: m.a.young@durham.ac.uk
X-Msg-Ref: server-9.tower-304.messagelabs.com!1557925450!8898330!1
X-Originating-IP: [129.234.7.138]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14007 invoked from network); 15 May 2019 13:04:10 -0000
Received: from hermes1.dur.ac.uk (HELO hermes1.dur.ac.uk) (129.234.7.138)
 by server-9.tower-304.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted
 SMTP; 15 May 2019 13:04:10 -0000
Received: from smtphost3.dur.ac.uk (smtphost3.dur.ac.uk [129.234.7.145])
 by hermes1.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x4FD3CGW013754;
 Wed, 15 May 2019 14:03:16 +0100
Received: from algedi.dur.ac.uk (algedi.dur.ac.uk [129.234.2.28])
 by smtphost3.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x4FD32DG020389
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 15 May 2019 14:03:03 +0100
Received: by algedi.dur.ac.uk (Postfix, from userid 2742)
 id D2CC0281DF8; Wed, 15 May 2019 14:02:57 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
 by algedi.dur.ac.uk (Postfix) with ESMTP id C01C6281DAC;
 Wed, 15 May 2019 14:02:57 +0100 (BST)
Date: Wed, 15 May 2019 14:02:57 +0100 (BST)
From: M A Young <m.a.young@durham.ac.uk>
To: Daniel Kiper <daniel.kiper@oracle.com>
In-Reply-To: <20190515113600.m26n2abinki7reg7@tomti.i.net-space.pl>
Message-ID: <alpine.LFD.2.21.1905151357260.3268@algedi.dur.ac.uk>
References: <20190515113600.m26n2abinki7reg7@tomti.i.net-space.pl>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-DurhamAcUk-MailScanner: Found to be clean, Found to be clean
X-DurhamAcUk-MailScanner-ID: x4FD3CGW013754
Subject: Re: [Xen-devel] Fedora - make BLS configs default - Xen Dom0 boot
 broken
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
Cc: adamwill@fedoraproject.org, xen-devel@lists.xensource.com,
 konrad.wilk@oracle.com, lars.kurth.xen@gmail.com, javierm@redhat.com,
 dfaggioli@suse.com, pjones@redhat.com, committers@xenproject.org,
 marmarek@invisiblethingslab.com, ian.jackson@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxNSBNYXkgMjAxOSwgRGFuaWVsIEtpcGVyIHdyb3RlOgoKPiBGWUksIGFub3RoZXIg
WGVuIERvbTAgYm9vdCBpc3N1ZSBvbiBGZWRvcmEuLi4KPiAKPiBQbGVhc2UgdGFrZSBhIGxvb2sg
YXQgWzFdLiBUaGlzIHdpbGwgYnJlYWsgWGVuIERvbTAgYm9vdCBkdWUgdG8gbGFjayBvZgo+IHN1
cHBvcnQgZm9yIG11bHRpYm9vdCwgbXVsdGlib290MiwgbW9kdWxlLCBhbmQgbW9kdWxlMiBjb21t
YW5kcy4gSWYgd2UKPiBjYXJlIHRoZW4gdGhpcyBoYXMgdG8gYmUgZml4ZWQgc29tZWhvdy4uLgoK
VGhpcyBiaXQgaXNuJ3QgY3VycmVudGx5IGEgcHJvYmxlbSBmb3IgWGVuIERvbTAgYmVjYXVzZSB0
aGUgCi9ldGMvZ3J1Yi5kLzIwX2xpbnV4X3hlbiBncnViIHNjcmlwdCBzdGlsbCBnZW5lcmF0ZXMg
bm9uLUJMUyBncnViIApjb25maWd1cmF0aW9uLgoKCU1pY2hhZWwgWW91bmcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
