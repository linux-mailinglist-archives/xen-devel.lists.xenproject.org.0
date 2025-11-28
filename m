Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A460C9220C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 14:28:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174832.1499774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOyVp-0001uc-Ry; Fri, 28 Nov 2025 13:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174832.1499774; Fri, 28 Nov 2025 13:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOyVp-0001rV-OS; Fri, 28 Nov 2025 13:27:49 +0000
Received: by outflank-mailman (input) for mailman id 1174832;
 Fri, 28 Nov 2025 13:27:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sso2=6E=bounce.vates.tech=bounce-md_30504962.6929a350.v1-38aa5d452551445e92bae929b494660c@srs-se1.protection.inumbo.net>)
 id 1vOyVo-0001rP-I7
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 13:27:48 +0000
Received: from mail132-20.atl131.mandrillapp.com
 (mail132-20.atl131.mandrillapp.com [198.2.132.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 063f7508-cc5e-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 14:27:46 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-20.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dHvHN4HjTzFCWZNS
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 13:27:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 38aa5d452551445e92bae929b494660c; Fri, 28 Nov 2025 13:27:44 +0000
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
X-Inumbo-ID: 063f7508-cc5e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764336464; x=1764606464;
	bh=bSU7yfFnAdDXZn1HJHtHgLtnFy4V2A1/5jF5UEOrF7A=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KH5fREFEsS61qhP31OTV+3rz5ARV46UWRmt7JyheubZirVShfk2ZOED4o7SwjSoF2
	 wMqI1zOqfteccz/18q3F/G04Fd+ODtcQ/jlLMQWrbeiTJr8nJLOSwrcvuB5fIfaDof
	 YsJVD2dzRyMF2gwS5fXgbr4djXHX/diRCetd+D4UyOnZFNh5xQD2v+V6U5kiEMXQ+Q
	 Ib4Qt2vQRwDRVljceeV4bfBWycFLixjK1OTICjxgy3/li7Y5zgyhfICokQ0RMHRVOQ
	 WNREbDiKVV4JLCKPAZLEq8QcUyDjwmnr3yI8PQIYC1bYhKgcwmjTeBcSEoeojj9eE8
	 pQxpS06riiwtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764336464; x=1764596964; i=julian.vetter@vates.tech;
	bh=bSU7yfFnAdDXZn1HJHtHgLtnFy4V2A1/5jF5UEOrF7A=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tAnnHbp4L9e8gnWRjGozEM53EBiR885QhB78hCxy7WZ2nIZ5cJfk4e1aJ7eB7VQWx
	 FqKhLnCcZDl8gQNWAOQyCrr4FmEvP9jbNdDpE5b7e/EBIVMqQ8x/GAktudP/fBdoAx
	 /fBTtCftmAEJLiScorCwBZVwzin15mAdhjKMgH1O/N7m60sEpWk+KmoPsc9k8+3J3b
	 xJsnUhCPeZsJsqhR2nri4maw03gz66SuB/ZmP63a6vq2aYtJpYLlZnuxh2CB0IxnRn
	 faA7GyUbrD8teq+jG7tlF3+OAOd0ma3VxPNuJKZoHMgGsyFKdoL2LDKujWhiHM9bwZ
	 18CUazwOXvzXg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/efi:=20Remove=20NX=20check=20from=20efi-boot.h?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764336463250
Message-Id: <38ef77ec-e215-48cc-9139-764190a1c6de@vates.tech>
To: "Teddy Astie" <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
References: <20251127143136.1598354-1-julian.vetter@vates.tech> <c0a9a466-e78c-4022-a631-4840e085ae77@vates.tech>
In-Reply-To: <c0a9a466-e78c-4022-a631-4840e085ae77@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.38aa5d452551445e92bae929b494660c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251128:md
Date: Fri, 28 Nov 2025 13:27:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/27/25 16:33, Teddy Astie wrote:
> Le 27/11/2025 =C3=A0 15:33, Julian Vetter a =C3=A9crit=C2=A0:
>> Currently Intel CPUs in EFI mode with the "Execute Disable Bit" disabled
>> and the 'CONFIG_REQUIRE_NX=3Dy' fail to boot, because this check is
>> performed before trampoline_setup is called, which determines if NX is
>> supported or if it's hidden by 'MSR_IA32_MISC_ENABLE[34] =3D 1' (if so,
>> re-enables NX).
>>
>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
>> ---
>>    xen/arch/x86/efi/efi-boot.h | 12 ------------
>>    1 file changed, 12 deletions(-)
>>
>> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
>> index 0194720003..8dfd549f12 100644
>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -748,18 +748,6 @@ static void __init efi_arch_cpu(void)
>>        if ( (eax >> 16) =3D=3D 0x8000 && eax > 0x80000000U )
>>        {
>>            caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
>> -
>> -        /*
>> -         * This check purposefully doesn't use cpu_has_nx because
>> -         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compil=
ed
>> -         * with CONFIG_REQUIRE_NX
>> -         */
>> -        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
>> -             !boot_cpu_has(X86_FEATURE_NX) )
>> -            blexit(L"This build of Xen requires NX support");
>> -
>> -        if ( cpu_has_nx )
>> -            trampoline_efer |=3D EFER_NXE;
> 
> I don't think we want to skip setting EFER_NXE. As it would mean not
> using NX at all (unless I missed something).
> 

Yes, I though the code in trampoline_setup is taken in any case. Because 
at the label .Lgot_nx the EFER_NXE is set. But Andrew said that this is 
not always the case, then you're right this should be kept.

> If cpu_policy doesn't have nx, it is likely going to cause issues e.g in
> VMs which will not see NX and potentially refuse to boot. I don't really
> know in which order things are initialized, but it probably wants to be
> considered.
> 
> Perhaps, we want to do something like detecting the
> MSR_IA32_MISC_ENABLE[34] then adjusting the cpu_policy appropriately
> after patching it ?
> 

yes, I was wondering if we couldn't do the check for 
MSR_IA32_MISC_ENABLE[34] =3D=3D 1 directly in the efi_arch_cpu().

>>        }
>>    }
>>    
> 
> 
> 
> --
> Teddy Astie | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



