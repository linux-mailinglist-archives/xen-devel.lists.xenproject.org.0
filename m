Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F352909244
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 20:27:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740864.1147973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIBd9-0004gY-Bi; Fri, 14 Jun 2024 18:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740864.1147973; Fri, 14 Jun 2024 18:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIBd9-0004db-8y; Fri, 14 Jun 2024 18:26:31 +0000
Received: by outflank-mailman (input) for mailman id 740864;
 Fri, 14 Jun 2024 18:26:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/js=NQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sIBd7-0004dV-98
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 18:26:29 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cba849c-2a7b-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 20:26:27 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6f3efa1cc7so608747966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 11:26:27 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f57ed951dsm203075166b.196.2024.06.14.11.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 11:26:26 -0700 (PDT)
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
X-Inumbo-ID: 9cba849c-2a7b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718389587; x=1718994387; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/vhdDHCYDXHupSWeUUjAzlXBqri4hWTvUpp5oPp4bJk=;
        b=GsQ9ZL6lFXSJuT/rB3uFyuMmQYfnfeLAJ8746kji5eoLq0OuAmwoQi2Fl3B1NZo4Ed
         Qf4jIhPC8o0fMzVl3uocB7WW4CJbbw0eCtUd3xsdZfkvyqVDESJNPZs3EKbHSHRXYtyZ
         PRwDGiotfnNatzDSjW1LcwWDh5pDTbjoglECY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718389587; x=1718994387;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vhdDHCYDXHupSWeUUjAzlXBqri4hWTvUpp5oPp4bJk=;
        b=DYoWl4jDiUmaDaDDgAkuRvtEQPodoonSyqXYKJS0ZSxdkYTV67dyePgO6pWXI7LOSm
         VA8kT+MPiH5MJOZZHUGhXX+lysDXdhL5HZtYoLHdOjUiVeh4sJXyqagNm2E0lURFsdAR
         ZfFbl1NmnhG70oz4Ns4UfmE9YRFHBJ7gdwq0NNAvMgMl2MWx6rJeh5HK7m4lqlwOXfcB
         79Z7xAKXPFzZ4yGb5KsyF254/gK22R8dwtOlcjsuCnxhM84R71CWlMYn9nXp33Go2VKp
         EfboWCXjTUCFVdN4rfaBRcJn9eAgkvkLjZ0tYwO6nRRtQaaII9C9ngm6TFiIjRfXF7ID
         kzQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi2vV3i6rTGaC0OASzTt1nLV4JCYjuZNXQJ1bzTtQBC8r4CekyUvs1trX/oXq5tDwcV9Cccea72ZvrjddfQdouqCdAqLzdY5LjnXmmt2A=
X-Gm-Message-State: AOJu0YyS1XLdR2TKDrtCDCcqruqaGNzze+dDMQkRLjIIGyxwg/1Ca+Y3
	CXnk6PTXR43PE7KoZ/kF4fLwckJx7yfLiQhpnwvMLVEzeCzrkhOpumSo8WoBzEg=
X-Google-Smtp-Source: AGHT+IGjw7iJhFWbp2AFZ8V+x8TxhiqugyqAYidc6yx3dW7aHYKqtSgj0VtseWAlQZYwFStJxtWd+g==
X-Received: by 2002:a17:906:1d03:b0:a6f:2380:3a32 with SMTP id a640c23a62f3a-a6f52415714mr458483166b.21.1718389586272;
        Fri, 14 Jun 2024 11:26:26 -0700 (PDT)
Message-ID: <6b4ed926-8934-4660-98c7-1856d0c90878@citrix.com>
Date: Fri, 14 Jun 2024 19:26:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] x86/boot: Collect the Raw CPU Policy earlier on boot
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-4-andrew.cooper3@citrix.com>
 <8245f0ce-2964-4ecb-a31d-3e182a6d3e0b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8245f0ce-2964-4ecb-a31d-3e182a6d3e0b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2024 4:44 pm, Jan Beulich wrote:
> On 23.05.2024 13:16, Andrew Cooper wrote:
>> This is a tangle, but it's a small step in the right direction.
>>
>> xstate_init() is shortly going to want data from the Raw policy.
>> calculate_raw_cpu_policy() is sufficiently separate from the other policies to
>> be safe to do.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Would you mind taking a look at
> https://lists.xen.org/archives/html/xen-devel/2021-04/msg01335.html
> to make clear (to me at least) in how far we can perhaps find common grounds
> on what wants doing when? (Of course the local version I have has been
> constantly re-based, so some of the function names would have changed from
> what's visible there.)

That's been covered several times, at least in part.

I want to eventually move the host policy too, but I'm not willing to
compound the mess we've currently got just to do it earlier.  It's just
creating even more obstacles to doing it nicely.

Nothing in this series needs (or indeed should) use the host policy.

The same is true of your AMX series.  You're (correctly) breaking the
uniform allocation size and (when policy selection is ordered WRT vCPU
creation, as discussed) it becomes solely depend on the guest policy.

xsave.c really has no legitimate use for the host policy once the
uniform allocation size aspect has gone away.


>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -845,7 +845,6 @@ static void __init calculate_hvm_def_policy(void)
>>  
>>  void __init init_guest_cpu_policies(void)
>>  {
>> -    calculate_raw_cpu_policy();
>>      calculate_host_policy();
>>  
>>      if ( IS_ENABLED(CONFIG_PV) )
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1888,7 +1888,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>  
>>      tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
>>  
>> -    identify_cpu(&boot_cpu_data);
>> +    calculate_raw_cpu_policy(); /* Needs microcode.  No other dependenices. */
>> +
>> +    identify_cpu(&boot_cpu_data); /* Needs microcode and raw policy. */
> You don't introduce any dependency on raw policy here, and there cannot possibly
> have been such a dependency before (unless there was a bug somewhere). Therefore
> I consider this latter comment misleading at this point.

It's made true by the next patch, and I'm not included to split the
comment across two patches which are going to be committed together in a
unit.

~Andrew

