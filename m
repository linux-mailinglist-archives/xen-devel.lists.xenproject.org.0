Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD861C9CE
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 16:02:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQXxS-0005Ny-B8; Tue, 14 May 2019 13:59:06 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.171])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <netwiz@crc.id.au>) id 1hQXxQ-0005Nr-Jb
 for xen-devel@lists.xensource.com; Tue, 14 May 2019 13:59:04 +0000
Received: from [46.226.53.52] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-c.eu-west-1.aws.symcld.net id 26/FA-32334-7A9CADC5;
 Tue, 14 May 2019 13:59:03 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-9.tower-304.messagelabs.com: domain of crc.id.au designates 
 203.56.246.92 as permitted sender) smtp.mailfrom=crc.id.au; dkim=pass 
 (good signature) header.i=@crc.id.au header.s=default; dmarc=none (no 
 record) header.from=crc.id.au
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsVy2uJbjO7yk7d
 iDA4t4LW4N+U9uwOjx/a+XewBjFGsmXlJ+RUJrBnPjm1jKtjDWXFv1lfmBsZX7F2MXBxCAs+Y
 JJont7OBOCwCX5kkvh3bAuRwAjmqEsv+rGICsdmA7NVLLoPFhQVMJbrvtIDZIgKaEhOv7WcFa
 WYWOMIs8a7xCNBYDg5eoMTUNmMQk1PAVuLpbmeIZQ1MElfmfgWbKSEgJvHh8D1WEJtXQFDi5M
 wnLCD1zAKWEquec05g5J2FJDMLIbOAkWkVo3lSUWZ6RkluYmaOrqGBga6hoZGukYGxrpmRXmK
 VbrJeaqlueWpxia6hXmJ5sV5xZW5yTopeXmrJJkZgaKUUnLbbwfhiRfohRkkOJiVR3sd9N2KE
 +JLyUyozEosz4otKc1KLDzHKcHAoSfA+PHErRkiwKDU9tSItMwcY5DBpCQ4eJRFeR5A0b3FBY
 m5xZjpE6hSjMceBRQ/nMnOsm/BsLrMQS15+XqqUOG8eSKkASGlGaR7cIFj0XWKUlRLmZWRgYB
 DiKUgtys0sQZV/xSjOwagkzJsCMoUnM68Ebt8roFOYgE6xzAQ7pSQRISXVwOhZ9GbZkSOR253
 P9H5bf/ZnhrN6Smjiv6KnT1s+x6zYvv7JqUPKNRv8DySxGD85nXP+9XOWb7+XfXxa81GmWkSG
 70ppWcmSfZWnPsSk/pfVrj97XuCN3EeWf5sWiDzjU3WTOCQ3ueOtz5T6SOmp6kWP117hc/wv1
 H2S4flzvfS/dcwFJ87nCFcosRRnJBpqMRcVJwIAiLqm2bkCAAA=
X-Env-Sender: netwiz@crc.id.au
X-Msg-Ref: server-9.tower-304.messagelabs.com!1557842339!8810050!1
X-Originating-IP: [203.56.246.92]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31991 invoked from network); 14 May 2019 13:59:02 -0000
Received: from mail.crc.id.au (HELO mail.crc.id.au) (203.56.246.92)
 by server-9.tower-304.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted
 SMTP; 14 May 2019 13:59:02 -0000
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:3531:a6bb:df13:221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 0C8E020214;
 Tue, 14 May 2019 23:58:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1557842336; bh=nsrRcg9fWH5uRGVszzXOEO769HAoVESwmnpPNU2pnKg=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=KwPEh8MTWh3vS6L7mEFAz2VI8kJtYQ1Zqmv7YTWHB24NnwRPl0zLYIAhQuc/eHtGI
 3uw2aptP4e8GXSi2rOUIbsKKAe69yrKXMRACkAMqbaH7WQTHGYG3xXmP4ERMl/FPx7
 6yZZ1geDFsmXSLQxX4nJeA729rOePIusnASE4wYI=
