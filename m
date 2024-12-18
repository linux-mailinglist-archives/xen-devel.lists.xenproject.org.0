Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7489F70ED
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 00:39:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860750.1272746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tO3cF-0007t8-AA; Wed, 18 Dec 2024 23:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860750.1272746; Wed, 18 Dec 2024 23:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tO3cF-0007qk-7W; Wed, 18 Dec 2024 23:38:07 +0000
Received: by outflank-mailman (input) for mailman id 860750;
 Wed, 18 Dec 2024 23:38:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v9KU=TL=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tO3cD-0007cb-Kp
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 23:38:05 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20c74b54-bd99-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 00:38:05 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 19 Dec 2024 00:38:04 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id A4113220E;
 Thu, 19 Dec 2024 00:38:04 +0100 (CET)
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
X-Inumbo-ID: 20c74b54-bd99-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734565085; x=1766101085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5QaKobd7b9odKGMX5HCBA+z80oGMre/u1pGcu2wcmn4=;
  b=gL8Vy3pxFnQ5qT2qJfNnC8WEeTf6AaIQyhm8c5dzrtqj8YJHEAVFE8+x
   mWDw2KEKPfEdn3M7GXqrYsHKQlrCZN/UpoduxOuaG+9vBj6Cn5OMIdWEp
   qloRiy9YKDU0heCdtIJj98mXM0cPdppTzTqZb99JTQw7rxJzyWmdeWjpP
   4=;
X-CSE-ConnectionGUID: S2Z35sNeRruTDq9YoVJcBg==
X-CSE-MsgGUID: 10mpN/WLSJSo2rKjFu0TZw==
X-IronPort-AV: E=Sophos;i="6.12,246,1728943200"; 
   d="scan'208";a="28246237"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/1] xen/common: Remove dead code
Date: Thu, 19 Dec 2024 00:34:52 +0100
Message-ID: <20241218233659.573195-3-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218233659.573195-2-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241218233659.573195-2-Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The if-statement tests `res` is non-zero; meaning the case zero is never reached.

Coverity-ID: 1055253
Fixes: e2b1ebf4de ("x86: Support booting a bzImage format domain 0 kernel.")
Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
--
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/gzip/inflate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index b9a2d7a23a..cb146555c8 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -1164,8 +1164,6 @@ static int __init gunzip(struct gunzip_state *s)
     if ( (res = inflate(s)) )
     {
         switch (res) {
-        case 0:
-            break;
         case 1:
             error("invalid compressed format (err=1)");
             break;
-- 
2.47.1


