Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMriJVhCk2kA3AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:14:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A71E145FA9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234347.1537641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1ET-0001I0-0Y; Mon, 16 Feb 2026 16:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234347.1537641; Mon, 16 Feb 2026 16:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1ES-0001Ew-Ti; Mon, 16 Feb 2026 16:13:56 +0000
Received: by outflank-mailman (input) for mailman id 1234347;
 Mon, 16 Feb 2026 16:13:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=feiu=AU=citrix.com=abdelkareem.abdelsaamad@srs-se1.protection.inumbo.net>)
 id 1vs1ER-0001Ep-3i
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 16:13:55 +0000
Received: from na1pdmzitismtp02.tibco.com (unknown [160.101.131.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c7df79a-0b52-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 17:13:53 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 76AA98111991;
 Mon, 16 Feb 2026 11:13:26 -0500 (EST)
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
X-Inumbo-ID: 7c7df79a-0b52-11f1-b163-2bf370ae4941
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Cc: teddy.astie@vates.tech,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	jason.andryuk@amd.com
Subject: Re: Re: [PATCH v3 2/2] x86/svm: Use the virtual NMI when available
Date: Mon, 16 Feb 2026 16:10:11 +0000
Message-ID: <20260216161023.148269-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <f06b7e86-4188-485b-8f0e-c55bc72929e5@citrix.com>
References: <f06b7e86-4188-485b-8f0e-c55bc72929e5@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 3A71E145FA9
X-Rspamd-Action: no action

On 16/02/2026 10:15 am, Andrew Cooper wrote:
>So what happens to the NMI we're trying to inject when NMIs are
>currently blocked?

Ah, I see this...
The handling flow will eventually land on the function svm_enable_intr_window
with HVM_INTR_SHADOW_NMI. The logic inside the function svm_enable_intr_window
will drive it to create a vintr and set up the VMCB to intercept that created
vintr. I see that the code logic in svm_enable_intr_window should be extended
to skip creating such vintr and just return the same as the handling with
Event injected NMI when the GENERAL1_INTERCEPT_IRET is already set.

>~Andrew

--Abdelkareem

