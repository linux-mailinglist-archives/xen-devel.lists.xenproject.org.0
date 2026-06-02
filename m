Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9XBXFLfLHmrmVAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:25:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48A62E01F
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:25:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm3 header.b=dtAfrfNZ;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=eG0a4Eeb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1324902.1590412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOBL-0001Ae-Rp; Tue, 02 Jun 2026 12:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324902.1590412; Tue, 02 Jun 2026 12:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOBL-00018R-Oo; Tue, 02 Jun 2026 12:25:19 +0000
Received: by outflank-mailman (input) for mailman id 1324902;
 Tue, 02 Jun 2026 12:25:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <accek@invisiblethingslab.com>) id 1wUOBK-00017j-Er
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:25:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOBJ-00HArZ-Kn
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:25:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a1ecbaa-e002-0a2a0a5209dd-0a2a4505e5ac-12
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:25:17 +0200
Received: from [103.168.172.154] (helo=fhigh-a3-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a1ecbac-aaa8-0a2a45050019-67a8ac9a9113-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:25:17 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 12CDE140028D;
 Tue,  2 Jun 2026 08:25:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Tue, 02 Jun 2026 08:25:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 08:25:14 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1780403116; x=1780489516; bh=lc9LRteUWG74zsyPypriXZmN2GLT8md7
	B+LJjmGTj7Q=; b=dtAfrfNZrZQBKdUvugzrLAGY5TrFZ8hOJ7oYwPkAblT+FeyV
	wAMPhbzVG/Le040NlDvyZgQ0ByaLoZvuCDtxL4mAsT0xdwKzyCpxUmLN6IDML65p
	K+82JSaoHvEEPR0P5IYHR0Kd5ovpD8WF93vLFrjzT7qXGe/AoYTpLPHVRl9BjJH1
	loC/8nvulJ16rbR4bajR+RiYxhCAj7Dx77yLKZQ4hc+y/uIL+HzC7zSDhwOeB2Yw
	kdncNYEjjuKFEmsxwsU5ORIjqOhnLS7JlYQloSCp0OPg1vHGM6QXrY24eQmQkZrv
	Z81vCM+OaB007erneoi+vPlFaPy1dKxEj6N6ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1780403116; x=1780489516; bh=lc9LRteUWG74zsyPypriXZmN2GLT
	8md7B+LJjmGTj7Q=; b=eG0a4EebvFx7B75qpOsmGhwNl45WFiiqHEcGolwl0tbF
	40DR9txF+EMp7SL43MRtc1QJr7/SDk+pHxRFMU+1G6XA5gBfQnd5CS2D+v6AkDZR
	WqgU/79Qi+XhTrSksAzed4JXhxBxQOhTbg4/ZFPbThA7Mugqt8HyzZOj+F6wvKu3
	jky81Xm8dfSKewfGZvIbQUq6qXJX3qMATAF9hgIZNy7YBfYhfGE4sIZ1cs3iQfCy
	Voc3GFTTZQ/MD4puvr3QJCUllIZHMOioPZLZYhQGoCkOMLNGEtUc3eLkFoGzeOzE
	jiyUKBLAxAn9cz/awh8XJAcoEWbJP4C2K7Lhz85Gyw==
X-ME-Sender: <xms:q8seat2d4x1pRWjAnEO-nWRbua68O_4U-AEm2tnX-1MEylMPN1zGkw>
    <xme:q8seaq-rp4LdTtDGc-0pDjvULg_7BJidb2USpBOZc-OuQU3T7BKqpIUNcNeOEt3aT
    lkuSa_MzsxHk3fAKMpWAnjwYjUjJRGjmfDakIivFaU_TbIoX9Q>
X-ME-Received: <xmr:q8seamPmCfCE9Y1Zqa8Sx19d7-VHZHvuPMgi6-tDfQ7BZ3edovim3BJ1>
X-ME-Proxy-Cause: dmFkZTE6sp2OWoUQaNwRuAX0Dr0nJaYr2Y7RwpR8lcJtWFKPVOLwktdFbr+iVUrYoQ/YoB
    cVKDDEqlNu+nigdJJhP+e4JHZb8UCebI5xj0Aw2wPa0bSAGFkVviNTFhfu3hChJQ8fCqqO
    dndpGbpsWXw7T9Eh77MjS8mybUP3QWvXF+XRYYSE2CVbuiiCjHx3NXT0iCqECpFKSd1TN4
    6r2zLLD7VcI4/zvnw+pmR7rvjb0nzgbzjWIhqIk2vX+ssSPLOjEov9JbeADmBTMG+6CByp
    qZ3azdFQly3levwnWMxcX3UD9z7zueUpogb9vHOPowYO8q29HP7EvDiAsbSQA+bHsnnShA
    lIoDgYVfRzK+2Huw16QKiQ7xmUCd8brtqRTpnwme1n27Hf64EF2tVp8IAbFgJyqEeD3Syk
    hSfU+20oqHJ2233t8DEXwNrlsS3+OmC+QFfpeR0pLFuwYB5yuXXp2war3g3ZfKsmtWh1O3
    pZqNpIk7gSG/Fp1kvXRUu5KHLd/ZzoWib3WM8StJ6LyWqwJKpTC1TtlfVgZ5FuColhwaNE
    T1MnN7PXp0m8yuYwuB2F2SjpnhZsnM9mznuaD7myfKHkJwE8pyce9fzLwCQG2fK7jRt/VL
    bfTda++WwMwoZKJaisOo/BeoC03OElhoyCSQlLhUnfqb2UD6Jvwmtg32kTgg
X-ME-Proxy: <xmx:q8seamc0GdzHaI9Y_4yJCmbtIwRLvgJDCZ49-ZGWcjKSG6uXbohlHw>
    <xmx:q8seatWW2TFg080s39ixaBeLsaFMDuF9ShkfR90PbLnWOgUw8xXtBA>
    <xmx:q8seamjwgH0I8k4uPlCrVcJ4Lkft_4UqsFIB2Q8N6HtJWLnqXLCblA>
    <xmx:q8seak8U_W2v-HecEz1_c7THuK33V45kf1_XCWW75hOJTAbaCkWlXg>
    <xmx:rMseav7i5PHQSFvU4s4NHRc-WRY4DcFyH6TPTXLY2NCps480Gj0SXsce>
Feedback-ID: i792e4853:Fastmail
From: =?UTF-8?q?Szymon=20Aceda=C5=84ski?= <accek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Szymon=20Aceda=C5=84ski?= <accek@invisiblethingslab.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/efi: Use blexit() instead of BUG_ON() in read_file()
Date: Tue,  2 Jun 2026 14:24:41 +0200
Message-ID: <20260602122441.2961974-1-accek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780403117-DA374443-A3B907D3/0/0
X-purgate-type: clean
X-purgate-size: 1306
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:accek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,messagingengine.com:dkim,invisiblethingslab.com:mid,invisiblethingslab.com:dkim,invisiblethingslab.com:from_mime,invisiblethingslab.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF48A62E01F

Follow-up to 880e40b187aa ("xen/efi: Fix boot from a device without
a file system"), which added a BUG_ON() guard in read_file().

But as Jan pointed out, before ExitBootServices BUG_ON()
is not functional. It results in a hang with no message.

On the other hand blexit() prints a message and returns back
to the bootloader.

Link: https://lore.kernel.org/xen-devel/bb0f007e-697e-4501-97ea-3b59cf494ec6@suse.com/T/#m4725c8cbc0946a5533aea03fc240267ef139648d
Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
---
blexit() has been chosen over PrintErrMesg(), as the latter
is predominantly used in cases where an EFI call fails
(and it prints the status).

 xen/common/efi/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 2971ea8696..8f24df9bc2 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -849,7 +849,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     if ( !name )
         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
 
-    BUG_ON(!dir_handle);
+    if ( !dir_handle )
+        blexit(L"BUG: !dir_handle in read_file()");
 
     what = L"Open";
     ret = dir_handle->Open(dir_handle, &FileHandle, name,
-- 
2.53.0


