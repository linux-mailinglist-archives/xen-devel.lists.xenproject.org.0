Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BCCA87038
	for <lists+xen-devel@lfdr.de>; Sun, 13 Apr 2025 01:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.948840.1345663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3k0V-0007pj-DM; Sat, 12 Apr 2025 23:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 948840.1345663; Sat, 12 Apr 2025 23:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3k0V-0007nB-8R; Sat, 12 Apr 2025 23:11:27 +0000
Received: by outflank-mailman (input) for mailman id 948840;
 Sat, 12 Apr 2025 23:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r9hs=W6=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u3k0T-0007n4-6A
 for xen-devel@lists.xenproject.org; Sat, 12 Apr 2025 23:11:25 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7267e513-17f3-11f0-9eae-5ba50f476ded;
 Sun, 13 Apr 2025 01:11:22 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53CNA8tE1265382
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sat, 12 Apr 2025 16:10:09 -0700
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
X-Inumbo-ID: 7267e513-17f3-11f0-9eae-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53CNA8tE1265382
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744499412;
	bh=Z8ANyn5BO+4YSxFMj2ZIePI2Es9dy8Hv6toZ4ucWxdY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=lMBig7n3wyGQ77xYpn5pnxKVN4QM3Vkq6hDZcLvPaFwS2PWF/n09rzmm4i6ZIrSlX
	 ldJKqqxh7XGdq6n0fK1xSbkbF0eDIoNvUz2LhiGL+7mwgnCfFlBgBbxU3imjGP8GwY
	 zTU8dvf1jWNkf6+mSxkledPR0XPGAcZA1I9f+5+YiIA5YgCTj3M0isuBNWaO1BHck1
	 A5Uh/ZdjOxEnzIwdlikBQnfr1jA4LYpMjCETWZHP0OeiOO0PyexivLyItY7m/buoB1
	 Qlv5YTi1XbrFcCf8wBQrrImS7wL6ntMIDtBYRTjjMB9jzG1ZKHtxezcpa9pVk9CqYV
	 YnyFnuF53LDCw==
Date: Sat, 12 Apr 2025 16:10:06 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Xin Li <xin@zytor.com>, Jim Mattson <jmattson@google.com>,
        Sean Christopherson <seanjc@google.com>
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
In-Reply-To: <fa16949e-7842-45f7-9715-1bdda13b762a@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com> <20250331082251.3171276-11-xin@zytor.com> <Z_hTI8ywa3rTxFaz@google.com> <CALMp9eRJkzA2YXf1Dfxt3ONP+P9aTA=WPraOPJPJ6C6j677+6Q@mail.gmail.com> <fa16949e-7842-45f7-9715-1bdda13b762a@zytor.com>
Message-ID: <EAB44BB2-99BB-4D4A-8306-0235D2931E72@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 11, 2025 9:32:32 PM PDT, Xin Li <xin@zytor=2Ecom> wrote:
>On 4/11/2025 2:12 PM, Jim Mattson wrote:
>> Surely, any CPU that has WRMSRNS also supports "Virtualize
>> IA32_SPEC_CTRL," right? Shouldn't we be using that feature rather than
>> swapping host and guest values with some form of WRMSR?
>
>Good question, the simple answer is that they are irrelevant=2E

Also, *in this specific case* IA32_SPEC_CTRL is architecturally nonseriali=
zing, i=2Ee=2E WRMSR executes as WRMSRNS anyway=2E

