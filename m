Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB27A9B9A2
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 23:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966901.1356951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u83uY-00019S-3Y; Thu, 24 Apr 2025 21:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966901.1356951; Thu, 24 Apr 2025 21:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u83uY-00017T-0x; Thu, 24 Apr 2025 21:15:10 +0000
Received: by outflank-mailman (input) for mailman id 966901;
 Thu, 24 Apr 2025 21:15:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vyxV=XK=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u83uV-00017N-VV
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 21:15:08 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30571546-2151-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 23:15:05 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53OLEFGV1614013
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 24 Apr 2025 14:14:15 -0700
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
X-Inumbo-ID: 30571546-2151-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53OLEFGV1614013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745529257;
	bh=fbePqpXsVBFA3b05CfQZoudDssWCQj14Vtwe8+dAbac=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=b2EYzYodyQjJ1ivIsEmkKH2t2+MFFTbYKTMXxiq4ngho+EPg7RDeSa2QY0zU3k7I6
	 RN61uEVxuOFyhUwF3mAy8cHv6Z4FYf2CxBcMEmWvdr2DQUvRfPzZM/iNJ2SaZGkcbi
	 UDaP7PXrKVnNJgW3SRLPxFD1BMbGSjssSS7c0i84j+8Jm8fWDnoENz8P5a1Jd5X9AE
	 YeKJLfs/prqdFpmvrMCTt4Lf9g4iZhNiXh9GJorxSh8b9JQoVphIe+5AyBQlhioJ6S
	 KAYln5qQrQumWrckqE9SV5vLlM+oXOd+2n91sqkeXt69I3byDARDpBKA8HfhZxu6f+
	 76vUr76BOVI7A==
Date: Thu, 24 Apr 2025 14:14:12 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Xin Li <xin@zytor.com>, =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-pm@vger.kernel.org,
        linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
        netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org
CC: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, acme@kernel.org,
        andrew.cooper3@citrix.com, peterz@infradead.org, namhyung@kernel.org,
        mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
        jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
        kan.liang@linux.intel.com, wei.liu@kernel.org, ajay.kaher@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
        pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
        luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
        haiyangz@microsoft.com, decui@microsoft.com
Subject: Re: [RFC PATCH v2 12/34] x86/msr: Remove pmu_msr_{read,write}()
User-Agent: K-9 Mail for Android
In-Reply-To: <ca088501-2fbe-4a32-b191-04f7be6a2713@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com> <20250422082216.1954310-13-xin@zytor.com> <8944b510-6d70-472c-99a2-52a60517733d@suse.com> <ca088501-2fbe-4a32-b191-04f7be6a2713@zytor.com>
Message-ID: <018705C7-35CF-406A-85DA-360FF7BCB072@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 24, 2025 10:49:59 AM PDT, Xin Li <xin@zytor=2Ecom> wrote:
>On 4/24/2025 3:05 AM, J=C3=BCrgen Gro=C3=9F wrote:
>>=20
>> May I suggest to get rid of the "emul" parameter of pmu_msr_chk_emulate=
d()?
>> It has no real value, as pmu_msr_chk_emulated() could easily return fal=
se in
>> the cases where it would set *emul to false=2E
>
>Good idea!
>
>The function type is a bit of weird but I didn't think of change it=2E

It is weird in the extreme=2E=20

By the way, this patch should have "xen" in its subject tag=2E

