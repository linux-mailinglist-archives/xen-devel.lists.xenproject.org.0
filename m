Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKQ8O3GMlGn6FQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 16:42:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CA814DA81
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 16:42:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235180.1538234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsNDP-0002b7-Nv; Tue, 17 Feb 2026 15:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235180.1538234; Tue, 17 Feb 2026 15:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsNDP-0002Zg-LE; Tue, 17 Feb 2026 15:42:19 +0000
Received: by outflank-mailman (input) for mailman id 1235180;
 Tue, 17 Feb 2026 15:42:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsNDP-0002Za-1f
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 15:42:19 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cee54ea-0c17-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 16:42:17 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4358fb60802so3214509f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 07:42:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc8b1sm36396212f8f.23.2026.02.17.07.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 07:42:16 -0800 (PST)
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
X-Inumbo-ID: 3cee54ea-0c17-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771342937; x=1771947737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T8uUFg8BBXPIHDAIb3RdpSZ2Y9djeAkmVXDbZzUB50o=;
        b=dqzPdQ2a3Ui+acyFIIeZjvMmvPEshhZXRN8d3ja4E63iPYNumWKHCeGrVotagsFsnR
         MWTvzfRy2gIXK9nnpKaV+qHUbOsLfUU3QV7HVXdP6mdX6iW6bIXGAF3NBZXaIE09DlC2
         ohZOAAbhkdaaBOyk6sz1GwRkkZ+lX2oNwb8iXY2ftuZvzt2ZVDHOWSdoNr5tPsdJIWLT
         t4a6UM+B9i7enfjpDpCoVr4F9Oh1CXeM2+nevTXzt9mO5fXkyrsNxFEPHGpspLuFZGIA
         csXeQpRxxCaJ8d11BCgRQ0Rer3vs17CUhM/1v4tjAUDdjDnsQGy3XFDCp5bUuD0KVJXH
         ZCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342937; x=1771947737;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8uUFg8BBXPIHDAIb3RdpSZ2Y9djeAkmVXDbZzUB50o=;
        b=ueJ2GWoaUyjeRhyl8rPNG8T7+w5TNVljxMzmndVXXw1DeVnK5Yt4mkeY+uX6EgS/6I
         kr1gpKfE9sIX/TyXuvhGr7SdxrZy4x2KMpCY1LahmwBKZrx4lqI4Rax63ZGFJorOOCtq
         mV9yCHjSCpxMd1i3eEtr3EMKBXCtNGKMloeYxdk6EWFyb5FkgNR/vMkNrM2Y2fr1LOuA
         ovVVtdJEUaEjeZYjV5+pSeFAixKOw8WA2BJK82gkfi8gGxm72GfF3Lm3GW8QbwFKehE2
         HBMv3Xils4hpLHYbB38y2kGmtW+U3w8uie+Yh8XkDT2F7a1A+tvKnVIXeW/V5nLEAbnu
         f92Q==
X-Forwarded-Encrypted: i=1; AJvYcCURKXSWYmpQmCmJtXYwjnozSShGN/zG2OKPqCsy7lZKE/NelVvXGq9aK86r41G8SkVWWxx9PEbD5Xo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrYLoVdQZ7O8ZkF3IhAorO1i8XEhHuSMyn2MmmdEPZnHhEfhfL
	u8s6VO1rbZ3jjC+pzu6YbMSqA3VKkS2HE0AAt27iCYwaA0Pvpklhf365esQKxBt0gQ==
X-Gm-Gg: AZuq6aIpn7c52Vy14lJS7UkezUyopi7GeLz4r8zVkaVIk6eDdFR97cGHKTL2K3tbgWY
	qjxsHTQn4qyh/ADrkCChiqdTkoLMjhRh2AKwYnQWEamAtet72zt7uuvxTlmqoKv47dXRsVOQmNV
	7Z+VP6zbiOVhNDMdrLSG6UeH8AetlHWgj0aFbnRxOHu0AKgf+9yGeNcI/hVnVmxVOj1eKBwBe/y
	mkB5xzCuyvmMaYaw99nGfDj0MwcfLSJVYHi8ZIOMq5ygeKncsqDSRWsXdsxFfAMlZiOnOzqt6ta
	+X6D4i5SQP4995howMEHSSijNL0YAEqbrmj0JynPbV3W2cVjTxoIPv8Lp1u1ErVGnpi5lXfdFws
	tCM9hmKu02Bw01ybn2URZCSOBNNkrLt65C86nE2uz382nDqIaD+4mlGggfBKNY1+bNygnw+yxtR
	1S5ys/l37uT/5KhwsBe1udbz3FLy4vSfIfZPcZLCC139zHcPTaSjeR9wvHdZ5kVF/nuzLrmCtCB
	9dzjfruvXfwZiw=
X-Received: by 2002:a5d:5f87:0:b0:436:8f7e:a486 with SMTP id ffacd0b85a97d-4379d5e3fd1mr23932319f8f.11.1771342936683;
        Tue, 17 Feb 2026 07:42:16 -0800 (PST)
Message-ID: <f45864a7-452b-401d-9e44-b6283b38eec0@suse.com>
Date: Tue, 17 Feb 2026 16:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/16] xen/riscv: introduce sbi_set_timer()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
 <6d811ceefa3bfc4e6bd5d11b0a4d4eef886bc693.1770999383.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6d811ceefa3bfc4e6bd5d11b0a4d4eef886bc693.1770999383.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 63CA814DA81
X-Rspamd-Action: no action

On 13.02.2026 17:28, Oleksii Kurochko wrote:
> Introduce a function pointer for sbi_set_timer(), since different OpenSBI
> versions may implement the TIME extension with different extension IDs
> and/or function IDs.
> 
> If the TIME extension is not available, fall back to the legacy timer
> mechanism. This is useful when Xen runs as a guest under another Xen,
> because the TIME extension is not currently virtualised and therefore
> will not appear as available.
> Despite of the fact that sbi_set_timer_v01 is introduced and used as
> fall back, SBI v0.1 still isn't fully supported (with the current SBI
> calls usage, sbi_rfence_v01 should be introduced too), so panic()
> in sbi_init() isn't removed.
> 
> The sbi_set_timer() pointer will be used by reprogram_timer() to program
> Xen’s physical timer as without SSTC extension there is no any other
> option except SBI call to do that as only M-timer is available for us.
> 
> Use dprintk() for all the cases to print that a speicifc SBI extension
> is available as it isn't really necessary in case of release builds.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in v4:
>  - Add "stime_value is in absolute time" to the comment above declaration
>    of sbi_set_timer() function pointer.

Yet it still ...

> @@ -134,6 +138,23 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>  int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
>                                  size_t size, unsigned long vmid);
>  
> +/*
> + * Programs the clock for next event after stime_value time. stime_value is in
> + * absolute time. This function must clear the pending timer interrupt bit as
> + * well.

... says "after" when, as per my understanding, it's "at or after". At which
point the final "time" in the sentence becomes bogus (says me as a non-
native speaker). Which in turn is what my v3 comment was triggered by, as
"after stime_value time" to me suggests something relative ("this amount of
time needs to pass"), when that's not what is meant, as the added sentence
now tries to clarify.

Jan

