Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67FBA460A5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 14:23:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896603.1305348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHNi-0004Ok-Od; Wed, 26 Feb 2025 13:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896603.1305348; Wed, 26 Feb 2025 13:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHNi-0004NJ-Lm; Wed, 26 Feb 2025 13:23:22 +0000
Received: by outflank-mailman (input) for mailman id 896603;
 Wed, 26 Feb 2025 13:23:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnHNi-0004Mx-2C
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 13:23:22 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d91796e1-f444-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 14:23:21 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-439a4fc2d65so66632335e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 05:23:21 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd867144sm5561199f8f.7.2025.02.26.05.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 05:23:18 -0800 (PST)
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
X-Inumbo-ID: d91796e1-f444-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740576200; x=1741181000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bqDzVE+BYi2GfF4HFwczh1P+VbatSsjcfe8XKJZUCy0=;
        b=n1HtcwbsfWZBA4toelMn7PrP0KhSNHO6mqGIF3NrnAy9O2wqbo8IfeO0xh1HoPRxUV
         M18oJyzRsPFsCTU/eRQGWf3X1rQ2KEHF7zbOcrLGDl9lkRE/+wr1GVeGS1Dj0TMHhzmA
         fTkDgmFzXfNu+BWcunPBl6hkSAGFH3ahJS/5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740576200; x=1741181000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqDzVE+BYi2GfF4HFwczh1P+VbatSsjcfe8XKJZUCy0=;
        b=euo+KNGhMG0VmO15O22tXMC9FLP2L9sXaVF4Ei0LfrT/21DvFgYC4OJW5JKM4cMhPp
         0qqdsTFXru4GTTpRVyokS1GektUpXO8Oa5R0gye5n+6qMf7k+lu97eq+4YBuAMVBx6WV
         6gTwS1z7qvYI4wIqnTC9infJYiWH5jYgk3OXYpgXeVgLfpkqIOufBzIkXO728HJdgTcJ
         kOMbNNbtkJ5Z9K+XaENCf16GaAvphqfewv6pGN0g6+zgE4AqlHvJozC2mogi9DQ1B4ya
         MRzNKY/YKQmgMeAy0w1DRoc29o4KC42lk6QbXaFiq73iNVVevySNwi3BGUO3Prw1rxwH
         LtPw==
X-Forwarded-Encrypted: i=1; AJvYcCUPh75pAZYsxDlRYzdPWYZrqcuLZS6veszBco2BYgYMk7mKyXgSpqOZzOIVE5JMYXEf13xyASF7bM4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiZRxAbSikaA4tdLmTj4Mi4aF5m9TB7uS+R9CJGeHDzrw/EhPU
	56z2RZeLP2cPcEBo9G92/X0v76iDepSsOyAhUtLx5OhqsfDy4d49lUQ+C3QxazM=
X-Gm-Gg: ASbGncv1xixvIARBK8naiEdzoU26KwMLPKZi5/3xy46spO/PXSe7KkN+bz90827/JN3
	tCFaK5luiIHt9TDroEXLf5jZDVVQ5zudjsLUKt7pzdimgLdfLNuSx3eqvdMqE6ZV72ypOlc+TZN
	YVmdrnnr72PbgCk95GXmbGtdTuL67V3MlPtjzZD6i3iddk4+yCQAo1Wdt00KY/XwsHMfrZd/uKp
	TTvpnPTpRr/jZ3ZKQ05uUr388gmJAQAI3nP1dzqsJJaH+CPWk0ip/N8DWIWml20xN1zB934aZlX
	5RN2EgKocR16tAp+KQfiAZYNqEQxd87q6pLGcyLgSdj1Qjt7afNVqgYvUCv3mRw8ew==
X-Google-Smtp-Source: AGHT+IFi10izjorsvu4ASU/hs3vwIV6sEf9qf6FJTaszuCW2PuWrUYJYgvxm2OBOkRR65nx8aL/14A==
X-Received: by 2002:a5d:6d0b:0:b0:38d:c56e:f1dd with SMTP id ffacd0b85a97d-390cc6319e6mr9143432f8f.38.1740576198957;
        Wed, 26 Feb 2025 05:23:18 -0800 (PST)
Message-ID: <38e39c86-e9a3-4eea-a53b-b6dd0e1e7150@citrix.com>
Date: Wed, 26 Feb 2025 13:23:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] x86/IDT: Don't rewrite bsp_idt[] at boot time
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-8-andrew.cooper3@citrix.com>
 <46bc8ff4-f33a-4736-b1c9-00dfdec554b7@suse.com>
 <f62fa004-379d-4589-b4ea-ba0f0c5c99e0@citrix.com>
 <10a1901d-bddc-4452-8ff2-2586f18215e0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <10a1901d-bddc-4452-8ff2-2586f18215e0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/02/2025 1:18 pm, Jan Beulich wrote:
> On 26.02.2025 13:53, Andrew Cooper wrote:
>> On 26/02/2025 12:48 pm, Jan Beulich wrote:
>>> On 24.02.2025 17:05, Andrew Cooper wrote:
>>>> Now that bsp_idt[] is constructed at build time, we do not need to manually
>>>> initialise it in init_idt_traps() and trap_init().
>>>>
>>>> The only edit needed to the bsp_idt[] is to switch from the early #PF handler
>>>> to the normal one, and this can be done using _update_gate_addr_lower() as we
>>>> do on the kexec path for NMI and #MC.
>>>>
>>>> This in turn allows us to drop set_{intr,swint}_gate() and the underlying
>>>> infrastructure.  It also lets us drop autogen_entrypoints[] and that
>>>> underlying infrastructure.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> Thanks.
>>
>>> The switching around of the #PF handler is of course getting in the way of
>>> moving bsp_idt[] into .rodata.
>> {en,dis}able_each_ist() edits it at runtime too.
> Oh, I had actually meant to add a condition upon CONFIG_AMD=n. The fields
> could be set at build time as well, couldn't they?

They're edited in the kexec and shutdown paths too.

Furthermore, (sane) FRED setup is going to rely on IST being disabled
initially.

~Andrew

