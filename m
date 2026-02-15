Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 33OTHX2OkWmbjwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 15 Feb 2026 10:14:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135D813E614
	for <lists+xen-devel@lfdr.de>; Sun, 15 Feb 2026 10:14:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233227.1537034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrYC2-0005za-K4; Sun, 15 Feb 2026 09:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233227.1537034; Sun, 15 Feb 2026 09:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrYC2-0005wx-Ep; Sun, 15 Feb 2026 09:13:30 +0000
Received: by outflank-mailman (input) for mailman id 1233227;
 Sun, 15 Feb 2026 09:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrrr=AT=codewreck.org=asmadeus@srs-se1.protection.inumbo.net>)
 id 1vrYBz-0005wo-Rs
 for xen-devel@lists.xenproject.org; Sun, 15 Feb 2026 09:13:28 +0000
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92792561-0a4e-11f1-9ccf-f158ae23cfc8;
 Sun, 15 Feb 2026 10:13:22 +0100 (CET)
Received: from gaia.codewreck.org (localhost [127.0.0.1])
 by submarine.notk.org (Postfix) with ESMTPS id 4AEBF14C2DE;
 Sun, 15 Feb 2026 10:13:17 +0100 (CET)
Received: from localhost (gaia.codewreck.org [local])
 by gaia.codewreck.org (OpenSMTPD) with ESMTPA id acf4b99f;
 Sun, 15 Feb 2026 09:13:15 +0000 (UTC)
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
X-Inumbo-ID: 92792561-0a4e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1771146799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X6PMMPGz+jLe5ualpnm5Aab0p5EjTgChnMRnoKKA/Fs=;
	b=ohM1tTgfFBEmPiR3IPGDXoOqOAcf/5fyLo5GMbtawe3lv4QXeHSR6Tfjg3CTsEKJa/0r1a
	ECI8dgKfua712El69ShX/WNWoB2KFNbkwlbSG627Xwz1xs43TzGJpLVdxDalz0jjV3cL7/
	cVBlZExsUsBaLyjBuBnjzWsFsV792UAtl5pYusQwv29XiJyxfB+chicskwqc1j+oR/cQDi
	/XM5hKkxeFBul4d8OX/BEite+SJTT4Vdwe0wYD4Bu5ahgPhkPi9iMS0rzVGa3NJimBYveZ
	ej9pC0glbNQ/PetAYqOaWK+pt1KaVQIq7WvLmpH4n95kLPt5Tr/MyHUKcm3bnw==
Date: Sun, 15 Feb 2026 18:13:00 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com, v9fs@lists.linux.dev,
	ericvh@kernel.org, lucho@ionkov.net, linux_oss@crudebyte.com,
	sstabellini@kernel.org
Subject: Re: [PATCH v2] 9p/xen: protect xen_9pfs_front_free against
 concurrent calls
Message-ID: <aZGOHNhDe1PPJCRO@codewreck.org>
References: <20260129230348.2390470-1-stefano.stabellini@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129230348.2390470-1-stefano.stabellini@amd.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[codewreck.org,none];
	R_DKIM_ALLOW(-0.20)[codewreck.org:s=2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:v9fs@lists.linux.dev,m:ericvh@kernel.org,m:lucho@ionkov.net,m:linux_oss@crudebyte.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[asmadeus@codewreck.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[codewreck.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmadeus@codewreck.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 135D813E614
X-Rspamd-Action: no action

Stefano Stabellini wrote on Thu, Jan 29, 2026 at 03:03:48PM -0800:
> Changes in v2:
> - move priv->rings check above the loop
> - replace list_del_init with list_del

It looks like I didn't reply a couple of weeks ago but I did
pick it up and just sent to Linus now.
Thanks!

-- 
Dominique Martinet | Asmadeus

