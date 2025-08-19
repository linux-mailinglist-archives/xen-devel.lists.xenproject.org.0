Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F529B2C58C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 15:28:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086624.1444823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoMNz-0005wL-U8; Tue, 19 Aug 2025 13:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086624.1444823; Tue, 19 Aug 2025 13:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoMNz-0005u7-R6; Tue, 19 Aug 2025 13:28:23 +0000
Received: by outflank-mailman (input) for mailman id 1086624;
 Tue, 19 Aug 2025 13:28:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/XH=27=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uoMNy-0005tx-Jp
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 13:28:22 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5da13151-7d00-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 15:28:17 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a1b0bd237so42620125e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 06:28:17 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c78b33csm222651485e9.25.2025.08.19.06.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 06:28:16 -0700 (PDT)
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
X-Inumbo-ID: 5da13151-7d00-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755610097; x=1756214897; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ke7os2fu9TtFHTuGPp/COdq8HM+tR2KBR6lKg9OnZxw=;
        b=rWXFBFohmNNpW94EB+NR2BSCjQv1r5WTb+HgREV7LNYw54p+UrXMuo0Uh07sCwByfn
         19aikgg8wiF10ZQczT3IndGnYu+MEIGBE2n4+wZybNAyKq5iIOFbI0jXWtPsjg81k9sO
         LYZxTh6XUuqCIB4TkkEDKsPfgN3TQ3oxbxPO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755610097; x=1756214897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ke7os2fu9TtFHTuGPp/COdq8HM+tR2KBR6lKg9OnZxw=;
        b=EhW+NNlFZ/QLuR/jFQEjcHnK8rGEPaO37ci4+Cq0apQZMizBR+Kzpx04U/V4oXer1W
         jAdiQxsq21fH9KQajmNbpvKCnHUvHhTyLcOSLCesvlirVY0HccxZYrlwrbMzN8Xd2e+G
         7MSACYjDxSZmv6sBnG0bBKtbXNzF5X7zhlH15quYwDc0sJqEmOVLhVj6Q8BJa4D8THDA
         ac6Pxtan1VqSkMqWmDkRd0Lat4RxI9/Y7XbmvnGncn9BGt+WXfjQP09YkGHXhy6wDXf+
         p1gk396gVRzy/JtMntKldEszAZazXYb3H/HKlleSJVC/um1n+CEp8FJQraGgOlmKCNGO
         3Jsg==
X-Forwarded-Encrypted: i=1; AJvYcCUAqoJK1w+cyBtaK7RzxVfDr1QKLyNnzUaZFzXsSn3GVXdoTBiEXtONewcdi3MfFvd72PRRkPPamPY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGvHzvZtmE89IK0PPCm7AjgVE3WJ6jvRwLl3wpAThktCLbzKjb
	QpVxC5oSYXohUm5VYqvz4GsIS5GJScZQ1IrRGE3C+SCLIrX5kORymZLu7Dr1tAi8VQ8=
X-Gm-Gg: ASbGncutawSS2ozvvan6WayWIu/K3XX7vp2PFsI06zXrVh4tNvOQKqciUcVNFqFp2q4
	qHX5vv//aDiyGJiseRPJzgri7X4UgIZNnNatISPrVcXqTJrzW7B6LE01tB1bGhgdfROxICo5LcH
	vTqdrTq9FWR6bLyvA2OmvvWw2n9tJBvuD3LfDibaZyEDVRFcg8bIKFUGnu35yJJLP2dhfc9bJCE
	BQRNw6Uir9A3MSLqzlecNTEiLuuQwG0hltxZTocsuebp3PpWBW7GcJHBW9IyPm0J7j9L+fL8z+y
	Gt+vCR8EG8UeAaVV6DlFBFS4E0gH/L7GQ8So5OjocHOqXodIUhK9xKU+MrU5ipWtTXHq30oghcn
	ctp9pKeXVOrsl4oNdIb+RSEaN7GD5U/ggYsOZkbVDGrvBrxxHyRrubV62KP/8XU5k8MVV
X-Google-Smtp-Source: AGHT+IFXwbE5IwDr8z6wLUwKXiPpH5pgo2pXlaox9fMhhcM4lSDzdoIEufxjyuC2H8wJ6IRkW20LcQ==
X-Received: by 2002:a05:6000:18a8:b0:3b9:55a:9d0c with SMTP id ffacd0b85a97d-3c0e00a1623mr1916338f8f.3.1755610096649;
        Tue, 19 Aug 2025 06:28:16 -0700 (PDT)
Message-ID: <341a61df-fde2-40a4-bab3-31a0d66a3d0a@citrix.com>
Date: Tue, 19 Aug 2025 14:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] x86/msr: Implement rdmsr_safe() in C
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-2-andrew.cooper3@citrix.com>
 <e3b37ba8-72df-403b-816d-3be9011b8203@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e3b37ba8-72df-403b-816d-3be9011b8203@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/08/2025 12:23 pm, Jan Beulich wrote:
> On 15.08.2025 22:41, Andrew Cooper wrote:
>> ... in preparation to be able to use asm goto.
>>
>> Notably this mean that the value parameter must be taken by pointer rather
>> than by value.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> In principle
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> However, having looked at patch 2 first, ...
>
>> @@ -879,14 +879,14 @@ static void intel_init_ppin(const struct cpuinfo_x86 *c)
>>      case 0x8f: /* Sapphire Rapids X */
>>  
>>          if ( (c != &boot_cpu_data && !ppin_msr) ||
>> -             rdmsr_safe(MSR_PPIN_CTL, val) )
>> +             rdmsr_safe(MSR_PPIN_CTL, &val) )
>>              return;
> ... with this, wouldn't we be better off using ...
>
>>          /* If PPIN is disabled, but not locked, try to enable. */
>>          if ( !(val & (PPIN_ENABLE | PPIN_LOCKOUT)) )
>>          {
>>              wrmsr_safe(MSR_PPIN_CTL, val | PPIN_ENABLE);
>> -            rdmsr_safe(MSR_PPIN_CTL, val);
>> +            rdmsr_safe(MSR_PPIN_CTL, &val);
> ... plain rdmsr() here, thus not leaving it open to the behavioral change
> patch 2 comes with?

Yeah, probably.  At the point we've read it once, and written to it, a
subsequent read is not going fail.

I'll adjust, although it will have to be a rdmsrl().

~Andrew

