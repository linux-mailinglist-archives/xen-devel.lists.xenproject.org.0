Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61868AD54EA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 14:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011653.1390110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPKCV-0005HK-RN; Wed, 11 Jun 2025 12:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011653.1390110; Wed, 11 Jun 2025 12:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPKCV-0005FO-OT; Wed, 11 Jun 2025 12:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1011653;
 Wed, 11 Jun 2025 12:05:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPKCU-0005FH-9T
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 12:05:02 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c577902-46bc-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 14:04:59 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso2629574f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 05:04:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236035068ddsm85373455ad.237.2025.06.11.05.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 05:04:58 -0700 (PDT)
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
X-Inumbo-ID: 4c577902-46bc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749643499; x=1750248299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gG3/wVvXuRIb3Dz1IWYyzbvm/c7Zf2sXEz2pG6TVmS4=;
        b=Uuab6CQQf2n1wJl61BbpboQ30pL6EEUj6/OgdV1/cYKQXRzHiweBfobO9qe42glTUd
         yxZOW6w6B5z3ETjQ155eqGhfjXqsSozY/dmPi7QCgwTCeIr0+6Dt7pBvoyiK3TAS2pvj
         +V9ztDJGXiLbbNy20FAU7Jc3ouJsZanuy/h05iSGzs+YI/Zr41HQpIkdEAPAAwwuuAmh
         qi/NdbsrGGAEmeUy1PdadXao2yvIY8M3jtwnE3DT2B2hAw05Hem6l4oYKaVufNHE9g8a
         HvJc8eFRQmD2PAJP3VRWbItNKg012F1Dl7lk8xx2X83+9e+LMGzpWJjtOXn4YeVgU4SM
         mRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749643499; x=1750248299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG3/wVvXuRIb3Dz1IWYyzbvm/c7Zf2sXEz2pG6TVmS4=;
        b=eaqEZeLm39w3IGkKN5eiH1FA3yVYVvaotGZ5rpmUunOJhxCurbcdVWGNKPPvK+ux4z
         fVK69RfFkfTRN0VG0bphQjQ4/VAyFBp/F9pa/oI3BFWvVYredISJJdAv3aeanLSHqf9I
         WHX41L+d4A8Nd4NLfnFUGzwzrGz0mhDZSHcV/28Q+71hF0Fui3ppyEkaYpbFSuQiG7X2
         4+nvw7Pi4FuMfJOrTxsqpSNYYPpvG3/Cm5skagc0M3oAvY9VmDl9v//1NWPgcuQm9APd
         159iTROGNGY8dbZZbLiSyz3O04sVbmiDxKBRuNX5aZK2pV2vSmhTe+PWCYeW4Koza5NW
         AYMA==
X-Forwarded-Encrypted: i=1; AJvYcCVgHBcC4DYppvnhyQkkyN2W5CskGkrJ/DrO269WysDtrK1qIRYS4qxILMTKP0Wju4BIsBrdlbHsFeQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+kBgOVjgcydSw2yjVoQtOBz4HmdRMRZypkFbOqZkNTEyUvsUt
	+Q3hS2jzOSolypZhj/8kHljjkelwXYGZQai2qJPU3G6yNDgg54gpTfzsOtESheeqAQ==
X-Gm-Gg: ASbGncvpZgNymJSH4DaavSfIpIdb5+aw2CSzotG9XY1iMPUNkapt2URmrB5lnvXqzzJ
	F7r+abre98+WyRyK3lsZ6g3AknEIU16QeQzoYm1s66+OIuAK6Y9YgcDWnr1EmPHH+GBpyEdgLAF
	0P+Eb2u3Z44WJhq3+/WVIWxcoG3q2KC1DBXsOILbRZiktMxDnA4kdw/mJmLGvKYgGeR9daoUK9w
	xx9MgFzHWBp/A9EbffN2XVCTzIsd/bcGmHAi4duRNpd1RqSDB58tHkEXhnGL25jshVQGtm5iDVf
	OP6i06vMkt/gxDI4GwAlInUQb+ZHSxfHQDmRFWo3nHBLMOBjAOCX/59UUzPLGAqCbnn24EX/yb7
	siaA27CryDJ9t9TlwzuhNaHhezA3IyIXZuOSDge59hImWreQ=
X-Google-Smtp-Source: AGHT+IHQJw46Go1m0PZ6JTmXIF5NLZQx+JQ8ujfMtmaSIm+u5Xn2padnnIgXgE76I+kj8Lx3ni+qsw==
X-Received: by 2002:a5d:64c9:0:b0:3a3:652d:1638 with SMTP id ffacd0b85a97d-3a5586e9619mr2400119f8f.48.1749643499155;
        Wed, 11 Jun 2025 05:04:59 -0700 (PDT)
Message-ID: <ca15869e-06fd-481e-a0fe-406283e45c09@suse.com>
Date: Wed, 11 Jun 2025 14:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] vVMX: operand size in decode_vmx_inst()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
 <14bb65f3-5b6e-4b12-8914-25528efee557@suse.com>
 <8d86577e-9ad4-46c3-b6ef-c59e471031d0@citrix.com>
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
In-Reply-To: <8d86577e-9ad4-46c3-b6ef-c59e471031d0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 13:32, Andrew Cooper wrote:
> On 11/06/2025 11:44 am, Jan Beulich wrote:
>> Address size is entirely irrelevant to operand size determination; For
>> VMREAD and VMWRITE outside of 64-bit mode operand size is 32 bits, while
>> in 64-bit mode it's (naturally) 64 bits. For all other insns it's 64
>> bits (a physical address) or 128 bits (INVEPT, INVVPID). To limit the
>> amount of change here, keep the latter at reading only 64 bits from
>> guest space.
>>
>> Fixes: 09fce8016596 ("Nested VMX: Emulation of guest VMXON/OFF instruction")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Beyond the wrong operand handling for INVEPT and INVVPID, the latter
>> also doesn't even have the part read checked to have bits 16 and above
>> all clear.
> 
> There are more bugs than these.
> 
> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/x86-next-euan
> 
> Judging by the choice of branch name, I think I'd collected those
> pending the re-opening of a dev window, and apparently forgotten.
> 
> At this point I don't think we want to take the branch as is (especially
> as I've forgotten why it wasn't taken before), but I think there is some
> salvageable work in there, beyond the changes in this patch.

Interesting. Apparently it has been too long since this was posted, as I
don't recall it at all. However, I'm not convinced everything's right
there. E.g. in "x86/vvmx: Use correct sizes when reading operands" there
is this hunk:

@@ -427,6 +427,7 @@ static int decode_vmx_inst(struct cpu_user_regs *regs,
     struct segment_register seg;
     unsigned long base, index, seg_base, disp, offset;
     int scale, size;
+    unsigned int bytes = vmx_guest_x86_mode(v);
 
     __vmread(VMX_INSTRUCTION_INFO, &offset);
     info.word = offset;

Which is hardly correct for 16-bit protected mode. INVEPT and INVVPID
handling also isn't moving to 128-bit operands, despite what the title
suggests. The commit message wrongly claims the upper halves don't need
to be read.

Jan

