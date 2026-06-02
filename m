Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PlhxJxzYHmqkVwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:18:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0717662E67A
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:18:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm3 header.b=vDnbliDA;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="A71/whzQ";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1325024.1590539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUP0A-0007hn-Kv; Tue, 02 Jun 2026 13:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325024.1590539; Tue, 02 Jun 2026 13:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUP0A-0007gA-IP; Tue, 02 Jun 2026 13:17:50 +0000
Received: by outflank-mailman (input) for mailman id 1325024;
 Tue, 02 Jun 2026 13:17:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <accek@invisiblethingslab.com>) id 1wUP09-0007ef-WB
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:17:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUP08-00CFkQ-N9
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:17:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a1ed7f5-bab6-0a2a0a5309dd-0a2a4501bed2-20
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:17:48 +0200
Received: from [103.168.172.145] (helo=fout-a2-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a1ed7fb-c1f2-0a2a45010019-67a8ac91cfd1-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:17:48 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id EEE92EC06F6;
 Tue,  2 Jun 2026 09:17:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 02 Jun 2026 09:17:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 09:17:45 -0400 (EDT)
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
	 t=1780406266; x=1780492666; bh=Odw3uM7GYkxyQ4rOzkRBdHo22ydzgt+9
	ApdUBTxVZ7Y=; b=vDnbliDAZ5CxKaktiZ7OlI5ZJqU9EtfAbGA6Z47kbREF/3nB
	NzgMB2QvO5lKDeDapwoCPl95cD2DNjjrZKYI9PqNXgu2i69Nyen5u4hAFgLtbEEG
	9mRES7NjuuaeSzEMJ9uLGdiDEKPNRQFgHMzhLRDn43ns/9nJiyAMHGofNhHr99KN
	u+y+xfQI0V0lVHvIDSWHkaLsmGUGy5gGo0x8hSBfb9h1O7faEr6Qk+aelMWK0Xh0
	ISAQH4a6X16GC+ruI+8CFaVxDr9mvyE9OHkj002xQPnNEqpxYw+v8fQZ4uYqVlnW
	NUNJcjajfoMbw3GEnG+N+648jCJ16GRpUDTY+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1780406266; x=1780492666; bh=Odw3uM7GYkxyQ4rOzkRBdHo22ydz
	gt+9ApdUBTxVZ7Y=; b=A71/whzQau3O60huSLq0Dkyn1dve4y2kEpfVveQmA2sD
	Z1YEOAtU8eBXx5qUM+FA/faZXrnxddRPbRpa28ZkMf+EWnEztFQfh2opTmDMiB5t
	HNIq0/dxhTl0PmuWAAma60fj9rlNAYCUhY3mc0XXVQVREaTm6GUJFQSInWskgldz
	Iv9ibXPxcMa7hFOpYFrKPRaogd5Soy+OKMCR+07VzocyCOMUeqUrvFjm6tpjKAP4
	OSFvDGTC2og0mHunmgtctexwDLTjJ8+gLFJKc+SQEpxYF/yl1hkuL0gv6EnF4ArO
	Z5NLQe+rsyVVL5rFv6wKrqR2hy3XnVb2ewGqGLtWiA==
X-ME-Sender: <xms:-tceagLHpmT9QBEBRYYfc3Zf8u1El5iL0P96GsAf85_llvn192uYOw>
    <xme:-tceaj3JF9vuDa8sZ2brtlaHUmGjWLtJxcdmEdDZFC2pZSDwDQY1OmFzi9A-INjH-
    U7cDFb6M2cs_OhNKQKcoemuP64J3uJHpeeymcRGVFWjd7ZZLmc>
X-ME-Received: <xmr:-tceaqjX7FrbwC3N8eVtABpyW26CO5GUHosFY_Mo8ab5ssGhAyLFwBlQ>
X-ME-Proxy-Cause: dmFkZTFQQIErjjn5Oc2MgxZTxaZ0BgRfkzV9Qce6STntFPkc2OuoG8jBX1tCUSyR0jlsj+
    OrqDGIWGuMnTlVDRtsyJXZm99W6F/ZlKUCCNbjPnXmkuGUCzRXP2hLFxKw59WZqJtdgMV4
    KvThuk45hqVnZaLl/UEgGxjcUUXP0uM4Iwr9H2akbjYqfZMgL44mF1U0wpbGVBDjVP6OUT
    VZIqbbrNmE72snbWE4/2MJZvdxfbK5nzYOs8brIbjHrz5pxmaOIzqdswSElgASMbYfmEy9
    ycZm1GaR/QAE9FOf6z3tMhoX70IB97HwC/MhAbwV4wfOkGxzk49mOqdn1gqCORM5yL0FIo
    fj8INK2fvhePanly564/lUausJNWKhasRX9W42xRuiP/xjta87IOPFw91QXET8/7z9u/8O
    RCJEr2+5+b8TzW28Y0Ex4jGEBqij3M8KLsYmjE5wMXYW64/d0K7CrGtvAkEsZdJFtUN4ug
    xq2++FjVWJ+X7cY7w46IYHHFwKyfkL+ZiamI6KNuCiTzCnjjfLwJ5uWySXDK6R4Lz6aQxU
    OtnqX3zIrwEbQO4gkqS0U+h6+UUn+oF0txX+fkTH6dxBbVb37eyTAxgYRy0irykDM2KTqx
    tLxBcGy9mIMlRPie35QF3jsa7D/bq5mDcTLonhW7EF335NH2E3MxnLugu6eA
X-ME-Proxy: <xmx:-tceakUyZuOWvt7sgD-iDbEI-aAsYh3lFJ2Lh83t2qC5ntlWDJ6EcA>
    <xmx:-tceapU0vzdw4Nh_-Y1O2c6hiXPAAtSoi31mNtcoh9Y13GBJbqe-ZA>
    <xmx:-tceakhgM8RdGYCt9fYwt_HPvQjvI9mWQk9hcIKD964rpvbphq0BrQ>
    <xmx:-tceakYlyfLzhBEQIziEw1f8P6SQo5OtQb9Y6aYW_3oFJ_q8aZQQLg>
    <xmx:-tceagnTGhd3LczT_lP9KXaxNweJHDOsGQkAfguoZkERdhYxOFBX9eOk>
Feedback-ID: i792e4853:Fastmail
From: =?UTF-8?q?Szymon=20Aceda=C5=84ski?= <accek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Szymon=20Aceda=C5=84ski?= <accek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2] xen/efi: Use blexit() instead of BUG_ON() in read_file()
Date: Tue,  2 Jun 2026 15:17:37 +0200
Message-ID: <20260602131737.2983084-1-accek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1780406268-AE143FF4-147A8090/0/0
X-purgate-type: clean
X-purgate-size: 1374
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:mid,invisiblethingslab.com:dkim,invisiblethingslab.com:from_mime,invisiblethingslab.com:email,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,messagingengine.com:dkim];
	FORGED_SENDER(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:accek@invisiblethingslab.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,invisiblethingslab.com,suse.com,apertussolutions.com];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0717662E67A

Follow-up to 880e40b187aa, which added a BUG_ON() guard in read_file().

But as Jan pointed out, before ExitBootServices BUG_ON()
is not functional. It results in a hang with no message.

On the other hand blexit() prints a message and returns back
to the bootloader.

Fixes: 880e40b187aa ("xen/efi: Fix boot from a device without a file system")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
- Drop the Link: tag; use Reported-by: and Fixes: instead. (Jan)

blexit() has been chosen over PrintErrMesg(), as the latter
is predominantly used in cases where an EFI call fails
(and it prints the status).

 xen/common/efi/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 2971ea8696d1..8f24df9bc23a 100644
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


