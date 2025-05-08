Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4115AAF798
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 12:15:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979189.1365876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCyGo-0006XZ-Rw; Thu, 08 May 2025 10:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979189.1365876; Thu, 08 May 2025 10:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCyGo-0006WE-Nx; Thu, 08 May 2025 10:14:26 +0000
Received: by outflank-mailman (input) for mailman id 979189;
 Thu, 08 May 2025 10:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bnxv=XY=tum.de=manuel.andreas@srs-se1.protection.inumbo.net>)
 id 1uCyGn-0006W8-GB
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 10:14:25 +0000
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de [129.187.255.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36406a01-2bf5-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 12:14:22 +0200 (CEST)
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
 by postout2.mail.lrz.de (Postfix) with ESMTP id 4ZtSfQ1ZQtzyWc;
 Thu,  8 May 2025 12:14:22 +0200 (CEST)
Received: from postout2.mail.lrz.de ([127.0.0.1])
 by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id r0FHAHq9VYBJ; Thu,  8 May 2025 12:14:21 +0200 (CEST)
Received: from [IPV6:2a02:2455:1858:e00::d608] (unknown
 [IPv6:2a02:2455:1858:e00::d608])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4ZtSfP25y4zyWl;
 Thu,  8 May 2025 12:14:21 +0200 (CEST)
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
X-Inumbo-ID: 36406a01-2bf5-11f0-9ffb-bf95429c2676
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tum.de; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=tu-postout21; t=1746699261; bh=liP4PbPOtNNkjDuk3bWk3eoiLOyQ5H
	ogb0b7Qou/5bI=; b=mfXt9nhVV+W3iICsmoraTX3+aEnueroK0NDVmPkW9hKxSJ
	ouSz6GTVIgj95WLOjhz/opiJbZy7YmpIQEF2DDNcHGl0/GX+o9KHfHqaEF6bG1vQ
	wJsvCbBdKf+0kmzFNC5tzhnyJ4Qkrxz4D93nwGw2oKx6vDwfsZgX7tJowborffJ/
	wbzypR1pzk4w1FzwBkFimhuldckn3TBYDJOHe8bp4df3tLEfcjMiLR+/l5UmYaOo
	+eUGX1wqu29haAjQ5uuEM612pd8ZROPk4ijEWcITV/XndsXORirwY2lh/4LxNnX6
	RJevg6g8SrtyxSjZvY8XeOxiJuYPx54Zt0h9xL8Q==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.871
X-Spam-Level:
X-Spam-Status: No, score=-2.871 tagged_above=-999 required=5
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
 DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001, LRZ_DMARC_FAIL=0.001,
 LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
 LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
 LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
 LRZ_FROM_ENVFROM_ALIGNED_STRICT=0.001, LRZ_FROM_HAS_A=0.001,
 LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
 LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
 LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
 LRZ_FROM_TUM_S=0.001, LRZ_HAS_CLANG=0.001, LRZ_HAS_CT=0.001,
 LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_MIME_VERSION=0.001, LRZ_HAS_SPF=0.001,
 LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_SUBJ_FW_RE=0.001,
 LRZ_UA_MOZ=0.001] autolearn=no autolearn_force=no
Message-ID: <59883357-a9e2-408e-a53f-f8f1ed23bbbc@tum.de>
Date: Thu, 8 May 2025 12:14:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UBSan bug in real mode fpu emulation
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Fabian Specht <f.specht@tum.de>, xen-devel@lists.xenproject.org
References: <l2jnq5cxgkzcdkndp3mjf76nd7wdp2pbstkqo7llaarmbfqdge@bxdydela4rcf>
 <7e3b941d-ec4e-4158-8844-a3cf236c8d4d@citrix.com>
 <lfakyg5jqdnbm6kleldta52xm6pzdy2fikr6ydxw5rs4wplefv@ymabtpq6fdvq>
 <659665fc-e938-4c2d-9707-b44f637bb6fb@citrix.com>
 <e5b9ecbd-f96f-4dfc-b6f6-c2f9d5bf17d2@suse.com>
