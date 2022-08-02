Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A9587AA9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 12:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379234.612520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIp6R-0003KC-C3; Tue, 02 Aug 2022 10:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379234.612520; Tue, 02 Aug 2022 10:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIp6R-0003IK-9H; Tue, 02 Aug 2022 10:26:19 +0000
Received: by outflank-mailman (input) for mailman id 379234;
 Tue, 02 Aug 2022 10:26:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPpP=YG=citrix.com=prvs=206784369=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oIp6P-0003I8-UP
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 10:26:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8864a0c9-124d-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 12:26:16 +0200 (CEST)
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
X-Inumbo-ID: 8864a0c9-124d-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659435976;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g8qHfA+k31lfYHNyW/VAsPcgGwjMYWgfedDMiUiPkAo=;
  b=cqKMo7QE+PHhUgNxL6PZQxX8OYhU295t+OIFZwxedLU/ltAO45mlEW7a
   S5IBz/dxdChm88EMFp79cYSHa3gu/1QyOi1Q9TnR+IYTeH42+SkQvEsne
   EBcwqqLxnk6xgUoxA25+k/eXTxz1z9S3K8+CHw9bj9fzDc5UJPRxG5Adi
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79720150
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3808Uq2ZAvz0TnmYDvbD5bdxkn2cJEfYwER7XKvMYLTBsI5bpzIOz
 2ccUWnTOfaMYjajfNx+aIq/oBsFvJDRm98wQFFupC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrT8Ek35ZwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6892HUISN5Fbw6UpCnF26
 s1AKGtSUDnW0opawJrjIgVtrsEqLc2tN4IDoHBwizreCJ7KQ7iaHf+Mv4UBmm5t2IYeRp4yZ
 OJAAdZrRB3Gfx1IPEZREJ8klf2krnL+bydZuBSeoq9fD237k10uiuC0bYK9ltqiSNtbhRvCh
 3P93GHiIz4UCN6n8BuMyyf57gPItXyiA99DfFGizdZrn1+71mEVEAcRV1awvb++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSIC7
 EeYnPfjGX9W8+OeWUqCx++U9myMEH1ARYMdXhPoXTfp8vG6/txi0kqSF4s5eEKmpoarQG+tm
 lhmuAB73uxO1pBTis1X6Hid21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyD8hUVPlhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeRYybZdcIGS4M
 Ra7VeZtCHh7ZSLCUEOKS9jpV5RCIVbIT7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFrXXAZZoXY
 M7DGe7xXClyNEiS5GDpLwvr+eN0m3tWKKK6bcyT8ilLJpLFPCDFF+dVaQrUBg37hYvdyDjoH
 x9kH5Pi431ivCfWOUE7LaZ7wYg2EEUG
IronPort-HdrOrdr: A9a23:bZE5rKELWWSMYXCjpLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 STdZUgpHnJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qE/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.93,210,1654574400"; 
   d="scan'208";a="79720150"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [OSSTEST PATCH 0/2] osstest: Fix libvirt build
Date: Tue, 2 Aug 2022 11:26:00 +0100
Message-ID: <20220802102602.131992-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

libvirt now use meson+ninja instead of autoconf, so teach osstest to use that.

I ran a flight with that, here is the result:
"tolerable all pass"
http://logs.test-lab.xenproject.org/osstest/logs/172068/

Thanks,

Anthony PERARD (2):
  TestSupport: Add support for installing from backport repo
  ts-libvirt-build: Rework to build with meson

 Osstest/TestSupport.pm | 27 ++++++++++++++--
 ts-libvirt-build       | 70 +++++++++++++++++++++++++++++-------------
 ts-xen-build-prep      |  8 ++++-
 3 files changed, 81 insertions(+), 24 deletions(-)

-- 
Anthony PERARD


