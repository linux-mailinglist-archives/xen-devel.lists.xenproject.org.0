Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNwXNEMSl2n7uAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:38:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C7315F247
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:38:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236299.1539044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4ED-0001JL-8E; Thu, 19 Feb 2026 13:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236299.1539044; Thu, 19 Feb 2026 13:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4ED-0001Gp-4c; Thu, 19 Feb 2026 13:38:01 +0000
Received: by outflank-mailman (input) for mailman id 1236299;
 Thu, 19 Feb 2026 13:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt4EB-0001Gh-Ba
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 13:37:59 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 339ac51e-0d98-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 14:37:58 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-483a233819aso4589305e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 05:37:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839f905d3csm53471505e9.1.2026.02.19.05.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 05:37:56 -0800 (PST)
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
X-Inumbo-ID: 339ac51e-0d98-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771508277; x=1772113077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JKaa/m9ijaPavmv4wux74qlpyfqVrqU26mgJL7gcq7Y=;
        b=UuDi1oz9m0QN20/KpuegEKpf8pK93aekJiQ71rIIIiRP3GgwXg5ki5j9S/cG9yw9lt
         WIYrw9BOt/tNUuI+VfEj32DE8BuLX0scOfEoBZ9OBw96fpK3drp0yLEZTDaBNz6aU90i
         ASSjaqWWO7MKYWNFWH++HMSEo4JgUDgNJKSDkECqtCd+qwZ4jfvrWKDLXTPIeXbtl8GX
         tYZxsCclvCf39rLk8VYB1KESz2fOq95dA28geJRkGvoYv2ULTTgHL0gtlGLKYMMtr80j
         4MATBAngRjJcCcFZYiv2P9r7oFkIEQ4ScxkDHtgYBlz/uHgm50VHi2ClUOvl5jszmLt7
         Hdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771508277; x=1772113077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKaa/m9ijaPavmv4wux74qlpyfqVrqU26mgJL7gcq7Y=;
        b=e5rhsXdFMNyUu1yphliTzEpZuS85btQsomx0CxIbJmqSl6KUaE9M5BPQZhOOb+X1lH
         GcPwL76SUtzgsdJMixdWtfY22VXDp09o7msC8avS+CB5RJ4XSZWUY8dbZASr77bUogfr
         MeJ6StEkJlQn6COetrauLUH4coYQnJJJ3I4KQ3sL5xrTH6v73vuc+m4pfi3bGKXUkG6B
         bFTEwcINF/V5i5GZxdhmi0dB7QJsqeMFuk4fIwlYVkIEUX+yA7xEs4bV18HvGxWlOOvE
         8rf8ouEnUVDBEGrfOTq8bF1l2+g7vdVeYupblnkZl6wc1bI72UYUqS9ZOG5ObcoSA8z0
         oHEg==
X-Forwarded-Encrypted: i=1; AJvYcCX9ll/NFi7N9isXDPOWWlS0kOJoWjwMzUFcc6Mk011o2n4+uOvCqeJE6K028hcbHLsHR3xbONEF7A4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1lg/MMzCeVc4ta3q211qy3CY7AWKQImbL48vi9rKFztsRxMSX
	S5TjTNvtSh0z9ATUhjNPNyaxs+Zbl+F8MrjEkrNIRP5Vl4SWvydJORrHdlvQ0yONjQ==
X-Gm-Gg: AZuq6aKKAG5/yllEIBxWOpZE4g/R6cyL1dq2T3HRrw3Br1CM7EIDr8pyMvt7tx8dgqg
	L++SJQwU7SwcRWWM0QxaT1qUBmyPNh5MtM45iMuVEsIEdbVrZOyvb1xS5NsJBhMj3j6CDQSvoUF
	kp2Njft39ZtX41bFmVhG/v2rwpWK95Jtzi2zdaRhFvCZ7AuG5cRJVHfSzPF5CbAA+mZVY+g13bv
	Hs/aonbyjbD8VR/wdoAbz/U1CpK5+t45wrGAMNayzgm0A1WJOq9AXvFjhykCRdSfH+IT/rR1gwL
	YiOj/76T7TQZXV7acLAUQHQRckVNTYnJeZd8o1pm/DdUKwH2DBQHpoIhkTBLPgYZ594qtVQ95ev
	5WUkGWQqhWK2OpfYogfSHnsc0ujsMt/qePr+FWPY95d/xYHAHk9d/7/Yuf9C0SVIq6SMNjhB1cw
	Tn2b+mxTnbZFFeLCzJdDtBUnN0U+sTQRg5usxsgE8kkFdB95rrQy5fL2Nq34vHaIX7e5/WeGUn/
	ZtGnHmMaqsrq+o=
X-Received: by 2002:a05:600c:64c5:b0:47e:e2ec:995b with SMTP id 5b1f17b1804b1-48398a7dd3amr114426485e9.9.1771508277249;
        Thu, 19 Feb 2026 05:37:57 -0800 (PST)
Message-ID: <4531d175-2e37-4b37-a157-82742a87dd18@suse.com>
Date: Thu, 19 Feb 2026 14:37:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] xen/console: add run-time rate-limiting controls
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260206202424.2054758-1-dmukhin@ford.com>
 <20260206202424.2054758-5-dmukhin@ford.com>
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
In-Reply-To: <20260206202424.2054758-5-dmukhin@ford.com>
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 43C7315F247
X-Rspamd-Action: no action

On 06.02.2026 21:24, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add new "printk_ratelimit_ms" and "printk_ratelimit_burst" command line
> parameters for global rate-limiting controls.
> 
> Drop `const` and add `__read_mostly` for both global parameters
> printk_ratelimit_{ms,burst}.
> 
> Update command line documentation.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Like for the previous patch, I'm not sure we want/need this, so again only two
formal things:

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2077,6 +2077,33 @@ compression is selected at build time from Kconfig.
>  This is a mask of C-states which are to be used preferably.  This option is
>  applicable only on hardware were certain C-states are exclusive of one another.
>  
> +### printk_ratelimit_ms

New options want to use dashes in favor of underscores.

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -344,6 +344,20 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
>      do_adj_thresh(key);
>  }
>  
> +/*
> + * Global rate-limiting controls for printk().
> + */
> +
> +/* Minimum time in ms between messages */
> +static unsigned int __read_mostly printk_ratelimit_ms =
> +    CONFIG_PRINTK_RATELIMIT_MS;
> +integer_param("printk_ratelimit_ms", printk_ratelimit_ms);
> +
> +/* Number of messages we send before ratelimiting */
> +static unsigned int __read_mostly printk_ratelimit_burst =
> +    CONFIG_PRINTK_RATELIMIT_BURST;
> +integer_param("printk_ratelimit_burst", printk_ratelimit_burst);
> +
>  /*
>   * ********************************************************
>   * *************** ACCESS TO CONSOLE RING *****************
> @@ -1320,14 +1334,6 @@ static bool do_printk_ratelimit(unsigned int ratelimit_ms,
>      return false;
>  }
>  
> -/* Minimum time in ms between messages */
> -static const unsigned int printk_ratelimit_ms =
> -    CONFIG_PRINTK_RATELIMIT_MS;
> -
> -/* Number of messages we send before ratelimiting */
> -static const unsigned int printk_ratelimit_burst =
> -    CONFIG_PRINTK_RATELIMIT_BURST;
> -
>  bool printk_ratelimit(void)
>  {
>      return do_printk_ratelimit(printk_ratelimit_ms, printk_ratelimit_burst);

Do things really need moving around?

Jan

