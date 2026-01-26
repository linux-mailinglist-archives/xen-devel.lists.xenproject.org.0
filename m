Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOjAFT1Gd2mMdQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:47:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82168734E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:47:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213567.1524026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkK7o-0000bn-JL; Mon, 26 Jan 2026 10:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213567.1524026; Mon, 26 Jan 2026 10:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkK7o-0000Z7-Ga; Mon, 26 Jan 2026 10:47:16 +0000
Received: by outflank-mailman (input) for mailman id 1213567;
 Mon, 26 Jan 2026 10:47:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkK7n-0000Yw-5s
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 10:47:15 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f4c2f2e-faa4-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 11:47:13 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee807a4c5so45764345e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 02:47:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d8bebfasm308650875e9.14.2026.01.26.02.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:47:11 -0800 (PST)
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
X-Inumbo-ID: 5f4c2f2e-faa4-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769424432; x=1770029232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tD4v2anhJcga48XigqYXAbpz+irs7hDzKUZljjovD8M=;
        b=adRm99MArSGajuwxZaZrLhCJvr3rxXBU/OMY0R3uAI2hvLSZt/dmM/UOk0w6AVkD1E
         uKx909NR/U+J5UnCh3vpEimpMCPTh71u1o/Qfr+yM62IKsIi/0Xo+r4w6DjsdxEngLe+
         TII3E1b2lXiuLLdxnFI8WiJvcD9PQP+DNMFODKO2IdbWr1UgVEa0anm2bQkKYIHR5pve
         cI1Bl0l1jVTO6FjSNmGdA5jlpVWMjC5heGq0piSC2DKCPyt9DRE6ANSFsGkOCATs2tA1
         +mqAoOc/fIqbMPLAIk/he+fKtPXHMVnp27IQ9vbsgV86+hZQHnp0F3oPTlxAf2ClDB8b
         fL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424432; x=1770029232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tD4v2anhJcga48XigqYXAbpz+irs7hDzKUZljjovD8M=;
        b=bt4JbRoMinmy6+c0sCpkBULtqt2RW+mKNXFEQ0S21kyzUxvhEy4UTqAGr5uiKilRr/
         LVF3PebBXxwBMDw5PlA1lL3OkYln/5ZQcVlxXbBOi8ACrRhpAxWTaoj4PSruV9/LBqxS
         cr0ZZ0elY7V0dGMax4dN9Tp3RuKsjDsaNuilVSxxIwa6PR3D1u1vVn2QMXAM+qvk4f0k
         t8qbTfUdiaKchUkD7j4ajRkdyTxpdFxSnczGumdhyEohNANrr3gGuZ9zQ3qBau67nF91
         rJbEvIcIh8SfWBD2rUr6eAGGXeZWG4uN5zMBeehcZZu3K1R54I0RKVbRxIMEhPx87Mw+
         fnLw==
X-Forwarded-Encrypted: i=1; AJvYcCWOLWLzOmuoE3ObAPmZRHSMUqfjuyy+nr9r7JUyeXXxpQXJaEneaInFjrLNifE2okDF5iLHY62q5SE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz68+Z1GatVlpiYbZHSEuEDoaUN/Y0QKOOsjm0ze0tSq/VRndSQ
	9JjmEsFVae7L5y+cjJGWEq8R7Dm68RIRkKtpPIsvAqGk8DnGW2mdcgyUEL33bSUCxQ==
X-Gm-Gg: AZuq6aLEHt5YOMcgVMJtRTqvJMTCVbgXA8jQg75dqZA9W5PFg8JFgI1P0C5dlW82m9V
	57xLlHKwao0T2yqND7n5QIqVWah8GGIfp9wrXGp99+nVw7d3ZR5SWyjK4aiDDcPClpuaWLwTVyb
	mHG967gTqOHtIHAVj/1pA7g3dTKH7+ZNcb+J7KQmE0I5yxEUQ+vYcb5xnte9FHrqQsmCHdrUfIa
	tBRJ6WbzyCmX7iS8wSecbgtGsCc6gN6FDwETSXlxVf+vgOb+RirUt2onL0lCW/L/6lh6QqHaSIK
	oJbrlSfMbzx0N8Qym6HFvk2TubKfR0lciVs/X04WqvDw88YJh/b8KljMr7DUFfnO957I4Qvs3Xs
	G60Cn/1QxGdlwi1LXFHpgUVZ2hLTyppW95P6aVqOyevux/3RdW6V4jslTOT+jez4UB+EMAQP5TB
	UfGVJKPJnmygnAzmFza3bevDIWad+qTwxjXLnLmSGjqf4giPaJ93AOapFtaXx89FbE7riqD5aAw
	QxT4GUEKZFmig==
X-Received: by 2002:a05:600c:4f86:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-4805cf6749bmr57091305e9.22.1769424432325;
        Mon, 26 Jan 2026 02:47:12 -0800 (PST)
Message-ID: <ff2d0edb-6c98-4f92-97e2-a2aa843b0ebe@suse.com>
Date: Mon, 26 Jan 2026 11:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: dump GPRs and CSRs on unexpected traps
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <0b57db49d40b336429dd4fd63faf18f6bb17ac1a.1769179393.git.oleksii.kurochko@gmail.com>
 <9a68c272-1c76-4f1f-89ff-ff86d5181bcc@suse.com>
 <5e3cd0da-d8d0-4232-9612-14ea70bd66e4@gmail.com>
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
In-Reply-To: <5e3cd0da-d8d0-4232-9612-14ea70bd66e4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B82168734E
X-Rspamd-Action: no action

On 26.01.2026 11:43, Oleksii Kurochko wrote:
> On 1/26/26 11:09 AM, Jan Beulich wrote:
>> On 26.01.2026 09:38, Oleksii Kurochko wrote:
>>> +#define X(name, csr, fmt, ...) \
>>> +do { \
>>> +    unsigned long v = csr_read(csr); \
>>> +    printk("\t %-10s: %016lx" fmt, #name, v, ##__VA_ARGS__); \
>>> +} while (0);
>>> +
>>> +    CSR_LIST
>> Same remarks here as above. The issue is actually worse here, as CSR_LIST
>> uses "v" which it isn't passed.
> 
> I will declare local variable v in dump_csrs() and use it. Considering that
> this macros is declared and used only inside this function I think I can
> not pass it to X macro.

Yes, that should indeed be fine.

Jan

