Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p34AGEoIMGqVMAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:12:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8E9686FA0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:12:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=COswnfE1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338259.1599266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ82y-0000b8-BO; Mon, 15 Jun 2026 14:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338259.1599266; Mon, 15 Jun 2026 14:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ82y-0000Yn-8J; Mon, 15 Jun 2026 14:12:16 +0000
Received: by outflank-mailman (input) for mailman id 1338259;
 Mon, 15 Jun 2026 14:12:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ82w-0000Ya-8m
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:12:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ82v-002zjv-Lq
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:12:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30083a-2eae-0a2a0a5409dd-0a2a4503e68e-4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:12:13 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30083d-672d-0a2a45030019-d1558029b478-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:12:13 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso41578735e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:12:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea4b2e8esm216642525e9.0.2026.06.15.07.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:12:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1781532733; x=1782137533; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C0VpXX4v4yr6XMrCiBGbEm94k+mIh1Al+9FcfNgLo2I=;
        b=COswnfE1icG6Gm+mmOEzTvzo8KOcNH+Epia2foZvX27F/hCoYfS0gXWn56NSOTXnZ5
         /0EpcGbI2p4ByZILjxtSAguZchpmRgHWkKmtm1HxcCkNxDM/ber5nIPwir4QRU7tSmYJ
         jLU3+6rg8TPor3kybcyjG9F9hNMIjkz0L4i8BapKkebP8QNgPla5Ih3w9ItW/gcVP13f
         s86TAs7uOjBzl6nwKIxeIH3k16YuZmgG8j5cA0o9EioYacDJbIfpNOHa2t5ZsMH3T4Gh
         RhlnpysdBI+xh8RaA0O9wkOU/SIo6JKFbtfL/CWPY4pJF90M/Mhdp9YfbdxU/1hV/E4z
         VIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532733; x=1782137533;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0VpXX4v4yr6XMrCiBGbEm94k+mIh1Al+9FcfNgLo2I=;
        b=PkJhmiigFfHdqduezmDi+AsIgKqOdwXzG4tCg/BK+yQMjG0jm5Dn0I3xgzqCIpIsyl
         nRFV7KptxA4tZN76y6XKNlDbKuV39jZqMrrtCPrsOrgZgTdnaaxTAC6IPo9KSkLU/J7q
         g8SUG/eC7miJDZu9cB2J34DUJwxNbrumu+U5Dpc2Dis33AbyECjD3EsZYnl3x96HeaEz
         51OR/0sWkkeBTGZLjumimvo5v2u7shur/Tl15UHLjaEhEe/NMx3qO/Ojj3A6u/Rc6sQj
         nF8j/lEuBbAdWLEykfANxNCD/3BWGqGXLkc3KxUO8KWGKoEMpxU0mMkeITR9O3rhc8O2
         AyhA==
X-Gm-Message-State: AOJu0Yyv1fZczBc/bUMgmvDb39MjtLMGeXPWvNSJ3aUKTO1H3xnUupm4
	DEe1qPNLHXq8o84DFZsSz2RCgBl8fo4XicSY4T4pKYioCK7tYiV6QoCIwf/zm7cBDPrJ1NVrHhw
	EuCM=
X-Gm-Gg: Acq92OGJ2BeF0NER0xBYZB03ppVbsVL1lDBF6TCPKlmd7JqWN0yWQ1dvqoJmvoogiID
	pDMBqEKjZLSbwTDpWvJMt3wuOv6IBt3XGMPRpGTjYrueDndIaMzrLPzUPrfYW2IaULTFq0CoJF0
	TZG2XF+bmMoTnMydJR9DYNKurD7ZDGR91S12Y4hJhpXs6nhEGAK7UgbIYc+MAVGWTo1LTsORQnr
	ZQa8/LNWASgUPqx4IF32CXYxFL4Jgf7TqbIVIkI9WRSj9axE8eW8wEaPuN1UoivQUd1Wqh0jCsK
	wY2DjnL06hOnvn6/N3omjWvyouBhHm6SFWf/wX17kat/MlRTA8NQc2mPLXS2+3hXljvfAwzCgxE
	UaV/5XOhfgUP6HWz1bvY7EKx8T0WHB3yXCs30EO91XOX655hYKDxzbh5HHQ1u5dZ+O+Mjsef0aa
	yvNPdHHuj7992abLqzvLxenkF8E6tP3H0W0QAeMXu3P+iCpz5cdr/yDZle87ErH44ZZAjcyOU1b
	cfBcjDSF0QZErI6rzmdIX1boA==
X-Received: by 2002:a05:600d:8494:10b0:490:c7dd:de3e with SMTP id 5b1f17b1804b1-490ec521187mr134538065e9.31.1781532732839;
        Mon, 15 Jun 2026 07:12:12 -0700 (PDT)
Message-ID: <67d1e638-a2ab-4d03-b9be-915a8c42e095@suse.com>
Date: Mon, 15 Jun 2026 16:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22? 1/9] sched: introduce specialization of "running
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
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
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
In-Reply-To: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1781532733-36B44938-ED8400ED/0/0
X-purgate-type: clean
X-purgate-size: 3665
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
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
X-Rspamd-Queue-Id: BB8E9686FA0

About half the callers of vcpu_runstate_get() are solely after the
"running" time of a vCPU. Introduce a specialization with a smaller
read critical section and thus reduced risk of a need for retries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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
@@ -829,8 +827,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
 
     case XEN_DOMCTL_getvcpuinfo:
     {
-        struct vcpu   *v;
-        struct vcpu_runstate_info runstate;
+        const struct vcpu *v;
 
         ret = -EINVAL;
         if ( op->u.getvcpuinfo.vcpu >= d->max_vcpus )
@@ -840,12 +837,10 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
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