Date: Tue, 14 May 2019 23:58:55 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Message-Id: <1557842335.2639.1@crc.id.au>
In-Reply-To: <7F4A58E9-CC4E-4F8C-98E9-ED5DEF2F8BE4@gmail.com>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <7F4A58E9-CC4E-4F8C-98E9-ED5DEF2F8BE4@gmail.com>
X-Mailer: geary/3.32.1
MIME-Version: 1.0
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
 Daniel Kiper <daniel.kiper@oracle.com>, marmarek@invisiblethingslab.com,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xensource.com,
 Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDExOjUwIFBNLCBMYXJzIEt1cnRoIDxsYXJzLmt1cnRo
LnhlbkBnbWFpbC5jb20+IAp3cm90ZToKPiBBcG9sb2dpZXMsCj4gSSBtaXhlZCB1cCBzb21lIHJl
ZmVyZW5jZXMKPiBMYXJzCj4gCi4uLgo+IFtBMl0gaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29t
L3Nob3dfYnVnLmNnaT9pZD0xMjY0MTAzCj4gW0IxXSBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5j
b20vc2hvd19idWcuY2dpP2lkPTE3MDM3MDAKCkJ1ZyBCMSBoZXJlIHdhcyBsb2RnZWQgYnkgbXlz
ZWxmLiBUaGVyZSBpcyBhbHNvIGEgcG9zdCB0byB4ZW4tZGV2ZWwgCnRpdGxlZCAicHlncnViIG5v
dCBzdGFydGluZyBmaXJzdCBtZW51ZW50cnkgaW4gRmVkb3JhIDMwIi4KCkkganVzdCBhZGRlZCBh
IGNvbW1lbnQgdGhlcmUgd2hpY2ggSSBzaGFsbCBwYXN0ZSBiZWxvdyB0byBpbmNsdWRlIHRob3Nl
IApub3Qgc3Vic2NyaWJlZCB0byB0aGF0IEJaOgoKVGhpbmtpbmcgYWJvdXQgdGhpcyBmdXJ0aGVy
IC0gYW5kIG5vdGljaW5nIGl0IGJlaW5nIHJlZmVyZW5jZWQgb24gCnhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QsIEkgd291bGQgbGlrZSB0byBzdWdnZXN0IHRoZSBmb2xsb3dpbmcgLSB3aGljaCAKbWF5
IGhhdmUgYmVlbiBvdmVybG9va2VkIHJpZ2h0IG5vdy4uLgoKSWYgdGhlIGdydWIgJXBvc3Qgc2Ny
aXB0aW5nIGNoZWNrZWQgdG8gc2VlIGlmIGl0IHdhcyBpbnN0YWxsaW5nIC8gCnVwZ3JhZGluZyBp
biBhIFhlbiBEb21VLCBpdCBjb3VsZCBzZXQgJ0dSVUJfRU5BQkxFX0JMU0NGRz1mYWxzZScgaW4g
Ci9ldGMvZGVmYXVsdC9ncnViIGF1dG9tYXRpY2FsbHkuIFRoaXMgd291bGQgZml4IGJvdGggbmV3
IGluc3RhbGxzIGFuZCAKdXBncmFkZXMuCgpUaGUgZmluYWwgZml4IHdvdWxkIGJlIGZpZ3VyaW5n
IG91dCB3aHkgcHlncnViIGN1cnJlbnRseSBib290cyB0aGUgCipzZWNvbmQqIGVudHJ5IGluIHRo
ZSByZXN1bHRpbmcgZ3J1Yi5jZmcgLSB1bmxpa2UgaG93IEYyOSB3b3JrZWQuIFRoaXMgCm1heSBi
ZSBlaXRoZXIgYSBmaXggb24gdGhlIGdydWIyLW1rY29uZmlnIG9yIHB5Z3J1YiBzaWRlIC0gSSdt
IG5vdCAKcXVpdGUgc3VyZSB5ZXQuIFRoaXMgd291bGQgbGlrZWx5IHJlc3RvcmUgZnVuY3Rpb25h
bGl0eSBjb21wbGV0ZWx5LiBBdCAKbGVhc3QgdW50aWwgc29tZXRoaW5nIGVsc2UgbW9yZSBzdWl0
YWJsZSBpcyBkb25lPwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
