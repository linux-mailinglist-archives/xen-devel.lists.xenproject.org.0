Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE+VCFVYi2lgUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:09:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F8511CEEA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226606.1533121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqJ4-0001dI-A3; Tue, 10 Feb 2026 16:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226606.1533121; Tue, 10 Feb 2026 16:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqJ4-0001bJ-7Q; Tue, 10 Feb 2026 16:09:42 +0000
Received: by outflank-mailman (input) for mailman id 1226606;
 Tue, 10 Feb 2026 16:09:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpqJ3-0001Zu-IA
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:09:41 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e230b209-069a-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 17:09:31 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso55688065e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 08:09:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d78cfsm93973395e9.1.2026.02.10.08.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 08:09:30 -0800 (PST)
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
X-Inumbo-ID: e230b209-069a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770739771; x=1771344571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RZ6QTADTxJ1Sm5PuJcs2ICjg9CNgXCtmQ/pc3kg99iY=;
        b=VdNbitNAQ+dirdZUMFBfyvMks8DtoX8rgud+CY0irPuv51K8CXFe/YaA+LLn+c/ur7
         zMt4UR2rHR5KcUQV4pxBlKUU8qEtMSATZaJLQhbM6c+bXsfeLkHN080KLw/bj7ikN/gB
         QP4K09mclfYhEV/GcRJjC+gASFQ2JFzXkRFuDiRqqw2ljtqEbss2XWMZCLOkzXtruPqm
         9Cm6Kiv5W5u99RZ4PWusszacdwLwFGreUoMXG2qSdMickN9cWPJyjBI8bN1ciG+jip4x
         gnIHaz3zaqoOkgTPZ44o2qTlQ0v9iAmfa0vh1qHkNkIsLqdcL5ZMAbiSpvd7ZwWyMiRt
         YauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770739771; x=1771344571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZ6QTADTxJ1Sm5PuJcs2ICjg9CNgXCtmQ/pc3kg99iY=;
        b=njxYMcn1lt5U7JTOaxVUyOKmTbDmrv0g7geLKD77zRF1z9ewsLytfYu4BY7PJHJ1r7
         VaIbvTbWpCtwIgd8FPckc5PQlKnS0Ttk1LQTLLfB4HItZa9B6rXOhcnMRc6muWiB7WcH
         vw+MwpeI20Pnx8gKL5kT+aVqd3zYZgOOiv60O8HEn3nD0b5wUx8rkHZ7cKveMo3CQ5Fx
         k1LLK6oCDJsvwdJks9uOKPmkYa9GhjoVmOZJajfHpNHcTlaDtzG6WXYywv4H8T8pGJFo
         z1qJ8s8CEse0QTElA1BXRG0BBZ93DLourZBFy7JVhOHJudqVeWw7zgGeds9wDPQQKdig
         L3lw==
X-Forwarded-Encrypted: i=1; AJvYcCVy54k4EevQWMYgYaPJ+BixyuZe/cfwBZLVkG+Xt0PuIQj9u9HiB35zS8aqhNQmVcOt+u+bZA0HiWE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4TiT2SPcnFEPpLGzvTnl4PRV5V83IbHnfmPsPqgFWs5eJWEOQ
	wTGtIAfJs7HPYsbYAFtCr79MKeHRZIt5Ag3WIHTVVUmhIHnSZgYXrcQj2sfxnU8wxZT7RPL+7tL
	WAwPu/Q==
X-Gm-Gg: AZuq6aIrQHoZaKXw51tJAp8+KO8oEj+KGbu9ucmVVLycAHbci65bq7qtev7krlY+iaN
	krWObBGzCSqIvsOwy+Nu6r3IqtZYgCtmxHT1komW35qdBZUAgqd8rlQA4wn25wCJJ54qQOwg7Yr
	cdj8KvmBYWXIHxhEE6NmtUHogdJTbtUvImofqaNdfGn99N2OsEvFE3nzT7i4PcCK82z/eyxvg85
	nyFVGS9IR1zzwOHC5P6Lr2050iuaTdpV0/q0DSOaCrJllU69ff5RxgGD43uGPxfmnM/GAXr0AKg
	TBpWmzrMPgQaQGGwcdN8yp2EgfH9cEptvfLtQq2KT9omHMtnyO1nrusamsnN/85AmhUrEzU/BFh
	TCaDickE7iUYVlEbMZm4fhM32ekPb3Q8RdB8T3MsdaWmBMn1Cu3hytn6HV2W0XBpPZZAb4geMxN
	7yQ8DHm16uo5zYUuagT2lcz6oZIofYtrJLv1S+HVQKEuerD4i12u1DEC9udukMxIJ0y3paOLmSr
	KSpm1xG0pCgZew=
X-Received: by 2002:a05:600c:45c6:b0:483:29f4:26b3 with SMTP id 5b1f17b1804b1-48350229208mr41822655e9.1.1770739770976;
        Tue, 10 Feb 2026 08:09:30 -0800 (PST)
Message-ID: <d9b768cd-6454-4fab-a0bb-e2543c68402a@suse.com>
Date: Tue, 10 Feb 2026 17:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: always consider '/' as a division in assembly
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260210151110.26770-1-roger.pau@citrix.com>
 <8bef9911-2f37-4cd1-bf18-29cca646fb09@suse.com> <aYtUkeoX273I8ABq@Mac.lan>
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
In-Reply-To: <aYtUkeoX273I8ABq@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:Bertrand.Marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 84F8511CEEA
X-Rspamd-Action: no action

On 10.02.2026 16:53, Roger Pau Monné wrote:
> On Tue, Feb 10, 2026 at 04:27:33PM +0100, Jan Beulich wrote:
>> On 10.02.2026 16:11, Roger Pau Monne wrote:
>>>  Pass --divide when when available to signal '/' is
>>> +# always used as an operator in assembly.
>>> +$(call cc-option-add,CFLAGS,CC,-Wa$$(comma)--divide)
>>
>> I don't think this should be done here: --divide is an x86-specific
>> option.
> 
> Oh, that wasn't clear from the output of as.  I can make it
> x86-specific then.  However, is there any chance of this behavior
> escaping outside of x86, and hence would we like to ensure this
> behavior on all possible arches?
> 
> Or is it possible that other arches re-use the --divide option for
> some other functionality?

It is equally possible for that to happen (if some target needs to
support '/' as a comment char) as it is for such a target to then use
an entirely different command line option. Furthermore, --divide may
mean something else on another arch.

Jan

