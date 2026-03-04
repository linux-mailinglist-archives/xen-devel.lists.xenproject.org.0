Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOIVGz02qGm+pQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 14:40:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942E02008CA
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 14:40:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245371.1544709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxmRP-0005xV-70; Wed, 04 Mar 2026 13:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245371.1544709; Wed, 04 Mar 2026 13:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxmRP-0005vb-3g; Wed, 04 Mar 2026 13:39:07 +0000
Received: by outflank-mailman (input) for mailman id 1245371;
 Wed, 04 Mar 2026 13:39:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxmRO-0005vT-6r
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 13:39:06 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82981ee1-17cf-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 14:39:04 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48374014a77so83354745e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 05:39:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48518807293sm50031755e9.11.2026.03.04.05.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 05:39:03 -0800 (PST)
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
X-Inumbo-ID: 82981ee1-17cf-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772631544; x=1773236344; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8CtSVUJuB+yYJVb/WeTxprdobFeg8yLEY1rCMe57LE=;
        b=L3t+bEsRf2k7Cm9FOtMr+P7q8Jmt4Q97e/m+I5P6Tb7wCaOvZffh6C0bjawMe+YUJl
         cGSb2c6hlU4Za7BEZUwdDjWqBbzOdzQIOU4Szu7mtsSD+5SW7R+3BZ4+7ltALEm0AiH7
         NxJuu0naz1qfA+XTkXBp8KpIxxjvZ/uaeSCTNDz4fJZ0UvHXCSnMiXNZlgZYIPQN4kYD
         TvrHmV/PuEUauVdculw8/xN3ktGJ4ezL5Z5mbpbz4T2+sxKHsy3fF24K3Twi9MM8wKQX
         LuFQi9/E7/t++cz4dBD2vljtvCB6T8q53gqCqdUoYEshO0ML9R86KwSfAz66tjGVGWzH
         YWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772631544; x=1773236344;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8CtSVUJuB+yYJVb/WeTxprdobFeg8yLEY1rCMe57LE=;
        b=D2PB9pVAKhO5qVt7/oM8LJEHxwN23q3bddqCSCjRcAm5Zu+oWJMQcgwBydvLsvbaol
         1JgcVoGUC7I7y90uAHYY+U0LVgWox02o1xEVbmauWlGH9WOT+EsURxCvcT4rntPA6/X5
         48pcVkovc6yZqWAp7v9CLEIYfvpWJ4HiD5setLZnlCS/yxuAXylz40We2yIDGS9mPEsi
         IeIHiSb2ZLrvYIJG1Izz1uIEvpLm0HWWmo8Z/6IDevxX7lBC0oehVkuqBGcR1+90QudE
         zTG/m+HoF0vnHiA0IJ9JjDmWGYXgfATMSQ4uJr2X2g662NC/t8+AKSOcHr2zJ11ctWyh
         p4Tw==
X-Gm-Message-State: AOJu0YzqwavaZSCwbOe3wOXohI0P2emPN/vHHFbMzdJ5mPK6teqTwK4C
	Za9T7xUA4GHEfm9MySqZfxFZsPdrtiCCbd/k5lKCN6h/Fp8Lzt3PtOQpvcMuhpPtdgWlv3BAqSn
	FKus=
X-Gm-Gg: ATEYQzweliDychRUsTdH2tJEsCw80hel6T2Pk146Damin6qGWS0XA7WoOEap6Ysfhnz
	vkvmbddST1eygJWPNxq8TwTbjNVEPbEugwF3zPBQ9SitL9RmJX9FRU86IRypPHfDF3n/JPgev0w
	qPbXYOL4tOeGCuHIuoDkuq0/gDyZuxWt25fyrtNo3aSVYX+r4JYntaeFZtSryMJMpXQi46C5r9Z
	R36ztb60+qMiaF+8PdXJralyKp2OfAhQd2JmvwyFewWGxTnlOPQxOqwtkGRdhc0knfXJzONwQ01
	tEcD1EATvx1dvfVoOxU6sD8VNGvfG8AYGDYoMoaDOpPNy9XySFSlWQbbuJkk4km9jQbT0vCKOHI
	3LJsj/hsargqdgEGvY82n93OormL//B91t/3kjgEvCc++IrqsvzcMk9wE0Qd1g4SA/emgWuxCOi
	A1dcha6eVBCTUk5kVM5O7qkkh09fgy6s4VXtLTs+iSxzJU4NJC07YUm8Plo5TipPTTnI9W161Xi
	2Nb25swVdrCH7M=
X-Received: by 2002:a05:600c:4e8b:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-48519847bb7mr35003105e9.12.1772631543674;
        Wed, 04 Mar 2026 05:39:03 -0800 (PST)
Message-ID: <12fbad10-78ad-4679-a1db-3995e34da094@suse.com>
Date: Wed, 4 Mar 2026 14:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/S3: restore MCE (APs) and add MTRR (BSP) init
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
X-Rspamd-Queue-Id: 942E02008CA
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Action: no action

MCE init for APs was broken when CPU feature re-checking was added. MTRR
(re)init for the BSP looks to never have been there on the resume path.

Fixes: bb502a8ca592 ("x86: check feature flags after resume")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Sadly we need to go by CPU number (zero vs non-zero) here. See the call
site of recheck_cpu_features() in enter_state().

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -642,16 +642,21 @@ void identify_cpu(struct cpuinfo_x86 *c)
 			       smp_processor_id());
 	}
 
-	if (system_state == SYS_STATE_resume)
-		return;
+	if (system_state == SYS_STATE_resume) {
+		unsigned int cpu = smp_processor_id();
 
+		if (cpu)
+			mcheck_init(&cpu_data[cpu], false);
+		else /* Yes, the BSP needs to use the AP function here. */
+			mtrr_ap_init();
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

