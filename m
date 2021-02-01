Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EA330AA51
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 15:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79931.145805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6adT-0002AL-Tu; Mon, 01 Feb 2021 14:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79931.145805; Mon, 01 Feb 2021 14:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6adT-00029w-QK; Mon, 01 Feb 2021 14:57:03 +0000
Received: by outflank-mailman (input) for mailman id 79931;
 Mon, 01 Feb 2021 14:57:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6adS-00029l-JC
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:57:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9c5d348-d9cd-422d-a2be-e0cf2a827521;
 Mon, 01 Feb 2021 14:57:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD1BAAB92;
 Mon,  1 Feb 2021 14:56:59 +0000 (UTC)
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
X-Inumbo-ID: e9c5d348-d9cd-422d-a2be-e0cf2a827521
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612191419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gpjsoXyymi3tg3gNQWwGrxdoOaO5dOb3D73T4UALbJY=;
	b=O4jT9VS+Vw7V5cpYT9lciX+jT/8jHDht0cw27NOF7UCQLEainrdSOaNGOvaRB+ZJiljoYE
	LoAbHbV8uhV2xWmmlyxWrxP5zhy9Ih39kc+rmJMoov71Z3Bl18IzCufXUz5SXHL02CyH5m
	Kye9Ycd/Uy1LVsc+szPH+qUW7qddjFY=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/build: correctly record dependencies of asm-offsets.s
Message-ID: <b3b57f6b-3ed9-18f6-2a87-6af3304c6645@suse.com>
Date: Mon, 1 Feb 2021 15:56:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Going through an intermediate *.new file requires telling the compiler
what the real target is, so that the inclusion of the resulting .*.d
file will actually be useful.

Fixes: 7d2d7a43d014 ("x86/build: limit rebuilding of asm-offsets.h")
Reported-by: Julien Grall <julien@xen.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Already on the original patch I did suggest that perhaps Arm would want
to follow suit. So again - perhaps the rules should be unified by moving
to common code?

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -241,7 +241,7 @@ efi/buildid.o efi/relocs-dummy.o: $(BASE
 efi/buildid.o efi/relocs-dummy.o: ;
 
 asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c $(BASEDIR)/include/asm-x86/asm-macros.h
-	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new $<
+	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
 	$(call move-if-changed,$@.new,$@)
 
 asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P

