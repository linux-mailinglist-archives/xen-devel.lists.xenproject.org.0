Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3C39FC19E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 20:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863124.1274590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQANp-00007i-U2; Tue, 24 Dec 2024 19:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863124.1274590; Tue, 24 Dec 2024 19:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQANp-000060-RA; Tue, 24 Dec 2024 19:15:57 +0000
Received: by outflank-mailman (input) for mailman id 863124;
 Tue, 24 Dec 2024 19:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XM6K=TR=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tQANn-00005t-QG
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 19:15:56 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e1182fd-c22b-11ef-a0da-8be0dac302b0;
 Tue, 24 Dec 2024 20:15:53 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 24 Dec 2024 20:15:52 +0100
Received: from ntu.. (88-183-119-157.subs.proxad.net [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id A95672BBE;
 Tue, 24 Dec 2024 20:15:51 +0100 (CET)
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
X-Inumbo-ID: 7e1182fd-c22b-11ef-a0da-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1735067753; x=1766603753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IjBPtK2nebnguRv2GGeWqFRJGmRT1xbvSMljCMOpWZs=;
  b=LgyhpEiHtFws1QJgzXlKGHbnKNEz8P01cH/K0CHCaVSsAgOpCeXPDxLy
   0HY38u1Ln6GzO+9exew9CRdm4l6+yJGA1Ps98rIrfdds17zpVITL26IuJ
   72S1jL2i+x6nTdkq45Hs9PtqVMp/msvDXr0KrQjwTwkPX8eLZTVwiUQ8c
   k=;
X-CSE-ConnectionGUID: zjRU/MpoTJKPOMflce3LaA==
X-CSE-MsgGUID: xx9eUykzQRCnGl7yZAQiFA==
X-IronPort-AV: E=Sophos;i="6.12,261,1728943200"; 
   d="scan'208";a="28314859"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
	Doug Goldstein <cardoe@cardoe.com>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 0/2] tools/libs,xen/tools: remove dead code
Date: Tue, 24 Dec 2024 20:13:53 +0100
Message-ID: <20241224191529.138119-1-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220165837.937976-1-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241220165837.937976-1-Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series addresses the Coverity IDs 1056148, 1056149, & 1458052.

Thank you,
---
v2:
* addresse feedback of Jan Beulich on expr.c

Ariel Otilibili (2):
  tools/libs: remove dead code
  xen/tools: remove dead code

 tools/libs/light/libxl_create.c |  1 -
 tools/libs/light/libxl_device.c |  1 -
 xen/tools/kconfig/expr.c        | 13 +++++--------
 3 files changed, 5 insertions(+), 10 deletions(-)

-- 
2.43.0


