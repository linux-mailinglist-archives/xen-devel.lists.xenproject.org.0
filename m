Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKmINiJrgGkd8AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 10:15:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFD1C9FEC
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 10:15:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218429.1527173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmq1N-0003DT-TA; Mon, 02 Feb 2026 09:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218429.1527173; Mon, 02 Feb 2026 09:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmq1N-0003Aw-QM; Mon, 02 Feb 2026 09:15:01 +0000
Received: by outflank-mailman (input) for mailman id 1218429;
 Mon, 02 Feb 2026 09:14:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmq1L-00032w-Sn
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 09:14:59 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4f93735-0017-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 10:14:57 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-48068127f00so35491865e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 01:14:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066beeaf9sm468091395e9.6.2026.02.02.01.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 01:14:56 -0800 (PST)
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
X-Inumbo-ID: a4f93735-0017-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770023697; x=1770628497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cByf7Yt1CtIIDM1Ff10eXp+WJKmaWj/GQ+GyIsIKMYw=;
        b=NiTmg5IuZzDMJhdkEYI2blHv9IvBVshkrIiM4cEpCqJ85EiGWOaCIUMWflTpNezDxP
         BiF4kI5g64xdF4qK3pJI8K8g30TwASiDqKGoQfqktjUirAtoLxPuv4PwPnS6e7JhxykC
         ocE4Dbz9vZv5WK5YTrd+7DvtgxmLKKiNicwnMpdtLHygRjm9ucHSazcfy+f9QzfoiATF
         csPQZtVKOBs5eqr9krmY0EmzaIcU1YYaeZkFkmlmxS2kPKTTeSO6zptqzPM14GmmrmNK
         9w2m3cUYlLzsUvwATFBK7GJqDPUnSM786BfU1tQ4Bkt1rh7wmH/Fn4U4ZT1gb6B+Xaqq
         LUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770023697; x=1770628497;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cByf7Yt1CtIIDM1Ff10eXp+WJKmaWj/GQ+GyIsIKMYw=;
        b=AD/WpiFrSFL4c6Ok8w/kLo1xKViS6TkftqvQOmYP7+T4CaRmoBKINGopYFL2m0qLR0
         W7KeEe7qMwEZekVS8CPNBYrWLk4G4WVRPssYKqvQuSTMRxYrPw0syfBZeunaAiRF+lCI
         Qr59TcHkNpza7C9DG9QveeIpW1tTrF2zZabrkaroshnQqBNUmlsEyx/BgGcHnr/mB4K5
         6uOXS4AENo4txwdUG7KSxcQDWO91S8XqYZzPrGvhwkqm6x3ZfEEMR5tYjqXc3dkMPgmx
         RYvS2ORhFUehLdoZxvdm+gL5ffWAvUJ0h/lyFeFW2VDXlXwtGkZEJOeNxOQYi9lW/MmA
         01TQ==
X-Gm-Message-State: AOJu0YwrK0Ll6pqiJZFEWbm+11T9tyTeuStx6yrTcZQfExIWs6ZrHriw
	6nncZv1ehm7bBqwtnaWOcFSVY32wleWtTOBOpXxDKmivPz1Uv9AvshMqVD4hCRaj2wTDSl40/hF
	KGrXpwg==
X-Gm-Gg: AZuq6aI6muYUy8afJbJHtPkG8jVtfx2Owacms3WaW17qN2VF1a5xgw/AotTQ8mMIfa4
	63gnmYLh1r3eok6qCSVk5A/ynmy9RX9sr1hGa1jCOPWwUZ0D28GPSISqA0tOWmhvfkTzzkUI+zH
	ZHOm/1pKv8PTemmpDAxfTWmBp6OtlugsjgmDamWMffxMLFXtJzBAXiJyj+m98zs+PKqRpkHsevK
	XZI2SXd6NcvgGqloc6q+ugOXVKFXenghFtKVJxfvXE3F9Q9aDFQzJ6NiPJo6lHaoO0tWjvDmTH6
	JKKB20YFYj6QRPyoO6t1rd0O8OYLjtpszkAzYHUPe/mQTAMjILmxUgIUG22IoZ4WBl0JmufqpwB
	7wVodgNk9bixzZLeHGJ4GWeJktGhn6s9M4iki/s8Uc4DXHru7MJrtiacXbDBgPdLw0YsAlVhF2k
	pExAFZB8zN5JjaJNffAasYizUOPcfA7RzXZK37TTVrNewRVpsFFSZTXd1z5IX9ofdHrpE/xRK0u
	hw=
X-Received: by 2002:a05:600c:8b05:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-482db4a5133mr142222615e9.33.1770023697188;
        Mon, 02 Feb 2026 01:14:57 -0800 (PST)
Message-ID: <0873c6e6-eac9-4d9a-bde0-347050b1547e@suse.com>
Date: Mon, 2 Feb 2026 10:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] PCI: determine whether a device has extended
 config space
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <99d45a27-ce67-4f10-9883-dba96f055285@suse.com>
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
In-Reply-To: <99d45a27-ce67-4f10-9883-dba96f055285@suse.com>
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7AFD1C9FEC
X-Rspamd-Action: no action

On 29.01.2026 14:08, Jan Beulich wrote:
> @@ -1042,6 +1053,79 @@ enum pdev_type pdev_type(u16 seg, u8 bus
>      return pos ? DEV_TYPE_PCIe_ENDPOINT : DEV_TYPE_PCI;
>  }
>  
> +void pci_check_extcfg(struct pci_dev *pdev)
> +{
> +    unsigned int pos;
> +
> +    pdev->ext_cfg = false;
> +
> +    switch ( pdev->type )
> +    {
> +    case DEV_TYPE_PCIe_ENDPOINT:
> +    case DEV_TYPE_PCIe_BRIDGE:
> +    case DEV_TYPE_PCI_HOST_BRIDGE:
> +    case DEV_TYPE_PCIe2PCI_BRIDGE:
> +    case DEV_TYPE_PCI2PCIe_BRIDGE:
> +        break;
> +
> +    case DEV_TYPE_LEGACY_PCI_BRIDGE:
> +    case DEV_TYPE_PCI:
> +        pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_PCIX);
> +        if ( !pos ||
> +             !(pci_conf_read32(pdev->sbdf, pos + PCI_X_STATUS) &
> +               (PCI_X_STATUS_266MHZ | PCI_X_STATUS_533MHZ)) )

To not violate Misra rule 7.2 I'll fold in the change below. I guess I'll
further follow up with a patch adjusting other problematic #define-s in
that header, too.

Jan

--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -382,7 +382,7 @@
 #define  PCI_X_STATUS_MAX_CUM	0x1c000000	/* Designed Max Cumulative Read Size */
 #define  PCI_X_STATUS_SPL_ERR	0x20000000	/* Rcvd Split Completion Error Msg */
 #define  PCI_X_STATUS_266MHZ	0x40000000	/* 266 MHz capable */
-#define  PCI_X_STATUS_533MHZ	0x80000000	/* 533 MHz capable */
+#define  PCI_X_STATUS_533MHZ	0x80000000U	/* 533 MHz capable */
 
 /* PCI Express capability registers */
 


