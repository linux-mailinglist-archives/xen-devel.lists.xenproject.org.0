Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8On/AuMhD2rPGAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:16:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1625A8214
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315362.1585179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ58b-00024h-9i; Thu, 21 May 2026 15:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315362.1585179; Thu, 21 May 2026 15:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ58b-00021e-68; Thu, 21 May 2026 15:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1315362;
 Thu, 21 May 2026 15:16:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ58a-00020x-3k
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:16:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ58Z-003Z2j-GX
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:16:39 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f21bb-2eae-0a2a0a5409dd-0a2a45088aba-42
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:16:39 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f21d7-63b5-0a2a45080019-d155dd2dc9cf-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:16:39 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-44c350a5b87so3873316f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:16:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa93633esm3379919f8f.29.2026.05.21.08.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 08:16:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1779376599; x=1779981399; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ue6MJCifdDmqf3KI6DMAmEDDdKTWNNcG8m4U1J10AgM=;
        b=da/z+UGgduY4k6zmNdPMiSdGUaeU/QK+ikV5dC2cRCvCwOifyopJxV7LNgtvlK5mP7
         4aaBRj9SCWlY+PwKJvnBOBpw4mi2C3Lc4qplxZxlidl38D8IBjF8bLxERL7nJt9uZx1z
         XMvdgEJY9/L7zsMbbKn20LsXVJreIQESBXag8FEjDfvTDanb1pNAfE/yYNKhMTJPFcIn
         KFqDrqJ1QqDk6IC8rrDJOtE1y4x/3p2ofFdwQv5vNkF4xsXI7l2ppfhQW7lc+bMZlM8+
         x4Qv69Zg8cZD1KAAoIasA2qu49FAXDmEF0kGZHmf0X+vK3unPfLHN38FZXDCQ9+2lGYl
         rtqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779376599; x=1779981399;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ue6MJCifdDmqf3KI6DMAmEDDdKTWNNcG8m4U1J10AgM=;
        b=o1xItSaCMcdJa+95arABNQjZfI+XH/QrwAFYJnKhvvnHS/4fti4t+aMdspuM/M5A59
         aplztgqcnL3qCXbSa5a5m7VH7B3l+Y3u25Ostb8aqolIdrf+oi+8BFasXQ849JYEd+Px
         ftro2PuTosuGkGs1yW9VXc+XHaRClT96/4b4Ghf64at0j15SFYG5iVcuNC5ntmhUdfO7
         vzzXemSY9jY2qq+FYsytK+XRRj8RYY/icmYGsD5niAhUqiW0nhzmLLWowfgd3Ba0SRqT
         qF2fkM1FFmWqWBG7Nvck70JWgIsdY0zdL7oPeoZWNXFIWUpGhPbDlRyDilO2h/ctZDGp
         oOTg==
X-Gm-Message-State: AOJu0YxtNI8Fj1bjI2sNe/4N4df4kGti/cmgFKY5gBJF60ZZ543K6OfI
	jwgK9OGS8UurJmZ60Ud5l/+64nISwGlJl3LrHrPxgn5x6+mbGDtCnVda8Swx2BtGLJ3XHdtXB8N
	OQUs=
X-Gm-Gg: Acq92OEKbRcrFAdSSwdUycA3auO+JhVMBPvngZsXNpa4Ojk1qqCUN9l9Grg2L88Ls2z
	/XeXcFBhUv89D2dTfQp23Rj+vdV0Dji971i1KSTHp/fCKLoXWxcC36irJprHl1f7zU4KHn5J69Q
	437yrXOabYiUoakD8A15PJE2Z/7ihKV1Xstz9/GE6jAVECE3ZqRiy/Dq+HcZh7LIlY5muImupc8
	YfVS7zq4ZNcB4Cwg+cc8/v12y21Jkg0jt6YuI3nHsEjBshgLMhg7LPNFs+DNsmXSHpBwE+S9E0O
	H2rOx6RUWU0+jvIeOPP9ATy9qMkNyRzSsGeK4nO41I9V4IB+m/Xnbld28owHeJ+m8dfvvyfX6j+
	//BghJrN7gGXM6cFEljVmhhe3yMOx6y4EYQejWRSOcYLRnDGoCeO2knIjuQbgzSolFyahxmnFrx
	4nC0oB1+oMRf6QVt91b0VrJxZzSDZXPdzg/fSgZWT99ina+a8qx4TzJcaxBEIT//o3O3Qe31nhG
	qd1j2a6HCqfum8=
X-Received: by 2002:a05:6000:144c:b0:44a:fa76:5193 with SMTP id ffacd0b85a97d-45ea3be6259mr5275958f8f.12.1779376598853;
        Thu, 21 May 2026 08:16:38 -0700 (PDT)
Message-ID: <e8932c52-c030-492f-af87-d37f87ea8f45@suse.com>
Date: Thu, 21 May 2026 17:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] x86/PV: split a get_unsafe() invocation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
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
In-Reply-To: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1779376599-BF57FDB1-E5F5B64C/0/0
X-purgate-type: clean
X-purgate-size: 748
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 6F1625A8214
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Misra C:2012 rule 13.6 takes issue with the gdt_ldt_desc_ptr() call
appearing (deep) inside sizeof(), as used by get_unsafe().

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -29,8 +29,14 @@ int pv_emul_read_descriptor(unsigned int
           */
          ((sel & 4) && (sel >> 3) >= v->arch.pv.ldt_ents) )
         desc.b = desc.a = 0;
-    else if ( get_unsafe(desc, gdt_ldt_desc_ptr(sel)) )
-        return 0;
+    else
+    {
+        const seg_desc_t *pdesc = gdt_ldt_desc_ptr(sel);
+
+        if ( get_unsafe(desc, pdesc) )
+            return 0;
+    }
+
     if ( !insn_fetch )
         desc.b &= ~_SEGMENT_L;
 


