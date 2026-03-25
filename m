Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHuGGo2iw2lssQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 09:53:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2AF321AEB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 09:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261777.1554550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Jya-0001Bl-Ki; Wed, 25 Mar 2026 08:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261777.1554550; Wed, 25 Mar 2026 08:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Jya-00019L-Ho; Wed, 25 Mar 2026 08:52:32 +0000
Received: by outflank-mailman (input) for mailman id 1261777;
 Wed, 25 Mar 2026 08:52:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5JyY-00019E-L4
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 08:52:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5JyX-00H7HE-CW
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 09:52:29 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3a246-bab6-0a2a0a5309dd-0a2a450bca80-30
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 09:52:29 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3a24c-ef63-0a2a450b0019-d1558031b118-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 09:52:29 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4870206f73bso27348655e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 01:52:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64703c35sm45275708f8f.22.2026.03.25.01.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 01:52:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774428748; x=1775033548; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FviJBiEjOOk/YLFgmm4rWqSaV+q9nGUgJ78/ddVORDw=;
        b=PG03u3vrpfnDYPXXWJLLA5aLLnLqsV6u2X1PKJJXEfDugISHJb/SQW0rTbYVM1Ptuq
         AvnBGlCBCYuCrH47oLDwIcxzWmvrGpkl7gT8k/AbQvocdArA4rtyopA+ws8CVlRoECT7
         E84ddKZMmU1b2idhTvkJ24ViQ7xUnUOcovwZNpeW2PLKxSAuFoUoStlNAOa6ZeguotgZ
         jvWPcBqwt/XetlHmE3kOgTPtAG50tbVsYli9KF03QqnxZGKYUzRxdobWbrI8O28JVIzK
         RLH0nowQz3Z5jBx5bn99wA+X8WG3Wd3Fd/C96njlhKyqhQHoVPOM5t/EfBO7kp98pgeG
         ujMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774428748; x=1775033548;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FviJBiEjOOk/YLFgmm4rWqSaV+q9nGUgJ78/ddVORDw=;
        b=p4+va153l4/AEqw7AcOGUSLb7ToUxbDv6uN8eUEF9eDiFlVEzscM0DxPCgVmOg4fEW
         XorypJtnAon7j/AtuFjtMSTz6Bw8sESE0euOj+seZztWzIQCx/D8h0Kno/qsI4uUNd9H
         OoRu/++lY5b5zfATcWGmuDtjH/XQeazJKWz8bpwY+dCCVmkIDBoVo5l9yCD4EmaFLxqz
         aTWo2ffOxTOZ7cF59KdiBTtcu7RACui11XVHqAFj7azHnyNwNotQDAij5LL9OEBqaHyS
         TtC2Ylpr5Qb3gYN981kEJQwgtm9r8hvC+lQjzPN4nAaMghcnxEEe5LHANYbPGElg5SrP
         YYVw==
X-Forwarded-Encrypted: i=1; AJvYcCUTxqLv9nXnaxocHzWRGN5VFLNe+w4Dwi/lRMaYj7fsZ9R0Zjv4tXfASckII5ChwhMX8RZQc8h9l2Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxojWKbCqmrAuAHg5kcrpgHyeZ9X4BzrNDlb/Zm0WD9TjS0SPdU
	fs81odxFYmNElwzlzJvNAbB/x7jVy9ZyBkboD927kjS6/1dlBdheO+5B1xaBRBogOw==
X-Gm-Gg: ATEYQzwkvl/ZnO0R3Vda1ABALoB8n8DhmgjDg+pdqPDhLaGynjljAFTRWxsaMRAQ/hy
	annrnzSUgNCsB8Ol4/xIhqQh5Mss6jdkdF+J4pwzmTvoba0gYCP9bMUdn1lVeBbmvlD9hi1ksP/
	8uZNNrYT3uq+Fh3svcJHOMx/TjMV7Tcj3sejHsJTsggTgt0SUvYH/YF8WB1kUMjImwYD0C3LShD
	VcnA/5e2P66wzrdhEQe4ZritljVIEa7aWBXX/0B6fREgiGOkPJmmxvvf4uJJUPk4BMuG9v07wUW
	0GZBnq8BigG2p/exOuNPR8v1jSi29VcNPfxW0RBnMe8cTqMIqTTeqXhEWDfG3ouCQivFVdeAAtQ
	FNFfpan/Kc8WhoY7BUIDuskUkThw/dllqSxic72h8nGg62zNjKqUuFltLmXqnFXvAGTHDIU8OTv
	AmNcapNb/hGlWSa81n8UUAie2ittyDKtcecId4k4IGSXJM3FaEstDUX2ceSdoiR1zIsq3i1HP6o
	BCMhnuWWgYF6CY=
