Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C6Y1MbzDHmplUwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:51:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFB362DB7B
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:51:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=I+V5Hnvv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324808.1590323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNeH-0000Ei-UC; Tue, 02 Jun 2026 11:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324808.1590323; Tue, 02 Jun 2026 11:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNeH-0000CG-Pr; Tue, 02 Jun 2026 11:51:09 +0000
Received: by outflank-mailman (input) for mailman id 1324808;
 Tue, 02 Jun 2026 11:51:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUNeG-0000CA-4P
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:51:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUNeF-007vJM-HF
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:51:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec3a4-5cb7-0a2a0a5109dd-0a2a4504e980-36
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:51:07 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec3ab-1dec-0a2a45040019-d1558029a9eb-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:51:07 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49041e84237so92108415e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 04:51:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34c3081sm32797325f8f.15.2026.06.02.04.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 04:51:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1780401067; x=1781005867; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WBh83ciaBiRLmsbUJE+/Eyskxh6yoNF8pPPk3dxtCgo=;
        b=I+V5HnvvemInWjnHvfuA3yqXAaEr3HXVEQ/BGszAWxaVbETT+VfmFcp/D97sneSFm7
         l+yURA3DoGgXrrow8v57NhgVYyNcZ0mEoArOQt/oGkvOVrtPHnfEmuS13JbGCkOM7rU8
         cgAjOWA0SkJmYz+jZZyx302maCUVFDeQcOof902Ux1mypAbGLQ8DLLVYeUtAI2pV3oGh
         Ns8aj3XZGzF7SsZROVv5ZfThcyuFCxECgBT15JP70y4CUKBGYk+HZgyM9XpPVZxL82RI
         9Jo86S9dY2aTNIeRzCE0oBTZ7H6HovQv5EydzZVdO6bg9PD+96PhOYVHmlWsH3D9K7fH
         gGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401067; x=1781005867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBh83ciaBiRLmsbUJE+/Eyskxh6yoNF8pPPk3dxtCgo=;
        b=jTIULyxqpgoGqFn76RDik2625QfoOKXVpeQYNvWk8Brer4syN5DO6R3l3y+CaGF6JV
         fmclSYvsDcXthpO+sgJTZ2r5jWvE4tNaKJbwqk3x8b5NSakjJaMUpf/XtNt5HqKCMhn/
         ygdIN/Kp3IqrdoxGHWXvg3m5Yf8riCp3lrSC26aq7cFM52LVFaM07aGJl8HlFg3Cf/18
         pPPVpXvoKYTnkPcKYGbklv6/yKeaGWAFSeNUdD9zZzQ40NTlEotXCJJaSKUahnVvfOyp
         ksepkTg92zltvU2O6jZsqVhLtwIrLp4eYffj0Q4STPcLtNWPQIle8DN8IvNy+AIU0BRw
         Ksug==
X-Forwarded-Encrypted: i=1; AFNElJ/BF3YOuFrI/m8GfuQq3lddG+vWBTTWbFKZNVl1ffsV4+jcH/+Mwh16UA7InnFP86/dr9f2SJmNxjc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywz+Ltwae2pDCNX542AjrnY70Y2byGjwl/aS+OcAqMCFEQDQwlN
	SLmEiH32o65JKQdFbs/uCdJnsTYq6CfhvuGP/OsiMzjYNOxdL6kNwBhOkt9//MEu7Q==
X-Gm-Gg: Acq92OGWqO+p0wbVLf5VI0GEdnJdmvKMrjdo1u8S8BYlNdIbeWJ7Q+MCZe7UrIneiDY
	TShfkmP+4g3qQ9ySgreXNOYEyswUAYqwBwlqFX86HcNJbroGxuCOrV7mBvcsQL8faAfAravedrz
	FDLrvX1b0wnDZLOYbuX/CfIMD+uo3/a2souHsBYc6aALAYqVZKjS9UF2lrTe2M7b2vGKEfJh8oL
	maglffnTxCDbZ9uvi2zHmLYwx04+lYkodfyfUW63u2USBvVZUPfpym/OYz52ru9WoK/Ctj6g67C
	YrAdvJ72dd9qDrNXSZypVP+6TU5XsZpLe/dLtPyQo/oitKsDN5zr5joKtAKjMc0dtNv8fnNRKi0
	X7zY3M+yzlF8BKaLDDdllS8y949CVt8WGEOTNVa827XqrOyrVBUGaglPbcEXv7w+wNnVvCKUoDm
	fWiuCPvlpKPsd9o3SBUCjZVeQF7JntKxxZrHWD5rG4UdLaTBLy41XM4rLDr6JxwicVceAuR5CqI
	MiuPXrl2W9vFJyH68N0xqkO8g==
X-Received: by 2002:a05:600c:a21c:b0:48e:8eb0:4957 with SMTP id 5b1f17b1804b1-490b0e55039mr42886965e9.2.1780401066652;
        Tue, 02 Jun 2026 04:51:06 -0700 (PDT)
Message-ID: <4f3f6ead-b917-4824-bc24-47a37f921bf6@suse.com>
Date: Tue, 2 Jun 2026 13:51:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mm: avoid watchdog timeout in dump_numa() on large
 domains
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Marcus Granado <marcus.granado@citrix.com>, xen-devel@lists.xenproject.org
References: <10d8309efdb878a3b615a7daca2bb5209525cb37.1780390167.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <10d8309efdb878a3b615a7daca2bb5209525cb37.1780390167.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1780401067-40D743FF-471EA25F/0/0
X-purgate-type: clean
X-purgate-size: 1061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tamas@tklengyel.com,m:alejandro.garciavallejo@amd.com,m:marcus.granado@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EFB362DB7B

On 02.06.2026 10:49, Bernhard Kaindl wrote:
> Using the 'u' debug key invokes dump_numa(), which walks each domain's
> page list under page_alloc_lock to compute per-NUMA-node counts. On
> domains with many pages, this O(pages) operation can hold the lock long
> enough to trigger a watchdog timeout.

In addition to what Roger said: Is it really the lock holding that's a
problem here? That is, there would be no problem if there was no lock
involved in this O(pages) operation?

> Replace the page-list walk with node_tot_pages[], a per-node counter
> maintained in struct domain. This reduces dump_numa()'s per-domain work
> from O(pages) to O(nodes).

Alternative approch for consideration: Purge dump_numa()? This big a
change for making a keyhandler work better is somewhat questionable an
approach, imo. The keyhandler isn't there for use in production anyway,
it's (primarily) a debugging aid. If the data is still needed (and may
e.g. be useful on production systems), make a (preemptible) domctl or
sysctl or alike instead?

Jan

