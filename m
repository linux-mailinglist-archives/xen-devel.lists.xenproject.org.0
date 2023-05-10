Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7056FDE94
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 15:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532808.829121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwjtn-0005bj-2K; Wed, 10 May 2023 13:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532808.829121; Wed, 10 May 2023 13:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwjtm-0005Zx-UQ; Wed, 10 May 2023 13:30:30 +0000
Received: by outflank-mailman (input) for mailman id 532808;
 Wed, 10 May 2023 13:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SHWl=A7=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1pwjtl-0005Ki-TK
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 13:30:29 +0000
Received: from mail.skyhub.de (mail.skyhub.de [2a01:4f8:190:11c2::b:1457])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4605425-ef36-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 15:30:29 +0200 (CEST)
Received: from zn.tnic (p5de8e8ea.dip0.t-ipconnect.de [93.232.232.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4C15A1EC066E;
 Wed, 10 May 2023 15:30:28 +0200 (CEST)
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
X-Inumbo-ID: d4605425-ef36-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1683725428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=Oc3RW44mGf8OYw/mNzGyRLjYbfWEFY3fZ/ETgZKmRPc=;
	b=jV4B4Iueyphgm33/i6nlFz+SYXoKsBUzU8Ri7y4TYU68qN7/dmfMJlbK1MNpXw1TR90Kpl
	d1/rbYqm0aRl90Tzw/hOuuMoNnSYbkigi+LV1eHzl3IeCJdrbGH/onF7EABu+OV28GcY+p
	ZJ+8upyZumiT7YyvTUED0tVtgBdB47U=
Date: Wed, 10 May 2023 15:30:24 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-hyperv@vger.kernel.org, linux-doc@vger.kernel.org,
	mikelley@microsoft.com, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6 00/16] x86/mtrr: fix handling with PAT but without MTRR
Message-ID: <20230510133024.GBZFuccC1FxIZNKL+8@fat_crate.local>
References: <20230502120931.20719-1-jgross@suse.com>
 <20230509201437.GFZFqprc6otRejDPUt@fat_crate.local>
 <20230509233641.GGZFrZCTDH7VwUMp5R@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509233641.GGZFrZCTDH7VwUMp5R@fat_crate.local>

On Wed, May 10, 2023 at 01:36:41AM +0200, Borislav Petkov wrote:
> More staring at this tomorrow, on a clear head.

Yeah, I'm going to leave it as is. Tried doing a union with bitfields
but doesn't get any prettier.

Next crapola:

The Intel box says now:

[    8.138683] sgx: EPC section 0x80200000-0x85ffffff
[    8.204838] pmd_set_huge: Cannot satisfy [mem 0x80200000-0x80400000] with a huge-page mapping due to MTRR override, uniform: 0

(I've extended the debug output).

and that happens because

[    8.174229] mtrr_type_lookup: mtrr_state_set: 1
[    8.178909] mtrr_type_lookup: start: 0x80200000, cache_map[3].start: 0x88800000

that's

	 if (start < cache_map[i].start) {

in mtrr_type_lookup(). I fail to see how that check would work for the
range 0x80200000-0x80400000 and the MTRR map is:

[    0.000587] MTRR map: 4 entries (3 fixed + 1 variable; max 23), built from 10 variable MTRRs
[    0.000588]   0: 0000000000000000-000000000009ffff write-back
[    0.000589]   1: 00000000000a0000-00000000000bffff uncachable
[    0.000590]   2: 00000000000c0000-00000000000fffff write-protect
[    0.000591]   3: 0000000088800000-00000000ffffffff uncachable

so the UC range comes after this one we request.

[    8.186372] mtrr_type_lookup: type: 0x6, cache_map[3].type: 0x0

now the next type merging happens and the 3rd region's type is UC, ofc.

[    8.192433] type_merge: type: 0x6, new_type: 0x0, effective_type: 0x0, clear uniform

we clear uniform and we fail:

[    8.200331] mtrr_type_lookup: ret, uniform: 0

So this map lookup thing is wrong in this case.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

