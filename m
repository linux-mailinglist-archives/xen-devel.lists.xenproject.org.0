Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJDqEabgnmmCXgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:44:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF851196C6F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240633.1541957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDJa-0003bA-Pq; Wed, 25 Feb 2026 11:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240633.1541957; Wed, 25 Feb 2026 11:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDJa-0003Z5-MQ; Wed, 25 Feb 2026 11:44:26 +0000
Received: by outflank-mailman (input) for mailman id 1240633;
 Wed, 25 Feb 2026 11:44:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvDJZ-0002tl-Qn
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 11:44:25 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5537a146-123f-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 12:44:24 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-439857ec679so1690940f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 03:44:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd6f19f5sm154793855e9.1.2026.02.25.03.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 03:44:23 -0800 (PST)
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
X-Inumbo-ID: 5537a146-123f-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772019864; x=1772624664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F4vS9yj8ZbkDhyH0h+l80l5O91ePGrjIYaOjnrsaMT4=;
        b=P1VdV8pG1MEgcpHbPnzYCAY+08dufnw9qQ2P4pwCW/faAYczJnBkO48gWvkThWPCig
         Z33s5TZEmHGcCKTfEuWTNS3V3FIEl4f4AswUV8iFMPXHwAYRmWN7r8R2/+8eP9r6qdFK
         c3IsZuQ3W6c0HV80gtVSwLZB6Ef+/h87P5W/Io/7NyqzLwGAZXse4RtvM4BShtgR+kpp
         jCbNBig2ARF+LrIb+mPgCoecUOlTlHpLDyZ4dxq5o7pKYAStWpApx+7aql5vXfqLUXZO
         LobCP7I9ywEWB0KLk8bdF4ZacLH8bgWCqlldSeSdpoQ4kID/GxOkWR9n87zYhD1zcG34
         TGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019864; x=1772624664;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4vS9yj8ZbkDhyH0h+l80l5O91ePGrjIYaOjnrsaMT4=;
        b=g7FvXB8G7aM+X/Wwe8xUOMDv1Kf3t9DUNJjJHklxfh/Uj6Vm82VDHFYwb6nEtffpf0
         i9W8crBfQEGkuJsXDkjIsp2I/ZYHuBRdM8JEYoZYWK5ao/U/kfCAGtm4XscFMDnq7bNV
         MEoBEqSSRIv6S9YJWEYVFwUieG2qkoo9kPG+vlMySIAQj6bkeM8iF/Gb1OumtzEV98wF
         WT+73/QZfJ4vHocbmmV07ILc+y+fB8ZO8zConVqQwZWK7mOA8BnYL5cDF4xPwX7/2dfL
         gM269VCUXjdsmzFEpsC+1eByy4gTGzTAtZy3enQRwq+nM9YkiW9vBMaYxkDvnMe2h2Wh
         pJvA==
X-Gm-Message-State: AOJu0YzgWKfMMJzGBhXkFIy3U8ajK1nHSYNYJLEpWeN1aUP4rCdOVkGa
	XboETysJspKLOCCJFuHrwGqmJ6uKGs5ZPN1B8Oz99ZQkVgHggOYIu7trNky6zS8aYxSQ798WETm
	G3e4=
X-Gm-Gg: ATEYQzxIjblR7V2I5PgPkG8nwSyjzJnmauTto0aLcEbu+M4XliPHRsx2MM9//5Uo7gO
	RwevQS0rSa/p3rYASZUacKlwGVxgZnnNK1pYN+xAB5bAb+D5fs2/1jI5cJZHvVbrUWPo9cZ2aWG
	evN7YcSm+M0QsZ6/qJlsN+KyzaJ1xKyu84h93HFvbBPJFAELub0MUfejRUuhSLtD4BfWZvzgxY+
	JCVnP+6vsaUI936qKoNP3JaKrtERBvztC6RBCrgCFTRwt6hBW1Iq4Oz9eTkWHo4owY+SUOKRiDH
	B0QJuca+Dt0kvNsYtTkpGWBhy6gA3V8cX5Z2jqChEQJYA20qjl9y/pIfZTJP5JXmtwY5VGFuruK
	FYetdxlfw7nQU1mk0lI/0brMyanL6K/Idb7kCCB8cGOG5t9YiPkNFQJ+SacpkeB5LhXQzImW+YB
	WggjxjWyzxWHV113MEr7bKNnbFILDluYK5MLwhjCDChq2INC691Q2jeKyaW7LFW3Sw05LVGLt0e
	sbl8YSrE9Q2pHc=
X-Received: by 2002:a05:600c:5397:b0:483:56c4:73ac with SMTP id 5b1f17b1804b1-483c216bf67mr1163205e9.7.1772019864193;
        Wed, 25 Feb 2026 03:44:24 -0800 (PST)
Message-ID: <252e527e-dcb2-4710-8a43-070c49512e00@suse.com>
Date: Wed, 25 Feb 2026 12:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 4/5] vPCI/ReBAR: improve cleanup
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
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
In-Reply-To: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: BF851196C6F
X-Rspamd-Action: no action

We cannot assume extended config space to (still) be accessible when
cleaning up. Necessary value need caching instead. In fact, as the caller
also cannot look up extended capabilities, the cleanup function needs to
cope with being called when there's no ReBAR capability at all.

As kind of a side effect nbars being 0 (which init_rebar() doesn't
explicitly reject) no longer results in a bogus call to
vpci_remove_registers().

Fixes: ee459aeac096 ("vpci/rebar: Implement cleanup function for Rebar")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: New.

--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -53,17 +53,12 @@ static void cf_check rebar_ctrl_write(co
 static int cf_check cleanup_rebar(const struct pci_dev *pdev, bool hide)
 {
     int rc;
-    uint32_t ctrl;
-    unsigned int nbars;
-    unsigned int rebar_offset = pci_find_ext_capability(pdev,
-                                                        PCI_EXT_CAP_ID_REBAR);
+    unsigned int nbars = pdev->vpci->rebar.nbars;
+    unsigned int rebar_offset = pdev->vpci->rebar.offset;
 
-    if ( !hide )
+    if ( !rebar_offset || !nbars || !hide )
         return 0;
 
-    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
-    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
-
     rc = vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
                                PCI_REBAR_CTRL(nbars - 1));
     if ( rc )
@@ -121,6 +116,10 @@ static int cf_check init_rebar(struct pc
 
     ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
     nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
+
+    pdev->vpci->rebar.offset = rebar_offset;
+    pdev->vpci->rebar.nbars  = nbars;
+
     for ( unsigned int i = 0; i < nbars; i++ )
     {
         int rc;
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -135,6 +135,13 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+
+    /* Resizable BARs data */
+    struct vpci_rebar {
+        unsigned int offset:12;
+        unsigned int nbars:3;
+    } rebar;
+
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
     /* Guest SBDF of the device. */
 #define INVALID_GUEST_SBDF ((pci_sbdf_t){ .sbdf = ~0U })


