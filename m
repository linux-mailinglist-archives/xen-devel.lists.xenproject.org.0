Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCoYK6tcpWlc+QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 10:47:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB111D5BE1
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 10:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244045.1543513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwzrD-0005LJ-CJ; Mon, 02 Mar 2026 09:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244045.1543513; Mon, 02 Mar 2026 09:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwzrD-0005J8-9C; Mon, 02 Mar 2026 09:46:31 +0000
Received: by outflank-mailman (input) for mailman id 1244045;
 Mon, 02 Mar 2026 09:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vwzrB-0005J1-Jj
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 09:46:29 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af1c8e77-161c-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 10:46:27 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-439a89b6fd0so1516515f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 01:46:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439ae0e7abasm12693544f8f.23.2026.03.02.01.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 01:46:26 -0800 (PST)
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
X-Inumbo-ID: af1c8e77-161c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772444787; x=1773049587; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A4uQD7zUtyHXk1WG+956ZToLtgs8GZrFVfxV6u16ylE=;
        b=JMmOVTiJEcNeUPnr0Uvrnxh0ZrZpIBHVpCI+9Q5/jAlcYuCi5QGwT/Tb29+gvMAi0F
         HjnoAV32SedDpQPeHIt1zgDzsJVSJ/qqis+swGj6woYqo45Wl8fHruzix0DQZ29irRIq
         vY0Czf4vhZgrrbLy4Fe0wNJ2bImwa4DYu5pqNwJeC2XoqIDQiwLi9sHboFjOtdYbpAkw
         +q5TdAthiKoMpVuo78lBi9N/4QsTdJhq+uAFWo8T0ZHjMsfMAeV5bxKlbrAbxxzkYtzk
         5nvyqB8Q8AvHfq4myUTk5ehnPx/hmKlCUJgFw7uYEK303LGYgy+5gi4QkHp4Wb0/8HTG
         r3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444787; x=1773049587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4uQD7zUtyHXk1WG+956ZToLtgs8GZrFVfxV6u16ylE=;
        b=e+f/NXuNZcak5Pxj12FhK3FFIS462XlnGNCfKPjQdJaBWW6gsqbXJM1LQ4fQ6mL1mr
         3oqsv9klaUBtQ5t4VmCcdhgGJteUCWcSoBs44MSinO08IDDNipHkkuuOzM39Mk6J5+j+
         43RsrpBcbc332VHFy56/fvIp9JC52YLhWdVp2csyufRK2OdcZdSpvi9VGNJBt1TOdDbQ
         We4WCLPeJiq7tsBQX/EL+jp3ueyd4QZkcxGPJGpgWr5GA0CB11y88ZnfZUpiAeuj+oPe
         60fVPy1rwXdHoIkzCr+LSuwIOYRjt4DV57LKSBp9K5ZXqmQXsfXIROdFSxm7FYq3PPtc
         ZbZg==
X-Gm-Message-State: AOJu0YwC+dJt16xeBOSYK1UG3YmdzbVOiJQwC2RBBJxyhnw+CpuidbmV
	6R3Im6QTT4hi76pgo2tZLoXsOf9zxnNgaCCtXEin/iw6DAkAnI9o4WCwn1m81nbtGw==
X-Gm-Gg: ATEYQzwCXwOPMy/+oWjAypgbZi5KrlIz9GHJymYDtJ1HMkXu36PegqsHbzVYTB7L4n7
	hOPX0bb+yZz+gDBRr3/j7JOAelRNDI3SunXItcnh1DpocyXAfCk6+qPKVX4oJQk3MXT2xbwScP6
	58Ohpuok2c6N96V0XkEGkcJnSDYPkWRhJi80KoLgTm52VzpiG1/7eoYbDG4aEek8MR9pS25Yokv
	s9oGwg/ec3SJcaMwWOeweXn1GL2R4JmatMNwynxc0C05bdRdVhhDW85W0uKch764T41QUt/XP+y
	isILAWaJxvG+w/bxTyt0QhvxwtlRaLpJscf9tj/uX6qIUy1JCLyTQh6/3Ou7MWihAgIEuxYph+a
	4f8QmxKV2ZlsIeBHnL9wsQ3LOYQA/2QNwuQ44uV9usCF/D7mu7Q31+WtmbnYzAPc0aHdcoaRaRc
	D40iMpHnyxn/drRLeUVViLn3uzAqJptDI00kvwQIdhfYcV0f9eQ1nTy1Gg3ttuBJZEgsyE+1+tN
	0zW9FC2Mgfc/Uk=
X-Received: by 2002:a5d:584f:0:b0:439:5c75:dc08 with SMTP id ffacd0b85a97d-4399de0b8c0mr21267342f8f.10.1772444787163;
        Mon, 02 Mar 2026 01:46:27 -0800 (PST)
Message-ID: <8a8d0a11-2b19-4fb8-bc0f-9397c0db8ed9@suse.com>
Date: Mon, 2 Mar 2026 10:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/cpufreq: fix adjusting of sampling window on
 early exit
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20260227073259.1200-1-roger.pau@citrix.com>
 <20260227073259.1200-2-roger.pau@citrix.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20260227073259.1200-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:mid,suse.com:dkim,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4EB111D5BE1
X-Rspamd-Action: no action

On 27.02.2026 08:32, Roger Pau Monne wrote:
> The logic in dbs_check_cpu() resets the sampling window even when the
> sampling period is considered too small.  This leads to further calls
> finding an imbalance between the total window time and the idle time, as
> the total window time is possibly shorter than the idle time.
> 
> Fix by resetting the sampling window start time in the same block where the
> current idle time is stored.  While there also prevent a duplicated call to
> NOW() and instead re-use the previously fetched value.
> 
> Fixes: d6f001cb91ac ("x86: Implement cpufreq ondemand policy")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


