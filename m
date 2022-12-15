Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048EB64DF67
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 18:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463627.721853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rls-0007Zf-Ca; Thu, 15 Dec 2022 17:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463627.721853; Thu, 15 Dec 2022 17:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rls-0007X8-9H; Thu, 15 Dec 2022 17:11:48 +0000
Received: by outflank-mailman (input) for mailman id 463627;
 Thu, 15 Dec 2022 17:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vu2t=4N=citrix.com=prvs=3415489ca=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1p5rlr-0007X2-19
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 17:11:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c98a34a-7c9b-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 18:11:45 +0100 (CET)
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
X-Inumbo-ID: 8c98a34a-7c9b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671124305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iTlxCGPd4Kl2cYH9zKyDOwQTkqm7B5hA8C/nt1Sd85s=;
  b=BYry8Z/2VD0dxdUQBdUBgEeaHLjYWpQCiLPPlGQWCOiTZv6LNkSDhm7h
   HviqMPuXP640DZ3ESagFiJbGHwwsTqds5KnU8yXLMaCIYweyQ7OSv9Lyf
   mVeb+xNtfnfUBtx8iLf5jcTPkmc0ZWz5/77a2SXXe4U8mkuiy25wUuN1J
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88107940
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:v40jaKqs9okdEHPkLd6lNv9XllFeBmIKZRIvgKrLsJaIsI4StFCzt
 garIBnUb/7eZWWge9EgPouw800PsJHVz9M1HgM/qiA1QS8b95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEziRNUfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAoIQROmv9iU+qK2c+NMqPsCF/ioY6pK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7Wz9VrlSUq6ctpWje1gZ8yqTFO9vJYN2aA85Smy50o
 0qWrz2hXUBGbLRzzxLc1yuQotDSmBjBVY82DpeG39k13wCqkzl75Bo+CgLg/KjRZlSFc81bA
 1wZ/Gwpt6da3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZTEAzNrGmLsRtALCd9xDPpGUtey2Rhill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkkfC+F0e5eI1cFh
 XM/XisPjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwOhfIgzqzzRl2z/tX1
 XKnnSCEVy5y5UNPlWreegvg+eVzmnBWKZ37G/gXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 483Cid+8D0GCLeWSnCOoeYuwaUicSBT6Wbe95YGKYZu42NORAkcNhMm6ex7ItY9xPgOyo8lP
 BiVAydl9bY2vlWfQS3iV5ypQO+HsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:iz0kaqC+ZhyEaEvlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo8f
 xG/c5rrSMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 5dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.96,248,1665460800"; 
   d="scan'208";a="88107940"
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: <jennifer.herbert@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v2 0/2] acpi: Make TPM version configurable.
Date: Thu, 15 Dec 2022 17:09:32 +0000
Message-ID: <20221215170934.123889-1-jennifer.herbert@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
References: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch makes the TPM version, for which the ACPI library probes, configurable.
This version incorpates feedback from v1, including splitting it into
two patches, tidying up some formatting, removing debug, and moving the
log into a more suitable memory area.

Jennifer Herbert (2):
  acpi: Make TPM version configurable.
  acpi: Add TPM2 interface definition.

 docs/misc/xenstore-paths.pandoc   |   8 +++
 tools/firmware/hvmloader/config.h |   1 +
 tools/firmware/hvmloader/util.c   |  20 +++++-
 tools/libacpi/Makefile            |   2 +-
 tools/libacpi/acpi2_0.h           |  26 ++++++++
 tools/libacpi/build.c             | 101 +++++++++++++++++++++---------
 tools/libacpi/libacpi.h           |   5 +-
 tools/libacpi/ssdt_tpm2.asl       |  36 +++++++++++
 8 files changed, 165 insertions(+), 34 deletions(-)
 create mode 100644 tools/libacpi/ssdt_tpm2.asl

-- 
2.31.1


