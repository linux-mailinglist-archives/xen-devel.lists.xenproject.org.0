Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA9FA2398E
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 07:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879848.1290059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdkdv-0008EW-BJ; Fri, 31 Jan 2025 06:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879848.1290059; Fri, 31 Jan 2025 06:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdkdv-0008Bo-82; Fri, 31 Jan 2025 06:36:43 +0000
Received: by outflank-mailman (input) for mailman id 879848;
 Fri, 31 Jan 2025 06:36:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aogm=UX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdkdt-0008Bi-TZ
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 06:36:41 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bad1f507-df9d-11ef-a0e6-8be0dac302b0;
 Fri, 31 Jan 2025 07:36:41 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-437a92d7b96so15848065e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 22:36:41 -0800 (PST)
Received: from ?IPV6:2003:ca:b741:f10a:3123:f9e9:b484:6874?
 (p200300cab741f10a3123f9e9b4846874.dip0.t-ipconnect.de.
 [2003:ca:b741:f10a:3123:f9e9:b484:6874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cfa2fsm3900170f8f.91.2025.01.30.22.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 22:36:40 -0800 (PST)
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
X-Inumbo-ID: bad1f507-df9d-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738305400; x=1738910200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A+1DnVEFLzfE5r0bS0gsVg8+jdgAAOBfGlCLm8njAgQ=;
        b=cmWA3QA9Vi6ERqhDJRyEP5A0dSyhfGJ0JA4LOM4DtqnxVciC4D4MDPVtmcR+LR5PxH
         wrzcLFFRIhQc7z5njisa233BXCc6UPbSGEQHO4hnGNMTuvENPsXyslKDMYG/D429ZOva
         A2M4xV1o5keE+rVQBpAN68F+dNtJx79yd+ExQkYQPqo0bRq+KUVMWD7tzeJZfyQFJ/cW
         bTVlU6E0T8SMXooYHxi3SWLKNkvjhmkY+md9KOkByWfQTXFBu5OMiK8d+1juBl6oq7Qi
         2CEMm7v8b59UUgRXCY9k3BMviXRS6Gu17s2Tb0cmQoxUADm4pYZl00/6/xiIpfvsTZV8
         Nf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738305400; x=1738910200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+1DnVEFLzfE5r0bS0gsVg8+jdgAAOBfGlCLm8njAgQ=;
        b=fyUI55AgCC3pQdvXdOOHm6A92NdQoC4Rh2RATeUH2/Sv0tSeAy6gcFq0jN7dEICIqB
         YOUmROLx0OLaGRmWTKIz17Fuiyk8oQODfE8WW3q7doiStKchTViKlGRDcaV3DjVZv+5J
         0nPRVPjt/2R3f9lt86Bl7bD75eFCpReO/cWrmOHTHlQNezzDgLBmd4lP98oV47rC88Zv
         h+j3APAHHX5DM6aU4J3x2fIbnqjd4r+bJTFGspWoWcpvgD5OTnukrpDNRYF5wxmzVDzd
         FhHl6ak0eRwI54Xolz1Ij1jIikFFajw5XoEUEE42xkLU5wnf+/GUpvBOo1Dwz3RljZ2b
         eP4A==
X-Forwarded-Encrypted: i=1; AJvYcCXQZXpMnmNdWIE1iAdDeHasq/P/Fx/yhad99/V2S5EUOT83LfIH0zfOxdZEbQTpI37ZUdjLBoEnyro=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJC2U4Xbwq+Na07FMvs0UjVtqdKfyfC+pFBSo46FMblGlbxyeZ
	htG3uVf5bKDrFsgv015U///fuUtuNnjr6RgDi83CbzQIlgvVoD6Ykkh1UqcC0A==
X-Gm-Gg: ASbGncufu9cdBeIDs5gwCrexfR7W3FYnRy2DewNVNOu4wN3z7LCbQ6X6GZi6te3wW45
	wgXAZaqIsoPNIIapyZ4a2/F0K4eghlyO2rcyb3OV09A02EGQmgK8tMdv/Hia4vdVpWGGQWEAf4n
	S1BWH1XLBjJSwEgnDJWd31XpnCCqF+Xz+fSutBxlVuxmqjmOlFhFGM3f+ig/yRImd2U0WNotrqg
	wNCmNMrgt3dkyyePHF7E/N6bzgKEZFdwwsAg1gGwGivTgTwkUN6Ff5eZfmxSqpUyazVdpDIeCLW
	NR7S4W07miUEGQ7Zs6QBDzUDUlQy+qKG1BKqk8hqApLsYZZmz/xnqn0xJaBIBbPD+f0k8TKigot
	vrTrIVBwccDtcVgZDMZ99VvcN+N4xqpuqvgXjaIpL3A0AnXqeCA==
X-Google-Smtp-Source: AGHT+IEuCPzRmhlKb94RcqQsTE/JvZBQ1e+nFfrmO/b/Z6P5A5t5+xi7IxRJYx5hbw93KD9lsQLemg==
X-Received: by 2002:a05:6000:4008:b0:386:37f5:99f6 with SMTP id ffacd0b85a97d-38c520bc551mr8972429f8f.53.1738305400475;
        Thu, 30 Jan 2025 22:36:40 -0800 (PST)
Message-ID: <eb927472-5399-4a82-aefd-7ffd28e09788@suse.com>
Date: Fri, 31 Jan 2025 07:36:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
To: Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-9-dpsmith@apertussolutions.com>
 <efc352d6-e686-435c-98b3-2333b6dee6a3@suse.com>
 <alpine.DEB.2.22.394.2501301250410.11632@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2501301250410.11632@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2025 22:14, Stefano Stabellini wrote:
> On Thu, 30 Jan 2025, Jan Beulich wrote:
>> On 26.12.2024 17:57, Daniel P. Smith wrote:
>>> Look for a subnode of type `multiboot,kernel` within a domain node. If found,
>>> process the reg property for the MB1 module index. If the bootargs property is
>>> present and there was not an MB1 string, then use the command line from the
>>> device tree definition.
>>
>> While multiboot is apparently the first x86-specific part (as far as Xen goes)
>> to be put under domain-builder/, I wonder:
>> - Wouldn't looking for "multiboot,kernel" simply yield nothing on non-x86,
>>   so having the code under common/ would still be okay?
> 
> One small clarification: multiboot,kernel is actually common between
> both ARM and x86. It is "module-index" which is x86-specific and would
> "simply yield nothing on non-x86", as you wrote.
> 
> I'll let Dan address your point that "having the code under common/
> would still be okay".
> 
> 
>> - What's "multiboot" describing here? The origin of the module? (What other
>>   origins would then be possible? How would MB1 and MB2 be distinguished?
>>   What about a native xen.efi boot?) A property of the kernel (when Linux
>>   doesn't use MB)?
> 
> Each device tree node has a compatible string to qualify what kind of
> information the node is describing. The compatible string for device
> tree nodes describing a kernel binary or a ramdisk previously loaded
> into memory by a bootloader have a "multiboot," prefix. See
> docs/misc/arm/device-tree/booting.txt. This is unrelated to the binary
> multiboot protocol Grub uses on x86 to boot Xen.
> 
> A distinction between MB1 and MB2 is not needed in device tree, that
> information is retrieved via the Grub multiboot protocol as usual. The
> only thing needed here in device tree is the location of the kernel,
> either by RAM address, or by Grub multiboot module index. This last
> option (Grub multiboot module index) is the "module-index" property I
> mentioned above.

Hmm, then I'm afraid I can't make sense of the mentioning of MB1 in the
description. Yet that's a point more towards Daniel than you.

Jan

