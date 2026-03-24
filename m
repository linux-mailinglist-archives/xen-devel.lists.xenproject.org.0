Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEgSO+izwmkvlAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 16:55:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AF2318717
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 16:55:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261015.1554158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w545m-00082g-NB; Tue, 24 Mar 2026 15:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261015.1554158; Tue, 24 Mar 2026 15:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w545m-00080Z-Jq; Tue, 24 Mar 2026 15:54:54 +0000
Received: by outflank-mailman (input) for mailman id 1261015;
 Tue, 24 Mar 2026 15:54:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w545l-00080T-Ie
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:54:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w545j-009d4O-9o
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:54:52 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2b3c0-2eae-0a2a0a5409dd-0a2a4502d092-36
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 16:54:52 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2b3cc-63bb-0a2a45020019-d155802cd1ba-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 16:54:52 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so43883875e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 08:54:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487110dd718sm22193365e9.29.2026.03.24.08.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 08:54:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1774367691; x=1774972491; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxNtEMm+Y2kC6ogmaaa662w1bsbtir7oeAeR/RbQ688=;
        b=PzaE0MDs417BrtB/PpuVf+EhlXQ2xxS2iaLB8pmWFqInGm491uIgvz8Szk/k7U8OXq
         s5g0MmNjuZjXZGCnnfzSZDA02t/YBOpaqKEa9thhQEoGCw8dSyaxDa3xMPxTucPMO3Ez
         mni8+hTmCTXfxVy8rB+FgRm03ZV+6TGtJTZsipv8EUdiMn+fPTWUY264aLxKC1y/S0dv
         zaFbRHxPBzIbijSpT4oehPVBVg0H3o8dbLEC+FfRUXpguj5YKyL7Sz1bxIki5OSZOSnJ
         tZD+1rJI4A/W+4naiE+FARvHUs7LouztM/Z8yUME2vqIXQdZVXAKOCq1DwitwWtVpsZ7
         3zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367691; x=1774972491;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxNtEMm+Y2kC6ogmaaa662w1bsbtir7oeAeR/RbQ688=;
        b=pVygKvjM+cv0gcyi3b9YqmRfOFqOnKnznZfV2VVt4frx+TPidI8AVXdyOBKaHt8kEg
         jT+GrDYccsAAXs8kIxPry45R/VH2PgzXBeXODc4E/tN67n1lA3e6GDnIQJhlSB5oF5QB
         HddpPXcSXoWQQ3WPbvLXZ3OYyJtvqQMfX8dH+Wj3eTjSdof1aI7jLnFxmtwmosaN/005
         /8WFELFcb8HfRu3wouSIBRMSVXWgJL+e5Xk9vJEJQvJA9nU5z4kohN3eWNhkj4pBVYr5
         kEQFfCTbTPD+oyxFobcJSUZXuw8YxBsiBAYzXDhhrcdtzJUuK9rupDy7XUkLS8MJGwON
         QQ/A==
X-Gm-Message-State: AOJu0Yzv7HyKhO7gGePVJueFOpBY59rjYv8wenJmBciZvxGBqSTlRk7W
	jWTXZhssVhEpZ6trHVnf9Y7TcEbBcW/t3rd1Qi6QNtd2fOMSRhk4hXwKcDde3N4doSrTwaVM5Mr
	ojEAdlA==
X-Gm-Gg: ATEYQzyFeZ92N7Ql6ZaEBbT7Ke2p8gH9c858T5pM7kRgdKtRDW0XFEgqCyT46q4s8BS
	7xxdWZdDEp2xhtO7iYaE+yNqSU+ThhRWB0up9rT6XuPK6k8DD3vrxpA8dqYaOXnnbg0ubLefl8g
	V4XGsEwA8YTH/AGD039i7A2IpLFcOxvKT9ho0VN49lNTccn+HuwFIIWf2y73AMB7wXwDduWkFIn
	ZdqwQ9Im/YiLUcw7trVs6MgY7jUje88K9790F7yqqAa166FtnxW1YGct7yyJG//7FnFhU8W4BUs
	uoYe3Xh6DAz3z6ZY8tgMINO97B59ojqxfdyryPOYfLpwQYuSVPkJxnoC0o3VlbCIBiuNbJGeWNf
	T6Zb5UjQ0yzpa4FU+6HhfDQeyeZ/2AM72QHjVgLzL3iKPd2P/uEftsGfuaZOOqvADi5VG5KTgjD
	UtA/fzP8YL5M1GUQjKJKWuXNUWWVZ8fdUeP1T+ndGFmVgZ85udpYDLiwxhyrYE8zug3kF83Jf3p
	YnTihN7eG6O+Ms=
X-Received: by 2002:a05:600d:a:b0:485:4535:73d with SMTP id 5b1f17b1804b1-48715fbf739mr3787825e9.2.1774367691484;
        Tue, 24 Mar 2026 08:54:51 -0700 (PDT)
Message-ID: <3cde1263-d5fd-4bb0-a0ce-c5bf5d735a20@suse.com>
Date: Tue, 24 Mar 2026 16:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] arinc653: clear entire .dom_handle[] for Dom0 slots
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
X-purgate-ID: tlsNG-720697/1774367692-68176DB8-C9498C1C/0/0
X-purgate-type: clean
X-purgate-size: 1235
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
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
X-Rspamd-Queue-Id: 65AF2318717
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When that code still lived in a653sched_init(), it was redundant with the
earlier memset() / xzalloc(). Once moved, the full structure field needs
setting, as dom_handle_cmp() uses memcmp().

Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There being no "else" to the if(), what about other Dom0 vCPU-s? And why
is it that domain ID 0 is special here, rather than the hardware and/or
control domain(s)? (Likely the latter as that's what would invoke
XEN_SYSCTL_SCHEDOP_putinfo, and hence needs to be able to run without
that having been issued first.)

--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -420,7 +420,8 @@ a653sched_alloc_udata(const struct sched
 
         if ( entry < ARINC653_MAX_DOMAINS_PER_SCHEDULE )
         {
-            sched_priv->schedule[entry].dom_handle[0] = '\0';
+            memset(sched_priv->schedule[entry].dom_handle, '\0',
+                   sizeof(sched_priv->schedule[entry].dom_handle));
             sched_priv->schedule[entry].unit_id = unit->unit_id;
             sched_priv->schedule[entry].runtime = DEFAULT_TIMESLICE;
             sched_priv->schedule[entry].unit = unit;

