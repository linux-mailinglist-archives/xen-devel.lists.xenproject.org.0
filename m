Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rqrSFWg4LmpqqwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jun 2026 07:13:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC53C68061A
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jun 2026 07:13:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thinkmo.de header.s=mail202312 header.b=WFA+uWuh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=thinkmo.de
Received: from list by lists.xenproject.org with outflank-mailman.1337500.1598983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYd8Z-00046k-VH; Sun, 14 Jun 2026 05:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337500.1598983; Sun, 14 Jun 2026 05:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYd8Z-00045O-R2; Sun, 14 Jun 2026 05:11:59 +0000
Received: by outflank-mailman (input) for mailman id 1337500;
 Sat, 13 Jun 2026 18:13:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bblank@thinkmo.de>) id 1wYSr2-0002Q4-UX
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 18:13:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYSr2-001SQe-9k
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 20:13:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bblank@thinkmo.de>)
 id 6a2d9db6-bab6-0a2a0a5309dd-0a2a450bbdcc-2
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 20:13:12 +0200
Received: from [162.55.237.202] (helo=mail.thinkmo.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bblank@thinkmo.de>)
 id 6a2d9db7-212f-0a2a450b0019-a237edcabcda-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 20:13:12 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.thinkmo.de (Postfix) with ESMTP id 4gd4Hq61FHzygv;
 Sat, 13 Jun 2026 18:13:11 +0000 (UTC)
Received: from mail.thinkmo.de ([127.0.0.1])
 by localhost (mail.thinkmo.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoE-fvk-5wM7; Sat, 13 Jun 2026 18:13:11 +0000 (UTC)
Received: from shell.thinkmo.de (shell.thinkmo.de
 [IPv6:2a01:4f8:271:3f5c:0:22:0:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (No client certificate requested)
 by mail.thinkmo.de (Postfix) with ESMTPS id 4gd4Hq52mnzyTR;
 Sat, 13 Jun 2026 18:13:11 +0000 (UTC)
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
	in-reply-to:content-transfer-encoding:content-disposition
	:content-type:content-type:mime-version:references:message-id
	:subject:subject:from:from:date:date:received:received; s=
	mail202312; t=1781374391; bh=6GPKAOobwmNg968WVow6EBZsOTaaulq+Iwz
	Tk8mWKdE=; b=WFA+uWuhApZWf7VWd8/7P3CJSHS062sBwv3TNsSMwW9kgE+xfPU
	I16+IKhuk0wTRdt2/otJTg1KbwM32kFk4GuBfwPXNz1MAokd9s1PTbcUIn1lBL61
	emjwe4xXWcO7NRrV5SU6pYf9YFvXK7p62K3uCxPwEURLSMMImxRTAguyxd2PbvPo
	PMjUHmB2BS0op2zm6aBLNihf/z8l/vvh7oihpm5fRM9bdAvnl6IuMwyFi76Ottfx
	phQR8oHvWZS24876hZA2mq9lIZxAIEuEAMkr8L2w1vN1jLkYpaBUokKKSGKldF7q
	GZLfTQFbqXOkcP+4+Ps66+zH5otlU7GMNNg==
X-Virus-Scanned: Debian amavis at 
Date: Sat, 13 Jun 2026 20:13:10 +0200
From: Bastian Blank <bblank@thinkmo.de>
To: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/xen/interface: Remove pre-C99 checks
Message-ID: <xuuzvpxooyhkbqluaxszcizjxrqzjczejhdqiso6q2mc4cnhjl@kszikmaagunj>
Mail-Followup-To: Bastian Blank <bblank@thinkmo.de>, 
	xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
References: <20260613175151.1357-1-philmd@oss.qualcomm.com>
 <20260613175151.1357-2-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260613175151.1357-2-philmd@oss.qualcomm.com>
X-purgate-ID: tlsNG-42698a/1781374392-19969F3B-2F56AEB2/0/0
X-purgate-type: clean
X-purgate-size: 598
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[thinkmo.de,none];
	R_DKIM_ALLOW(-0.20)[thinkmo.de:s=mail202312];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,gnu.org:url];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:qemu-devel@nongnu.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[bblank@thinkmo.de,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[thinkmo.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bblank@thinkmo.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC53C68061A

On Sat, Jun 13, 2026 at 07:51:50PM +0200, Philippe Mathieu-Daudé wrote:
> We mandate a compiler supporting C99 since 2019-01-17 in
> commit 7be41675f7c ("configure: Force the C standard to gnu99"),
> thus supporting flexible array members. Remove what is now dead
> code.

> +    uint32_t optarr[0];

This is no flexible array member. "optarr[]" would be.

https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Flexible-Array-Fields.html

Or are you talking about something different?

Bastian

-- 
The best diplomat I know is a fully activated phaser bank.
		-- Scotty

