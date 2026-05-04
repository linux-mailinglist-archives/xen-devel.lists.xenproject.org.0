Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /cWIDnIz+GmxrQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:49:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BAF4B8AD2
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299421.1574038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJmBK-0003OC-Rx; Mon, 04 May 2026 05:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299421.1574038; Mon, 04 May 2026 05:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJmBK-0003Lg-OI; Mon, 04 May 2026 05:49:26 +0000
Received: by outflank-mailman (input) for mailman id 1299421;
 Mon, 04 May 2026 03:24:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Samuel.Montgomery61@protonmail.com>)
 id 1wJjvJ-0007UD-0F
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 03:24:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJjvH-008I3R-5a
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 05:24:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Samuel.Montgomery61@protonmail.com>)
 id 69f81128-5cb7-0a2a0a5109dd-0a2a4503b54e-44
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 05:24:42 +0200
Received: from [185.70.43.167] (helo=mail-43167.protonmail.ch)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Samuel.Montgomery61@protonmail.com>)
 id 69f8117a-672d-0a2a45030019-b9462ba74be5-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 05:24:42 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=protonmail3 header.d=protonmail.com header.i="@protonmail.com" header.h="Date:To:From:Subject:Message-ID:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1777865082; x=1778124282;
	bh=n6IY1A1TFjd+nC/H+/Qn+1wFazhEj+IW+F2zlnlaC6A=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OT0JjJsBw63hd1V8ouI9ocYkxuQIk9ZKyjRFTOxqcMKXwAZpHRxrNILWPQ3l/vxRY
	 iqORFufSNOM+gGuxFXefzt6xNSqBGd2R7TVFmoum1FmKohUOGWgv67upMboM6WUFO+
	 G0JE+LfpPh1RXO4eEpmJ5t7yQFu99LU/fzWoz32M05GXR+Y/ZZc06sZfNDacaqGswe
	 x6t4L7ZiJK8sqo4EIQuh65qjYzco0ecUMoB14bfy0/0D0LzeIONUsy8MixX0TfF+Rj
	 JyobtkjXUrgsFoD60s3Rka2LVRS7eVMCe96o8XGnEc3fUlQVbMx1QaeM1DLEvzkdke
	 URnYxmyKFqvGg==
Date: Mon, 04 May 2026 03:24:40 +0000
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: "Samuel.Montgomery61" <Samuel.Montgomery61@protonmail.com>
Subject: [RFC] Skip boot memory scrub on platforms with full-memory encryption
Message-ID: <xJXmemuuJ0kqnGWQ9PWwfFn8_KZVhYSbsAyHFGvDeiqpxUK1Q-ar7Lab7ttRPx-tcEHduS26pU9BkIifbhznT1Qc06vyHfovl1-IXC0cWUU=@protonmail.com>
Feedback-ID: 16446063:user:proton
X-Pm-Message-ID: 4204f4dcf239f86d163e20ff008378053a34d9f0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1777865082-A2766938-F8C2C498/0/0
X-purgate-type: clean
X-purgate-size: 2305
X-Rspamd-Queue-Id: D8BAF4B8AD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[protonmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[Samuel.Montgomery61@protonmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Samuel.Montgomery61@protonmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]

Hello,

Xen's boot-time memory scrub is one of the more time-consuming steps
during boot, particularly on systems with large amounts of RAM. I'd
like to propose skipping it on systems with hardware full-memory
encryption (e.g., Intel TME, AMD TSME).

These features encrypt all DRAM transparently using an ephemeral key
generated by the CPU at each boot. The key is not accessible to
software and does not persist across reboots. This means residual data
from any previous session where encryption was active is unreadable --
the same property that boot scrubbing exists to provide.

The important nuance is that Xen needs to confirm encryption has been
continuously active since the last scrub, not just that it is active
now. If encryption was only recently enabled in firmware, residual
plaintext from prior unencrypted sessions could still be present in
pages that were never overwritten. Possible approaches:

  - Record "encryption active" to an EFI variable each boot; skip the
    scrub only if the flag is present from the previous boot.
  - Expose a command-line option for administrators to assert that
    encryption has been consistently enabled.
  - Some combination of the two.

The optimization would apply only to the cross-reboot case. Runtime
scrubbing when domains shut down would be unaffected, since all domains
share the same key during a running session.

Edge cases worth considering:

  - Memory written by firmware before encryption activation.
  - Crash/kexec without a full hardware reset (key may not change).
  - Suspend/resume (some implementations restore the prior key).
  - Interaction with existing bootscrub=3D command-line options.

As a broader note, multi-key extensions to full-memory encryption (such
as those used by AMD SEV and Intel TME-MK) could eventually eliminate
the need for runtime scrubbing as well, by giving each domain its own
key. This is relevant to the confidential computing work currently
underway (Teddy Astie's recent AMD SEV RFC), though the boot-scrub
optimization proposed here is independent and much simpler.

Feedback welcome on whether the reasoning is sound and whether there
are edge cases I've missed.

Thanks,

Sam

ps. I'm not subscribed to the list, so please CC me in replies.

