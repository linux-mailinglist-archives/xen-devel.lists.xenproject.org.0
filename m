Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zCfUBunFQ2qihQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:34:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2616E4E50
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:34:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=ezxivpHq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348888.1606680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYbW-0002Zu-IY; Tue, 30 Jun 2026 13:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348888.1606680; Tue, 30 Jun 2026 13:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYbW-0002Xg-FL; Tue, 30 Jun 2026 13:34:22 +0000
Received: by outflank-mailman (input) for mailman id 1348888;
 Tue, 30 Jun 2026 13:34:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weYbV-0002XX-GZ
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:34:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYbU-0082gS-Gw
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:34:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43c5d9-2eae-0a2a0a5409dd-0a2a450ccc7e-30
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:34:20 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43c5dc-f399-0a2a450c0019-d155dd2eec5f-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:34:20 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-463f1165e16so4582472f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 06:34:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636cf65sm8562163f8f.21.2026.06.30.06.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 06:34:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1782826460; x=1783431260; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LiMiYR4QXgqyG5TmFWAoFayifRtIcNLdutqubfIctVM=;
        b=ezxivpHqq99d/R57JgIVyQaDxyMBJp4Ubes7t3CkRyCArNTzLFmmcfcqabMgQ/qZPw
         5JNc3kFxWdzQ4SRr964mc/605ezPKszxyalWCl2Pgdu/B3EuJ03osc+qYF40xqQ5H1Fq
         z97I7pKLPlo3XC9zSADiwT6UzYbT8kR4qlToGE0JraJf5l0czgXt+VDqKf9Kkoxj8O/M
         4KkbUr03TvhjpoaWGbKlFhr/vr5coewUwPxgwRevTMUW5ZstKD/uq99q308ZoOjO10mg
         Oeuh7Kg7DhESWRg6BSe71i3hw07O8A8zqDZI7J0WXdKMRGBVmbcRz9UrHlLCFKOhqUXi
         LvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826460; x=1783431260;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LiMiYR4QXgqyG5TmFWAoFayifRtIcNLdutqubfIctVM=;
        b=KSHh26IMZkwNG6VKRY2ZiYn5bohMQQ41gVMfYUuJurZc02pZBiNjTRx+MMz6gQxGIl
         mqwDGRtP3PbKBcCbCCCptBjGZCn8lW2h4+uSYYob8qN5d++66mOEL5He97fxVaZ9fSCo
         isA/tI5LTYlxTTSioxGXhZ0beNdgDMlfK5kPEQkjP4tV5qodh/dKrxUioJkZtjS9X5GX
         ebI+j1B8ySUXJXtpZvkW96FHAlIgmX8yeu4P7iSHUA9081XGnThz1FuUAGS/giPscHtO
         4hNeB45Bm+HUUxcwaQeyEp3C47/aPhjt7tIc3VRCMP82aqVUeQVSCnrvHV+UmvSqmG1D
         /RPA==
X-Gm-Message-State: AOJu0YyXfpV0BPMYqOJQQsT57SYRUHJ1fp7GQ5sKE/FM7oeSXsWkg8CW
	lNvtEyUIjS0wDFQYn6IaQdeNevnSQADs9Vz+YMek7sEn/2Xmp+6nNDVRfqCwjd3G2r5X+fwGDk2
	ufuyoew==
X-Gm-Gg: AfdE7cmKLbUXM0wZETwTmWs0twzWqV0kJayHMNdgMIIq2F8uN8YFyqIULKaGOtg8cox
	X1uARplTafaqzq8dmUBFe0AOxV3iUuiWWVO6zUKXOwu6H+oxVJiXCpL2v7p5/n6PXsezuDNTelb
	uVM3csjQFw06wSrLYMesuUsSpowTsZn5bsVmcgiOy2sn8FEPoGEablIkV4oMbGAg7tc2sGOROkN
	5n86WlbcA19tp91TjUndBDGSUFjDzr1BmYCYII4gzybbLwM0dUzVNCqI/5+MOV/HHw7kDVslsFm
	xA00prGRwPjIpQqnf38LP3s629tFA4V0AKdt9pcqkOOAulE6fpznyjbHlCO9LGLd1auj9zSg6zZ
	iUYagVJTNQ9mT0FLH1dn11Io2nJrEaVJtMk2MTtDVnRAR1MrjST6ryqCsFt44DxwcP9cSSYc+mo
	amqc9rZesdmbTynbuLv6WrL2awamlvnwRtGhBa/ht2dU7aFTpsxWS5vFFcQZVgM1FEkE6GDPMmy
	IdT
X-Received: by 2002:a05:6000:460d:b0:473:6e8d:7f3 with SMTP id ffacd0b85a97d-475506e96a8mr5108972f8f.1.1782826459669;
        Tue, 30 Jun 2026 06:34:19 -0700 (PDT)
Message-ID: <7dfa254b-e61b-4337-aa54-b6f14a28d0f6@suse.com>
Date: Tue, 30 Jun 2026 15:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] hypercall: mmuext_op is PV-only
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
X-purgate-ID: tlsNG-d25034/1782826460-9253ED51-EDCD7312/0/0
X-purgate-type: clean
X-purgate-size: 1274
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F2616E4E50

In a !PV configuration the functions aren't built. Hence we're better off
also not declaring them.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -137,7 +137,9 @@ memory_op(unsigned int cmd, void *arg)
 #ifdef CONFIG_IOREQ_SERVER
 dm_op(domid_t domid, unsigned int nr_bufs, void *bufs)
 #endif
+#ifdef CONFIG_PV
 mmuext_op(void *arg, unsigned int count, uint *pdone, unsigned int foreigndom)
+#endif
 #ifdef CONFIG_PV32
 set_trap_table(trap_info_compat_t *traps)
 set_gdt(unsigned int *frame_list, unsigned int entries)
@@ -168,9 +170,9 @@ set_timer_op(s_time_t timeout)
 console_io(unsigned int cmd, unsigned int count, char *buffer)
 vm_assist(unsigned int cmd, unsigned int type)
 event_channel_op(int cmd, void *arg)
-mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
 multicall(multicall_entry_t *call_list, unsigned long nr_calls)
 #ifdef CONFIG_PV
+mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
 mmu_update(mmu_update_t *ureqs, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
 stack_switch(unsigned long ss, unsigned long esp)
 fpu_taskswitch(int set)

