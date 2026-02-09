Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNxkCZ8NimkQGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:38:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81014112937
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225767.1532338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUHa-00049g-3J; Mon, 09 Feb 2026 16:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225767.1532338; Mon, 09 Feb 2026 16:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUHa-00047d-0E; Mon, 09 Feb 2026 16:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1225767;
 Mon, 09 Feb 2026 16:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpUHZ-00047X-0C
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:38:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c75c2e33-05d5-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:38:35 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso44671855e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:38:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4832097d8dbsm152504515e9.4.2026.02.09.08.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 08:38:34 -0800 (PST)
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
X-Inumbo-ID: c75c2e33-05d5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770655115; x=1771259915; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KnfzY3d30COgPLQWwARwE+5Ep5LeTToKcCHBxWosXyg=;
        b=ImSN0H/GuVugwZvoLQOxGtRHFkgWRhOjnOwRQVv6XabSqftT6XDDSkS2QN4hwWgkf7
         lwkIta7xbZNns8bqOpTBtege/UDqiqOCevXjXwsZmv8oMvmwvqCCZrJVQ1Z9hJbRdicy
         CduFdLQNKyptXT6V/+sKHR18DXX7EhKuygObUu8KaUZpVi0F6pfLccNNPgfkx6cgtIiq
         wD/X4pgAQpvcnToCP/7h4P4tw1/CiZSsXDSgdCnJYrJR8LlZ3JI9uQz7V10nEDsh4eIs
         o/lj0079zNKuB8Q6IcpiK7yQNr6LTNZ6TRLSr+Vt7B1PpDjrAsdshTUagNDD+9rOeBa/
         N43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655115; x=1771259915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnfzY3d30COgPLQWwARwE+5Ep5LeTToKcCHBxWosXyg=;
        b=MQsbZZ+HU9gJgCS7PGiuI9mY7BLEqAE3oaDkvO6vMFCvOUBXmUHGP3jNl9Kas3tzhr
         zhYPnNRqQSrvnQyHAWNzFVxuX65TeE0xnWMiUE8H+DeMNOujHz34RywIxrY2zcdnEabo
         ip+pYtv5wiSLdvKN1TGWRJzd/DNP8rcYRtIljpixXSeLePfINs/7WXPO7r9zzKEZnP6R
         vU5yJbtx9WeMG8JPZKyrYBj+NwJ9DUq+dX4PA0VIBYovwYX3NjTvQXDR1r3RDulQQc5u
         oZIix/JEviP8RLheE4nf6jcHJuwNQ6S7xyk/stO/MB+SvIGG73l8vIy377S8qnHfr4yy
         VsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFPr6C9eT/YH0cMWlFDA2LI5XpNd4s3Z3cMlPiHWhV5kdrtHxurr6M3Q12Hr6WTzm/aqZyIdnIl4A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykQOpYqrrwTOzWJTW4yR22lRUVhD9ILg8kfe6fIWnu5qMbkHZt
	u3RiqYXJuMeRsuREExroGXZpTiSNdvzyWXfbsbcd80Alr0aAKvnRLnDGQ9oS5pDIg3CsFgSoEK+
	xg/s=
X-Gm-Gg: AZuq6aLpUva6lIybBjVBbsgAnkpBTH9nRYlKpxC/MFyLn2uxKzSGoqqmZXrtQK0b5rZ
	UH5fJ1Smt68i5y9gE7hgsP2D5ibp6EkQWLR7RokKqcbCimpJkjwMokjZ6EvG/4I/aCAM8725Ud8
	kAox8I/OEDfGihu6c7FhIveO2rZii2vSZrPJ+VN/rV6AE2WvGkn9EpDuALB6IaRuJEObVGg9jJW
	HJiktMU8ccOOj2q5gt1hGhPXajKzDb8SFoib/mEMptM3VkIfXy3ZgWiiNlEdDxggenRiCSITM69
	3Esc2m5/Wq/TqrLKeAyklK3m+OKMV/SC9K8E3u8u+z3Ty3Ek8heAZPLqE+M43q7NpO3HALx2KIc
	y+vM3FB5OC7gZ3z7l//Xfw7AK1mOegXhjn9sexMTeJexAzfQ74omCCk5aH4aIzzGJMJyRrjRC5K
	Wa/GGXChQdSJCIlwdUmrrAmESnH1e0f4KG9b83qnUqF1DATmdPQAXQ8ifDc3ZWyVIqrTzjFP1hN
	cA=
X-Received: by 2002:a05:600d:6402:10b0:477:991c:a17c with SMTP id 5b1f17b1804b1-4834d7eb858mr430135e9.6.1770655115094;
        Mon, 09 Feb 2026 08:38:35 -0800 (PST)
Message-ID: <1579e081-b945-40b1-9a72-f6c5f7ed69ca@suse.com>
Date: Mon, 9 Feb 2026 17:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] xen/console: group conring code together
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260205013606.3384798-1-dmukhin@ford.com>
 <20260205013606.3384798-2-dmukhin@ford.com>
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
In-Reply-To: <20260205013606.3384798-2-dmukhin@ford.com>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 81014112937
X-Rspamd-Action: no action

On 05.02.2026 02:36, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Groups conring buffer management code in the console driver for ease of
> maintaining this code.
> 
> Not a functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one minimal adjustment:

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -126,17 +126,6 @@ static int cf_check parse_console_timestamps(const char *s);
>  custom_runtime_param("console_timestamps", parse_console_timestamps,
>                       con_timestamp_mode_upd);
>  
> -/* conring_size: allows a large console ring than default (16kB). */
> -static uint32_t __initdata opt_conring_size;
> -size_param("conring_size", opt_conring_size);
> -
> -#define _CONRING_SIZE 16384
> -#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
> -static char __initdata _conring[_CONRING_SIZE];
> -static char *__read_mostly conring = _conring;
> -static uint32_t __read_mostly conring_size = _CONRING_SIZE;
> -static uint32_t conringc, conringp;
> -
>  static int __read_mostly sercon_handle = -1;
>  
>  #ifdef CONFIG_X86
> @@ -350,6 +339,17 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
>   * ********************************************************
>   */
>  
> +/* conring_size: allows a large console ring than default (16kB). */

As you move the comment, s/large/larger/. Will adjust while committing.

> +static uint32_t __initdata opt_conring_size;
> +size_param("conring_size", opt_conring_size);
> +
> +#define _CONRING_SIZE 16384
> +#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
> +static char __initdata _conring[_CONRING_SIZE];
> +static char *__read_mostly conring = _conring;
> +static uint32_t __read_mostly conring_size = _CONRING_SIZE;
> +static uint32_t conringc, conringp;

There are several other tidying things to be done here, but I'm not going
to request that you take care of those, too.

Jan

