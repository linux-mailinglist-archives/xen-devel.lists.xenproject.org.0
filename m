Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOnIOK9sG2qhCAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2026 01:03:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2EB613C67
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2026 01:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323212.1589093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTShr-0005pQ-Bc; Sat, 30 May 2026 23:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323212.1589093; Sat, 30 May 2026 23:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTShr-0005o5-7c; Sat, 30 May 2026 23:03:03 +0000
Received: by outflank-mailman (input) for mailman id 1323212;
 Sat, 30 May 2026 23:03:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wTShq-0005nx-0I
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 23:03:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTShp-0063jz-DX
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 01:03:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a1b6c31-2eae-0a2a0a5409dd-0a2a450698cc-22
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 01:03:01 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 6a1b6ca3-7371-0a2a45060019-d561b338c592-3
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 01:03:00 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wTShW-00AOt3-O5; Sun, 31 May 2026 01:02:42 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wTShU-003sXQ-Bo; Sun, 31 May 2026 01:02:42 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wTShT-00000005c0H-2nsP;
 Sun, 31 May 2026 01:02:40 +0200
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
	bh=0e1j39Y2oFVYSscT1RqTvuMxpPQ15EgNX2akOpk7I+c=; b=ZyKbv4b/FhlYIu0FsLkaQYN3C4
	Tw5ecV/XYK6/hYhF4M3Kvextrh9BUJy9/rtdAOrN8KfPjdC+kNVnsnDezMQHsaXi7HDEQxjHYp63m
	BpOAuo0CFI0370U/Os2bmDppfV56giWs12GXk4Z9aXIgyn9wjaD3qfA2ZUJ3KSp+tAmgooKb9O8vF
	S0A9msZfeiLGgpZi+V1gq8O0ahz0g4lIVjHCggRFs5U5MKR6l383pNSgqCGcR6fZUev+hFOVb67zN
	C45NXw4MULVFmyCZaaF9kNyFuzfIv50xxlAX7jFf6LNuhg5Ru00N+PVfKqYW0N7dNdzgEVKcaKaJD
	beuzu9NQ==;
MIME-Version: 1.0
Date: Sat, 30 May 2026 20:02:40 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 0/4] x86/pvh: fix unbootable VMs again (PVH + KASAN)
In-Reply-To: <7f1af7169b4f8c90abae28cebd3e377f@igalia.com>
References: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
 <20260527204736.GBahdYaKk6kAkIUYE3@fat_crate.local>
 <274609541a0c7c6b49b386001967dd2b@igalia.com>
 <20260530220453.GAahtfBVv2hydidbnW@fat_crate.local>
 <7f1af7169b4f8c90abae28cebd3e377f@igalia.com>
Message-ID: <28155e57d75407a645d57e4a6f99859c@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-4.7, Tests=ALL_TRUSTED=-3,AWL=-2.551,BAYES_50=0.8,URIBL_BLOCKED=0.001,URIBL_DBL_BLOCKED_OPENDNS=0.001,URIBL_ZEN_BLOCKED_OPENDNS=0.001
X-Spam-Score: -46
X-Spam-Bar: ----
X-purgate-ID: tlsNG-16d1c6/1780182181-8E58CD75-3A0F5103/0/0
X-purgate-type: clean
X-purgate-size: 1280
X-Spamd-Result: default: False [0.61 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bp@alien8.de,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:lkp@intel.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stefano-garzarella.github.io:url];
	FORGED_SENDER(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com,igalia.com,vger.kernel.org,lists.xenproject.org,intel.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_SPAM(0.00)[0.984];
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
X-Rspamd-Queue-Id: 9D2EB613C67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-30 20:01, Mauricio Faria de Oliveira wrote:
> On 2026-05-30 19:04, Borislav Petkov wrote:
>> On Sat, May 30, 2026 at 03:25:25PM -0300, Mauricio Faria de Oliveira wrote:
>>> In this instance, the use case is to speed up the dev-test cycle when
>>> debugging on VMs: PVH allows booting directly from vmlinux, avoiding the
>>> need to build/compress and decompress bzImage, while KASAN helps detect
>>> issues early.
>> 
>> Makes sense in itself. And you can't do your use case with KVM? It has to be
>> Xen?
> 
> It uses KVM, actually. 
> 
> IIUIC, the PVH entry point was originally developed for Xen, but later
> QEMU support was added for KVM as well.
> (found this blog post [1] with a nice summary and links about it.)

[1]
https://stefano-garzarella.github.io/posts/2019-08-23-qemu-linux-kernel-pvh/

>>> Briefly, this is a side effect of reusing code from 'boot/string.c'
>>> through <asm/string.h>, which introduces additional complications;
>>> please see patch 1 for details.
>>> 
>>> These complications could be avoided by not reusing that code and
>>> instead adding slightly duplicated code [1] directly to <asm/string.h>,
>>> if that is preferred.
>> 
>> I'll take a look.
> 
> Ok, thanks!
> 
>> 
>> Thx.

-- 
Mauricio

