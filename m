Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E0qFTOfjWnv5QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:36:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058C712BE7F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:36:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228559.1534709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqT7i-000487-Ul; Thu, 12 Feb 2026 09:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228559.1534709; Thu, 12 Feb 2026 09:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqT7i-000464-Qf; Thu, 12 Feb 2026 09:36:34 +0000
Received: by outflank-mailman (input) for mailman id 1228559;
 Thu, 12 Feb 2026 09:36:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqT7i-00045y-4p
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 09:36:34 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e9c4ade-07f6-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 10:36:28 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so1101245e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 01:36:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dcfb28dsm105214395e9.11.2026.02.12.01.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 01:36:27 -0800 (PST)
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
X-Inumbo-ID: 4e9c4ade-07f6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770888988; x=1771493788; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cpm2UV73PIh7YE9HQcdTh15v/sd/mpsYbkiZZZ395GU=;
        b=E3rLXARAjwQCxLZiBmOokvXd23cnuehKu9BA6Yih09V+Ic9BpGdBEGc/5EAMuZMvXy
         wSbQ1nJAOF59taUQA75m9Gla6O9B7tUxQ8z+ri/mC1bpQjg1pfAA8+gld8nFsijbKyoh
         7/lUWUz5ge/o+QQkPaxa+oPfa1rNGfUXt5i0BSGa2rCdvgSn/Bw3sx1wLmf4nUc7r007
         BK8tSU5OaMC4Sx6akFEwlFYpyFrgLWq8hiP9pgRb5oPi1gu0FPRXi5X3EfUY6I3dToZS
         n2q4o9ifK0Emj7zjBvdWwj0Uv89GFTTAy4Uvci2rKPgx+DhTgtR2uKeu7XlFwN77qsnB
         88gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770888988; x=1771493788;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cpm2UV73PIh7YE9HQcdTh15v/sd/mpsYbkiZZZ395GU=;
        b=NIoegNZXjG6z9jPGV/fNxBpJ72VZ+2vPkdFQhBUaYKeBSzpivH3R/nI7oWCczvc1Uw
         De/gzvoPsPU2m/R+q7YGoFRpTthg5tsh9yhru8Mo09b5Wfg8lpjaOwe7eCbp4Dg12PmO
         ww+oZEpcg7RryWblffUyFgFJg4w503zr1e4+vLXkNqqET4uwd5WPPmgQSSj3eyJux+bT
         RlNwLUzuireKqci30hrKRAy41arneffx3Dojhn5scla+Qphu1RqKDWp+8l2KA2eCNmRE
         ++q7mtoOt7p8a7KKsT5psfFxw5HTStvqT+W8Xeud8jHL+PjWlHmxAw7SZVgxPblEB+Wx
         3DsA==
X-Gm-Message-State: AOJu0YzXkZGUjuVyrOiZdoMD/p38UcdetFKKH3nXJwvdwNQtrIeGFpGn
	kjYJuNMA6RFy1VARf20UP37oZZCdLT2Kw/UjIur9H1qtvMhpdn7Fshi1TgQYkkkyToPvyd3EHiu
	wNWA=
X-Gm-Gg: AZuq6aI+FxYqq6DVuAqaVqvYC1U4G3sZfPG2NMP6oQNc0JGAQL0XlP5d+zxVu75w9+z
	dVMA1PgGX0CoVh+qBZjKjlpnJm1aYcmBv+S2XrSjsknB6NzNlxRRIUVfT8hxvo5UBbklvn07sAH
	IbH/F8AFI9aYZ9oFTMPUL7RQSBb/xqmEuOmFUvaVwrDHSxF0x4nRe7zsC5hGCKNC6DNdYcNcngU
	hk+mBWWOVrKCYSlKfC7Qop8HsYK4b2Z40DsrAvpoADjG19Vut/RJvK5ynMVDybr1WVhGztRbELq
	BY4GBGZlVbHuVevmlJRBlv8fQ5LksxPCjb/C0wZICeTNQbviAzOpICxVRR0aquF8X7t6oq/kVsO
	1l1xfiUB1c4tqsKT92AmhYsBUvTQV0ofziRtFwrsALWHjb4nFqRSU5/PeDOu4Hklhsyd01e2yy/
	2hikA92qQVSzR7uCektar+lAHHosBaP4reuG26afegtAlZa9eneaII6QXotrPVoXtb63u1We7y6
	F1MxMe1Wco8ZaLHK2727siaEw==
X-Received: by 2002:a05:600c:354c:b0:480:3b4e:41b8 with SMTP id 5b1f17b1804b1-4836571d53emr23829025e9.33.1770888988120;
        Thu, 12 Feb 2026 01:36:28 -0800 (PST)
Message-ID: <df668fb3-b3b9-4f37-920f-b1aa653a35de@suse.com>
Date: Thu, 12 Feb 2026 10:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.17] SUPPORT.md: revive for extended security support
 "lifetime"
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email,xen.org:url];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 058C712BE7F
X-Rspamd-Action: no action

As per
https://lists.xen.org/archives/html/xen-devel/2026-02/msg00630.html.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I would have preferred to reference the xen-announce@ posting, but the
mail may still be stuck in moderation there.

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -12,7 +12,7 @@
     Xen-Version: 4.17
     Initial-Release: 2022-12-12
     Supported-Until: 2024-06-12
-    Security-Support-Until: 2025-12-12
+    Security-Support-Until: 2027-12-12
 
 Release Notes
 : <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.17_Release_Notes">RN</a>

