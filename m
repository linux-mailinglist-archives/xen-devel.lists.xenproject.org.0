Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONDtNkC+wmmOlQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:39:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47455319282
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:39:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261137.1554257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54mj-0003QK-4S; Tue, 24 Mar 2026 16:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261137.1554257; Tue, 24 Mar 2026 16:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54mj-0003Nq-1S; Tue, 24 Mar 2026 16:39:17 +0000
Received: by outflank-mailman (input) for mailman id 1261137;
 Tue, 24 Mar 2026 16:39:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w54mh-0003Ni-TF
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:39:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54mf-009iyf-NS
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:39:15 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2be2a-e002-0a2a0a5209dd-0a2a4508cf38-38
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:39:15 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2be32-1950-0a2a45080019-d1558035e044-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:39:15 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-486b96760easo13743175e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:39:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48711702191sm58742875e9.5.2026.03.24.09.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 09:39:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1774370354; x=1774975154; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=56tWNbz8qa5QLyK5OKVcFjuIr6ITFbD/4bSejjAPp80=;
        b=Gd47qZhOYNt8HfYvSq6KUOb+12F0jwrTNQkNwzlaUmKKRFmiCtDW3kxZRU9mTv8CkK
         qB4Z80IX30974QgX2dW5dTX3PjAp26SWuSV4YRCUaq0wuUeTsprSmGRJgvuy1hDIE8Gt
         bOWLZEHBFYRBw78fDKPbdtG3Uny/WNsKwISSmJuzQCnlMuv0nWGElyoPV1wuVfv7iUXl
         RZR786bdVrBHXOR2XTVwTnlSLMcDAYkcfFZRkF018rSSzGLR7ytPY8AKT0eifLSzdINC
         eN4K7GCKL7y8mZ1+0/LR8lunh1PkQ4RFEafcF18sguiLnlEQK4X7x025AGCaJxmYdwZd
         UrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774370354; x=1774975154;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56tWNbz8qa5QLyK5OKVcFjuIr6ITFbD/4bSejjAPp80=;
        b=J2SUoWrg0RE54/BH7wgjOz+XCwq2LZArJECeY7cFj488BYxldkmPDTbW/Ky2kagxRu
         TxX313c/afQJVdg1hiqjHgOlWtOzi1I1pQTf2paQCKPicIxf6QSaN1TPCgYAxJvLXx6N
         foZJOd0AaiQAjVIH43tnhcLl/rnantggCbtPOWxj+wl9PoqvrmpUyRKq3aBykBs3DESM
         rgPqbPbJweXb5E2/FcP42nUeoSz5U29WE1yK9uu1txiFJVQETZ1qovjD1w9/4RmVYw3d
         N/y6UlSHuSlUaLp/L0X+1gNORSSOkBVnKMcZfiQKu5wc3LC/vCHwtor2gpa+vHmUPTCY
         oxXg==
X-Gm-Message-State: AOJu0YzkC+y2G+2qhA77zw4vRWFkKkEu09icrpwGxK30eK5LGvp61K26
	9ceoFEkD2W2tsfo/2cwDWq4s3MVTPOFChJ+2HiQ7Udg6Td3Pa9HuJm8y2b5um110fEKas/sJTeZ
	V9LS8Dg==
X-Gm-Gg: ATEYQzzZR0W/vK2iGi8sSGO0c1StkrkGqef9Wgx6zoDmoBLufsV72ZCpRamgTnPUFQH
	Dtvate+Dr/QVWt3xj7pAGh1lJpiKMRXuBdkGMdGvLvDkL7Er5wC7VOEYoB8kQ4Ft/XYfdNxjw29
	kdbEBV03US/xm/zB8+PHZAfHqt4XUerK6tg0diTCqTJy82siiHTflw+JDzwamAJ7VwDN2hTCcjT
	/woVPuH8R88qcF+AKG8Dh5+D9ie2mU1Ler2i6JICn5pLjcTnHVu5kG0HCNgCeUAxyCyfZooW9jt
	rXTPq5aSiLu2hIVQ1k1Itrha0oSYlSsgnZaurgCg0pSeMpt25x7yZ94ZyF/oAf4SVgKRJ9geBBK
	DJRsEkZzoX4xIk3LDscIVcaTaZUf1p98gWIu5WInr9+778vkwtVNx3aszXEl8Wdacm+zd+VJ1g9
	pnHk0Zg7tBS3DQt0cy6F8QWVZvsxC0uMUfvqxjwmg7JNfuctk6sN7wb84UzQF+buPghAqb5xTIw
	ZkJVQEQgn6Wk0c=
X-Received: by 2002:a05:600c:8b31:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-487160881a5mr6352565e9.31.1774370354351;
        Tue, 24 Mar 2026 09:39:14 -0700 (PDT)
Message-ID: <5e8b4faa-5540-4406-8706-d546e3d2c46b@suse.com>
Date: Tue, 24 Mar 2026 17:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/5] video/vesa: harden font height parsing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
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
In-Reply-To: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1774370355-F1CE2726-B768BCF5/0/0
X-purgate-type: clean
X-purgate-size: 810
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,cert.pl:email,suse.com:dkim,suse.com:email,suse.com:mid];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 47455319282
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We should not prematurely increment the pointer, to avoid inadvertently
skipping the NUL terminator.

Fixes: 6d9199bd0f22 ("x86-64: enable hypervisor output on VESA frame buffer")
Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -31,8 +31,8 @@ static unsigned int __initdata vram_rema
 static unsigned int __initdata font_height;
 static int __init cf_check parse_font_height(const char *s)
 {
-    if ( simple_strtoul(s, &s, 10) == 8 && (*s++ == 'x') )
-        font_height = simple_strtoul(s, &s, 10);
+    if ( simple_strtoul(s, &s, 10) == 8 && (*s == 'x') )
+        font_height = simple_strtoul(s + 1, &s, 10);
     if ( *s != '\0' )
         font_height = 0;
 


