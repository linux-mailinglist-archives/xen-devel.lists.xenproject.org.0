Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wv4jCwOw82mD6AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 21:39:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C614A76DE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 21:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298432.1573744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIXEC-0008GL-HC; Thu, 30 Apr 2026 19:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298432.1573744; Thu, 30 Apr 2026 19:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIXEC-0008E2-EF; Thu, 30 Apr 2026 19:39:16 +0000
Received: by outflank-mailman (input) for mailman id 1298432;
 Thu, 30 Apr 2026 19:39:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bouyer@antioche.eu.org>) id 1wIXEA-0008Dw-TP
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 19:39:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIXEA-0000dU-3e
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 21:39:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bouyer@antioche.eu.org>)
 id 69f3afdb-e002-0a2a0a5209dd-0a2a4505d1e4-4
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 21:39:13 +0200
Received: from [109.190.99.82] (helo=chassiron.antioche.eu.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bouyer@antioche.eu.org>)
 id 69f3afe1-aaa8-0a2a45050019-6dbe6352c381-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 21:39:13 +0200
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.18.1/8.16.1) with ESMTPS id
 63UJcvsg005688
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2026 21:38:58 +0200 (MEST)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id C02D32E932D; Thu, 30 Apr 2026 21:38:52 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Date: Thu, 30 Apr 2026 21:38:52 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
        Frediano Ziglio <frediano.ziglio@cloud.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Juergen Gross <jgross@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Frediano Ziglio <freddy77@gmail.com>
Subject: Re: [PATCH] tools: Use posix_memalign instead of valloc for NetBSD
Message-ID: <afOvzOS7G7vnHvqn@antioche.eu.org>
References: <20260430095521.8399-1-frediano.ziglio@cloud.com>
 <afMzlcrP7phSirsw@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afMzlcrP7phSirsw@macbook.local>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.6.4 (chassiron.antioche.eu.org [109.190.99.82]); Thu, 30 Apr 2026 21:38:58 +0200 (MEST)
X-purgate-ID: tlsNG-c201ff/1777577953-E3D67443-0EF579E8/0/0
X-purgate-type: clean
X-purgate-size: 279
X-Rspamd-Queue-Id: B6C614A76DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.49 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[antioche.eu.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,cloud.com,vates.tech,suse.com,citrix.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bouyer@antioche.eu.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bouyer@antioche.eu.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[antioche.eu.org:mid,antioche.eu.org:email]

On Thu, Apr 30, 2026 at 12:48:53PM +0200, Roger Pau Monné wrote:
> Adding Manuel that maintains the NetBSD xen-tools package.

thanks
AFAIK this patch is fine

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

