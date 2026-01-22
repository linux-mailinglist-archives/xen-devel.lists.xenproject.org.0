Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M9bDqovcmmadwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:09:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9218067B56
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211075.1522621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivNJ-0000ua-17; Thu, 22 Jan 2026 14:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211075.1522621; Thu, 22 Jan 2026 14:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivNI-0000se-UL; Thu, 22 Jan 2026 14:09:28 +0000
Received: by outflank-mailman (input) for mailman id 1211075;
 Thu, 22 Jan 2026 14:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vivNH-0000f4-7b
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 14:09:27 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4da1d78-f79b-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 15:09:25 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4801d98cf39so7916265e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 06:09:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470474cbsm69600245e9.8.2026.01.22.06.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 06:09:23 -0800 (PST)
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
X-Inumbo-ID: f4da1d78-f79b-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769090964; x=1769695764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dQkypLvfVUt90SuOF6MlV8sgfE9yil7rd9/f4gPGUaY=;
        b=CqofZ3+PsQIwolRgT4CD9+Zne58jocjKKkB6tzk6CIvhKNe4ZAnTJcQsjj403r0Zk9
         oZ3cL4zYZxqdylQHWiGaTJ4oE3nUOa4QVKfOc+UKbKyWcMTAG+oLfkyB18VMVQCVSq2R
         zKLppD02J1lR+td+DBxf58x9ZuiPPOrH3npM9VdMwFm8/DcSRJN+7vxpCWzvkcMYqH0i
         7JUvVCyccRFWSvCWF6kcyFI7gvsdRhdBTS/JS7PqcQzxoKhmsftmAMWqjMd/8juTocQG
         S3J5DlqYO99fUWrqpr7krogaVTZvPFHnWpJ4srS/Gj6U5LufdenpSj9IM1rqe+wVBzFS
         y/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769090964; x=1769695764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQkypLvfVUt90SuOF6MlV8sgfE9yil7rd9/f4gPGUaY=;
        b=thM2a4icjvxWc0nYN2IWS3D0OxTyb7Gt9XWGRDw6l8xQtAanty1VWne+2eVWZRBQI/
         0BMji6ZdzWT5c0MVrZareXjKpVX5FKBFMBvgyrz1qzN9f1NcIpqF66/VcJiBqk1YfEl+
         VM1JqJWbrgng1KDBIhR29UhDKBPWcSVP9iDOFa9YCDtGyTkz8UkBVTHrddezKqBeChtJ
         cujS9qFk+mRDYOvOENWcoIciCZsRPFnpJ6ySV6ZeoePG4K9hrqClC13lTe/lxQ1mlSiV
         UH1oKF20B3CFoQ/nJ6boZRyDQ/AAV7BmqX6gxx7WKxhp6lu4rw0wo0QYaRyrOhF5Gqhg
         LvmA==
X-Forwarded-Encrypted: i=1; AJvYcCUdw84JdUQl6+S68DQvb0SmbXvyLMAfUinAgOFOAJA7Pc+QJNhaF0EHbnu+OkVF1ZXVR9SKBtyPTWQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLBoqy3Jk1e872/g10AwxStyyJ/V8mTfIvix2Fwvz+85lQUGTa
	cKtrrCotlngBZB19ccL91T3lSbgD8rg42CQIPMC+15+ipI6sH0uIAsYl987iEeDfEg==
X-Gm-Gg: AZuq6aKC6GBHlQmQeZ40fSPewmurgaccDAuP2Xrf8v+oUQMQA145IexJiI9A40DkYmk
	ZjfXYYMgCMTE96Hn8ifJy1i5PoV0FZx8w9aQj9flTFPylsyFapFt52MZ3M4jcKbPhkQxPR6CoO0
	KuP4um/F5gdsATo6cTie20BxTuBkM7Sml/eU+BRc09MIgIMC5+AiFeIWDD8ns5bTcs/H/n8r+rj
	l3CZHG/krUCCuufC9AYyV07rwHBF8qP9uUHaSAB5mlGgQhd8O5vVjJsUVbGfb41ngM5j6vRrsgU
	UldrbAUYWqp4YcixSu5oorqAk/XbUDvn2+SegE3Tbuxst+60dzwPxVwDjfRZN1eCYM80hWWCex8
	8PtIx/xbnr9Tg4woXBDDHG75IK8lm9sUVgVw0UwpdiqIjcGRmM6Rd6vzYe2sZKHcTn/PNv9Ltei
	MjpUeXDEfSaOrcq4bcOdWVN0g+nXei//XKYOiFWJ952rZt2mVwlvT0/qbJP9aXp6uH3UkyiIj6+
	xvYBepg/XdkUw==
