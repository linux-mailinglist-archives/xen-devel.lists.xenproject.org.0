Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mYihAgV5Mmr+0QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 12:37:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C86698922
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 12:37:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="JwSBW/1s";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1340030.1601035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZneR-0001bx-G7; Wed, 17 Jun 2026 10:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340030.1601035; Wed, 17 Jun 2026 10:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZneR-0001Zp-DP; Wed, 17 Jun 2026 10:37:43 +0000
Received: by outflank-mailman (input) for mailman id 1340030;
 Wed, 17 Jun 2026 10:37:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZneP-0001Zi-9d
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 10:37:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZneO-009Vjb-M4
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 12:37:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3278e5-e002-0a2a0a5209dd-0a2a4501a9ee-34
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 12:37:40 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3278f4-c1f2-0a2a45010019-d1558034e421-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 12:37:40 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49230a567a9so9631925e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 03:37:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a4fd31sm144571285e9.4.2026.06.17.03.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 03:37:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1781692660; x=1782297460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5cuPmsAix0lWpW7OBcUSMzuZfMoJcDcQS6cXV4YyPCI=;
        b=JwSBW/1sevy75RmXiomUikceqaxGSeE4ToXBY4kvC2CpnVIevrCfdj3BWS4A0SEYDd
         RtA95dPTo4gg5zRAaR8HFyByq3mHcfk7N6K21AEdNpaCMI9MWjraua6JVKQeND6/Dg0g
         8Uf7ZlvvQpQ1cNkFUUh/HXMErAmo3zkz52rhyypqRg0xrLm48SVND70UC7pppnzfBawV
         LiylTBjuy/9A8wHOgHyiIgGmWJ1CMs05Th+kH4feWgCyR3MwIRtCRT9lcoTDVFI3CF2/
         YSZxt6DH2NYTicwV/u+QmmTGlhDI+qWRD0HtX+GCU91uA0+eiz4t5wy0dWO+V2aP3z72
         KpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692660; x=1782297460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cuPmsAix0lWpW7OBcUSMzuZfMoJcDcQS6cXV4YyPCI=;
        b=XkgHzhzpUaUFjLRaSuVJm+jlgOoyTe2ns6EdD7cxyqV+gxejQtopwrWDV33TErHeNK
         a394WocgLhsIiTaUN4MHkWCz3eNeBsXfTxXlUl/8YEIdt4hBY4xw5V9LT7HgA4gygu44
         gGbp+8fhDx68wMwcEVHrdSdiViD7YgIA+KVek0Wy1/ry0dbNL2rIgDKVYIK2wk3LttAg
         lTFDpYZfWrOC8h6iKIZW0IUpdmfMJPV/NWu1ASz3NAI+STFHhx59ymK1kHVrqVgLmbcY
         pOuelLhZ4+7dYvR/AglObOOce6p+KgOZ0UKHGcYcWMwm5hr2Hkma3SNeq3LuT1mv1lTz
         +7rg==
X-Gm-Message-State: AOJu0YwC3MX7lkXLtubiyhekbEmHrvBfQaoKBPf6YfEL1ReE1kL5FqSx
	42WIPdHFu6MUZcema4MkMud6caKmIv0ZaOWAYj5cGRlBn+WYEjxrWr6p9zHGOwnusT8QdI1uT6I
	xnNk=
X-Gm-Gg: Acq92OFnoxQB86TnxvHuKY6XcPEdhi6kZsem+DCbj69iGB/zY/hnkH61HUvxLSYYy1N
	NQYEMMXlGF6ep6gLcysHx8ZPBN0Y9R0A+MmpHWVUBAqj4QNrnnWPoj8EomJZpRCC+gfkWC9KCEh
	UU0w5jn/SPlUj9R/fiD3t2NMSULmwbrtGA8VThbe/fJj3Fanrh013I+pdSrJdegza/5Ryf07Sc3
	uoN0jJMB6slGaTYCBMua2xRSCJEuK0NRsCF9vbssfr9Zt6DvUlD1Z7OAj8n+n50n8mkpYYm8maY
	FUc+3awlT87FfqCz2W0cm4pzzBZxZ6PPexoveeQD1Vs7kHzYtSMgS2ypSWTFMmTRXEuqW/YUjJ5
	vOtplGeQK+umAjWMxnieB3Y77fSkok4PoALmF9Ixrass6BQSfr27MQ9GuFjay01QXfZUfWKhNrR
	3IjGcJFDd/unABRErk7x7yWzh4oYmYhy7G9FtYbSIYiozFkVnx1PsMG7TIz3oHyRgN5Pkc9yBEb
	Xpe
X-Received: by 2002:a05:600c:6384:b0:490:bad7:3634 with SMTP id 5b1f17b1804b1-4923341f6dfmr52100945e9.19.1781692659969;
        Wed, 17 Jun 2026 03:37:39 -0700 (PDT)
Message-ID: <a307207f-7cf2-40fb-927f-bbaa841b94ba@suse.com>
Date: Wed, 17 Jun 2026 12:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22?] x86/EFI: arrange for non-discardable .reloc in
 xen.efi
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
 <ajJ3C40FLsyBZn-U@macbook.local>
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
In-Reply-To: <ajJ3C40FLsyBZn-U@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781692660-AEF58FF4-ADA21F1C/0/0
X-purgate-type: clean
X-purgate-size: 1163
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,invisiblethingslab.com,apertussolutions.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57C86698922

On 17.06.2026 12:29, Roger Pau Monné wrote:
> On Tue, Jun 16, 2026 at 06:17:54PM +0200, Jan Beulich wrote:
>> Loaders respecting IMAGE_SCN_MEM_DISCARDABLE would not load such sections,
>> yet we need to access it ourselves when switching out of "physical mode".
>> Leverage behavior new to GNU ld 2.46: Any contribution to .reloc which
>> doesn't have the discardable flag set (which cannot even be expressed in
>> ELF) will yield the output section also non-discardable.
>>
>> Since for intermediate binaries we don't care about section attributes,
>> link in the new object only on the final linking pass.
> 
> I'm not sure I follow.  Xen already does generate a custom .reloc
> section without the IMAGE_SCN_MEM_DISCARDABLE attribute when using
> the mkreloc utility, and hence the .reloc section should never be
> marked as discardable?

mkreloc is used only when we recognize the linker to be incapable of
producing (correct) base relocations. As a modern linker is required for
the desired IMAGE_SCN_MEM_DISCARDABLE handling for .reloc, mkreloc
wouldn't normally be used there. Hence no .reloc section with the wanted
property.

Jan

