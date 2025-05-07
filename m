Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0D5AAE6D8
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 18:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978685.1365495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uChl0-00025I-NV; Wed, 07 May 2025 16:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978685.1365495; Wed, 07 May 2025 16:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uChl0-00023C-Kl; Wed, 07 May 2025 16:36:30 +0000
Received: by outflank-mailman (input) for mailman id 978685;
 Wed, 07 May 2025 16:36:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lKOZ=XX=tum.de=manuel.andreas@srs-se1.protection.inumbo.net>)
 id 1uChkw-00022u-Gg
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 16:36:28 +0000
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de
 [2001:4ca0:0:103::81bb:ff8a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 678b87d0-2b61-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 18:36:20 +0200 (CEST)
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
 by postout2.mail.lrz.de (Postfix) with ESMTP id 4Zt19b4rqLzyVT;
 Wed,  7 May 2025 18:36:19 +0200 (CEST)
Received: from postout2.mail.lrz.de ([127.0.0.1])
 by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id CZEc8HSAboKw; Wed,  7 May 2025 18:36:18 +0200 (CEST)
Received: from [IPV6:2a09:80c0:192:0:1a32:faf8:4a92:5176] (unknown
 [IPv6:2a09:80c0:192:0:1a32:faf8:4a92:5176])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4Zt19Z3R7RzyW6;
 Wed,  7 May 2025 18:36:18 +0200 (CEST)
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
X-Inumbo-ID: 678b87d0-2b61-11f0-9ffb-bf95429c2676
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tum.de; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=tu-postout21; t=1746635778; bh=rMTiElN/AF1fB/6uRBfuCtNtyx4lm1
	x0wHJXW+k9zL0=; b=lx2eFH5IfViNfFD8O9cb0DpoWID4hx2PEVqHQoqY5faNUN
	S2R81a90W78TyybFqdTn5W4e99zQx94jkEfbUmoZatArMBufiWUNNdma7cqQo5vb
	7k2ziPn08zrjB5B0qxNGo8jHNveiBzupiQ/+4e3gpULdtvM7+uK+oWnk9ZQgysNU
	Zx+X0qOnUCX2HGmT6ys8/w0c0YQLFwYumackprw4Xhd08fVb1i7EewhAlU7teA4i
	qlcJ2ZYQiDiYDLkgYm7+17AYtBKZaQaUY3z32eS2Il3hJUIRr0nMCX/0s4MN0797
	B3gGBnIiIluRTmADj3JzWzuE/IYAkWGzdpyvbBTA==
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
Message-ID: <f26c60f5-1abc-49fb-8fb0-4c361384a241@tum.de>
Date: Wed, 7 May 2025 18:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assert in x86_emulate_wrapper triggerable by HVM domain
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <e7347061-6dc6-44a3-ad41-270e705db2c5@tum.de>
 <26f9b5dd-2201-4dd7-bf26-863a9b114b62@suse.com>
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
In-Reply-To: <26f9b5dd-2201-4dd7-bf26-863a9b114b62@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 15:52, Jan Beulich wrote:

> On 15.04.2025 23:52, Manuel Andreas wrote:
>> my fuzzing infrastructure discovered that an assert in
>> x86_emulate_wrapper is able to be triggered by an HVM domain executing a
>> specially crafted repeating movs instruction.
>>
>> Specifically, if the emulation of the rep movs instruction triggers an
>> exception (e.g. by accessing invalid memory after some amount of
>> iterations), the emulation will be halted at that point.
>> However, the instruction manual requires that _some_ register state
>> (namely the updated value of rcx) shall be commited, whereas the
>> instruction pointer needs to be rolled back to point to the address of
>> the instruction itself. The assert checks for the latter. Problematic is
>> the fact that for these type of repeating instructions, Xen seems to
>> eventually just commit all register state when it encounters an exception:
> If my analysis is correct, none of this matters here; the core emulator
> is working correctly. Hence also why the in-tree fuzzer wouldn't have
> caught it. Would you please give the patch a try that I just sent, with
> Cc to you (sorry, the list archive didn't pick it up yet, hence no link)?
>
> Jan
Sorry about the late reply, just got around to applying your patch a few 
days ago.

I verified that the provided XTF test does not trigger the assert anymore.
Moreover, I fuzzed the patched version for a few days and the bug (or 
possibly newly introduced ones) did not pop up, so I believe the root 
cause was fixed correctly.

Best,
Manuel


