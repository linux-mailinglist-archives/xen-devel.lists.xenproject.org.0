Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK+SMsM9k2kg2wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:54:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCDE145D27
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234322.1537621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0vg-0005cj-7Q; Mon, 16 Feb 2026 15:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234322.1537621; Mon, 16 Feb 2026 15:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0vg-0005Zl-3k; Mon, 16 Feb 2026 15:54:32 +0000
Received: by outflank-mailman (input) for mailman id 1234322;
 Mon, 16 Feb 2026 15:54:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vs0vf-0005Zd-7M
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 15:54:31 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6a91eca-0b4f-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 16:54:29 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43626796202so3077908f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 07:54:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6a5e5sm26539933f8f.9.2026.02.16.07.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 07:54:27 -0800 (PST)
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
X-Inumbo-ID: c6a91eca-0b4f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771257268; x=1771862068; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NyH/rUNMvNUadAFEpknBN6fqSUoRpgmi6qmV19jk/sM=;
        b=TBjmDyyCOozfFb+c7R2Gj6sRZJHPFP7yHeyagflZPRGBsPXd1vrDrH2WfC5p/bcgI1
         TK9aSYcGKjZnqLhXVM3f3zlGYt1Oin9OBJUXoSSRwaciIFScDHtayAw2NAfGuv9kOrxV
         LASNXW7xb2h0iD2dVxGyrhE2zqS2b5wGUsUnU8IThKuNg8UWYTzjLz6286PfkNjvkNGo
         QoNXyFYv0Ox2pegArTYXnzqGR1+gNSOF11BwEW9HBfH683T/5YHWcS/IYbPwr8nyE4m0
         NkNaKxFZ7GmCokjIXEsmpfKKx7r6PqU7nAzq4Zc9PAMDUXlzlvf55fEQFzvxyH3J2aYi
         fBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771257268; x=1771862068;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyH/rUNMvNUadAFEpknBN6fqSUoRpgmi6qmV19jk/sM=;
        b=d28oQ0WVWWOjIs1Z3eJsILtn9k73t9Aj8OKQk1/nFTtB4fWgvVB4Cfn3L43VoDroOL
         XaAQt49VUYwYW9CWVf7W3LYxTlp89HFQa+cUGMYu+Hy5Er070f8F9FGZ7X/WSiNHUdNo
         rjoP4acfXCzAB4oHzc+OecPkQC/FhgPyipUYIY/S8zIhkB+3rL+gzkEY8q56zl89Ks5i
         n0ZySOVetkQkSoaaX0JWI3tffWw+/L2vid33Y0nEYNwp85cTJJf5TIDAgM77s5r6TmpR
         NmFBvaw0bEcNJg8rong6SnNyOSlJMuCvHpcC4xnV5gUEMK7p9aLQtyk3zW2sW1t/0M5/
         SWag==
X-Gm-Message-State: AOJu0Yw9RDIP8lNr5bVgdEUWJC9A8mTyN4SRkd/tdpqACHHG+XD02Ien
	Dq4TfV3XA6t3X2FZh4OS+f9hlbgDAInld6BuKAHchgAWbtREYPCA+XQ+582KomCC+P5l8+7Xuz5
	W6Qs=
X-Gm-Gg: AZuq6aIpTn28WaEAkGpZuVQwkgROg3/1eaJlmwS8UfOq9MjPpzRSEkn2YXTqADrZmJl
	jUjAJclo7JMUWfKURcFuVIbr3B1Woe1vGYkiyDzZUHDYJZW7yhANGaWiU9XhdW/f6uKTm9S/CBj
	1yW5aShYHaZtsdd9v/ctfZSg2UI/6eXfwvD/siuCxU99u8u+YZOo8e1Mxb/nv3RnuJlSDgDb+yN
	/TSYvXXxVmxlF4JuTPhIA0Q80ym0zFuwZI6yqigxI0r89P9EJPulS7PvscmwTrHawJsAQNAzkaz
	nxtO+Z6Ch9dSQ5fQCsHD6GDID2q9ekw8VcsHsn2jvhoCtUlnKVlKwglhUeqoMWgFI6L1pUcCh/C
	AJq9vkBBOIx4uWRgPoB5cDYQ1BE8ubgqrW9DydtVQwpbZq7irOhkmVFAhKsyTI2OipHZQJl9EaK
	ublLXsLFhOQMoN0lmFXjTGxI9SQ9Yepd9m3JZMav7CcOJJKnPPZHlGkX2NkQp9KyAvIOCxVP6gP
	cEkdS9xAqzwGNM=
X-Received: by 2002:a05:6000:40cd:b0:437:75c1:5777 with SMTP id ffacd0b85a97d-437978d197emr17113673f8f.16.1771257268336;
        Mon, 16 Feb 2026 07:54:28 -0800 (PST)
Message-ID: <c0aef909-b294-40af-8d24-033b28450338@suse.com>
Date: Mon, 16 Feb 2026 16:54:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] domain: skip more stuff for idle's vCPU-s in vcpu_create()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
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
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3FCDE145D27
X-Rspamd-Action: no action

Nothing hypercall-related needs setting up there. Nor do we need to
check whether the idle domain is shutting down - it never will.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Drop vmtrace_alloc_buffer() part.

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -475,12 +475,6 @@ struct vcpu *vcpu_create(struct domain *
     v->vcpu_id = vcpu_id;
     v->dirty_cpu = VCPU_CPU_CLEAN;
 
-    rwlock_init(&v->virq_lock);
-
-    tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
-
-    grant_table_init_vcpu(v);
-
     if ( is_idle_domain(d) )
     {
         v->runstate.state = RUNSTATE_running;
@@ -488,6 +482,12 @@ struct vcpu *vcpu_create(struct domain *
     }
     else
     {
+        rwlock_init(&v->virq_lock);
+
+        tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
+
+        grant_table_init_vcpu(v);
+
         v->runstate.state = RUNSTATE_offline;
         v->runstate.state_entry_time = NOW();
         set_bit(_VPF_down, &v->pause_flags);
@@ -516,7 +516,8 @@ struct vcpu *vcpu_create(struct domain *
     }
 
     /* Must be called after making new vcpu visible to for_each_vcpu(). */
-    vcpu_check_shutdown(v);
+    if ( !is_idle_domain(d) )
+        vcpu_check_shutdown(v);
 
     return v;
 

