Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE54A9CCE2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 17:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968275.1357929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Kz4-00072V-6r; Fri, 25 Apr 2025 15:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968275.1357929; Fri, 25 Apr 2025 15:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Kz4-0006zw-4H; Fri, 25 Apr 2025 15:28:58 +0000
Received: by outflank-mailman (input) for mailman id 968275;
 Fri, 25 Apr 2025 15:28:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tq29=XL=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u8Kz2-0006zq-83
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 15:28:56 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe16b2de-21e9-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 17:28:53 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53PFSG7j2879055
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 25 Apr 2025 08:28:18 -0700
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
X-Inumbo-ID: fe16b2de-21e9-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53PFSG7j2879055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745594899;
	bh=VXq1PHnajmb8IhmTG7In4mFZ7EewzJEbGitlsKd4G50=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=e8sSKlOE29QVRsUNwa5Glun405WCr1ZH8x+o/lM1uZO65MH8ZxHfRZ9Vpxe5VnEA+
	 exbTNWCfO9mqnsVBdWqxPuN5ymfnVoRJTE6z+MBGn61/u3Qm2DjxXhiGfR2jMZhqHr
	 TVyHxknF9aW5yNQDR1IeB4wNDPkNeqbiDL9Y9B0Tf3kbrU9Cizj1ktB/G9v+xJzUqp
	 CHyGasv5e/2REjIUjeW5ato0YPXhMP5OYJMXpoIgD7CMZRrKMKSc6nMzj9uhQk4uBg
	 IJzYx36Il8whoA9nZiKMg7YdPVo4z5Ujq2ijkY4iAHziVAchpEmHBwdMKS7/pwXclD
	 IBJVqUYnPG0ng==
Date: Fri, 25 Apr 2025 08:28:14 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Xin Li <xin@zytor.com>,
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
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v2_21/34=5D_x86/msr=3A_Utiliz?=
 =?US-ASCII?Q?e_the_alternatives_mechanism_to_write_MSR?=
User-Agent: K-9 Mail for Android
In-Reply-To: <6ef898f7-c8a3-4326-96ab-42aa90c48e1c@suse.com>
References: <20250422082216.1954310-1-xin@zytor.com> <20250422082216.1954310-22-xin@zytor.com> <b2624e84-6fab-44a3-affc-ce0847cd3da4@suse.com> <f7198308-e8f8-4cc5-b884-24bc5f408a2a@zytor.com> <37c88ea3-dd24-4607-9ee1-0f19025aaef3@suse.com> <bb8f6b85-4e7d-440a-a8c3-0e0da45864b8@zytor.com> <0cdc6e9d-88eb-4ead-8d55-985474257d53@suse.com> <483eb20c-7302-4733-a15f-21d140396919@zytor.com> <72516271-5b28-434a-838b-d8532e1b4fc1@zytor.com> <6ef898f7-c8a3-4326-96ab-42aa90c48e1c@suse.com>
Message-ID: <D7218B8B-B9D6-46F8-9397-C44398E24253@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 25, 2025 12:01:29 AM PDT, "J=C3=BCrgen Gro=C3=9F" <jgross@suse=2Ec=
om> wrote:
>On 25=2E04=2E25 05:44, H=2E Peter Anvin wrote:
>> On 4/24/25 18:15, H=2E Peter Anvin wrote:
>>> On 4/24/25 01:14, J=C3=BCrgen Gro=C3=9F wrote:
>>>>>=20
>>>>> Actually, that is how we get this patch with the existing alternativ=
es
>>>>> infrastructure=2E=C2=A0 And we took a step further to also remove th=
e pv_ops
>>>>> MSR APIs=2E=2E=2E
>>>>=20
>>>> And this is what I'm questioning=2E IMHO this approach is adding more
>>>> code by removing the pv_ops MSR_APIs just because "pv_ops is bad"=2E =
And
>>>> I believe most refusal of pv_ops is based on no longer valid reasonin=
g=2E
>>>>=20
>>>=20
>>> pvops are a headache because it is effectively a secondary alternative=
s infrastructure that is incompatible with the alternatives one=2E=2E=2E
>>>=20
>>>>> It looks to me that you want to add a new facility to the alternativ=
es
>>>>> infrastructure first?
>>>>=20
>>>> Why would we need a new facility in the alternatives infrastructure?
>>>=20
>>> I'm not sure what Xin means with "facility", but a key motivation for =
this is to:
>>>=20
>>> a=2E Avoid using the pvops for MSRs when on the only remaining user th=
ereof (Xen) is only using it for a very small subset of MSRs and for the re=
st it is just overhead, even for Xen;
>>>=20
>>> b=2E Being able to do wrmsrns immediate/wrmsrns/wrmsr and rdmsr immedi=
ate/ rdmsr alternatives=2E
>>>=20
>>> Of these, (b) is by far the biggest motivation=2E The architectural di=
rection for supervisor states is to avoid ad hoc and XSAVES ISA and instead=
 use MSRs=2E The immediate forms are expected to be significantly faster, b=
ecause they make the MSR index available at the very beginning of the pipel=
ine instead of at a relatively late stage=2E
>>>=20
>>=20
>> Note that to support the immediate forms, we *must* do these inline, or=
 the const-ness of the MSR index -- which applies to by far the vast majori=
ty of MSR references -- gets lost=2E pvops does exactly that=2E
>>=20
>> Furthermore, the MSR immediate instructions take a 64-bit number in a s=
ingle register; as these instructions are by necessity relatively long, it =
makes sense for the alternative sequence to accept a 64-bit input register =
and do the %eax/ %edx shuffle in the legacy fallback code=2E=2E=2E we did a=
 bunch of experiments to see what made most sense=2E
>
>Yes, I understand that=2E
>
>And I'm totally in favor of Xin's rework of the MSR low level functions=
=2E
>
>Inlining the MSR access instructions with pv_ops should not be very
>complicated=2E We do that with other instructions (STI/CLI, PTE accesses)
>today, so this is no new kind of functionality=2E
>
>I could have a try writing a patch achieving that, but I would only start
>that work in case you might consider taking it instead of Xin's patch
>removing the pv_ops usage for rdmsr/wrmsr=2E In case it turns out that my
>version results in more code changes than Xin's patch, I'd be fine to dro=
p
>my patch, of course=2E
>
>
>Juergen

The wrapper in question is painfully opaque, but if it is much simpler, th=
en I'm certainly willing to consider it=2E=2E=2E but I don't really see how=
 it would be possible given among other things the need for trap points for=
 the safe MSRs=2E

Keep in mind this needs to work even without PV enabled!

Note that Andrew encouraged us to pursue the pvops removal for MSRs=2E Not=
e that Xen benefits pretty heavily because it can dispatch the proper path =
of the few that are left for the common case of fixed MSRs=2E

