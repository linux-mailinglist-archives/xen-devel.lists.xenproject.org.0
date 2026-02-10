Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHoOGHpTi2kMUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:49:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC26E11CB88
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:49:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226543.1533051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppyx-0003Iy-5K; Tue, 10 Feb 2026 15:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226543.1533051; Tue, 10 Feb 2026 15:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppyx-0003Gt-2S; Tue, 10 Feb 2026 15:48:55 +0000
Received: by outflank-mailman (input) for mailman id 1226543;
 Tue, 10 Feb 2026 15:48:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vppyv-0003Gn-Qr
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 15:48:53 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffb97a17-0697-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 16:48:52 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so55009105e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 07:48:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4832097dbfbsm117831185e9.9.2026.02.10.07.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 07:48:51 -0800 (PST)
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
X-Inumbo-ID: ffb97a17-0697-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770738532; x=1771343332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jyr1YYsnBv5GRzRKBwP4MFTxH4h0ZKxZ4dpToEnVMXA=;
        b=RPJTg6S1MW+Y8rW2hAtv8LkBdWcqoLsZbYpBQpOuKL2gE5whqPrgMWdrFrkjV0Ifq4
         DdSp8J/QeylhKDfas6mFJiEs6znsThrOJ434r+5YW+Fzbx+D+LQWBl/9VjdlcnBh7S9r
         nKTT5E5646NXHEhImqHG6DjcpwQSXp+U3gyRv37kmsIUTkoxmR5ut5F+fLEYdHJ6+e+s
         IQJOduImS4AJ++OGr9XTQfFNiA1R21RhDU1Af/LC1x0pAI4zd2moWxfmq+CLLZSrCTCJ
         bpBkcPiTiCScp1ivSsVVrbln3GLazFjEfDHVUWC7kkpXNYTrtCag6B/Kwsj6jSn8/c7T
         4yCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770738532; x=1771343332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyr1YYsnBv5GRzRKBwP4MFTxH4h0ZKxZ4dpToEnVMXA=;
        b=Ydga4tWMCsahotVaxOlZGYBw4ozdo2cKASQx/h6kzwnkSFpjtKLYw20pOWC/JsNs45
         L0piPMKLqboI2RAFa7YqwPPE8DSoq010Hvc0ozwk5xaWR31Reo9qWH4lTF5wTeYXYEbb
         OjZzMJ0DtQcXFiW+muh62m1QtD4M6RT74vgRz1V2hSIdtgwZ/GphKq8BjcfX9WhYTEA0
         HM8NbA8HClFP4C7+wSVs6+pTG/8YJh79ECda1xcgHMikrtXyF1PPVZiKULBtzjFDCLoG
         KM6BiOdUVSPH8bfDtRPitVIJn53cEl+K0pbySDUliE0AZAFWfOYct8Cfx9n1ygN28rxU
         M0Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWI4q10PM4PAvMBzDNWtZ3wsbDVddw3g7y5NuEz14BOgH+dgDCGaP2+mu8jGlabNi3OIJW0NBsBJA8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDM/GG7jQ/txnRPU42SyMbEWXHbgOyObb0CxyjnaunK6pO0hHt
	LQuQ+Tbd1xjE6Oxu2CvaPcIJvkt+gLKVw7TAmd393dagc9li7BYZePyh2s4dQMdIJQ==
X-Gm-Gg: AZuq6aJP769DyUDP1WlCbodt8/yC1SHMswHH1TnkEO/p/cwxsPnDfyAwo0GDGlh27Kc
	KmZPP9KEMjWnL656R6lbOq9Y15wPhOpNcz8lMe6RUbZymmHVfdBl9zUwCeGH9B9JaYztAvtddcp
	ImNzJPB+SBtl28NKTjr58tqqgMkzyG1PdCpZMfDfEpSoWquoBlSkj4+nSHhG2HinWPrwF1v04IP
	ERBsS0C29Jmc3zcRTa4wgFpONSRSKH6eOBEGTZEtQcnVV/kgOn9wF02IA1mSFp8rJYAgqkZB3Vb
	VBB4ev6uhG5Qb3LoUBoyXNy9kGo9PRqA/Z6Nq7C03B0T4X5Goo5MfX3Wh3pzl2iV94AAozsXJZp
	S61pj3YDfGeIy3kwwX2OPIQkOMKfMCapcfzFy5Hghm8THpU6gmHkahKEdxfUi+8sgZXeUfOPE8j
	845oxTieJG/v9dNUsV4iGFN1Nz0wGBegBH7Pt62s5bFg8qn7biep2S9XdBQXsK2UergUiAODeHS
	eYRtERKE9aDqkw=
X-Received: by 2002:a05:600c:820c:b0:47d:333d:99c with SMTP id 5b1f17b1804b1-4835054f3f4mr44076915e9.18.1770738532014;
        Tue, 10 Feb 2026 07:48:52 -0800 (PST)
Message-ID: <cc84a9c9-56e8-4cbe-908a-a39c8ed8e7c4@suse.com>
Date: Tue, 10 Feb 2026 16:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/5] xen/console: add locking for serial_rx ring
 buffer access
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: grygorii_strashko@epam.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
 <20260204233712.3396752-3-stefano.stabellini@amd.com>
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
In-Reply-To: <20260204233712.3396752-3-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CC26E11CB88
X-Rspamd-Action: no action

On 05.02.2026 00:37, Stefano Stabellini wrote:
> Guard every mutation of serial_rx_cons/prod with console_lock so that
> cross-domain reads can't see stale data:

Cross-domain reads become a thing the earliest in the next patch, though?
You say something along these lines ...

> - In console_switch_input(): protect console_rx assignment with the lock
>   using irqsave/irqrestore variants since this can be called from
>   interrupt context
> 
> - In __serial_rx(): protect the ring buffer write operation when
>   delivering input to the hardware domain
> 
> - In do_console_io() CONSOLEIO_read: hold the lock around the entire
>   read loop, using a local buffer copy to avoid holding the lock during
>   copy_to_guest_offset()
> 
> This is preparatory work for allowing multiple domains to use the
> console_io hypercalls where proper synchronization is required.

... here, but I think that initial part also wants slightly re-phrasing.
At the very least insert "in the future".

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -553,10 +553,13 @@ static void console_switch_input(void)
>      {
>          domid_t domid;
>          struct domain *d;
> +        unsigned long flags;
>  
>          if ( next_rx++ >= max_console_rx )
>          {
> +            nrspin_lock_irqsave(&console_lock, flags);
>              ACCESS_ONCE(console_rx) = 0;
> +            nrspin_unlock_irqrestore(&console_lock, flags);
>              printk("*** Serial input to Xen");
>              break;
>          }
> @@ -576,7 +579,9 @@ static void console_switch_input(void)
>  
>              rcu_unlock_domain(d);
>  
> +            nrspin_lock_irqsave(&console_lock, flags);
>              ACCESS_ONCE(console_rx) = next_rx;
> +            nrspin_unlock_irqrestore(&console_lock, flags);
>              printk("*** Serial input to DOM%u", domid);
>              break;
>          }

In __serial_rx() and do_console_io() you guard more than the mere updating.
As said before, with this arrangement of locking next_rx can in principle
be stale by the time you use it for storing into console_rx. This
arrangement may be okay, but would then need commenting upon.

> @@ -796,6 +805,7 @@ long do_console_io(
>  {
>      long rc;
>      unsigned int idx, len;
> +    char kbuf[SERIAL_RX_SIZE];

Please can such live in the narrowest possible scope?

Jan

