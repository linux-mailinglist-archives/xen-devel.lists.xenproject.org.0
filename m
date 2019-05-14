Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEBC1CA17
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 16:14:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQY9x-0007BY-BD; Tue, 14 May 2019 14:12:01 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.170])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <m.a.young@durham.ac.uk>) id 1hQY9w-0007BT-0S
 for xen-devel@lists.xensource.com; Tue, 14 May 2019 14:12:00 +0000
Received: from [46.226.53.52] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-c.eu-west-1.aws.symcld.net id 16/A5-23848-EACCADC5;
 Tue, 14 May 2019 14:11:58 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-7.tower-304.messagelabs.com: domain of durham.ac.uk designates 
 129.234.7.139 as permitted sender) smtp.mailfrom=durham.ac.uk; dkim=none 
 (message not signed); dmarc=none (no record) header.from=durham.ac.uk
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsXS+Iq9W3fdmVs
 xBhfuyVjcm/Ke3YHRY3vfLvYAxijWzLyk/IoE1owjn8wKXrFUPJp5lrGB8QtzFyMXh5DAWkaJ
 Cy1nGCGcz4wSy5pOM3UxcgI5BRJbLq1gh0hMZJT4sOwYWIJFQFtiw6bbbCA2m4CGxPJLbUBxD
 g4RAWWJ56e1QMLMAt+ZJS50B4LYwgKmEt13WsDKOQW0JHpeLWIFsXkFnCQ29PdDXTGbSeLfnd
 dgCVEBHYlXp9YwQxQJSpyc+YQFYqiWxMNft8BsCQE7iR0djewQtrbEh4ObmScwCs5C0jILScs
 CRqZVjOZJRZnpGSW5iZk5uoYGBrqGhka6RgbGumZGeolVusl6qaW65anFJbqGeonlxXrFlbnJ
 OSl6eaklmxiB4ZtScNpuB+OLFemHGCU5mJREeR/33YgR4kvKT6nMSCzOiC8qzUktPsQow8GhJ
 MFre/pWjJBgUWp6akVaZg4wkmDSEhw8SiK8308BpXmLCxJzizPTIVKnGHU5Ztx/NpdZiCUvPy
 9VSpxXG2SGAEhRRmke3AhYVF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzLDjKFJzOvBG7
 TK6AjmICOsMwEO6IkESEl1cDY06LTqVrYX/9TvZfrVU1q5+EHF2UTG4VfTvo25++0wylcM09s
 WPNwUpzsdWW57r2vAvI0Oxj+efBJNHvEr8mu2Fgysa81PVdK8r6mw6ElCw6yKN3vF2PZKWF2J
 9RnYcYBt61/y2aFbFzUqv6c64T4RalfK9P+cavte2Xpr+fbq/Q2OnXJm8dKLMUZiYZazEXFiQ
 B0l7Qg5QIAAA==
X-Env-Sender: m.a.young@durham.ac.uk
X-Msg-Ref: server-7.tower-304.messagelabs.com!1557843118!8823860!1
X-Originating-IP: [129.234.7.139]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3678 invoked from network); 14 May 2019 14:11:58 -0000
Received: from hermes2.dur.ac.uk (HELO hermes2.dur.ac.uk) (129.234.7.139)
 by server-7.tower-304.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted
 SMTP; 14 May 2019 14:11:58 -0000
Received: from smtphost1.dur.ac.uk (smtphost1.dur.ac.uk [129.234.7.143])
 by hermes2.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x4EEAWoo020889;
 Tue, 14 May 2019 15:10:36 +0100
Received: from algedi.dur.ac.uk (algedi.dur.ac.uk [129.234.2.28])
 by smtphost1.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x4EEALKo016720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 14 May 2019 15:10:21 +0100
Received: by algedi.dur.ac.uk (Postfix, from userid 2742)
 id A5763281E0B; Tue, 14 May 2019 15:10:16 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
 by algedi.dur.ac.uk (Postfix) with ESMTP id 8BCF3281DBD;
 Tue, 14 May 2019 15:10:16 +0100 (BST)
Date: Tue, 14 May 2019 15:10:16 +0100 (BST)
From: M A Young <m.a.young@durham.ac.uk>
To: Steven Haigh <netwiz@crc.id.au>
In-Reply-To: <1557842335.2639.1@crc.id.au>
Message-ID: <alpine.LFD.2.21.1905141503350.17984@algedi.dur.ac.uk>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <7F4A58E9-CC4E-4F8C-98E9-ED5DEF2F8BE4@gmail.com>
 <1557842335.2639.1@crc.id.au>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-DurhamAcUk-MailScanner: Found to be clean, Found to be clean
X-DurhamAcUk-MailScanner-ID: x4EEAWoo020889
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
 Lars Kurth <lars.kurth.xen@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 marmarek@invisiblethingslab.com, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xensource.com, Committers <committers@xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgU3RldmVuIEhhaWdoIHdyb3RlOgoKPiBUaGUgZmluYWwgZml4
IHdvdWxkIGJlIGZpZ3VyaW5nIG91dCB3aHkgcHlncnViIGN1cnJlbnRseSBib290cyB0aGUgKnNl
Y29uZCoKPiBlbnRyeSBpbiB0aGUgcmVzdWx0aW5nIGdydWIuY2ZnIC0gdW5saWtlIGhvdyBGMjkg
d29ya2VkLiBUaGlzIG1heSBiZSBlaXRoZXIgYQo+IGZpeCBvbiB0aGUgZ3J1YjItbWtjb25maWcg
b3IgcHlncnViIHNpZGUgLSBJJ20gbm90IHF1aXRlIHN1cmUgeWV0LiBUaGlzIHdvdWxkCj4gbGlr
ZWx5IHJlc3RvcmUgZnVuY3Rpb25hbGl0eSBjb21wbGV0ZWx5LiBBdCBsZWFzdCB1bnRpbCBzb21l
dGhpbmcgZWxzZSBtb3JlCj4gc3VpdGFibGUgaXMgZG9uZT8KClRoZSBhbnN3ZXIgdG8gd2h5IGlz
IGVhc3kuIHB5Z3J1YiBqdXN0IGlnbm9yZXMgImlmIiBpbnN0cnVjdGlvbnMgYW5kIHRoZXJlIApp
cyBhCiAgICBzZXQgZGVmYXVsdD0xCmxpbmUgaW4gYW4gaWYgY2xhdXNlIGZyb20gL2V0Yy9ncnVi
LmQvMDhfZmFsbGJhY2tfY291bnRpbmcgc28gaXQgCmRlZmF1bHRzIHRvIHRoZSBzZWNvbmQgZW50
cnkgYXMgdGhleSBhcmUgbnVtYmVyZWQgZnJvbSAwLgoKCU1pY2hhZWwgWW91bmcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
