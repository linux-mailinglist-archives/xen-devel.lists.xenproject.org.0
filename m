Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9987EB05C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 13:56:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632365.986659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2sxP-0002ra-I7; Tue, 14 Nov 2023 12:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632365.986659; Tue, 14 Nov 2023 12:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2sxP-0002pq-Ej; Tue, 14 Nov 2023 12:55:55 +0000
Received: by outflank-mailman (input) for mailman id 632365;
 Tue, 14 Nov 2023 12:55:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iys2=G3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r2sxO-0002pk-Fv
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 12:55:54 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 244f9b14-82ed-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 13:55:52 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so832488166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 04:55:52 -0800 (PST)
Received: from [192.168.107.1] ([31.94.60.175])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a170906775000b00982a92a849asm5495455ejn.91.2023.11.14.04.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 04:55:51 -0800 (PST)
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
X-Inumbo-ID: 244f9b14-82ed-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699966552; x=1700571352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ROOAYgvmEQ8Q9HcoTG3cFBtRf6MvfqLb0ti00MHtSI=;
        b=lzH+Np5+z9wn/kBRBV1mNNKaYbFjLDYixNRYN8DdGTKwHL/pl6RZ0NE3venDYLFnjB
         6lYl5dqNk3AOpXqTZ/UQOtORJVDVkTR0eD/fpop4i43rRUnKpoeMTTtJDrSu6391ZEvK
         cyfv+5q232chfyczbryRQU8Zf41gLGgpmYdTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699966552; x=1700571352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ROOAYgvmEQ8Q9HcoTG3cFBtRf6MvfqLb0ti00MHtSI=;
        b=GHHPMyId7Vx61Pj6skHsrX+1CsmxTfulj01PMwu/dksdSP4sWqAbGVlt0SBehANbhp
         0e0ijPcE0qX6iroN57CWjn9/Ltz5LQKVdoOUdN5fV2WmI4y3p+SY29Dbrj6Qenfd7Rr2
         dwf1NMmfYmwu5Cvafz1GOiXYLF7iKgObRfDUSQASVoCaLe8z9b1CvLn8smv4lyRUDnrF
         vhllK7GvHy2zHCA9vnJ7DmuXlCCO5icSopNQdH+LvOOlI3oEUWtjhAArXW/M9h7uYPBR
         AZ/xY3YxPBtUe8MbWCn+PdTfoPH1a2qHfO5H8DmhqDEkJBcP6xQGf1b9uE2mMswDscC4
         +c0Q==
X-Gm-Message-State: AOJu0Yw+EiozHJ2THb/anRu4HnUEo5i+5YHC0fuz9Vlg5VIcAvlvOQKd
	x/5ufFsSPpTjvGi95eiOZeykWA==
X-Google-Smtp-Source: AGHT+IHXXWoQ1dAGkde1rZ/szSgea+/TOIRpP2DJnDGfkybwB9ve68KbtpeoRmFdLFuV1H8dmwn4qw==
X-Received: by 2002:a17:906:748c:b0:9e1:a5eb:8cb4 with SMTP id e12-20020a170906748c00b009e1a5eb8cb4mr7295668ejl.58.1699966551963;
        Tue, 14 Nov 2023 04:55:51 -0800 (PST)
Message-ID: <fd99ea62-f011-4bcb-ba83-4698b5d267fd@citrix.com>
Date: Tue, 14 Nov 2023 12:55:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: On x2APIC mode, derive LDR from APIC_ID
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20231113165023.5824-1-alejandro.vallejo@cloud.com>
 <ZVJifMqOR_3zINYZ@macbook.local>
 <5c4a237e-975d-f452-1261-f9fc10ef65c6@suse.com>
 <65536590.050a0220.eb28a.617d@mx.google.com>
 <f278f367-81cb-4a72-9303-23622dea3abd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f278f367-81cb-4a72-9303-23622dea3abd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/11/2023 12:32 pm, Jan Beulich wrote:
