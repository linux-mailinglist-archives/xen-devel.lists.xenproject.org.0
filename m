Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E070CA028D8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 16:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865784.1277059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUomB-0003X8-EH; Mon, 06 Jan 2025 15:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865784.1277059; Mon, 06 Jan 2025 15:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUomB-0003Tz-BI; Mon, 06 Jan 2025 15:12:19 +0000
Received: by outflank-mailman (input) for mailman id 865784;
 Mon, 06 Jan 2025 15:12:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFJS=T6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tUomA-0003Tt-2A
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 15:12:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c88e11a-cc40-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 16:12:15 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso96435575e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 07:12:14 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b441bbsm601761155e9.40.2025.01.06.07.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 07:12:13 -0800 (PST)
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
X-Inumbo-ID: 9c88e11a-cc40-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736176334; x=1736781134; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g6R7nBfdPYOAfqn6J6sPZHBRG7XPQaze5bNkfLa/gVA=;
        b=gS80TpRQkTS+s14rj6sOMNmv9En+DfpcjDtNxgP3FVkSVUvzRFiHOMstNFM3z3dDEK
         nK+CrY2G8UselrB474R8nT4YxMtF2LrmozER0K5cWl+GXqd9eoYLe88Ba2neabRsFPp8
         XqXHkYOdxvhEFYSdeU9TuG8thtBQX/ibGTGQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736176334; x=1736781134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6R7nBfdPYOAfqn6J6sPZHBRG7XPQaze5bNkfLa/gVA=;
        b=kUJQPgSM3qvWiR8c3ZxR0QAnylPmismHpVXEsJXeTH3gtjRGzSOYdNYp8k2sdUICce
         TD3BqyiDPMlose+nmgWpwKD070d15gY9k+UutsdMRRe5485SdniGTEqbuU4+lTjrdrsv
         pBuZq9jke+hY/u/pKTqXhlT7cOvL3N7N7GecfT8SSbSC6GOk3HaO1lUrwvse6XaU4BWN
         mkAnJx+BSNMy+GbVT/ibAXuVjcoRJqqSLl7T/PX5nrArESJNgj/nygRpMEM5PUQL2ggr
         bLsrzAt8lucQ/ljkneDpmUaEWHN8fDZUQ4Du4Y4K1dHe1p0Zf+5xuT1kl8s8i2OkieMk
         OqVg==
X-Forwarded-Encrypted: i=1; AJvYcCWi9aBBgXEaZ1K9Aaxu8JwYkTuO33YK2jklF0mEfgSqm+VwrFbVxE2WvlDLadxN2g7NeY+hJUXow6Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVCRzbjhWIJUhEtyJxlTlBnAk7q6U8kp266FLnsrBK5hum3sbF
	UE+8t43HA8/LTJlBJRT4MKQanm+vDp4s6sLgM7IoAqieYtGhKqk3OWG1ids6R4Q=
X-Gm-Gg: ASbGncsvwnw9wA1kkq02PF4T0MkkOZ/kT4BJEO9L7ZT/ymBFUIrPhjpLBsLJOKBCeq9
	8iIf631PL7WFWX4kwOnRGd9zIVCuXA0hIAnFqzWOQGcvca6FILwL9A4rU20KW1oNCy5U7KWwpnU
	oXndg2x5ufVRSDNMQipYbDAFMnFBOEMpUT9EK4ygU/tA67NmpovZvsq22f0ZuxI9ZZQialT1s/2
	aro8BW/fvhylAiyMl9w8PzxYnLwX4mQLtM8Capxh9iMqbSJzdRG/qXCO+BQOxT8BhoWlWL6FEcm
	CCccbqyV1W12+ZZOvzhb
X-Google-Smtp-Source: AGHT+IGYTdtvd1bfoW8N1SfsdyVHOgxtZgK81pwpUXrArepWF1zv7CuFpabBQam2QOR5nFzaSaPldQ==
X-Received: by 2002:a05:600c:1987:b0:434:fbcd:1382 with SMTP id 5b1f17b1804b1-43668643a39mr470570865e9.11.1736176334393;
        Mon, 06 Jan 2025 07:12:14 -0800 (PST)
Message-ID: <b9e16f7f-9af5-4faf-b4f2-88913cb35910@citrix.com>
Date: Mon, 6 Jan 2025 15:12:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/amd: Misc setup for Fam1Ah processors
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250106141929.615831-1-andrew.cooper3@citrix.com>
 <614a8615-7448-4601-92ff-04217f77a38f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <614a8615-7448-4601-92ff-04217f77a38f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/01/2025 2:41 pm, Jan Beulich wrote:
> On 06.01.2025 15:19, Andrew Cooper wrote:
>> Fam1Ah is similar to Fam19h in these regards.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> With this patch, I think we're in an ok position to declare support on Zen5
>> CPUs.
> What about amd_log_freq(), where the 0x19 upper bound may need bumping?

Ah, that's new since I did Fam19.  I'll adjust.

>
>> --- a/xen/arch/x86/cpu/microcode/amd.c
>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>> @@ -114,6 +114,7 @@ static bool verify_patch_size(uint32_t patch_size)
>>  #define F16H_MPB_MAX_SIZE 3458
>>  #define F17H_MPB_MAX_SIZE 3200
>>  #define F19H_MPB_MAX_SIZE 5568
>> +#define F1AH_MPB_MAX_SIZE 14368
> Yet another pretty odd number. Are these actually documented anywhere?

In the PPRs.

> And what has come of their plan to make ucode size available via CPUID
> (for which I even sent a patch quite a long while ago)?

This check in this function need to work for any microcode we find in
the container.  Knowing the size of the current CPU doesn't help parsing
others.

And talking of, I've just found another Fam1Ah processor with an even
larger patch size.  This limit needs bumping to 15296.

~Andrew

