Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759C11B96A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 17:59:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if5IW-0001th-8z; Wed, 11 Dec 2019 16:57:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K8rm=2B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1if5IU-0001tc-7K
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 16:57:10 +0000
X-Inumbo-ID: 41a3833a-1c37-11ea-8ba6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41a3833a-1c37-11ea-8ba6-12813bfff9fa;
 Wed, 11 Dec 2019 16:57:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4374AAD31;
 Wed, 11 Dec 2019 16:57:03 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Dec 2019 17:56:59 +0100
Message-Id: <20191211165659.29939-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH-for-4.13] build: fix tools/configure in case
 only python3 exists
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2FsbGluZyAuL2NvbmZpZ3VyZSB3aXRoIHB5dGhvbjMgYmVpbmcgdGhlcmUgYnV0IG5vIHB5dGhv
biwKdG9vbHMvY29uZmlndXJlIHdpbGwgZmFpbC4gRml4IHRoYXQgYnkgZGVmYXVsdGluZyB0byBw
eXRob24gYW5kCmZhbGxpbmcgYmFjayB0byBweXRob24zIG9yIHB5dGhvbjIuCgpXaGlsZSBhdCBp
dCBmaXggdGhlIHVzZSBvZiBub24gcG9ydGFibGUgInR5cGUgLXAiIGJ5IHJlcGxhY2luZyBpdCBi
eQpBQ19QQVRIX1BST0coKS4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KLS0tCiB0b29scy9jb25maWd1cmUuYWMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2Nv
bmZpZ3VyZS5hYyBiL3Rvb2xzL2NvbmZpZ3VyZS5hYwppbmRleCBhOGQ4Y2U1ZmZlLi44ZDg2YzQy
ZGU4IDEwMDY0NAotLS0gYS90b29scy9jb25maWd1cmUuYWMKKysrIGIvdG9vbHMvY29uZmlndXJl
LmFjCkBAIC0zMzcsOCArMzM3LDkgQEAgY2FzZSAiJGhvc3Rfb3MiIGluCiAgIGZyZWVic2QqKSA7
OwogICAqKSBBWF9QQVRIX1BST0dfT1JfRkFJTChbQkFTSF0sIFtiYXNoXSk7OwogZXNhYwotQVNf
SUYoW3Rlc3QgLXogIiRQWVRIT04iXSwgW1BZVEhPTj0icHl0aG9uIl0pCi1BU19JRihbZWNobyAi
JFBZVEhPTiIgfCBncmVwIC1xICJeLyJdLCBbXSwgW1BZVEhPTj1gdHlwZSAtcCAiJFBZVEhPTiJg
XSkKK0FTX0lGKFt0ZXN0IC16ICIkUFlUSE9OIl0sIFtBQ19DSEVDS19QUk9HUyhbUFlUSE9OXSwg
W3B5dGhvbiBweXRob24zIHB5dGhvbjJdLCBlcnIpXSkKK0FTX0lGKFt0ZXN0ICIkUFlUSE9OIiA9
ICJlcnIiXSwgW0FDX01TR19FUlJPUihbTm8gcHl0aG9uIGludGVycHJldGVyIGZvdW5kXSldKQor
QVNfSUYoW2VjaG8gIiRQWVRIT04iIHwgZ3JlcCAtcSAiXi8iXSwgW10sIFtBQ19QQVRIX1BST0co
W1BZVEhPTl0sIFskUFlUSE9OXSldKQogUFlUSE9OUEFUSD0kUFlUSE9OCiBQWVRIT049YGJhc2Vu
YW1lICRQWVRIT05QQVRIYAogCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