X-Received: by 2002:a05:6000:2203:b0:439:df03:f300 with SMTP id ffacd0b85a97d-43b88a25a01mr3611797f8f.40.1774428748331;
        Wed, 25 Mar 2026 01:52:28 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------QCfREM146YqYmfa34cSvSqgS"
Message-ID: <2e09bae2-4496-48c3-b60c-169022d03e7a@suse.com>
Date: Wed, 25 Mar 2026 09:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/16] x86/cpufeature: Introduce SME and SEV-related
 CPU features
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1747312394.git.teddy.astie@vates.tech>
 <e9dca2b2675cd4a0bcd01ba7cf64f40bc6e442e1.1747312394.git.teddy.astie@vates.tech>
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
In-Reply-To: <e9dca2b2675cd4a0bcd01ba7cf64f40bc6e442e1.1747312394.git.teddy.astie@vates.tech>
X-purgate-ID: tlsNG-42698a/1774428749-9B2A8112-57A0FBA1/0/0
X-purgate-type: clean
X-purgate-size: 10339
X-Spamd-Result: default: False [-0.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9C2AF321AEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.
--------------QCfREM146YqYmfa34cSvSqgS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 12:24, Teddy Astie wrote:
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/arch/x86/cpu/common.c                   | 2 ++
>  xen/arch/x86/include/asm/cpufeature.h       | 4 ++++
>  xen/include/public/arch-x86/cpufeatureset.h | 5 +++++
>  xen/include/xen/lib/x86/cpu-policy.h        | 9 ++++++++-
>  4 files changed, 19 insertions(+), 1 deletion(-)

As I happened to look at this patch, there are pieces missing here. There
likely are existing commits or pending patches I could point you at, but I
think the not-yet-posted patch new in v4 of the AVX10 series is the best
reference (for having pretty few things beyond what you need to pay
attention to). See attached.

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -481,6 +481,8 @@ static void generic_identify(struct cpuinfo_x86 *c)
>  		c->x86_capability[FEATURESET_e8b] = cpuid_ebx(0x80000008);
>  	if (c->extended_cpuid_level >= 0x80000021)
>  		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
> +	if (c->extended_cpuid_level >= 0x8000001f)
> +		c->x86_capability[FEATURESET_e1fa] = cpuid_eax(0x8000001f);

This would be nice to be kept in numerical order.

> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -22,6 +22,7 @@
>  #define FEATURESET_7d1       15 /* 0x00000007:1.edx    */
>  #define FEATURESET_m10Al     16 /* 0x0000010a.eax      */
>  #define FEATURESET_m10Ah     17 /* 0x0000010a.edx      */
> +#define FEATURESET_e1fa      18 /* 0x8000001f.eax      */

I think this wants to be FEATURESET_e1Fa, much like it's FEATURESET_Da1
and (going to be; another yet to be posted patch that I have been
carrying for far too long) FEATURESET_1Ea1.

Jan
--------------QCfREM146YqYmfa34cSvSqgS
Content-Type: text/plain; charset=UTF-8; name="x86-CPUID-AVX10-2.patch"
Content-Disposition: attachment; filename="x86-CPUID-AVX10-2.patch"
Content-Transfer-Encoding: base64

eDg2L0NQVUlEOiBlbmFibGUgQVZYMTAuMiBzdWItbGVhZgoKVGhlIGxvZ2ljIGlzIG1vZGVs
ZWQgYXMgY2xvc2VseSBhcyBwb3NzaWJsZSBhZnRlciB0aGF0IG9mIGxlYWYgNwpzdWItbGVh
ZiBoYW5kbGluZy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KLS0tCldoaWxlIHRoZSAiQVZYMTAiIGluZml4IGlzIG5lY2Vzc2FyeSBldmVyeXdo
ZXJlLCB0aGUgImF2eDEwIiBwcmVmaXggb24KdGhlIGJpdGZpZWxkIG5hbWUgaXMgcmVkdW5k
YW50IHdpdGggdGhlIGNvbnRhaW5pbmcgc3RydWN0dXJlJ3MgZmllbGQKbmFtZSAoc2VlICJ4
ODZlbXVsOiBzdXBwb3J0IEFWWDEwLjIgbWVkaWEgaW5zbnMiIGZvciBob3cgdGhpcyBsb29r
cyBsaWtlCmluIGFjdHVhbCB1c2UpLiBEbyB3ZSB3YW50IHRvIHNwZWNpYWwtY2FzZSB0aGlz
IGluIGdlbi1jcHVpZC5weT8KLS0tCnY0OiBOZXcuCgotLS0gdW5zdGFibGUub3JpZy90b29s
cy9saWJzL2xpZ2h0L2xpYnhsX2NwdWlkLmMJMjAyNS0xMC0xNCAxOTozMTo0My4wMDAwMDAw
MDAgKzAyMDAKKysrIHVuc3RhYmxlL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfY3B1aWQuYwky
MDI1LTA3LTIzIDEwOjA1OjAxLjAwMDAwMDAwMCArMDIwMApAQCAtMzQzLDYgKzM0Myw3IEBA
IGludCBsaWJ4bF9jcHVpZF9wYXJzZV9jb25maWcobGlieGxfY3B1aWQKICAgICAgICAgTVNS
X0VOVFJZKDB4MTBhLCBDUFVJRF9SRUdfRUFYKSwKICAgICAgICAgTVNSX0VOVFJZKDB4MTBh
LCBDUFVJRF9SRUdfRURYKSwKICAgICAgICAgQ1BVSURfRU5UUlkoMHg4MDAwMDAyMSwgTkEs
IENQVUlEX1JFR19FQ1gpLAorICAgICAgICBDUFVJRF9FTlRSWSgweDAwMDAwMDI0LCAgMSwg
Q1BVSURfUkVHX0VDWCksCiAjdW5kZWYgTVNSX0VOVFJZCiAjdW5kZWYgQ1BVSURfRU5UUlkK
ICAgICB9OwotLS0gdW5zdGFibGUub3JpZy90b29scy9taXNjL3hlbi1jcHVpZC5jCTIwMjUt
MDctMjIgMTY6MjE6MTguMDAwMDAwMDAwICswMjAwCisrKyB1bnN0YWJsZS90b29scy9taXNj
L3hlbi1jcHVpZC5jCTIwMjUtMDctMjMgMTA6MDQ6MzYuMDAwMDAwMDAwICswMjAwCkBAIC0z
OCw2ICszOCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgewogICAgIHsgIk1TUl9BUkNIX0NB
UFMubG8iLCAgICAgICAgICJtMTBBbCIgfSwKICAgICB7ICJNU1JfQVJDSF9DQVBTLmhpIiwg
ICAgICAgICAibTEwQWgiIH0sCiAgICAgeyAiQ1BVSUQgMHg4MDAwMDAyMS5lY3giLCAgICAg
ICJlMjFjIiB9LAorICAgIHsgIkNQVUlEIDB4MDAwMDAwMjQ6MS5lY3giLCAgICAiMjRjMSIg
fSwKIH07CiAKICNkZWZpbmUgQ09MX0FMSUdOICIyNCIKLS0tIHVuc3RhYmxlLm9yaWcveGVu
L2FyY2gveDg2L2NwdS9jb21tb24uYwkyMDIzLTExLTEyIDE0OjEyOjIxLjAwMDAwMDAwMCAr
MDEwMAorKysgdW5zdGFibGUveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwkyMDI1LTExLTEy
IDE0OjIwOjUzLjAwMDAwMDAwMCArMDEwMApAQCAtNTUyLDYgKzU1MiwxNyBAQCBzdGF0aWMg
dm9pZCBnZW5lcmljX2lkZW50aWZ5KHN0cnVjdCBjcHVpCiAJCQkgICAgJmMtPng4Nl9jYXBh
YmlsaXR5W0ZFQVRVUkVTRVRfRGExXSwKIAkJCSAgICAmdG1wLCAmdG1wLCAmdG1wKTsKIAor
CWlmIChjcHVfaGFzKGMsIFg4Nl9GRUFUVVJFX0FWWDEwKSAmJiBjLT5jcHVpZF9sZXZlbCA+
PSAweDI0KSB7CisJCXVpbnQzMl90IG1heF9zdWJsZWFmOworCisJCWNwdWlkX2NvdW50KDB4
MjQsIDAsICZtYXhfc3VibGVhZiwgJnRtcCwgJnRtcCwgJnRtcCk7CisJCWlmIChtYXhfc3Vi
bGVhZiA+PSAxKQorCQkJY3B1aWRfY291bnQoMHgyNCwgMSwKKwkJCQkgICAgJnRtcCwgJnRt
cCwKKwkJCQkgICAgJmMtPng4Nl9jYXBhYmlsaXR5W0ZFQVRVUkVTRVRfMjRjMV0sCisJCQkJ
ICAgICZ0bXApOworCX0KKwogCWlmICh0ZXN0X2JpdChYODZfRkVBVFVSRV9BUkNIX0NBUFMs
IGMtPng4Nl9jYXBhYmlsaXR5KSkgewogCQl2YWwgPSByZG1zcihNU1JfQVJDSF9DQVBBQklM
SVRJRVMpOwogCQljLT54ODZfY2FwYWJpbGl0eVtGRUFUVVJFU0VUX20xMEFsXSA9IHZhbDsK
LS0tIHVuc3RhYmxlLm9yaWcveGVuL2FyY2gveDg2L2NwdS1wb2xpY3kuYwkyMDI1LTA3LTI0
IDEyOjI3OjI0Ljc5NTE5MzAyMSArMDIwMAorKysgdW5zdGFibGUveGVuL2FyY2gveDg2L2Nw
dS1wb2xpY3kuYwkyMDI1LTA3LTAxIDE0OjAxOjQxLjAwMDAwMDAwMCArMDIwMApAQCAtMjc3
LDYgKzI3Nyw5IEBAIHN0YXRpYyB2b2lkIHJlY2FsY3VsYXRlX21pc2Moc3RydWN0IGNwdV8K
ICAgICBwLT5hdngxMC5yYXdbMF0uYiAmPSAweDAwMDcwMGZmOwogICAgIHAtPmF2eDEwLnJh
d1swXS5jID0gMDsKICAgICBwLT5hdngxMC5yYXdbMF0uZCA9IDA7CisgICAgcC0+YXZ4MTAu
cmF3WzFdLmEgPSAwOworICAgIHAtPmF2eDEwLnJhd1sxXS5iID0gMDsKKyAgICBwLT5hdngx
MC5yYXdbMV0uZCA9IDA7CiAgICAgaWYgKCAhcC0+ZmVhdC5hdngxMCB8fCAhcC0+YXZ4MTAu
dmVyc2lvbiB8fAogICAgICAgICAgIXAtPmF2eDEwLnZzejUxMiB8fCAhcC0+YXZ4MTAudnN6
MjU2IHx8ICFwLT5hdngxMC52c3oxMjggKQogICAgIHsKLS0tIHVuc3RhYmxlLm9yaWcveGVu
L2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaAkyMDI1LTA2LTAzIDEy
OjM1OjUzLjAwMDAwMDAwMCArMDIwMAorKysgdW5zdGFibGUveGVuL2luY2x1ZGUvcHVibGlj
L2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaAkyMDI2LTAzLTEyIDEwOjI2OjE0LjAwMDAwMDAw
MCArMDEwMApAQCAtNDA5LDYgKzQwOSw5IEBAIFhFTl9DUFVGRUFUVVJFKElUU19OTywgICAg
ICAgICAgICAgMTYqMzIKIFhFTl9DUFVGRUFUVVJFKFRTQV9TUV9OTywgICAgICAgICAgMTgq
MzIrIDEpIC8qQSAgTm8gU3RvcmUgUXVldWUgVHJhbnNpdGl2ZSBTY2hlZHVsZXIgQXR0YWNr
cyAqLwogWEVOX0NQVUZFQVRVUkUoVFNBX0wxX05PLCAgICAgICAgICAxOCozMisgMikgLypB
ICBObyBMMUQgVHJhbnNpdGl2ZSBTY2hlZHVsZXIgQXR0YWNrcyAqLwogCisvKiBJbnRlbC1k
ZWZpbmVkIENQVSBmZWF0dXJlcywgQ1BVSUQgbGV2ZWwgMHgwMDAwMDAyNDoxLmVjeCwgd29y
ZCAxOSAqLworWEVOX0NQVUZFQVRVUkUoQVZYMTBfVjFfQVVYLCAgICAgICAxOSozMisgMikg
LyogICBBVlgxMCBWMSBBdXhpbGlhcnkgSW5zdHJ1Y3Rpb25zICovCisKICNlbmRpZiAvKiBY
RU5fQ1BVRkVBVFVSRSAqLwogCiAvKiBDbGVhbiB1cCBmcm9tIGEgZGVmYXVsdCBpbmNsdWRl
LiAgQ2xvc2UgdGhlIGVudW0gKGZvciBDKS4gKi8KLS0tIHVuc3RhYmxlLm9yaWcveGVuL2lu
Y2x1ZGUveGVuL2xpYi94ODYvY3B1LXBvbGljeS5oCTIwMjUtMDYtMTcgMTM6NTE6MjUuMjkw
OTkzNDA5ICswMjAwCisrKyB1bnN0YWJsZS94ZW4vaW5jbHVkZS94ZW4vbGliL3g4Ni9jcHUt
cG9saWN5LmgJMjAyNS0wOC0yOCAxNDo1NDoyMi4wMDAwMDAwMDAgKzAyMDAKQEAgLTIzLDYg
KzIzLDcgQEAKICNkZWZpbmUgRkVBVFVSRVNFVF9tMTBBbCAgICAgMTYgLyogMHgwMDAwMDEw
YS5lYXggICAgICAqLwogI2RlZmluZSBGRUFUVVJFU0VUX20xMEFoICAgICAxNyAvKiAweDAw
MDAwMTBhLmVkeCAgICAgICovCiAjZGVmaW5lIEZFQVRVUkVTRVRfZTIxYyAgICAgIDE4IC8q
IDB4ODAwMDAwMjEuZWN4ICAgICAgKi8KKyNkZWZpbmUgRkVBVFVSRVNFVF8yNGMxICAgICAg
MTkgLyogMHgwMDAwMDAyNDoxLmVjeCAgICAqLwogCiBzdHJ1Y3QgY3B1aWRfbGVhZgogewpA
QCAtNjQsNyArNjUsNyBAQCBjb25zdCBjaGFyICp4ODZfY3B1aWRfdmVuZG9yX3RvX3N0cih1
bnNpCiAjZGVmaW5lIENQVUlEX0dVRVNUX05SX0ZFQVQgICAgICAgKDJ1ICsgMSkKICNkZWZp
bmUgQ1BVSURfR1VFU1RfTlJfVE9QTyAgICAgICAoMXUgKyAxKQogI2RlZmluZSBDUFVJRF9H
VUVTVF9OUl9YU1RBVEUgICAgICg2MnUgKyAxKQotI2RlZmluZSBDUFVJRF9HVUVTVF9OUl9B
VlgxMCAgICAgICgwdSArIDEpCisjZGVmaW5lIENQVUlEX0dVRVNUX05SX0FWWDEwICAgICAg
KDF1ICsgMSkKICNkZWZpbmUgQ1BVSURfR1VFU1RfTlJfRVhURF9JTlRFTCAoMHg4dSArIDEp
CiAjZGVmaW5lIENQVUlEX0dVRVNUX05SX0VYVERfQU1EICAgKDB4MjF1ICsgMSkKICNkZWZp
bmUgQ1BVSURfR1VFU1RfTlJfRVhURCAgICAgICBNQVgoQ1BVSURfR1VFU1RfTlJfRVhURF9J
TlRFTCwgXApAQCAtMjc1LDYgKzI3NiwxNCBAQCBzdHJ1Y3QgY3B1X3BvbGljeQogICAgICAg
ICAgICAgYm9vbCB2c3oxMjg6MSwgdnN6MjU2OjEsIHZzejUxMjoxOwogICAgICAgICAgICAg
dWludDMyX3QgOjEzOwogICAgICAgICAgICAgdWludDMyX3QgLyogYyAqLzozMiwgLyogZCAq
LzozMjsKKworICAgICAgICAgICAgLyogU3VibGVhZiAxLiAqLworICAgICAgICAgICAgdWlu
dDMyX3QgLyogYSAqLzozMiwgLyogYiAqLzozMjsKKyAgICAgICAgICAgIHVuaW9uIHsKKyAg
ICAgICAgICAgICAgICB1aW50MzJfdCBfMjRjMTsKKyAgICAgICAgICAgICAgICBzdHJ1Y3Qg
eyBERUNMX0JJVEZJRUxEKDI0YzEpOyB9OworICAgICAgICAgICAgfTsKKyAgICAgICAgICAg
IHVpbnQzMl90IC8qIGQgKi86MzI7CiAgICAgICAgIH07CiAgICAgfSBhdngxMDsKIAotLS0g
dW5zdGFibGUub3JpZy94ZW4vYXJjaC94ODYvbGliL2NwdS1wb2xpY3kvY3B1aWQuYwkyMDIz
LTEwLTE5IDE1OjIyOjIwLjAwMDAwMDAwMCArMDIwMAorKysgdW5zdGFibGUveGVuL2FyY2gv
eDg2L2xpYi9jcHUtcG9saWN5L2NwdWlkLmMJMjAyNS0wNy0yMyAwOTo1ODoyNi4wMDAwMDAw
MDAgKzAyMDAKQEAgLTgyLDYgKzgyLDcgQEAgdm9pZCB4ODZfY3B1X3BvbGljeV90b19mZWF0
dXJlc2V0KAogICAgIGZzW0ZFQVRVUkVTRVRfbTEwQWxdICAgICA9IHAtPmFyY2hfY2Fwcy5s
bzsKICAgICBmc1tGRUFUVVJFU0VUX20xMEFoXSAgICAgPSBwLT5hcmNoX2NhcHMuaGk7CiAg
ICAgZnNbRkVBVFVSRVNFVF9lMjFjXSAgICAgID0gcC0+ZXh0ZC5lMjFjOworICAgIGZzW0ZF
QVRVUkVTRVRfMjRjMV0gICAgICA9IHAtPmF2eDEwLl8yNGMxOwogfQogCiB2b2lkIHg4Nl9j
cHVfZmVhdHVyZXNldF90b19wb2xpY3koCkBAIC0xMDYsNiArMTA3LDcgQEAgdm9pZCB4ODZf
Y3B1X2ZlYXR1cmVzZXRfdG9fcG9saWN5KAogICAgIHAtPmFyY2hfY2Fwcy5sbyAgICAgICAg
ICA9IGZzW0ZFQVRVUkVTRVRfbTEwQWxdOwogICAgIHAtPmFyY2hfY2Fwcy5oaSAgICAgICAg
ICA9IGZzW0ZFQVRVUkVTRVRfbTEwQWhdOwogICAgIHAtPmV4dGQuZTIxYyAgICAgICAgICAg
ICA9IGZzW0ZFQVRVUkVTRVRfZTIxY107CisgICAgcC0+YXZ4MTAuXzI0YzEgICAgICAgICAg
ID0gZnNbRkVBVFVSRVNFVF8yNGMxXTsKIH0KIAogdm9pZCB4ODZfY3B1X3BvbGljeV9yZWNh
bGNfc3ludGgoc3RydWN0IGNwdV9wb2xpY3kgKnApCi0tLSB1bnN0YWJsZS5vcmlnL3hlbi90
b29scy9nZW4tY3B1aWQucHkJMjAyMy0xMS0yMiAwODoxMToyOS4wMDAwMDAwMDAgKzAxMDAK
KysrIHVuc3RhYmxlL3hlbi90b29scy9nZW4tY3B1aWQucHkJMjAyNi0wMy0xMiAxMDoyMToz
MC4wMDAwMDAwMDAgKzAxMDAKQEAgLTMxMCw2ICszMTAsOSBAQCBkZWYgY3J1bmNoX251bWJl
cnMoc3RhdGUpOgogICAgICAgICBBVlg1MTJCVzogW0FWWDUxMl9WQk1JLCBBVlg1MTJfVkJN
STIsIEFWWDUxMl9CSVRBTEcsIEFWWDUxMl9CRjE2LAogICAgICAgICAgICAgICAgICAgIEFW
WDUxMl9GUDE2LCBBVlg1MTJfQk1NXSwKIAorICAgICAgICAjIEFWWDEwIGRpc2NyZXRlIGZl
YXR1cmVzLgorICAgICAgICBBVlgxMDogW0FWWDEwX1YxX0FVWF0sCisKICAgICAgICAgIyBF
eHRlbnNpb25zIHdpdGggVkVYL0VWRVggZW5jb2RpbmdzIGtleWVkIHRvIGEgc2VwYXJhdGUg
ZmVhdHVyZQogICAgICAgICAjIGZsYWcgYXJlIG1hZGUgZGVwZW5kZW50cyBvZiB0aGVpciBy
ZXNwZWN0aXZlIGxlZ2FjeSBmZWF0dXJlLgogICAgICAgICBQQ0xNVUxRRFE6IFtWUENMTVVM
UURRXSwK

--------------QCfREM146YqYmfa34cSvSqgS--

