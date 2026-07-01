Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nj6hE9MoRWoN8AoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 16:48:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F516EEF64
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 16:48:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=TonPrCXw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1350073.1607657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewEv-00027b-Ib; Wed, 01 Jul 2026 14:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350073.1607657; Wed, 01 Jul 2026 14:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewEv-00025t-FX; Wed, 01 Jul 2026 14:48:37 +0000
Received: by outflank-mailman (input) for mailman id 1350073;
 Wed, 01 Jul 2026 14:48:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wewEu-000251-G3
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 14:48:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wewEt-003lr9-Og
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 16:48:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4528aa-bab6-0a2a0a5309dd-0a2a450ae036-36
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 16:48:35 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4528c3-e40e-0a2a450a0019-d1558035c921-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 16:48:35 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so3200155e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 07:48:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4f76a7sm79269095e9.13.2026.07.01.07.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 07:48:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1782917315; x=1783522115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f6RRyZm2oHP9FW10uig6BZI7qLTDrMsOg0vt+/wGgiA=;
        b=TonPrCXw+myyYio+xjGg4zuxR0Fa4fllVBXiP/GdtgxNLxmniwcde/HvHwUCuEBtai
         bj6AzYTWB3ZqBW6s41qbTgqeSRlSD3lF/Kggp9zukWvJ8AnZN7rs9434V9mUkGMaa9hI
         76ETSf0P05K6EZGhkkj/tfxb5vT0nVVynNi8wvza1HGypIX7uOcwZqfPXEgK8b9r9Hnp
         9ukJWV43yqT71qRK4szNNn181QCg1zuVtAEtItT+sonGFsEvKwGX748OjUF6JNeU8eRt
         ElkL/cbUcgkQw0uVAcQPUXMO7ihKszfkO1i9gGhNiSf897uISgFR2bfVwb3mJlyWcjZR
         7rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782917315; x=1783522115;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6RRyZm2oHP9FW10uig6BZI7qLTDrMsOg0vt+/wGgiA=;
        b=OYPJ6Ld0ejdAYiBBTleb//xsn+VLCWQsv1Q7H8AVznV1pJ0/sGeLTdCFJtgKLC9DFU
         L2LnBrU5jkAAkUo55HKwdKjfdoD0lMhjQgIu7qZn3liCIMrRNTUF4dLf0h+lATkSMFxL
         44zKTkzQFJ7kzCEPrBYwDLATV2lGBAkVuP4ZC2uVh0zAtu7PI4HKCQgQG5zDcEgxBoR9
         yLChhQkV1UYwOYb2mYJc8wXBOwPISKR4PHvmgnBdFi2HcGfWU61Npf1ZJhwNtl5ZB1I2
         vSPk4wrLCFtvvGOnoBliQqHhyumAQbhKgyCGziRy2Po17vHhtoMSmydpA4ZwFNi++p/V
         hDmg==
X-Gm-Message-State: AOJu0YwyR/rswohA06LUfZyYA83QJDBYSvy+ZLhuioKMpi6FWC2NSPSW
	FaerZNWsciWfs1YAzRJX2ml3V5z0i6vxyDXpKFJSuTxS3F0ce/3MjUReQhnAAGFtE426/FI/4Hq
	JxXgYiA==
X-Gm-Gg: AfdE7cn46AZwmehu0s88Inn1DXdATYibQSlxQ7gDS4wpidji/nsDA9/v/qrvktm29PT
	bWQqTw9ue2grTxBYznvI7cD9A78noySMSuWYO8oSySs4snCrQQQu+apMjE7bJ++U7s6bmAuFaKa
	bkhIBlXKp5g4D8PbHCFFQg7MRknGmRoE+w0PCvw7t5xTPK1q+QRDGF+S49QmpYLdSgaWzb8hoOi
	zPq/pOyE10l66A7g9MEZylWT5ulhq1qEMyUwCD1r69FFTeYQ8/gvHn1ZIP7p9pq4E9KVuHhlSSa
	ym0RJJBirfO9oDplrupkrWvQGaQzV3sGHOHdcSmEAlecwq46hPyfN9npIINztaJ4+nJ4Ji9kXky
	/tqUQmSE/WFsF8aOiofDdpTSkSe6tH8rmU1LBzOhFI8iMbToqXcVIwZD6Sjf3T+6daKanQTq1Ip
	in556SKesIuwJcR85wYPETj9gR4Pcu/AN+DpXIlWCL2vy0kyXqB3KYkBMuemz2XNoKz2y9fB1b3
	e2XvJ1RRg2DDHE=
