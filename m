Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qVOwIfKcjWmD5QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:27:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D0212BDBD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:27:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228533.1534679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqSyX-0001Rs-Md; Thu, 12 Feb 2026 09:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228533.1534679; Thu, 12 Feb 2026 09:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqSyX-0001QO-Ip; Thu, 12 Feb 2026 09:27:05 +0000
Received: by outflank-mailman (input) for mailman id 1228533;
 Thu, 12 Feb 2026 09:27:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqSyW-0001QG-61
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 09:27:04 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd1f6fee-07f4-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 10:27:02 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43622089851so2727617f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 01:27:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d30d9csm10083373f8f.1.2026.02.12.01.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 01:27:01 -0800 (PST)
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
X-Inumbo-ID: fd1f6fee-07f4-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770888422; x=1771493222; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MHDrVncJbhMbEdu5PTplUAZkgHCPM4SFU7nH7X5cza0=;
        b=ThxHT9r7wS0jkLU6cZ0Eoazz+HyWo5POo4vQgkDCy0+sDbI/n80p33u1lNEaTNhLph
         6KP+fGL3U9LPAMSKhqWBXOaG55L9x7tm9HzHjLdrftqYNFgyZ05/8YNSKgNhsZQ62lxQ
         +RXoSq1ua/BSdzLG1iYs01695OIg8NLbZNeCXW8zDS9O4AQACSL7vDiyM2RUo1qiVRNg
         MgDNzKIdNtIplJzsjs2aiFcTdo1+1JaTZBhOzm1TJqSLfx08Z+uqRpjVIqDmzdNyII3m
         n7mmF6pgXeT6xFgm2d5hEOZtLY6ep5sVSikKkDEJIqbGLm60Y/Cm7y7dlncwstVVldxa
         7cJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770888422; x=1771493222;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHDrVncJbhMbEdu5PTplUAZkgHCPM4SFU7nH7X5cza0=;
        b=l5oufv/ve/rZhlgpEiI+1LgFUIcVpRKPt5lKu0pgDHOiCocamXTJzIJiNUf5mOLqMw
         t7NvYaxePfsix5Q5GjD9iH4zsZn528kx5FQur2jTjpdTU1wNCWCSxo8qOz4R8XXBBMEZ
         8+bfAugPKc29Iai1MlsnLGkiLBV1Q69LrmgBDQkNzAyJuH4+pi2iEz1qX/0aSSNK2pal
         JmOpbH9N+Te0/2DkfbLwctv2TiZsM8VBWz4xwZv+hQ9RH9kLFuU+yE+iZmetbeIlcLTA
         6j0xyv+GTuFF+xsaO2jvmCIEBTNqqnTFCEMyq9MolRhV+tAT8Bfv2N4OzSV5BmLkEo5d
         XtJA==
X-Gm-Message-State: AOJu0YzSJlUhWN9QqNWxTyIU9p3FREwW2dC74CkEKC15fLvVzXvxdzK9
	GGHRCvX5FWI42dZhShSEcVGv3v4CsuZy7+yM8TS/ExrsIONWfxCyDqtMjA9KELDs+jx8+Z5KlDI
	L6hE=
X-Gm-Gg: AZuq6aKkiSO3MQ+tjA0xUZb5E5zDThEOjK0bCnefKH5lUhAca6PkMzaoCbrT+DDS1lN
	D/0V5285CKMYGFaF+OViIDaO5G+Mrb9Ow1eE9nJyAqJ9ZmHuvCtrKUyJN9g/yadM/zD9s6k1i7K
	SmMyPBVpwclqcjEqbjPGEqNrPvHExQMXD87fbcngRND//cAZfXaiP2cB+QVKissYdrkJwarejm5
	sG6+chG0AGryvRR5jt3vht6qtP9LuZKs7hqHstpkbiGLOW32om0Mhb6EKAOQoCbvRYPGyAMISwz
	SJG8lZAmp5Is+FAwdC04QowTojZCtTByJ1qiAIKsphwYieKZbyunyzjIWh9FrVFXUdoBkkhUy6D
	T/zYy5ISvKxO53jaqfI/G8aLU4OeXO3uyQir92P6fIESJJgK1hztIKgEYeF6nFrLMk5KwbvurC4
	ugXHrSS08fEl/kYlY34FJuTeZvUl/eh4lPts3O2DWh+WiCteoCGvggY21yaeLzv8qAd20Wudplb
	D/f/T/j3QRDiR0=
X-Received: by 2002:a05:6000:220d:b0:436:216:98d8 with SMTP id ffacd0b85a97d-4378f1051aamr2510327f8f.12.1770888422002;
        Thu, 12 Feb 2026 01:27:02 -0800 (PST)
Message-ID: <b2d6108d-0035-4187-b83e-b63519d5cbac@suse.com>
Date: Thu, 12 Feb 2026 10:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.20] SUPPORT.md: extend "lifetime"
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
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
X-Rspamd-Queue-Id: 33D0212BDBD
X-Rspamd-Action: no action

As per
https://lists.xen.org/archives/html/xen-devel/2026-02/msg00630.html.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I would have preferred to reference the xen-announce@ posting, but the
mail may still be stuck in moderation there.

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -11,8 +11,8 @@
 
     Xen-Version: 4.20
     Initial-Release: 2025-03-05
-    Supported-Until: 2026-09-05
-    Security-Support-Until: 2028-03-05
+    Supported-Until: 2028-03-05
+    Security-Support-Until: 2030-03-05
 
 Release Notes
 : <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.20_Release_Notes">RN</a>

