Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE6D7A0EA5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 22:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602691.939417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgsX0-0008IX-VR; Thu, 14 Sep 2023 20:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602691.939417; Thu, 14 Sep 2023 20:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgsX0-0008GK-SW; Thu, 14 Sep 2023 20:01:42 +0000
Received: by outflank-mailman (input) for mailman id 602691;
 Thu, 14 Sep 2023 20:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgsWz-0008GD-C2
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 20:01:41 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 842396e6-5339-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 22:01:39 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31dcf18f9e2so1284825f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 13:01:39 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t3-20020a05600001c300b003143b14848dsm2534643wrx.102.2023.09.14.13.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 13:01:38 -0700 (PDT)
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
X-Inumbo-ID: 842396e6-5339-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694721698; x=1695326498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uT84xhqzCFx4hVoWnPZzHjqOo1Q9Jzf191GjeVA1KD8=;
        b=fkbeqc2bFmkSIZqI63KvDMvoFly1fef4NgvUQc0pLCKHHWTIPbeehILH/Mn57Qvv5B
         SoXaLNMZFPhyMlJmKZtVxZG6A/syyzmJMbO7zScJ/CBuEGE8rhrVN96nmcey3dBsGH8y
         RQqdvWRLFKxB6C8TUYIuotKNLBmcFQN8iviMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694721698; x=1695326498;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uT84xhqzCFx4hVoWnPZzHjqOo1Q9Jzf191GjeVA1KD8=;
        b=I4HkjImKtoZ0xgnMhJ43Ykg/41gm0u7vpu1ud/1ceW+VT5ALWCSDsZFJBlL9FaikY+
         WQ2ityZYrp4LA/5tAUkmCtXlaYYLfklkOak4WIaZYX2MWEsiyrISk+Tre+sUyXBdWCPa
         zYRWEt7+Ruyezh1uc93AYQkq5CZVmV5emIONrlNZqSrYADIKJa9BFS5jLDSuAXRQd35N
         yHeuvoAQ88+SChAzTYsr5BDBAvE0ky0Xcufz6VWRxK4AWH1MmUeZBxALNfNLgh6bOCUG
         5uKyJkBJtCbqW8ThNvNePCIiTrTiye1EkKi/3ELhPsVkqQxD80B+OBOdsSR75pKW2LjZ
         2mqg==
X-Gm-Message-State: AOJu0Yyy61MTqBaEP2BCajI8bbvKQqxDhB4nShatjmGR69utoBrLl5Vv
	u0A03LuK1m8YqXl9EtdKRbjQgg==
X-Google-Smtp-Source: AGHT+IH1mhYAh3tiLd3UyHALgPo5AZe62QU7CxmZTtetKa7eHOxgsuH0EK3lk8Snkaw1OLTjcrspZA==
X-Received: by 2002:a5d:51ca:0:b0:31d:da10:e477 with SMTP id n10-20020a5d51ca000000b0031dda10e477mr5462223wrv.8.1694721698652;
        Thu, 14 Sep 2023 13:01:38 -0700 (PDT)
Message-ID: <309c52fb-ac30-c895-bc39-a3c1a7eaa9e1@citrix.com>
Date: Thu, 14 Sep 2023 21:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 8/8] x86/spec-ctrl: Mitigate the Zen1 DIV leakge
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-9-andrew.cooper3@citrix.com>
 <f60a8b98-0358-6dbf-5c60-ff0cfbc715a5@suse.com>
In-Reply-To: <f60a8b98-0358-6dbf-5c60-ff0cfbc715a5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 11:52 am, Jan Beulich wrote:
> On 13.09.2023 22:27, Andrew Cooper wrote:
>> @@ -378,6 +392,8 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>>      verw STACK_CPUINFO_FIELD(verw_sel)(%r14)
>>  .L\@_verw_skip:
>>  
>> +    ALTERNATIVE "", DO_SPEC_CTRL_DIV, X86_FEATURE_SC_DIV
>> +
>>  .L\@_skip_ist_exit:
>>  .endm
> While we did talk about using alternatives patching here, I'm now in
> doubt again, in particular because the rest of the macro uses
> conditionals anyway, and the code here is bypassed for non-IST exits. If
> you're sure you want to stick to this, then I think some justification
> wants adding to the description.

Patching IST paths is safe - we drop into NMI context, and rewrite
before starting APs.

VERW needs to remain a conditional because of the FB_CLEAR/MMIO paths. 
MSR_SPEC_CTRL is going to turn back into being an alternative when I
make eIBRS work sensibly.

>> @@ -955,6 +960,40 @@ static void __init srso_calculations(bool hw_smt_enabled)
>>          setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
>>  }
>>  
>> +/*
>> + * Div leakage is specific to the AMD Zen1 microarchitecure.  Use STIBP as a
>> + * heuristic to select between Zen1 and Zen2 uarches.
>> + */
>> +static bool __init has_div_vuln(void)
>> +{
>> +    if ( !(boot_cpu_data.x86_vendor &
>> +           (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>> +        return false;
>> +
>> +    if ( (boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
>> +         !boot_cpu_has(X86_FEATURE_AMD_STIBP) )
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>> +static void __init div_calculations(bool hw_smt_enabled)
>> +{
>> +    bool cpu_bug_div = has_div_vuln();
>> +
>> +    if ( opt_div_scrub == -1 )
>> +        opt_div_scrub = cpu_bug_div;
>> +
>> +    if ( opt_div_scrub )
>> +        setup_force_cpu_cap(X86_FEATURE_SC_DIV);
> Isn't this only lowering performance (even if just slightly) when SMT is
> enabled, without gaining us very much?

It is consistent with how MDS/L1TF/others work, which is important.

And it does protect against a single-threaded attacker, for what that's
worth in practice.

>
>> +    if ( opt_smt == -1 && cpu_bug_div && hw_smt_enabled )
>> +        warning_add(
>> +            "Booted on leaky-DIV hardware with SMT/Hyperthreading\n"
>> +            "enabled.  Please assess your configuration and choose an\n"
>> +            "explicit 'smt=<bool>' setting.  See XSA-439.\n");
>> +}
> What about us running virtualized? The topology we see may not be that
> of the underlying hardware. Maybe check_smt_enabled() should return
> true when cpu_has_hypervisor is true? (In-guest decisions would
> similarly need to assume that they may be running on SMT-enabled
> hardware, despite not themselves seeing this to be the case.)
>
> Since we can't know for sure when running virtualized, that's a case
> where I would consider it useful to enable the workaround nevertheless
> (perhaps accompanied by a warning that whether this helps depends on
> the next level hypervisor).

Honestly, SMT's not relevant.  If you're virtualised, you've lost
irrespective.

There is no FOO_NO bit, so there's no possible way a VM can figure out
if it is current on, or may subsequently move to, an impacted processor.

~Andrew

