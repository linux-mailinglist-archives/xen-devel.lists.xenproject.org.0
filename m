Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ajnUIC0yIGrOyQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:54:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF79A63848D
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:54:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=UXf2lrrn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326414.1591858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUm3Q-0000HA-Sg; Wed, 03 Jun 2026 13:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326414.1591858; Wed, 03 Jun 2026 13:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUm3Q-0000F8-Q5; Wed, 03 Jun 2026 13:54:44 +0000
Received: by outflank-mailman (input) for mailman id 1326414;
 Wed, 03 Jun 2026 13:54:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUm3O-0000Em-Sn
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:54:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUm3O-003VMK-8l
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:54:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a203210-2eae-0a2a0a5409dd-0a2a4506ca44-36
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:54:42 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a203221-7371-0a2a45060019-d155dd2ad18f-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:54:41 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-46019b190b6so1772883f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:54:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35eff2sm7477013f8f.31.2026.06.03.06.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 06:54:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1780494881; x=1781099681; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=63SsAZlzaeTgiWToXEZ0aZXJJ2mJhkL2JKLP+Q/VDbk=;
        b=UXf2lrrnIvTMO7JwqlVPLDb15Cuhoe8iBws6McOYePooGqWNGapyen3x9t256mMiT0
         RK543XTizJZGEvwIDPFixNJaF6FAY48BvpG1rTn26BbK1tQFKbjENSZfLOxxgUy4rBUg
         cbh8OU01V/ztmomF9uVNE9O+DF4F07Wzknhol7nLDPnrF8FHxOveKoSSxourTtTP4y+8
         xKGq0+t8iYum8rL9tXgeCSzBY9CF8W7j3jHGJNzmaBedtCcUsgyYkmHp0UhJz/QRySHP
         Ox92Sy5aFeQoaXMF4hjvGYc5Beog18sRrDqjdaLrKGW/V+iPSF7ISV9pHsDg62TuC74B
         OX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780494881; x=1781099681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63SsAZlzaeTgiWToXEZ0aZXJJ2mJhkL2JKLP+Q/VDbk=;
        b=XJfxZWZbvPEJDtaPGNH9mdkdsuUJZSPJfE8v/fepzflhWcx7RB2whLMMPv/yCOcw8y
         5whhvQzsd9QeUEZBaoJUnFdFVDqtehzK1Fw2cD5uUz3J+txkCK5tD025M8rzBX+uTQf4
         aye29acOWu2/ucSu+9UxaaYglWO/Rz+Ty5nus3lJbFTw09MWS8kO24l93Z3wB+ql+VMV
         5ksVOykDNJPzNd3/Zjw8e1JkoDswwJ14jz5j6kvLczpkgAG/nwPHGt6cjs1j4jrB53Gb
         y+PUJ4EsobXTcagjnjncFuAG/8I3C0HjHQlkECPTZMuVdpLbPzjJOl4JUEJsoLNpvzlH
         sNfg==
X-Forwarded-Encrypted: i=1; AFNElJ+EEXCkMaYGCCFbuE6OZG3V2Xj7Wbo1pAtF/m7XtUjg3mu2EHCk8WNxCvJZf4F2y+PrtGQxYhPPIns=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvC/zvmeKv45WMLd5H4emQVhfcS6WecZqkPpyTdbniZdAkKH9w
	L90/SqdnD6IYetgjUgKIAHFvJysd/25Yzk/lXXBa5T0CAb2pyIdUi0sYaTIX5OeXDA==
X-Gm-Gg: Acq92OEcChd+Wg665HJM/MxeIgyWMTTlJyH2JcRM4JvEZqazuiuYkO4Ud3+g7pX/9Eg
	KGpx7SxF7GwnNrIZXrSCsOoA0P3p7E/w818lsdzf4dCwc333jCHp2FT3PMgA8/JNd159MZQvouf
	WPBIOsdhlkV2g0LLnhtT76ZRFLqAW43Agc2hPS39XP1Arn+EeBhAVfE2aZoo2eIk/n/XJskMbf0
	IEuVKCzqWjNb+OPzF2WYBVoNEkHfrQmmeDVRpQhdmUJPDANLPFTOOhzIPkcM3xc3Vx5wbMZj/gu
	PHzIBwyg53q2leAfqjE3sl1qkjewyWz59YKnKHlRAvv0/o0b67q7W3ceSCThgivhxHDRviKfYWS
	lS+w1p1pO/UdqjS6N3o9x8YAgzWodL9fBEtOQw1IzxKoA/14therE0Q43cL0j5PLjnUaSEAqCLS
	eL8EQ3Xqn2BMsnCKyiHxXaAKwak8annwfeaaz21xS663GZM59j0+3fHMJ1oyfFN+3ClJ9ebc6/D
	caD+Vmg4no5/zo1LKJ0J82fLzrdM6TtdsON
X-Received: by 2002:a5d:5c89:0:b0:45e:e95c:8106 with SMTP id ffacd0b85a97d-460218e9170mr5275856f8f.13.1780494881501;
        Wed, 03 Jun 2026 06:54:41 -0700 (PDT)
Message-ID: <75ee595a-6443-4b3f-827d-2dc4ac60866f@suse.com>
Date: Wed, 3 Jun 2026 15:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 4/5] tests/numa: add unit tests for NUMA setup
 logic
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-5-roger.pau@citrix.com>
 <2b1df2c6-ccbb-402c-b65a-7f3beefdeb0d@suse.com>
 <aiAwDo3EWi1oghm2@macbook.local>
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
In-Reply-To: <aiAwDo3EWi1oghm2@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780494881-8DD80D75-7632862A/0/0
X-purgate-type: clean
X-purgate-size: 826
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vates.tech,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF79A63848D

On 03.06.2026 15:45, Roger Pau Monné wrote:
> On Wed, Jun 03, 2026 at 10:38:52AM +0200, Jan Beulich wrote:
>> On 01.06.2026 17:43, Roger Pau Monne wrote:
>>> --- /dev/null
>>> +++ b/tools/tests/numa/.gitignore
>>> @@ -0,0 +1,2 @@
>>> +/numa.h
>>> +/test-numa
>>
>> Why the leading slashes?
> 
> This is the format of the .gitignore that we use in the pdx, numa and
> rengeset testing.  The slashes denote that the pattern is relative to
> the particular .gitignore itself, but won't match any level below the
> .gitignore.

Hmm, before replying I checked a few other .gitignore files under tests/,
and none had leading slashes. For the purposes here either way is likely
fine, but really we'd better be consistent overall. (Which isn't a request
for you to change or do anything, merely a remark.)

Jan

