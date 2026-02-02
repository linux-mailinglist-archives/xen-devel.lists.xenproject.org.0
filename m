Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BLlJwa4gGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 15:43:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11638CD84E
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 15:43:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218649.1527487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmv8u-0006X2-8n; Mon, 02 Feb 2026 14:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218649.1527487; Mon, 02 Feb 2026 14:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmv8u-0006VP-53; Mon, 02 Feb 2026 14:43:08 +0000
Received: by outflank-mailman (input) for mailman id 1218649;
 Mon, 02 Feb 2026 14:43:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmv8s-0006VJ-WD
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 14:43:07 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bcc2db1-0045-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 15:43:05 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-480142406b3so33520685e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 06:43:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482f748a9b8sm126634195e9.8.2026.02.02.06.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 06:43:04 -0800 (PST)
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
X-Inumbo-ID: 7bcc2db1-0045-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770043385; x=1770648185; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZujxPggRInMxlIdEnZPiAkfac72H5gL48apRNHkCVI=;
        b=abwf2LaXgD8WmIyeh7OgCPTrc0y7QQoH1v69lzq1PUxPLhl9f3uR1es2arrPKQ78B2
         dcwXFSSQxPaTvAwEVu+ugpC0sqvTNJaxzvzSnPducxL8lF2TOnZFJRBv+sdYqtFZc0Cx
         LMPtrg290yWuge90lv8vxuWxY/ClFAOR3ZrqDGOrC7FFn2/8emvUXvBoieBPKNLbRBTo
         crWqtleD86nbhLhUg+Jrqcfi6b7rL52icnRf8pMEx2L3H29WLC/kg8Mo/fe9naJZS3hK
         Fru/ao9u+73TC9ctXHdQHq5JudtCiNM4j9Ker2u/lKfs0Sqg4TpkhZayI/34WwYnonSL
         DCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043385; x=1770648185;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZujxPggRInMxlIdEnZPiAkfac72H5gL48apRNHkCVI=;
        b=orQQ2Wufz7N4Sa3Olv5Big6PDJmzmfEyZ/wDdURLrRY3HbD7OYduDu4XEQB7MBt6JL
         Fg3ND6w1aDwil8i8Spm8JxfKybYH3UFqniRrHv3MNt+p5NJ4HH0lU5IlTANqRT/01B+o
         oXHzf+jZIbar/GNl1q5jld72M38zoJHP4YQ0GLM5OAwTdPernkjdzuxdxK+OrPbxRFzh
         s+dCZwYgQTPATY1IAibvg/vg49b2JoU3Gz0733f+YIBs0u1bMR17VtotxVkIHuiRR4ql
         G2xzTPjlu5ELFn9hHSx/khPKXF+Wyp6oxE7I6q/yLJug9vgzBRUNKcrIZJrf0SFzRVgN
         ECtA==
X-Gm-Message-State: AOJu0Yx3JGxdjzZJUe4aTbq7TrlEEpz7JwDgX9T0Q0+0qyTc84+A+yhh
	w6u1QK+pOno9GPRDjdRN2veZiNxf0LazZLlY+BvUFFfee1mnKETOWM0a2er5PrEDFFnxlB6jj5l
	d7x8=
X-Gm-Gg: AZuq6aJejlrzb7YvOkdP4e3/EmLuxtZiaEdwT6v6npEqgq5N/x35jk+PtHqjsFWCOtF
	9tTjrfYzrkonu/mIXhOBcedLsvysmO0CSxFYmVXK8zM+x0Q8UoEh+oAIFLH5ZoILyJorjk0lr3T
	8CLWCdRAxVlTHM3dC8Z1Da0DlqSlxxKAKOv4390p1jh7WO7a6GnA1CJAp36Mc3xtn95zkUbAOrn
	I/6gSjNb4BvOw+XaMmULB/wq8k68Cs5Sh1kHYzts5YgtxKIMYfQ0eYq5zAAH+80ho4hSoSnXDZh
	/heOD3oRy1QWi6HMZOfAJNMU8EoPrYPUR7eRtmIM0xpyOctBVvCwlKhrUDP66PMJxWkwb15APo+
	vRFfu7/fEUZHDV5RpgrwKBr+l1lUJsPrYdcZspiHUehHNoNuTtpCyt3ue58vFIIzfMtjiU79sS1
	SNwirIkptgH6d3lia8zncjYDkApDj8stD1MabRXvlLHT8cgieNXx/4Lu+wlbCNzRElLcy5BMww9
	Zo=
