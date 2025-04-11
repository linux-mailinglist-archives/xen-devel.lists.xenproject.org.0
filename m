Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06685A867A2
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947969.1345522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3LM4-00031g-P3; Fri, 11 Apr 2025 20:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947969.1345522; Fri, 11 Apr 2025 20:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3LM4-0002zM-Lq; Fri, 11 Apr 2025 20:52:04 +0000
Received: by outflank-mailman (input) for mailman id 947969;
 Fri, 11 Apr 2025 20:52:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GsCk=W5=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u3LM3-0002uJ-58
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:52:03 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc66ac36-1716-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 22:52:00 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53BKokUU689207
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 11 Apr 2025 13:50:46 -0700
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
X-Inumbo-ID: cc66ac36-1716-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53BKokUU689207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744404648;
	bh=RSxA6WjXfzTzp9cSLSXzWSj0aQbPDgdMx3rGgv5vZFo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=MaUaGM8ptiyNi5JNPWt6NXDw8PAuW9ldRndGnP2Ms2a5WhDxGDZmG9wZSREChComZ
	 5WZ/ACqI8QPIApW2H+3S60a8ZuhEXXT3/4CoGujji3jvmFlwVOFHC9tj+gJU0zYj76
	 fLPUlJt1NAlnsIICrT1IBvg8ssoIvqY4BrCd0zWR2qJWd/gvqDxfJWqsioW+lcez2s
	 0OjBs72/2ECaksg5m8Zdd+dsabWYMF97MvLqFSlWKKuRnrqMJtIZxV9Y2X0uNN/Twt
	 qct8mM81m1xNoj3uyJYNXFGbNRMRc88O5YTcpLTHLdVRgYOnAL34JelLSSB8abrZsj
	 FVc2EtkpGepIg==
Date: Fri, 11 Apr 2025 13:50:45 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Xin Li <xin@zytor.com>, Sean Christopherson <seanjc@google.com>
CC: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        linux-edac@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org,
        linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, jgross@suse.com,
        andrew.cooper3@citrix.com, peterz@infradead.org, acme@kernel.org,
        namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
        pbonzini@redhat.com, vkuznets@redhat.com, luto@kernel.org,
        boris.ostrovsky@oracle.com, kys@microsoft.com, haiyangz@microsoft.com,
        decui@microsoft.com
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v1_10/15=5D_KVM=3A_VMX=3A_Use_WR?=
 =?US-ASCII?Q?MSRNS_or_its_immediate_form_when_available?=
User-Agent: K-9 Mail for Android
In-Reply-To: <41eb2d08-1b2d-4ca8-bcb7-f5f4611f91a9@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com> <20250331082251.3171276-11-xin@zytor.com> <Z_hTI8ywa3rTxFaz@google.com> <41eb2d08-1b2d-4ca8-bcb7-f5f4611f91a9@zytor.com>
Message-ID: <39ECA4CA-9CBC-4F72-B52E-9BD06DBF9B6D@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 11, 2025 9:18:08 AM PDT, Xin Li <xin@zytor=2Ecom> wrote:
>On 4/10/2025 4:24 PM, Sean Christopherson wrote:
>>> +/*
>>> + * Write EAX to MSR_IA32_SPEC_CTRL=2E
>>> + *
>>> + * Choose the best WRMSR instruction based on availability=2E
>>> + *
>>> + * Replace with 'wrmsrns' and 'wrmsrns %rax, $MSR_IA32_SPEC_CTRL' onc=
e binutils support them=2E
>>> + */
>>> +=2Emacro WRITE_EAX_TO_MSR_IA32_SPEC_CTRL
>>> +	ALTERNATIVE_2 __stringify(mov $MSR_IA32_SPEC_CTRL, %ecx;		\
>>> +				  xor %edx, %edx;				\
>>> +				  mov %edi, %eax;				\
>>> +				  ds wrmsr),					\
>>> +		      __stringify(mov $MSR_IA32_SPEC_CTRL, %ecx;		\
>>> +				  xor %edx, %edx;				\
>>> +				  mov %edi, %eax;				\
>>> +				  ASM_WRMSRNS),					\
>>> +		      X86_FEATURE_WRMSRNS,					\
>>> +		      __stringify(xor %_ASM_AX, %_ASM_AX;			\
>>> +				  mov %edi, %eax;				\
>>> +				  ASM_WRMSRNS_RAX; =2Elong MSR_IA32_SPEC_CTRL),	\
>>> +		      X86_FEATURE_MSR_IMM
>>> +=2Eendm
>> This is quite hideous=2E  I have no objection to optimizing __vmx_vcpu_=
run(), but
>> I would much prefer that a macro like this live in generic code, and th=
at it be
>> generic=2E  It should be easy enough to provide an assembly friendly eq=
uivalent to
>> __native_wrmsr_constant()=2E
>
>Will do=2E

This should be coming anyway, right?

