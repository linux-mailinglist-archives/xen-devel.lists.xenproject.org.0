Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AACA93F422
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 13:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766631.1177132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOdH-0008If-BC; Mon, 29 Jul 2024 11:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766631.1177132; Mon, 29 Jul 2024 11:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOdH-0008HE-8a; Mon, 29 Jul 2024 11:33:39 +0000
Received: by outflank-mailman (input) for mailman id 766631;
 Mon, 29 Jul 2024 11:33:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2xOR=O5=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1sYOdE-0008H3-KC
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 11:33:37 +0000
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62516039-4d9e-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 13:33:32 +0200 (CEST)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55110)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sYOcq-00045I-1a;
 Mon, 29 Jul 2024 12:33:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sYOcp-0004HW-NT; Mon, 29 Jul 2024 12:33:11 +0100
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
X-Inumbo-ID: 62516039-4d9e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wW9pxkDzQg+yBW1oIEL/KaRBqPYRvqr8l7NCyzI1vz8=; b=mKmAhjZND32uINvoMlw8aAwV45
	JM8gYQ5yvZxJN9wwL5vOmaP9p9S4woOwnZ0QHbHYGf806WmsaApv6dRXJmvZmK443XlFau4HOK7ty
	PS1EOh+d95auyIjLW3cnUBc2m95ln+UEU39BI7kAt9oAgI8LjL4HzS341sX85VNHppwtBuwtTxWE0
	Ulrebm3qogVzFVpthb9yxcTPLXeTs8KauIprCix8nuCPkm3DJlNpNDU65BaNzE8zXehNuISKUkpUy
	4LOdrFf8xxRKGrTz914qlqIxvyGdrpytWDdz3IW1aet706cA2r7tYL6tXWhsvmN5J1VABBJOwP5gD
	9btd+zpg==;
Date: Mon, 29 Jul 2024 12:33:11 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v1 1/3] mm: turn USE_SPLIT_PTE_PTLOCKS /
 USE_SPLIT_PTE_PTLOCKS into Kconfig options
Message-ID: <Zqd998jx8NJK+BNX@shell.armlinux.org.uk>
References: <20240726150728.3159964-1-david@redhat.com>
 <20240726150728.3159964-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726150728.3159964-2-david@redhat.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Jul 26, 2024 at 05:07:26PM +0200, David Hildenbrand wrote:
> Let's clean that up a bit and prepare for depending on
> CONFIG_SPLIT_PMD_PTLOCKS in other Kconfig options.
> 
> More cleanups would be reasonable (like the arch-specific "depends on"
> for CONFIG_SPLIT_PTE_PTLOCKS), but we'll leave that for another day.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

