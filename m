Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLr6NL0owWmbRAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:49:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4942F170D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259258.1552563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dm7-0007YS-PF; Mon, 23 Mar 2026 11:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259258.1552563; Mon, 23 Mar 2026 11:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dm7-0007WV-MV; Mon, 23 Mar 2026 11:48:51 +0000
Received: by outflank-mailman (input) for mailman id 1259258;
 Mon, 23 Mar 2026 11:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HLc=BX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w4dm6-0007WP-S4
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 11:48:50 +0000
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41031771-26ae-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 12:48:48 +0100 (CET)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-439b97a8a8cso2972960f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 04:48:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b6470c239sm29150423f8f.27.2026.03.23.04.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2026 04:48:47 -0700 (PDT)
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
X-Inumbo-ID: 41031771-26ae-11f1-b166-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774266528; x=1774871328; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yruJIUkCCFaPXukXAG0a5ZiiUtWAnsWALQwwd00dzu8=;
        b=LVl10yLazsLuP1r2CXXEv9oQK23oWFS4viat2LN7/xH6TMgC3hhF2LJ145tOcPlNmz
         RcWZ7ooUc4Xadi5obQgLwnAg7TbTuAqkstuv/g75CCviwD9D7Iu/x1Aa36OOHM2ye7uX
         C495JdNRkvYMZElBpEUR860d24SxXu+1t4vFjawZnO8b2cZCFs9RI/AQAglNlydZfyV8
         YfJHJqFGatzghFY1VsH6tVql7YQPUIQIzod9TTO+U7gxYj7FDAg1bKjAkupy721nO518
         W1yQ/GCytLsr8bPjWTgV7NQkE5zrYqlUkcYU9hYFWvVoZIwXzXHJ8b0zskgt5IFkghqz
         sBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774266528; x=1774871328;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yruJIUkCCFaPXukXAG0a5ZiiUtWAnsWALQwwd00dzu8=;
        b=Zf6X9gi58gTtwxiMts96YPCelX08oH5Wpqz7nF/G16y43gjz0YnoD3lYpWSswxK6Nv
         DiSoikZIQua6slZPRlJl1xFq6/Cpvhk1QCAdACoiX8n/U5ONcZ2KWrsgquB7mdH17KW2
         EL/v4Hsw0NqVasGFwnl63s9tiS54L9xR5TzfOhTtqDwhmbjGLMoYDEunqjiYQZ+1Cf8p
         H8Nooso3btbn5BZXi/y3DWoX+HtJjc+0PZVc1OsrSve0ycl00zkikdGR848viyGUNsf7
         EC6gaQs3ESC/ODNgyT81bwXEiawNOA+RKsJzqga3FNtPhBrN9Xtd1DzSpbHX429gESSl
         jV7w==
X-Gm-Message-State: AOJu0YzZXJyM74LVyQxuctuBZQFTaVZR0GdcoBNPjDX6J3Ylzbkjk4in
	Nfcy7ZAcrZJ9T3xwi6sdZvX9e8/EwjK8c8lnSIXW1p+vT/9kB9d8ywCkwXsUWUaKc+d+C5W8Mn2
	zi9w=
X-Gm-Gg: ATEYQzzrB47nf8K/tqmIeyC/q1FHcsG+NjnvPNWt2mnbPlHoBzKeUFO6Pf7vSb83Wbl
	A0hn4k5Bl2J086x9bVmo+kH74v2yMpu3q7Yez8zmORKlvKWto0MSlsaCsZpKJGk6IMR0dtLv+lx
	CMuR2atgw+Tzd2lIvt+E+r6gEbn0mC2vp6esKdt8VZE/W9tuG7WlojolpGMeYwR14gEZkKvPZFK
	S/VQvyX3GXOhBXReuW/v01Hm0dfBvB2ne0z9HVskOkNLTI18IL+o4gY0tNoqZYdfQ7YZ/V33gRH
	0xADTJOkB7EHVfMMDXTc0xbc1m1b/QRZP5KTrnBTeW0eBNiztDJoiKySTO9J+aZkPoYMiI9r79J
	CPNF4RwN/wSzlDWmHTV0J8xpU9Z407jtmhQ5BFDTEuoigQfKs2VDKKx3roAiG2TtVoHXsSqm5wL
	aEwtSXcZbYKVd4JN4JvDLV7FJi36k+odoid3APJZSYg3KEpBo53NkqNew2kOwBkyZeMqzoOccZ2
	9qa+ybhcNTW/dM=
X-Received: by 2002:a5d:4603:0:b0:43b:6955:54c5 with SMTP id ffacd0b85a97d-43b69555596mr11871108f8f.17.1774266527684;
        Mon, 23 Mar 2026 04:48:47 -0700 (PDT)
Message-ID: <95b7ffb6-a088-49bb-bc14-894993de4f77@suse.com>
Date: Mon, 23 Mar 2026 12:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/S3: restore MCE (APs) init
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3A4942F170D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MCE init for APs was broken when CPU feature re-checking was added. At the
same time make sure we don't bypass setup_doitm() (and whatever else may
be added to the bottom of identify_cpu()).

Fixes: bb502a8ca592 ("x86: check feature flags after resume")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Sadly we need to go by CPU number (zero vs non-zero) here. See the call
site of recheck_cpu_features() in enter_state().
---
v2: Drop MTRR part. Add comment.

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -642,16 +642,20 @@ void identify_cpu(struct cpuinfo_x86 *c)
 			       smp_processor_id());
 	}
 
-	if (system_state == SYS_STATE_resume)
-		return;
+	if (system_state == SYS_STATE_resume) {
+		unsigned int cpu = smp_processor_id();
 
+		/* The BSP has this done right from enter_state(). */
+		if (cpu)
+			mcheck_init(&cpu_data[cpu], false);
+	}
 	/*
 	 * On SMP, boot_cpu_data holds the common feature set between
 	 * all CPUs; so make sure that we indicate which features are
 	 * common between the CPUs.  The first time this routine gets
 	 * executed, c == &boot_cpu_data.
 	 */
-	if ( c != &boot_cpu_data ) {
+	else if (c != &boot_cpu_data) {
 		/* AND the already accumulated flags with these */
 		for ( i = 0 ; i < NCAPINTS ; i++ )
 			boot_cpu_data.x86_capability[i] &= c->x86_capability[i];

