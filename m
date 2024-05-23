Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38C78CCC50
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 08:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728072.1132822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA22K-0008Lj-CY; Thu, 23 May 2024 06:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728072.1132822; Thu, 23 May 2024 06:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA22K-0008JV-9v; Thu, 23 May 2024 06:34:48 +0000
Received: by outflank-mailman (input) for mailman id 728072;
 Thu, 23 May 2024 06:34:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QTNb=M2=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1sA22I-0008JN-L6
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 06:34:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8adeec37-18ce-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 08:34:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 10D4862C85;
 Thu, 23 May 2024 06:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33804C2BD10;
 Thu, 23 May 2024 06:34:43 +0000 (UTC)
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
X-Inumbo-ID: 8adeec37-18ce-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716446083;
	bh=XxVSYbHZ+H/p/wEVBPhFkeHIAS4bvPHUHG/AfTbTDl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qj4PLV3HfkRjRQvaCMLX5FImOPh0tTMCsbpqbwyjmQ9PuQCJMuRKK4DRfMAdT+H64
	 /pyVc6TFgQ1Ff0VO5zYnQCh7NihLZ5ubHevsFD67z9IPgAHJ09ei56lxzlYf5BLgaN
	 tDPpQVlYjfjJ5j3Xrko/muiRpAeisWvFzfXLZ7Ss=
Date: Thu, 23 May 2024 08:34:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
	dave.hansen@linux.intel.com,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	xen-devel@lists.xenproject.org, security@debian.org,
	Salvatore Bonaccorso <carnil@debian.org>, benh@debian.org,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH 5.10] x86/xen: Drop USERGS_SYSRET64 paravirt call
Message-ID: <2024052333-squishy-phony-d2e2@gregkh>
References: <20240522-verw-xen-pv-fix-v1-1-45add699c0e4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522-verw-xen-pv-fix-v1-1-45add699c0e4@linux.intel.com>

On Wed, May 22, 2024 at 06:20:15PM -0700, Pawan Gupta wrote:
> From: Juergen Gross <jgross@suse.com>
> 
> commit afd30525a659ac0ae0904f0cb4a2ca75522c3123 upstream.

Now queued up, thanks.

greg k-h

