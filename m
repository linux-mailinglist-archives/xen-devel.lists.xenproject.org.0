Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5224AF0DAF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030434.1404115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWshw-0004V2-A3; Wed, 02 Jul 2025 08:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030434.1404115; Wed, 02 Jul 2025 08:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWshv-0004PU-UX; Wed, 02 Jul 2025 08:20:43 +0000
Received: by outflank-mailman (input) for mailman id 1030434;
 Wed, 02 Jul 2025 08:20:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsc9-00082Y-CU
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:14:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c167c35-571c-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 10:14:43 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A0C5C2117F;
 Wed,  2 Jul 2025 08:14:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DF4D13A24;
 Wed,  2 Jul 2025 08:14:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id URBfGXPqZGiXSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:14:43 +0000
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
X-Inumbo-ID: 9c167c35-571c-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dn//+GflyhXs2E0/uE+NcjSGBv2wFdky7ji5ZDIU8Zg=;
	b=f7se+NC+/YQxrV6M43+eU/zCuMOd9cu6Lhut6ul6uwQGpvbXSBlfFuc9lyEltMWbEbPEFT
	nQSrzkXXIDKSpACunye31nFwclpObMGIzKtKGAq9uQwnr3S8kHpyFkbcGMfPg2CwI7m1GQ
	s1c5iPYajFjhe0zgy0OlmdmsELmyCLA=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dn//+GflyhXs2E0/uE+NcjSGBv2wFdky7ji5ZDIU8Zg=;
	b=f7se+NC+/YQxrV6M43+eU/zCuMOd9cu6Lhut6ul6uwQGpvbXSBlfFuc9lyEltMWbEbPEFT
	nQSrzkXXIDKSpACunye31nFwclpObMGIzKtKGAq9uQwnr3S8kHpyFkbcGMfPg2CwI7m1GQ
	s1c5iPYajFjhe0zgy0OlmdmsELmyCLA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 19/19] events: export bind_evtchn()
Date: Wed,  2 Jul 2025 10:12:54 +0200
Message-ID: <20250702081254.14383-20-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

Export the bind_evtchn() function, as it will be needed for
reactivating events after kexec().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 events.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/events.c b/events.c
index 9f3dbf05..a9c1ccac 100644
--- a/events.c
+++ b/events.c
@@ -98,6 +98,7 @@ evtchn_port_t bind_evtchn(evtchn_port_t port, evtchn_handler_t handler,
 
 	return port;
 }
+EXPORT_SYMBOL(bind_evtchn);
 
 void unbind_evtchn(evtchn_port_t port )
 {
-- 
2.43.0


