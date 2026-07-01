Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eBZMOPV8RWosBAsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 22:47:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8996D6F1969
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 22:47:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alien8.de header.s=alien8 header.b=C7MVCdKI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=alien8.de
Received: from list by lists.xenproject.org with outflank-mailman.1350913.1608305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf1ps-00046Q-Vg; Wed, 01 Jul 2026 20:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350913.1608305; Wed, 01 Jul 2026 20:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf1ps-00044R-T4; Wed, 01 Jul 2026 20:47:08 +0000
Received: by outflank-mailman (input) for mailman id 1350913;
 Wed, 01 Jul 2026 20:47:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1wf1ps-00044L-0V
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 20:47:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf1pr-004xLn-Da
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 22:47:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a457cb8-5cb7-0a2a0a5109dd-0a2a4503cece-8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 22:47:07 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6a457cca-ec1a-0a2a45030019-416d716cace4-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 22:47:07 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 64F4D40E00C0; 
 Wed,  1 Jul 2026 20:47:06 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ADSUZm13yOCQ; Wed,  1 Jul 2026 20:46:56 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C4B3E40E00BA;
 Wed,  1 Jul 2026 20:46:43 +0000 (UTC)
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
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782938816; bh=9DZRvVZl98blze4dH738SldPTBajzvNlA9enkx5HNIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C7MVCdKIQwJBnVfm7mPnS8PAwg8Y1NoZYuHElYGyAKM7fc+mxdWybKjpHwB8Mzpj7
	 KclOVs3gcHxvdMHsPAj8iH8SNPTWp7B0Vhab9XIHYE6emHehyMKHFp55OoI6O4whFN
	 dZuVNgXvXHKj44a71aB1w2P2jj5RnKtz8T7bn6+qI2mIxTwc7Z6xlCDax5fC8pvB+v
	 2AjPuYATyrrM16xtVMFNfMedmTu1U3JSRkUc08UTlOIzC85dGDcZvdWRpQhaQevBUp
	 Edy6Wpp7pSCohtn8TKAmSbm6+pLcyCp483eA4gItw992xn/7LkY/zhZ4qnCpaF2hfP
	 j4TmDGAeHfgAYuUhcpHQFh9MplY5RHZKFVbjriD26bmvJqrIk1w4xEQgpwhOEId496
	 uAhlywQXu0lqi90BD+wQsFC8Mt+RwsVUPLQf1OiDxNAzTHUse2qefnINugWPLcA5wG
	 mbUWK27MIqklxtgx/t/3EbeQgPVgOZHhye2doLhUjIGapdertqDCuHDj05D5NLhqHr
	 mIbu4r68mDwYkBwBfv49iqHCCHUdYXDMdGSJHeEQzK47bM5VghW1cGgdep/P2JmfnR
	 Rbd1lOVSWh7c904tEBDe0W4Mtv4jWb4uFGzXbkuasAvAAEs7tJluKPHfayUcPIgDEr
	 dZ2b9K7+94deC1hVIAG0ZPjk=
Date: Wed, 1 Jul 2026 13:46:40 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH RESEND v5 1/3] x86/asm, x86/boot: expose inline memcmp
Message-ID: <20260701204640.GDakV8sOK1cu-0P4Bc@fat_crate.local>
References: <20260630-pvh-kasan-inline-v5-0-52afc979be81@igalia.com>
 <20260630-pvh-kasan-inline-v5-1-52afc979be81@igalia.com>
 <20260701184014.GDakVfDhIgaIKurzTb@fat_crate.local>
 <fed9dc5860b96063c06592080f957589@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fed9dc5860b96063c06592080f957589@igalia.com>
X-purgate-ID: tlsNG-33051d/1782938827-05F325D1-A13D5476/0/0
X-purgate-type: clean
X-purgate-size: 806
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com,igalia.com,vger.kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mfo@igalia.com,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[alien8.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8996D6F1969

On Wed, Jul 01, 2026 at 04:57:57PM -0300, Mauricio Faria de Oliveira wrote:
> I'm not sure, as Reported-by and Suggested-by mean something different.
> 
> Maybe a simpler statement would do? e.g., '(Thanks to David Laight for
> noticing the return value difference between inline and regular
> memcmp())'. That gives credit while avoiding confusion with tags.

The Link tag already points to the review thread where we document who
suggested what. We don't document who gave what review comments and
suggestions for the simple reason that that would be intractable and the other
simple reason is that they don't belong in the commit message.

Changelog comments belong *exactly* under the "---" line.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

