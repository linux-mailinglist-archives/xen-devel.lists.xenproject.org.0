Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPmbHK6D+Gn0wAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 13:31:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EE64BC64C
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 13:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299711.1574263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJrWK-0007Cy-Bn; Mon, 04 May 2026 11:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299711.1574263; Mon, 04 May 2026 11:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJrWK-0007A0-8E; Mon, 04 May 2026 11:31:28 +0000
Received: by outflank-mailman (input) for mailman id 1299711;
 Mon, 04 May 2026 11:31:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJrWJ-00079u-28
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 11:31:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJrWI-002415-Dw
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 13:31:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f88389-e002-0a2a0a5209dd-0a2a4505b0b0-26
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 13:31:26 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8838e-aaa8-0a2a45050019-d155dd2ae5ef-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 13:31:26 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-44a5174670eso1433550f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 04:31:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a98b768fdsm24604851f8f.33.2026.05.04.04.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 04:31:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1777894286; x=1778499086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0hxkgJFS9D2umZb9rFCDQc6z7aiWZ7JxYsZ+KZkGIA8=;
        b=VoPtVb0dQqvJj4fN2WlvUG413Yl2w8VKhQgN7pzytkClkwH+9zyimOT+iIVT4B6mZw
         EPplpTAwFMDwsQmKzqb58MNs6JBOOYgdKGNOQVIPAQbufFRe5qyzHV47fZ7QRNJFGzPW
         WN0PAOaE7kGykqwDr/gDatg7p89WoZnD5ip1PwVWMeyrAC9K6W8TpQyJXtx4X0vZp+9R
         BFpgH+CBslRWFjx2VDCUv6J4NvoVRz8ctw4700rEzDd2v7RLjeiqI6Svs2m1cW789x1A
         V2qnupi/5FzCs3najCL7/MP+3tR0ew5QftnTGlvDIOYqjLM4C2VAjNg606/y2bL5bV6k
         2WqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777894286; x=1778499086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hxkgJFS9D2umZb9rFCDQc6z7aiWZ7JxYsZ+KZkGIA8=;
        b=SBevbBNW5moVW9p/ninPaX7MLrQp5PcYT2WoBkEl+cKhHgAjWk8qY4HHHT+A+VDTsc
         gP0p10gLLNpVC0wYpfm127Er7xX0T4pz3I+rTpX/5D1KLA7tPg19OAP2nlrExv4k8QAQ
         EEtcXysfDZtFPeVicSS4x85TAU94iEO6JQWvh5zznKXQLQyLC/24CoW2yaSsf3W3SNTl
         c+H7tY2LIO53CPBfroCzow9nM3Z8N6jc3kO5HAGkhZ8yo8pkwB9mJh7CUpPRZI3eTjsC
         s/3Y5qYnu0KpPs7lHIITk7Ym2x7j6ZJvueivqioYSCNwqGK1mXqEB9hKOy0DLhdiudsK
         ckfg==
X-Forwarded-Encrypted: i=1; AFNElJ/TUjwmSiuVBpbMchlIQDkOrM6B5g5MFeO+FYhYO6UW73qDdR8YOwTMzlnTmwXn4YXT+pJt3+wv6pU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvZ0tfOvRJTH9X0IjTQoE6R50WKzGC5bbtKvRRusu5asZ2ir86
	rA0nvQXT5kbGCCOv529AFJlGjOkey0WfsRVMP8N3Cpy/hj77B5GTtj58GxuOXwBppg==
X-Gm-Gg: AeBDievHqvcc+dD+GZaAdee5MUsNpY8IBvVgnk6227OtTEbp83cdDHQiaCk5iXf73PS
	WLnhn2evMqWXVW9Z/zyJqD1GYdpRNUjIBd/29kTH3Bn1NjMp7JrAxTC6ovboxVILw9yyM/kCsY4
	1bYEMxMU+evtuhmszSF+aiv4OSi7lsl7E5EBu2409e4ER9v0qYl7c8G/WrBGADGiaXIqlulkRrj
	4VEZ1KO8k9/MBajJjD6FFMl62oh4b4YClovPsw5YD9ROvmlsCZ6J7OhYxeRrlSJW3oZ023+hdRG
	pAFer8JlK3DqpL0XaDmYdS2IZzkHPk/bgBzt24i2O3LLb7xLXwXWaqTZNNlUASz7ViXIyz/hlxQ
	a1X0zntBESVzDcT/KCcHRZoFzSYgfyYQP5uhLvWhyoOR5C3VlR0PvYtet5U+uqGbgN1cft9u1+m
	ekgTKu0uLlmNEb6Tl1xoza+F6Of7rqCvZ/eXS6YN43V++apA70Ev5f5fdH6paOFpciUjkFApiJT
	h7reJYYVuzl/PT2BfoK3z1QKA==
X-Received: by 2002:a05:6000:18a5:b0:44a:b0a3:7c1a with SMTP id ffacd0b85a97d-44bb558c806mr14889417f8f.24.1777894285631;
        Mon, 04 May 2026 04:31:25 -0700 (PDT)
Message-ID: <62ae456f-3ed2-450d-aaf2-bd9cd10fbec7@suse.com>
Date: Mon, 4 May 2026 13:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu: identify uninitialized CPU data using BAD_APICID
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260430114647.94526-1-roger.pau@citrix.com>
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
In-Reply-To: <20260430114647.94526-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1777894286-E2969443-43CF1002/0/0
X-purgate-type: clean
X-purgate-size: 1562
X-Rspamd-Queue-Id: D7EE64BC64C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 30.04.2026 13:46, Roger Pau Monne wrote:
> Uninitialized cpu_data[] entries have the apicid field set to BAD_APICID,
> not boot_cpu_data.apicid.  Fix the check in cpu_smpboot_free() to use the
> correct condition.
> 
> Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")

I think this isn't correct, and the issue here is me having overlooked a
dependency between that commit and the one introducing the line which
you change: 8c15d3d18725 ("x86/SMP: guard socket_cpumask[] access in
cpu_smpboot_free()"). Both changes were committed close together, but
they were entirely separate submissions (well over a year apart). Hence
as an individual patch that latter commit was correct, but on top of
7126b7f806d5 it would have needed adjustment. Since 7126b7f806d5 wasn't
backported (while 8c15d3d18725 was), the fix here also shouldn't be
backported to anything earlier than 4.21 (which indeed the Fixes: tag
better expresses).

Jan

> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -961,8 +961,7 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>       * In that case the socket number cannot be relied upon, but the respective
>       * socket_cpumask[] slot also wouldn't have been set.
>       */
> -    if ( c[cpu].apicid != boot_cpu_data.apicid &&
> -         cpumask_empty(socket_cpumask[socket]) )
> +    if ( c[cpu].apicid != BAD_APICID && cpumask_empty(socket_cpumask[socket]) )
>      {
>          xfree(socket_cpumask[socket]);
>          socket_cpumask[socket] = NULL;


