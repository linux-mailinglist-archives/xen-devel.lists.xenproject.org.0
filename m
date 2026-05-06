Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOmgFZUu+2k4XQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 14:05:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B176E4D9F74
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 14:05:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301663.1575898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKb0A-0004qS-9g; Wed, 06 May 2026 12:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301663.1575898; Wed, 06 May 2026 12:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKb0A-0004oK-6b; Wed, 06 May 2026 12:05:18 +0000
Received: by outflank-mailman (input) for mailman id 1301663;
 Wed, 06 May 2026 12:05:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKb09-0004oD-3V
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 12:05:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKb08-00DLT7-Cp
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 14:05:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb2e73-bab6-0a2a0a5309dd-0a2a4505ad8a-30
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 14:05:16 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb2e7c-aaa8-0a2a45050019-d1558035d8ca-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 14:05:16 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso54011925e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 05:05:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45054b03d4csm12720434f8f.22.2026.05.06.05.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 05:05:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778069116; x=1778673916; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1i9Yyd7MB/CNIprVe1jSbeBhmSU2d6sb8wLHaMeUgc=;
        b=EUsUo7K4GXSg6wy9vr4IzWMa7cnoKh4jKDV/FaoiAEgAHlbw0FkYVUchO8UqQtvUe7
         fCMDIYXAQKZqZGYlMnEWdESs4kFOD0/1fwYl9JBzBWOruk+e2p042HwuTms4mbnIdADR
         DlmC13dJRHqHlQqcUk36IgtcHuQLExRAl0v10AfX67aiFo1zzY/Ytb7wRU5390E7lbmI
         SnZvjr9oJSSD0D9U0I8XnFyKjffcyraYuKfQwJPWaYN5OgyjOaEGJggVnf8d9oS5exvY
         AMqKOHZsvHjz5BBZWFla37D++JzTuuQE2p3cs60L/ppWFJUlqTk9sMG0vbZTtzCihF2s
         leQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778069116; x=1778673916;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N1i9Yyd7MB/CNIprVe1jSbeBhmSU2d6sb8wLHaMeUgc=;
        b=I2aYvoOmr4GhJ3BlL6/iYUxVEgyPHw9Ndp7YKYOGCAjvo9+RNlI7tatWd7MaBibIvW
         Dh0kMDOAm0Hgsb2N/vUTjZjI9MppH2S9Q+R1IcEOKHzjqhAKEW2w1uokSiCOA3LCPFhS
         uKrGZMJ+FcIh3qZAGhsvWjcmI9Uv2D8S1ri9sQJ2JZMJmtJ4UrKf5hcYT5GaJpmg93Ec
         0Dt2gUn0h769/EKbulk29r5T+AE57ESMLP7SfXToKV3e/m14VTVkSrRmEpfcwZ1VDnvC
         R45TR72R3ATDCLc/MFwOinhgqZo4R8J25035DJV0M0KThj/AzRAGQxDJ0IVQOqDg3cnn
         zY9Q==
X-Gm-Message-State: AOJu0YzPt+ASIox63VpxDa8ajECpaGoTxcz4aW12oa/mMBYAqIMUjVm+
	nqvVY3l8PniiVcADl7Zt9fH0n/+pIAORaBrgCsV8s/AKIi9/rmcAV8mxbOkyBSB2/QoD+M/a1WN
	qFkA=
X-Gm-Gg: AeBDiesX4IJr1voQ641OJTi4EeFwV72LpKe5DuiPAXHBuuwyGbpWt4/nnHKM+/KW0cj
	SV3OEZA31JMIk0wD0z9L8vf+GTmZq5DYMpgP5cnW5Nu2tNWm4uc4T8+dfZ9wjMm9MPUNwpaw4c7
	gFwteCSGlyOw1PsT8FCaxUF+CsFZZVxvcs4zX55qyc0SkblOMIQ7JifrIshvRV3u1KZB7jK9wHT
	52MC/BHHQ45Zew46ckzwg9vpPuu5GBm5RsfQszXoAJBopav4eTF2M+92hFaNztpS7dR5qbHN+i0
	/CkNXGQTLTgHvjLfJ83pkMAB15EPJpt/WdJ8AatheYL3VuhM0tHmz7cwBvnbsiL7r2xRFNdPB3T
	WRO2gY034ZGSXizdGZdTe8RxJKvpz46ySFArbD9PXmGoHCFBtInC8CxNcbwp/Q6b4pvN79X+ZGw
	oHA+vAN6tTXh6PA0/gn8B1/sn1UnZWq8074UB+0XsG1IYtx25rOynEeMgsl5t5tnW0alDsxSdiK
	HxwmMRiXQ97Gx9zj/ITXCaVTw==
X-Received: by 2002:a05:600c:1797:b0:48d:366:b962 with SMTP id 5b1f17b1804b1-48e51e0a8a8mr27988185e9.6.1778069115440;
        Wed, 06 May 2026 05:05:15 -0700 (PDT)
Message-ID: <6d9345e7-7ad9-48f4-8447-3a955305430a@suse.com>
Date: Wed, 6 May 2026 14:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] CI: collect certain intermediate files as artifacts
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
X-purgate-ID: tlsNG-c201ff/1778069116-DAF6E443-656ED7D2/0/0
X-purgate-type: clean
X-purgate-size: 1624
X-Rspamd-Queue-Id: B176E4D9F74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RBL_SEM_FAIL(0.00)[192.237.175.120:server fail];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[suse.com:server fail];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[suse.com:server fail];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

When one of the linking passes fails, additional intermediate files are
still in place. Having them available for analysis of the underlying
problem can be pretty helpful. Collect some into a new intermediates/
directory. (Nothing new will be collected if linking succeeds.)

While there also make sure xen-syms is collected (into binaries/). This
is rather more useful for analysis of possible problems than its stripped
counterpart.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As the issue this is meant to help with didn't re-occur with this in
place, the new logic wasn't really tested yet.

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
@@ -41,18 +41,24 @@ fi
 # to exit early -- bash is invoked with -e.
 cp xen/.config xen-config
 
-# Directory for the artefacts to be dumped into
-mkdir -p binaries
+# Directories for the artefacts to be dumped into
+mkdir -p binaries intermediates
 
 collect_xen_artefacts()
 {
     local f
 
-    for f in xen/xen xen/xen.efi; do
+    for f in xen/xen xen/xen-syms xen/xen.efi; do
         if [[ -f $f ]]; then
             cp $f binaries/
         fi
     done
+
+    for f in xen/.xen-syms.* xen/.xen.efi.*; do
+        if [[ -f $f ]]; then
+            cp $f intermediates/
+        fi
+    done
 }
 
 if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then

