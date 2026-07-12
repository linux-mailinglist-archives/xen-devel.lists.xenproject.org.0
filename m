Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BO4pBFy+U2o1egMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 18:18:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA1C74551F
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 18:18:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thinkmo.de header.s=mail202312 header.b=aFO4SbV9;
	dmarc=pass (policy=none) header.from=thinkmo.de;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361182.1613616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiwrw-0002vl-KJ; Sun, 12 Jul 2026 16:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361182.1613616; Sun, 12 Jul 2026 16:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiwrw-0002uJ-HM; Sun, 12 Jul 2026 16:17:28 +0000
Received: by outflank-mailman (input) for mailman id 1361182;
 Sun, 12 Jul 2026 16:17:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bblank@thinkmo.de>) id 1wiwru-0002uD-Fi
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 16:17:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiwrt-004WvV-4R
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2026 18:17:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bblank@thinkmo.de>)
 id 6a53bde0-5cb7-0a2a0a5109dd-0a2a4509ea18-26
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 18:17:25 +0200
Received: from [162.55.237.202] (helo=mail.thinkmo.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <bblank@thinkmo.de>)
 id 6a53be14-b440-0a2a45090019-a237edcaa0a0-3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 18:17:24 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.thinkmo.de (Postfix) with ESMTP id 4gyrLr4rBkzyf1;
 Sun, 12 Jul 2026 16:17:24 +0000 (UTC)
Received: from mail.thinkmo.de ([127.0.0.1])
 by localhost (mail.thinkmo.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Wi6snuOvNhC; Sun, 12 Jul 2026 16:17:24 +0000 (UTC)
Received: from shell.thinkmo.de (shell.thinkmo.de
 [IPv6:2a01:4f8:271:3f5c:0:22:0:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (No client certificate requested)
 by mail.thinkmo.de (Postfix) with ESMTPS id 4gyrLr49LJzyZr;
 Sun, 12 Jul 2026 16:17:24 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thinkmo.de; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail202312; t=1783873044; bh=2Yk
	THO+c8W8ArBOBPzv0PE/7ai2ymP/Klh7FBU8dV2g=; b=aFO4SbV9QoH1FiNAT6C
	0ZLek7Ve6F/8xKORmGviM/P+fxd926EGkgLj0J9pSfMce+a3T6vELgUJK7iIuBkb
	+kNiBj3NzL4qsJb4dj2Fg1oRl5zJAdcILnxNtSn8pcBjiM86FpocHDKtmT/mZWL5
	G3GmimfhDaGne5cdL/5xwKVPs9gBt7FHCC9Ce+Dpn06LU28Ci10rwXfp4LnE5TrG
	SYpYMGVn2VrsKoylR3eiCuyn7iGRht1+R9xPDQIhCC02poE/8Gif8h6fnnUZzef3
	s4fAKQJ+Xtx1ZGsSODHWUdo6V6+GFw0uMoqWTQTX1cOUFXOO4xIDjBkyZgwIGaUL
	2hQ==
X-Virus-Scanned: Debian amavis at 
Date: Sun, 12 Jul 2026 18:17:21 +0200
From: Bastian Blank <bblank@thinkmo.de>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/3] misra: deviate MISRA C Rule 5.5 for
 'hypfs_alloc_dyndata()'
Message-ID: <5hndddlv4aaa2szgnsfpor4shbfr3tolegiz7w6izqi26vche6@qnhcwjjiy5sc>
Mail-Followup-To: Bastian Blank <bblank@thinkmo.de>, 
	Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
References: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
 <365f750cfbc626e763819da2604bfccab2ac80f8.1783864426.git.dmytro_prokopchuk1@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <365f750cfbc626e763819da2604bfccab2ac80f8.1783864426.git.dmytro_prokopchuk1@epam.com>
X-purgate-ID: tlsNG-bad1c0/1783873045-54B78A0B-F5D7E2E2/0/0
X-purgate-type: clean
X-purgate-size: 729
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[thinkmo.de,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[thinkmo.de:s=mail202312];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thinkmo.de:from_mime,thinkmo.de:dkim];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bblank@thinkmo.de,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[thinkmo.de:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bblank@thinkmo.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FA1C74551F

On Sun, Jul 12, 2026 at 02:04:44PM +0000, Dmytro Prokopchuk1 wrote:
> +       Clash between hypfs_alloc_dyndata() function and macro names is allowed
> +       because the macro is a typed convenience wrapper around the size-based
> +       allocation function.

Is this really the whole reason for this?  The macro is a wrapper to the
function, so it must be named the same?

If there is a deeper meaning, this should be documented here.  Looking
at the current code, there is no documention at least in the code
directly.  And the function is used once?!?

Bastian

-- 
... The prejudices people feel about each other disappear when they get
to know each other.
		-- Kirk, "Elaan of Troyius", stardate 4372.5