X-Received: by 2002:a05:600c:3509:b0:47a:94fc:d057 with SMTP id 5b1f17b1804b1-4801eab54e2mr258889475e9.2.1769090964288;
        Thu, 22 Jan 2026 06:09:24 -0800 (PST)
Message-ID: <a8081572-4147-4761-87e6-abaacadacdfb@suse.com>
Date: Thu, 22 Jan 2026 15:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Move NX handling to a dedicated place
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Julian Vetter <julian.vetter@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260115151658.3725784-1-julian.vetter@vates.tech>
 <69b511db-654d-46b3-aca3-3f37f30d3473@citrix.com>
 <c4c2c376-ab6b-4bb3-9ede-091f791c1427@vates.tech>
 <335949fc-059e-477c-9b2b-ddcd2f144300@citrix.com>
 <4a38c2ae-dc60-4fed-b30e-81a02b657e92@vates.tech>
 <92c02d2f-ccc5-42ce-ba0c-076fdc75e1fe@citrix.com>
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
In-Reply-To: <92c02d2f-ccc5-42ce-ba0c-076fdc75e1fe@citrix.com>
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9218067B56
X-Rspamd-Action: no action

On 22.01.2026 14:57, Andrew Cooper wrote:
> On 22/01/2026 1:48 pm, Julian Vetter wrote:
>> (XEN) Early fatal page fault at e008:ffff82d0403b38e0 
>> (cr2=0000000001100202, ec=0009)
>> (XEN) ----[ Xen-4.22-unstable  x86_64  debug=y  Not tainted ]----
>> (XEN) CPU:    0
>> (XEN) RIP:    e008:[<ffff82d0403b38e0>] memcmp+0x20/0x46
>> (XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
>> (XEN) rax: 0000000000000000   rbx: 0000000001100000   rcx: 0000000000000000
>> (XEN) rdx: 0000000000000004   rsi: ffff82d0404a0d23   rdi: 0000000001100202
>> (XEN) rbp: ffff82d040497d88   rsp: ffff82d040497d78   r8:  0000000000000016
>> (XEN) r9:  ffff82d04061a180   r10: ffff82d04061a188   r11: 0000000000000010
>> (XEN) r12: 0000000001100000   r13: 0000000000000001   r14: ffff82d0404d2b80
>> (XEN) r15: ffff82d040462750   cr0: 0000000080050033   cr4: 00000000000000a0
>> (XEN) cr3: 00000000b5d0e000   cr2: 0000000001100202
>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>> (XEN) Xen code around <ffff82d0403b38e0> (memcmp+0x20/0x46):
>> (XEN)  0f 1f 84 00 00 00 00 00 <0f> b6 04 0f 44 0f b6 04 0e 44 29 c0 75 
>> 13 48 83
>> (XEN) Xen stack trace from rsp=ffff82d040497d78:
>> (XEN)    ffff82d040483f79 0000000000696630 ffff82d040497db0 ffff82d040483fd2
>> (XEN)    0000000000696630 ffff82d040200000 0000000000000001 ffff82d040497ef8
>> (XEN)    ffff82d04047c4ac 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    ffff82d04062c6d8 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000000140000 0000000000000000 0000000000000001
>> (XEN)    0000000000000000 0000000000000000 ffff82d040497f08 ffff82d0404d2b80
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000800000000 000000010000006e 0000000000000003
>> (XEN)    00000000000002f8 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000099f30ba0 0000000099feeda7 0000000000000000 ffff82d040497fff
>> (XEN)    00000000b9cf3920 ffff82d0402043e8 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000e01000000000 0000000000000000 0000000000000000
>> (XEN)    00000000000000a0 0000000000000000 0000000000000000 0000000000000000
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d0403b38e0>] R memcmp+0x20/0x46
>> (XEN)    [<ffff82d040483f79>] S arch/x86/bzimage.c#bzimage_check+0x2e/0x73
>> (XEN)    [<ffff82d040483fd2>] F bzimage_headroom+0x14/0xa5
>> (XEN)    [<ffff82d04047c4ac>] F __start_xen+0x908/0x2452
>> (XEN)    [<ffff82d0402043e8>] F __high_start+0xb8/0xc0
>> (XEN)
>> (XEN) Pagetable walk from 0000000001100202:
>> (XEN)  L4[0x000] = 00000000b5c9d063 ffffffffffffffff
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) FATAL TRAP: vec 14, #PF[0009] IN INTERRUPT CONTEXT
>> (XEN) ****************************************
> 
> Huh, that means we have a bug in the pagewalk rendering.  It shouldn't
> give up like that.

Is it perhaps too early for mfn_valid() to return "true" for the page table
page in question?

Jan

