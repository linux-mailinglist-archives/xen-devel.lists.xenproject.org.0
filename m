Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jCRSLo0IMGqtMAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:13:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E9686FCF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:13:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Cc3dRRzc;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338274.1599292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ846-0001xX-6e; Mon, 15 Jun 2026 14:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338274.1599292; Mon, 15 Jun 2026 14:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ846-0001vU-3S; Mon, 15 Jun 2026 14:13:26 +0000
Received: by outflank-mailman (input) for mailman id 1338274;
 Mon, 15 Jun 2026 14:13:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ845-0001tz-22
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:13:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ844-006m5v-F8
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:13:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a300876-e002-0a2a0a5209dd-0a2a4504df92-30
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:13:24 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a300882-1dec-0a2a45040019-d155dd2be589-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:13:22 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-46066e640easo1965456f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:13:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f726sm32610829f8f.15.2026.06.15.07.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:13:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1781532802; x=1782137602; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=81E6k+ygViV9U22cpFsmJTigOesewusphjAS3Y1bdII=;
        b=Cc3dRRzcXvIAJpXIK3teMhqPV0/n6jMSWdZBP744K/JeOWMBAGUVRzZnFtzC+7SFm/
         y2nxjkFSzJmQ11rcZNMbH64VjenjqF6HZYGyqQxmftzQGeawPkUX6IiB0VTWSDF12VvV
         hJmJUPxwGmOjrlrTbQgtLfqc7I4DQVwIzEGwnvVGD0KT/oNLTX2g9u0VPWo6anbo+SMC
         vqUwlbMbktN+z9aLqwspMiaPrz+A4t9pYvVabwQh8IuO3rGcJNGxYiJNznf0xwvNDj+O
         enzK4z2BLwmzMzMNHVSMvlCrHa8NMDQN9nH1dSSQIpdSm+qkmQb29LheL2+2gk9LqbsC
         nQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532802; x=1782137602;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81E6k+ygViV9U22cpFsmJTigOesewusphjAS3Y1bdII=;
        b=d+JwSVMP+UqRDcDgLBLU3blxJ1lKz0r2K2dEE0o99UCqEqWj8taFO8AF9nVdcbxlYi
         y36810Kx+ra39MxVedFlv+XLKkXBS/3VNVnw0lI8NDa3+Dj7HLMUMKHffs/+mb7u+bZz
         nuNEp+9olE0816Skx5syEsf6NWCshdjcpWUU8/7PghkeKFa/rWawvylSI3IHpntgWOyJ
         IdqU2LMUiMBu+5QTGoefRtdZVmFjXg7o8mGF6XgNdwdPvx2cLcoEiiKbfE/kVRJqL/Zc
         EOyI+qAhs5AikeY+MtE5l4XBlFH9BGLe3zKwk64v1t1Odg/bsFeIwuVFRmRI9uUU89/S
         u3qQ==
X-Gm-Message-State: AOJu0Yx6PHCXcaiv7hJrMlIisBzr17S+yZNouRf1+yLAt6fdQGB1w8oi
	Ro7W/a85WwaNJ1JFES/Pn/OgjZBGiT4yCwGwzSzE4aWqyv3p87LYFaKyEwh1wTY2/FtbjsYT0rG
	SwQM=
X-Gm-Gg: Acq92OFMCLLpmDwrr3r3/wxNDP9GK9+gSbU3SvQgCSDwSD5FTzP85a0XWg35VwM4uu0
	rcx5s5SeRbHTPq3d+FLyNiXkBObghD25iaSmKCpMVWVqt/h+Chpu82pXjPZ2ktH7ZhdDY3eQ5dD
	Jfjn6KU00udEBje5hK0JzZXTCZSjCdGZyhPvh1Wv8o3PKO8rp8+LKUwKBTRhpE/sPcbWi+mPG0L
	4flz3w62uwKYEAurFwgXRx4k1MBgE+4MqGKwN1dlZkTR8KkrztMa3Nu0dFl4Gbq8rS5wxvZpZsC
	gE7/fH/jb/IxFxjRFnlvC0utbSw+MNbdy8nBV0xAcZrwPWhQA2lKYGm/NF3XGe0R8BPCvanku8l
	+ERTHpFuImHZ+bnvu0o9WTD0mCT4j0xj1TvRFKpRPpYVCgGXNk7VqHw8E3SeLLdTOmFw0RpFkxH
	o7H2xtS9dzctJg3IUSRD7FMrcEm7tfpZO/ZonJ9q/dNrVeTq7oNsPU36h5c8DSMq0IkWAqGlJXI
	vIl3FU4j3hZZdU=
X-Received: by 2002:a05:6000:1acb:b0:455:fbb:28bb with SMTP id ffacd0b85a97d-4606dbd7797mr19395256f8f.35.1781532802026;
        Mon, 15 Jun 2026 07:13:22 -0700 (PDT)
Message-ID: <ebb489d4-0670-468d-abd5-8d130636ef45@suse.com>
Date: Mon, 15 Jun 2026 16:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22? 4/9] domctl: error code adjustment for unpriv
 callers
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
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
In-Reply-To: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781532802-2B96A3FF-C8C9C551/0/0
X-purgate-type: clean
X-purgate-size: 912
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 237E9686FCF

Unprivileged callers better wouldn't be in the position of figuring out
domain existence from error codes. Adjust the respective path sitting
ahead of XSM checks to produce -EPERM in such cases, just like the
subsequent XSM check would yield.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
With more lockless cases likely to appear down the road, we may want to
centralize determining which error code to use, latching the result into
a local variable.

--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -356,7 +356,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
     default:
         d = rcu_lock_domain_by_id(op->domain);
         if ( !d )
-            return -ESRCH;
+            return is_control_domain(current->domain) ? -ESRCH : -EPERM;
         break;
     }
 


