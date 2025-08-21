Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380D5B30701
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 22:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089286.1446922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upCGi-00078q-1N; Thu, 21 Aug 2025 20:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089286.1446922; Thu, 21 Aug 2025 20:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upCGh-00077N-UK; Thu, 21 Aug 2025 20:52:19 +0000
Received: by outflank-mailman (input) for mailman id 1089286;
 Thu, 21 Aug 2025 20:52:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1upCGf-00077H-T8
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 20:52:17 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b643054f-7ed0-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 22:52:12 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b9e41669d6so1144818f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 13:52:12 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c3c89cd4d4sm6904347f8f.42.2025.08.21.13.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:52:10 -0700 (PDT)
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
X-Inumbo-ID: b643054f-7ed0-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755809532; x=1756414332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/SlwLCuysd86Ktk85QZiI0MeHEe6YeUt9ZZDPbTT98s=;
        b=FRqceFJr+3n3L3Zj5a7wenwyu1q3aDq41tCYBznPIhWNUuL41g0wnZFGx0aW4LHqIs
         ZaBJDuFLedtyPQIKYhJTDkVuA6A4utEYR2Q2fDwZx+L+XKhcmxsBWnJKSRXqWD3MHFBi
         TZ0eCNDRTIKSy7hhvigUcPB12VQWuf36bxu/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755809532; x=1756414332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SlwLCuysd86Ktk85QZiI0MeHEe6YeUt9ZZDPbTT98s=;
        b=xUSLP1IZKL3hGekuIbhovXmMDm/VOaTfb+cpO2SkAIO8kAPEY0qgrjZgyj8sXRm999
         bFnJbuvi8gLJeZjTtDVpXR5xwHM6cpgcdh65HUYIt96FBPwgWfpSmxLgAvRzLO0jPlfx
         CWaBOCRwHSQY0ERMEjFR6sU3AUnDMmZPGXkldiEqAycQoGmeN0rESDu0958nWclXqFWM
         eG37occj7JRCQbVYqBMEEeOqX74+8B+lSW0qXTUhSohZF8VERwnfMPIrMsCkw8OhSIaN
         6IbDJ/QA+mL5t9P5R9RlA0APUcrGuq6yGlR4GfuGNVzvLNsIgmWYZoak+YnsFrzPM5LG
         W1PA==
X-Forwarded-Encrypted: i=1; AJvYcCVAM9FnVhgtEgr//m/quMUIfP06Jdzr0c0oJ6D/U6L43iYUEMq72v9L9g5L15DqT876aMCQo/+VM9A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvAuRw5s0vgwU3teA52NEL3oyMCsYKdiQRsTWf3xkWZHHLe+at
	vp9LCqZqkhAOTKVyU613E55d3X1r9ybdJGEpWo/NTxbYJLj6/hg4B8wkMDtJJDaShkiktKPbUbv
	tToYf
X-Gm-Gg: ASbGncsT1OTBYY/ho+xJAyc4Euw5JRtbH+PlpLBc54e4HN9n06/0qoUe/SyZn6TQmfZ
	jOOmQSRr8tO/HrzhYoO5WVY8+elPbpSjskVBww2LA3CHP19ZWUgqoCUSLTNcP6WMMdJ+WkEOfbj
	+aYRq6xhbeIW33LHzg5nBjidFXWEppymyJzmDTwgNx39e80HUvzPOkbCBB+C4/JH91hhautjowB
	VWGuG7A/emjSC7q8ysohOYDzsT+Q71Gcw3qmA2yfAbaNAYZ9YN9WxlUX9Q7ljIU1plm3VxvE+1l
	o/B+1dI1EchrRWWfIfN0zkUEZUgg06mXdlAZNUtqRMCVVsRfAxmLT9Yx+R0eKNnpEjYHvL2nz/3
	TeRj9J9Pohw1oN0S0cHcW5d86NQUOOQN1Mn3vdkkhVdpfS/kc3BQGE/Gmcmo36eZWVzS4
X-Google-Smtp-Source: AGHT+IHsHZxIvSy9dlkMzILRdbOAXfRwqhhg2VrfYFFIYT2F/fgyBQtUrYUdgpPPynCX1ou+rOiMcQ==
X-Received: by 2002:a05:6000:3110:b0:3b9:10c5:b321 with SMTP id ffacd0b85a97d-3c5dcc07eb4mr291633f8f.44.1755809532013;
        Thu, 21 Aug 2025 13:52:12 -0700 (PDT)
Message-ID: <da892c2b-272d-4aa0-8eea-9e57f414bb5e@citrix.com>
Date: Thu, 21 Aug 2025 21:52:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/16] x86/fsgsbase: Improve code generation in
 read_registers()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-17-andrew.cooper3@citrix.com>
 <e1444bbf-89b8-4685-ada6-3092d65fb9c6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e1444bbf-89b8-4685-ada6-3092d65fb9c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/08/2025 2:19 pm, Jan Beulich wrote:
> On 15.08.2025 22:41, Andrew Cooper wrote:
>> It turns out that using the higher level helpers adjacent like this leads to
>> terrible code generation.  Due to -fno-strict-alising, the store into state->
>> invalidates the read_cr4() address calculation (which is really cpu_info->cr4
>> under the hood), meaning that it can't be hoisted.
>>
>> As a result we get "locate the top of stack block, get cr4, and see if
>> FSGSBASE is set" repeated 3 times, and an unreasoanble number of basic blocks.
>>
>> Hoist the calculation manually, which results in two basic blocks.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Otoh the function here isn't really performance or size critical. I'm undecided
> whether the undesirable open-coding or the bad code gen are the lesser evil.

This function no, but every other place touching FS and GS is
performance critical.  They're all messy to start with, and get worse
under FRED.

~Andrew

