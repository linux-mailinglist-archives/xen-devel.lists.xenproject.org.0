Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE2bHKcycmmadwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:22:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1647E67DE8
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211167.1522711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivZp-0007eD-0E; Thu, 22 Jan 2026 14:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211167.1522711; Thu, 22 Jan 2026 14:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivZo-0007at-TP; Thu, 22 Jan 2026 14:22:24 +0000
Received: by outflank-mailman (input) for mailman id 1211167;
 Thu, 22 Jan 2026 14:22:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1ayx=73=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1vivZn-0006ZI-W7
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 14:22:23 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4c9374d-f79d-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 15:22:23 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1CB3940E02E6; 
 Thu, 22 Jan 2026 14:22:21 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DMMlNX1pwdPh; Thu, 22 Jan 2026 14:22:18 +0000 (UTC)
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 BCA0B40E027A; Thu, 22 Jan 2026 14:21:57 +0000 (UTC)
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
X-Inumbo-ID: c4c9374d-f79d-11f0-b15e-2bf370ae4941
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1769091737; bh=F8/cDg8dqL5KJe1easlfTdEAUVQhlPJZ3aHQ6mYvBTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJ3WBinh+XcE+G/KfxLdDGCXADNRC9ycWVeM2gABf0SdO8V9yXTM1WBn15ikHgJIT
	 M6JboIoIcrDLHxvifc+9Rjllxl4a6WvScepwxfgtT9SOVQ9n4YJnEvd9XdYjn+znje
	 EaCisS7Pw8BsAGasRjcFY8RRw2gcJBAhoMrGalf7k4BF61trK+dCkmYgdF96Flg8nC
	 JTe/8fSuEo8/JOzdLETpMfATpvyI8r1Fj5Iw/WG53f07ifzAmQ4PSJGOlYZmpm1IWn
	 WZe7K7UwZteZZoy+a22HE8oKTqQJ1nZluAsSoMuqV+9w5PSQmtC/FKCxv7v/kFS3L+
	 x0xHzifg7elq9pl7P3ucTvRZp/k1jA9S1cgvrkCkM2KB7cxWNEG6l6wkgFyN01LjTP
	 3j0JsT1CM2nqFyf8qIaZmA53Jrx+LlkrwFh5p+HLAcejQYnaz64KSLayjjKxit9PpU
	 +bd4EqnsjnLmpmORLKHpIZ+z+k1wGtptAEZPLUDByscrKyUO7FIM9MkeYMKGkUBkX9
	 X/sPrZSXo0Xxb2kO8p8uOydIfBzyFMKKo7CggP0pmRMzLD2hP71SOAyZ1aL2jlOOdP
	 /5y1JH2lt/gVIerwgWc9dK0cWdpeONREfMJpOl3jNWUIgjMthftBkryLuix/kVV7Is
	 bO6g82DIs31iXATqIrXJrsx4=
Date: Thu, 22 Jan 2026 15:21:56 +0100
From: Borislav Petkov <bp@alien8.de>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Li Chen <chenl311@chinatelecom.cn>, Brian Gerst <brgerst@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	Eric Dumazet <edumazet@google.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/smp: Move the static call update for 'smp_ops'
 into smp_prepare_boot_cpu()
Message-ID: <20260122142156.GEaXIyhNQeGvOR5yyu@fat_crate.local>
References: <b5e3f1d674af21c1592eab3ce8cc7dc93f9a7dad.1769090885.git.houwenlong.hwl@antgroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b5e3f1d674af21c1592eab3ce8cc7dc93f9a7dad.1769090885.git.houwenlong.hwl@antgroup.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:houwenlong.hwl@antgroup.com,m:linux-kernel@vger.kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:peterz@infradead.org,m:rafael.j.wysocki@intel.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:brgerst@gmail.com,m:sohil.mehta@intel.com,m:tim.c.chen@linux.intel.com,m:patryk.wlazlyn@linux.intel.com,m:edumazet@google.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,redhat.com,linux.intel.com,zytor.com,suse.com,oracle.com,infradead.org,intel.com,amd.com,chinatelecom.cn,gmail.com,google.com,lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DKIM_TRACE(0.00)[alien8.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 1647E67DE8
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 10:15:43PM +0800, Hou Wenlong wrote:
> The commit 1f60230cdc63 ("x86/smp: Use static_call for
> arch_send_call_function_ipi()") changed to use a static call for
> arch_send_call_function_ipi(), which causes two problems:
> 
> First, the KVM guest also changes 'smp_ops.send_call_func_ipi' when the
> PV sched yield feature is available. However, the missing
> static_call_update() breaks the PV sched yield feature.
> 
> Additionally, xen_smp_init() is called before static_call_init() during
> the booting of the XENPV guest, which triggers a warning in
> __static_call_update().
> 
> To simplify, move the static call update for 'smp_ops' into
> smp_prepare_boot_cpu() to address these two problems together.
> 
> Fixes: 1f60230cdc63 ("x86/smp: Use static_call for arch_send_call_function_ipi()")
> Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
> ---
> I'm not sure if the XEN part is okay or not. I think there should be no
> IPI before smp_prepare_boot_cpu(), and even if there is, it's okay for
> the KVM guest to use the native version before smp_prepare_boot_cpu().

All three commits zapped from tip:x86/core.

We can try again once this is resolved.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

