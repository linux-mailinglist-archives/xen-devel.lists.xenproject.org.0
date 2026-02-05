Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FipEUOAhGl/3AMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 12:34:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D1F1ECE
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 12:34:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221771.1529923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnxcR-000401-Df; Thu, 05 Feb 2026 11:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221771.1529923; Thu, 05 Feb 2026 11:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnxcR-0003yE-9B; Thu, 05 Feb 2026 11:33:55 +0000
Received: by outflank-mailman (input) for mailman id 1221771;
 Thu, 05 Feb 2026 11:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnxcP-0003et-Kl
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 11:33:53 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c466b48-0286-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 12:33:52 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-480706554beso8619235e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 03:33:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d2ba61sm74312435e9.1.2026.02.05.03.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 03:33:51 -0800 (PST)
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
X-Inumbo-ID: 8c466b48-0286-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770291232; x=1770896032; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUudX/ZSRZyRicmWNQ2Ykgm4S9b/k77SGeQfQ0h7DXw=;
        b=CyyHJWjcWYsixZUndfJUFmY+qqVtOyy4iqJ+mMmLJF12O0HRJjkVuJWYXz8Z4w5JTg
         fahsNOLsiPjSZt/rZNvPhuSmhy9u17QYeSV9GEiIO7y29LBUCpHAINUbQRMZ/eRiott3
         QJ9sg2BjF8xdcQc9OpOqERya9f9yUrVStz+CImzmRwKUalSipnrG9eVxuLbqgw0TDKfj
         g7Dn9V18ZaCRMFlggITt/9h4abdJW/KPziUi8oErJLcyccLPkfE6sQvd5JOYB84DUc8A
         cE4bez0je1S63uDFWcFQNwHg8/SKbUR2/J8GVuN+QbLmlh6USZNAUopPAfE8UvjI6MKL
         s4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770291232; x=1770896032;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUudX/ZSRZyRicmWNQ2Ykgm4S9b/k77SGeQfQ0h7DXw=;
        b=AIDdulrtjdE1G+KJHGrpsH4Aq0U3vAM26+cFaSitY0i7qqCJvMkSYAXcmuVotj/yOR
         oiuRr+3rxce86Foo+kIOJN+R9PLFu6QTOsH4TBdf8kCDSElavxvfc42ZG6taMt1YrqUl
         NwyruoE34TjEOzTfMfHj7kaIxzMep8w07SepnJKrS7d5RHC9N/Ka1PZV3xtpUX+b0IOV
         CjplTzdmEu1Yk1tSO7dDiB5YPT89Aiov0P497IGR1nOxtoJcAtd8DcihZ7OqOM/matSY
         P2FhgTXqiUz6Lsfoj47mdcqiSKlzMToUUBTJuWACbdGiM1VeQzFxhyagRpcJ2/NCHgFf
         EsjQ==
X-Gm-Message-State: AOJu0Yze5HZIb4nWLEL6mgaxXf4BEkjJDjdncku5zUdOUFbhMSSjyCnf
	6oE/h01EwoBHZlz+/95zs3BmLEXKSDpU9yqXU1+gbW0kOhXbINwdWsmbDpuTtJCDrfSeSaZHr2w
	1SIg=
X-Gm-Gg: AZuq6aKSEjmEtVOPn1urlXBIGK84+XWVlDqdytdU8327oSRff++KQq/8By31rlsPUGL
	hzmu1CwTOXfgf5/PI0BvlldgbQKPEw//qUBmNR0YwmpsaHkBiWGDi+zHgvubl8KBxzULFuVLwM6
	hRfCTLuhNaUzqsrc3QXWW3WVglE4oH4a8QkI63Sbf2Eqb1deKX4iW/SgpeaflzwyDM7co80HonH
	YK7BcTYzIaR/v1nfELXtXiZoZNYD+OEdDJdZuk4T+KmBcuyUEu7HhwGRJ5MomIcX6kWlq7zQl/C
	evDtmsqs+110Q8CnMeVJ7msaZmYY1jlQXwLjcfybD+wU7b3vL2a/cmIlCC23QFDOE/Zneg3UnaM
	d5kCUQapt4nbgyC9SQCgux0p6GRvN/nPddY75fQ6TEblR9lpQegZ2+q/OIv6r6NoL4CGHZpFz0T
	hBQ2T9wPX5s3HhcqNAKqA0CJB//792MqRCZs8+BPnocfQrNO+Otmsgr8ZezHFAzW46AbRk+015e
	y8=
X-Received: by 2002:a05:600c:a03:b0:47e:e78a:c832 with SMTP id 5b1f17b1804b1-4830e99173amr74057675e9.37.1770291232220;
        Thu, 05 Feb 2026 03:33:52 -0800 (PST)
Message-ID: <1e2df446-b116-4861-a396-b87895a96c67@suse.com>
Date: Thu, 5 Feb 2026 12:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] sched: move vCPU exec state barriers
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:jgross@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 855D1F1ECE
X-Rspamd-Action: no action

The barrier in vcpu_context_saved() is specifically about the clearing of
->is_running. It isn't needed when we don't clear the flag.

Furthermore, one side of the barrier being in common code, the other would
better be, too. This way, all architectures are covered (beyond any
specific needs they may have).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -333,17 +333,7 @@ void sync_local_execstate(void)
 
 void sync_vcpu_execstate(struct vcpu *v)
 {
-    /*
-     * We don't support lazy switching.
-     *
-     * However the context may have been saved from a remote pCPU so we
-     * need a barrier to ensure it is observed before continuing.
-     *
-     * Per vcpu_context_saved(), the context can be observed when
-     * v->is_running is false (the caller should check it before calling
-     * this function).
-     */
-    smp_rmb();
+    /* Nothing to do -- no lazy switching */
 }
 
 #define NEXT_ARG(fmt, args)                                                 \
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -956,6 +956,9 @@ void vcpu_sleep_sync(struct vcpu *v)
     while ( !vcpu_runnable(v) && v->is_running )
         cpu_relax();
 
+    /* Sync state /after/ observing the running flag clear. */
+    smp_rmb();
+
     sync_vcpu_execstate(v);
 }
 
@@ -2308,11 +2311,13 @@ static struct sched_unit *do_schedule(st
 
 static void vcpu_context_saved(struct vcpu *vprev, struct vcpu *vnext)
 {
-    /* Clear running flag /after/ writing context to memory. */
-    smp_wmb();
-
     if ( vprev != vnext )
+    {
+        /* Clear running flag /after/ writing context to memory. */
+        smp_wmb();
+
         vprev->is_running = false;
+    }
 }
 
 static void unit_context_saved(struct sched_resource *sr)