X-Received: by 2002:a05:600c:8590:b0:492:6487:a87 with SMTP id 5b1f17b1804b1-493c2ba1f4dmr25417315e9.32.1782917315064;
        Wed, 01 Jul 2026 07:48:35 -0700 (PDT)
Message-ID: <80bc4e83-b767-4692-9ce1-0ebf68d7ab26@suse.com>
Date: Wed, 1 Jul 2026 16:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] lib: make safe_copy_string_from_guest() validate input
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <ba863889-b389-4264-824e-121a5daeba61@suse.com>
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
In-Reply-To: <ba863889-b389-4264-824e-121a5daeba61@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782917315-D492DDDE-00F26FA8/0/0
X-purgate-type: clean
X-purgate-size: 3769
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,apertussolutions.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6F516EEF64

... rather than papering over guest flaws: Strings passed ought to be nul-
terminated (yet sadly libxc hasn't been doing so thus far). This way we
also avoid order-1 allocations, seeing that all present callers pass
PAGE_SIZE for max_size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I can't spot any caller side use of FLASK_DEVICETREE_LABEL, hence there's
no corresponding prereq patch.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,8 @@ The format is based on [Keep a Changelog
 ## [4.23.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - XEN_DOMCTL_DEV_DT's, FLASK_[GS]ETBOOL's, and FLASK_DEVICETREE_LABEL's input
+   string sizes need to include the nul terminator.
 
 ### Added
 
--- a/xen/lib/guest-strcpy.c
+++ b/xen/lib/guest-strcpy.c
@@ -3,8 +3,8 @@
 #include <xen/err.h>
 
 /*
- * The function copies a string from the guest and adds a NUL to
- * make sure the string is correctly terminated.
+ * The function copies a string from the guest and checks there's a NUL
+ * terminating the string.
  */
 char *safe_copy_string_from_guest(XEN_GUEST_HANDLE(char) u_buf,
                                   size_t size, size_t max_size)
@@ -14,8 +14,7 @@ char *safe_copy_string_from_guest(XEN_GU
     if ( size > max_size )
         return ERR_PTR(-ENOBUFS);
 
-    /* Add an extra +1 to append \0 */
-    tmp = xmalloc_array(char, size + 1);
+    tmp = xmalloc_array(char, size);
     if ( !tmp )
         return ERR_PTR(-ENOMEM);
 
@@ -24,7 +23,12 @@ char *safe_copy_string_from_guest(XEN_GU
         xfree(tmp);
         return ERR_PTR(-EFAULT);
     }
-    tmp[size] = '\0';
+
+    if ( !memchr(tmp, 0, size) )
+    {
+        xfree(tmp);
+        return ERR_PTR(-EMSGSIZE);
+    }
 
     return tmp;
 }
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -574,7 +574,7 @@ struct xen_domctl_assign_device {
             uint32_t machine_sbdf;   /* machine PCI ID of assigned device */
         } pci;
         struct {
-            uint32_t size; /* Length of the path */
+            uint32_t size; /* Length of the path, including nul terminator */
             XEN_GUEST_HANDLE_64(char) path; /* Path to the device tree node */
 #ifdef __XEN__
             struct dt_device_node *dev; /* Resolved device node of the above */
--- a/xen/include/public/xsm/flask_op.h
+++ b/xen/include/public/xsm/flask_op.h
@@ -26,7 +26,8 @@ typedef struct xen_flask_setenforce xen_
 struct xen_flask_sid_context {
     /* IN/OUT: sid to convert to/from string */
     uint32_t sid;
-    /* IN: size of the context buffer
+    /*
+     * IN: size of the context buffer, including nul terminator
      * OUT: actual size of the output context string
      */
     uint32_t size;
@@ -86,8 +87,11 @@ struct xen_flask_boolean {
     uint8_t new_value;
     /* IN: commit new value instead of only setting pending [SET] */
     uint8_t commit;
-    /* IN: size of boolean name buffer [GET/SET]
-     * OUT: actual size of name [GET only] */
+    /*
+     * IN: size of boolean name buffer [GET/SET]; must cover nul terminator
+     *     if "name" (below) is an input
+     * OUT: actual size of name [GET only]
+     */
     uint32_t size;
     /* IN: if bool_id is -1, used to find boolean [GET/SET]
      * OUT: textual name of boolean [GET only]
@@ -150,7 +154,7 @@ typedef struct xen_flask_relabel xen_fla
 struct xen_flask_devicetree_label {
     /* IN */
     uint32_t sid;
-    uint32_t length;
+    uint32_t length; /* length of the path, including nul terminator */
     XEN_GUEST_HANDLE(char) path;
 };
 typedef struct xen_flask_devicetree_label xen_flask_devicetree_label_t;


