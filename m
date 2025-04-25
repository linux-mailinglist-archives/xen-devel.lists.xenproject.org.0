Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5396CA9CCE9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 17:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968284.1357940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Kzn-0007XD-Fm; Fri, 25 Apr 2025 15:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968284.1357940; Fri, 25 Apr 2025 15:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Kzn-0007V1-C9; Fri, 25 Apr 2025 15:29:43 +0000
Received: by outflank-mailman (input) for mailman id 968284;
 Fri, 25 Apr 2025 15:29:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tq29=XL=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u8Kzl-0007Gp-Oi
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 15:29:41 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19ef719e-21ea-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 17:29:40 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53PFTBaV2880069
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 25 Apr 2025 08:29:11 -0700
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
X-Inumbo-ID: 19ef719e-21ea-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53PFTBaV2880069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745594953;
	bh=HV6VAWyHmVnGscrHkhlxywgfLhBCIOaIqAHKg4TF8Ww=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=iQ+XMvqcZNxnOa/I9EZR/mshfDVcYq+cePk2TG9e54uOwCvKB3Jjm1xPdmYlOwRHP
	 DQZfYPcgHJ15ycfkCO44CHxAPNtKlEpwO+e3HbxLS3WN5m2GlJgLqWvrW6B8D4o5ub
	 Zes9COz/AXoKuLU158cfbQSbTaxvthVom0W4PheBM19CU1DpvbPqSU/MWFk1vVebut
	 H1I+EYvdBYhAeTwxxohUMZyQi5+jbZbMqhhRx83ibCp8qGgDSmy4rn/uqaOKU2J8Xd
	 bhvIxW5HPWNJCE2YRbuH/hDPmgfebrJ9qBuyd4/X+QvQ9OurZ3B/Ph0cuuoO0f3nvo
	 c91K5uZbr30YA==
Date: Fri, 25 Apr 2025 08:29:10 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Peter Zijlstra <peterz@infradead.org>,
        =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
CC: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-pm@vger.kernel.org,
        linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
        netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, acme@kernel.org,
        andrew.cooper3@citrix.com, namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
        pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
        luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
        haiyangz@microsoft.com, decui@microsoft.com
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v2_21/34=5D_x86/msr=3A_Utiliz?=
 =?US-ASCII?Q?e_the_alternatives_mechanism_to_write_MSR?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250425123317.GB22125@noisy.programming.kicks-ass.net>
References: <20250422082216.1954310-1-xin@zytor.com> <20250422082216.1954310-22-xin@zytor.com> <b2624e84-6fab-44a3-affc-ce0847cd3da4@suse.com> <f7198308-e8f8-4cc5-b884-24bc5f408a2a@zytor.com> <37c88ea3-dd24-4607-9ee1-0f19025aaef3@suse.com> <20250425123317.GB22125@noisy.programming.kicks-ass.net>
Message-ID: <E1BAF52C-A955-466A-B5A2-DE12876FBFCF@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 25, 2025 5:33:17 AM PDT, Peter Zijlstra <peterz@infradead=2Eorg> w=
rote:
>On Wed, Apr 23, 2025 at 06:05:19PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
>
>> > It's not a major change, but when it is patched to use the immediate
>> > form MSR write instruction, it's straightforwardly streamlined=2E
>>=20
>> It should be rather easy to switch the current wrmsr/rdmsr paravirt pat=
ching
>> locations to use the rdmsr/wrmsr instructions instead of doing a call t=
o
>> native_*msr()=2E
>
>Right, just make the Xen functions asm stubs that expect the instruction
>registers instead of C-abi and ALT_NOT_XEN the thing=2E
>
>Shouldn't be hard at all=2E

And that's what we will be doing=2E We already have code for that=2E

