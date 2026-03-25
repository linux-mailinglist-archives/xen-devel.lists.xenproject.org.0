Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHRsGcThw2lvugQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:23:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A9325A8B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262313.1554874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5OCM-0001Jg-1w; Wed, 25 Mar 2026 13:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262313.1554874; Wed, 25 Mar 2026 13:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5OCL-0001HU-UD; Wed, 25 Mar 2026 13:23:01 +0000
Received: by outflank-mailman (input) for mailman id 1262313;
 Wed, 25 Mar 2026 13:23:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5OCL-0001ES-1A
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:23:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5OCK-005xsz-Cq
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:23:00 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3e1aa-bab6-0a2a0a5309dd-0a2a45058d38-20
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:23:00 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3e1b4-5aeb-0a2a45050019-d155802be8a8-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:23:00 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso23903665e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 06:23:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871736b808sm19311475e9.23.2026.03.25.06.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 06:22:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1774444980; x=1775049780; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqac+6c8t8wghMoXvnhnXW9xcCqlv3ehXF1kkwdr1HM=;
        b=RxEWzFEQZkXh7SnCUIb3he0HZlZClOluFQTFjYEwQOuyr3L3T4Ox7R9kzYbjRoay6J
         JMuzOEcrCpUa2tJ8U45WOeV+muwBD2f4OJnx7lK8ihKHDnEmoH8MNZHzLCrukmamCg/s
         xSgSVlNTQOoQELOSwyr1a5I7wIJLhMLkAfulYNFPIgy0TWwKj5n/gDcW0Q5qeOefFARv
         BMrFei/BW2eGeC2cV21Sem1x11UJY8D6lffE3y9Q2FW4AM6/pF9wBIbRASzqUQnK+lM/
         WlDkZ6kqvrMwOaoWDXqP7G40+nPW6+Pi8uUGq9SctrFaG8yE2JwmljlDkcdz9QuKW7MG
         mrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444980; x=1775049780;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqac+6c8t8wghMoXvnhnXW9xcCqlv3ehXF1kkwdr1HM=;
        b=eKokjhnv6mUUwmezor+3YV0hy/V5mxcPyu3w8iwGFsBMY8TvneITXvK85rr4NQi43Y
         IgWahEmyYXTWQznG90b5Td5EqbmbrFyvfkFjsRJj90VJylsVGzIAgI2B8BJ8KNrbyMBE
         w1ZWu6Ej2yPbOu6Fvo0UxciLnVJLB7TwASFdUZTHDa9/HbxEG3epqOJIArbFypbZAtU7
         SDzxYIdCb/KgjVyXWvm6Te+b81Nt/JL3dpwRU68NX+/By/P9E6s5PFHr7vLqBbZ25KVf
         AAm7sHdT25VpZEMBThyyg12KJB21XARELh44SNIdUrvJLlt3p5mK43m8YgRPtOlNzUhI
         GBAg==
X-Gm-Message-State: AOJu0YxWDmOLq02aSMCFgSOnB9ohPHYBQQZTPj/sqV+bF/45Ka479PNB
	p3KiZN6mCUEbsxQcPX9gRtvawK5L8fIT89Y41C4Lr4gCDylxSrsBCN0QmbpaUnh8r/euO2yp/zF
	gzDkP4Q==
X-Gm-Gg: ATEYQzw648D1aF5MdIL1ulhOtxdmECx7prrzW9jQwOFPfBTy68plNq8sPAazIQoQu0I
	WwB7cjNkTPC2aNEGKJjEoxK9lt30Yjsfcm2tIJGM2i6P0fOAhvrXds3BOPDBs7stNCsw7zLvXdy
	/0LKJFX0nkGLf//jHyPgxrGkXV/mQDqrkLuRPNOF4i0nSKXlfFXBO1vY/iHUBF42K3oy5ydEI6F
	BSMa/E88g2O3q8I6KnpiHmiq1s8rs2/uLvNUjcxWxIhsCQlQ+McvdQGk2oeQMIn4qRm0h8u8sSg
	CPr+ruRmQo/LHHZzbDS8ZCCradmrNRmvcwj47MJ48dUUsx9oMOOPRdL500BeXrFpTe8hGx1ylhp
	LehKWTVxgyBA8wfRggJRX18j6zRRzTNmPtBuER8iIPrAOeCM24b+uNGjqObt30jS1BfNPrTERmM
	1bvlPMyXJZbInq7cjG7nE3s9NxNQT8TNgK0eZl5KZcNXXNSPCqkRwVVXBkVTv3XE1FCRaQfeqMS
	ZYjmS69oD/NMvE=
X-Received: by 2002:a05:600c:5296:b0:485:364e:934e with SMTP id 5b1f17b1804b1-4871605cec5mr55665575e9.21.1774444979551;
        Wed, 25 Mar 2026 06:22:59 -0700 (PDT)
Message-ID: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
Date: Wed, 25 Mar 2026 14:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] EFI: cfg file parsing adjustments
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
X-purgate-ID: tlsNG-c201ff/1774444980-23082488-76B5DEC6/0/0
X-purgate-type: clean
X-purgate-size: 85
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3A4A9325A8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

1: avoid OOB config file reads
2: move pre_parse() back next to get_value()

Jan

