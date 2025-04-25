Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84B1A9D2BB
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 22:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968548.1358090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8PQG-0002WS-6i; Fri, 25 Apr 2025 20:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968548.1358090; Fri, 25 Apr 2025 20:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8PQG-0002UZ-3C; Fri, 25 Apr 2025 20:13:20 +0000
Received: by outflank-mailman (input) for mailman id 968548;
 Fri, 25 Apr 2025 20:13:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tq29=XL=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u8PQE-0002UQ-1B
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 20:13:18 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b72a13ea-2211-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 22:13:15 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53PKCYWU3252234
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 25 Apr 2025 13:12:35 -0700
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
X-Inumbo-ID: b72a13ea-2211-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53PKCYWU3252234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745611957;
	bh=Pgn/TZ1ujuuwbnzguLrmQLLDyPec5k7g882M+f0Gsi8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=LoudM2O5Ggb8UKAE6BloQQgcPc3DDE93Uie4tiM2kEIfkYTDiUipcf8Neu/KvASRD
	 bE9VD4R7oFqzmvtHTCFXcREprEax191bGlgx7zIbx5omdo51jLm5RkfhQX4yDbIVRa
	 GVL5VijALlpGtEZskIkKxZJvEBt7FnMylbJIzjd/5nwjnzxaNo83Yy1fNK7XF6PF8t
	 DnRu+iOKDqlUdSjj+DZ7GCvEpBZIZH9XdMoGw1VbkegsrdCwgEQlt1Pl2oarHuisPj
	 gl4+pko/7dDkS+MuVeY76Vou/tfvTznub+Ylyb0SFF25MRCp2uGdpU5pdOUWL4jNE7
	 1qvVj2z6FqDTA==
Date: Fri, 25 Apr 2025 13:12:33 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
        Peter Zijlstra <peterz@infradead.org>
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
In-Reply-To: <35979102-2eb2-4566-b32a-f2b02ded8ae6@suse.com>
References: <20250422082216.1954310-1-xin@zytor.com> <20250422082216.1954310-22-xin@zytor.com> <b2624e84-6fab-44a3-affc-ce0847cd3da4@suse.com> <f7198308-e8f8-4cc5-b884-24bc5f408a2a@zytor.com> <37c88ea3-dd24-4607-9ee1-0f19025aaef3@suse.com> <20250425123317.GB22125@noisy.programming.kicks-ass.net> <35979102-2eb2-4566-b32a-f2b02ded8ae6@suse.com>
Message-ID: <D4ADDBA5-D9B8-4DD5-8D83-8CD482700E71@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 25, 2025 5:51:27 AM PDT, "J=C3=BCrgen Gro=C3=9F" <jgross@suse=2Eco=
m> wrote:
>On 25=2E04=2E25 14:33, Peter Zijlstra wrote:
>> On Wed, Apr 23, 2025 at 06:05:19PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
>>=20
>>>> It's not a major change, but when it is patched to use the immediate
>>>> form MSR write instruction, it's straightforwardly streamlined=2E
>>>=20
>>> It should be rather easy to switch the current wrmsr/rdmsr paravirt pa=
tching
>>> locations to use the rdmsr/wrmsr instructions instead of doing a call =
to
>>> native_*msr()=2E
>>=20
>> Right, just make the Xen functions asm stubs that expect the instructio=
n
>> registers instead of C-abi and ALT_NOT_XEN the thing=2E
>>=20
>> Shouldn't be hard at all=2E
>
>Correct=2E And for the new immediate form we can use ALTERNATIVE_3()=2E
>
>
>Juergen

Yes; in the ultimate case there are *four* alternatives, but the concept i=
s the same and again we have it implemented already=2E

