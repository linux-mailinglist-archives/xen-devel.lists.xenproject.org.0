Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNIBKFNYhGl02gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:44:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30C2EFFF7
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:44:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221620.1529799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnuxk-0004Xw-LU; Thu, 05 Feb 2026 08:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221620.1529799; Thu, 05 Feb 2026 08:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnuxk-0004Vd-Id; Thu, 05 Feb 2026 08:43:44 +0000
Received: by outflank-mailman (input) for mailman id 1221620;
 Thu, 05 Feb 2026 08:43:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnuxj-0004VX-DH
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 08:43:43 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c208fbd9-026e-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 09:43:35 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4806fbc6bf3so7195985e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 00:43:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e3a546sm14652046f8f.17.2026.02.05.00.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 00:43:34 -0800 (PST)
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
X-Inumbo-ID: c208fbd9-026e-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770281014; x=1770885814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A7SMHrACdNvAF0q6JSHeQpWtZxCZJrzjTAi9oW+znQs=;
        b=fdlXRmVJ0CUjbC/df4mgsUZdMI6UbT1Kf0rw8fYUPgS0DUxuPgfwc/s+75ryEtqb9l
         cXUOdt+lAe3S5A/1rJ8CR/StvjM+5c/VgGkO6MTWEtpkh6jThsvs4/7eR2AZ1X1QnCZ1
         ZpKrM3pHT3g3f2AJFw7ID4i4+hXKTN8r1Zjc5SihhI3ncS4ibzFNCTzbg2jVdetZRsmY
         vJFHKOL93iCfp+3jHBeS2q4nNPQkQrXz/J8b33kenJg9tn6lUv9oJwv5GyPZl0GG8reO
         8SYmqCfxJDxk5vAbD3KdSiuas0FenoabbyB4vh035OSS7RoFQgYtjKO5XVdkR4f778YY
         IgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281015; x=1770885815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7SMHrACdNvAF0q6JSHeQpWtZxCZJrzjTAi9oW+znQs=;
        b=gvRCUXesOj/Z3lnt9oTGA3Fymrb3z1UA+nDunfIMsfeuhGgD7x4+rau0sO/WyXY4kj
         49G43fE534kM6QB2jf+liKImeYXNTnKi6b42fxxiGvjSUgcahwl6YdXy6CINbspjXHqT
         oeVwgiTKFfl4NqvvFnWlftXODdk1qLPXXEtJIzjQGG14AiA6TEO/7wYbIkCsBCcanzed
         q9aqDH9ii6Vc0LoLRXG3Rzl+xJ5cz0w968nWusl4sWC8J/y+bVh7X0WLOa5p4Py2nJ8a
         1KkNb5KqHjJZpFeJ8BesMe3oW5rNtHcv9db4F/oMqoGqWn/d3CZYPrQquKtarsY8nJIz
         wlQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsBV+/3rpNHRO+mwJJOzxNxcqvkyvyKe9bGWiIi34MSEng930KlbAKNcTh5f7HWvYylMzvF5QZZ/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+D2oHvY/E1mlHxN7Cx91KkUzz3IyZE15onKk8dkcyK7l2Pwlm
	ab/pXasyd2NodN/GPeVWbCnavN7SmgB2ol2scQyRoeYWfRJ8Un5x20zP5ZO4n3EsBg==
X-Gm-Gg: AZuq6aInczaZN54irbD8DJAGMG8xSM6/gfRnJhlod6pLKdzLd4jJ+O+LxUDp59gTpBv
	DTHrCJR56bDj7nx3Z2X+LEqfHwdjnMhS9j7Jv7xvpZob63/1XelfwEyCGTOG3knIw4G+Xi67408
	/7uNyoLe8h0kGnDHwK0ArHWRRLbRv9ci331K+3OQkYRWVbdULYARziP7XhhkY1qmsr7cq+02UNY
	19p9JpXzyWCb6jmGRUFaz/U9DIxuhZGdcn2beibmSP8S/JwzZBlRK3U4vOD3Fn2EQhqdkEs0IJY
	CTSgts0bTHBoG8kv54dvo9he31qYJ0qfnB/NGZiF8jpWb+Kq3MfDfUDhupU8ka9zUKHuBp7RlVS
	AOWMVekod+xxuKjdxXZW1k2GFnsQPKQ+5PXmNS9vtlV5O3dUyP0pNYZB0easruma67x98UjqGZ5
	wx51WqQ7YfKtXaTioHJ+UEtHQn/xt1svI1WXFUbnkN+NRf1XPDaXkydu3d0mH1CXcpHyjgPWE3x
	e8=
X-Received: by 2002:a05:600c:1f16:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-4830e9897dcmr92329255e9.31.1770281014552;
        Thu, 05 Feb 2026 00:43:34 -0800 (PST)
Message-ID: <09462166-a3c5-4527-840a-cd77499dc588@suse.com>
Date: Thu, 5 Feb 2026 09:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] xen/console: make console buffer size configurable
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260205013606.3384798-1-dmukhin@ford.com>
 <20260205013606.3384798-3-dmukhin@ford.com>
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
In-Reply-To: <20260205013606.3384798-3-dmukhin@ford.com>
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F30C2EFFF7
X-Rspamd-Action: no action

On 05.02.2026 02:36, dmukhin@xen.org wrote:
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -95,6 +95,30 @@ config SERIAL_TX_BUFSIZE
>  
>  	  Default value is 32768 (32KiB).
>  
> +config CONRING_SHIFT
> +	int "Console ring buffer size (power of 2)"
> +	range 14 27
> +	default 15
> +	help
> +	  Select the boot console ring buffer size as a power of 2.
> +	  Run-time console ring buffer size is the same as the boot console ring
> +	  buffer size, unless overridden via 'conring_size=' boot parameter.
> +
> +	    27 => 128 MiB
> +	    26 =>  64 MiB
> +	    25 =>  32 MiB
> +	    24 =>  16 MiB
> +	    23 =>   8 MiB
> +	    22 =>   4 MiB
> +	    21 =>   2 MiB
> +	    20 =>   1 MiB
> +	    19 => 512 KiB
> +	    18 => 256 KiB
> +	    17 => 128 KiB
> +	    16 =>  64 KiB
> +	    15 =>  32 KiB (default)
> +	    14 =>  16 KiB

As I think I had indicated before - imo an exhaustive table goes too far here.
E.g.

	    27 => 128 MiB
	    26 =>  64 MiB
	    ...
	    15 =>  32 KiB (default)
	    14 =>  16 KiB

would do (if such is needed / wanted at all).

Jan

