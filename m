Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E67FA606
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 17:18:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642332.1001736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7eIP-0001ty-HD; Mon, 27 Nov 2023 16:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642332.1001736; Mon, 27 Nov 2023 16:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7eIP-0001rb-Dy; Mon, 27 Nov 2023 16:17:17 +0000
Received: by outflank-mailman (input) for mailman id 642332;
 Mon, 27 Nov 2023 16:17:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fT1m=HI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r7eIN-0001rV-8V
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 16:17:15 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c4247b3-8d40-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 17:17:12 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c878e228b4so54656181fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 08:17:13 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bd12-20020a05600c1f0c00b0040b3027ddc5sm15328081wmb.37.2023.11.27.08.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 08:17:12 -0800 (PST)
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
X-Inumbo-ID: 6c4247b3-8d40-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701101832; x=1701706632; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kaynfYCQTiHwSJRdKciBcK5VUK1PLNWXVOARFeCqUZg=;
        b=cw2jkC9Gfy9glZlGRMnU+UaOrPlWUtezxwY1vJc9+naacSlfIe22Cd2kACJ8g32EBT
         psjCCWC+WbKakjQxlbXWpp3mpZAzXQt5ojA5Ed64+ueFgX6h0YgiYIngFRqtJbdiWiXl
         Y3kSAefyn0THoqqWavpDGkGb0SpGFIDvDapzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701101832; x=1701706632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kaynfYCQTiHwSJRdKciBcK5VUK1PLNWXVOARFeCqUZg=;
        b=PJhCjqsUmZ7VGKiYXLhgsAbR6dvC9kcXM2JcQ7gSzKpDRmU4aWyml/17m6usWwDXhV
         zIstivsN1x7GNabp8E4Thnumx5EFv0ceruKFRWXhnr3Fa2dSUMfMcLBfFqdAIwpFAL0Z
         n5KZOVho41KbEkHHGKZE1yyhfDf8B+Vl7bcYT37P58N6/E4SYx74jstECZb12q//h02v
         YcHXlBzpEdX0ORG5SACJKTPS+D4c2hG0TVctiT2dfEhnx4KO8pZSrebgVUnCI8RaS3JT
         p2SYOFARQoVdtB4La6gHchaWLxD9funmAAxYZiCItwHmlRbxhb8NSUjx+8diUeh3QHt8
         Urxg==
X-Gm-Message-State: AOJu0Yz11aXRt9oQc5d2+86MZhFJy5PFxfzzFcui1gtgLcaoRIbZoZZ2
	KwOK87y3t9Vo/FDidASE+v/D2Q==
X-Google-Smtp-Source: AGHT+IFF3uq7/+Xus5vZcxsQzFYm4eJCNrfg4omIDA2/vGxB33fl1gG61fSUdG4gTzaREWi3fh01ww==
X-Received: by 2002:a2e:a48f:0:b0:2c9:a042:e008 with SMTP id h15-20020a2ea48f000000b002c9a042e008mr3099865lji.21.1701101832411;
        Mon, 27 Nov 2023 08:17:12 -0800 (PST)
Message-ID: <72619755-670a-4472-bb92-11221053c320@citrix.com>
Date: Mon, 27 Nov 2023 16:17:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-GB
To: Neowutran <xen@neowutran.ovh>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <ZT/Cs+MsBPibcc9D@mattapan.m5p.com> <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
 <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com> <81f6bbd5-0487-461a-af1a-dbb6ead47
 <2lyqb2u7tlcaig7nit3rnw5ftfupfemqmffr4ddsnolcrdojme@kmmlzigrzch3>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2lyqb2u7tlcaig7nit3rnw5ftfupfemqmffr4ddsnolcrdojme@kmmlzigrzch3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/11/2023 3:18 pm, Neowutran wrote:
