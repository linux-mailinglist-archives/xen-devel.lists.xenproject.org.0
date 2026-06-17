Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t382J0BoMmowzgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:26:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A02C697E3A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:26:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=DYrh9t6X;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339914.1600954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmXE-0004xA-Iu; Wed, 17 Jun 2026 09:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339914.1600954; Wed, 17 Jun 2026 09:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmXE-0004ue-G1; Wed, 17 Jun 2026 09:26:12 +0000
Received: by outflank-mailman (input) for mailman id 1339914;
 Wed, 17 Jun 2026 09:26:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZmXC-0004uV-KI
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:26:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZmXC-008MKV-0x
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:26:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a326829-2eae-0a2a0a5409dd-0a2a450c8996-36
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:26:09 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a326831-62f1-0a2a450c0019-d155dd2ec0ae-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:26:09 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45eea68dd6fso2986788f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 02:26:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26392esm51791832f8f.3.2026.06.17.02.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 02:26:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1781688369; x=1782293169; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W7ffuk5mo5kC1dorjho/tlbgKEVDTzPAjrxyPKRjl9g=;
        b=DYrh9t6X4PGiakpu4GttCqK4TXJL26jgXSgaAoWG9gcQoUVbfUmC2wROdddFF3koVN
         Bzx7y5fz7u/fchlWBJn8xLdE8k+CqKIwGXKgLDWhPjmx/WZpppAIzyypJDw5OdNFZjKi
         bKyU+2zcnsZQ12TqybfFnS9EhjZ3BbCpkYh9k5RCj6BIuykq/IDFYoPsAvKPYwLzLj/c
         bKrUKqyeUA3f/AWmLqpSD74fJ1CWlBrUl3Il2bv5jhKMoz/tjzA/amlygZYHYk6hQs6z
         l22oWryuSN5eGh1oki8r2zth3KW+z4XGMAeh7Wbp5/r9uSEUX1DaPht4yCcYLevxXjDM
         w97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688369; x=1782293169;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7ffuk5mo5kC1dorjho/tlbgKEVDTzPAjrxyPKRjl9g=;
        b=ikq9AIDyoP4IX0b7FMRFzPGU6IBsehCbmlPdR0t5LaNss55RhlJUuSmtuKal3JruN4
         EwabJyWslBXuWNn4yLNfZ9VhDCHEZZUPGe8dTFYeV+k+0LsCca7opqteyXhH9yc74N65
         OsOoDoPgcbAEOMT9Pbub7ZhAGY8ACMYoRIjwBZHKBaaXffo/ylanJ29yMwFaHvxx2q8a
         kauTCVBTvaee1GYlG4mpc4/MdNMQlw9TwrxeMg/MWDPMC8P2npLmIU6T5J50edxnqwMB
         WHdjwHw+ML/71vsRpfQh0mCpj4bX3g+3EpydWrZrFFoQRrVxWQjPQXnXb2IB78NRlY1S
         x+Sg==
X-Gm-Message-State: AOJu0YwZbF6rtm0pPpK++pmeSOResLL/CeWlg0/lDtkJnbronSYsrFXc
	pbkK0mW+J7TLN9DprRkj+mwnfEefwQO9k+xMJZuTg5D+ytOdnkpOkY4I3UpfJ+/TJjFXZp3mP4v
	QA5s=
X-Gm-Gg: AfdE7cnpyV2yx14zKsTdY6ZJfhRhbd3eLY+cR4pxDuSDfsP9nYV1JztDjDj0fbdUZH3
	aVOKW43EShJ57kodm+lMjau2Riw0Td4VPKnRwKsPyZPHgVtDhXzkZmV07QHLsgaQ+doIxWzoh1P
	EhjcfJjK+N2R6GqHW/FOsmfe7TngFCCbcceUxWilZyMkr7VJ4AN4erMep7pZd2lm6P/jEZBfv/x
	4dy6MwF+SWVIjNm+Y9OFcMYLiorJg7LgWbv8UFGoAZNSwGLK+GvMoPi8KFRIv6stlOidV+GImLO
	EKqdH0rw1OKuBVfPMU6IdI+xY96U0b6SEKbnsqPn1guDZ0DrDb8jijWGkwKitnRmncHk/Lhb/wh
	yIgKdzW4uUs7RBoifZkHLccGejqq+GLthEksrd5LRN6Aky/IsAAgTOiSG+CQOjmGBiCxMvNq9Az
	9z1a4QKpzpov/hrgAj1NhQZF1s1cDZ9nlfMteOb9halwt5IMdRw+SrCLksRp4K2ePmzg0QaWusd
	6gl
