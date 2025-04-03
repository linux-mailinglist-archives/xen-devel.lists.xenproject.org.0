Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD92A79BAF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 08:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936222.1337503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0DeZ-0000G9-Dx; Thu, 03 Apr 2025 06:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936222.1337503; Thu, 03 Apr 2025 06:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0DeZ-0000FJ-9Q; Thu, 03 Apr 2025 06:02:15 +0000
Received: by outflank-mailman (input) for mailman id 936222;
 Thu, 03 Apr 2025 06:02:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dXPq=WV=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u0DeY-0000FC-28
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 06:02:14 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e5faa72-1051-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 08:02:11 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53361TVl369646
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 2 Apr 2025 23:01:30 -0700
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
X-Inumbo-ID: 2e5faa72-1051-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53361TVl369646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743660093;
	bh=dlct/QjME2ZRc2GbrZa4+YEUwLyiwmon1oWoqtApkXY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=WPP0bDZK1lApqNXdOtF12S5ARISaib9mLKSdGhnx3gf+KvTavErQMB5tHsDboEZaM
	 dLsgA/Wr4k2VPAKvg4Q/jtE0gFB4ojRvE+oKmyqXmPeIVyoZtruCTjMkDVanwskwS+
	 jiuGUYw2dmNjKOKZNCiNGXO9zxp8lWX1y5seDxftNeQHvt8RBeGECAiOxqTKUMgh1b
	 zD9Kyl+NSFQ59y87oScNqVpMXyezROjMwevUzZS+FRy/CxOc3SftPfgsBUCB4x+623
	 2LcVsu0VnYA1sp4yMqo6TRQHgTa6YRFjMp5wTke1MjTH1hw4LpEw+MZO87TrcY7Ja6
	 ziwf36ftnA50g==
Date: Wed, 02 Apr 2025 23:01:27 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Xin Li <xin@zytor.com>, Ingo Molnar <mingo@kernel.org>
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
        pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
        luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
        haiyangz@microsoft.com, decui@microsoft.com,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v1_01/15=5D_x86/msr=3A_Re?=
 =?US-ASCII?Q?place_=5F=5Fwrmsr=28=29_with_native=5Fwrmsrl=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <c316a6c6-b97c-48b2-9598-d44e2ec72fbc@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com> <20250331082251.3171276-2-xin@zytor.com> <Z-pruogreCuU66wm@gmail.com> <9D15DE81-2E68-4FCD-A133-4963602E18C9@zytor.com> <Z-ubVFyoOzwKhI53@gmail.com> <c316a6c6-b97c-48b2-9598-d44e2ec72fbc@zytor.com>
Message-ID: <580DD4EE-8694-4525-AA73-A6823126FF9F@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 2, 2025 10:09:21 PM PDT, Xin Li <xin@zytor=2Ecom> wrote:
>On 4/1/2025 12:52 AM, Ingo Molnar wrote:
>>> Should we rename the *msrl() functions to *msrq() as part of this
>>> overhaul?
>> Yeah, that's a good idea, and because talk is cheap I just implemented
>> this in the tip:WIP=2Ex86/msr branch with a couple of other cleanups in
>> this area (see the shortlog & diffstat below), but the churn is high:
>>=20
>>    144 files changed, 1034 insertions(+), 1034 deletions(-)
>
>Hi Ingo,
>
>I noticed that you keep the type of MSR index in these patches as
>"unsigned int"=2E
>
>I'm thinking would it be better to standardize it as "u32"?
>
>Because:
>1) MSR index is placed in ECX to execute MSR instructions, and the
>   high-order 32 bits of RCX are ignored on 64-bit=2E
>2) MSR index is encoded as a 32-bit immediate in the new immediate form
>   MSR instructions=2E
>
>Thanks!
>    Xin

"unsigned int" and "u32" are synonymous, but the latter is more explicit a=
nd would be better=2E

