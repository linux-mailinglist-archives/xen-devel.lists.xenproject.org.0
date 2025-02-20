Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE2BA3D2E5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 09:15:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893576.1302446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl1ht-0000d5-Eu; Thu, 20 Feb 2025 08:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893576.1302446; Thu, 20 Feb 2025 08:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl1ht-0000bH-C7; Thu, 20 Feb 2025 08:14:53 +0000
Received: by outflank-mailman (input) for mailman id 893576;
 Thu, 20 Feb 2025 08:14:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tl1hr-0000bB-N5
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 08:14:51 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0f980e3-ef62-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 09:14:49 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5dee1626093so3319291a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 00:14:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ded69e7c33sm10737600a12.61.2025.02.20.00.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 00:14:48 -0800 (PST)
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
X-Inumbo-ID: c0f980e3-ef62-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740039289; x=1740644089; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3emZ8eNZ8MgfJpd+3CiCPoJpZrYpkJIiwn9YLKuhxVc=;
        b=P/q4RZutKFBD3HVkVwoX1t7Zkivn1v3cTNIOQikTyaJCbCD3jOgmmUZW9qt7qxhiNs
         9lb0QdKb27sAXzAhdDYXwbsGcKM3eLhUoVNv3pohGKtmguL416FLQHS/cdeD4O6QLFs4
         JBkcU/higqVp33TP71qv8J517CjBxjNl2Rwb2yzyBK02E2mdkVkwlQaUpwBFO6mZVxtX
         R7FEqg/StnoqpzbOU5rlsF56wUu08Xv6QqVMyjtzW9mDkQKSn4f/OiBT1SZ0USNfdOEt
         Hk94nhSPlhCGVp+ORWTbVA2T+OhMTCC8hhcqsUcpBZ3KUMntikf1Kojdw48crWKrHTdR
         6PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740039289; x=1740644089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3emZ8eNZ8MgfJpd+3CiCPoJpZrYpkJIiwn9YLKuhxVc=;
        b=k/q1VkCoCjx2dn4l39umw4FXpIkq5MH7Q+QN96JddTzKJ+l5GuREaaiymBwhlUC9fD
         HETVnmpee73chcWULk3p4tG1kNBb0MIxmKWE4AUp3RMJMPVGVn3pAlJ6oU5hpvcgrjac
         BwyIAW7eAxJM+fOjAtPqdWAYeD+leHkAiZK7+79hCJW9+/vh9VvXEJjBZBQN3xO/labT
         rPCYzByjiNB6VQD6y42sv4IlPdN71Lo0Sgh86Cc2SoIDbw5qU1iPqxSbLrjlHxzc+cp7
         5y7BRoFy0C9SSQ6a+ZztO0ul7j+1gWbhEthrBgSOMzoqfq3cUlh/l4XMnOBmOhFxjwe9
         kH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXk69wMKnNOAS42iUsgrzV6wOCGerB4nuAspaAUaMI7RcPH9r5TAjow/tlom9uPjySlzu6lkPw07D8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+bNCrGaiz8b5pm5V8cATADqsloNTCSE8/MzFgCzeyD44WORDs
	7O4NDaIaSmVvtZBPGMJC9VhCmVRkKCZKNUkYOFeJvRvm7vMyIiPIu0hd/fhXtg==
X-Gm-Gg: ASbGncsuzaBOVwx1dWn/smeIrnQbnVYaFoSE7IRcDyekgt7AoWFCalVxFE3rCWk8oJL
	Zbgk+FXXMof9eGQn3M7tUI3Uaf/bu1EIeh6jdbQrjKBWC/byrhtA/HSaSatNQCmbA6pvJ7lO3x4
	IdgyUql5guoYzIRiu3qwcRNp7dOYsp623AvAwkhs09mxSUc2+6SbThrA/2kUFJxFuWSicsSPZYP
	osLa/gBL46zMVNere88hmdqkNGt9xqEM5KyEGSe9YDzG18nt/Wa80A9cZlQ1fkE+T6WMpg9Mn+Q
	INkJuZjNvBoiNx3c8PhRfuR/RC5uwnp3QMusxOcfXjnpfoO0C52AhG4v4+uEhg8bu+lmm8zgCYM
	9
X-Google-Smtp-Source: AGHT+IFiN24v+PAFmIsXWezIAMEVVo/AZvdp9o2n2+Ur9Nxxn8M5YAnc65xZp2HqG1z6kEcPRuGayQ==
X-Received: by 2002:a17:907:8e08:b0:abb:af33:d0ac with SMTP id a640c23a62f3a-abbeddd8462mr226121066b.16.1740039289204;
        Thu, 20 Feb 2025 00:14:49 -0800 (PST)
Message-ID: <be2314bd-d212-4b9b-a50c-1b86b42ab861@suse.com>
Date: Thu, 20 Feb 2025 09:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xl create/save throwing errors
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2025 17:04, Petr Beneš wrote:
> Hello,
> 
> I have a script that's supposed to start a couple of (Windows 10) VMs
> in parallel, wait until they boot and connect to the network, and then
> create a live snapshot.
> 
> VMs are created by simple "xl create vm.cfg" and the live snapshot is
> created by "xl save win10-18362-NNN path/to/state".
> 
> I have noticed, that "xl create" occasionally throws this line:
> ```
> libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: qemu
> command-line probe already exited
> ```
> 
> First I thought it's related to the fact that multiple "xl create"
> commands are being run in parallel, but to my surprise, this line
> sometimes occurs even for standalone "xl create" commands.
> 
> However, when "xl save" is being executed in parallel, I'm very often
> met with output similar to this:
> ```
> Saving to win10-18362-102/state new xl format (info 0x3/0x0/1780)
> xc: info: Saving domain 193, type x86 HVM
> Saving to win10-18362-101/state new xl format (info 0x3/0x0/1780)
> xc: info: Saving domain 192, type x86 HVM
> Saving to win10-18362-104/state new xl format (info 0x3/0x0/1780)
> xc: info: Saving domain 194, type x86 HVM
> xc: error: save callback suspend() failed: 0: Internal error
> xc: error: Save failed (0 = Success): Internal error
> libxl: error: libxl_stream_write.c:347:libxl__xc_domain_save_done:
> Domain 192:saving domain: domain responded to suspend request: Success
> Failed to save domain, resuming domain
> xc: error: save callback suspend() failed: 0: Internal error
> xc: error: Save failed (0 = Success): Internal error
> xc: error: Dom 192 not suspended: (shutdown 4, reason 3): Internal error
> libxl: error: libxl_dom_suspend.c:661:domain_resume_done: Domain
> 192:xc_domain_resume failed: Invalid argument
> libxl: error: libxl_stream_write.c:347:libxl__xc_domain_save_done:
> Domain 194:saving domain: domain responded to suspend request: Success
> Failed to save domain, resuming domain
> xc: error: Dom 194 not suspended: (shutdown 4, reason 3): Internal error
> libxl: error: libxl_dom_suspend.c:661:domain_resume_done: Domain
> 194:xc_domain_resume failed: Invalid argument
> xc: Frames: 1044480/1044480  100%: Frames: 52224/1044480    5%
> ```

Just one thing - to (hopefully) get a better understanding of the origin of
those errors, you may want to increase verbosity of the "xl save", e.g.
"xl -vvv save".

Jan

