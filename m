Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDbKMvtde2kdEQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 14:17:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F46B04D2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 14:17:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216468.1526424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlRtu-0006hh-W7; Thu, 29 Jan 2026 13:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216468.1526424; Thu, 29 Jan 2026 13:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlRtu-0006g0-Re; Thu, 29 Jan 2026 13:17:34 +0000
Received: by outflank-mailman (input) for mailman id 1216468;
 Thu, 29 Jan 2026 13:17:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlRm8-00038i-7Y
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 13:09:32 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf433566-fd13-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 14:09:30 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so8666835e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 05:09:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-481a5d4b5ecsm4080235e9.2.2026.01.29.05.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 05:09:29 -0800 (PST)
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
X-Inumbo-ID: bf433566-fd13-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769692170; x=1770296970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K7IkmbOcHe05WP2EwO1MxrERnpyx6lY4fuz+tGdEjyM=;
        b=TSM6LIAgtYMAVj+7QVxEfHVxAiYpj28bBpEMKAO3kSoz0hrp0iujaxE/Cezj7c0pUF
         KcAh20VPNKHRPqJzo979qIfsDJ0QTJIBQeinA/rTq/ZtpqZpmlsz5BeRekQcdHPcHXH7
         4jn19Xx2UkLICeAJPizH/ilaOewx+rDjBaCgLTnhwTOACKFhrTPn7M6xD1GLNou5mUqZ
         mew5vM/3LDVpw4ZLBiKdL8gbX5WFXJ5ve0Ayvx8/e8KFirKudk1W0RraYBLfxnskLD+a
         0BRvEindFLWXPIivVrA1JNFW7s+8vnm4Tfvh1wLoHQxzyEkjFw7IfwfCjGz7dnEJU4C1
         epyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769692170; x=1770296970;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7IkmbOcHe05WP2EwO1MxrERnpyx6lY4fuz+tGdEjyM=;
        b=aO84B064M6+JOPyTZfmjndgv4WCHNgDl+ZHg28zOvU+x2nLnxwtoRe+3OIm5o3KQFu
         aFTAgAzbOOTPquC0iqYCmKhxw039mW7WFxUJNsNftqufBBWotlfuKZ8UEe/OiRQoVcHr
         Kgw9/diX0vAVKRopwTZ0N/eTmeGrGdLT9ZI2H1AFWWSarwJPWh2WrOs7g2RhLBG5woXS
         HBOKD0cw/4YMFrZfM2c16L2E+1KOabWMX7lp/mFVZo/bjhmCE4oHw2jLUy1hquGt+10T
         13mwp++7haoWrhPOSkcK41VD7d0g3h+xuDi8H7GTSavWulDsjdOE52X9FxrnIy9mQGzQ
         QWww==
X-Gm-Message-State: AOJu0YxYzQHVbN/yg/0eL9BNBPUckkRuQF93quX/Fjcwpk45i3O8X1GB
	yftTslBUneCokr/M5MJ3DYDNWfcKyaUui7YIJd4tUdqH87U6AhYUzmErKGxo7J3I+MtBV7J6++L
	GfAw=
X-Gm-Gg: AZuq6aLAPBD1B0/bErmgIjZrfD0sMF0O3A2LmRgfYW/0ehLawD0UZngOdMJwFqywDOQ
	Oku3aplHOYA9Wrx4exPeoMinw8iIJk0Pp6/Im1+ZoIQpwv3PyW9wGmNF/but8EKHxCLYzoX22Y+
	GzW4CNG0SQSykZFpGBlVwtD9mX1x/bObiOjRzUOx/wqmybCS4lEVqNhegsydSca0QGtGYML+q/s
	hJpMw98FRnQqY+bkP6gNKsHZHfDmd/sH0FKk96UmWGieyhdXkuJHdY+2TmjtRYaSbYqJM8WwCA0
	g9fLU9rBB38qmwZ3VKpgas+tQbhV/YQEitZSUqVhHxW+TW6lT76NE0RlPKV7BIMHl5WTDlGYo5J
	NYDEZ797cqmy1mM9ZCigkD9igXS5Ow8dHf8OotjJemiki2NG6FkB+faJWDbONLB3pqF7JKewQZA
	2v+UYtIxJbOMhwElm4MuflhJbNfg8A2Q+jjRoZz6L8/TFHwnty91iRObSuNC96LhF7wlz1uL5xq
	yo=
X-Received: by 2002:a05:600c:4689:b0:477:9574:d641 with SMTP id 5b1f17b1804b1-48069c5bd29mr121741155e9.22.1769692169912;
        Thu, 29 Jan 2026 05:09:29 -0800 (PST)
Message-ID: <d7ef6302-9034-45da-97d7-25c76204b2fd@suse.com>
Date: Thu, 29 Jan 2026 14:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/6] vPCI: really no ext-caps without extended config space
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
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
In-Reply-To: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 85F46B04D2
X-Rspamd-Action: no action

For DomU-s, whether to emulate accesses to the first 32 bits of extended
config space as read-as-zero or read-as-all-ones depends on whether a
device actually has extended config space. If it doesn't, read-as-zero
isn't correct; not getting this right may confuse functions like Linux
6.19-rc's pci_ext_cfg_is_aliased().

For Dom0 this then simply allows dropping a later conditional.

Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Move code condition to top-level function scope. Eliminate a later
    conditional in exchange.

--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -829,6 +829,9 @@ static int vpci_init_ext_capability_list
 {
     unsigned int pos = PCI_CFG_SPACE_SIZE;
 
+    if ( !pdev->ext_cfg )
+        return 0;
+
     if ( !is_hardware_domain(pdev->domain) )
         /* Extended capabilities read as zero, write ignore for DomU */
         return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
@@ -841,10 +844,9 @@ static int vpci_init_ext_capability_list
 
         if ( header == 0xffffffffU )
         {
-            if ( pos != PCI_CFG_SPACE_SIZE )
-                printk(XENLOG_WARNING
-                       "%pd %pp: broken extended cap list, offset %#x\n",
-                       pdev->domain, &pdev->sbdf, pos);
+            printk(XENLOG_WARNING
+                   "%pd %pp: broken extended cap list, offset %#x\n",
+                   pdev->domain, &pdev->sbdf, pos);
             return 0;
         }
 


