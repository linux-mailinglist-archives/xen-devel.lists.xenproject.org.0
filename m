Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F19FA8A4FB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 19:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954317.1348606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4jlQ-0003DA-Io; Tue, 15 Apr 2025 17:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954317.1348606; Tue, 15 Apr 2025 17:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4jlQ-0003AC-Ew; Tue, 15 Apr 2025 17:08:00 +0000
Received: by outflank-mailman (input) for mailman id 954317;
 Tue, 15 Apr 2025 17:07:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6T3Z=XB=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u4jlO-00039i-It
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 17:07:58 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c57692d-1a1c-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 19:07:56 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53FH73ta2925188
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 15 Apr 2025 10:07:04 -0700
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
X-Inumbo-ID: 2c57692d-1a1c-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53FH73ta2925188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744736825;
	bh=ks0jrFHArrBhG+gklxA2J2EYohMH9zdshNRVwNuGI7o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=WhE95lEVDeqFGhmykheloCvIa6ec/L8hMkhyTQr4nggCQ2MNaB7hQEnWWqckSYu1M
	 FE/9lDKGBEsoxf1Fo/4TYjWfKG76tlO1rnm1kp56okVOdII9+UvHjC6xjsPgkldKF/
	 /Q1USB71Bg7FETpP89gzIM+/TSWjQPfMrln6Vm6Fs3trJnlHEknKcSEVnAn35LwL3B
	 BtdNdByM7Ug96H+fmgHGlD77jXZNMMvnEE6HU+LJ8nK+7UhdSrlyP9wLK8cDaKhR1R
	 9aDa46yO3/W/rBR4d9umQD8jDcaEpM7DfRECTnLjrbzw2a/RBUSJ+b/LP4FJciRNSQ
	 WUVFIq1GFqr6w==
Date: Tue, 15 Apr 2025 10:07:01 -0700
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
In-Reply-To: <c4fcb208-ee5d-4781-85ce-3b75e651d047@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com> <20250331082251.3171276-11-xin@zytor.com> <Z_hTI8ywa3rTxFaz@google.com> <CALMp9eRJkzA2YXf1Dfxt3ONP+P9aTA=WPraOPJPJ6C6j677+6Q@mail.gmail.com> <fa16949e-7842-45f7-9715-1bdda13b762a@zytor.com> <EAB44BB2-99BB-4D4A-8306-0235D2931E72@zytor.com> <0cad1e0b-2bfd-4258-90cd-8d319bf0e74a@zytor.com> <D212FABE-38FE-45D3-A082-CA819CCFFF95@zytor.com> <c4fcb208-ee5d-4781-85ce-3b75e651d047@zytor.com>
Message-ID: <B2461564-F050-463D-8679-122724559D07@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 15, 2025 10:06:01 AM PDT, Xin Li <xin@zytor=2Ecom> wrote:
>On 4/14/2025 11:56 PM, H=2E Peter Anvin wrote:
>>> arlier in the pipeline, right?
>> Yes, but then it would be redundant with the virtualization support=2E
>>=20
>
>So better to drop this patch then=2E

Yeah, if it gets pulled in as a consequence of a global change that is OK =
but the local change makes no sense=2E

