Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFdwKA29wmlflQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:34:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0927C31914C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261088.1554212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54hk-0000f5-NJ; Tue, 24 Mar 2026 16:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261088.1554212; Tue, 24 Mar 2026 16:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54hk-0000cI-KX; Tue, 24 Mar 2026 16:34:08 +0000
Received: by outflank-mailman (input) for mailman id 1261088;
 Tue, 24 Mar 2026 16:34:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w54hj-0000cC-61
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:34:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54hi-0078mb-IA
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:34:06 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2bceb-2eae-0a2a0a5409dd-0a2a450691f8-42
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:34:06 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2bcfe-3034-0a2a45060019-d155802ecdf6-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:34:06 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-486fda2a389so33732175e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:34:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487116f173csm71948915e9.2.2026.03.24.09.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 09:34:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774370046; x=1774974846; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKWowr1B+a85XDH0T1SBLR0GKS2pw1TRdxbFceeMyM0=;
        b=StjTBsFVkor1t0+gXORLhYaKrrul+M41YyoTOzfM+Ul/Wmc94s/bncKxtI1dy40JTy
         eu4JDEwdsCHPZJzga0/6ecOKqiXMb8NhthHwHYcYFbTV4Cxfq30BO2iB+LhtL1myWEYR
         6c3xq7SE2bQdGLj+WWVUSrtJUboqiwNC7zvAEAzlxdJOFYf4cFNNgGzzsoTFYndzwuR1
         khQyZM8modrKEEox8ogKFS2CoJI1gs1R7XU9pEIS8J+nLZEYJ3YkjRH6TSp+TF9y0a/z
         dWFExEULIQ7zN7hvufPuGZbZctTLKzKoAlRsBg5CLOSd7k/l6TRiGRxxKFGZl1FO8idg
         JhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774370046; x=1774974846;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKWowr1B+a85XDH0T1SBLR0GKS2pw1TRdxbFceeMyM0=;
        b=Al2Y7wnPHz6JzzfV99/eiqEuFSYedjlo+VNA3yzkjkcZBSXB/37zLKlHknpuMKkUO3
         AKQUh21ykozsLfp7HJdGvQ6nUHVW3Yy2hBut6lSOvTphE/EeEaHMSBwwnpID3lrINHIK
         UIVJGyjflK7KRw3mhIbAJkks+YrFOBqfXUPEG6eP1fIwVKyzYuqKK+zQ9JFAOLd9nQH9
         9NfjLTFtlfLTy5N8mJFQ1RkkMRRdJ+4WESL5caY3mMDRLCz61NolxTudMk63695Uo8SA
         XBI4KM7k9JJYRcCDuxxJxJCSLzX89JbubApbPNG0HDZ0oZaiX8VSQm998TEgrWxQhyln
         JWcA==
X-Gm-Message-State: AOJu0YxtyLro3l+qFkQEYP0XxY/D9D7yuarVlPQfcVHMSZZdBXxiUcYy
	eCuwBF8SUAvNxyFn7FAnwYc5Mq6P4Qk0q5yeBQaPhe0Bv8diGxFCXsIN8FdlCDcakHHv6X4/ai3
	S3Es8qw==
X-Gm-Gg: ATEYQzyAbo0Yvu7M+ddLx5mzEmEy6p565m+A7VG40Q7RdLXK5zPrJqcLU8taTHROSO9
	bJz75KF0TdWYRAWP+0vyYYaEo+zCJSHs3hDav8YnVozm6BSE7XPmcYpkI1yjRomDMSBjV6COMcn
	dsun4lzeScRZAK+4JfmtOPMCfBocE+/o9kFRgAayp2PnJoUkbBnnoRBeZ3SecsnQ5SJNNdrGZm9
	5CcR8Jp3LnhOVSc434RGxx3dd46IyaXh2z5zY8xEEnveCb0G7+Wvy3HnvCfbbnpYRqDNXAgJ1vf
	Lcgh25cP0THEuQPTQAeABMJ55yiKeH2Ffgqm0+u0EAwGI9AbZwKEQOYEV7HXYyOKGZsCw8X7ChY
	X0ZqWh3gjHPKjWR/RWcllhxxRAYJbWlYq8uVPzJY07QOZVRHvX43xzwiU1N2RazsrNa+ftguW2e
	eol5theB4mX2smvfeEYXayxhxAicz7A/Qest2M7188yya+pJuBDQCm839jtjsJUtI/HVrcPvuA2
	O+/pfZnjC9ADYLOPRwsE8jw0A==
X-Received: by 2002:a05:600c:8b88:b0:487:1c2:6a4c with SMTP id 5b1f17b1804b1-48715fbf6a6mr6774895e9.4.1774370045592;
        Tue, 24 Mar 2026 09:34:05 -0700 (PDT)
Message-ID: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
Date: Tue, 24 Mar 2026 17:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] input (mainly cmdline) parsing corrections
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1774370046-7B49B1C2-B8483577/0/0
X-purgate-type: clean
X-purgate-size: 286
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0927C31914C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A number of issues were identified by Kamil, by way of fuzzing.

1: EFI: avoid OOB config file reads
2: llc-coloring: improve checking while parsing
3: ns16550: harden name/value pair parsing
4: ns16550: harden positional parsing
5: video/vesa: harden font height parsing

Jan

