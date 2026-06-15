Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mKmLEIDpL2q2IwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 14:01:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF6B685EDE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 14:01:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=PTSqSBWp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338183.1599191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ5zg-0006XU-4I; Mon, 15 Jun 2026 12:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338183.1599191; Mon, 15 Jun 2026 12:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ5zg-0006VH-0t; Mon, 15 Jun 2026 12:00:44 +0000
Received: by outflank-mailman (input) for mailman id 1338183;
 Mon, 15 Jun 2026 12:00:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ5ze-0006TW-CY
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 12:00:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ5zd-000RFh-A8
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:00:41 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fe95b-5cb7-0a2a0a5109dd-0a2a4503d416-36
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 14:00:41 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fe968-672d-0a2a45030019-d1558029b107-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 14:00:41 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso29071505e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 05:00:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492203d05d1sm338907405e9.12.2026.06.15.05.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 05:00:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1781524840; x=1782129640; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eazOSZbXY1it+mlud/La/UkvM4wEAF2FLpdZ7kq+Tpg=;
        b=PTSqSBWpo1i00CGf47OPUni49slchSw0hbnBvVGeJsYTQsGlCA/CBB2337ns3obbr1
         f7JQZ7sSGfbyBH4D1obeq01tbl9XgWCxNk+5UDPM7/RADbRsWhANyIb0rHBweUkN3XaI
         XDwXzLzUuoLD/OaAkcJejqoQwDVLgyIVoCXgZn0HekDDO45qv8X88OL2hwnfTAhCeja/
         3+6T0+Q5EzKXs0aitZ8SizVELIHJIHJ9y3jQHFTXOBzr5mvleGjYDfvg8PPMzdeuGGaK
         Q1SBKifi60XqVvbVyM2fP1Lw2RqgZKdQycI+i0K9JT3RCCEBofkq6Z11YT3Gc40yZ9T3
         hWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524840; x=1782129640;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eazOSZbXY1it+mlud/La/UkvM4wEAF2FLpdZ7kq+Tpg=;
        b=XAqdm64LzuQ8H1MK/EVWyDsg7eOuyz43nxgWKx5VxPJcD5CSWrUUOwijyVyT+S1jUm
         YQ6nv+3BlEYjq/XnRRfaUiZabd7jqeqO8rFDgOynLwjm1O9oXpGGnjocRSWMI27dzU4f
         yMxIW2IU9QC24BUtWJ+rA9WqZWRJzQuGuw8dXofzjlY95O2F8+NlAQrtjyDvRYzQVtWj
         ntRIEpx3zyBHSU1QC+hDYE/+GhXFs6zciPJVOh+rG+7PHxeMJIYjoxwvNXAqobrgfDCm
         U+hNIczKHuBsfDHbwkaWNFEvZybRJAWl90gzJ/ZRz4jnoVIun/N4mraxE6WXIrt6vIDj
         9qPg==
X-Gm-Message-State: AOJu0Ywamkaw1/3yRblykjyrV5IGeqcGEQBS6kyZiNCx9EWmYgSMxwOQ
	1pguibL8/GOP1YGdfgc3izVg6K35vfMlJu8qsxrcerZVyVJ1tbnvkY/KxRXLCMNQ369GeeaDjFy
	mRrk=
X-Gm-Gg: Acq92OEOykCQXdYCadvzL8M5UjEhS+qg2xdNQ6BQFG6akkuDvUXC4D7DJCeaQ4Aqn9H
	4+Hz/BAzgx5st6Phktzj9SX0c0eA1Fn8Jyb5DomrnleMGqBr/FqZSPzLnW4OBLhSo3FJpGzp4hc
	RLhXyh7b7d+3l4QcC7E3FoBB8yanybRHsHd/WOAdUdK8z4D4lwVmHMaTrBllXLt2lKLegD/DGJx
	eTzE2gIdQFibIzs53i313LOdMz007ZwOmaUclmj3ITJ1pMBOoHbZutEcHXJUoMUtKljxEixKC4W
	ISXwSUBqeT+DW0buYUeEBmZb1tzuvKJrZfveO4cZmDHk/HYH6cJLjME47+fy3moM22ZOIiLBYIL
	pG7P6kbzgg6Z0JOhOW1z9ZEyUU2Q4cGJC1nOtFJa3FphKfUfDcbMBKeDHrTPyYWIwgN839eMlBG
	WIS8sSfOvju/cjXinxaDCX3GpDzhiHUu1uEWUahpBnjIVEQC7ivL38DNw3FfwbhViniwE4o1PIP
	eRYe2waOILFqID97AN4jDlnrA==
X-Received: by 2002:a05:600c:ad9:b0:490:b58b:a4a5 with SMTP id 5b1f17b1804b1-490ec50f800mr126507985e9.31.1781524840378;
        Mon, 15 Jun 2026 05:00:40 -0700 (PDT)
Message-ID: <8b7daaa3-418e-4ec7-90a6-775e0a964b76@suse.com>
Date: Mon, 15 Jun 2026 14:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.22?] domctl: correct return value of
 XEN_DOMCTL_[gs]etvcpuaffinity
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
X-purgate-ID: tlsNG-33051d/1781524841-41794938-2858D23A/0/0
X-purgate-type: clean
X-purgate-size: 2516
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[suse.com,xenproject.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBF6B685EDE

cpumask_to_xenctl_bitmap() may return errors. Clearing the error indicator
of an earlier such call by a (successful) later call is misleading the
caller. For "set", keep setting soft affinity if the hard affinity copy-
back fails; only accumulate respective errors.

While fiddling with return values, also drop a redundant clearing of
"ret". This eliminates a Misra C:2012 rule 2.2 ("There shall be no dead
code") violation.

Fixes: 6e4ecc6d5884 ("sched: DOMCTL_*vcpuaffinity works with hard and soft affinity")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1705,6 +1705,7 @@ int vcpu_affinity_domctl(struct domain *
     {
         cpumask_var_t new_affinity, old_affinity;
         cpumask_t *online = cpupool_domain_master_cpumask(v->domain);
+        int hret = 0;
 
         /*
          * We want to be able to restore hard affinity if we are trying
@@ -1726,8 +1727,6 @@ int vcpu_affinity_domctl(struct domain *
         if ( vcpuaff->flags & XEN_VCPUAFFINITY_FORCE )
             vcpu_temporary_affinity(v, NR_CPUS, VCPU_AFFINITY_OVERRIDE);
 
-        ret = 0;
-
         /*
          * We both set a new affinity and report back to the caller what
          * the scheduler will be effectively using.
@@ -1746,7 +1745,7 @@ int vcpu_affinity_domctl(struct domain *
              * cpupool's online mask and the new hard affinity.
              */
             cpumask_and(new_affinity, online, unit->cpu_hard_affinity);
-            ret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_hard, new_affinity);
+            hret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_hard, new_affinity);
         }
         if ( vcpuaff->flags & XEN_VCPUAFFINITY_SOFT )
         {
@@ -1777,6 +1776,8 @@ int vcpu_affinity_domctl(struct domain *
             ret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_soft, new_affinity);
         }
 
+        ret = hret ?: ret;
+
  setvcpuaffinity_out:
         free_cpumask_var(new_affinity);
         free_cpumask_var(old_affinity);
@@ -1788,7 +1789,7 @@ int vcpu_affinity_domctl(struct domain *
                                            unit->cpu_hard_affinity);
         if ( vcpuaff->flags & XEN_VCPUAFFINITY_SOFT )
             ret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_soft,
-                                           unit->cpu_soft_affinity);
+                                           unit->cpu_soft_affinity) ?: ret;
     }
 
     return ret;

