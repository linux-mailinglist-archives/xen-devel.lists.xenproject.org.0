Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8E1A79288
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 17:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935980.1337325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u00TG-0003bn-Hf; Wed, 02 Apr 2025 15:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935980.1337325; Wed, 02 Apr 2025 15:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u00TG-0003Zk-Eu; Wed, 02 Apr 2025 15:57:42 +0000
Received: by outflank-mailman (input) for mailman id 935980;
 Wed, 02 Apr 2025 15:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UCKB=WU=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u00TD-0003Ze-VL
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 15:57:40 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31b612d0-0fdb-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 17:57:36 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 532FutGe095148
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 2 Apr 2025 08:56:56 -0700
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
X-Inumbo-ID: 31b612d0-0fdb-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 532FutGe095148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743609418;
	bh=Xa25b++XKImzKTw5z/38OkUO4BtW0ZFRs8vcKJg4Ci0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=PKY9pYPRwrzTz3T2wfMHzO5CxQTclyrXpopuE633CLIfZy/ukPrGJisoGqNXqtKGR
	 Kwz413hdEtK5pBXselQWUxDFcZNypXyGZdI8G30/DwRJXDsP4zWDSJB/AE9/Rxd+2y
	 UpqxkHxOPXPWmGYI+FJgvcCaL46+fNbgfHJ0c/b1wjVyQCE2qT0M/ZA7JLtTSrk+kH
	 ZmVpsuIPE4MYWvvrXrlGIXqvQJY0mfJeR5VLbutwJ29pIU+n402Afr0HUdg174buI6
	 LnlSkpy+WJQiHzFkU9vzRc2V7DoFNa6OrQ/gdWEEYK97M+97vAsoAKJUgXaK8+OFNg
	 pTT1Aq8YFeE0Q==
Date: Wed, 02 Apr 2025 08:56:55 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Dave Hansen <dave.hansen@intel.com>, Xin Li <xin@zytor.com>,
        Ingo Molnar <mingo@kernel.org>
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
In-Reply-To: <e5770add-9d18-40e1-929d-df7c40f3c7d1@intel.com>
References: <20250331082251.3171276-1-xin@zytor.com> <20250331082251.3171276-2-xin@zytor.com> <Z-pruogreCuU66wm@gmail.com> <9D15DE81-2E68-4FCD-A133-4963602E18C9@zytor.com> <a0254e73-bf7c-4876-b64e-b08e96044666@zytor.com> <e5770add-9d18-40e1-929d-df7c40f3c7d1@intel.com>
Message-ID: <ADCFB190-A89A-460D-81A6-80E20AEFBFBC@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 2, 2025 8:41:07 AM PDT, Dave Hansen <dave=2Ehansen@intel=2Ecom> wr=
ote:
>On 3/31/25 22:53, Xin Li wrote:
>> Per "struct msr" defined in arch/x86/include/asm/shared/msr=2Eh:
>>=20
>> struct msr {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 l=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 h=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 };
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 u64 q;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> };
>>=20
>> Probably *msrq() is what we want?
>
>What would folks think about "wrmsr64()"? It's writing a 64-bit value to
>an MSR and there are a lot of functions in the kernel that are named
>with the argument width in bits=2E

Personally, I hate the extra verbosity, mostly visual, since numerals are =
nearly as prominent as capital letters they tend to attract the eye=2E Ther=
e is a reason why they aren't used this way in assembly languages=2E

