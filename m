Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNtDCSJlBGo0IAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:48:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812CD53282E
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307915.1579484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN84r-0007yR-Ms; Wed, 13 May 2026 11:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307915.1579484; Wed, 13 May 2026 11:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN84r-0007w3-K7; Wed, 13 May 2026 11:48:37 +0000
Received: by outflank-mailman (input) for mailman id 1307915;
 Wed, 13 May 2026 11:48:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wN84q-0007vt-3H
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:48:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN84p-00CwTx-4m
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:48:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a04650e-2eae-0a2a0a5409dd-0a2a4508a3d8-38
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:48:35 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a046512-63b5-0a2a45080019-d1558029b87a-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:48:34 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so74440135e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 04:48:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d624fbsm158685195e9.10.2026.05.13.04.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 04:48:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1778672914; x=1779277714; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcSnLg1p9V0A0oQKeQpJzI+pac+/NbM+PTH1HSiMLdM=;
        b=YDFqjTuuFTa4CX9ECTcTo9d79jSiR1cxf2PRiIn3xfqlD4MrfLMIdPUWNIJ1NHFfKL
         Hk3XF6qNRRTeNCpz2/ThkkLR5kCEFxMEcmtABT7fz1jQ1PbrIQnFXrfvFePxPRg9RUmU
         EaOKzaejX9TGP0tcbxoTWUfQQTCxKtnSGQD4WFgvjtprFnZGJemIO7ADV2RsRBN5h+4c
         7mlkKW32g/EhvAYsa8xBuBUAblJogzd2HoBHwOLRVe2MmAk1rQ4nDcD+3zBi/EPTkqHk
         +qAVd3RMZ9RyL08j0pB6MHFhKeShVaLDyTkMcc765GJv/Y5Tk/nsbGeJVgEDb9/I1tTY
         FzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672914; x=1779277714;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcSnLg1p9V0A0oQKeQpJzI+pac+/NbM+PTH1HSiMLdM=;
        b=MnkjbcVmTFwjo49v1HLQ6Tx+vNVttQEaVYWhdx8cHdmHQ8nN9OWJmTQMB5WytaU05F
         q3RjdG9+AipMbqiTj9iyLTa73MMm8uq7pxvyWtY8n5/u4INwmrXPQon+6Q5MwxkL339U
         f/DGsBveGBAxLnDPN3gzTwOfnPQOvUOkygQ3OnsQ54TWkw/NVjWsKqyLeQuI6BvYNfZ/
         ccz1PjmyHVWkqxHc7Sc6ceBwgPhdGx2yZOPeZ6Wt54HGmPzlONs2Dwq4cUls2aE0T1DF
         eEm25CUyrTuaiVxHuCCwK9bD9BeUZLvrzicqDPi2sJrU4uQ9KBrUE8aGTdJf9pEW1bht
         C9OQ==
X-Gm-Message-State: AOJu0YzHucHvoCMvqH316lYjjr1drIjinJDCiJk1XRomMETNwyvsidaX
	C6JZ6uqMnjmoYa1UnE8qcdKE6D4lQhRRi+K4dBCQ7tLHyPcBtPA1TGaj92Wh5A/Y68nadworLCy
	HNI8=
X-Gm-Gg: Acq92OE4TTLekYCPjvJFeW/dSYSNs2Pxj3Wiqxeljc+VVUVnJW85k6fq2O0fGW3/IMD
	QazNe4+XTlTFq3JvNJW9jnMMfs2IRQuNVXTDR7oWwLHYaAd1MDacbATGuKWOu7+fJoDjmOcOw8u
	NPbQwnPEoAkJbYE6K8S6aUYBtOsU9GshU2k1hkibGF/IjHFSiJpC6j2RErnLRcE62fKJ7lDOaKk
	XRIwqIZqTH4RlDKewtWoAuTKzCz9AE0vaZFSOb5t7lSxKlX6u07VSdd8rZc9kX9bFDa2eZMvznL
	l0huPVrsZTjeHA//GcX0fqDyNmb/e4ZB7HVgXdgqQjUb7eYJndnpjkKwm1V9gSSRZ4IcHeAs1ft
	XuuyBwMqivSMyLSMTW2UdkI5BGguRU9tQ/MAZzeGTmISV48WL0pdhXxR7PJrS3hLx6qpKWQxkYH
	WeKq4uVLkb6ECCivwtnyal/WvMi3/kdVMyVx2tflSJ/CGahHc6O7F8hFlF5CI3P4wTVGXPfjee4
	q35a5oGX+k3q42YN8mikZuaKQ==
X-Received: by 2002:a05:600c:4f53:b0:48e:8974:c377 with SMTP id 5b1f17b1804b1-48fc9a53d16mr40098355e9.29.1778672914332;
        Wed, 13 May 2026 04:48:34 -0700 (PDT)
Message-ID: <4c96b39c-ddfe-41ad-ae6c-3393dd4f9e90@suse.com>
Date: Wed, 13 May 2026 13:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: deviate guest_va_t wrt Misra C:2012 rule 5.6
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
X-purgate-ID: tlsNG-c1860d/1778672914-B757FDB1-342779AD/0/0
X-purgate-type: clean
X-purgate-size: 1063
X-Rspamd-Queue-Id: 812CD53282E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

... ("A `typedef' name shall be a unique identifier"). Much like already
done for guest_intpte_t and guest_l[12]e_t, but limited to shadow/multi.c.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -143,6 +143,11 @@ number of guest paging levels."
 -config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(file(^xen/arch/x86/include/asm/guest_pt\\.h$)))&&any_area(any_loc(text(^.*(guest_intpte_t|guest_l[12]e_t).*$)))"}
 -doc_end
 
+-doc_begin="In x86 shadow code, the type \"guest_va_t\" is deliberately defined
+multiple times, depending on the number of guest paging levels."
+-config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(file(^xen/arch/x86/mm/shadow/multi\\.c$)))&&any_area(any_loc(text(^.*guest_va_t.*$)))"}
+-doc_end
+
 -doc_begin="The following files are imported from the gnu-efi package."
 -file_tag+={adopted_r5_6,"^xen/include/efi/.*$"}
 -file_tag+={adopted_r5_6,"^xen/arch/.*/include/asm/.*/efibind\\.h$"}

