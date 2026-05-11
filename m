Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G8JBwzUAWryjwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:05:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9C50E894
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306158.1578229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQJk-0003e2-0L; Mon, 11 May 2026 13:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306158.1578229; Mon, 11 May 2026 13:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQJj-0003bZ-TO; Mon, 11 May 2026 13:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1306158;
 Mon, 11 May 2026 13:05:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMQJi-0003bJ-4o
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:05:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMQJh-00DB1g-HZ
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 15:05:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01d3fb-2eae-0a2a0a5409dd-0a2a450ba71a-6
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:05:01 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01d3fd-212f-0a2a450b0019-d1558030bd12-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:05:01 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488b0046078so35992875e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 06:05:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e6fffb9bdsm172144195e9.1.2026.05.11.06.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 06:05:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778504701; x=1779109501; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ExMfZGjK/TN3VobC9Bl8Sp492l2t0I9xSSZ7GtLdHpc=;
        b=eTkry5uy02QFGIkf5varVjuOzbugZIg3rsflNTp/q2uhfD7m14V6EtVxsXCBkD0EQy
         OEBpj6Itc7GoNtSO1JbUz++cOwiD4b+HsaEUGTn2JwBqgwS4gI5AFg+D/meC3qz5y/0B
         ldqa4KfmiMuUz/57EX62DbJiUQIr36yL7N9doMD/L4hB22SGf1xDuuIyp7uz0FAbeaaX
         lLGpMBy2Ah9EnB76ydJPTMPTdgbPY9JuP8O0LvIhLwYZuD8IvSuWqRSP29gVdQpewUbn
         wFRgwjXxXdSr5Rw5bVlLQJYxUe8g2Du9DX9QddOFCs+rh93RxiTt9OAsuMKNEDyiaost
         +CWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504701; x=1779109501;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExMfZGjK/TN3VobC9Bl8Sp492l2t0I9xSSZ7GtLdHpc=;
        b=LhsbG38s5Y22zEnj2e3geAW9/GiWugpQOffqBtWvNhmnAqsbf8qeMIdf5K+yeW0H49
         Ki+sq1vO6tY2s7klFD7nfTqmjWqKGqs5TJkcXblac5NoHxhE+qO4FQxRq6piRXpt3o8l
         HTF1iwwXAYvG+vBvODBpBeJ1l4JaPM+EJ+J6jRAEIisdtMOIvS+Qd9hqLRKrbAkjRW3S
         EwzPnuu/gb8PyFeCUPs095c04lyYA9SbMr3m0ocG1IPurg/p9/FSYKug4jXdl3VSu+Xz
         wvQMwkITUyae1pCkmyqY4IOffTcSRLJFXnHta0hTVkElUWSgeaNLnmvBwCu9SsZMsTbR
         UeqQ==
X-Gm-Message-State: AOJu0YxbVB14TseJue0T20sBfq1aG7atTO2w+xMYs+Hn4SwLA+n/asuQ
	7p2u8yS3KBaX+jdiLjWpPID32BUxGWSJS90NTGIjK1tgcwLlGmG6d9fohaopoXSDUNQ3d3oJoGt
	r93c=
X-Gm-Gg: Acq92OFPF+bx3jnjJHXg8KbQXtCk+jqEEjd9fdiGTi4ddpW/sXs7KFFL+gVjDzX8kGy
	4mlkEREXFU7aV5npcxv8YCykxXA6DIdlmwfJKm6rOhJgNWTIDoEIuokWEvG9ZojheIsCdRAW6ds
	qHvLR3z8WEWYcdliWTyI20kySk8Zcw+RgLzSsFGMD4BqBT90BZTrlBk3Z/IDm0JAsZKqIuyY3hs
	ZdqBQWLZdHdptrmptRToC1w1LnyyYHljwhUfqDiDbPjL2UPJenqkg4aR7K3ewhrZ3AL3+BoESON
	0MR/TwVTNrTlh9l+KJeAEy55EpFfVaFm/AO6zzA+p26dv2BFNY352mjUot1rIhHCnR19lqFg0VE
	xRh0IOkrksVFUzOuyZQTfH8Y5qCApMC/BQBhPf6tBCMboEYZtwh4GDXC9CrqmedAXv+c5gI2ovQ
	PA09JKbZIlwVsXPyucZIHCeUPI1/JFnIv65jN0JDgSAd/F7w2VGKVIpSZQlUis7wqB/guOgjzcx
	DjUrHJ/paQFf8A=
X-Received: by 2002:a05:600c:8b65:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-48e706c7e20mr159001025e9.22.1778504700900;
        Mon, 11 May 2026 06:05:00 -0700 (PDT)
Message-ID: <6e0266e6-8dda-4a87-886d-79da637c2172@suse.com>
Date: Mon, 11 May 2026 15:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] CI: collect certain intermediate files as artifacts
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <ced1547a-f1cd-42c8-a050-51430adc829b@suse.com>
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
In-Reply-To: <ced1547a-f1cd-42c8-a050-51430adc829b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1778504701-22589F3B-C2F86D50/0/0
X-purgate-type: clean
X-purgate-size: 2753
X-Rspamd-Queue-Id: 81C9C50E894
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,gitlab.com:url];
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
X-Rspamd-Action: no action

When one of the linking passes fails, additional intermediate files are
still in place. Having them available for analysis of the underlying
problem can be pretty helpful. Collect some into a new intermediates/
directory. (Nothing new will be collected if linking succeeds.)

As the script is run with -e passed to bash, defer exit if the main
"make" (or substituent script thereof) failed. This way more artifacts
are collected, potentially making it easier to analyze the failure.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2515787945
(with PPC forced to invoke the new logic, hence respective failures there)
---
v2: Different approach.

--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -6,6 +6,7 @@
   artifacts:
     paths:
       - binaries/
+      - intermediates/
       - xen-config
       - xen-cppcheck.txt
       - '*.log'
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -37,22 +37,24 @@ else
     make -j$(nproc) -C xen olddefconfig
 fi
 
-# Save the config file before building because build failure causes the script
-# to exit early -- bash is invoked with -e.
+# Save the config file before building, just in case.
 cp xen/.config xen-config
 
-# Directory for the artefacts to be dumped into
-mkdir -p binaries
+# Directories for artefacts to be dumped into
+mkdir -p binaries intermediates
+
+# Script exit status, to be overridden by the main make's status below.
+ret=0
 
 if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     # Cppcheck analysis invokes Xen-only build
-    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j$(nproc)
+    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j$(nproc) || ret=$?
 
     # Preserve artefacts
     cp xen/cppcheck-report/xen-cppcheck.txt xen-cppcheck.txt
 elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     # Xen-only build
-    make -j$(nproc) xen
+    make -j$(nproc) xen || ret=$?
 else
     # Full build.  Figure out our ./configure options
     cfgargs=("--prefix=/usr")
@@ -90,7 +92,7 @@ else
     fi
 
     ./configure "${cfgargs[@]}"
-    make -j$(nproc) dist
+    make -j$(nproc) dist || ret=$?
 
     # Preserve artefacts
     (cd dist/install; find | cpio -R 0:0 -o -H newc | gzip) > binaries/xen-tools.cpio.gz
@@ -106,3 +108,12 @@ for f in xen/xen xen/xen-syms xen/xen.ef
         cp $f binaries/
     fi
 done
+
+# Preserve Xen intermediate files.  Some may be there only upon build failure.
+for f in xen/.xen-syms.* xen/.xen.efi.*; do
+    if [[ -f $f ]]; then
+        cp $f intermediates/
+    fi
+done
+
+exit $ret