Content-Language: en-US
From: Manuel Andreas <manuel.andreas@tum.de>
Autocrypt: addr=manuel.andreas@tum.de; keydata=
 xjMEY9Zx/RYJKwYBBAHaRw8BAQdALWzRzW9a74DX4l6i8VzXGvv72Vz0qfvj9s7bjBD905nN
 Jk1hbnVlbCBBbmRyZWFzIDxtYW51ZWwuYW5kcmVhc0B0dW0uZGU+wokEExYIADEWIQQuSfNX
 11QV6exAUmOqZGwY4LuingUCY9Zx/QIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEKpkbBjgu6Ke
 McQBAPyP530S365I50I5rM2XjH5Hr9YcUQATD5dusZJMDgejAP9T/wUurwQSuRfm1rK8cNcf
 w4wP3+PLvL+J+kuVku93CM44BGPWcf0SCisGAQQBl1UBBQEBB0AmCAf31tLBD5tvtdZ0XX1B
 yGLUAxhgmFskGyPhY8wOKQMBCAfCeAQYFggAIBYhBC5J81fXVBXp7EBSY6pkbBjgu6KeBQJj
 1nH9AhsMAAoJEKpkbBjgu6Kej6YA/RvJdXMjsD5csifolLw53KX0/ElM22SvaGym1+KiiVND
 AQDy+y+bCXI+J713/AwLBsDxTEXmP7Cp49ZqbAu83NnpBQ==
In-Reply-To: <e5b9ecbd-f96f-4dfc-b6f6-c2f9d5bf17d2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/25/25 11:11, Jan Beulich wrote:
> On 24.04.2025 16:04, Andrew Cooper wrote:
>> I have a sneaking suspicion that this is sufficient:
>>
>> diff --git a/xen/arch/x86/x86_emulate/private.h
>> b/xen/arch/x86/x86_emulate/private.h
>> index 30be59547032..9f3d6f0e5357 100644
>> --- a/xen/arch/x86/x86_emulate/private.h
>> +++ b/xen/arch/x86/x86_emulate/private.h
>> @@ -385,9 +385,9 @@ struct x87_env16 {
>>       union {
>>           struct {
>>               uint16_t fip_lo;
>> -            uint16_t fop:11, :1, fip_hi:4;
>> +            uint32_t fop:11, :1, fip_hi:4;
>>               uint16_t fdp_lo;
>> -            uint16_t :12, fdp_hi:4;
>> +            uint32_t :12, fdp_hi:4;
>>           } real;
>>           struct {
>>               uint16_t fip;
>>
>>
>> The problem is that a uint16_t bitfield promotes into int.  A base type
>> of uint32_t should cause the bitfield to promote into unsigned int directly.
> I fear that's not gcc's way of thinking. In fact, the other involved structure
> already uses bitfields with uint32_t base type, and the issue was reported
> there nevertheless. Having known only compilers which respect declared type of
> bitfields, I was rather surprised by gcc not doing so when I first started
> using it on not exactly trivial code. Just to learn that they are free to do
> so. Looks like I never dared to submit a patch I've been carrying to optionally
> alter that behavior.

So I took some time to play around with this and you're definitely right 
about GCC not respecting the declared type. Even in the struct 
`x87_env32`, where the types are already declared as `uint32_t`, GCC 
will just pick `short unsigned int` as the type for a 16-bit wide 
bit-field. As such, in the offending left-shift expression the bit-field 
will be promoted to an `int`, thereby causing the observed UB.
I could not find a way to make GCC actually pick a correctly sized 
unsigned type in this context, without also modifying the width of the 
bit-field. So I'm relatively sure the only way to fix this is to 
properly adjust the usages of these bit-fields (as was suggested 
previously).

For completeness sake I also checked how Clang deals with this issue and 
the UB manifests in the same manner.
What's worse is that I didn't find any proper documentation on this 
behavior for neither GCC or Clang. If you have anything I would be very 
interested to know.

Best,
Manuel


