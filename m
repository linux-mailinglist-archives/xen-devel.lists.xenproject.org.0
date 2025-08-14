Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C017EB26F91
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 21:16:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082403.1442254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umdQz-0001DL-0Y; Thu, 14 Aug 2025 19:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082403.1442254; Thu, 14 Aug 2025 19:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umdQy-0001Ar-Tf; Thu, 14 Aug 2025 19:16:20 +0000
Received: by outflank-mailman (input) for mailman id 1082403;
 Thu, 14 Aug 2025 19:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umdQx-0001Al-Tz
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 19:16:19 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 254eb874-7943-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 21:16:14 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a20c51c40so440485e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 12:16:14 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c71068csm30438435e9.29.2025.08.14.12.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 12:16:13 -0700 (PDT)
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
X-Inumbo-ID: 254eb874-7943-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755198974; x=1755803774; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fvSxKhl9hrp5VRKuGPAXqBCjiWHN7luQcrTvacgPQqY=;
        b=qHhXRRR/X7TSkMsT4Gv8nFEBjS+jsgccK8ROb19nfuX+VtxE5GaJcvyZ7R8FjVunoL
         pzlUjPnJyqpW6dU4LO6UmXkelGqWYHny7xTXLdbQYf2Nn7ShDKZpD8TFApb82KExsL5B
         FzhP8rTUqa7+9SoFaVhKSUOAG0a99b4LIhaso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755198974; x=1755803774;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvSxKhl9hrp5VRKuGPAXqBCjiWHN7luQcrTvacgPQqY=;
        b=Z2y9dJIsy0bnk5dgGXXQP39HUpoZAuI/khUikeUvevyXPbD/xTgWKk9uTgoyrcVltD
         LMnXyt/zsWHPdbUuZk5QJhrY6ehUbx222QsBnY/sznkOq2SRYszVx6f8TVrfudr4QC3N
         LZ4Mw5AqNtHUAHdVfC9MrHQjvKdmZND/4h51msFWQvess8OMfhEudGbtAm9wVQuSIdbu
         uRopHZD2nLAGSmT/biE0xK5gPDGF/c+b6MhM1IubDuVAiFPacShXhoO5BaFUCXwsq0mb
         JdTpipJIkHMt8v57yV68NpYtXnQLvfhT5cMRMxq2F+P10bbbE3VUv/Qiz4bUXy5Utrqu
         3v9g==
X-Gm-Message-State: AOJu0YwTA4yIQ0yqqeyeUDO++WIeUPQh+p7W2ucns8uUA3BjXHh3fkML
	WSJBtSx7KYWulGcrvGUyxHZHPLmdL/j8lBwk8LBAtSzkdLMlHHZzsZWOtGWoFb2Zc5g=
X-Gm-Gg: ASbGncu0gADb+yuGLv/qOBxeZLy2+qLX6tnB0E72qUm03viiqMtoGBbBDMMXonyT5e9
	D1B2RmljcWkkKbP9eehjeW08kBpKpVt5ro60VcBb8V40GEMJjnT7SB6rcDvP/fqYPSmUlgfjCpK
	nzovF9/MvWiH37DSdknT5BazFKoSdsR1HHjAVEydKe6H0ILmPEE8+6d2US23ubB63S3Sh31blhb
	eWuSOxcXHX9S0ijs0iTxI3XZFPUTMdPYRjabi/gXx18M9pvRlRcqQjoiCZh0CzD64y7YI1yQT6i
	qOWhAKb8DPH4ZEPuj8ZdPL3yZcC4G321zMX9zGuA/Vrt31aBMdsuv20RsgRyAULzmKk+nIWsXXq
	2Nm36Uw2WXDE1bN3aIENvXYsQVj/774C2MEExkaFVvgHunX9yfL0dldm90JLNZWFplMw6
X-Google-Smtp-Source: AGHT+IFjg6gAE/jKm3eUDld0/P6lacsCR5feUoRad8CD8Rd0VzZlYm3En+Itr4OhbZgOrMT/QRseKQ==
X-Received: by 2002:a05:600c:4fc7:b0:455:f59e:fdaa with SMTP id 5b1f17b1804b1-45a20c11693mr1182905e9.21.1755198973894;
        Thu, 14 Aug 2025 12:16:13 -0700 (PDT)
Message-ID: <8adbd032-9da2-481d-8d98-30c9a605ec46@citrix.com>
Date: Thu, 14 Aug 2025 20:16:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/22] x86/traps: Introduce opt_fred
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-16-andrew.cooper3@citrix.com>
 <0a6b6fce-2cc8-4933-8703-399e4a4fdad6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0a6b6fce-2cc8-4933-8703-399e4a4fdad6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 2:30 pm, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> ... disabled by default.  There is a lot of work before FRED can be enabled by
>> default.
>>
>> One part of FRED, the LKGS (Load Kernel GS) instruction, is enumerated
>> separately but is mandatory as FRED disallows the SWAPGS instruction.
>> Therefore, both CPUID bits must be checked.
> See my (further) reply to patch 13 - I think FRED simply ought to depend on
> LKGS.
>
>> @@ -20,6 +22,9 @@ unsigned int __ro_after_init ler_msr;
>>  static bool __initdata opt_ler;
>>  boolean_param("ler", opt_ler);
>>  
>> +int8_t __ro_after_init opt_fred = 0; /* -1 when supported. */
> I'm a little puzzled by the comment? DYM "once default-enabled"?

Well, I have this temporary patch
https://gitlab.com/xen-project/hardware/xen-staging/-/commit/70ef6a1178a411a29b7b1745a1112e267ffb6245
that will turn into a real patch when we enable FRED by default.

As much as anything else, it was just a TODO.


>  Then ...
>
>> @@ -305,6 +310,32 @@ void __init traps_init(void)
>>      /* Replace early pagefault with real pagefault handler. */
>>      _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
>>  
>> +    if ( !cpu_has_fred || !cpu_has_lkgs )
>> +    {
>> +        if ( opt_fred )
> ... this won't work anymore once the initializer is changed.

Hmm yes.  That wants to be an == 1 check.  Fixed.

>
>> +            printk(XENLOG_WARNING "FRED not available, ignoring\n");
>> +        opt_fred = false;
> Better use 0 here?
>
>> +    }
>> +
>> +    if ( opt_fred == -1 )
>> +        opt_fred = !pv_shim;
> Imo it would be better to have the initializer be -1 right away, and comment
> out the "!pv_shim" here, until we mean it to be default-enabled.

It cannot be -1, or Xen will fail spectacularly on any FRED capable
hardware.  Setting to -1 is the point at which FRED becomes security
supported.

>
>> +    if ( opt_fred )
>> +    {
>> +#ifdef CONFIG_PV32
>> +        if ( opt_pv32 )
>> +        {
>> +            opt_pv32 = 0;
>> +            printk(XENLOG_INFO "Disabling PV32 due to FRED\n");
>> +        }
>> +#endif
>> +        printk("Using FRED event delivery\n");
>> +    }
>> +    else
>> +    {
>> +        printk("Using IDT event delivery\n");
>> +    }
> Could I talk you into omitting the figure braces here? Hmm, or perhaps you
> mean to later move code here.

Indeed, patch 22.

~Andrew

