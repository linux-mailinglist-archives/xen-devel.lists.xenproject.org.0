Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL2+KAZkBGq6HgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:44:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C40F532762
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:44:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307866.1579431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN801-0004uK-0G; Wed, 13 May 2026 11:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307866.1579431; Wed, 13 May 2026 11:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN800-0004sC-TG; Wed, 13 May 2026 11:43:36 +0000
Received: by outflank-mailman (input) for mailman id 1307866;
 Wed, 13 May 2026 11:43:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wN7zz-0004s6-AZ
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:43:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN7zy-004ZAc-Na
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:43:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0463de-5cb7-0a2a0a5109dd-0a2a450284bc-26
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:43:34 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0463e6-af86-0a2a45020019-d155802dbccc-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:43:34 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso58436885e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 04:43:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454913049ecsm38841796f8f.19.2026.05.13.04.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 04:43:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1778672614; x=1779277414; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JaI4iGc9p81xoyHCgeQ7T8nyLB0WjdM6V+d3y3f8ChA=;
        b=ZIWAlqkIooCq5zBKl/pVJHvUwrtOE/zWmM/SAoYDkwkf/Hir1Vqvh51b1cBOCIVMvU
         g0z0pCEer84ES3l5O+WT0tu870EL6J0c9WKxCHKTyqtB/IjLo8fFoaY1VnTFdtijERGx
         yza0EngSs86oZBSTBcwRyTEfOBJ+gXcNiVFORgFu9FJ3ze1wnXuJZVJ5SKInUt/K47dp
         LH5bD47FfRRcbES7biquhjRyPVYc1/V87mleExXlukWPBNT0teZPGEhHNBVi+7yZduaw
         YKlbnoVzGIIAS8rLjNM7Yb6B2IdkbL72ldY02Rfhz6XgzZNCjBm6eLQGpHKT44JeTp7Q
         g21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672614; x=1779277414;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaI4iGc9p81xoyHCgeQ7T8nyLB0WjdM6V+d3y3f8ChA=;
        b=Nj1/DSiEOV5caeShLX1l/QnaXjsLL8d2uBFzSlkYM5oidMaPz+W/oaRZl97E67OEc6
         8yO1lpVZqkqTCgP+JmDYj+bvHITzsZcvWaz6NicqZOZ+5RWvEF7KM42esp3wEepn+csj
         ZGA66JMuHB7jCGkCQM9pCUXtVbZP0lrXn6m1EIqLa0wf02pO/w7rc58uP0qPLqMEt/Nr
         5+p6QOenFoQXpq09V/2uXeZGfxmzURKgge8GZtd1DZaLw6jgrxgAkH32959uuU4dSaHc
         p57FBLPwAiTk/kf1QmfNaHQ+xj20MC0mosTfMZDpLeq6k8irztrW5IBs68LVmk/mnX+4
         Hqeg==
X-Gm-Message-State: AOJu0YyDvE90kQWJlNmZy18kALamRor1YWFgb5mhJiw3k9Rg5IfyZtsM
	DiEu+AItLSbLSP320Dr4+BeEZGhaOBTNUQ4o98unKP/h34OeSOfOCam0rs6f4Zw39+5nzEVCwDR
	GPwg=
X-Gm-Gg: Acq92OFpxqR3E2xSNDaS6yBG0M9NhNqcif2BFAV8GRrLerWxiJLEHWrP1uhDbXNkz+0
	qLTsrJZPuel0iZ7mr0aQNR1r84z3EOP2oqkxBG5KKes0qSvoepXlNAHmnaTZtosPzLkr2LjpTyj
	EYI+J7prdjgMU3EScC8HslCBKv9oaix215EbP8eYDyikdo83zyxg20kK0CA+CuGUWR0cRTKGzD4
	RLJ/U7NTWWVQJDYSOmVbDJ0KFV8wRlDQKxr3EQ9aoTQaSiyRFJDASvQHyb5nrGGI97UKAbkAh3+
	rWAGtxVLE5+7p0RySlYrVadNUPR/5jSKuRX1C7+dIvMme86zF6gQcIwyHUt5xwXkCnAF3E7Fmpd
	eXkI4l67UwEUjzPViWfytyZIEuMft7zh4G0HjyPJR44ZnLBPrAf4Rtq0tEzkEmn+TbWAbvViT0I
	WCi4gUPfHy0VL1y64EfO5rhKYXZUtP3l7BtErOZcXIU5qklsR/aVIJeBEgl0fLBtMeZF/5kJzpb
	F7zHQa/HBc+V90=
X-Received: by 2002:a05:600d:8496:20b0:48f:a75e:c21 with SMTP id 5b1f17b1804b1-48fc9a0291emr26222995e9.6.1778672613983;
        Wed, 13 May 2026 04:43:33 -0700 (PDT)
Message-ID: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
Date: Wed, 13 May 2026 13:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86: Misra rule 5.3
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
X-purgate-ID: tlsNG-720697/1778672614-83961161-110248AA/0/0
X-purgate-type: clean
X-purgate-size: 389
X-Rspamd-Queue-Id: 1C40F532762
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

1: guest: rename a local variable
2: PV: rename a local variable in pv_emulate_gate_op()
3: shadow: conditionalize / rename local variables
4: shadow: split a nested max() invocation
5: shadow: rename a parameter of shadow_l<N>_index()

For reference (also covering the one rule 5.6 I'm going to send):
https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14348506098

Jan

