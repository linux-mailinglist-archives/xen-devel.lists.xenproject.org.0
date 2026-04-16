Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEktCgbv4Gl4ngAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:15:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E240F735
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:15:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283515.1565715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNV3-00039g-RR; Thu, 16 Apr 2026 14:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283515.1565715; Thu, 16 Apr 2026 14:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNV3-00038U-OG; Thu, 16 Apr 2026 14:15:21 +0000
Received: by outflank-mailman (input) for mailman id 1283515;
 Thu, 16 Apr 2026 14:15:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDNV1-00038O-OD
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:15:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDNV1-00H8OJ-4j
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:15:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0eef5-bab6-0a2a0a5309dd-0a2a450cb5dc-10
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:15:19 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0eef6-62f1-0a2a450c0019-d155dd33c862-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:15:19 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso3236739f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 07:15:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3566b7sm14582991f8f.11.2026.04.16.07.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 07:15:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776348918; x=1776953718; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OFnnGdbS5olSi4xPKq3ybk7sImiLJiRWUv2s0W06w6o=;
        b=QVJPIACWIHzd0T/lPkNN6rQVgRymAzqZWgcwJXPM9Yx2tB91X+n6u5sIJ5WbMSSGF9
         zK+pNzxB4+m+2DK0Ybq1DXmvwlLecCdkAkLj3CwjplRxXZfkC0TwWeTYklmnfY0537U3
         SwZxUsXb0/rcfsclhospb3+6z6OlZk3fr1VG4yvhbbgaPsQqozs5uZOGZ06cbE01i4pc
         DP0LFqBk1llx0wXi9HskvcO6C7MDwXbM+GH3TuqDqdhL1kfpcrG4PtvJYDfJDXzS/0nj
         fTSVlaE6yIEoHK6ZexOduy8scuIWjSRmK4uGkRKXvS37aTNTmfd+MuK3kEVXEj4okXnS
         oP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348918; x=1776953718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFnnGdbS5olSi4xPKq3ybk7sImiLJiRWUv2s0W06w6o=;
        b=GIir6DwccGc+0Fy3rjbWZ2y75zJZFjWgGLO+52BdVToIphEqDqdmg4HBfPfoHQ73dF
         VjI1TCp1D4XT92nblHiQFNfNKfWsSXVbpniwrix7/7NH44rVDt16+Ur8ZiHNlueJjzi6
         X1BfOsAEK/+i2KrAFSHzoIK4PU8xpEQeYwHDyMarLrQy5uwV+dFP9zKf8f1BtlPc/UDB
         7oEIdkfB7yLRiMoojohkb4WwLFX4TZT2uTCuZZenZCj/gg/Uia/4FRE7GgHy53E+n54v
         Ah6VAyZWKV/7HqAnDfIMatxTLmyhQPHe8lgLgMw1clJL7Z5NtMn+YZSDm/IdiXFvw/6s
         cRMA==
X-Forwarded-Encrypted: i=1; AFNElJ8MTPhcxvBS/36cnHcaqqDeJNNyxLBC012rvpqzIZsIjQa6pHO1idfVh4B3fo7Fn2QHDw2/g3Xer2A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNsC0zwvOPNmeRZst78WwnBbjfguLzmTndrvtOdREGL19DB/Hs
	OAnjNH0eq9Prony/iZf4icdNZl42fCz7m/o0r8WG8/kvUTEfIN9vlEn5IxXHD/rOZw==
X-Gm-Gg: AeBDieumL8HEgDKSUcSFbBkDZx+sQ4XHDRS2NBfuQx38b2+0Db2UqTu/fzJEMuUIOd7
	c34OzG3iAK+kc3mCvT9pbjmxhJ4dc9A5b3AFiWEm5Lh5Lt/WhAbhtooINjDU0gTSsQXhnL+O6aJ
	L68lTT+a6kH7UuZV3vGlAut3CFJYvfa18nwS8gXJIT5YP7uV/Ecs5+hIYUsJY1Yt25TkFkMLBpG
	eMUZMI53yLS9ZI6ucDj2zoHmu2R+oPpkiBeGLAF0sDEkHXcsRKoh4af5uXLySEy7PPVboSqN3nB
	ivoatTfpKoooftG9WIVFm2T4fUvhePRqFVH3kLNcxysx2hD+tg2IUEqScmMXRVQI66onk5g6YYb
	HkFPVhBP5e5GGspDP6ZpfRLC3SE1V0s0nb2RV4qwCLKQOFYJVnAD3Qltjj6eVBbCnBCaXy6H0jy
	ZV5ArDDiAjWfvpA6E14uvPEL9+vowrQ9+w0jqfl9/HA+c/7STr2e8768IaReVap9D34fg72/DAk
	Zb+AFfqvMe3MGYVfCIqI5hZ9gz4Ccgbjy3K
X-Received: by 2002:a5d:5304:0:b0:43d:7783:c67e with SMTP id ffacd0b85a97d-43d7783c7f7mr17590939f8f.36.1776348918446;
        Thu, 16 Apr 2026 07:15:18 -0700 (PDT)
Message-ID: <ed17c1cd-8024-4a04-895b-c9952ff8f3de@suse.com>
Date: Thu, 16 Apr 2026 16:15:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 27/27] xen/riscv: add initial dom0less infrastructure
 support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <a66c727d0b99b9de41f516e1304b1a70192c9392.1773157782.git.oleksii.kurochko@gmail.com>
 <79c69067-4771-40df-a52b-8b552cd92a00@suse.com>
 <7032dd40-f1fe-4d34-b559-6f2eb853bf5b@gmail.com>
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
In-Reply-To: <7032dd40-f1fe-4d34-b559-6f2eb853bf5b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1776348919-6DB6CCF5-0DE00C2F/0/0
X-purgate-type: clean
X-purgate-size: 788
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 900E240F735
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 15.04.2026 12:28, Oleksii Kurochko wrote:
> On 4/7/26 4:11 PM, Jan Beulich wrote:
>>> --- a/xen/arch/riscv/setup.c
>>> +++ b/xen/arch/riscv/setup.c
>>> @@ -32,6 +32,8 @@
>>>   #include <asm/traps.h>
>>>   #include <asm/vsbi.h>
>>>   
>>> +domid_t max_init_domid = 0;
>> The initializer isn't of much use, is it? Instead add __read_mostly, like
>> Arm has it?
> 
> Then I expect it will fail to compile as setup.c should contain only 
> __init data.

But that's true no matter whether you have __read_mostly there or no section
placement attribute at all.

> So the we have to remove or __read_mostly or put max_init_domid to 
> different file.

If it can't be __initdata (or alike), any data item needs to live outside of
any file compiled into *.init.o.

Jan

