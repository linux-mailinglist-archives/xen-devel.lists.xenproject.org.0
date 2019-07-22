Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7CC70BBB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2h-0002h1-CY; Mon, 22 Jul 2019 21:40:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2f-0002en-Js
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:21 +0000
X-Inumbo-ID: 4dba2799-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4dba2799-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 319B51597;
 Mon, 22 Jul 2019 14:40:20 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F8DB3F71F;
 Mon, 22 Jul 2019 14:40:19 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:39 +0100
Message-Id: <20190722213958.5761-17-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 16/35] xen/arm64: head: Rework and document
 launch()
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qm9vdCBDUFUgYW5kIHNlY29uZGFyeSBDUFVzIHdpbGwgdXNlIGRpZmZlcmVudCBlbnRyeSBwb2lu
dCB0byBDIGNvZGUuIEF0CnRoZSBtb21lbnQsIHRoZSBkZWNpc2lvbiBvbiB3aGljaCBlbnRyeSB0
byB1c2UgaXMgdGFrZW4gd2l0aGluIGxhdW5jaCgpLgoKSW4gb3JkZXIgdG8gYXZvaWQgYSBicmFu
Y2ggZm9yIHRoZSBkZWNpc2lvbiBhbmQgbWFrZSB0aGUgY29kZSBjbGVhcmVyLApsYXVuY2goKSBp
cyByZXdvcmtlZCB0byB0YWtlIGluIHBhcmFtZXRlcnMgdGhlIGVudHJ5IHBvaW50IGFuZCBpdHMK
YXJndW1lbnRzLgoKTGFzdGx5LCBkb2N1bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBtYWluIHJl
Z2lzdGVycyB1c2FnZSB3aXRoaW4gdGhlCmZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAg
ICAgICAtIFVzZSB4MyBpbnN0ZWFkIG9mIHg0CiAgICAgICAgLSBBZGQgYSBjbG9iYmVycyBzZWN0
aW9uCi0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDQzICsrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25z
KCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVh
ZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwppbmRleCBmMTY1ZGQ2MWNhLi43NTQxNjM1
MTAyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCisrKyBiL3hlbi9hcmNo
L2FybS9hcm02NC9oZWFkLlMKQEAgLTMxMiw2ICszMTIsMTEgQEAgcHJpbWFyeV9zd2l0Y2hlZDoK
ICAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUgVUFSVC4gKi8K
ICAgICAgICAgbGRyICAgeDIzLCA9RUFSTFlfVUFSVF9WSVJUVUFMX0FERFJFU1MKICNlbmRpZgor
ICAgICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCisgICAgICAgIC8qIFNldHVwIHRoZSBhcmd1
bWVudHMgZm9yIHN0YXJ0X3hlbiBhbmQganVtcCB0byBDIHdvcmxkICovCisgICAgICAgIG1vdiAg
IHgwLCB4MjAgICAgICAgICAgICAgICAgLyogeDAgOj0gUGh5c2ljYWwgb2Zmc2V0ICovCisgICAg
ICAgIG1vdiAgIHgxLCB4MjEgICAgICAgICAgICAgICAgLyogeDEgOj0gcGFkZHIoRkRUKSAqLwor
ICAgICAgICBsZHIgICB4MiwgPXN0YXJ0X3hlbgogICAgICAgICBiICAgICBsYXVuY2gKIEVORFBS
T0MocmVhbF9zdGFydCkKIApAQCAtMzc0LDYgKzM3OSw5IEBAIHNlY29uZGFyeV9zd2l0Y2hlZDoK
ICAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUgVUFSVC4gKi8K
ICAgICAgICAgbGRyICAgeDIzLCA9RUFSTFlfVUFSVF9WSVJUVUFMX0FERFJFU1MKICNlbmRpZgor
ICAgICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCisgICAgICAgIC8qIEp1bXAgdG8gQyB3b3Js
ZCAqLworICAgICAgICBsZHIgICB4MiwgPXN0YXJ0X3NlY29uZGFyeQogICAgICAgICBiICAgICBs
YXVuY2gKIEVORFBST0MoaW5pdF9zZWNvbmRhcnkpCiAKQEAgLTczMiwyMyArNzQwLDI2IEBAIHNl
dHVwX2ZpeG1hcDoKICAgICAgICAgcmV0CiBFTkRQUk9DKHNldHVwX2ZpeG1hcCkKIAorLyoKKyAq
IFNldHVwIHRoZSBpbml0aWFsIHN0YWNrIGFuZCBqdW1wIHRvIHRoZSBDIHdvcmxkCisgKgorICog
SW5wdXRzOgorICogICB4MCA6IEFyZ3VtZW50IDAgb2YgdGhlIEMgZnVuY3Rpb24gdG8gY2FsbAor
ICogICB4MSA6IEFyZ3VtZW50IDEgb2YgdGhlIEMgZnVuY3Rpb24gdG8gY2FsbAorICogICB4MiA6
IEMgZW50cnkgcG9pbnQKKyAqCisgKiBDbG9iYmVycyB4MworICovCiBsYXVuY2g6Ci0gICAgICAg
IFBSSU5UKCItIFJlYWR5IC1cclxuIikKLQotICAgICAgICBsZHIgICB4MCwgPWluaXRfZGF0YQot
ICAgICAgICBhZGQgICB4MCwgeDAsICNJTklUSU5GT19zdGFjayAvKiBGaW5kIHRoZSBib290LXRp
bWUgc3RhY2sgKi8KLSAgICAgICAgbGRyICAgeDAsIFt4MF0KLSAgICAgICAgYWRkICAgeDAsIHgw
LCAjU1RBQ0tfU0laRSAgICAvKiAod2hpY2ggZ3Jvd3MgZG93biBmcm9tIHRoZSB0b3ApLiAqLwot
ICAgICAgICBzdWIgICB4MCwgeDAsICNDUFVJTkZPX3NpemVvZiAvKiBNYWtlIHJvb20gZm9yIENQ
VSBzYXZlIHJlY29yZCAqLwotICAgICAgICBtb3YgICBzcCwgeDAKLQotICAgICAgICBjYm56ICB4
MjIsIDFmCi0KLSAgICAgICAgbW92ICAgeDAsIHgyMCAgICAgICAgICAgICAgICAvKiBNYXJzaGFs
IGFyZ3M6IC0gcGh5c19vZmZzZXQgKi8KLSAgICAgICAgbW92ICAgeDEsIHgyMSAgICAgICAgICAg
ICAgICAvKiAgICAgICAgICAgICAgIC0gRkRUICovCi0gICAgICAgIGIgICAgIHN0YXJ0X3hlbiAg
ICAgICAgICAgICAgLyogYW5kIGRpc2FwcGVhciBpbnRvIHRoZSBsYW5kIG9mIEMgKi8KLTE6Ci0g
ICAgICAgIGIgICAgIHN0YXJ0X3NlY29uZGFyeSAgICAgICAgLyogKHRvIHRoZSBhcHByb3ByaWF0
ZSBlbnRyeSBwb2ludCkgKi8KKyAgICAgICAgbGRyICAgeDMsID1pbml0X2RhdGEKKyAgICAgICAg
YWRkICAgeDMsIHgzLCAjSU5JVElORk9fc3RhY2sgLyogRmluZCB0aGUgYm9vdC10aW1lIHN0YWNr
ICovCisgICAgICAgIGxkciAgIHgzLCBbeDNdCisgICAgICAgIGFkZCAgIHgzLCB4MywgI1NUQUNL
X1NJWkUgICAgLyogKHdoaWNoIGdyb3dzIGRvd24gZnJvbSB0aGUgdG9wKS4gKi8KKyAgICAgICAg
c3ViICAgeDMsIHgzLCAjQ1BVSU5GT19zaXplb2YgLyogTWFrZSByb29tIGZvciBDUFUgc2F2ZSBy
ZWNvcmQgKi8KKyAgICAgICAgbW92ICAgc3AsIHgzCisKKyAgICAgICAgLyogSnVtcCB0byBDIHdv
cmxkICovCisgICAgICAgIGJyICAgIHgyCiBFTkRQUk9DKGxhdW5jaCkKIAogLyogRmFpbC1zdG9w
ICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
