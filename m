Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 382AD7D68C1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622824.970006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvbDe-0001Nq-0p; Wed, 25 Oct 2023 10:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622824.970006; Wed, 25 Oct 2023 10:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvbDd-0001LH-UQ; Wed, 25 Oct 2023 10:34:33 +0000
Received: by outflank-mailman (input) for mailman id 622824;
 Wed, 25 Oct 2023 10:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KNSz=GH=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1qvbDc-0001Jx-1E
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:34:32 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 146f5a1c-7322-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 12:34:30 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BDDE140E01B1; 
 Wed, 25 Oct 2023 10:34:28 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QhHASVTCwIga; Wed, 25 Oct 2023 10:34:27 +0000 (UTC)
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B3E1740E0196;
 Wed, 25 Oct 2023 10:34:08 +0000 (UTC)
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
X-Inumbo-ID: 146f5a1c-7322-11ee-98d5-6d05b1d4d9a1
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1698230067; bh=18/mcvH27y89kOfWgOoc8il6KtQKA9GxDmtXxRzFDWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THlV6aVyPuO4ttcnuH/sGy+hWth3pFJ07cC8hdq9VyG+NrRs/JloOwG2eT09BBphI
	 RlM67phHuDDqlYPZj44DIIVVPEP0IbQLF6FlE7kTMwDkM9ucCXtShvRTn3PURoC7+S
	 71N3Cgs86GC7rspSy0IFg1kiTZX9AXS6TRlmhA8CchZBik8YxcJY2RHS8pQnaEgjcJ
	 +UDXQ/F6AJ/wmNnWh6fGhA3s0cN1TiXtb3/aP30DNq1EGWpoG5dCVw54fe9CcSnTMw
	 LkybLkvVkIJGj5Ax2VPWJsFlGPNwXoiUhtOo39O2PdqpH6rx6Z2f7d7lO3heV4q9Oj
	 jmRV9D25H83khSsp3ccugLurO/iUhzlRD8aGNl2b7PkflskJnrV486d+8EOoJFDWup
	 H36ii52EzVM/gC1PQheMUv9cNyPpZG3lsIY13i3B1b8uCCh8CwnK05i0M4kqjzyU8A
	 v7yevDQlwKxc43uw/0QlTAdTA7sQ4CFT3aRpbSthtG4/CGwXlVRbkDEMUGrcMAMNyV
	 SjhVKhf0madhWha83TWsjxX+DndfcCe06zn2F4TzrpxE0ccnwU5xNm0Ou4wP/w3BGq
	 l2qJa88fiy1hYv+ux2UZyZustv7joHhOV5ves/f5olzL7HgQaoeDOo9ZaJ3lMal37F
	 kiycBZsBh5nho7t4msMZd5IY=
Date: Wed, 25 Oct 2023 12:34:02 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ajay Kaher <akaher@vmware.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 1/5] x86/paravirt: move some functions and defines to
 alternative
Message-ID: <20231025103402.GBZTjvGse9c0utZGO0@fat_crate.local>
References: <20231019091520.14540-1-jgross@suse.com>
 <20231019091520.14540-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231019091520.14540-2-jgross@suse.com>

On Thu, Oct 19, 2023 at 11:15:16AM +0200, Juergen Gross wrote:
> +/* Low-level backend functions usable from alternative code replacements. */
> +DEFINE_ASM_FUNC(x86_nop, "", .entry.text);
> +EXPORT_SYMBOL_GPL(x86_nop);

This is all x86 code so you don't really need the "x86_" prefix - "nop"
is perfectly fine.

> +noinstr void x86_BUG(void)
> +{
> +	BUG();
> +}
> +EXPORT_SYMBOL_GPL(x86_BUG);

That export is needed for?

Paravirt stuff in modules?

It builds here without it - I guess I need to do an allmodconfig.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

