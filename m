Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLeEBkc352no5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:37:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F09438434
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:37:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288626.1568883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6be-0005sp-Gi; Tue, 21 Apr 2026 08:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288626.1568883; Tue, 21 Apr 2026 08:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6be-0005qN-DA; Tue, 21 Apr 2026 08:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1288626;
 Tue, 21 Apr 2026 08:37:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF6bd-0005q5-4t
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:37:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF6bc-00AE0R-HV
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:37:16 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e73738-e002-0a2a0a5209dd-0a2a4508cba6-4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:37:16 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e7373c-63b5-0a2a45080019-d1558035d144-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:37:16 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4891cd41959so19735165e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:37:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e59f97sm40090652f8f.37.2026.04.21.01.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 01:37:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1776760636; x=1777365436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B6V7BN4hxXU439Lo7mLCOu7stPATYuK1DmCIaf/ONQw=;
        b=ei/w0nLf7u4dCgbLLCsqTUO++l7YexFeO5aLbU9hvAT8LfHSHGIYAXRKfQRkbObJE5
         LeJ8DncrxUq92CICWWTfLuPrbClIhwm6Kat34wkzDwh3wVPhwOv/f3JqjqyGbH+Zwsha
         JdqOuBoI52sEaQbcHcWXLWsbD5DmBR79q+678NeiG3o8OCKmg81i3eZvQ5JcqRRE16gx
         xaxesGT02/wAqZhWgxbg4FyrKjHdXQpilQwP1IFA5iBMDaIWnqA6GMpj2kLeUk2Rx7xQ
         hTtrcwo+y/Z+PGnZetbcFONjoxaNw21V5Covln6jBZcy1oiThdW7ugAoL3WQ8EKhCEh1
         YcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760636; x=1777365436;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6V7BN4hxXU439Lo7mLCOu7stPATYuK1DmCIaf/ONQw=;
        b=YNZlXfwAWuxYl1ymKVa029cCcVa8d+UyXGDNgWUEcJ0IHb8AvNh7dl2wfgeNgmL1LP
         XppltUfwLk+CIkQ1D9IawsJmg8usJjh/fMjkuYaI5aWoqBT2wUmWylhZIsYSFtSlKXWB
         tPfgxIQZh6AXWV0XEOqgwleRmuT+p/ofMR5COXFh+SBi1zDYCfUUpDOwOBl/rVCvpsKL
         vnTLtiElRefnRxwoGWOg3bJCoYyv2rnfF1BamBXDFWp+OqPMnPWIZMhPyRkedtNwcew1
         Z/pCf17yblbct//yz+lFHCmOwqC41mAn+waxbmssMjYYynbCR2l+O6wd/+rmtt31ly+D
         ycRQ==
X-Gm-Message-State: AOJu0YzSvhL45nm3UPAje491M9tedC/kHCZeZ7WqOv/a/54G7cgvSUly
	cAJE4pC5YzgJosqP1eQFBbAOYF3g1eNTZJnAkgXi8FxO2ohGt13JLNPZy02M2/ar/Eu2w2CZGVc
	0jEbGTw==
X-Gm-Gg: AeBDiettqPyeKwRlMW/Ddwtk6/1DZ+UU4CjJp8nrQdQ1OdKiD4GR3QqEH6s2JNqc9Ix
	iaXbqBA5QMLUvNtSs+m1XMd1HRSBJMicRMU2Ne/wRurpgLg+pMkC0cszE85OD1DeApuv89i0+Sp
	DmUt51KXn5StiWTf9xKoHaThI1H7LNgq9QBz4T/AYoXX1SI9peq/HWm3RZcvt+umtwSXq5FbON6
	ZtNMA6VCcYgwg+GhQ+bXvF4aa8i/OBqPUfB47vCb38icc8C82XBIxYWYhSRcbKmCInSU26YofRd
	U8NJqYfk7ZUzEiklVFneC4B6doQlpDI6lROLZY2WeycFaZUbuBUOtnUBVaETZizDkSrmSe5wqaT
	cT45pG4z6RYEb8ckTftSOZLLecKIsqRqLvdbrhxNpOiW+tVKgN1d55RK2SqY7UnCzmR4Rp5LOBk
	+CKykxVr0GWm8hjR6y7ZuWbsG0Oq07BYtf4mlng7N1k9MrOqFyG+TFmdOrwOXdJbA5QQen4fbFA
	F8IVWFK5YwMD7aRltmxyxATSg==
X-Received: by 2002:a05:600c:899:b0:489:1a63:509c with SMTP id 5b1f17b1804b1-4891a635125mr74154665e9.0.1776760635747;
        Tue, 21 Apr 2026 01:37:15 -0700 (PDT)
Message-ID: <4922ac38-e6d9-439a-a4de-2eafe2569017@suse.com>
Date: Tue, 21 Apr 2026 10:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86/mkelf32: use xen/macros.h
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <5f299d7a-be1b-4bdb-a10b-37c334606bdf@suse.com>
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
In-Reply-To: <5f299d7a-be1b-4bdb-a10b-37c334606bdf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1776760636-3B97DDB1-E90039A2/0/0
X-purgate-type: clean
X-purgate-size: 1003
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
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
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 86F09438434
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Avoid open-coding macros we have readily available. Being able to use MB()
there might have avoided the flaw corrected by 5416c455f656 ("x86/mkelf32:
Actually pad load segment to 2 MiB boundary").

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/mkelf32.c
+++ b/xen/arch/x86/boot/mkelf32.c
@@ -17,7 +17,9 @@
 #include <unistd.h>
 #include <inttypes.h>
 
+#include "../../../include/xen/const.h"
 #include "../../../include/xen/elfstructs.h"
+#include "../../../include/xen/macros.h"
 
 #define DYNAMICALLY_FILLED   0
 #define RAW_OFFSET         128
@@ -345,7 +347,7 @@ int main(int argc, char **argv)
      * the Xen image using 2M pages.  To avoid running into adjacent non-RAM
      * regions, pad the segment to the next 2M boundary.
      */
-    mem_siz = ((uint32_t)in64_phdr.p_memsz + (1U << 21) - 1) & (-1U << 21);
+    mem_siz = ROUNDUP((uint32_t)in64_phdr.p_memsz, MB(2));
 
     note_sz = note_base = offset = 0;
     if ( num_phdrs > 1 )


