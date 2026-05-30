Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJFpOtErG2r//ggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 30 May 2026 20:26:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D16B611BC2
	for <lists+xen-devel@lfdr.de>; Sat, 30 May 2026 20:26:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323105.1589066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTONt-0001pK-HO; Sat, 30 May 2026 18:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323105.1589066; Sat, 30 May 2026 18:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTONt-0001nx-Es; Sat, 30 May 2026 18:26:09 +0000
Received: by outflank-mailman (input) for mailman id 1323105;
 Sat, 30 May 2026 18:26:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wTONp-0001mm-ES
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 18:26:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTONo-00C4mB-CJ
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 20:26:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a1b2b53-e002-0a2a0a5209dd-0a2a4502cabc-32
 for <xen-devel@lists.xenproject.org>; Sat, 30 May 2026 20:26:04 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 6a1b2bba-af86-0a2a45020019-d561b338baea-3
 for <xen-devel@lists.xenproject.org>; Sat, 30 May 2026 20:26:03 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wTONE-00ALEi-Em; Sat, 30 May 2026 20:25:28 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wTONC-003hJ2-2f; Sat, 30 May 2026 20:25:28 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wTONB-00000005YVY-1bPX;
 Sat, 30 May 2026 20:25:25 +0200
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
	bh=+CEMRaJFugQuRP0/DJTzv+8chqmTJilMImwXMol396E=; b=BR3yV6wgeIxWYy5xNZ+xGvXXS7
	02mPLhQgHJHn9BspRzTnC/IQvF+JGiFsFf2dUclCkPtWfbZ3dI1KvC4JytpgZzEHagH4Z/dAcGiBt
	rRNwIqjzQiHXUPQw5IGP4QQ+JobrnhM377GGSuAIw5crru1gwV6c5db0f0uM5jjf4yQgLzvY05b6W
	nGi7bTAwAgysJJDvp5XGHtmL56IA0Ob6gy5nxUwo3SM9Pkv59buwRJ8TFqXTOoT+WyMf/o4EJogcQ
	erTteuHigGB4uQkUubfJ0Ul6ITZ/pqB0G3lWZ6C71yx1edTTtdwZnNBtB5Tl1NVteGnR3BRDk3ZdU
	ybdqi6ZQ==;
MIME-Version: 1.0
Date: Sat, 30 May 2026 15:25:25 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 0/4] x86/pvh: fix unbootable VMs again (PVH + KASAN)
In-Reply-To: <20260527204736.GBahdYaKk6kAkIUYE3@fat_crate.local>
References: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
 <20260527204736.GBahdYaKk6kAkIUYE3@fat_crate.local>
Message-ID: <274609541a0c7c6b49b386001967dd2b@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.2, Tests=ALL_TRUSTED=-3,BAYES_50=0.8
X-Spam-Score: -21
X-Spam-Bar: --
X-purgate-ID: tlsNG-720697/1780165564-8057B161-0EE46CF7/0/0
X-purgate-type: clean
X-purgate-size: 1811
X-Spamd-Result: default: False [0.61 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bp@alien8.de,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:lkp@intel.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,igalia.com:mid];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com,igalia.com,vger.kernel.org,lists.xenproject.org,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_SPAM(0.00)[0.985];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 9D16B611BC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks for having a look at this.

On 2026-05-27 17:47, Borislav Petkov wrote:
> On Tue, May 26, 2026 at 11:52:32AM -0300, Mauricio Faria de Oliveira wrote:
>> The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.
> 
> ... and we care about that particular configuration because...?

PVH and KASAN can be enabled independently for their own purposes
(startup entry point and debugging), but when combined, KASAN might
break booting via the PVH entry point. There are precedents for
disabling KASAN instrumentation in specific code paths, including this
one (see listed commits), so addressing this issue/regression seems
reasonable.

In this instance, the use case is to speed up the dev-test cycle when
debugging on VMs: PVH allows booting directly from vmlinux, avoiding the
need to build/compress and decompress bzImage, while KASAN helps detect
issues early.

> 
>>  arch/x86/boot/string.c               |  6 ++----
>>  arch/x86/include/asm/cpuid/api.h     |  2 +-
>>  arch/x86/include/asm/string.h        | 21 +-------------------
>>  arch/x86/include/asm/string_inline.h | 37 ++++++++++++++++++++++++++++++++++++
>>  arch/x86/platform/pvh/enlighten.c    |  3 ++-
>>  5 files changed, 43 insertions(+), 26 deletions(-)
> 
> I fail to see justification for those gymnastics.

Briefly, this is a side effect of reusing code from 'boot/string.c'
through <asm/string.h>, which introduces additional complications;
please see patch 1 for details.

These complications could be avoided by not reusing that code and
instead adding slightly duplicated code [1] directly to <asm/string.h>,
if that is preferred. 

Please let me know your thoughts.

Thanks,

[1]
https://lore.kernel.org/all/324ef97b16f52e0ccc72f6381d1b5dd2@igalia.com/

-- 
Mauricio