> On 14.11.2023 13:18, Alejandro Vallejo wrote:
>> On Tue, Nov 14, 2023 at 11:14:22AM +0100, Jan Beulich wrote:
>>> On 13.11.2023 18:53, Roger Pau Monné wrote:
>>>> On Mon, Nov 13, 2023 at 04:50:23PM +0000, Alejandro Vallejo wrote:
>>>>> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
>>>>> registers are derivable from each other through a fixed formula.
>>>>>
>>>>> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
>>>>> rather than x2APIC_IDs (which are not, at the moment). As I understand it,
>>>>> this is an attempt to tightly pack vCPUs into clusters so each cluster has
>>>>> 16 vCPUs rather than 8, but this is problematic for OSs that might read the
>>>>> x2APIC_ID and internally derive LDR (or the other way around)
>>>> I would replace the underscore from x2APIC ID with a space instead.
>>>>
>>>> Seeing the commit that introduced the bogus LDR value, I'm not sure it
>>>> was intentional,
>>> Hard to reconstruct over 9 years later. It feels like Alejandro may be right
>>> with his derivation.
>>>
>>>> as previous Xen code had:
>>>>
>>>> u32 id = vlapic_get_reg(vlapic, APIC_ID);
>>>> u32 ldr = ((id & ~0xf) << 16) | (1 << (id & 0xf));
>>>> vlapic_set_reg(vlapic, APIC_LDR, ldr);
>>>>
>>>> Which was correct, as the LDR was derived from the APIC ID and not the
>>>> vCPU ID.
>>> Well, it gave the appearance of deriving from the APIC ID. Just that it was
>>> missing GET_xAPIC_ID() around the vlapic_get_reg() (hence why LDR was
>>> uniformly 1 on all CPUs).
>>>
>>>>> This patch fixes the implementation so we follow the rules in the x2APIC
>>>>> spec(s).
>>>>>
>>>>> While in the neighborhood, replace the u32 type with the standard uint32_t
>>>> Likely wants:
>>>>
>>>> Fixes: f9e0cccf7b35 ('x86/HVM: fix ID handling of x2APIC emulation')
>>> +1
>>>
>>>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>> I do wonder whether we need to take any precautions with guests being
>>>> able to trigger an APIC reset, and thus seeing a changed LDR register
>>>> if the guest happens to be migrated from an older hypervisor version
>>>> that doesn't have this fix.  IOW: I wonder whether Xen should keep the
>>>> previous bogus LDR value across APIC resets for guests that have
>>>> already seen it.
>>> That earlier change deliberately fixed up any bogus values. I wonder
>>> whether what you suggest will do more good or more harm than going
>>> even farther and once again fixing up bad values in lapic_load_fixup().
>>> After all LDR being wrong affects vlapic_match_logical_addr()'s outcome.
>>> I think one of the two wants adding to the change, though.
>>>
>> You mean changing the LDR of a vCPU to the correct value on migrate? That
>> feels like playing with fire. A migrated VM is presumably a VM that is
>> running without issues (or it would have been rebooted). Letting it run
>> as it did seems safer.
> See Andrew's reply.
>
>> I don't think vlapic_match_logical_addr() is affected. The LDR's are still
>> unique in the bogus case so the matching ought to work. Problem would arise
>> if the guest makes assumptions about APIC_ID and LDR relationships.
> The LDRs still being unique (or not) isn't what I'm concerned about. It is
> the function's return value which would be wrong, as the incoming "mda"
> presumably was set in its respective field on the assumption that the LDRs
> are set in a spec-compliant way. There not having been problem reports
> makes me wonder whether any guests actually use logical delivery mode in a
> wider fashion.

They likely don't.

Logical delivery for xAPIC only works in a tiny fraction of cases
(assuming correct topology information, which we don't give), and
persuading a VM to turn on x2APIC without a vIOMMU is not something
we've managed to do in Xen.

Also (as I learn talking to people just last night) it turns out that
Logical Destination Mode for external interrupts is entirely broken
anyway.  It always hits the lowest ID in the cluster, unless the LAPIC
in question is already servicing a same-or-higher priority interrupt at
which point the next ID in the cluster is tried.

~Andrew