>> Hello,
>>
>> Thankyou for the analysis.
>>
>> For your base version of QubeOS Xen, was that 4.13.2-5 ?   I can't see
>> any APIC changes in the patchqueue, and I believe all relevant bugfixes
>> are in 4.17.2, but I'd just like to confirm.
> I was using the qubes-vmm-xen release "4.17.2-5" that use xen version
> "4.17.2" . I don't see custom modification for APIC in the patchs
> applied t 
> o Xen by QubesOS
>
>> First, by "unusable slow", other than the speed, did everything else
>> appear to operate adequately?  Any chance you could guess the slowdown. 
>> i.e. was it half the speed, or "seconds per log console line during
>> boot" levels of slow?
> Once I was logged in, it took me around 10 minutes to type the command
> "sudo dmesg > log"

Ok.  Glacial it is.


>
> There was also graphical instabilities (screen display something, then it is black,
> few seconds later it display things again. 
> Sometime it completly crash and I need to reboot to try to finish the boot+login process),
> and unable to start guests due to the system being too slow. 
>
> Some of the logs gathered from "sudo dmesg" that only appear for case 1 and
> case 3: 
>
> "
>  nvme nvme1: I/O 998 QID 1 timeout, completion polled
>  nvme nvme1: I/O 854 QID 5 timeout, completion polled
>  ...
>  [drm] Fence fallback timer expired on ring sdma0
>  [drm] Fence fallback timer expired on ring sdma0
>  ...
>  [drm] Fence fallback timer expired on ring sdma0
>  [drm] Fence fallback timer ex 
> pired on ring gfx_0.0.0
>  [drm] Fence fallback timer expired on ring gfx_0.0.0
>  [drm] Fence fallback timer expired on ring sdma0
>  ...
> " 
> things like that repeated hundreds of times.

Both the disk and GPU had timeouts.  Both indicative of interrupts not
working correctly.
>> Having re-reviewed 26a449ce32, the patch is correct but the reasoning is
>> wrong.
>>
>> ACPI_FADT_APIC_CLUSTER predates x2APIC by almost a decade (it appeared
>> in ACPI 3.0), and is not relevant outside of xAPIC mode.  xAPIC has 2
>> different logical destination modes, cluster and flat, and their
>> applicability is dependent on whether you have fewer or more than 8
>> local APICs, hence that property being called out in the ACPI spec.
>>
>> x2APIC does not have this property.  DFR was removed from the
>> architecture, and logical mode is strictly cluster.  So the bit should
>> never have been interpreted on an x2APIC code path.
>>
>> Not that it matters in your case - the bit isn't set in your FADT, hence
>> why case 1 and 3 have the same behaviour.
>>
>>
>> This brings us to case 2, where mixed mode does seem to resolve the per 
> f
>> problem.
>>
>> Since that patch was written, I've learnt how cluster delivery mode
>> works for external interrupts, and Xen should never ever have been using
>> it (Xen appears to be alone in OS software here).  For an external
>> interrupt in Logical cluster mode, it always sends to the lowest ID in
>> the cluster.  If that APIC decides that the local processor is too busy
>> to handle the interrupt now, it forwards the interrupt to the next APIC
>> in the cluster, and this cycle continues until one APIC accepts the message.
>>
>> You get most interrupts hitting the lowest APIC in the cluster, but the
>> interrupt can be forwarded between APICs for an unbounded quantity of
>> time depending on system utilisation.
>>
>>
>> Could you please take case 2 and confirm what happens when booting with
>> x2apic-mode={physical,cluster}?  If the pattern holds, the physical
>> should be fine, and cluster should see the same problems as case 1 and 3.
> I confirm that the pattern holds. "physical" is fine and "cluster"
> have th 
> e same issue as case 1 and case 3.

Ok, so something in your system *really* doesn't like having external
interrupts programmed in Logical cluster mode.

And knowing how logical cluster mode works for external interrupts, we
should never have done that in the first place.

I think this is enough justification to backport mixed mode.  Against a
default upstream Xen, that swaps external interrupts to being programmed
in physical mode, while keeping IPIs in cluster mode.

FWIW, we've already backported mixed mode to XenServer's Xen 4.13 (where
we forced physical mode for other reasons), and that's come with nice
perf improvements from swapping IPIs to using cluster mode.

~Andrew

