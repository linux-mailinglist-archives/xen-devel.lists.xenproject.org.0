Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8AAEB390
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:12:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQC5U-0007Ow-Ak; Thu, 31 Oct 2019 15:10:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msrb=YY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQC5S-0007N3-BX
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:10:10 +0000
X-Inumbo-ID: 7ac3ffc6-fbf0-11e9-954c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7ac3ffc6-fbf0-11e9-954c-12813bfff9fa;
 Thu, 31 Oct 2019 15:09:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E95CE4F5;
 Thu, 31 Oct 2019 08:09:47 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09E493F71E;
 Thu, 31 Oct 2019 08:09:46 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2019 15:09:15 +0000
Message-Id: <20191031150922.22938-13-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191031150922.22938-1-julien.grall@arm.com>
References: <20191031150922.22938-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 v4 12/19] xen/arm: traps: Don't ignore
 invalid value for serrors=
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
Cc: jgross@suse.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

c2Vycm9ycz0gb25seSBzdXBwb3J0cyAzIHZhbHVlcyAiZGl2ZXJzZSIsICJmb3J3YXJkIiBhbmQg
InBhbmljIi4KClRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIHBhcnNlX3NlcnJvcnNfYmVo
YXZpb3IoKSB3aWxsIGRlZmF1bHQgdG8KImRpdmVyc2UiIGZvciBhbnkgaW52YWxpZCB2YWx1ZSBh
bmQgbm90IHRlbGwgdGhlIHVzZXJzLgoKUmF0aGVyIHRoYW4gaWdub3JlIHRoZSBpbnZhbGlkIGlu
cHV0LCByZXR1cm4gYW4gZXJyb3IgdG8gdGhlIGNhbGxlciBzbwppdCBjYW4gZGVjaWRlcyB0aGUg
YmUgYXBwcm9hY2guCgpUaGlzIHdpbGwgYmUgdXNlZnVsIGFmdGVyIGEgZm9sbG93LXVwIHBhdGNo
IHdoZXJlIHRoZSBudW1iZXIgb2Ygb3B0aW9ucwp3aWxsIGJlIHJlZHVjZWQuCgpUYWtlIHRoZSBv
cHBvcnR1bml0eSB0byBpbml0aWFsaXplIHNlcnJvcnNfb3AgdG8gU0VSUk9SU19ESVZFUlNFIHJh
dGhlcgp0aGFuIHJlbHlpbmcgb24gdGhlIGl0ZW0gdG8gYmUgdGhlIGZpcnN0IGluIHRoZSBlbnVt
IGFuZCB0aGVyZWZvcmUKZXF1YWwgdG8gMC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbiA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MzoKICAgICAgICAtIEFk
ZCBTdGVmYW5vJ3MgcmV2aWV3ZWQtYnkKCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gUGF0
Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9hcm0vdHJhcHMuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKaW5kZXggY2I0ZTNiNjI3Yi4u
ZDAyOGVjOTIyNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3RyYXBzLmMKKysrIGIveGVuL2Fy
Y2gvYXJtL3RyYXBzLmMKQEAgLTEwNCwxNCArMTA0LDE2IEBAIHJlZ2lzdGVyX3QgZ2V0X2RlZmF1
bHRfaGNyX2ZsYWdzKHZvaWQpCiBzdGF0aWMgZW51bSB7CiAgICAgU0VSUk9SU19ESVZFUlNFLAog
ICAgIFNFUlJPUlNfUEFOSUMsCi19IHNlcnJvcnNfb3A7Cit9IHNlcnJvcnNfb3AgPSBTRVJST1JT
X0RJVkVSU0U7CiAKIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3NlcnJvcnNfYmVoYXZpb3IoY29u
c3QgY2hhciAqc3RyKQogewogICAgIGlmICggIXN0cmNtcChzdHIsICJwYW5pYyIpICkKICAgICAg
ICAgc2Vycm9yc19vcCA9IFNFUlJPUlNfUEFOSUM7Ci0gICAgZWxzZQorICAgIGVsc2UgaWYgKCAh
c3RyY21wKHN0ciwgImRpdmVyc2UiKSApCiAgICAgICAgIHNlcnJvcnNfb3AgPSBTRVJST1JTX0RJ
VkVSU0U7CisgICAgZWxzZQorICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAogICAgIHJldHVybiAw
OwogfQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
