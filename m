Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VBo7MqILMWodawUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 10:38:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DC168D38B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 10:38:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=LBNVTNpL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338784.1599831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPIw-00060z-3f; Tue, 16 Jun 2026 08:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338784.1599831; Tue, 16 Jun 2026 08:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPIw-0005yv-10; Tue, 16 Jun 2026 08:37:54 +0000
Received: by outflank-mailman (input) for mailman id 1338784;
 Tue, 16 Jun 2026 08:37:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZPIv-0005yi-Ah
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 08:37:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPIt-00FoaE-G4
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:37:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a310b5b-2eae-0a2a0a5409dd-0a2a4506ace8-16
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:37:51 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a310b5f-7371-0a2a45060019-d155802cc0cc-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:37:51 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490c1915793so36422975e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 01:37:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa97a07sm104242195e9.14.2026.06.16.01.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 01:37:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1781599071; x=1782203871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J+EK7LRCgAJ6DQtSQZpni+/GAh5s32eCb8/3hXvF+ps=;
        b=LBNVTNpLNy6b9tfoyoygoMdR/zT4durrsMarGXsWXUs+xF21bDfU7TQ6j2AIY0zJ9x
         aHruhr6rAhaBp6+TMqSbNWCiCQQp7GgLPUXer37DAR94ILDS7KTuGKeZ69AVYyK8q1ui
         8FcqzmSKQ23YTDQz4A7/h+Ck0NJ2qrRjxAnVUjG4x6XwyYrXDIj1F0Cn+x3EVVy2/8fw
         kNPfnQUftTOPOQm10HyKZUZWSzlxcNzK1oazlTmkA1DUQSJeZ5igmEpPzr7DjG2EL0CP
         kRG5sjnFJPGQh6MBj/1TZHveB7tYrOWF0p9jBJGvK5eeCx3jR1601SpOYxZ+rJ/fTFSd
         xs5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781599071; x=1782203871;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+EK7LRCgAJ6DQtSQZpni+/GAh5s32eCb8/3hXvF+ps=;
        b=q7dPTilRVrfG0LUvneYOP+zpBQbPqBo7ozHj7EduKb3Lcqu0gDJB8ZK2O77VRGHIXL
         1e70mGOV1YlEXTfxu3lwOX/plYnXschdb/DWcRpld5Yh5ohxWW1nb0bUgS/GJQyS6P95
         HQt3WLVBUeeTX6idXLe8P/2qTIoWHeHzI9SP3Z7/CijYdzGuJ0mymY3ezU41pQ57S/23
         UWIG6OrFw1JN8ntbNt6izStCLcB4ryyecjjtHD2fRv6+RNuvZ57mwWdql2jtxc9kSRNG
         1SqXSPlqeE3suria9OXLUHe5cyU/iiWyJ4Ju7aN/iZSzoyyhXE9CxKs6jT0rwXS9fXm6
         LX9w==
X-Forwarded-Encrypted: i=1; AFNElJ898ZekqQv0omIvBumqTsLzbCUxjbPVbv3OjiVMWtJZccOzYEH2AI/f5G5zpSgLbPiqpzG644HUayQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxEoLmY0E4l9qnVgYq++UaAYRf+8v9jwu0LaF1p2CrVFc/wKUK
	xpQlZNq55HVxRN/kFEDc4BxljukfpWmHUKgCBhOo5ah2WuW1qKb+9D020wZO5aeIrA==
X-Gm-Gg: Acq92OHb6idht1jneFTJDIdeeR+ohAcSylYHYVys3B5lw49hIKqJsMviDpy/2PUQ/vG
	gpOD2ZNOotgo3ugokJ1k5mroA5dEtOUZzbDNSUDtP2MeGAt5fhryNG52xd4cr+M+thAUd88R//X
	gdZMnhIDsJ/ruT8y4k2JzHGospFn9X1HlZZFKAEb+TJkrCYHGdawbEbRAvRIkihLyBNxEDIeaxZ
	wq6Gx3l3FH1Oqui6/R7JoEUf1NX15rMyULzJMYEcqeYgXF7Oj0xiNfPKxH/hwY+uHxSVO1aASsf
	uxczXtQBECzUfg+w1kfv++V9/1SFfc33FjTmnJauszYpRtGkWm0+YjKyQ4XW3OrLCbdTTd+Ap+N
	newzpIW+8A9FwgfMV5E2e7Fe2xblFFWV2RxyJ+RlHHAElfzOQN7JV58jPgjk7j4uZHPW3L6l3bC
	Ev9/WlNqTePXJYZIvwuxKwsb1dUjbCLHYkPSMLmCjOd1QMvVD4IP0IXNNoL+Hsf6Xz2pJ2/AcSz
	kMmOlnW1Tm7mVo=
X-Received: by 2002:a05:600c:524b:b0:492:1f06:ec9b with SMTP id 5b1f17b1804b1-4921f06ee55mr198134065e9.24.1781599070372;
        Tue, 16 Jun 2026 01:37:50 -0700 (PDT)
Message-ID: <6b8b204c-3c4f-4949-a476-8a84625ed4d6@suse.com>
Date: Tue, 16 Jun 2026 10:37:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
 <b310db60-850a-4096-8900-54d0816e5063@suse.com>
Content-Language: en-US
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
In-Reply-To: <b310db60-850a-4096-8900-54d0816e5063@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1781599071-87D7AD75-6CE1747D/0/0
X-purgate-type: clean
X-purgate-size: 1149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,invisiblethingslab.com,apertussolutions.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26DC168D38B

On 11.06.2026 16:38, Jan Beulich wrote:
> On 08.06.2026 19:31, Andrew Cooper wrote:
>> From: Frediano Ziglio <frediano.ziglio@citrix.com>
>>
>> xen.efi with debugging symbols is ~45MB, down to ~9.3MB when stripped.
>> Multiple firmwares (as seen by QubesOS, Trenchboot, and XenServer) are unable
>> to boot xen.efi when debugging symbols are included.
>>
>> Either way, having debug symbols by default is abnormal and contrary to how
>> the non-EFI path works.
> 
> I'm not happy with how things are put here. There's nothing abnormal about
> including about anything. What is abnormal is the manufacturing of a 32-bit
> ELF binary from a 64-bit one by mkelf32, to please bootloaders. An EFI
> binary should be permitted to include whatever data it wants, and firmware
> should be able to load it as long as memory permits. I don't expect you
> mean to indicate that problematic systems don't have 45Mb available at boot.

Meanwhile it occurred to me to further ask: How would unified images work
on such systems imposing size restrictions? They're pretty likely to be
yet larger, especially if the initrd is rather big.

Jan

