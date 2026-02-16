Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCkpIss1k2mV2gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:20:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3992D1456C0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234268.1537571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0Oa-0007hk-Mf; Mon, 16 Feb 2026 15:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234268.1537571; Mon, 16 Feb 2026 15:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0Oa-0007gJ-Jq; Mon, 16 Feb 2026 15:20:20 +0000
Received: by outflank-mailman (input) for mailman id 1234268;
 Mon, 16 Feb 2026 15:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vs0OZ-0007gB-OP
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 15:20:19 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff9b04db-0b4a-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 16:20:17 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so3596542f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 07:20:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d8334a8sm482769535e9.12.2026.02.16.07.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 07:20:15 -0800 (PST)
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
X-Inumbo-ID: ff9b04db-0b4a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771255216; x=1771860016; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqPJRfAuuc4mR7oxi/5rCForRC4R+jusPwWyInbjJ4E=;
        b=OYnCIVRk1mzoH5mA6M74wrPj6LipdrHKQCttNatxbo6aaQhccxR48jUGFcZrziS0Gl
         ipjGeGboBP3gp8/RPWbG8xgUflzSc2lEZ9Cyy4/fvOzEl1+jOg+TnU1jpbx2sCpoXVsk
         AVRuGvxkiUDCbtuNTf8JBo/LEbAJACFR4BdVuk1QnwMHQlxYS2V94KKKNA+rgQmCt7sQ
         Bgh53NeDgoe4gMokp1znb+4h6LOE3tAuehILUoCyGqM2/WGrmUZm+QKK0QEbTlPzX0tj
         r0Xj1dbqJ2wXvi6qPV4A7gHtSeXQX/xkVYJP3vO0XpgN6Nqs4BUmlI9YQdpFagN2bZYi
         FT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771255216; x=1771860016;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqPJRfAuuc4mR7oxi/5rCForRC4R+jusPwWyInbjJ4E=;
        b=jp9of5e3plgxDk63VXa9ZQTSsB9AP77/D/+iSq9G6yrOyayLK/MGJMuZeclgclGZQX
         XkMlTZmQdeeLVEu7vNbuee+CpaVZp5hCPn9Yp9ZaPzxGnUIUKHrfn/9P3pF/y+p8vbs3
         Ih8qHTeyH6fufQqtgi2jXQWfDWa1j/2P1AHNOLyQmoPZRsb/2lqJz9OgTRS23QSdK6OL
         mxGClCYQLr5JN6bt8qJxr5on5jAs5JVvw0b6oV7nLpCwWWcDW0kfB+zwMg2OoRTYUEGN
         upz5Fhu8QO6s72R4XBNigb//YWiIdgMCyAJLKXr4pF30yHuaNMiW/oteALOHtEIUkQmi
         Ekeg==
X-Gm-Message-State: AOJu0Yx5a3HW8dMoSvBTWLm5TH5qt2CiQOslwmXMf/e2burLSwxZcCsm
	yIG6/jf0TSxbir6eb3VYolcDEVtHmrbD3O0w9J1tFHGofE/jbZDijwxxVTIT+QIj/OQW214pxoN
	4NEM=
X-Gm-Gg: AZuq6aK/sgIxpPZddFc4a/ZVOhPOpFSy40MxhNREULYPIPoq8L1w26fh93hwkfZPSb6
	UG2nnCXZBquTXkVf3jcxTvthDrqkv2segsHfNnlKX1Q+AphGloVTsHFhxZtfAOMdml6ieyTnYaT
	kE5I4AZt72uerGxf4+4/f069Ks7FnVnX2GaH/AGUkr/gP8qDifv/gzrVgAgU90CgvXTAA6U2bR0
	VM8rFkeFnQhiC4Lnl6UC3q+yTUwZbziTWQvQY58Kojg/q6uuXgl1/WuZ4P5iLpxbIX3oLClTsTQ
	g0YGm/a2yp0IfMeO3NIqtDQODJyYuSOf+LQGCA2gPO08OYSjd4SJAEPsvHpRnd92mJ1s7xg5GGD
	KRdcF+5cmYK4GGc8wgIvVuHULOm6WSIwKj4cqRgH6oO4P/lUTG2NXPrdYhegTxd6CpMbPg7IW8l
	Qc1pYSjEsa4ygrdIiNGVSVzH09frgUrhztc6TSOPUZBxMLE0+znLirLx6QoWeYoSArtnOQqnzrr
	JX/AisZxvs7n9A=
X-Received: by 2002:a05:600c:468b:b0:47e:e981:78b4 with SMTP id 5b1f17b1804b1-48378d9ccd4mr148844955e9.12.1771255216335;
        Mon, 16 Feb 2026 07:20:16 -0800 (PST)
Message-ID: <1d898900-1072-4ea6-ac4c-1262905cab29@suse.com>
Date: Mon, 16 Feb 2026 16:20:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: tighten translate_get_page()
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
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,epam.com,arm.com,amd.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3992D1456C0
X-Rspamd-Action: no action

Permitting writes when the P2M type says "read-only" can't be correct.

Fixes: 1661158723a ("xen/arm: Extend copy_to_guest to support copying from/to guest physical address")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
What exactly p2m_ram_ro means on Arm is unclear: The comment next to its
definition says one thing, its use in get_page_from_gfn() says another.
(I remember raising this point before, i.e. it feels a little odd that the
ambiguity still exists.) The patch here assumes the comment is what is
wrong.

--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -44,7 +44,7 @@ static struct page_info *translate_get_p
     if ( !page )
         return NULL;
 
-    if ( !p2m_is_ram(p2mt) )
+    if ( write ? p2mt != p2m_ram_rw : !p2m_is_ram(p2mt) )
     {
         put_page(page);
         return NULL;

