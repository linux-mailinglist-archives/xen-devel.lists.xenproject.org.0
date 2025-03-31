Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C5A76F61
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 22:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932931.1334979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzLpI-0002lk-DN; Mon, 31 Mar 2025 20:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932931.1334979; Mon, 31 Mar 2025 20:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzLpI-0002jS-AP; Mon, 31 Mar 2025 20:33:44 +0000
Received: by outflank-mailman (input) for mailman id 932931;
 Mon, 31 Mar 2025 20:33:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9bB=WS=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1tzLpH-0002jM-7F
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 20:33:43 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e1d9dd6-0e6f-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 22:33:41 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52VKX0M73412381
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 31 Mar 2025 13:33:01 -0700
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
X-Inumbo-ID: 6e1d9dd6-0e6f-11f0-9ea7-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52VKX0M73412381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743453183;
	bh=x7/smMOdPkYBe+t7QfoSlZKr+k8BBZp4ioXVR2T0his=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Z4KFFf201sZydaNbvnLKcIFsMDrRsRhjp8bCSzYq7irlJscPCzdUI+8Dh4pqCCfV4
	 ma0aiKDH5Cg73nGZwNOvjvhtZagcXOcQ9p2pYNsCc45pMH4VWAZVeIr/shFTXOyoJT
	 59zF4BynSpJMyvMuqGTq9ieFHT39HOkA0HdIKxpHd/yvEWkvuEK7rGz99DeXh2OChY
	 Zn0hvSP59z7ec+xOZ7nTecOJAXBz/IE20VtgatRaj322fOCOFRQHF4aywsa6ze8XYD
	 fG5J1+Jt7zMsFRAlcpYJxihjmqzIyqp5Hnp/IhNJbmgWmvn330XKZNgzjeZAZMX0yB
	 LqLmBrw0GOEjQ==
Date: Mon, 31 Mar 2025 13:32:58 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>, "Xin Li (Intel)" <xin@zytor.com>
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
        alexey.amakhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
        seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
        kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v1_01/15=5D_x86/msr=3A_Re?=
 =?US-ASCII?Q?place_=5F=5Fwrmsr=28=29_with_native=5Fwrmsrl=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Z-pruogreCuU66wm@gmail.com>
References: <20250331082251.3171276-1-xin@zytor.com> <20250331082251.3171276-2-xin@zytor.com> <Z-pruogreCuU66wm@gmail.com>
Message-ID: <9D15DE81-2E68-4FCD-A133-4963602E18C9@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 31, 2025 3:17:30 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* Xin Li (Intel) <xin@zytor=2Ecom> wrote:
>
>> -	__wrmsr      (MSR_AMD_DBG_EXTN_CFG, val | 3ULL << 3, val >> 32);
>> +	native_wrmsrl(MSR_AMD_DBG_EXTN_CFG, val | 3ULL << 3);
>
>This is an improvement=2E
>
>> -	__wrmsr      (MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
>> +	native_wrmsrl(MSR_IA32_PQR_ASSOC, (u64)plr->closid << 32 | rmid_p);
>
>> -	__wrmsr      (MSR_IA32_PQR_ASSOC, rmid_p, closid_p);
>> +	native_wrmsrl(MSR_IA32_PQR_ASSOC, (u64)closid_p << 32 | rmid_p);
>
>This is not an improvement=2E
>
>Please provide a native_wrmsrl() API variant where natural [rmid_p, closi=
d_p]
>high/lo parameters can be used, without the shift-uglification=2E=2E=2E
>
>Thanks,
>
>	Ingo

Directing this question primarily to Ingo, who is more than anyone else th=
e namespace consistency guardian:

On the subject of msr function naming =2E=2E=2E *msrl() has always been mi=
sleading=2E The -l suffix usually means 32 bits; sometimes it means the C t=
ype "long" (which in the kernel is used instead of size_t/uintptr_t, which =
might end up being "fun" when 128-bit architectures appear some time this c=
entury), but for a fixed 64-but type we normally use -q=2E

Should we rename the *msrl() functions to *msrq() as part of this overhaul=
?

