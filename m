Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HTIN6gal2kEuwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 15:14:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CE615F5A8
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 15:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236348.1539084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4mq-0008Uy-Hn; Thu, 19 Feb 2026 14:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236348.1539084; Thu, 19 Feb 2026 14:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4mq-0008SM-F9; Thu, 19 Feb 2026 14:13:48 +0000
Received: by outflank-mailman (input) for mailman id 1236348;
 Thu, 19 Feb 2026 14:13:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt4mp-0008SE-1S
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 14:13:47 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fb9d921-0d9d-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 15:13:38 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43590777e22so616899f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 06:13:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6ba57sm40645371f8f.15.2026.02.19.06.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 06:13:37 -0800 (PST)
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
X-Inumbo-ID: 2fb9d921-0d9d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771510418; x=1772115218; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XgQ2jjDtWT8RAQMFSle4PYBsj37CLw7hcilCw+xE2Us=;
        b=TW+Rfb94RJxeIDw1vOZgFb1BXlhtB/bsUIeIHdo7ntHBGbih1TQsIxwsJwKKIz2kU7
         goBZfFxDI81RemHMEOqjXItqiqP3X5uLx+UAH+LDdhMMLA2g2fVa+oxzBnSaLUFJJrap
         enYocu8wkuQyvRjDjlN37lVlyS9WhVJ+cAf8Y6kojnLj1O13m4NdM45tVDaV1ZLJWiWQ
         1L609a0GG/eo7LAFbNSOwTGoIRXUpIAsj1HcYD7ED6qjr/SS5pXmg7R4B0/Phj5imsn4
         ZFxOHEtdhQbJbEkXVqRzOIuaF3teTXs8bAwzMO4jtaZJlCt6tO4xypda5SNYRtnSDaAd
         B6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771510418; x=1772115218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgQ2jjDtWT8RAQMFSle4PYBsj37CLw7hcilCw+xE2Us=;
        b=TSm0U+V7Vcd76eCSKoZi5mOvAA05HGFRGJAL1O3HlLEuu7p+s2zJzqxzlX/ziiObtc
         ItLCK0kMF0BAcWgu1WuFU710Vr9fYHkkb/iJYexzJ1YpTxqyNBe6rfYDlCQk8OONUVc/
         LhIE0mqMD0RCYXzrGUvH8KrBmP9V6DbTiR/CLSSzjPRtzND7S5Uj5UaQXZh9eCqjwV7P
         HnO6WPRjrvvKBuUn2x9Zwf4JQhUn8dgVQ3LpC3ab6YsnY3Jbj0Znh8qE+MjhDiKxIa7e
         nClHCt1oHUMEcO5umeYntTcAAmzrFHHlXyrN1pW0vy3FQEilzP5MSMynbAuBfnWeqYmZ
         t3mA==
X-Forwarded-Encrypted: i=1; AJvYcCUl0FN02tGVQyUw8DNxQM9fHHt7oTPXFIkKJn9Hn0k4n+hc0MT/1VfZe8PJ2maNYiKCA3ABVxMwGBA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwB1hosHhRzWUpUN+/npDcrk7f+Aij03rMUwxGn1kd3qGb4ci3u
	X9yWRWljnjmfucq5QFwX15NJzwyStBEwa6QMfpfglfDOjSFgsu6E7qcLcX8kOFV1vg==
X-Gm-Gg: AZuq6aILUDfh1rdCV39ojHN9Ac4/pShJ6b3wlybCDj0XOcKrrZTUXUhAJ3+UuCkwi+u
	7pSICGWYGYn/6THOwMzjW590OG7hreJKc/EjWBepzbA5RIrFSIaDHQ/bUfMJvn36byK9epqz9f2
	KXRXFquoJgGfqOkUFx5hrw9BtV5LAKfMcyddHdEp9rtbxcHusKl9d8u+F2I/qDbs0EYBFbnR4+A
	Tg98IvN+NvnJrflkh7CFwGTagxre49zgljDt2kfRBJu9OPbB12sjvzZS93GPtcAeAEyWE3r4zqz
	1krbkMYVDVDqcm9EZMT7Pcdrs0hHkxc9lv5qbYM1fOUM4nseRV7saHUbn3OIK5K51CDBz8G0eZV
	v871yX698Qn56TPslnKico8jbt7Y2blHR0r6M5ldc2AwiXTWYV33ZF9iVWVeCvmmS9rZLaeQ32n
	z3+niTbwJBylhwfhui/oP0O8V6Ee78qktpAE+3GF8VLon3ZhsS8RdPzR+NX0TTmPZtmPgLvimZ6
	ajCNGaum8ZWVKgVU1tBqsdGow==
X-Received: by 2002:a5d:5f47:0:b0:436:3475:473f with SMTP id ffacd0b85a97d-4379db8cd9cmr32275116f8f.36.1771510418294;
        Thu, 19 Feb 2026 06:13:38 -0800 (PST)
Message-ID: <bf7b0c06-60a7-49b5-8679-a3066cd6a9aa@suse.com>
Date: Thu, 19 Feb 2026 15:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen/console: use s_time_t for time accounting in
 do_printk_ratelimit()
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260206202424.2054758-1-dmukhin@ford.com>
 <20260206202424.2054758-7-dmukhin@ford.com>
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
In-Reply-To: <20260206202424.2054758-7-dmukhin@ford.com>
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 87CE615F5A8
X-Rspamd-Action: no action

On 06.02.2026 21:24, dmukhin@ford.com wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -1291,12 +1291,10 @@ static bool do_printk_ratelimit(unsigned int ratelimit_ms,
>                                  unsigned int ratelimit_burst)
>  {
>      static DEFINE_SPINLOCK(ratelimit_lock);
> -    static unsigned long toks;
> -    static unsigned long last_msg;
> +    static s_time_t toks, last_msg;
> +    s_time_t now, ms;

For now (i.e. return values of NOW()) s_time_t is appropriate to use. For
millisecond values and alike it isn't, though.

Jan

