Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDtjKArFBmpdngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 09:02:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF1A54A43D
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 09:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309645.1580693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmYp-00041Q-5t; Fri, 15 May 2026 07:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309645.1580693; Fri, 15 May 2026 07:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmYp-0003zw-2c; Fri, 15 May 2026 07:02:15 +0000
Received: by outflank-mailman (input) for mailman id 1309645;
 Fri, 15 May 2026 07:02:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNmYo-0003yJ-6v
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 07:02:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNmYk-009gqi-JX
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 09:02:10 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06c4f1-2eae-0a2a0a5409dd-0a2a45038ff2-6
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 09:02:10 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06c4b6-672d-0a2a45030019-d155dd2ae495-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 09:01:10 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-45d96d21e82so1000520f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 00:01:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe1a41sm13099670f8f.31.2026.05.15.00.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 00:01:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778828470; x=1779433270; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OvEAdl3G86YkunA7xQ2AK7TGiF1P5JvbBb/kl0+GDlY=;
        b=LVXexjaOsVuaP5SwlYp6/kDkgsPQR75yM+D4XaHwtovCiP6Va+vcyjmRzMuVy/ZEEe
         vLVBL18JiybwY9X8Yxq+aG1GrjWWMg3SOlwqNbmDasnU5zxX5xxiRrargAkY5u2Hng45
         d9weXrRUbuUp4B5GbCP1FKDd406qQu52pVAJCVDqiGkayWohLYJ8O/H8sYvvjbLDKCKQ
         u6CPnbNePozRD+1BUjh7psPngtFoc81sRSE/bbiBWNVAnYuBPzNjQSEiDK7VpuZIkUaT
         +lwu4LKrm9/qRR6bvIuVpKzZQkrbfSVgxgVmyNhYRK6Vo8OoSp/Ff+qtVZixoRTLMoBR
         Yl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778828470; x=1779433270;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvEAdl3G86YkunA7xQ2AK7TGiF1P5JvbBb/kl0+GDlY=;
        b=puc7WprOFcmEUhP3zskezOIvOYTqfK1yV72fZqmCs4YOmOivg84G+VKac6esCieWlV
         F3wuPhmV3TL+EGt/mMV4aGW26TdGidmPrl860bv5Okv8K21s2m0Gxl5lOcDCz5lfjx70
         /omiGh/iw5EbqLNB9qsqfFh4mN6sljmCuKOBb2k4+I+tSMzK14oFuTie9P3+P5cpxZ+u
         0NqGC7wu+acJRxCb5/jRVojG6XyKrW9VulfqnONQfdutnUT6QelhbrvwKyvJFLXMtuqh
         WgCx3r4CjYUkXcnw+8izunolm0yrhLwEYhY8471/g8vdrnsGSTJw9fYAh5J1rUeDo8Rr
         UCrg==
X-Gm-Message-State: AOJu0Yx4H70vYthajdHIXidNAFJL5zBZjHbJWpEeIeZRRrTiEa5zYcdS
	YOrt1h72YGxkfy3iolqQzUh7092+i/NuXOUtgFPZFkDXNhnNU9H7xw5Yk5mrzj45dA==
X-Gm-Gg: Acq92OGUqYkvfk/7KIRouEpIJ9T4MMNKELOxepBqCS9YGION9cop3gpLkHn3oLCY8gv
	G6c5nn4UEC/fSu+1EvB2nnKO99x2f8YLkZ8RCG7vzF+bLVPSLu+VpNAvVOTi2rjnCxBd/PmhHZV
	ofQ+tXVL/WE/NbetO8wZH5rjggVWa/pSwY2gzH2SacI+0uFNxuDx//MtJ9kT6RDEJ+hMUaWCrGS
	KaZorMzU39nHYKU+UWPI49SJERk6QQtJFy6LuRyjUrzyLEEtkdkXQ3H3lmvBjE1F7ShxrvS9LBS
	lWZ0fJtxMQsRe0xrcMfKvksImMnE/tauBnsAwtDPQKL++8O2bX+Ou+xZLbozfehkttIQhSSL984
	ZC+FMwcLvqBEVw0gFE3LuUJDiSaqT1lz6yMW7E0UfjxvG5BBbXoq5Cq61QfnWWce6cLgZ5ZQMBZ
	8adH3TUuNjmKzeFZCF4cPjchC8HjD8+bTahhcpmk5QlpeC5Qs9cmyVYxUsv4thzqzS2ZeVBV/gG
	IzLrNx41TFfIno=
X-Received: by 2002:a05:6000:2584:b0:43d:7783:c684 with SMTP id ffacd0b85a97d-45e5c5e6d3dmr3192274f8f.43.1778828469573;
        Fri, 15 May 2026 00:01:09 -0700 (PDT)
Message-ID: <eff07afd-791b-4078-924c-ed56d76ff7c6@suse.com>
Date: Fri, 15 May 2026 09:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 8/8] x86/mwait-idle: Add C-states validation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
 <d8c66d85-59c1-4107-b283-a03f92f6eab1@suse.com>
 <agXqiEQgGblLyc7-@macbook.local>
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
In-Reply-To: <agXqiEQgGblLyc7-@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1778828470-37F4A938-FE7E7C88/13/0
X-purgate-type: clean
X-purgate-size: 1456
X-Rspamd-Queue-Id: 0AF1A54A43D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,intel.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,msgid.link:url];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 14.05.2026 17:30, Roger Pau Monné wrote:
> On Tue, May 12, 2026 at 05:38:32PM +0200, Jan Beulich wrote:
>> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>
>> Add validation for C-states specified via the "table=" module parameter.
>> Treat this module parameter as untrusted input and validate it thoroughly.
>>
>> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> Link: https://patch.msgid.link/20251216080402.156988-4-dedekind1@gmail.com
>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git be6a150829b3
>>
>> Add __init to validate_cmdline_cstate(). Other adjustments to fit our env.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> @@ -1697,6 +1737,21 @@ static void __init cmdline_table_adjust(
>>  		       state->name, state->exit_latency, state->target_residency);
>>  	}
>>  
>> +	/* Validate the adjusted C-states */
>> +	for (i = 0; i < state_count; i++) {
>> +		struct cpuidle_state *prev_state;
> 
> const?

Oh, yes, I should have done that with the other v2 change.

>  FWIW, you could also init the field at definition, but I
> understand this might diverge too much from the Linux code.

Right, hence why I left it. Generally I agree that using initializers is
preferable over separate assignments.

Jan