X-Received: by 2002:adf:ea10:0:b0:460:e0f:8d19 with SMTP id ffacd0b85a97d-4623f2e7ecbmr3775007f8f.9.1781688369325;
        Wed, 17 Jun 2026 02:26:09 -0700 (PDT)
Message-ID: <a35b4b37-edc4-4173-b30c-6ff0fcb44df0@suse.com>
Date: Wed, 17 Jun 2026 11:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.22? 1/7] sched: introduce specialization of "running
 only" vcpu_runstate_get()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
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
In-Reply-To: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781688369-E2B74CF5-56D77134/0/0
X-purgate-type: clean
X-purgate-size: 3762
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com,suse.com,xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A02C697E3A

About half the callers of vcpu_runstate_get() are solely after the
"running" time of a vCPU. Introduce a specialization with a smaller
read critical section and thus reduced risk of a need for retries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
The function name was chosen such that grep-ing for "vcpu_runstate_get"
would still turn up all uses. If that was deemed largely irrelevant, a
better name might be e.g. vcpu_get_running_time().

--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -56,7 +56,6 @@ void getdomaininfo(struct domain *d, str
     struct vcpu *v;
     u64 cpu_time = 0;
     int flags = XEN_DOMINF_blocked;
-    struct vcpu_runstate_info runstate;
 
     memset(info, 0, sizeof(*info));
 
@@ -69,8 +68,7 @@ void getdomaininfo(struct domain *d, str
      */
     for_each_vcpu ( d, v )
     {
-        vcpu_runstate_get(v, &runstate);
-        cpu_time += runstate.time[RUNSTATE_running];
+        cpu_time += vcpu_runstate_get_running(v);
         info->max_vcpu_id = v->vcpu_id;
         if ( !(v->pause_flags & VPF_down) )
         {
@@ -796,8 +794,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
 
     case XEN_DOMCTL_getvcpuinfo:
     {
-        struct vcpu   *v;
-        struct vcpu_runstate_info runstate;
+        const struct vcpu *v;
 
         ret = -EINVAL;
         if ( op->u.getvcpuinfo.vcpu >= d->max_vcpus )
@@ -807,12 +804,10 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         if ( (v = d->vcpu[op->u.getvcpuinfo.vcpu]) == NULL )
             break;
 
-        vcpu_runstate_get(v, &runstate);
-
         op->u.getvcpuinfo.online   = !(v->pause_flags & VPF_down);
         op->u.getvcpuinfo.blocked  = !!(v->pause_flags & VPF_blocked);
         op->u.getvcpuinfo.running  = v->is_running;
-        op->u.getvcpuinfo.cpu_time = runstate.time[RUNSTATE_running];
+        op->u.getvcpuinfo.cpu_time = vcpu_runstate_get_running(v);
         op->u.getvcpuinfo.cpu      = v->processor;
         ret = 0;
         copyback = 1;
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -325,15 +325,35 @@ void vcpu_runstate_get(const struct vcpu
     }
 }
 
-uint64_t get_cpu_idle_time(unsigned int cpu)
+uint64_t vcpu_runstate_get_running(const struct vcpu *v)
 {
-    struct vcpu_runstate_info state = { 0 };
-    const struct vcpu *v = idle_vcpu[cpu];
+    struct seqcount seq = SEQCNT_ZERO();
+    const struct seqcount *s = v == current ? &seq : &v->runstate_seq;
+    unsigned int count;
+    uint64_t running;
+    s_time_t delta;
+
+    do {
+        count = read_seqcount_begin(s);
+
+        running = v->runstate.time[RUNSTATE_running];
+        delta = v->runstate.state == RUNSTATE_running
+                ? NOW() - v->runstate.state_entry_time
+                : 0;
+    } while ( read_seqcount_retry(s, count) );
+
+    if ( delta > 0 )
+        running += delta;
 
+    return running;
+}
+
+uint64_t get_cpu_idle_time(unsigned int cpu)
+{
     if ( cpu_online(cpu) && get_sched_res(cpu) )
-        vcpu_runstate_get(v, &state);
+        return vcpu_runstate_get_running(idle_vcpu[cpu]);
 
-    return state.time[RUNSTATE_running];
+    return 0;
 }
 
 /*
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1121,6 +1121,7 @@ int vcpu_affinity_domctl(struct domain *
 
 void vcpu_runstate_get(const struct vcpu *v,
                        struct vcpu_runstate_info *runstate);
+uint64_t vcpu_runstate_get_running(const struct vcpu *v);
 uint64_t get_cpu_idle_time(unsigned int cpu);
 void sched_guest_idle(void (*idle) (void), unsigned int cpu);
 void scheduler_enable(void);


