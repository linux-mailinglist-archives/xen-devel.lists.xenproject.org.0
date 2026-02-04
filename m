Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHKbA4VGg2nqkgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 14:15:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735D7E646C
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 14:15:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220524.1529203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncj8-0004E9-Ig; Wed, 04 Feb 2026 13:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220524.1529203; Wed, 04 Feb 2026 13:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncj8-0004B2-Fp; Wed, 04 Feb 2026 13:15:26 +0000
Received: by outflank-mailman (input) for mailman id 1220524;
 Wed, 04 Feb 2026 13:15:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vncj6-0004Aw-PV
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 13:15:24 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8faacc9d-01cb-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 14:15:22 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso508585f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 05:15:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e25d47sm5783460f8f.5.2026.02.04.05.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 05:15:21 -0800 (PST)
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
X-Inumbo-ID: 8faacc9d-01cb-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770210922; x=1770815722; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DW1XMjjkMC7daK+eUf2R6Q2Ilhfa4Aplle90B9m7mug=;
        b=MpLVlZwhbNdU5n0/Xh+9SRinCKc2U5IW289IOo+ceytAiFjm+2V/+l2pM4fr8ypoMS
         9IvKon/gCCWXy0W+rjnJthgrwuT1mOFwb7JehylXz2EOPES9LLQj+2o/MXBVwBhSrwy8
         SgZgHL+78ceUo1K65ASoWFSyb+pi7w43r9Co5hsNr2/92GupqlknGgDlACO+iqBLlFmE
         jx9xsOBeluZbf/UR2TCGjrd4NbbuVdWpQxpw9iYq49coz9X2tTlT8XJZGg2Bc8aJm8pt
         6rZxZ2BdmE0aIiHQYNFrtkMshfE+5LE0QgoB7wv0wynbS9oL+/fupasduZJaC4gepDVz
         BtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770210922; x=1770815722;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DW1XMjjkMC7daK+eUf2R6Q2Ilhfa4Aplle90B9m7mug=;
        b=jdVosb+8oaOnSIMNqwm2nFW+1RkkeH3MOba4zvvrUnkc12LR8fkCgoQD1ggF5IjXal
         0p7VnJ2zijgqIIhZ8n/v+fPdzwr+0yMluEf2vtpDWa57UyuBkPy9u2LYrerwe6LCrzao
         OEtwsmIG435E67xCBVxskUznNFBV/t5kEeV+c2MvSn68P6n9pjfqveJGU5pvbUvkT/uE
         UeUoyBuUZ1aBXw+i+zzOF65pozig1A+2kG21ikMnYH7ZSQQZ4qezXJvzT2s7Su3MuBLr
         L7EXaxpY0FNdrdJen60RpRjtqJk3sbhI0vDR27vejpnCDMnVpT73t0NLeoAfU5gNIs+f
         LdUA==
X-Gm-Message-State: AOJu0YyXqClhFzQ9q4g9h2Gv47pFz2WpOpISzIYk7H/en3zrfr6qSraP
	A46J3DJsoxDLK9zgI+9QxLkSKoUxE/wVajHQIgzTeuy1LDG5eqPZOC17TzbApObxsNof0fdGupI
	KJBQ=
X-Gm-Gg: AZuq6aIdGFiCc0L+rVHAT9FBIg3JhD/mLGFU+vXL2zI3aXziIJ8kNkquuqf323Rad9k
	PpECAubn7xC+W7cLD+T7zen0+UaF02ioIHjfZnws5MY3dNQaS5XW1nQFdbgf+Utm85yOeeZeN0J
	LXxg1cAkQ8YrNaNT/QkO/72yRvcwTw9gAzx25fUTNdOve20wyXYTQ2jFvoPk45G9YxQ6peGvpCm
	IF7mCTTtRudVMvwiodcG0lKtC2SmJuWS6SvRdrypc8YIESf8jJCr0tcBXAQ3sVrhnUkYEKFpVBF
	YhqmWh/iz838MjqInquxVBGkSm9jEXPIfWAARQNEJH34xl+gLf2W+G/MMXLdwzerUxt5f/RnShW
	CphP8n2yTPkEGutYI8K4z80o8wh0tkcDe+XSWm3gD6k6Z1wxcbwrhpIF/Mv/yMf8AAVOR81NETD
	59vB7g8aLEsP1MPekhan59/2Utx39ZTurRtUwPlM/tzxgDZEmvnflr4Do3J2afmNhd5fFSjvxkb
	mU=
X-Received: by 2002:a05:6000:438a:b0:435:9bf7:c6b9 with SMTP id ffacd0b85a97d-43617e3c919mr4173033f8f.24.1770210921978;
        Wed, 04 Feb 2026 05:15:21 -0800 (PST)
Message-ID: <e4296634-1498-4df6-95fe-6b17f50248e5@suse.com>
Date: Wed, 4 Feb 2026 14:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: relax barrier in sync_vcpu_execstate()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,epam.com,arm.com,amd.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 735D7E646C
X-Rspamd-Action: no action

The counterpart in vcpu_context_saved() is smp_wmb(), and here we don't
really need any more than a read barrier: The concern expressed in the
comment is void, as updates to the context are necessarily observed ahead
of ->is_running going false, by virtue of said barrier in
vcpu_context_saved().

Fixes: f6790389613c ("xen/arm: sched: Ensure the vCPU context is seen before vcpu_pause() returns")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As to the tag, this is one of the cases where I'm on the edge between
Amends: and Fixes:.

Subsequently we may want to move the barrier into the sole common code
caller, seeing that the other barrier also is in common code. Furthermore,
seeing that for all but x86 the function is then entirely empty, we may
want to allow it to be inline to avoid the unnecessary (tail) call.

--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -342,11 +342,8 @@ void sync_vcpu_execstate(struct vcpu *v)
      * Per vcpu_context_saved(), the context can be observed when
      * v->is_running is false (the caller should check it before calling
      * this function).
-     *
-     * Note this is a full barrier to also prevent update of the context
-     * to happen before it was observed.
      */
-    smp_mb();
+    smp_rmb();
 }
 
 #define NEXT_ARG(fmt, args)                                                 \

