Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NSaCcRxnWmAQAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:39:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90336184C33
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:39:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239654.1541057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuosk-0004Ve-Sm; Tue, 24 Feb 2026 09:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239654.1541057; Tue, 24 Feb 2026 09:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuosk-0004Sv-Q7; Tue, 24 Feb 2026 09:39:06 +0000
Received: by outflank-mailman (input) for mailman id 1239654;
 Tue, 24 Feb 2026 09:39:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuosj-0004JR-Ld
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:39:05 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a87ae506-1164-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 10:39:04 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48378136adcso31786145e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 01:39:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c09897sm25926203f8f.17.2026.02.24.01.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 01:39:03 -0800 (PST)
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
X-Inumbo-ID: a87ae506-1164-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771925944; x=1772530744; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oPdr4BEdKwpgwMsKfhbkN2p3SMdJv/s6l0UrV3280b0=;
        b=aaCJ4uVBKRv55oYcn2Kwqe4gC+pNp34Ci8/eGLmM2nrC54AmXtduPQDVZ8HCnN1mrn
         Yt3fP5+furvtRF5WEvkUM7dXgqpOx7aZyTicwioTrsmln7+v4brNEuSCjoKiZWALwDpj
         Nc6RaeMi7d3GMW6Jua7wa3UAswbfYO69LW8jgtCVygED+psSQMHWBDEWberocojz6DPx
         SYI+xS/gq7uglkAqfMibdc3ILc5uQDafFEa+Z7Yi1GsN0UhgZJL9RWDrTlRtTAbU40AM
         nTEuQFBgnJm2S1o+rMmjNpi6NMTqZK/KBwVn4y8ppbQbUY9lt9TgEox9RyKg1VQ8p0wQ
         r2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925944; x=1772530744;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPdr4BEdKwpgwMsKfhbkN2p3SMdJv/s6l0UrV3280b0=;
        b=v8bFTUDo/TPfqm9etErB3R+t6oS2AOeFuWh5x2m89EBNRPBZahAlcZrmkswcpIoQM1
         LBz84A+f32Xlg19v99dXHT/yGO2eXQ2kczo+R7Finw+FmuCYx/uDlX3p4yOX21BeRA52
         66NTrj3VJXPWqPlINQckxSl5WU/urD1O585iBIMNghrVzZ7yyhlZA6/EqVlMub0Z6J+u
         +L8UArD+G1WQwIEgp+oNswR0bI0yMd2INT5y6dhGIcKqNziqvrR9D/PIUZ6SupW3l63F
         K3SFEK8UIe4KBTKoHXCuxgonBsWs2Rcj9DVIykT/00fbkVu0kxwIaHfNH8w8oatFz1vH
         PsBA==
X-Forwarded-Encrypted: i=1; AJvYcCWrCvNS1QZPnGa/Po4xnUJmPxs4IPsm7De9ib4ZqtrrPnGGQccwG3Wz5IUsWfQ+3GtHjodFP8Z4YS8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkX91wAvNARntvY6hRuQkKO8crxWCm/jRCH+RVPlmp7KvvSGiA
	D0pZmKqmAIryVdOByyvwosuwBUvStxdOKhp7XgRHbkmxvF6pLX0s+hMlhyavJ57TLWZHWrRZS62
	MmYA=
X-Gm-Gg: AZuq6aJo7p2QBqWEA6YJhjiNSCmX63lQJ55tPJowypcLMfP5XJxfpxDGtpQAlp0PWhS
	5aE+5eJF6QRIv7aNS8ArlvItHkYjW5jCkiprfT4n+QUnnojFkYS+bj+RkCJZ5tfIB3NliO8lX5n
	R9IuoGGgSGfx/pDdylQ3TvAd79bPiE4vJFyVk5nMg8pUjPW3xBSfb60j353kAUAb1pKj2amH5cy
	5GY8jSIBKd2MJgqSV8Ym7InqlqXqjr/sYORmggRt/OqTZAHHZrBQ+zn56yr1EnyZfz2XzCiV2Q0
	Y6IrQlR8wE4S+EyMG6JrMdSso2dyWrFpCS3oRDAWwrsm1me6+S2NdVW2o7YZ76HPs2uuT5n/mSU
	5l4U9BHGkTnriFMn6EGLdPm3oEeg3NM/akeaKCjIb/+kzHGiv1jkMbJKwdW4tjyveYCkOUJssQ7
	NhmgU5Z7fo/sSgb3LvAQW3p6h+apUZk9sG4jHZp95VbHKQmt0mDqNucL9CnCRjvhA5GiotJqbfI
	uN2xbHuVcCsa0Q=
X-Received: by 2002:a05:600c:3484:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-483a9603734mr192449605e9.13.1771925944253;
        Tue, 24 Feb 2026 01:39:04 -0800 (PST)
Message-ID: <dd450c3c-754f-4b85-94e7-16bc88afc56c@suse.com>
Date: Tue, 24 Feb 2026 10:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/acpi-processor: fix _CST detection using
 undersized evaluation buffer
To: David Thomson <dt@linux-mail.net>, jgross@suse.com
Cc: boris.ostrovsky@oracle.com, olekstysh@gmail.com, tglx@linutronix.de,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260224093707.19679-1-dt@linux-mail.net>
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
In-Reply-To: <20260224093707.19679-1-dt@linux-mail.net>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-mail.net:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	FREEMAIL_CC(0.00)[oracle.com,gmail.com,linutronix.de,lists.xenproject.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dt@linux-mail.net,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:olekstysh@gmail.com,m:tglx@linutronix.de,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 90336184C33
X-Rspamd-Action: no action

On 24.02.2026 10:37, David Thomson wrote:
> read_acpi_id() attempts to evaluate _CST using a stack buffer of
> sizeof(union acpi_object) (48 bytes), but _CST returns a nested Package
> of sub-Packages (one per C-state, each containing a register descriptor,
> type, latency, and power) requiring hundreds of bytes. The evaluation
> always fails with AE_BUFFER_OVERFLOW.
> 
> On modern systems using FFH/MWAIT entry (where pblk is zero), this
> causes the function to return before setting the acpi_id_cst_present
> bit. In check_acpi_ids(), flags.power is then zero for all Phase 2 CPUs
> (physical CPUs beyond dom0's vCPU count), so push_cxx_to_hypervisor() is
> never called for them.
> 
> On a system with dom0_max_vcpus=2 and 8 physical CPUs, only PCPUs 0-1
> receive C-state data. PCPUs 2-7 are stuck in C0/C1 idle, unable to
> enter C2/C3. This costs measurable wall power (4W observed on an Intel
> Core Ultra 7 265K with Xen 4.20).
> 
> The function never uses the _CST return value -- it only needs to know
> whether _CST exists. Replace the broken acpi_evaluate_object() call with
> acpi_has_method(), which correctly detects _CST presence using
> acpi_get_handle() without any buffer allocation. This brings C-state
> detection to parity with the P-state path, which already works correctly
> for Phase 2 CPUs.
> 
> Fixes: 59a568029181 ("xen/acpi-processor: C and P-state driver that uploads said data to hypervisor.")
> Signed-off-by: David Thomson <dt@linux-mail.net>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


