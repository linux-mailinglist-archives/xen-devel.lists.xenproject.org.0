Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO+gADoQl2n7uAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:29:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA0815F131
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236273.1539013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt45l-0006Ta-2h; Thu, 19 Feb 2026 13:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236273.1539013; Thu, 19 Feb 2026 13:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt45k-0006Rn-VL; Thu, 19 Feb 2026 13:29:16 +0000
Received: by outflank-mailman (input) for mailman id 1236273;
 Thu, 19 Feb 2026 13:29:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3cq=AX=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1vt45i-00064f-Bm
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 13:29:14 +0000
Received: from mx1.somlen.de (typhoon.somlen.de [89.238.64.140])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9cb4172-0d96-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 14:29:11 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id 6F6F95030D0;
 Thu, 19 Feb 2026 14:29:10 +0100 (CET)
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
X-Inumbo-ID: f9cb4172-0d96-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1771507750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UYCYLf3Qbb8Q/36IvP2edHC4iIn3vZFJTLRG5oXBiDc=;
	b=pqcQKLJ5mDxPHH5cRkdxCDCkFUghGgX/jSuTidg0OHOB594p5JcDQTU5n306VtUXYytS4K
	OzSl+fnfkaU/ZUnD1J4kEb6xyBKYKCbolcQj6mNWm1gaudbpE+5MLGjWJPsJOS/oW+jjhy
	2ahcWdH0BuipYfPG8HuFB/rKG/dIYC7oJWvaBDAeT4+MJnjj/BYpGdxCKIQjk8cZ1vG7Jt
	XHoYes87ESAfOOXGvhP9pdl4TkAA951cF//4WZ4qlEoWDVpRjIuNDnMDZay/1+6D7HuOo+
	T3pfz+0fFflAyUar2gbY63havN6F0QWuykcF1MU+xFtIN1ZzvEpEgsYZYigKHA==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject:
 Re: [XEN PATCH] libxl: Fix device_add QMP calls with QEMU 9.2 and newer
Date: Thu, 19 Feb 2026 14:29:07 +0100
Message-ID: <2692705.Lt9SDvczpP@localhost>
In-Reply-To: <aUAd_r3VN0kTVriG@l14>
References:
 <20251215135124.11410-1-anthony@xenproject.org>
 <92e6ecac-7a5f-4831-8116-0c34856f1175@suse.com> <aUAd_r3VN0kTVriG@l14>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[daemonizer.de,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	CTE_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[daemonizer.de:s=202303];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony@xenproject.org,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maxi@daemonizer.de,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[maxi@daemonizer.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[daemonizer.de:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8BA0815F131
X-Rspamd-Action: no action

On Monday, 15 December 2025 15:41:02 CET Anthony PERARD wrote:
> On Mon, Dec 15, 2025 at 03:11:53PM +0100, Jan Beulich wrote:
> > On 15.12.2025 14:51, Anthony PERARD wrote:
> > > From: Anthony PERARD <anthony.perard@vates.tech>
> > > 
> > > QEMU used to ignore JSON types and do conversion string <-> integer
> > > automatically for the command "device_add", but that was removed in
> > > QEMU 9.2 (428d1789df91 ("docs/about: Belatedly document tightening of
> > > QMP device_add checking")).
> > 
> > And older qemu accepts integers as well?
> 
> As the QEMU document explains about the removed feature is that they
> should. We already have two users of `device_add` which use integers for
> some arguments. And just to be sure, I've just tested with QEMU 8.0, the
> patch works fine.
> 
> Cheers,

Can this patch be picked for the stable branches? I'm in particular interested 
in 4.20 which is in Debian stable.

Thanks,
Maxi



