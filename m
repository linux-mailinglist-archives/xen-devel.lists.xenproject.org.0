Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DD52DB7D7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 01:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54944.95503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpKqT-000603-6W; Wed, 16 Dec 2020 00:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54944.95503; Wed, 16 Dec 2020 00:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpKqT-0005yq-2q; Wed, 16 Dec 2020 00:39:09 +0000
Received: by outflank-mailman (input) for mailman id 54944;
 Wed, 16 Dec 2020 00:39:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZX4=FU=redhat.com=jpoimboe@srs-us1.protection.inumbo.net>)
 id 1kpKqR-0005v7-D2
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 00:39:07 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 53cf8209-bb26-4f36-96ca-6a9ecc530da1;
 Wed, 16 Dec 2020 00:39:05 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-wYBKR5ESPACLwIRJr6G_JA-1; Tue, 15 Dec 2020 19:39:03 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B14061054F8E;
 Wed, 16 Dec 2020 00:38:10 +0000 (UTC)
Received: from treble (ovpn-112-170.rdu2.redhat.com [10.10.112.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44CAF5DD87;
 Wed, 16 Dec 2020 00:38:04 +0000 (UTC)
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
X-Inumbo-ID: 53cf8209-bb26-4f36-96ca-6a9ecc530da1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608079145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BCyr+zCzlSHQ1KjMAt3Zb/a+qisNyayFH7/e91jTxqk=;
	b=Wc6kB00M0aX8D/pn0V4QnbkpFZmoJeLjefwnzj6H3NGm2d/YcAhHoXJTBKsfTb9fsalhIB
	nnDVlmakQG4smw9LU4pPKD5oas3q/cfpkcpSdcNgYLGDV/lT+HuMRyO/38evLtYmyIGNqC
	ArW85v8lKLNBaqLmX+jVbExyqqjOM3k=
X-MC-Unique: wYBKR5ESPACLwIRJr6G_JA-1
Date: Tue, 15 Dec 2020 18:38:02 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, luto@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>
Subject: Re: [PATCH v2 00/12] x86: major paravirt cleanup
Message-ID: <20201216003802.5fpklvx37yuiufrt@treble>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120125342.GC3040@hirez.programming.kicks-ass.net>
 <20201123134317.GE3092@hirez.programming.kicks-ass.net>
 <6771a12c-051d-1655-fb3a-cc45a3c82e29@suse.com>
 <20201215141834.GG3040@hirez.programming.kicks-ass.net>
 <20201215145408.GR3092@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201215145408.GR3092@hirez.programming.kicks-ass.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14

On Tue, Dec 15, 2020 at 03:54:08PM +0100, Peter Zijlstra wrote:
> The problem is that a single instance of unwind information (ORC) must
> capture and correctly unwind all alternatives. Since the trivially
> correct mandate is out, implement the straight forward brute-force
> approach:
> 
>  1) generate CFI information for each alternative
> 
>  2) unwind every alternative with the merge-sort of the previously
>     generated CFI information -- O(n^2)
> 
>  3) for any possible conflict: yell.
> 
>  4) Generate ORC with merge-sort
> 
> Specifically for 3 there are two possible classes of conflicts:
> 
>  - the merge-sort itself could find conflicting CFI for the same
>    offset.
> 
>  - the unwind can fail with the merged CFI.

So much algorithm.  Could we make it easier by caching the shared
per-alt-group CFI state somewhere along the way?

For example:

struct alt_group_info {

	/* first original insn in the group */
	struct instruction *orig_insn;

	/* max # of bytes in the group (cfi array size) */
	unsigned long nbytes;

	/* byte-offset-addressed array of CFI pointers */
	struct cfi_state **cfi;
};

We could change 'insn->alt_group' to be a pointer to a shared instance
of the above struct, so that all original and replacement instructions
in a group have a pointer to it.

Starting out, 'cfi' array is all NULLs.  Then when updating CFI, check
'insn->alt_group.cfi[offset]'.

[ 'offset' is a byte offset from the beginning of the group.  It could
  be calculated based on 'orig_insn' or 'orig_insn->alts', depending on
  whether 'insn' is an original or a replacement. ]

If the array entry is NULL, just update it with a pointer to the CFI.
If it's not NULL, make sure it matches the existing CFI, and WARN if it
doesn't.

Also, with this data structure, the ORC generation should also be a lot
more straightforward, just ignore the NULL entries.

Thoughts?  This is all theoretical of course, I could try to do a patch
tomorrow.

-- 
Josh


