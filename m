Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j3EFMeWMT2r5jQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:58:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27127730BD1
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:58:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=K3GAdX1C;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358046.1612340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnOU-0002EH-6r; Thu, 09 Jul 2026 11:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358046.1612340; Thu, 09 Jul 2026 11:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnOU-0002Bx-3y; Thu, 09 Jul 2026 11:58:18 +0000
Received: by outflank-mailman (input) for mailman id 1358046;
 Thu, 09 Jul 2026 11:58:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whnOS-0002BU-QA
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:58:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whnOS-00326D-3a
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:58:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f8cd4-5cb7-0a2a0a5109dd-0a2a45039676-26
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:58:16 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f8cd7-f2d2-0a2a45030019-d1558033a92e-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:58:16 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493c1950518so5318615e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 04:58:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb74835esm63112805e9.14.2026.07.09.04.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 04:58:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1783598295; x=1784203095; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tvRfgrGWKZkC1zkXNs2XEBUHm2ioUzCUDvRe6NNTofA=;
        b=K3GAdX1CSLGqZa23a2BegHBO76HetPbdyXv1+SIaC8gOAfGeqmXs5oesxuZoqsRgHU
         9iFq6EEbjdTUl+whq2fdkuA7II4XybyXBCVD7Rju7Hp9nn2v0RmLCYw7H/pCrljDLs0n
         MncjeVzDrBxHi7X7VcOasYkurQaDSRr2NMA3q4luzYhUCN8TAJzlR+ICb9ne5nkRzr4U
         YEnK/D/amXgZmdGYJ6IR+bysN8zbjZJkBdbmyIU5LabvVhx+V/+e45m23GK8wW7kCd1S
         UU1PcxlFoQIblcYeJTno94w0VTkZj7ayP1XHo2iMzGXANnvsHbTvavQ9lN+eWwsrV8/w
         LiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598295; x=1784203095;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tvRfgrGWKZkC1zkXNs2XEBUHm2ioUzCUDvRe6NNTofA=;
        b=GKrkyX2nnxPv+hm5Oe3eltT2vR0Fs9/xseXA/G94xhSnxILE7wbDNC/lZ6qdjFIOhF
         s7qXE00L5GXfWfq+VYKuSCDuk9/h58kSV5CT4te1KRKLPkPOWpjTfA4lgx8g23cmBbpM
         pFdch1LjMJmulgV2P2TE36Y+IiJ+1ow0oCwuE0HDuIvcsI8SPFg6EXFrBZHXEhHf1FLA
         SKC8He7XKBjckQmI8uCMMqa0DM9Mzg3UwjrWAxvesygweM3yzu9adO1KcbhjARVMJT3C
         fvtLW5jfiJAjux/OkEaOQuvP9830UPJRQuz5gRstmML4Qag39XkxlmKwslxIjhaApbUN
         y+zA==
X-Gm-Message-State: AOJu0Yw81qDgwlPT6IFBGUs1hmJf6ktrymqfJTeNs5zjCU1cS8E767w0
	L2Rn/ByOTTFzLSGHv+89VMZllhSr7r+Nta6pYEbC3XFIzJ1b74rckeZD4O/cm2mujfnBiEHwlUA
	p7zIZxg==
X-Gm-Gg: AfdE7cmM5VnhqvV4KRoJGvGEaEoF5Sla/2/aaybYsOyi/NENSa2mTK9ig9uiFCO6v0U
	1vjel7GxjYnZoX1NLNTvOPwep/dE9OeCSFZQkMnzqoiuVABFF7fDji1kHgpFHdMGVnj10Yl3+rG
	S1v3VOrN+frhgGUy7F7OSPJqj2UMIwChZIFnRYKuxZpohF2CFHhfecpkb6UHKWZa3GM6AK34UML
	lXFr3V38iN/5nRbaV4UhW1p//E5RNWy5w4hvK1xrsQBsAHjrpkO1lt8o1YsQrcClknuBYZrrPXr
	Y8TCbiQEtk++AoNaKudJOzv5cNDvWHlduiHE4ea3mmuK3P9+TWV2pLcjzljA10WNEa8Oeo3T3sK
	Qi+fHxjO6s11MNFV4QChMFMOfpkpcDNDW61BWrpzZ+ZdGmukw3uxPnODs7VHsqHkW25dw+Xqxoh
	rZ6wfhIbdRoX4spxNZOLM8o8NZuKevPVXYahB9AcYC9pxbE0m8gVz061gEg58y/BIRejdUItLBM
	Ioc
X-Received: by 2002:a05:600c:3507:b0:493:b698:9247 with SMTP id 5b1f17b1804b1-493ec76927amr24205935e9.14.1783598295537;
        Thu, 09 Jul 2026 04:58:15 -0700 (PDT)
Message-ID: <898091b0-0c73-4829-a3b4-c8da6026a40c@suse.com>
Date: Thu, 9 Jul 2026 13:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86: put x86_emulate/ early in $(obj-y)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
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
In-Reply-To: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1783598296-C2AAECF4-901FAD90/0/0
X-purgate-type: clean
X-purgate-size: 573
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUBJECT_HAS_CURRENCY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27127730BD1

... such that in parallel builds make would schedule it early.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -1,3 +1,7 @@
+# Put this ahead of the sorted list below, as it takes long to build and hence
+# we'd like parallel make to schedule its building early.
+obj-y += x86_emulate/
+
 obj-y += acpi/
 obj-y += boot/
 obj-y += cpu/
@@ -9,7 +13,6 @@ obj-y += lib/
 obj-y += mm/
 obj-$(CONFIG_PV) += pv/
 obj-y += x86_64/
-obj-y += x86_emulate/
 
 obj-y += alternative.o
 obj-y += apic.o