X-Received: by 2002:a05:600c:a30c:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-482db62305emr106744815e9.29.1770043385084;
        Mon, 02 Feb 2026 06:43:05 -0800 (PST)
Message-ID: <f9b84a18-c968-4dfc-8e5b-6c97e7d3a04e@suse.com>
Date: Mon, 2 Feb 2026 15:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] PCI/regs: minimal adjustments for Misra rule 7.2
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 11638CD84E
X-Rspamd-Action: no action

As was recently noticed with PCI_X_STATUS_533MHZ, leaving presently unused
#define-s in non-Misra-compliant shape (7.2 is "A `u' or `U' suffix shall
be applied to all integer constants that are represented in an unsigned
type") is putting new code actually using any of the constants at risk of
then causing Misra scan failures in CI. Adjust those few constants which
strictly require a suffix.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -272,7 +272,7 @@
 #define PCI_AGP_VERSION		2	/* BCD version number */
 #define PCI_AGP_RFU		3	/* Rest of capability flags */
 #define PCI_AGP_STATUS		4	/* Status register */
-#define  PCI_AGP_STATUS_RQ_MASK	0xff000000	/* Maximum number of requests - 1 */
+#define  PCI_AGP_STATUS_RQ_MASK	0xff000000U /* Maximum number of requests - 1 */
 #define  PCI_AGP_STATUS_SBA	0x0200	/* Sideband addressing supported */
 #define  PCI_AGP_STATUS_64BIT	0x0020	/* 64-bit addressing supported */
 #define  PCI_AGP_STATUS_FW	0x0010	/* FW transfers supported */
@@ -280,7 +280,7 @@
 #define  PCI_AGP_STATUS_RATE2	0x0002	/* 2x transfer rate supported */
 #define  PCI_AGP_STATUS_RATE1	0x0001	/* 1x transfer rate supported */
 #define PCI_AGP_COMMAND		8	/* Control register */
-#define  PCI_AGP_COMMAND_RQ_MASK 0xff000000  /* Master: Maximum number of requests */
+#define  PCI_AGP_COMMAND_RQ_MASK 0xff000000U /* Master: Maximum number of requests */
 #define  PCI_AGP_COMMAND_SBA	0x0200	/* Sideband addressing enabled */
 #define  PCI_AGP_COMMAND_AGP	0x0100	/* Allow processing of AGP transactions */
 #define  PCI_AGP_COMMAND_64BIT	0x0020 	/* Allow processing of 64-bit addresses */
@@ -582,7 +582,7 @@
 #define  HT_MSI_FLAGS_FIXED	0x2		/* Fixed mapping only */
 #define  HT_MSI_FIXED_ADDR	0x00000000FEE00000ULL	/* Fixed addr */
 #define  HT_MSI_ADDR_LO		0x04		/* Offset to low addr bits */
-#define  HT_MSI_ADDR_LO_MASK	0xFFF00000	/* Low address bit mask */
+#define  HT_MSI_ADDR_LO_MASK	0xFFF00000U	/* Low address bit mask */
 #define  HT_MSI_ADDR_HI		0x08		/* Offset to high addr bits */
 #define HT_CAPTYPE_DIRECT_ROUTE	0xB0	/* Direct routing configuration */
 #define HT_CAPTYPE_VCSET	0xB8	/* Virtual Channel configuration */

