Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2811437B0A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 18:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215199.374244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxYM-0004JL-DH; Fri, 22 Oct 2021 16:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215199.374244; Fri, 22 Oct 2021 16:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxYM-0004Gh-84; Fri, 22 Oct 2021 16:37:58 +0000
Received: by outflank-mailman (input) for mailman id 215199;
 Fri, 22 Oct 2021 16:37:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VW94=PK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mdxYK-0004GW-6H
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:37:56 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6807eb3c-3356-11ec-83c9-12813bfff9fa;
 Fri, 22 Oct 2021 16:37:55 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6807eb3c-3356-11ec-83c9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634920675;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tIg+M538g0DwCkamXnfy8wOB2B6LeDFbdsRlcsn6Hog=;
  b=APMaQzChHSQDGrNZYvXRQM84yXsPQ+WmwVO/nUCQiSbGQSyeZp4Hp7qi
   3t1AIGghdA2RqZYw+JMSJnEVPAooHRve3VJ0eh/taZUTeWHXOOgk8JkHR
   XkaYon7Uh5Ueua9TKRbJEfp9o9p5NHzw81NN60H2f5Np0iHLZ8e9bu3by
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8OyI/AG1XXA/sLHurCn3f0qzBdBktJEKfO3WVENfAYtQROWIINhjMyvPf1LgC87ZU0yGNpPf1f
 KAseH+eBRL4MoM0qeOSjN5llh+SLzYwLUxShUJGhUzqDIlpLRSJIsUBoejvww8Xy0k89JeDu8+
 5syXq4KnhQp+4kTUvicolUWvAoxtVlTRciJ3cbWylE56qZFfua3L7D/nsdfk+yfjKzJ2CsyBWp
 BNUvTnt01g/LcmFnGlEUF1lr/nCrIvNSNE64N6+gX21eu8zAgMYvli1h3fWEJPU5YICSsdtEjt
 RPix77CTPts79R27l1v7bdgy
X-SBRS: 5.1
X-MesageID: 57766901
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yRtj/axMk2U2N2n5elV6t+fFwSrEfRIJ4+MujC+fZmUNrF6WrkUFx
 2McC2CBbPmLamCje4wkaYWxo08F6pGEyoNhGgtlqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6w7Rj2tUAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+Aul
 uVGkJWKcwN3H5TyistHdQRFKhgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY258RQ6iPP
 5NxhTxHbg3+UwNWERQsNbllgtqBlFf7aGdYkQfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKO+2iggeLnlirhVIUfUra/85ZCgUKR7nweDgUMUlm2quX/jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwB6J4rrZ5UCeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYULCqIefiDqIAyxLDFY8dwBeaxYY2uC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7kpQ6f0lpAsrCMF1RvvlyGAQpJ+ysgPNb9D7FE/2Q3+hqpwGyxdVKGo
 GQf0/aX6OQDHPlhfwTcHb1TQtlFCxuDWQAwYGKD/bF9qFxBGFb5JOi8BQ2Swm8zbq7onheyO
 CfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlTbrH03Oh7IhD28+KTJrU3ZE
 c3HGSpLJS1CYZmLMRLsH7tNuVPV7nBWKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cABbRVBmVMueg5EGKYa+zv9ORThJ5wn5muh6JeSIXs19y4/1w
 51KchUHkweu1SGddW1nqBlLMdvSYHq2llpjVQREALpi8yFLjV+H4PhNep0pU6Mg8eA/n/d4Q
 +NcI5eLA+hVSySB8DMYNMGvoItnfRWtpASPIyv6P2RvI88+H1TEqo3+Yw/i1CgSFS7r58Ewl
 KKti1HASp0ZSgU8UMuPMKCzz0m8tGQ2kf5pWxeaOcFafUjhqdA4KyH4gvItDdsLLBHPmmmT2
 wqMWE9KrujRuY4lttLOgPnc/YuuFuJ/GGtcHnXasunqZXWLoDL7zNYZAuiSfD3bWGflw4mYZ
 L1Yn6PmLfkKvFdWqI4gQbxl+r0zuon0rLhAwwU6QHiSNwa3CqltK2Wt1NVUsvEf3adQvAa7V
 x7d+tRePrnVasrpHERIeVggZ+WHk/oVhiPT/bI+J0CjvH17+7+OUENzORiQiXMCcOspYd19m
 epx6tQL7wGfiwYxNofUhy9ZwG2AM3gcXvh1rZodGoLq1lImx1wqjUYw0cMqDEVjs+lxD3Q=
IronPort-HdrOrdr: A9a23:ALPcqaG4YnZ4cu9WpLqE4seALOsnbusQ8zAXP0AYc3Nom6uj5q
 WTdZUgpHjJYVkqOU3I9ersBEDiewK/yXcW2+ks1N6ZNWGM0ldARLsSibcKqAePJ8SRzIJgPN
 9bAstDNOE=
X-IronPort-AV: E=Sophos;i="5.87,173,1631592000"; 
   d="scan'208";a="57766901"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <iwj@xenproject.org>, <sstabellini@kernel.org>,
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	"Doug Goldstein" <cardoe@cardoe.com>
Subject: [XEN PATCH] automation: actually build with clang for ubuntu-focal-clang* jobs
Date: Fri, 22 Oct 2021 17:36:44 +0100
Message-ID: <20211022163644.547018-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/gitlab-ci/build.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d177da1710d7..08a43146aba8 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -429,12 +429,12 @@ ubuntu-focal-gcc-debug:
     CONTAINER: ubuntu:focal
 
 ubuntu-focal-clang:
-  extends: .gcc-x86-64-build
+  extends: .clang-x86-64-build
   variables:
     CONTAINER: ubuntu:focal
 
 ubuntu-focal-clang-debug:
-  extends: .gcc-x86-64-build-debug
+  extends: .clang-x86-64-build-debug
   variables:
     CONTAINER: ubuntu:focal
 
-- 
Anthony PERARD


