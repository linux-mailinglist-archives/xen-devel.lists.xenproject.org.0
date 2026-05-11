Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB8oJ+nTAWryjwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:04:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A99E50E868
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:04:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306153.1578220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQJF-0003Cu-OW; Mon, 11 May 2026 13:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306153.1578220; Mon, 11 May 2026 13:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQJF-0003BR-LS; Mon, 11 May 2026 13:04:33 +0000
Received: by outflank-mailman (input) for mailman id 1306153;
 Mon, 11 May 2026 13:04:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMQJE-0003BF-4C
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:04:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMQJD-006IPn-HD
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 15:04:31 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01d3d1-5cb7-0a2a0a5109dd-0a2a450ab54c-42
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:04:31 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01d3df-56b3-0a2a450a0019-d155dd2ac0a1-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:04:31 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4526a8170ceso2326570f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 06:04:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548ec6aea4sm29766551f8f.10.2026.05.11.06.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 06:04:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1778504671; x=1779109471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2fASRzB8nQ57rMJi7XMHtCPQOTg59xiY5NktzJBJKvI=;
        b=XaF+gaO8MyPa/N1dzTOnViLpGGcBtAxTHWs0D32uv1lQtrW0Ky/UEMaDzxJI4PArkK
         L0WWqfBlVGe8u1Ymd863OcD01DUgPtZdqetgO42/rMT2yVcJEJ3irr4uupPQRKtjAPft
         7ZdcT0bBx77Wlf7CJIgkRGAxpwgP9aCKP8MFCvKPExo+dvth4DA8Uy5h9di1kE5TWLiJ
         D3OYeFPvoYxJNtVwGEQ287+qb7poxn5mNJGzXEFE6pQAbUS/JVfcrg1gHyWUGpErDrq+
         PgbTCbA52APzlzlvZW++JC99ry+2XLFv3dOcoZ6/Zyl3+37VoRoIaTgqSoBRG8t2Q8qC
         IeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504671; x=1779109471;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fASRzB8nQ57rMJi7XMHtCPQOTg59xiY5NktzJBJKvI=;
        b=s/L+ifawjI3ol6s/wVCNG+siU46QNTBC2eYyfvxHMYkMhWtUTXfx6jwIcJoFT1h9OS
         E9FJPdUd8BoPmP38RFafxWDvx76F9RthtulLeXOlvChNHRXlmUdbUdrmO+t7Jyl64DLC
         OuzX2HtK1opZJrlu5nYGzuTWR6lI0LJCXSmeY8tU81zG+gL+SN5qDT6K2+FHQXKyVQRJ
         evO8ODyMXHf4c2IGzInZOFJKIwRWHs4lh8gcoz3g9WYYJQ8RS0Q5dvH5CpotTw3tsOXg
         78K1C0KXu3qF++KOCnsK2HVEKEERUHBLB/Fvzyvm6WWeemNVjqTJUvmzbemghMU64IZr
         nvfQ==
X-Gm-Message-State: AOJu0YwtVxosTG31BSMojzxQmnous+OR2zfb3dw9k79oZJ1qbeeWashi
	ZlcGPoqiQizT+bLl2G+XNz1wpbZ4RZIwTl1rD9pDiNOgjY9Is0BCtJHBQ3Bi7AnMKZ3+s4YumzL
	8T7Y=
X-Gm-Gg: Acq92OFQJLcgEIi+4pbfRTDeezcF0y9NGI1PjqUaemE1V8txDGiU86Jmaatp2sydjrI
	S7rRv0TKSeH4QnhCuQfWAjI+CFFiWCUv3sOF9P98ybkR3NAfoZpdq9Sf/X6Pl2TbM1t6XXRGCs6
	nZU2YgqzkPsmv5MoojW3oh4/dcECmF4QjqXoABNlkxZF0BUjcIPkc9gz69/62svNoTgojzlr6I7
	ACf9MOPL1TyTHN47EUu/wV0L7w7gyis3tt/vi6gxoiE9bqAHPj6LU4j/Y/yyKLllftW6BX78sdI
	Il5Syw9lbYFuJbrjdmqgHbhxOfA3BUyeDNxFJ5K8u/ik1bCoUlZgmYhlI7HdUSdECBZMxNLFThU
	R8aSF+QVP1kfPzruI2A19CP64EAf2caQLb9Z3CPkBHtH6xp3GQbgi6mzPzP1sQes350Ssrf2bma
	UEJjQgP/RhB4rTadgFtUssF5ZrMqqCLOjyKkQmI1zD8NMwZm2z39ZIwRuIn1LQRgKfo6vNT4/3f
	4s4UkxV+mHubco=
X-Received: by 2002:a5d:584c:0:b0:441:1c18:f779 with SMTP id ffacd0b85a97d-4568e70690amr14375770f8f.37.1778504670844;
        Mon, 11 May 2026 06:04:30 -0700 (PDT)
Message-ID: <b2eb6d3a-f5ed-4ca6-a556-c9bf06809abb@suse.com>
Date: Mon, 11 May 2026 15:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/2] CI: re-work Xen artifacts collection
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
X-purgate-ID: tlsNG-4011c0/1778504671-7377D8B7-AF9A630E/0/0
X-purgate-type: clean
X-purgate-size: 1989
X-Rspamd-Queue-Id: 0A99E50E868
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim];
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

There's no need to do this separately from three places. Once moved to the
bottom of the script, the need for this to be a function also disappears.

While there also make sure xen-syms is collected. This is rather more
useful for analysis of possible problems than its stripped counterpart.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -44,30 +44,15 @@ cp xen/.config xen-config
 # Directory for the artefacts to be dumped into
 mkdir -p binaries
 
-collect_xen_artefacts()
-{
-    local f
-
-    for f in xen/xen xen/xen.efi; do
-        if [[ -f $f ]]; then
-            cp $f binaries/
-        fi
-    done
-}
-
 if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     # Cppcheck analysis invokes Xen-only build
     xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j$(nproc)
 
     # Preserve artefacts
-    collect_xen_artefacts
     cp xen/cppcheck-report/xen-cppcheck.txt xen-cppcheck.txt
 elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     # Xen-only build
     make -j$(nproc) xen
-
-    # Preserve artefacts
-    collect_xen_artefacts
 else
     # Full build.  Figure out our ./configure options
     cfgargs=("--prefix=/usr")
@@ -108,9 +93,16 @@ else
     make -j$(nproc) dist
 
     # Preserve artefacts
-    # Note: Some smoke tests depending on finding binaries/xen on a full build
-    # even though dist/ contains everything, while some containers don't even
-    # build Xen
     (cd dist/install; find | cpio -R 0:0 -o -H newc | gzip) > binaries/xen-tools.cpio.gz
-    collect_xen_artefacts
 fi
+
+# Preserve Xen artefacts
+#
+# Note: Some smoke tests depend on finding binaries/xen on a full build
+# even though dist/ contains everything, while some containers don't even
+# build Xen.
+for f in xen/xen xen/xen-syms xen/xen.efi; do
+    if [[ -f $f ]]; then
+        cp $f binaries/
+    fi
+done


