Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFigMcjKhGk45QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:52:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A883F582D
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:52:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222242.1530246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2aV-0000Gi-SV; Thu, 05 Feb 2026 16:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222242.1530246; Thu, 05 Feb 2026 16:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2aV-0000Ek-OW; Thu, 05 Feb 2026 16:52:15 +0000
Received: by outflank-mailman (input) for mailman id 1222242;
 Thu, 05 Feb 2026 16:52:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vo2aU-0008J5-B3
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 16:52:14 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04f6c617-02b3-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 17:52:13 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so796796f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 08:52:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805f25dsm16286467f8f.29.2026.02.05.08.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 08:52:11 -0800 (PST)
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
X-Inumbo-ID: 04f6c617-02b3-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770310333; x=1770915133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+a24y37v2jrnQg8n8+OtM4vlSQ0hwPalNlu13MWmNiw=;
        b=FZi9IgLKfP1EWQhQCdq0whMS111tfVCITYzHgmmANVD5f3333hoIB8nGAaxef7xjo1
         WHhecnGc1xEEAcB+BGth6Ol8/4oGuuQMEPOKswotU9+ZTo0AhU49cWf+un29Dg+7HyHQ
         1CsSPNAfkYsbyGJpHPWfIVnpMTTgIdrDFhA5MA8giE9lDGmm97yUQjMSjOGsbLLd0yL6
         EDBwPZTquCuMUzeeMQvhXvThjjOj5Am/4D1Tpa/ptonBL57I4KO2LZab8LbCl9omeClH
         RIEmaaqPpmmH1nbQOPhcVoU+UogHTUhmUr5k9t5QivZhR9+zNPA/aHYjEL9qS0QPTzoY
         wxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770310333; x=1770915133;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a24y37v2jrnQg8n8+OtM4vlSQ0hwPalNlu13MWmNiw=;
        b=kPa28WwwCigOMEQzLSTtWWzhcowgyPwnj2z+zjLl93+rcGAzXQTviCTSulZmhfip/x
         FKZOHUI2QhU9NxQp6gT1Dou/azrM/+4EJzVZEkVUZh38Hf3CVV06AQCld6GAg5jc31Hs
         uUX0v37uP9mrrnwmMq25QsfKJ91QYMaTfmefELI6br3E7/w6RxDRdjcQne0HKz178ohQ
         FTbqviDcGGVD/qrfrYkz4nqYucvkSSeqxuix70gfnJapeOnBgT+DnKD3aDGbySXCPv78
         bKBxrqX4sGjXGoaFiiDAZ+ElNOZXpoVid9FwvnxZOG0VHsOxVo51WKkuKI2xJFxdF+KC
         Ek9A==
X-Forwarded-Encrypted: i=1; AJvYcCUDHLEiH0+u5qilLKUsi1+N5IjjeaTc7NM6TOPSlB9SBYVJUSgi8yPHEPlI61lf/DXXutpuujVVFp0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8uDG4U/rF6o1dGgcgtQDjeDKVgi+kiTRapEc/58POvtK1MYxl
	6VfMz52iolaSLNSKu630hGegMfMAm4KZhoDcxNA+CZ/1tueqdEM2UFYbVwcKXaBF9A==
X-Gm-Gg: AZuq6aJq4aeRjqKNTtNitwG5UFUcDa7h9KDGzKOxpIulHj7NWss8rHPqnYtgBbQO7ZL
	6FuDbJys/iPpRExkoKprBIPO3eHy0nDWOHjd6lYdxewsGIIf18aRZHjoLAqNVXHx6qlvlmZgHgI
	KS86tvR4t0en965kttHmkVkWOE31qjHFjM7s1e6ooGoVR55sctCbx++XW3DYkJkE8xOP0Om2/IW
	QPxCtBSRVtSa+iljisQmvm+U3/MNQ8pO9H/0UYaCNNMHMCDOzkCrtTCNEZqoUjj9UCNESbgAuRU
	j+yNZflNEovwGL56zuddJTAZuxot5aUeHm4kyLy8ep9KoD68b7Pw5nUdPYvaGHfDNHDYHFnq1iy
	nyKowTTX2ZFgWTnov2tNmbsAZAWUdr0hSr5cZtlFQUcRHRYHfIi7AvkPK/kU+03JhF4DnGsbpyp
	NNVM9aMAWXF2CDf6EBkSKLmjQ0k9zGD9ZuD+FPGutd5og08Jdlp3fVgP/20c7aHPfSSaxVXEstK
	HU=
X-Received: by 2002:a5d:5f45:0:b0:435:b0e7:ea1 with SMTP id ffacd0b85a97d-43617e400f6mr11751317f8f.19.1770310332620;
        Thu, 05 Feb 2026 08:52:12 -0800 (PST)
Message-ID: <4632759d-562a-4038-a78c-85e9ad0d2d6c@suse.com>
Date: Thu, 5 Feb 2026 17:52:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Add macOS hypervisor build configuration
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
 <7bf2ee2a-177f-4d7b-9dde-ee43bc4311b8@suse.com>
 <2B5080FA-A0F3-491C-954C-A458C6CA2E93@arm.com>
 <a3cfd04a-c32d-412c-b352-b4a1e65cac52@suse.com>
 <6AED68E8-CCBE-46AB-AFF0-9C87AAB770C3@arm.com>
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
In-Reply-To: <6AED68E8-CCBE-46AB-AFF0-9C87AAB770C3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,stdgnu.mk:url];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3A883F582D
X-Rspamd-Action: no action

On 05.02.2026 16:58, Bertrand Marquis wrote:
>> On 5 Feb 2026, at 16:43, Jan Beulich <jbeulich@suse.com> wrote:
>> On 05.02.2026 16:30, Bertrand Marquis wrote:
>>>> On 5 Feb 2026, at 13:29, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 05.02.2026 12:33, Bertrand Marquis wrote:
>>>>> --- /dev/null
>>>>> +++ b/config/Darwin.mk
>>>>> @@ -0,0 +1,6 @@
>>>>> +# Use GNU tool definitions; the macOS workflow relies on Homebrew GNU tools.
>>>>> +# See docs/misc/build-on-macos.md for required tools and setup.
>>>>> +include $(XEN_ROOT)/config/StdGNU.mk
>>>>
>>>> Given Roger's consideration towards possibly using a more MacOS-native
>>>> build arrangement as an alternative, I'm actually not quite sure this should
>>>> then be the default mode here. Roger, what are your thoughts?
>>>
>>> Even with Mac OS sed and make working, something is still needed here to 
>>> compile on Mac OS.
>>>
>>> What would you suggest the default mode should be here ? Mac OS is not GNU
>>> but everything used correspond to what is defined by StdGNU.mk.
>>>
>>> I am only forcing cross compilation here to prevent using the host toolchain.
>>
>> That part is okay with me.
>>
>>> What do you think i should put there instead ?
>>
>> Using StdGNU.mk may still be okay, as long as the comment properly represents
>> the overall situation.
> 
> Agree.
> 
> What do you think of the following:
> 
> Use GNU tool definitions as the tools we are using are either GNU compatible
> or we only use features which are supported on Mac OS.

Sounds good.

Jan

