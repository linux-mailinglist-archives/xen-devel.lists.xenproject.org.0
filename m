Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNhiDhuejWmD5QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:32:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E502812BE42
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228550.1534699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqT3H-0003Vf-Dv; Thu, 12 Feb 2026 09:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228550.1534699; Thu, 12 Feb 2026 09:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqT3H-0003U8-An; Thu, 12 Feb 2026 09:31:59 +0000
Received: by outflank-mailman (input) for mailman id 1228550;
 Thu, 12 Feb 2026 09:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqT3G-0003U2-Bd
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 09:31:58 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acb3d512-07f5-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 10:31:57 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-483487335c2so35007885e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 01:31:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dd0e327sm105334135e9.14.2026.02.12.01.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 01:31:56 -0800 (PST)
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
X-Inumbo-ID: acb3d512-07f5-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770888717; x=1771493517; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KCYwcaPoR0SB+xwJMtpULTUrUYR0d3UfXYKV9gTVzAk=;
        b=Fg4xBuPD2trXJhW1yXDd5Dn6Fnrf3HQDexziQJpAiMQkflFaIfVp0v40uqYXm0G9fL
         Y4ZIaqG6amiabneApZnUTAGbJYYBFzv+Po7YwVGmYH6MW8ccN6G8iva1BswpbJMlfqZG
         PrhUA+g1vXNS6lGAFNU9iGqvywUPnjjOIkTApitxEoPyuS+7MYURU0eCBTDrjQYcPHxv
         FpSKg7pDqagOQVVLib/JiB/OHbqLTvBcrhtdXrcEtwE5RwcPUgGGGge6VcaPz+LIgQBe
         8xcJ+kHS13QP2ud7efJf+JL6q5TXwVUNVh+qqqoKaimaKOVpvoXxzzLz4j5hmhUYOb2W
         9SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770888717; x=1771493517;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCYwcaPoR0SB+xwJMtpULTUrUYR0d3UfXYKV9gTVzAk=;
        b=mt+uFtaCn87Jvjb3JAI2NDQH9P5lyVaB1dyKLM7X/vdA5MSqM44cJhtGi/6FD/qkji
         TO1aZ9DshQK+6tdH3CmrxW1UoZPR8uzKzuv87Ww4c9CZKxYcazK90PFq16OD6Ujlz5Rv
         vCWYMkbKw5TofP+Zt6naJxoxzwX5E0YmFPKQEaEUkQ3XEDucW1zWpRh7t3lDLbIv42OC
         dU184/yVWs1qul2GYT6pMLSkQ4B9ecoRlV4ArqquJSs3zT1lDj5s0t01tellUSi6+G5I
         +b2K9LoU7ZKwhNXgpqZwE/gnY3O/OeSBtG9VtnOeZdhm8ggfyRY+AIR1VCFslRWup4wO
         G64Q==
X-Gm-Message-State: AOJu0YzrWxQNQ3VrR6YqsXS3ASFFgoV0f168vAbJd+hn9qhDR9f2EYog
	+c9siQFwpDoEArCc5OEsTI9osQWgCMt7BvFJ2HsM7hdskoyU+cRrS0SA9yOwtQrrpJQqO002PNH
	6PXY=
X-Gm-Gg: AZuq6aKItM6aSoPiJrgdmXi3T8Wr6aZRlUolc+RG3BiyLZyR2wwcj97M8tuW4YSRc4W
	KOV0koahwPZ7vBG0L7aoY2WfLWa3UiS8WPFpxoKCZgfKnPMAobkQRFLcNHQQhypqtlDBXzBTv2h
	BHNLeGYnz45N+oBA2dd979bkuwMmPCZ+N61tOc1mrDGxilwGRqFissedJilBrjNA3h8kfnRQsej
	af4QtzYWgMp80XK1DxvZJO82V+RSxIFYcyWDQt4R0SGS93N8sQTDkS8SCyJEXO10TWODIr8Kauj
	J4UT1QpMMuA2gSgoMRzGz+gdt3znOW8PN73SDUtYSkvjy8nfUyGThBG6WA/C8j1ZH3IkpYqZNpV
	DD1jOdjLs3o+9askHpWsUWpt5B+Ru0saMhbbiyCDAmlTLrFVEsCakIF3avhgxIAU8DFG8/6jq6q
	FB6h0ycUZ5ZSFyLK1QaaAEsUYLPeSaseoqXZqz7yXlsUbIC6i9+8FoSerHP8RYbTIeZJID59DKq
	V1yIWfFIICFJRc=
X-Received: by 2002:a05:600c:3f1b:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-483656b08e1mr26805005e9.7.1770888716477;
        Thu, 12 Feb 2026 01:31:56 -0800 (PST)
Message-ID: <eaac7ea8-08d9-4e60-b991-c76ee3f3e9af@suse.com>
Date: Thu, 12 Feb 2026 10:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.18] SUPPORT.md: extend security support "lifetime"
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
X-Rspamd-Queue-Id: E502812BE42
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
     Xen-Version: 4.18
     Initial-Release: 2023-11-16
     Supported-Until: 2025-05-16
-    Security-Support-Until: 2026-11-16
+    Security-Support-Until: 2028-11-16
 
 Release Notes
 : <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.18_Release_Notes">RN</a>

