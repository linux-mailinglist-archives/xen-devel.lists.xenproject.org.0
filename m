Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEZ/JbidjWmD5QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:30:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6312BE12
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228543.1534689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqT1g-00033J-3n; Thu, 12 Feb 2026 09:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228543.1534689; Thu, 12 Feb 2026 09:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqT1g-00030L-0n; Thu, 12 Feb 2026 09:30:20 +0000
Received: by outflank-mailman (input) for mailman id 1228543;
 Thu, 12 Feb 2026 09:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqT1e-00030E-66
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 09:30:18 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70ee290e-07f5-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 10:30:17 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so65495345e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 01:30:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835ba506cesm50646885e9.6.2026.02.12.01.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 01:30:16 -0800 (PST)
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
X-Inumbo-ID: 70ee290e-07f5-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770888616; x=1771493416; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RKD3wn7kJjNvMSd2tMowir8wdXG0wEPfR9zOOXR/l8I=;
        b=GH4wm2LAXXqiYSUiUpmnJoFco7CTI08usTVdyVt1fayjX1vu6O30IJDpSPvjuaoY7J
         SB8dJzjohBwmLILa/e017Q+CK6FT+L7Wewr3dBT8bzx3yn0ZLSTxj1wYWPI6JQ33/+Sl
         y+4f714t0mn9ISZMhL5WqM3ynUiFKzVQWkcNS+sSJ7lqr0lMnjjdBdMPBmkFwm0wROZD
         SCB3UaK2utwXXKHQ6dB4jQjhTX56LnKGa5tREUuztLOQR+Ka9KuE0DFxm4g/d+LiuKkg
         RkUpM8ZEav8ikS+OL0l0067gcN2E5Ko2ntmVBKBdd/ZD9sJHqecjKnBtfVb+FFmACQHO
         2ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770888616; x=1771493416;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RKD3wn7kJjNvMSd2tMowir8wdXG0wEPfR9zOOXR/l8I=;
        b=mg+uIY7V+9k1jkRVrghC+7D+UHGQoeqUOFWCoZL7CYbMr86XSyQgcDMFcwI0bFXqfR
         jvpujMMNL0guav+N8A4nX2hpMmz/XEHYJW6qX6BIy7HF1mdW4uWq9Mb5V3A8ziHuLzcp
         oJK3Jsqsnp0TTglIajgZ1R074bU/AaUtAPZyygdy9QOQWpqg6iDu79iYX5I2uwgJm8ju
         wHODYzj+bv/XcbneKqrnquALxlxL0FdxydSz/inXWzhoB4/HMIEkSHRpCBYVDnZVu6ke
         VPzaE9JTvNJmhmJgfqOuZwAYYVem3UKCSRvSKAgK7rV6h73nFsFFU53FtttfhQ4ie2Yv
         XWXA==
X-Gm-Message-State: AOJu0YzbNzxEuOHhD7k34/eM6Zs6zUQGEaoa+AiYUybZst0pjO8hiVzn
	jjNcFeNs2iwTorXr9tkERFGSpQrnilOOXhNELSaW4ocwWQG4uoV97F2r+A9Ms4G2Mp7W4WWaoLu
	74uU=
X-Gm-Gg: AZuq6aJC0CpU1yYup7v8zQrP/s72YV0kq9/ZKSZgHVexu8Y+nlF7zZYo77BblyoEMXF
	RNu+LNJU02iwZ1w+wcrO0iIsfZXNFJwHTpPr20RptIEw2X5hiZXjNBY8YEQtD5WoM6Qzb3bXHEu
	LlR57bFQGEkOW7X1LrxWlrDvw4aMdoeE5qOPHc67mJ8cI2qw8iLoDX3PuoO5Ro28spDTQd8Q531
	nQVk/PZG6Azu8OFMo/gJJB4+Y1vCBF6P989PTS00JQgqePyFtRg6zHhKRQH76pbK1b4ckLU/InR
	T+FT4uuRqe1MuXw86PZ3fXze4xiJKGKYiGl8iHCNKcFsuq5zHoMaN7jYVMFpo9YsBlftcNuZL9B
	FlYN3oMlgykP1GrB1a+kBc8km56t4jYFdrdcsZVmqwl+JhqVqXWWwLpcNtQvS2W+Uw6n4DmKx2O
	SZtRIVT0+tbfOhegMn2T4O3HCK6i//9mJryZh9lZ3M9gE3XPxLkgG79nGjrNpZXDGXATnqu8Q6p
	aBl4zT81jO+w6Y=
X-Received: by 2002:a05:600c:c0c3:20b0:482:eec4:772 with SMTP id 5b1f17b1804b1-48365716447mr19738075e9.32.1770888616282;
        Thu, 12 Feb 2026 01:30:16 -0800 (PST)
Message-ID: <916b8eaa-f5d3-4255-a7df-95f66fa79780@suse.com>
Date: Thu, 12 Feb 2026 10:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.19] SUPPORT.md: extend security support "lifetime"
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
	URIBL_MULTI_FAIL(0.00)[suse.com:server fail,lists.xenproject.org:server fail,xen.org:server fail,xenproject.org:server fail];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,xenproject.org:url];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 18A6312BE12
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
     Xen-Version: 4.19
     Initial-Release: 2024-07-29
     Supported-Until: 2026-01-29
-    Security-Support-Until: 2027-07-29
+    Security-Support-Until: 2029-07-29
 
 Release Notes
 : <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.19_Release_Notes">RN</a>

