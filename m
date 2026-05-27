Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLjwL6xYF2oPBQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 22:48:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F94B5EA2FA
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 22:48:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320744.1587925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSLAi-0000pR-P2; Wed, 27 May 2026 20:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320744.1587925; Wed, 27 May 2026 20:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSLAi-0000mn-Lf; Wed, 27 May 2026 20:48:12 +0000
Received: by outflank-mailman (input) for mailman id 1320744;
 Wed, 27 May 2026 20:48:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1wSLAg-0000mh-Ow
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 20:48:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSLAg-0097YP-52
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 22:48:10 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a175836-5cb7-0a2a0a5109dd-0a2a45089f10-34
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 22:48:10 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bp@alien8.de>)
 id 6a175889-63b5-0a2a45080019-416d716c9cee-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 22:48:09 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2B87C40E01B3; 
 Wed, 27 May 2026 20:48:09 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WxFx1lZgTAZy; Wed, 27 May 2026 20:47:59 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9056640E0031;
 Wed, 27 May 2026 20:47:45 +0000 (UTC)
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
	t=1779914879; bh=wGjwOLOD2iq11IIumJe2A1oiDvFcnGWGdAgKbbBNxWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M0s4fF+h/2ur885teZ75bctUV7OMk+0UCiWuuVLrDoB9fOUF/yGvYgm8zmYIwHrX4
	 Ip7imdYYM+mHtpFfhiwoXPXN9alY1zaSHkb4O8XCfDSd9NFiHScUjEeUXbql8vCCol
	 LeTZ9lhtYZ/ylKubrIL4k8xKsCKcs/sV1s/WmKO2azfKjdZl8VqjpjWtcMHEvughXn
	 U8SpwqRT74F1oEMHcVpp1RZYL6gMhaN15TmMJW94pFAeGQPWMBldniUH3GO+S+15Ma
	 6joU8np5OcZzV5IzEZ14SbFupTu8rRNG/cbS84F9yIDAxrZbj+omc3odjmMVER/mzY
	 YC5r6wuAUI/9A0OzBeYzP5XRyx8RI4iw+PH95m6Rtxk5zaGK3X0DBZzjjLELzWCU2X
	 aCNMn3FK20QAypGwt4I5H3ts+k1G4wI3dmtQO1jt6dSut9Gj4k1c/5tZAcC8G+Bc+n
	 qQzXipnrLGZ9ltjzTAg9QMAFEk9iY52AKo3EsQjgaDVkfT6ul+O75MH5DITijKqCns
	 +Z74tO5ZkPy+XSNrYAaRnqmQFqt6AgJUChBfZ/lCTnbQGTFbZ+aR1m6p63+KwD6e0x
	 M/4RT1RBkadP5jA6WFgriTiERI8GKwPiKxG7Cqgn1zme83+5x1/S9Q6bhAYKOKXdVe
	 IHiJAVwFKJ9VFz1PCodFxl70=
Date: Wed, 27 May 2026 13:47:36 -0700
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
Message-ID: <20260527204736.GBahdYaKk6kAkIUYE3@fat_crate.local>
References: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
X-purgate-ID: tlsNG-c1860d/1779914890-BCF62DB1-A72754D2/0/0
X-purgate-type: clean
X-purgate-size: 724
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[alien8.de:dkim,fat_crate.local:mid];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 5F94B5EA2FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 11:52:32AM -0300, Mauricio Faria de Oliveira wrote:
> The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.

... and we care about that particular configuration because...?

>  arch/x86/boot/string.c               |  6 ++----
>  arch/x86/include/asm/cpuid/api.h     |  2 +-
>  arch/x86/include/asm/string.h        | 21 +-------------------
>  arch/x86/include/asm/string_inline.h | 37 ++++++++++++++++++++++++++++++++++++
>  arch/x86/platform/pvh/enlighten.c    |  3 ++-
>  5 files changed, 43 insertions(+), 26 deletions(-)

I fail to see justification for those gymnastics.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

