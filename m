Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLGWL21fG2rjBgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2026 00:06:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A1561386B
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2026 00:06:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323177.1589074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTRoA-0005tF-5J; Sat, 30 May 2026 22:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323177.1589074; Sat, 30 May 2026 22:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTRoA-0005rD-2h; Sat, 30 May 2026 22:05:30 +0000
Received: by outflank-mailman (input) for mailman id 1323177;
 Sat, 30 May 2026 22:05:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1wTRo8-0005r7-5l
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 22:05:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTRo6-0044bt-VI
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 00:05:27 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a1b5f05-bab6-0a2a0a5309dd-0a2a4507dedc-38
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 00:05:26 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bp@alien8.de>)
 id 6a1b5f26-229c-0a2a45070019-416d716ca968-3
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 00:05:26 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BB8E340E01F9; 
 Sat, 30 May 2026 22:05:25 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ysdnia3bs4JX; Sat, 30 May 2026 22:05:16 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4114E40E015A;
 Sat, 30 May 2026 22:05:02 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=alien8 header.d=alien8.de header.i="@alien8.de" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780178715; bh=m3IFBRGWpYfiOxqY5DPx1pgyUXwj+C+/Nkh3HlDkLUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jHWh7E8k2saR9udKBxbRiKvsGUXX1PQE1YcCQLWcwas8+yFS+KqaQ0c53dN1G+8Pd
	 ctJBdXvMPjZFQD7whTbgoQG4822uU9ozbbLxu0V85npj3LZB5WKn/n0TV4on98ddsY
	 koQb4/o8bKN0zmKS3dXpxDl/hLFGq04VOFMvZLRsZHuiiQ2AXTwwrX3OHmkYv5Jh2t
	 5z/EhIozSEJPxxLtfTDWdjg2nPXv+3IiPXdh21jdYN0pwA/z6tbcBS1yvopcOipSVL
	 7Usj7PIuH6Ko+ybsxBcfBS9MjMWWr5S+KUozDqPKeeJDqIsumnQVOcQ7XkL5zLTAAY
	 sYO+5ogu0meNaVc4g+zw7hTLOxvx8hDJAX7XbQvWk/Tu52ADIHI3EJejV1UjR1nrTo
	 /A1YxXAI5KJrrzuEz3YZb60k13GkdvVL4K+vSOxWkcbqCm075GwPVUhcBPZaGJTyW3
	 kPf4SCuBlBRfI+H6E6nXkr0SSUnM3FYMfLTiZQo9tuOV1b9L9JRut7zTXVjhBV5c4J
	 UMA+L6F1jV4/qVRuBLPOvL6vj72clniEAL/iAjfxtTIfvabLH4iB4NPYJpm64NIff9
	 HOWmKhXoAJc74C0N3Jhr5k/OVDFLhU8g+QVUIAD2bueE0X8/v9DAGmgYdMO5glEWsK
	 5G4UEe7v4JrWShGemSZQgkUE=
Date: Sat, 30 May 2026 15:04:53 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 0/4] x86/pvh: fix unbootable VMs again (PVH + KASAN)
Message-ID: <20260530220453.GAahtfBVv2hydidbnW@fat_crate.local>
References: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
 <20260527204736.GBahdYaKk6kAkIUYE3@fat_crate.local>
 <274609541a0c7c6b49b386001967dd2b@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <274609541a0c7c6b49b386001967dd2b@igalia.com>
X-purgate-ID: tlsNG-ef75cf/1780178726-0B175C48-2A0436CE/0/0
X-purgate-type: clean
X-purgate-size: 876
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com,igalia.com,vger.kernel.org,lists.xenproject.org,intel.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mfo@igalia.com,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:lkp@intel.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fat_crate.local:mid,alien8.de:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[alien8.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 63A1561386B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 03:25:25PM -0300, Mauricio Faria de Oliveira wrote:
> In this instance, the use case is to speed up the dev-test cycle when
> debugging on VMs: PVH allows booting directly from vmlinux, avoiding the
> need to build/compress and decompress bzImage, while KASAN helps detect
> issues early.

Makes sense in itself. And you can't do your use case with KVM? It has to be
Xen?

> Briefly, this is a side effect of reusing code from 'boot/string.c'
> through <asm/string.h>, which introduces additional complications;
> please see patch 1 for details.
> 
> These complications could be avoided by not reusing that code and
> instead adding slightly duplicated code [1] directly to <asm/string.h>,
> if that is preferred.

I'll take a look.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

