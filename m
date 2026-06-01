Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAedCcrJHWrHeQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 20:04:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9232623B18
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 20:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324094.1589771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU70E-0000Xg-Ho; Mon, 01 Jun 2026 18:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324094.1589771; Mon, 01 Jun 2026 18:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU70E-0000VR-En; Mon, 01 Jun 2026 18:04:42 +0000
Received: by outflank-mailman (input) for mailman id 1324094;
 Mon, 01 Jun 2026 18:04:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wU70D-0000VL-5Q
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 18:04:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU70C-00EI1p-Id
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 20:04:40 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a1dc997-e002-0a2a0a5209dd-0a2a450ba112-48
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 20:04:40 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 6a1dc9b7-212f-0a2a450b0019-d561b338c334-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 20:04:40 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wU6zu-00B91M-TD; Mon, 01 Jun 2026 20:04:22 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wU6zs-005tFe-56; Mon, 01 Jun 2026 20:04:22 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wU6zr-000000064OL-3uxl;
 Mon, 01 Jun 2026 20:04:19 +0200
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
	bh=5mTiom1oq08KxEM2eAgq3ALBOMeHGMQoEyS7WmWVYGA=; b=JtChi68llI/7raY/N+0y/8NVer
	OSSDM/g7FN60GA7bbosDl1asFuHyEOdG7lh6mTVgDXE3vygxkN41YehISeczFmtCTIGQE26+p3dgR
	NY/Gy53UDWKV3r4xpwIeTrYcjDDWxZqfY3O0fGVYNsap0Uh5XnQbVL5jw+Uoeev1EJ5cSWS7ZJKpU
	kPgZLSN2bdUIWDiBQGPPf0uSQuc/7lTXDAiMWMAscA/poHv2VAeefHDruN58X6pQRAp4p1H2BYoTH
	lGK9WpM7cMSpWZbeAJp0yGXithBey9nKucBnH/N5EjoEoAbLUGwf6ZcsQt24qlm6jEeAkiioO5krP
	gpPc5bFg==;
MIME-Version: 1.0
Date: Mon, 01 Jun 2026 15:04:19 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross
 <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 0/4] x86/pvh: fix unbootable VMs again (PVH + KASAN)
In-Reply-To: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
References: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
Message-ID: <7605951bca0a9caede0ab9622aaad97e@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.6, Tests=ALL_TRUSTED=-3,AWL=0.401,BAYES_40=-0.001
X-Spam-Score: -25
X-Spam-Bar: --
X-purgate-ID: tlsNG-42698a/1780337080-2087FF3B-53C77E9D/0/0
X-purgate-type: clean
X-purgate-size: 402
X-Spamd-Result: default: False [0.61 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:lkp@intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_SPAM(0.00)[0.281];
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
X-Rspamd-Queue-Id: C9232623B18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-26 11:52, Mauricio Faria de Oliveira wrote:
> The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.
> 
> Booting directly from vmlinux (instead of bzImage) now fails with gcc-14/15
> (but works with gcc-12/13) if CONFIG_KASAN_GENERIC is set, on Ubuntu 25.10.

v5:
https://lore.kernel.org/all/20260601-pvh-kasan-inline-v5-0-c996e92dfe9a@igalia.com

-- 
Mauricio

