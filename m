Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLOoCaP1iWl7FAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:56:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE251113C1
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225545.1532079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSgb-0000es-72; Mon, 09 Feb 2026 14:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225545.1532079; Mon, 09 Feb 2026 14:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSgb-0000cR-3x; Mon, 09 Feb 2026 14:56:25 +0000
Received: by outflank-mailman (input) for mailman id 1225545;
 Mon, 09 Feb 2026 14:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpSga-0000bZ-4o
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:56:24 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 800a714c-05c7-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 15:56:23 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4376c0bffc1so1002965f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 06:56:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b2ed9sm28162164f8f.5.2026.02.09.06.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 06:56:22 -0800 (PST)
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
X-Inumbo-ID: 800a714c-05c7-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770648982; x=1771253782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y26jhaRzx60jKCYqInKUSytLMiqCKZuMl/G18nBCMPY=;
        b=RI8YeALdPZbWHXgBH428OJ6jnxni9LrN3/G075SCzCaoy8BgzdwGlCunJSzo5emFj4
         TrzYXkERSBAXSzEv7ig7tUQkOi9vuUT4AytvTRUNzRNZpNmxE32e3FtvCrtQoMxltm+P
         OyADJLkh0F/3TJYGeVeeOuPCnp2k4M8IlhIO0Sb+FCi8ovsZMaiTjhnhZHLUQSHyJ5Vn
         jFsbxdzJ0m0QqLwAh6t9t+nsAR4I7yIn2AKV7Prq6q01kVmJM2XfOhkWA56I+A2OdamN
         ju96QHm3TNQHLFnPe/tLRgsiM3lyAo/TDhoyMwSwGIDRU35iX7CpbUDDzRVRRuyG43P8
         aZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770648982; x=1771253782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y26jhaRzx60jKCYqInKUSytLMiqCKZuMl/G18nBCMPY=;
        b=v0scS/m51w0A6wdy3vX4UlXcOh+yxPbSICKhu/VQ4AQBmpnS59r6JtMsc1VzrZ39H1
         ITAK8hJ9kEatGlX0eZerCwbLGvj521bN8PcW9fWwe9m20wPWuGjjUb+rLNvunrqpmlNk
         vk0voSnF2g5EydKKRjSZfEgqmfeutVqQIEiQzYaVTHmLZBQXZZ9bxtIJ9ew5DoiRWClI
         YyUdZTMO8D8VrYgmG80fpO28Hj4PcwjsFJ+d4+/EyEk1gHyMphV1FxoL6XG2KXopcanR
         mXY3szFHm0Q8V7AWw1FIQcreAfDt4IS/We/3nVT5ukFmjmhLNgRMnMUjHU/4lAH9A9pp
         EQ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXDlePT2EkfLvR+QAvp9aMDmloo/xFd4NkqxCLlx4UJjydzbsoPi85TOq0js5s4PU8kZDdw4zK85Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyf89w3yVtZbQhUxopquIOMZHCjd9YcUyB0Ue2KVG2mDF7yH5Vb
	Hwc6DbTt3kOJJaKXpp4eT7BFWIXOmVP22hUIA1MdFWy6wGj5lsfOnDpG2akL0+ON7g==
X-Gm-Gg: AZuq6aJI0dJcXFqOyXs8UHkl4tqghalS4a7H9dfW/Eyjqd4A49jGiFNlVlyi+amhuIp
	aZ2hM5+WDvLBbfhReHabZR0Cvd3LjR+Au3Zi5biGHn7bL3MMCQbukZ2nWeYUavPpv+ddnCFZiWM
	H4OojxrzbHjZSGKipYpzMvRkikN0yQW6qKpGbSNjHGkoISy9KHySUfRh+M+dulapqf9BDavPww1
	mEDQ7kbGiVtVsGQLc/QRqQfIH/5wacZ89BZjRO8dsK6oP4FQxrvRL/stnrv+UhMUgX7S8cTGZTB
	Vz0cxL/0qXH1ULn+2hhbEUrEGoLXO1XuH9YtscRQ+VQ1/Hf6uFgea1mZWRWt4fv4JfAxgpMO5Jw
	UTQr/wyZ/j7Ek0+cWhvmtbBTQJev+5TL7s4W56BDjHvoBO87HNQKKAKG6aHA6NnHisUBe2fGcES
	Z6fkzt9VZEKdypWPaICK9GJ1zwdGdETOOkGoRfhz3Z5zmLpquYNTk0+Pgojka+5wOO2vdaZVFP7
	HY=
X-Received: by 2002:a05:6000:220f:b0:42f:bb4a:9989 with SMTP id ffacd0b85a97d-4362965faa7mr17197220f8f.28.1770648982463;
        Mon, 09 Feb 2026 06:56:22 -0800 (PST)
Message-ID: <0105370f-6b00-4174-9641-83c2e6d743b7@suse.com>
Date: Mon, 9 Feb 2026 15:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: short-circuit HVM shadow guest creation earlier
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20260209144049.86535-1-roger.pau@citrix.com>
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
In-Reply-To: <20260209144049.86535-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,suse.com:mid,suse.com:dkim,suse.com:email];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CCE251113C1
X-Rspamd-Action: no action

On 09.02.2026 15:40, Roger Pau Monne wrote:
> If shadow paging has been compiled out short circuit the creation of HVM
> guests that attempt to use shadow paging at arch_sanitise_domain_config().
> There's no need to further build the domain when creation is doomed to fail
> later on.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


