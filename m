Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MGgfKQ9AOmox4wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 10:13:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109EE6B52E4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 10:13:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=TUqFeg7A;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344135.1603263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbwFO-0006cw-2v; Tue, 23 Jun 2026 08:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344135.1603263; Tue, 23 Jun 2026 08:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbwFN-0006aY-WF; Tue, 23 Jun 2026 08:12:42 +0000
Received: by outflank-mailman (input) for mailman id 1344135;
 Tue, 23 Jun 2026 08:12:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbwFM-0006aS-9B
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 08:12:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbwFL-00EJS5-Ic
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 10:12:39 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a3fea-2eae-0a2a0a5409dd-0a2a4503d354-30
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 10:12:39 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a3ff7-a3da-0a2a45030019-d155dd35a448-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 10:12:39 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-462cdb88d01so480328f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 01:12:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c53fdsm35072150f8f.10.2026.06.23.01.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 01:12:38 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782202359; x=1782807159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fLks30zEYZvDnxbeYx5kStxKJy27wLkPba/FNI2jzB8=;
        b=TUqFeg7A3ENRMTLGcYlZfRaTouqsLvPv7QDPhOCwpagVNnJoyXvUDPZGWwlBSX0agu
         HvWdOMttueDBEh/E/pF9sostleiWBbvXzPgSQx/NaeiGxPqDA9kw2MNp3FBsKvniY2sC
         bqsOKYHPgrCUvh5L2tNK0F74bhO6oXvyycjDtAr/CM/rnSN09Ofl2vuJArBVG0npyFWm
         gGsnSq34rzcfR7X0DDGV3GoVkxFaS/kvanK2CVjRxIp3jkiQNgsc5fbz7hyBEe5hBrl7
         +JfqUV8/rbSPSe7so7dyhl2aYvfZr3R6WzTQ+zk0falRHzoAF/HeBfBfm5UyEqVfjsRY
         Qq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782202359; x=1782807159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLks30zEYZvDnxbeYx5kStxKJy27wLkPba/FNI2jzB8=;
        b=kLjVHJ/sXSdSJFisUccgxnxaPek9mrzHCZ01Xuh/A46nSEk5lfn5Uw2TvQCrFIDf9X
         Q2x2+SqCKCrkKUaiM/FlTNH31pRhSgkGs3ezt7knQ0pjVkX/es5/vBnwNkVM8daYCn5V
         c748UPGInC+uOr+VZdOfinFwRi4Rz32htkJy4Re8xzCxs+vRrhm5HjjDJ/lpun2cJTZY
         DbGocH6noAcIliI+YrnH1HK+0gGCs/TOFZpfeMHl03kj3Zi5mA5savPiO+saiiq3u7dF
         ACDttIpytIA9NFcvAr0eFlL1AEB7d/4gYh5h+6BkuFhW1rp5PFiNjh5cBG2khtpd/bMd
         Ei0A==
X-Forwarded-Encrypted: i=1; AHgh+RqvMkbACklJAZ5I5YIOfZfiKO+6GEeKmNZogvP02tiDg1+BXHO003zHsis5Yzu6cHY5+3l06EEzVBo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNd1QlvcSYzpW0IsqA5rEUJgLP+s0IBq1Z7w3rI4BLAMrSJRmN
	zoeUwwWpHoqUT31SHQU/bJU8n4euwkaJfoyQfIgCljM+EZGNopAi4h3m9J9lxIe28Q==
X-Gm-Gg: AfdE7ck95AgDTHXPt7ymvgiyezICofbvyPraprtrp7YXVfiOTM11HELb5HT2ckAIYai
	Hk0eYd709On8EN8DZrTR3HrO9je3JzRRBr4TgS7adTevQzZOcotufKYPzdXmBFLE3Tlp+Ax6V24
	HZOisGZyjyrgceRPv3uLrt+B8ao4DOfcB6lzmYK9VfO7CFjiwu+pKIrnu0Bi+24B2gNw94Z/4eB
	OAj4ispP/qE16qojmB43ib8QCLuwHSxDk4nqj6gxuXcCkGcCLdj7To/SzNRfur2c3Fwk8Notk1j
	A7QECx1APpjeP38LC6/aQFOWej3p0BRzCfBiYCQXB6bnkKZ3wG8fEF5q5RalwDGxuaakJacTyAv
	jsVTPJt+JvEGbf1G5DBd/qd5pnw/xLPCK6JOpxy2Aj035pZtzasFw1i5XLF8nDcJOo4/hZlQbGt
	cFvhCfKpPfh+lEsq7o8sKfIMZOorIM+PatClDVS1yboVqBm/gue8xn0DUm0ZuhcJmko8kBexDjG
	rdD
X-Received: by 2002:a05:6000:2887:b0:463:1d06:ab33 with SMTP id ffacd0b85a97d-46a80f5c6edmr4391297f8f.27.1782202358869;
        Tue, 23 Jun 2026 01:12:38 -0700 (PDT)
Message-ID: <e1d5cda0-c28e-4fc4-9f6a-627b932263f2@suse.com>
Date: Tue, 23 Jun 2026 10:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22?] x86/EFI: arrange for non-discardable .reloc in
 xen.efi
To: Yann Sionneau <yann.sionneau@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
 <1782201783.8631fc262581453bbf619ec5b2062170.19ef3811474000701b@vates.tech>
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
In-Reply-To: <1782201783.8631fc262581453bbf619ec5b2062170.19ef3811474000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782202359-CEC77D84-DD2C8C58/0/0
X-purgate-type: clean
X-purgate-size: 1263
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,invisiblethingslab.com,apertussolutions.com,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yann.sionneau@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 109EE6B52E4

On 23.06.2026 10:02, Yann Sionneau wrote:
> On 6/16/26 18:20, Jan Beulich wrote:
>> Loaders respecting IMAGE_SCN_MEM_DISCARDABLE would not load such sections,
>> yet we need to access it ourselves when switching out of "physical mode".
>> Leverage behavior new to GNU ld 2.46: Any contribution to .reloc which
>> doesn't have the discardable flag set (which cannot even be expressed in
>> ELF) will yield the output section also non-discardable.
>>
>> Since for intermediate binaries we don't care about section attributes,
>> link in the new object only on the final linking pass.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Can I get a Reported-by tag on this one?
> Since I reported the issue with a patch a few months ago: 
> https://lore.kernel.org/xen-devel/20250724140731.1502774-1-yann.sionneau@vates.tech/

Hmm, I have to admit I'm of split minds here. Generally I'd expect
Reported-by: to only cover new findings (or if two people observed the
same thing independently within a short time frame). The (abstract)
problem with the section attributes of .reloc was known long ago. The
aspect speaking in favor of adding the tag is that you apparently were
the first one to report encountering the issue in practice.

Jan

