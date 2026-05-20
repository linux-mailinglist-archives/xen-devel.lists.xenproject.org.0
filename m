Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI64ANFuDWp9xQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 10:20:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653EB5899B9
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 10:20:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313716.1583820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPc9t-00079U-76; Wed, 20 May 2026 08:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313716.1583820; Wed, 20 May 2026 08:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPc9t-00076h-3Y; Wed, 20 May 2026 08:20:05 +0000
Received: by outflank-mailman (input) for mailman id 1313716;
 Wed, 20 May 2026 08:20:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPc9r-0006qW-RR
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 08:20:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPc9r-00EWiv-3T
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 10:20:03 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0d6eac-5cb7-0a2a0a5109dd-0a2a4505874e-36
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 10:20:02 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0d6eb2-aaa8-0a2a45050019-d1558032c44c-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 10:20:02 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so37402635e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 01:20:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c8d39esm381227875e9.7.2026.05.20.01.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 01:20:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1779265202; x=1779870002; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHCAKlHkoqP04jUBv6qKUfRV9vMTAsd3SJvtE13gw9k=;
        b=esYGDIVY/qI+7gvZ14WFJAzXkMLzMyxX33zNNIFzcT1kC1DJDoaHQ58+6N05fXZO1y
         OsVG0yjXGA68dht3Ba3Kw7nYU/UOvF6w1WL4CnBDGZpazYexgxFt5FGLtZT8Q5pRxB7p
         /5y+t1+RMTEVlY2jgfFnI5oMtvEAXCuK9ktnR/dHyU/lIocU58Z+sbs09rJnLvvZFV/t
         SrrQQrQpzjmUNfU6uYgvwP9POOe7rDn0Aaa0hEVoiTymYxT61WVe/QDz+27IH1pbvZ8W
         5//nwaHfQ3q7XFIOvftUeIxa4reJ2ajRCUoLvC7zo19ZIy/iohew1DkXtr6ymhO8rTMm
         vD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265202; x=1779870002;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHCAKlHkoqP04jUBv6qKUfRV9vMTAsd3SJvtE13gw9k=;
        b=jJYHevvQHSGk8Gzx8TCDSkswUDBZeGoxU1UYPJEhEG3UEcDZVd8LiPrfJViv5rHxjY
         bAw1PcdkUbdE195U6nRoRop0Z8JiJ53ws2jdnhoHWbTsrBsROF66lpuboJefxG+PrcTC
         3sd2MFp1Ka4xL4E3jDsdHnjajDyhXYF3VGs4p3uF9JLfjgbRc9mekMngiAKxX2SFeyDO
         1zvOeMH7tLwawJQCUrAyiLqRmPq5bZn5N+XECpCy4hlRLmWLdyeYnxHq15kqErZc5OOr
         4xikrwtapGSL/b2Omoax6GdixiWSwGiDnlmcx6uhomOUi010Snm+aSLJNeVMh3eZIRlW
         cX0g==
X-Gm-Message-State: AOJu0YwY0A2jZfpC/MB8kWnibDA+MyGRiRipDw4GOzyNYUCvFkvmCpIJ
	2PSLLk5RwdBTWl/sgBukEvTZv3EO0UNNn+0/GODqX/5Iz7eu8El0QtW3dm/GubOMUV19nDCBfX7
	rzLQ=
X-Gm-Gg: Acq92OGe46H+2H6HbUsEMGCKmwBmnYjK+c1DDfA/2K4Iw4A+Pg6T1DWPAOIbk4yavzy
	A9/ot5XeRoU10yvWnIiAzvdeHBhVIaR0xgq+u2D5PMzWpcAEvQobVjfbCFcfpMqL6Z2h46lpLrU
	JyYp7ipKSiPIVmmQWdgdOPtg5AJVl4+NUfsyjoijwWIkC+TbeJqgp2SkxscmVcd219cbO0veSpv
	0vX1VWI3WG7upoiFP16DkBgjJsGRwTc/oqI9CXo7IB1lmlULefgn50yc8HA9/O7pj8TG2DOTNYJ
	p9M8F/Q1VayU2uBiY8mqFlyLVlBx2kQT0w0MFcaPOIpo4F/VYMLq6yVK9e1gC4y8mOPQNnY4viF
	JpgGyTXrwAiOs9DlsbTxN3MB89nDYRl9fwbvP27VC7aA+cQyYokkqZPwMY6Aid5roNM7ypkwRUf
	G5QaJCrOa23H3euAx7UHe1cLQZ6dGmzubpVSxSNs4QMTA+30RS5JrLMWXUMl9HTxUQmrFT1kFVU
	ToV7INLjRFrq+6ZkvrnXDwUeg==
X-Received: by 2002:a05:600c:8b6e:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48fe60ecc24mr367082855e9.8.1779265201804;
        Wed, 20 May 2026 01:20:01 -0700 (PDT)
Message-ID: <4f3a0cf9-63cf-405a-a19c-c8fc0473b2ce@suse.com>
Date: Wed, 20 May 2026 10:20:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] CI: disable debug info for analysis jobs
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
X-purgate-ID: tlsNG-c201ff/1779265202-D9772443-70454C94/0/0
X-purgate-type: clean
X-purgate-size: 1471
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 653EB5899B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Its generating and linking takes time (and space), while at the same time
Eclair should be entirely independent of its presence.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Sadly the setting of EXTRA_XEN_CONFIG doesn't look to be cumulative
(across "extends:"), so the addition needs making to all four eclair-*
jobs.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2539557855

--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -47,6 +47,7 @@ eclair-x86_64-allcode:
     RULESET: "monitored"
     EXTRA_XEN_CONFIG: |
       CONFIG_ARGO=y
+      CONFIG_DEBUG_INFO=n
       CONFIG_DEBUG_LOCK_PROFILE=y
       CONFIG_DEBUG_TRACE=y
       CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=y
@@ -105,6 +106,7 @@ eclair-x86_64-amd:
       CONFIG_INTEL_IOMMU=n
       CONFIG_EXPERT=y
       CONFIG_DEBUG=y
+      CONFIG_DEBUG_INFO=n
       CONFIG_GDBSX=n
       CONFIG_FRAME_POINTER=n
       CONFIG_SELF_TESTS=n
@@ -129,6 +131,7 @@ eclair-ARM64-allcode:
       CONFIG_ARM64_SVE=y
       CONFIG_ARM_SMMU_V3=y
       CONFIG_BOOT_TIME_CPUPOOLS=y
+      CONFIG_DEBUG_INFO=n
       CONFIG_DEBUG_LOCK_PROFILE=y
       CONFIG_DEBUG_TRACE=y
       CONFIG_DEVICE_TREE_DEBUG=y
@@ -206,6 +209,7 @@ eclair-ARM64-amd:
       CONFIG_ARM_SMMU_V3=y
       CONFIG_EXPERT=y
       CONFIG_DEBUG=y
+      CONFIG_DEBUG_INFO=n
       CONFIG_FRAME_POINTER=n
       CONFIG_SELF_TESTS=n
       CONFIG_DEBUG_LOCKS=n

