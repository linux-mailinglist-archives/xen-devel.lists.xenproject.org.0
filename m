Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458841B5E1E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 16:44:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRd4d-0008Dm-DT; Thu, 23 Apr 2020 14:43:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oa1P=6H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jRd4b-0008Dh-W7
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 14:43:30 +0000
X-Inumbo-ID: cbab5a10-8570-11ea-938c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbab5a10-8570-11ea-938c-12813bfff9fa;
 Thu, 23 Apr 2020 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587653009;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KT99uiiLXXxW7b5WZsHxQ+NKDnuJktuqGQH/Vslb418=;
 b=F40VKq7Kpji2ig0R2IwHEA0gsdj1kA3T1s3DESBEu+UA1mAy6X5pSBvH
 etQ6bXjGXXQ3Bww0qzlm/QXkLAAFI5B3RR3r8tO+i2IX/YC5ortgMqlt8
 D2v3irayQi4pvsuavFYdS1lIa+A4opNmb6xcND4ELgNJM7RjBYL/Br5UF 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OolVIUDptq52i7xalbS+OChH4n9xumSf2OwlCbjh+a5/2jt51Jt3Vhz2izdflP0hqByt9pmkEV
 2q3Lrk1iCc08qyElGLk796LvmPsXMMx324WSu36hMV6BK94ayBsZ58kECyauXsYPaPpQYV/11c
 y9plY3vZt7KgV/NPapjupaKAnGUKxxhnz/UwAWudvPD8F6oW19JMf3vpE9ObO3+FFhQgzWl5UI
 XMm3dN1CxkaEChjf/3Ed1rx7ut/tX9NxPbmBgKLFwl5n3JZCAHXHBJYxFztsrIMai9rdnSByyU
 N4o=
X-SBRS: 2.7
X-MesageID: 16119446
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,307,1583211600"; d="scan'208";a="16119446"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH OSSTEST] examine/cpu: fix fetching number of threads
Date: Thu, 23 Apr 2020 16:43:03 +0200
Message-ID: <20200423144303.55251-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The way to fetch the number of threads from the output of xl info is
wrong, as the result of =~ is either true or false, but will never be a
numeric value.

Fix the regex to have a capture group in order to fetch the number of
threads, and store the capture in the threads variable.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 ts-examine-cpu | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ts-examine-cpu b/ts-examine-cpu
index 81cf7544..fbf01dfb 100755
--- a/ts-examine-cpu
+++ b/ts-examine-cpu
@@ -26,7 +26,8 @@ our ($whhost) = @ARGV;
 $whhost ||= 'host';
 our $ho= selecthost($whhost);
 our $info = target_cmd_output_root($ho, 'xl info', 10);
-our $threads = $info =~ /^threads_per_core\s*:\s.*/m;
+$info =~ /^threads_per_core\s*:\s(.*)$/m or die "missing or malformed info";
+our $threads = $1;
 
 logm("$ho->{Ident} threads per core: $threads");
 hostflag_putative_record($ho, "hw-smt", $threads > 1);
-- 
2.26.0


