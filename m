Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFR5I9SM72l5CwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 18:20:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB34763FB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 18:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295096.1571795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHOgd-0006hy-C8; Mon, 27 Apr 2026 16:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295096.1571795; Mon, 27 Apr 2026 16:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHOgd-0006fo-9Q; Mon, 27 Apr 2026 16:19:55 +0000
Received: by outflank-mailman (input) for mailman id 1295096;
 Mon, 27 Apr 2026 16:19:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wHOgb-0006fi-SL
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 16:19:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHOgb-0022RI-1r
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 18:19:53 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 69ef8c89-e002-0a2a0a5209dd-0a2a4509da96-48
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 18:19:52 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 69ef8bb8-2497-0a2a45090019-d561b3389ec4-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 18:15:52 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wHOcP-0030BR-8k; Mon, 27 Apr 2026 18:15:32 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wHOcM-006FYL-5M; Mon, 27 Apr 2026 18:15:32 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wHOcL-00000001Xic-26r1;
 Mon, 27 Apr 2026 18:15:29 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0hYtNd1REaY7kPCVbF2AopZlByE4arJJCzMU7znjs7M=; b=FzN665rF4Chi+Kn8bLsYY10JrN
	cLD1jzVU/NkX/HndGO2QsiR1is0dFg/s9MCH+xY0EQVAskpRBh/Gx9ybBJsJEEWbTuUcBj45La9xQ
	1Tp+ccQ6WNLoWMssA2kR0KJ15yeQlareX110uxJSfLt6A4iwo6kpCoETJuCJxZ4o/hMCPaZ8Ex+9b
	OKBf8NlH9V3+ys/Or4m8j8E8Z5yCqiSQOC3jvAUaUJBqsQm3n0neHAer9x7HSkRyNW/9gvRx/ZRz7
	3VubcrpqQN85xtMlIeLMKkvSqNaUjCuMXmzdWFT6ZUYnTbN5bFFAes+xnFa3B31BlrsYFtt54ZLUg
	BLlEvSRg==;
MIME-Version: 1.0
Date: Mon, 27 Apr 2026 13:15:29 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross
 <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/3] x86/pvh: fix unbootable VMs again (PVH + KASAN)
In-Reply-To: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
References: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
Message-ID: <56145b8c64a645a2d4a7c6b74776779d@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.2, Tests=ALL_TRUSTED=-3,BAYES_50=0.8
X-Spam-Score: -21
X-Spam-Bar: --
X-purgate-ID: tlsNG-bad1c0/1777306552-9357BA53-BC9582FF/0/0
X-purgate-type: clean
X-purgate-size: 1483
X-Rspamd-Queue-Id: 3ECB34763FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.61 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid];
	FORGED_SENDER(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[igalia.com:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]

On 2026-04-22 17:07, Mauricio Faria de Oliveira wrote:
> The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.
> 
> Booting directly from vmlinux (instead of bzImage) now fails with gcc-14/15
> (but works with gcc-12/13) if CONFIG_KASAN_GENERIC is set, on Ubuntu 25.10.
> 
> The PVH code is required/supposed not to hit the KASAN memory access check
> in the kernel entry point as KASAN has not yet been setup, or an exception
> is hit and the boot fails.
> 
> This was previously described and addressed with __builtin_mem{cmp,set}():
> - commit 661362e3dcab ("xen, pvh: fix unbootable VMs (PVH + KASAN - AMD_MEM_ENCRYPT)")
> - commit 416a33c9afce ("x86/cpu: fix unbootable VMs by inlining memcmp() in hypervisor_cpuid_base()")
> - commit fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
> 
> However, even with __builtin the compiler may decide to use the out of line
> function instead of the inline implementation. So, that does not really fix
> the issue unconditionally, as it's being seen (details below).
> 
> In order to address this, it's required to switch to inline implementations
> that do not depend on the compiler.
> 
> There's such a memset in <asm/string.h> and memcmp in 'boot/string.c', now
> exposed in <asm/string.h> too. Use them instead of builtins in PVH entry.
[...]

v2:
https://lore.kernel.org/r/20260427-pvh-kasan-inline-v2-0-2c57b8dcff6a@igalia.com

-- 
Mauricio

