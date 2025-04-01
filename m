Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731BAA773CD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 07:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933416.1335369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzTxT-0000ob-95; Tue, 01 Apr 2025 05:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933416.1335369; Tue, 01 Apr 2025 05:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzTxT-0000md-5o; Tue, 01 Apr 2025 05:14:43 +0000
Received: by outflank-mailman (input) for mailman id 933416;
 Tue, 01 Apr 2025 05:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UCkk=WT=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1tzTxR-0000mX-HS
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 05:14:42 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33457037-0eb8-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 07:14:35 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5315DrPW3571921
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 31 Mar 2025 22:13:53 -0700
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
X-Inumbo-ID: 33457037-0eb8-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5315DrPW3571921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743484436;
	bh=fXArKFGaxt8nFnaWBdSW+pU45Be8cuJJXPIK/BFyt00=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=kDAtkLct4ESsM95J+GAXm6Ip9nS2vCeNnpZd5bqqzetTLzyI1dGpO4FHTdCywuUb7
	 WGNeXx4i+jLpuQrfsgKmAO//REzlRpcJIhlg3BiQafg1GzI6ikQM3j7rveeHHx8qEQ
	 CWx/fzNgtVCbn/YdOsKRTX3+ivqNDh7QpvYGnD8XTDDfehr8TQnDZRQ5T6cB2w2NXq
	 sNL/9PBtrg1oFPYF0fJT9aZRbEjTs4UCCHnnJFtzzQgDFxprnhDKMIRSwjt3dTD6q1
	 Lo7DVLOnslrIY9K+rdbbOdFCWR3dM3o3/+miqBEdIWuSpByt20GZTiNiujHjtNVCBm
	 M4aSJPmJLqUXA==
Date: Mon, 31 Mar 2025 22:13:51 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-edac@vger.kernel.org,
        kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-ide@vger.kernel.org, linux-pm@vger.kernel.org,
        bpf@vger.kernel.org, llvm@lists.linux.dev
CC: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, jgross@suse.com,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
        jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
        kan.liang@linux.intel.com, wei.liu@kernel.org, ajay.kaher@broadcom.com,
        alexey.amakhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
        seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
        kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v1_01/15=5D_x86/msr=3A_Re?=
 =?US-ASCII?Q?place_=5F=5Fwrmsr=28=29_with_native=5Fwrmsrl=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <0da43a86-81b0-4388-b47b-3a76b15f2a4c@citrix.com>
References: <20250331082251.3171276-1-xin@zytor.com> <20250331082251.3171276-2-xin@zytor.com> <0da43a86-81b0-4388-b47b-3a76b15f2a4c@citrix.com>
Message-ID: <03874E9B-FAEB-4ACA-B13D-0BED7D54F443@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 31, 2025 2:45:43 PM PDT, Andrew Cooper <andrew=2Ecooper3@citrix=2E=
com> wrote:
>On 31/03/2025 9:22 am, Xin Li (Intel) wrote:
>> __wrmsr() is the lowest level primitive MSR write API, and its direct
>> use is NOT preferred=2E  Use its wrapper function native_wrmsrl() inste=
ad=2E
>>
>> No functional change intended=2E
>>
>> Signed-off-by: Xin Li (Intel) <xin@zytor=2Ecom>
>
>The critical piece of information you're missing from the commit message
>is that the MSR_IMM instructions take a single u64=2E
>
>Therefore to use them, you've got to arrange for all callers to provide
>a single u64, rather than a split u32 pair=2E
>
>~Andrew

That being said, there is nothing wrong with having a two-word convenience=
 wrapper=2E

