Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300F859BB93
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 10:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391229.628954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ2nH-0003W9-U8; Mon, 22 Aug 2022 08:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391229.628954; Mon, 22 Aug 2022 08:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ2nH-0003T5-Qc; Mon, 22 Aug 2022 08:28:23 +0000
Received: by outflank-mailman (input) for mailman id 391229;
 Mon, 22 Aug 2022 08:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YOEa=Y2=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oQ2nG-0003Sz-5U
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 08:28:22 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eedd040-21f4-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 10:28:19 +0200 (CEST)
Received: from zn.tnic (p200300ea971b9882329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:971b:9882:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E8CAA1EC04DA;
 Mon, 22 Aug 2022 10:28:12 +0200 (CEST)
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
X-Inumbo-ID: 5eedd040-21f4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1661156893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=3t9+6nfiuQKFvxF6QSwH6wfi0OEdPc0eB0BQ88sluiw=;
	b=LBTgUcDzl5EdkYRDDlSD9fBZ0rURljXWITRA9M9N8bU0uOJgF0ELIcgHu1BNxGDLbs8SjS
	rzXJHZvhI0nkzVUuapeB4U5odChwEb15KS+ReeR2th/1wYx7PdbXEUpL1kh3/p9CNFT3dm
	aQbFCNV0IyjQbUqZostPTwFiS+hKwUg=
Date: Mon, 22 Aug 2022 10:28:08 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 01/10] x86/mtrr: fix MTRR fixup on APs
Message-ID: <YwM+GPu8hFowl2R7@zn.tnic>
References: <20220820092533.29420-1-jgross@suse.com>
 <20220820092533.29420-2-jgross@suse.com>
 <YwIkV7mYAC4Ebbwb@zn.tnic>
 <YwKmcFuKlq3/MzVi@zn.tnic>
 <f205da1c-db33-299c-5fc6-922a8ebd1983@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f205da1c-db33-299c-5fc6-922a8ebd1983@suse.com>

On Mon, Aug 22, 2022 at 07:17:40AM +0200, Juergen Gross wrote:
> And then there is mtrr_state_warn() in arch/x86/kernel/cpu/mtrr/generic.c
> which has a comment saying:
> 
> /* Some BIOS's are messed up and don't set all MTRRs the same! */

That thing also says:

        pr_info("mtrr: probably your BIOS does not setup all CPUs.\n");
        pr_info("mtrr: corrected configuration.\n");

because it'll go and force on all CPUs the MTRR state it read from the
BSP in mtrr_bp_init->get_mtrr_state.

> Yes, the chances are slim to hit such a box,

Well, my workstation says:

$ dmesg | grep -i mtrr
[    0.391514] mtrr: your CPUs had inconsistent variable MTRR settings
[    0.395199] mtrr: probably your BIOS does not setup all CPUs.
[    0.399199] mtrr: corrected configuration.

but that's the variable MTRRs.

> but your reasoning suggests I should remove the related code?

My reasoning says you should not do anything at all here - works as
advertized. :-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

