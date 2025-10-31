Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEA0C2596B
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 15:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154389.1484413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEqCK-0003Mn-Pv; Fri, 31 Oct 2025 14:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154389.1484413; Fri, 31 Oct 2025 14:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEqCK-0003Kf-N7; Fri, 31 Oct 2025 14:33:48 +0000
Received: by outflank-mailman (input) for mailman id 1154389;
 Fri, 31 Oct 2025 14:33:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GHls=5I=bounce.vates.tech=bounce-md_30504962.6904c8c7.v1-8e591e3225c746edae8ed2c7ce401c52@srs-se1.protection.inumbo.net>)
 id 1vEqCI-0003KU-I3
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 14:33:46 +0000
Received: from mail132-29.atl131.mandrillapp.com
 (mail132-29.atl131.mandrillapp.com [198.2.132.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a8ffd7a-b666-11f0-9d16-b5c5bf9af7f9;
 Fri, 31 Oct 2025 15:33:45 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-29.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cyk4R3ptDz7lmDgy
 for <xen-devel@lists.xenproject.org>; Fri, 31 Oct 2025 14:33:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8e591e3225c746edae8ed2c7ce401c52; Fri, 31 Oct 2025 14:33:43 +0000
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
X-Inumbo-ID: 9a8ffd7a-b666-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761921223; x=1762191223;
	bh=i+Fz/OACOa36k8s2j2wyPDfYrXB/LyOUQuAnRstanW8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1DpV8P+QEMGN+rsKzlmkUkrLh+RTQv3ngWkuCQuo0ofyMiJ1M8Gni4E/ZPkK7UwYi
	 IgZkYncLYIzbGLbB2ehbQh25vnKeV7ZyyZRuUyquceqjR1OqcMoKQwGvlzgbeRrtco
	 cLDr5y6nNCkmZ8vLMOYBWFiNzpTtzUSKNI52hYVZ45JSGqT8to+DiomcPzLH8XC0Mt
	 cDrt1OjgD1QcIRbkE6mHVPLjbUnO2YMXkc/V7Mgarpu4LHNOKZsuZ/U/b+SWVNdtjY
	 qx1SDs5QEl1l6gqSxFIcHthKQZqtj34ajQaos7EZo5LIpUIZnEfq3KR9JbzknMlMrE
	 tzGQBtLYf2niw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761921223; x=1762181723; i=teddy.astie@vates.tech;
	bh=i+Fz/OACOa36k8s2j2wyPDfYrXB/LyOUQuAnRstanW8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=UQUNE//AkjK0IYaO74k2UN5DPUMXBUl+AkievQDn5vYyh2RCd0Ua0Kc4U5KFDDqCX
	 BL+4QbUoJZrNZiG05Te1DJoC+3qcpGlhLbcweoaWS6fpNQ+PhZ4BvMG62QAWQXjk+K
	 tQv9qat7KWRFfuYpxZq/JyGR60XGjuUsK75iMowMr6uGuM5fpaFDoC3CW75qP0de+O
	 KrKX/2MfQJAjuTx2/0i7Jmfe8roNCiBlrPUPXTX5kzSBRadUM7KDtruEVHGR+77bRy
	 s/1RmH1AYtFQOKCNJAClIi1Cokd+TdeONGfMmJqlkDIKhMsiEE0+1oFXOTle4O62BC
	 3GpI+cDs5NxXQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20for-4.22]=20x86/hvm:=20Introduce=20force=5Fx2apic=20flag?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761921222070
Message-Id: <5f62bd09-5e3f-4db7-901e-eb8c8a3763f5@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech> <fa9a7720-5a90-41bd-8ebb-5fc5d4065d38@suse.com>
In-Reply-To: <fa9a7720-5a90-41bd-8ebb-5fc5d4065d38@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8e591e3225c746edae8ed2c7ce401c52?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251031:md
Date: Fri, 31 Oct 2025 14:33:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30/10/2025 =C3=A0 08:56, Jan Beulich a =C3=A9crit=C2=A0:
> On 29.10.2025 19:26, Teddy Astie wrote:
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -1116,6 +1116,20 @@ int guest_wrmsr_apic_base(struct vcpu *v, uint64_=
t val)
>>       if ( !has_vlapic(v->domain) )
>>           return X86EMUL_EXCEPTION;
>>   
>> +    if ( has_force_x2apic(v->domain) )
>> +    {
>> +        /*
>> +        * We implement the same semantics as MSR_IA32_XAPIC_DISABLE_STA=
TUS:
>> +        * LEGACY_XAPIC_DISABLED which rejects any attempt at clearing
>> +        * IA32_APIC_BASE.EXTD, thus forcing the LAPIC in x2APIC mode.
>> +        */
> 
> The MSR aspect should be implemented by using the MSR. Beyond that imo ou=
r treatment
> shouldn't be different from that when firmware pre-enables x2APIC: While =
not
> advisable, aiui OSes could still switch back to xAPIC mode. At which poin=
t the guest
> config level control may also want calling "pre-enable", not "force".
> 

One advantage of forcing x2APIC enabled is that it simplifies the 
support for LAPIC IDs over 255.

While that could be a alternative to just pre-enable x2apic (in cases we 
don't want the OS to use xAPIC because it is there), things still gets 
tricky for supporting more vCPUs. We would need to clarify the behavior 
of enabling xAPIC on a vCPU that has LAPIC_ID > 254, Intel and AMD 
specification don't define anything aside for Intel :
> If a BIOS transfers control to OS in xAPIC mode, then the BIOS must ensur=
e that only logical processors with
> CPUID.0BH.EDX value less than 255 are enabled.

And I guess the Intel's MSR_IA32_XAPIC_DISABLE_STATUS exists to prevent 
such specific case to occur once the OS booted.

> Jan
> 
Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



