Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PmsKdeigWmJIAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 08:25:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D77CD5AF2
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 08:25:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219122.1528064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnAlY-0007dW-WF; Tue, 03 Feb 2026 07:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219122.1528064; Tue, 03 Feb 2026 07:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnAlY-0007bD-Sy; Tue, 03 Feb 2026 07:24:04 +0000
Received: by outflank-mailman (input) for mailman id 1219122;
 Tue, 03 Feb 2026 07:24:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnAlX-0007ao-Dx
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 07:24:03 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47ab7cbd-00d1-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 08:23:47 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4359228b7c6so3671741f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 23:23:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10edfe7sm48789277f8f.14.2026.02.02.23.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 23:23:46 -0800 (PST)
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
X-Inumbo-ID: 47ab7cbd-00d1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770103427; x=1770708227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ncfhS7h0kV6M2NPapysXCgDFVOGyvkpj2R9B9G37LTc=;
        b=L5m9NoCdzya6oq81eyA7X6nc/1QuC+PE1krKWcRxtjUPgE8cfqfaeaYo4syOpRXDs4
         tm+BHNEGXZR0zTF3oTxz5M9IvsdFWWsFYMoVyX0Lrft9GDprZ04n36j66I9nOfi8kjtv
         L2VeQeQwKFBQ0tV1o4FcE2ny8NCx56QK7Ctmln+xy4cNRoy45WYULWEFXOPk+Ty8p9tB
         XIfXfL2jnLD+3OaEep67Q21kL6bMSq2GnVf6gNaWN82TM9S99jcPng3DqpjcG2zhhdgv
         PHrfYp5E6bSP8WtYyJXY6JPFQa+iTaTi2BtyVtDNSHMx34RmkhwjX0FWSaXgnuk81SlW
         1xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770103427; x=1770708227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncfhS7h0kV6M2NPapysXCgDFVOGyvkpj2R9B9G37LTc=;
        b=wpc0m9FR522IqgGX2k/yw7N5At/Q8eXg9yU/kQ2R/EmCNB3alzVyElTU2prlzFECHz
         qMpkw69uxLprnBO4RujQXJXyBGZKQVMiQNnqc3x6a2iX7//7EZTksiwT13niXQ3sO/hC
         EailIlw1mDBnuFFtUlOQh8zxG787GToEojp6EOlfERi5pNormoI59TbKDhQyXdQMuTUj
         H82AYwkFWirfnwoCO1P3kgrnDdH8GKAx83GVoBwuCvI+vFs5w7SiFEvR/lqBaoDsgS/Y
         jxhZIX6crYOVgVpyslStYse2TgEoEJtpHPCQY6XaDYRQC1tqk6qObIISNw8XuZr8kj3j
         oGog==
X-Forwarded-Encrypted: i=1; AJvYcCUCWJMBSc5Q5jfjNUJxZYosQ5M74X/X/AVIuK3AwebcNxeB8eGwQ4kzG/GNvHhkpeaBc49eTP4b54Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbKdW2MpCsCvwyS2gdOWTr22bSEYAUMcTjhfV77vywkYQkFNTq
	HajkQF/aZa9Gn5vQWmuCIJLz1S6M8czhSblkbu8cpblxAre0Zgfff8HipWzVFwzBug==
X-Gm-Gg: AZuq6aKlXQcu4mX5cH7LJUgp+xE9U9+rnxy31Gyx5LfH3ocGzMwgoE99Rv/b1os7K5B
	XQNHbUgymJCKouMT/jeiLq3TkUKwm0k+YBG9HcEFmNdewPbw31dhyN43HWFqTulKbCYwhgxo3JS
	+GF1c2iGEcyeCmn2lcnp4oOJkYjkgNanYw3vxQOqabPG+7i959KkCSWXxPS7+qayo1AFvIv+gnX
	1g3pzlS1h+07Gr7nKpWGcQXMbpFUo9VPz73wvEmS5gm9iQeYMeKVexK5U9GX5oWGjPzI0M6nXEB
	iLBM96tWW3gn9iN/p6Y9j4twheAAYf8lC0fL7ehPwOwA6G5A4ZWCZ+GAsAM3n+2QcM/EVzCzSrc
	EoR8AN1zOtPrlqwuSzWYcdTGU8JYj4bzxYEBl4IZtp5ygJ1nT7UOrechH9+/YUmANgLWsjRmAWm
	MnO5wlZf8etPt6saO3WIvvLpsrWa5plxpHFWbDQPrMrYvJMBC9C8smAQk6UXzNjkJmIP79w0mWD
	fc=
X-Received: by 2002:a05:6000:4025:b0:435:9d3f:92d7 with SMTP id ffacd0b85a97d-435f3a7a4b8mr17515958f8f.2.1770103427147;
        Mon, 02 Feb 2026 23:23:47 -0800 (PST)
Message-ID: <27b67abe-78f4-4867-99c6-e8beed29013e@suse.com>
Date: Tue, 3 Feb 2026 08:23:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] xen: enable dom0less guests to use console_io
 hypercalls
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, grygorii_strashko@epam.com,
 anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org,
 roger.pau@citrix.com, victorm.lira@amd.com, andrew.cooper3@citrix.com,
 Jason Andryuk <jason.andryuk@amd.com>
References: <alpine.DEB.2.22.394.2601291404410.2238666@ubuntu-linux-20-04-desktop>
 <20260129220858.2371938-2-stefano.stabellini@amd.com>
 <bcccb80b-a7d5-4600-8dc5-c4dd8f99ab71@amd.com>
 <alpine.DEB.2.22.394.2602021551180.2599007@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2602021551180.2599007@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0D77CD5AF2
X-Rspamd-Action: no action

On 03.02.2026 01:11, Stefano Stabellini wrote:
> On Thu, 29 Jan 2026, Jason Andryuk wrote:
>> On 2026-01-29 17:08, Stefano Stabellini wrote:
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -613,11 +613,20 @@ static void __serial_rx(char c)
>>>       if ( console_rx == 0 )
>>>           return handle_keypress(c, false);
>>>   +    /* Includes an is_focus_domain() check. */
>>>       d = console_get_domain();
>>>       if ( !d )
>>>           return;
>>>   -    if ( is_hardware_domain(d) )
>>> +#ifdef CONFIG_SBSA_VUART_CONSOLE
>>> +    /* Prioritize vpl011 if enabled for this domain */
>>> +    if ( d->arch.vpl011.base_addr )
>>> +    {
>>> +        /* Deliver input to the emulated UART. */
>>> +        rc = vpl011_rx_char_xen(d, c);
>>> +    }
>>> +    else
>>> +#endif
>>>       {
>>>           unsigned long flags;
>>>   @@ -636,11 +645,6 @@ static void __serial_rx(char c)
>>>            */
>>>           send_global_virq(VIRQ_CONSOLE);
>>
>> I think we need an additional patch, or included in one of these two, to
>> change VIRQ_CONSOLE to a VIRQ_DOMAIN.  Otherwise only hwdom could bind to the
>> virq, I think?  It would be the two changes below:
> 
> Thank you Jason. I didn't notice this problem because Linux is able to
> silently fallback to polling which works surprisingly well. I didn't
> notice the difference.
> 
> I confirm that the error you highlighted is real and that with the patch
> below the error goes away.
> 
> My preference is to submit it as a separate patch, it can still be part
> of this series. Especially as the other two patches have already been
> reviewed and tested independently a few times. But I am happy either
> way.
> 
> Jan, what do you think?

Imo this wants to be a separate change, yes. Likely a prereq one.

Jan

