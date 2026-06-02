Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ONIHMS6HmrZJgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:13:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C25F262D325
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:13:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324755.1590251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUN2r-0007QZ-Bp; Tue, 02 Jun 2026 11:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324755.1590251; Tue, 02 Jun 2026 11:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUN2r-0007Ot-8H; Tue, 02 Jun 2026 11:12:29 +0000
Received: by outflank-mailman (input) for mailman id 1324755;
 Tue, 02 Jun 2026 11:12:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUN2q-0007On-KK
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:12:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUN2q-003Mtl-0G
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:12:28 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eba8d-5cb7-0a2a0a5109dd-0a2a4503b286-44
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:12:27 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eba9b-672d-0a2a45030019-d1558032d5b4-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:12:27 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49068493267so64181865e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 04:12:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e26050sm51885895e9.9.2026.06.02.04.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 04:12:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1780398747; x=1781003547; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JPxX7Ifv6lWigOe60Y2kDbhE8ZcrRgMOLX0pCJtp43o=;
        b=ScpQMwjBF8/0+W4SElZzZoq/xhvRN4lFLlMu5ZIAGVciRgrpaNR2U3vU+owJOa7c+u
         0aMWcr/5+5V4VH5xfdpsibeP5QSGgk2xsK3PHlM1Fe6Yl7XcTeZtlGx/gBQ9lZRrFJDg
         LjipejvWVX1JSt8TO+xGct48FypZETDk3XZ0HAxBgWpUG/FbYOOqczmGzP4SVPMHv2pg
         kZ/u2bTDhuIlydn7GyCWiFQBzNH2SYRjc63EZgxIqT0YnGJoUOOGaeTwj9+7ZzDv1NwW
         LsKXosxyamM6jLkKHouYuReQhgqGN5eXQddob96nG7dXQ6VYmfbZndzEvt8efhGWRKOz
         WA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780398747; x=1781003547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPxX7Ifv6lWigOe60Y2kDbhE8ZcrRgMOLX0pCJtp43o=;
        b=n53eV6v+jUplAcfZ3Ml/gVbDrKbxemO4CqSbWcJK7T5aQFMt+Xdr400H938Nwb5oGp
         UQZ2EDsp+INK5iZpWDNYFc4/W5AWizHenR7kPdQXLxL7Yqr8JDd2nKBsL+nthEASdKYx
         h+sEw2dzLTWa4nheLHrxMish4fMVz9slDZi+5mXoaEF3ruiYhwgzX2tlFjVwCOTMNwqX
         W4R7y25pKqU5fARFM4omTfavqbiZ9sL3RBxTzWOiNEh2NropdgcNpAOTtDcVY1nhXF/Y
         Y4oPgt4/z7CItvtYnCdwEOQfCuOejO1wmJiE2h/wKzYABbpuuA4OEFAf39vaKLQQ1LNV
         eEeg==
X-Forwarded-Encrypted: i=1; AFNElJ8Hkb+WxC5KcjQHKiwJkeicFhiwvDHDs/1+6kF21S/PRRo196B3kPI9QPFVQSepLPay5y0G/aUNb/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxalQQGsnN7XNlu9xrSHVD+WbzHcL58fO3KFSKIGttQ3fUrmKkn
	MemJiK5zdRkyd54FXIb79EEOIhpmfuHIU3J0C1DUYRuBQFYeH4jvDaj4ql7B5xkOIw==
X-Gm-Gg: Acq92OFht4P3UWlq98PK10+V4MmHKVP+0T58TO7OvLzsm4rbIGt/i8jILKYgU9aXV5s
	kqtbk48O0PBaSutNRJsY/CtVKWhkkZtaHdFd/D6Mmo+a061MWU/fyKe1EQZASKVv/wQdVShghco
	Ffz5FLgpYTkDwqKd1NGKM0n5g+5hM4RVbJlQBvrWrr+na1DWsc8onq2QFzBsOvvMTytMrhTXVYp
	UAmYPoT0qqKOZVo+0kUxcZaSkt9clh9Bjb0uIVYIvMcMmL7vFNiSZzXMSglL+Suz+uRJG8iIh3S
	u4OduR7IQxchvKeUGjRB1N0uDVy/MUb4V50seUTRB4Ma2cgj+NebtqhP9yryEfJ80UNdMi8Udek
	LOjZrpXlWuPjP6lIV8yobRAugf1zwIlCAr504s0mEbb/v7gJYzak5ViKbZ6r2kVxAykKlvT/Gy1
	cMkYUtLNrS25alfpHUQtm2OexyYDydp6Q+vEWwc+IJ0fdbpqMKQ0IJaYH8NxkQsmEmNESaInW3n
	52mFdPchNRzbPFHJi8eNmO6oA==
X-Received: by 2002:a05:600c:c48e:b0:490:a646:9d75 with SMTP id 5b1f17b1804b1-490a6469ec3mr220373435e9.9.1780398747168;
        Tue, 02 Jun 2026 04:12:27 -0700 (PDT)
Message-ID: <ea33e3e0-f9b3-4641-b5d4-281b5ce61c9e@suse.com>
Date: Tue, 2 Jun 2026 13:12:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/riscv: fix switch_stack_and_jump() for range
 beyond 1M
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <21bc40d4a09bb4cfe0999430ea7e65b369fd4033.1779712171.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <21bc40d4a09bb4cfe0999430ea7e65b369fd4033.1779712171.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1780398747-39B7C938-C9F6D9E3/10/73395122804
X-purgate-type: spam
X-purgate-size: 1055
X-Rspamd-Queue-Id: C25F262D325
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:baptiste.le-duc@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,vates.tech:email];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 25.05.2026 15:20, Oleksii Kurochko wrote:
> The `j` instruction (JAL x0) used in switch_stack_and_jump() is a
> J-type instruction with only a ±1MB range, and that this can
> be exceeded in some configurations, causing a linker error:
> 
>   relocation truncated to fit: R_RISCV_JAL against `<symbol>'
> 
> Replace `j` with `jr` (JALR x0) via an explicit register, which has
> unlimited range.
> 
> Found in a downstream branch when UBSAN instrumentation was enabled.
> 
> Note that the `tail` instruction looks more natural here, but `jr` is
> chosen instead to avoid depending on how the assembler expands `tail`
> and which scratch register it uses (`t1` in GAS), which would need to
> be listed in the clobber section of `asm volatile`.

Hmm, looks like this indeed isn't standardized.

> Fixes: e66003e7be199 ("xen/riscv: introduce setup_initial_pages")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


