Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OeZA4PYcWk+MgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 08:57:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2A762BBF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 08:57:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210456.1522121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vipZQ-0005aB-8r; Thu, 22 Jan 2026 07:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210456.1522121; Thu, 22 Jan 2026 07:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vipZQ-0005YX-5e; Thu, 22 Jan 2026 07:57:36 +0000
Received: by outflank-mailman (input) for mailman id 1210456;
 Thu, 22 Jan 2026 07:57:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vipZO-0005YP-3F
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 07:57:34 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc472674-f767-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 08:57:23 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4801d98cf39so4794935e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 23:57:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48042c3a7c1sm44415875e9.13.2026.01.21.23.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 23:57:22 -0800 (PST)
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
X-Inumbo-ID: fc472674-f767-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769068643; x=1769673443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hJ5QI+JCFKHvCKRoA5RCRgCJTYL60OewmCHZVlb1My4=;
        b=SjEpgt7DTp/r8AA15LRQ4paqNxup2LMsVkWcA/xPYIClFtXyOVl7OY6VoPDAIsZ/5V
         lrKoAWocBdk3Rw3eTnZMv2/PeiivKK32g96XXzM0u7cALXSAp3q4Z5nXa/THXUTC3AH4
         1LeRzS3epOZexIPPE5TE29MXU/20bKyKqDCIftQe8vm5hRTIv5WhjoU7CZb8A5l+IT+2
         SFNEZ69rfmHuUugeNA1BBitbmVob2TjvCdA/awbedcZZNI6vlJqDbir8LgQlvm50xSDP
         ASoVeqJ+ONeWEwdELaOyBCTV7dfchaHgSVxYs11B9XJYJgQn2ysi6LFQImN4f1Lw7e/3
         hTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769068643; x=1769673443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ5QI+JCFKHvCKRoA5RCRgCJTYL60OewmCHZVlb1My4=;
        b=Ln1dWO/SX9HOy0pB/K3MhdOxCKD9FNPRti9IJ6lldKGfyBHRK3shfzVhxs6xfossAP
         IQnNwG0lNsXxNkC6OrXshKEeuIDfErjJIoSRhVVB60wlxAnavQP+9MmEve9y9kNv2Qxu
         30PcfYw/Bo1iHBB3qY9LR+Dx4NrfugfCuuH6JxYvcubsf9SMVVII59pZ96e4/cHVezwu
         MS/WwQ7w/2GuvecAUu7ORNTnL0+jWiEW0O9FHb93AU8PbUg3VxGOpMy+ak9MystaHLgF
         lE/ethg9jmxuAcJFuAnyeIkRHRzSiSoIDhPgfOUnEMGO3vkWYl8DM9fhKGsHD8alh6bQ
         a6kw==
X-Forwarded-Encrypted: i=1; AJvYcCXql9vd1BgP8e8PB+9Cr08FGHAlUGF+ISB7wiVbdNInxFwJ98rgQ6rpt84Ydofrck9sbgau6uOkuXc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3iZ48BN/3l4MytoQODs6nje75TBt8bPcbauyXg2We2EG3XiUZ
	S5cevD88vntDoqBl299BVoJ6pzOcCXsytQiC0b7GoJM9gVD92/wxkbsfl7YamXfkhQ==
