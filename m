Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA9C9BD97B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 00:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830512.1245526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8SeA-0002hG-N6; Tue, 05 Nov 2024 23:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830512.1245526; Tue, 05 Nov 2024 23:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8SeA-0002ew-KU; Tue, 05 Nov 2024 23:07:38 +0000
Received: by outflank-mailman (input) for mailman id 830512;
 Tue, 05 Nov 2024 23:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lM+p=SA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8Se9-0002em-OI
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 23:07:37 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcb71a53-9bca-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 00:07:32 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d55f0cf85so4034203f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 15:07:32 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10d4983sm17276131f8f.33.2024.11.05.15.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 15:07:31 -0800 (PST)
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
X-Inumbo-ID: bcb71a53-9bca-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmQiLCJoZWxvIjoibWFpbC13cjEteDQyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJjYjcxYTUzLTliY2EtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODQ4MDUyLjYzMjI3LCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730848052; x=1731452852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Aqp20HRMdNrDj1f9s9Tmi+jiIUBSpOWSfmxAHMwwf3I=;
        b=e93W91NA4s/hPEY99lEvuAFOqXZpQ+f7QbdgUdBuEMZFbLp4XEqYBitmGRnGNln3xm
         A161VsAYx6ZJOCl6V3AHtm2M45xD6SDjJUkv1xiOa0HmOSSIIjnn96BvFLOtXABscfR9
         Z9UCrmwTqb2L9b+BXx69E7/BHvxRntc+KiNvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730848052; x=1731452852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aqp20HRMdNrDj1f9s9Tmi+jiIUBSpOWSfmxAHMwwf3I=;
        b=rIDTZzTxblTMGyjn6pSvpQs6hh1awQxlzVFZ6lNOYRXTTn/cjbFQbl5Kx1+x7Nn1sx
         hWVUKwh8OW3uVumFRiTbqigtaJHqv5qzZNJcnI47+rFYqAO0vgyvTAqaZ9iXrnW3Dtxb
         RZORrKpDjbxiR9jnH7thLvr9iBtCJmlawZeRBYQ285JgXazJUhSP5ExXXRqLRvCOGfjv
         k+wggijDBGeUdg2zetTO7uuvcaFxifo/644OiCM2w4E3IBZeyQgFJuZ1AWLeFNpQMEpQ
         XZmODMdZ9W0RLfTCMAjOpKJ18R4ccpeQMAds0hgxTRLm24hVDQRBKxOcYSsB88j62V/f
         zoiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIsMQWMAY0XdDMNb/brRscLcB6TVIVIa9UIIZKoImQrl6dFldpFeCuHeR4KLlHifzwR3SCPzmivEM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyp2DKXxZrbmfq6VHwwYRz+CuzEsXXCcoe8++FFecXKWp/ROWzh
	cuA7Bk8I35AedzXNC3x6MqYaB5yjyaLoNpZEaQZu1ih0N0MFbvTGtJ0wWdroCCA=
X-Google-Smtp-Source: AGHT+IHlfRLmLRDlsulwgmqWYmrFG0wTYrxOgA6QCO6dhZM5F75Yt8HWTsIigW6dg/1DSuIUDRMGhQ==
X-Received: by 2002:a05:6000:1863:b0:37e:f8a1:596a with SMTP id ffacd0b85a97d-381be76517cmr17236478f8f.3.1730848051755;
        Tue, 05 Nov 2024 15:07:31 -0800 (PST)
Message-ID: <9b25640d-8180-4f9b-96a7-a214bbdfa238@citrix.com>
Date: Tue, 5 Nov 2024 23:07:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] x86/ucode: Fold microcode_grab_module() into its
 single caller
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-6-andrew.cooper3@citrix.com>
 <d68a6509-a79e-4ea7-ad39-da77243a36e7@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d68a6509-a79e-4ea7-ad39-da77243a36e7@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/11/2024 4:33 pm, Daniel P. Smith wrote:
> On 10/28/24 05:18, Andrew Cooper wrote:
>> @@ -831,7 +818,15 @@ static int __init early_microcode_load(struct
>> boot_info *bi)
>>       size_t size;
>>       struct microcode_patch *patch;
>>   -    microcode_grab_module(bi);
>> +    if ( ucode_mod_idx < 0 )
>> +        ucode_mod_idx += bi->nr_modules;
>> +    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
>> +         !__test_and_clear_bit(ucode_mod_idx, bi->module_map) )
>> +        goto scan;
>> +    ucode_mod = *bi->mods[ucode_mod_idx].mod;
>> + scan:
>> +    if ( ucode_scan )
>> +        microcode_scan_module(bi);
>>         if ( !ucode_mod.mod_end && !ucode_blob.size )
>>           return 0;
>
> Just a suggestion, but would it be useful to add a comment to explain
> the three conditions of ucode_mod_idx that are being handled before
> scanning is attempted?

The already did that, but it's in the next patch, which also rearranges
this block massively.

~Andrew

