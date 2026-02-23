Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNvgEcBwnGmcGAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:22:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DCC178AAE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239119.1540556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuXlI-00008t-2c; Mon, 23 Feb 2026 15:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239119.1540556; Mon, 23 Feb 2026 15:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuXlH-00006A-W5; Mon, 23 Feb 2026 15:22:15 +0000
Received: by outflank-mailman (input) for mailman id 1239119;
 Mon, 23 Feb 2026 15:22:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuXlG-000064-So
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 15:22:14 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d1f038b-10cb-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 16:22:12 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso3284111f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 07:22:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c00c18sm19476964f8f.14.2026.02.23.07.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 07:22:10 -0800 (PST)
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
X-Inumbo-ID: 6d1f038b-10cb-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771860131; x=1772464931; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vEiEFl5eqOISNOE1o6CffwpQkCgDHZkJQdf4wPjqUQg=;
        b=PJ+erY9WRSDdHILOgte6nppDCx6HxLWcAFWbVV11+gi2skypr0PFcHLKK8E4aiY3gZ
         CWRWTKrVMzwHd88yZ51f1s1k8ZDF+WRn2p8PIW1thfRxzQ5jEji9OGgyjPBM8KaSY+PM
         WWKa9N7MjnPJoSHquzWjLXiaEO77GW9QoQ+VDXWQkJJFmfgRX+MoBq1ldE7T3dSDgHhO
         sIFrFUxJgsoRUpbUzKUmLtJjDvDMjk3i6P35lbtr3MrCjfkKuUlB5PD6Arnfm8asCmla
         W4+Q2R6l4kw16zyMnB4p/dLxLm3aWqGNY3QbeIM3VwP0pZtWAhErHdEkJNM8JOFAOndP
         NJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771860131; x=1772464931;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEiEFl5eqOISNOE1o6CffwpQkCgDHZkJQdf4wPjqUQg=;
        b=OefVH2FEx9Ql+esPbgAZ2YWWD4bKlDXNSa3hLNMQ4iEoiMumwV7UC9rk7G6+AT52kM
         rXFiENowjG1OoeHGdrust1eLZLMT/B9ohS2wEUpqRHAoK/c+dHj4rVBbGbjf45alPg1V
         aEgI0YhBY0J3e+NfgxoFn8Z5heU8oIF3ZEMYifW1crMbO95O0zSLGpTmxe3Rxmys+TkL
         KiyuOYhLi64x2Drtrw7wBNrrEdbkX8jVH7nykUNtuS08T0Y43SIxVgQhCf7zWwGMIFv1
         lT+61RFWOWQbxBUe6cY5TNQgCxrpKf7Knw+xq5OEH3qR0KWq8h7KZwD8gsP2B014Uzu3
         DtnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNwy1bc4EClG1+sTFiGVFrX4NP5uTEMYlkr7wkVY/DpRPQ5Lbb3YiyELBRuwR1sTPHsGmoebR/H/k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxbn4nTEe4eeTLWMLHsFocGa3pxOw7BDDF82hzc1revei5ScGPX
	BvnT8fmYdoYSjgjgmg98BTFXLasmppsP+9bjLlxafvY8VDDVAbmVqwaGJHBxrnwt6A==
X-Gm-Gg: ATEYQzxBSomde2G/WMyK9K6bxfdzh0BgRsiT6DTIbKLVGdIvRKuPwKV4mPUMhWDa5IW
	7gEzL9vPlvWRdVujFMJdGDZ2UUwc5aHFexG16RJ7oiMdbwUv8QCJr7KX4+63Kxuc6iXRPZeaGrq
	26Z+d0m372Ex77P4mCQYEK0eOs0nMPSjyEHLTn9nuF8MQ0Sd3i0yskTXr3+Zl6EPPPxSSpyAsIR
	bgg6c8GPP3PHRO4QORF2HEENoDTX5A944ukz97XfSQQP2QJx9elCdGlFCUt5+eCOiAnxZ/LA4xL
	5TX0uBHHmG8n0lWbFrX+c4HEJg0oK04lekrXAIvZdHqHTw7z0apeEhdu2fprWaMhFwyomOmqERy
	10ao3mC1SmI2lEcm63BWrUmSOWWeHk9amoCSfriNVu5gBBmeBFtHwg8b64/eKaqEKb9SdM1mcHQ
	BzTc3AwtFxV5CCDVmfICOAX+oS/17kR/lJIAPzN54kLguauz9xnXbfnjMe80ybNgnBoWfDjZhDH
	xTk+7ReuKSne5Q=
X-Received: by 2002:a05:6000:18a9:b0:431:8bf:f08c with SMTP id ffacd0b85a97d-4396ffd4669mr17272894f8f.21.1771860131508;
        Mon, 23 Feb 2026 07:22:11 -0800 (PST)
Message-ID: <43a90b6f-683d-48e3-b7cc-4b8c6dae087c@suse.com>
Date: Mon, 23 Feb 2026 16:22:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xsm: move the console read properly under xsm
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260219184503.21918-1-dpsmith@apertussolutions.com>
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
In-Reply-To: <20260219184503.21918-1-dpsmith@apertussolutions.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B0DCC178AAE
X-Rspamd-Action: no action

On 19.02.2026 19:45, Daniel P. Smith wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -554,7 +554,7 @@ struct domain *console_get_domain(void)
>      if ( !d )
>          return NULL;
>  
> -    if ( d->console->input_allowed )
> +    if ( !xsm_console_io(XSM_OTHER, d, CONSOLEIO_read) )
>          return d;
>  
>      rcu_unlock_domain(d);
> @@ -595,7 +595,7 @@ static void console_switch_input(void)
>          d = rcu_lock_domain_by_id(domid);
>          if ( d )
>          {
> -            if ( !d->console->input_allowed )
> +            if ( xsm_console_io(XSM_OTHER, d, CONSOLEIO_read) )
>              {
>                  rcu_unlock_domain(d);
>                  continue;

At least the latter of these two can be called from an IRQ handler, and can
be called with IRQs off. Flask's avc_audit() looks to be using a spinlock,
which isn't IRQ-safe. (There may be other lock involved; I merely went as far
as I needed to to find the first one.) IOW I fear you can't call
xsm_console_io() from here.

Jan