X-Gm-Gg: AZuq6aK+clMBoDregCYo6smGt+qMStwBPunCCvV7aDyB6qOJcaN+fDZSdbCORLWQW+B
	i6zSujew5XBdR7xIQ3DVNtv2dWg7FVpFQB8rVTKgH9LsSj70kUUJnQrgxrYFkuCi9QOiIjTRmV8
	Q7dpAlgu7GlBthqLWtRzsoWpfrbDnCDakgL4D10RsxU9aXnmfSzQaVRSicODU14LFwkB9jrD91V
	Rl+oe15SGoeEPjZLrd5ShYB1klnjfphVHiUzinKIIkWGCb+pXmu4oqm80M47XUJcyfDLZZt0yR1
	sTOyYA1cj6dQD4hdgnxLzEBQI3BZaDqMNYnEbvKbKnF2GGPDJ2b4m/vpMaoj4kEiJyvmxprCKOX
	x9EV5qZZ1Z7TUf8BiuGj9mPliMTJVeAjk/1dzvofutZ8lS8GXmYTFmDbI9zGxt0hXdPqO99DhwM
	7Eew80EA9p8FaMndiLepIHKdqn7Kyq78dGrwfWfZgsi6UcfY6e6YA2iN0WtiFxVGhRLasp7yVAK
	H5Jr8cqEhQo4g==
X-Received: by 2002:a05:600c:37cf:b0:471:1765:839c with SMTP id 5b1f17b1804b1-4801eb041f7mr275900315e9.20.1769068643023;
        Wed, 21 Jan 2026 23:57:23 -0800 (PST)
Message-ID: <ccf23d84-d0ac-4564-8b51-a1cc38c7a8cc@suse.com>
Date: Thu, 22 Jan 2026 08:57:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/console: handle multiple domains using console_io
 hypercalls
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: grygorii_strashko@epam.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601131638350.6279@ubuntu-linux-20-04-desktop>
 <63c35c5e-577b-4346-b600-03808306177f@suse.com>
 <alpine.DEB.2.22.394.2601191522450.7192@ubuntu-linux-20-04-desktop>
 <32d0a9a2-89df-4e20-8f7a-0f069cbff11f@suse.com>
 <alpine.DEB.2.22.394.2601201601070.7192@ubuntu-linux-20-04-desktop>
 <873867dc-79d8-4ed3-94f7-1c7823db7957@suse.com>
 <alpine.DEB.2.22.394.2601211509560.7192@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601211509560.7192@ubuntu-linux-20-04-desktop>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6A2A762BBF
X-Rspamd-Action: no action

On 22.01.2026 02:36, Stefano Stabellini wrote:
> On Wed, 21 Jan 2026, Jan Beulich wrote:
>> On 21.01.2026 01:07, Stefano Stabellini wrote:
>>> @@ -596,8 +604,19 @@ static void __serial_rx(char c)
>>>  
>>>      d = console_get_domain();
>>>      if ( !d )
>>> +    {
>>> +        console_put_domain(d);
>>>          return;
>>> +    }
>>>  
>>> +#ifdef CONFIG_SBSA_VUART_CONSOLE
>>> +    /* Prioritize vpl011 if enabled for this domain */
>>> +    if ( d->arch.vpl011.base_addr )
>>> +    {
>>> +        /* Deliver input to the emulated UART. */
>>> +        rc = vpl011_rx_char_xen(d, c);
>>> +    } else
>>
>> Nit: Style.
>>
>>> +#endif
>>>      if ( is_hardware_domain(d) || IS_ENABLED(CONFIG_DOM0LESS_BOOT) )
>>>      {
>>>          /*
>>> @@ -613,11 +632,6 @@ static void __serial_rx(char c)
>>>           */
>>>          send_guest_domain_virq(d, VIRQ_CONSOLE);
>>>      }
>>> -#ifdef CONFIG_SBSA_VUART_CONSOLE
>>> -    else
>>> -        /* Deliver input to the emulated UART. */
>>> -        rc = vpl011_rx_char_xen(d, c);
>>> -#endif
>>
>> I don't understand this movement, and iirc it also wasn't there in v3.
>> There's no explanation in the description, unless I'm overlooking the
>> crucial few words.
> 
> This chunk fixes an unrelated bug on ARM. We need to move the
> CONFIG_SBSA_VUART_CONSOLE check earlier otherwise this patch will never
> be taken when IS_ENABLED(CONFIG_DOM0LESS_BOOT).

Which suggests it wants to be a separate, backportable patch?

Jan

