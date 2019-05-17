Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690932173B
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 12:48:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRaNR-0005Ke-DZ; Fri, 17 May 2019 10:46:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRaNQ-0005KT-2Y
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:46:12 +0000
X-Inumbo-ID: fbef76d3-7890-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fbef76d3-7890-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 10:46:11 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:46:10 -0600
Message-Id: <5CDE90F2020000780023006F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:46:10 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v3 03/15] x86/IRQ: improve dump_irqs()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9uJ3QgbG9nIGEgc3RyYXkgdHJhaWxpbmcgY29tbWEuIFNob3J0ZW4gYSBmZXcgZmllbGRzLgoK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgotLS0gYS94ZW4vYXJj
aC94ODYvaXJxLmMKKysrIGIveGVuL2FyY2gveDg2L2lycS5jCkBAIC0yMzM0LDcgKzIzMzQsNyBA
QCBzdGF0aWMgdm9pZCBkdW1wX2lycXModW5zaWduZWQgY2hhciBrZXkpCiAKICAgICAgICAgc3Bp
bl9sb2NrX2lycXNhdmUoJmRlc2MtPmxvY2ssIGZsYWdzKTsKIAotICAgICAgICBwcmludGsoIiAg
IElSUTolNGQgYWZmaW5pdHk6JSpwYiB2ZWM6JTAyeCB0eXBlPSUtMTVzIHN0YXR1cz0lMDh4ICIs
CisgICAgICAgIHByaW50aygiICAgSVJROiU0ZCBhZmY6JSpwYiB2ZWM6JTAyeCAlLTE1cyBzdGF0
dXM9JTAzeCAiLAogICAgICAgICAgICAgICAgaXJxLCBucl9jcHVfaWRzLCBjcHVtYXNrX2JpdHMo
ZGVzYy0+YWZmaW5pdHkpLCBkZXNjLT5hcmNoLnZlY3RvciwKICAgICAgICAgICAgICAgIGRlc2Mt
PmhhbmRsZXItPnR5cGVuYW1lLCBkZXNjLT5zdGF0dXMpOwogCkBAIC0yMzQ1LDIzICsyMzQ1LDIx
IEBAIHN0YXRpYyB2b2lkIGR1bXBfaXJxcyh1bnNpZ25lZCBjaGFyIGtleSkKICAgICAgICAgewog
ICAgICAgICAgICAgYWN0aW9uID0gKGlycV9ndWVzdF9hY3Rpb25fdCAqKWRlc2MtPmFjdGlvbjsK
IAotICAgICAgICAgICAgcHJpbnRrKCJpbi1mbGlnaHQ9JWQgZG9tYWluLWxpc3Q9IiwgYWN0aW9u
LT5pbl9mbGlnaHQpOworICAgICAgICAgICAgcHJpbnRrKCJpbi1mbGlnaHQ9JWQlYyIsCisgICAg
ICAgICAgICAgICAgICAgYWN0aW9uLT5pbl9mbGlnaHQsIGFjdGlvbi0+bnJfZ3Vlc3RzID8gJyAn
IDogJ1xuJyk7CiAKLSAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgYWN0aW9uLT5ucl9ndWVz
dHM7IGkrKyApCisgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IGFjdGlvbi0+bnJfZ3Vlc3Rz
OyApCiAgICAgICAgICAgICB7Ci0gICAgICAgICAgICAgICAgZCA9IGFjdGlvbi0+Z3Vlc3RbaV07
CisgICAgICAgICAgICAgICAgZCA9IGFjdGlvbi0+Z3Vlc3RbaSsrXTsKICAgICAgICAgICAgICAg
ICBwaXJxID0gZG9tYWluX2lycV90b19waXJxKGQsIGlycSk7CiAgICAgICAgICAgICAgICAgaW5m
byA9IHBpcnFfaW5mbyhkLCBwaXJxKTsKLSAgICAgICAgICAgICAgICBwcmludGsoIiV1OiUzZCgl
YyVjJWMpIiwKKyAgICAgICAgICAgICAgICBwcmludGsoImQlZDolM2QoJWMlYyVjKSVjIiwKICAg
ICAgICAgICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCBwaXJxLAogICAgICAgICAgICAgICAg
ICAgICAgICBldnRjaG5fcG9ydF9pc19wZW5kaW5nKGQsIGluZm8tPmV2dGNobikgPyAnUCcgOiAn
LScsCiAgICAgICAgICAgICAgICAgICAgICAgIGV2dGNobl9wb3J0X2lzX21hc2tlZChkLCBpbmZv
LT5ldnRjaG4pID8gJ00nIDogJy0nLAotICAgICAgICAgICAgICAgICAgICAgICAoaW5mby0+bWFz
a2VkID8gJ00nIDogJy0nKSk7Ci0gICAgICAgICAgICAgICAgaWYgKCBpICE9IGFjdGlvbi0+bnJf
Z3Vlc3RzICkKLSAgICAgICAgICAgICAgICAgICAgcHJpbnRrKCIsIik7CisgICAgICAgICAgICAg
ICAgICAgICAgIGluZm8tPm1hc2tlZCA/ICdNJyA6ICctJywKKyAgICAgICAgICAgICAgICAgICAg
ICAgaSA8IGFjdGlvbi0+bnJfZ3Vlc3RzID8gJywnIDogJ1xuJyk7CiAgICAgICAgICAgICB9Ci0K
LSAgICAgICAgICAgIHByaW50aygiXG4iKTsKICAgICAgICAgfQogICAgICAgICBlbHNlIGlmICgg
ZGVzYy0+YWN0aW9uICkKICAgICAgICAgICAgIHByaW50aygiJXBzKClcbiIsIGRlc2MtPmFjdGlv
bi0+aGFuZGxlcik7CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
