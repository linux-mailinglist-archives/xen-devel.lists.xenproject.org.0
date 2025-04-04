Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E2DA7BA7F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 12:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938066.1338881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0e67-0006mQ-IM; Fri, 04 Apr 2025 10:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938066.1338881; Fri, 04 Apr 2025 10:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0e67-0006kx-Ez; Fri, 04 Apr 2025 10:16:27 +0000
Received: by outflank-mailman (input) for mailman id 938066;
 Fri, 04 Apr 2025 10:16:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9O5F=WW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0e65-0006kp-P9
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 10:16:25 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc55da0f-113d-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 12:16:23 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso14414675e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 03:16:23 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec163156asm45685745e9.7.2025.04.04.03.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 03:16:22 -0700 (PDT)
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
X-Inumbo-ID: dc55da0f-113d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743761783; x=1744366583; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5w+anvyU5uARgyeOesFvzYUy6gS0Y8DmfhEOLxh99N4=;
        b=pKWF17/XEuyOcVQ+BFp3FnaAwVZ80MGSw97xkijbsuICo14S8dD4mbfK/kOoYAyfHe
         zrIo3BQJdT9CXjJvNZ5hiUmfZxYewcBwClf6N6QKcGry5GamjKXYf2Jz0TyY6LqAkEZj
         Schdz90+WyXkFNa/w9erjuERkPNa1rkRHO130=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743761783; x=1744366583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5w+anvyU5uARgyeOesFvzYUy6gS0Y8DmfhEOLxh99N4=;
        b=PFqqutafoV3g2OlUmxjXTmRMv6GH2YrZft1ijTzo6Om7xvDnSpThTaYt1HVzOcdTNK
         zWZ4u9QnRi+vMUL3o5a1oE7bBvFTiGkjN67jczntUkaXJXifPo+MfTbNR1LW2RWVxR4f
         WJApD9On8Wmgwezjdjfr+DBYAs94x4fFF4djuETdsbK+bqxpcIHqtApoObGveCSJFuqV
         xxdpsVEwDv5dz7nLE1ulXsjO9P6bAH5ICQh61Kr1ZUWarAPuGbjCH1YQAjZFlDuf4doq
         zkrl5ma3Vpp8R9yYe+7Ot5eoxbmJFfSXYZrjpggdWnEbnqSWO++rL2yqf8e2exqBcsDt
         wVGg==
X-Forwarded-Encrypted: i=1; AJvYcCWDkMF5maJoMcMnVHjuK2m39ejRr9mpnkdqSwdE8AYeVobuZKQyWszXq2A6szb3Qzjo+nZtW/Frn+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2TzRMQRF4FcehGEd8o0O5U/01mXi/4PPYn2vNVFLWwVvI+g+Y
	maolyoM4zrQk8qup2dW4EG3xicfA+Ic04CuroPz6XZC/HRlixxTIcDTkSOFG76E=
X-Gm-Gg: ASbGncsaNiXDrJD9pogPsyPdMszvUfv1ZfBZPg074NKctGGjRB3ngsbHllqfNZxIi+2
	2HH0OFJlq02A1SpTZjpbkTZlKhIi4TTmCry4xdMcP2rRVCrqZX9Rzg9FrRI9t3Ki/w0IfXRoOsZ
	0GS1i223NPa6MnruCIW3wHtiMxtOaaO8htYrtDx/Gz0idizEAq5s/0T86MBz7XQN6HxBXhHfuAN
	27KKqvtRnv4dpIAKrpXMgAbnMevCtQfMRq6T6gwPSynQb/facrbSUCxZrMBwXNLttyokDku9Buy
	ge/+pVcdtTLFdq6HJLIoui44EsDJg49oDSVORb2ehVHEHe6A+dvYL0TXWQn/pyrPsUM+ImvTLVa
	wIOQI6PQuOw==
X-Google-Smtp-Source: AGHT+IF6AScUI84ywdEk+EE8R4+vWdhKkCCO/4TJZm5yu4GdESpXPKgipwPsOa4hqx72+sWNI1yoJA==
X-Received: by 2002:a05:600c:4594:b0:43c:ec28:d310 with SMTP id 5b1f17b1804b1-43ecf8837d8mr26413965e9.10.1743761783200;
        Fri, 04 Apr 2025 03:16:23 -0700 (PDT)
Message-ID: <c37d84be-9679-4132-9a46-cd75344db941@citrix.com>
Date: Fri, 4 Apr 2025 11:16:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/amd: Convert wrmsr_amd_safe() to use asm goto()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250403175744.1538469-1-andrew.cooper3@citrix.com>
 <9b3b8397-943e-4171-9ec4-27fe45ba1a60@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9b3b8397-943e-4171-9ec4-27fe45ba1a60@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/04/2025 8:48 am, Jan Beulich wrote:
> On 03.04.2025 19:57, Andrew Cooper wrote:
>> Bloat-o-meter reports:
>>
>>   add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-29 (-29)
>>   Function                                     old     new   delta
>>   _probe_mask_msr                               99      94      -5
>>   init_amd                                    2418    2394     -24
>>
>> but that's because .fixup doesn't contain sized/typed symbols.  This also
>> drops two "mov -EFAULT, %reg; jmp ...;" sequences too.  The net saving is -50.
>>
>> wrmsr_amd_safe()'s return value is only checked against 0 (if at all), and
>> because of this, the compiler can now avoid manifesting 0/-EFAULT entirely,
>> and the %[fault] label simply lands on the right basic block.
>>
>> Convert to Xen style while rewriting.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Slightly RFC.  We use -EIO elsewhere for this purpose, and nothing in this
>> logic cares.
> {rd,wr}msr_safe() both use -EFAULT. What's "elsewhere" here?

Oh, that would be Linux.  Sorry, too much time spent staring at the same
logic in different codebases.

>
>> I was pleasently surprised by the manifestation of -EFAULT going away
>> entirely.
> I fear I don't understand this, given the -EFAULT is still there in the
> new code.

I meant about what the optimiser can do.  It hadn't occurred to me that
that was a valid transformation.

>
> Irrespective of these remarks:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

